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

    public static class RptData
    {
        //逻辑_报表_报表数据_查询报表产品信息
        public static List<FuncrptL_2_2Model> GetFuncrptL_2_2Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_2_2Models = new List<FuncrptL_2_2Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_2_2Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
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
                reqCommand.pd_status = packer.GetStrbyName("pd_status", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
                reqCommand.cost_calc_type = packer.GetIntbyName("cost_calc_type", i);
                reqCommand.risk_free_interest_rate = packer.GetDoublebyName("risk_free_interest_rate", i);
                reqCommand.allow_exch = packer.GetStrbyName("allow_exch", i);
                reqCommand.borker_no = packer.GetIntbyName("borker_no", i);
                reqCommand.borker_name = packer.GetStrbyName("borker_name", i);
                reqCommand.commis_ratio = packer.GetDoublebyName("commis_ratio", i);
                reqCommand.broker_my_type = packer.GetIntbyName("broker_my_type", i);
 
                FuncrptL_2_2Models.Add(reqCommand);
            }
            return FuncrptL_2_2Models;
        }
 
        //逻辑_报表_报表数据_查询报表产品信息
        public static List<FuncrptL_2_2Model> GetFuncrptL_2_2Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_2_2Models = new List<FuncrptL_2_2Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_2_2Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
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
                    reqCommand.pd_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_STATUS_STR);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    reqCommand.cost_calc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COST_CALC_TYPE_INT);
                    reqCommand.risk_free_interest_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RISK_FREE_INTEREST_RATE_FLOAT);
                    reqCommand.allow_exch = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_EXCH_STR);
                    reqCommand.borker_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BORKER_NO_INT);
                    reqCommand.borker_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BORKER_NAME_STR);
                    reqCommand.commis_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMMIS_RATIO_FLOAT);
                    reqCommand.broker_my_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BROKER_MY_TYPE_INT);
                    FuncrptL_2_2Models.Add(reqCommand);
                }
            }
            return FuncrptL_2_2Models;
        }
 
        //逻辑_报表_报表数据_查询行业类别表
        public static List<FuncrptL_2_21Model> GetFuncrptL_2_21Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_2_21Models = new List<FuncrptL_2_21Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_2_21Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.industry_id = packer.GetIntbyName("industry_id", i);
                reqCommand.industry_code = packer.GetStrbyName("industry_code", i);
                reqCommand.indu_name = packer.GetStrbyName("indu_name", i);
                reqCommand.industry_classification = packer.GetIntbyName("industry_classification", i);
                reqCommand.parent_industry_id = packer.GetIntbyName("parent_industry_id", i);
                reqCommand.industry_std = packer.GetIntbyName("industry_std", i);
                reqCommand.first_indu_code = packer.GetStrbyName("first_indu_code", i);
                reqCommand.first_industry_name = packer.GetStrbyName("first_industry_name", i);
                reqCommand.second_industry_code = packer.GetStrbyName("second_industry_code", i);
                reqCommand.second_industry_name = packer.GetStrbyName("second_industry_name", i);
                reqCommand.third_industry_code = packer.GetStrbyName("third_industry_code", i);
                reqCommand.third_industry_name = packer.GetStrbyName("third_industry_name", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncrptL_2_21Models.Add(reqCommand);
            }
            return FuncrptL_2_21Models;
        }
 
        //逻辑_报表_报表数据_查询行业类别表
        public static List<FuncrptL_2_21Model> GetFuncrptL_2_21Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_2_21Models = new List<FuncrptL_2_21Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_2_21Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.industry_id = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDUSTRY_ID_INT);
                    reqCommand.industry_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_INDUSTRY_CODE_STR);
                    reqCommand.indu_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_INDU_NAME_STR);
                    reqCommand.industry_classification = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDUSTRY_CLASSIFICATION_INT);
                    reqCommand.parent_industry_id = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PARENT_INDUSTRY_ID_INT);
                    reqCommand.industry_std = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDUSTRY_STD_INT);
                    reqCommand.first_indu_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FIRST_INDU_CODE_STR);
                    reqCommand.first_industry_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FIRST_INDUSTRY_NAME_STR);
                    reqCommand.second_industry_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_SECOND_INDUSTRY_CODE_STR);
                    reqCommand.second_industry_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_SECOND_INDUSTRY_NAME_STR);
                    reqCommand.third_industry_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_THIRD_INDUSTRY_CODE_STR);
                    reqCommand.third_industry_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_THIRD_INDUSTRY_NAME_STR);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncrptL_2_21Models.Add(reqCommand);
                }
            }
            return FuncrptL_2_21Models;
        }
 
        //逻辑_报表_报表数据_查询行业证券表
        public static List<FuncrptL_2_22Model> GetFuncrptL_2_22Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_2_22Models = new List<FuncrptL_2_22Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_2_22Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_name = packer.GetStrbyName("stock_name", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.asset_type = packer.GetIntbyName("asset_type", i);
                reqCommand.industry_std = packer.GetIntbyName("industry_std", i);
                reqCommand.industry_id = packer.GetIntbyName("industry_id", i);
                reqCommand.industry_code = packer.GetStrbyName("industry_code", i);
                reqCommand.indu_name = packer.GetStrbyName("indu_name", i);
                reqCommand.first_indu_code = packer.GetStrbyName("first_indu_code", i);
                reqCommand.first_industry_name = packer.GetStrbyName("first_industry_name", i);
                reqCommand.second_industry_code = packer.GetStrbyName("second_industry_code", i);
                reqCommand.second_industry_name = packer.GetStrbyName("second_industry_name", i);
                reqCommand.third_industry_code = packer.GetStrbyName("third_industry_code", i);
                reqCommand.third_industry_name = packer.GetStrbyName("third_industry_name", i);
                reqCommand.fourth_industry_code = packer.GetStrbyName("fourth_industry_code", i);
                reqCommand.fourth_industry_name = packer.GetStrbyName("fourth_industry_name", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncrptL_2_22Models.Add(reqCommand);
            }
            return FuncrptL_2_22Models;
        }
 
        //逻辑_报表_报表数据_查询行业证券表
        public static List<FuncrptL_2_22Model> GetFuncrptL_2_22Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_2_22Models = new List<FuncrptL_2_22Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_2_22Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    reqCommand.industry_std = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDUSTRY_STD_INT);
                    reqCommand.industry_id = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDUSTRY_ID_INT);
                    reqCommand.industry_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_INDUSTRY_CODE_STR);
                    reqCommand.indu_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_INDU_NAME_STR);
                    reqCommand.first_indu_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FIRST_INDU_CODE_STR);
                    reqCommand.first_industry_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FIRST_INDUSTRY_NAME_STR);
                    reqCommand.second_industry_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_SECOND_INDUSTRY_CODE_STR);
                    reqCommand.second_industry_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_SECOND_INDUSTRY_NAME_STR);
                    reqCommand.third_industry_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_THIRD_INDUSTRY_CODE_STR);
                    reqCommand.third_industry_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_THIRD_INDUSTRY_NAME_STR);
                    reqCommand.fourth_industry_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FOURTH_INDUSTRY_CODE_STR);
                    reqCommand.fourth_industry_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FOURTH_INDUSTRY_NAME_STR);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncrptL_2_22Models.Add(reqCommand);
                }
            }
            return FuncrptL_2_22Models;
        }
 
        //逻辑_报表_报表数据_初始化产品初始化定时任务
        public static List<FuncrptL_2_50Model> GetFuncrptL_2_50Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_2_50Models = new List<FuncrptL_2_50Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_2_50Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.task_strike_status = packer.GetStrbyName("task_strike_status", i);
 
                FuncrptL_2_50Models.Add(reqCommand);
            }
            return FuncrptL_2_50Models;
        }
 
        //逻辑_报表_报表数据_初始化产品初始化定时任务
        public static List<FuncrptL_2_50Model> GetFuncrptL_2_50Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_2_50Models = new List<FuncrptL_2_50Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncrptL_2_50Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.task_strike_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STRIKE_STATUS_STR);
                FuncrptL_2_50Models.Add(reqCommand);
            }
            return FuncrptL_2_50Models;
        }
 
        //逻辑_报表_报表数据_查询机构自定义资产类型
        public static List<FuncrptL_2_61Model> GetFuncrptL_2_61Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_2_61Models = new List<FuncrptL_2_61Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_2_61Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.def_asset_type = packer.GetIntbyName("def_asset_type", i);
                reqCommand.def_asset_type_no = packer.GetStrbyName("def_asset_type_no", i);
                reqCommand.def_asset_name = packer.GetStrbyName("def_asset_name", i);
                reqCommand.parent_def_asset_type = packer.GetIntbyName("parent_def_asset_type", i);
                reqCommand.def_type = packer.GetIntbyName("def_type", i);
                reqCommand.show_order = packer.GetIntbyName("show_order", i);
                reqCommand.calc_type = packer.GetIntbyName("calc_type", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncrptL_2_61Models.Add(reqCommand);
            }
            return FuncrptL_2_61Models;
        }
 
        //逻辑_报表_报表数据_查询机构自定义资产类型
        public static List<FuncrptL_2_61Model> GetFuncrptL_2_61Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_2_61Models = new List<FuncrptL_2_61Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_2_61Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.def_asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEF_ASSET_TYPE_INT);
                    reqCommand.def_asset_type_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DEF_ASSET_TYPE_NO_STR);
                    reqCommand.def_asset_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DEF_ASSET_NAME_STR);
                    reqCommand.parent_def_asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PARENT_DEF_ASSET_TYPE_INT);
                    reqCommand.def_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEF_TYPE_INT);
                    reqCommand.show_order = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SHOW_ORDER_INT);
                    reqCommand.calc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CALC_TYPE_INT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncrptL_2_61Models.Add(reqCommand);
                }
            }
            return FuncrptL_2_61Models;
        }
 
        //逻辑_报表_报表数据_查询产品自定义资产
        public static List<FuncrptL_2_63Model> GetFuncrptL_2_63Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_2_63Models = new List<FuncrptL_2_63Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_2_63Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.def_asset_type = packer.GetIntbyName("def_asset_type", i);
                reqCommand.def_asset_name = packer.GetStrbyName("def_asset_name", i);
                reqCommand.def_asset_field = packer.GetIntbyName("def_asset_field", i);
                reqCommand.asset_value = packer.GetDoublebyName("asset_value", i);
 
                FuncrptL_2_63Models.Add(reqCommand);
            }
            return FuncrptL_2_63Models;
        }
 
        //逻辑_报表_报表数据_查询产品自定义资产
        public static List<FuncrptL_2_63Model> GetFuncrptL_2_63Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_2_63Models = new List<FuncrptL_2_63Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_2_63Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.def_asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEF_ASSET_TYPE_INT);
                    reqCommand.def_asset_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DEF_ASSET_NAME_STR);
                    reqCommand.def_asset_field = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEF_ASSET_FIELD_INT);
                    reqCommand.asset_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_VALUE_FLOAT);
                    FuncrptL_2_63Models.Add(reqCommand);
                }
            }
            return FuncrptL_2_63Models;
        }
 
        //逻辑_报表_报表数据_查询机构自定义资产字段列表
        public static List<FuncrptL_2_66Model> GetFuncrptL_2_66Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_2_66Models = new List<FuncrptL_2_66Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_2_66Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.pd_code = packer.GetStrbyName("pd_code", i);
                reqCommand.pd_name = packer.GetStrbyName("pd_name", i);
                reqCommand.dbgrid_x_field = packer.GetStrbyName("dbgrid_x_field", i);
                reqCommand.dbgrid_x_field_no = packer.GetIntbyName("dbgrid_x_field_no", i);
                reqCommand.dbgrid_x_field_name = packer.GetStrbyName("dbgrid_x_field_name", i);
                reqCommand.def_type = packer.GetIntbyName("def_type", i);
 
                FuncrptL_2_66Models.Add(reqCommand);
            }
            return FuncrptL_2_66Models;
        }
 
        //逻辑_报表_报表数据_查询机构自定义资产字段列表
        public static List<FuncrptL_2_66Model> GetFuncrptL_2_66Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_2_66Models = new List<FuncrptL_2_66Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_2_66Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    reqCommand.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    reqCommand.dbgrid_x_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DBGRID_X_FIELD_STR);
                    reqCommand.dbgrid_x_field_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DBGRID_X_FIELD_NO_INT);
                    reqCommand.dbgrid_x_field_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DBGRID_X_FIELD_NAME_STR);
                    reqCommand.def_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEF_TYPE_INT);
                    FuncrptL_2_66Models.Add(reqCommand);
                }
            }
            return FuncrptL_2_66Models;
        }
 
        //逻辑_报表_报表数据_查询调用命令表
        public static List<FuncrptL_2_68Model> GetFuncrptL_2_68Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_2_68Models = new List<FuncrptL_2_68Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_2_68Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.ip_addr = packer.GetStrbyName("ip_addr", i);
                reqCommand.ip_port = packer.GetStrbyName("ip_port", i);
                reqCommand.user_name = packer.GetStrbyName("user_name", i);
                reqCommand.user_password = packer.GetStrbyName("user_password", i);
                reqCommand.cmd_id = packer.GetIntbyName("cmd_id", i);
                reqCommand.cmd_type = packer.GetIntbyName("cmd_type", i);
                reqCommand.cmd_content = packer.GetStrbyName("cmd_content", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncrptL_2_68Models.Add(reqCommand);
            }
            return FuncrptL_2_68Models;
        }
 
        //逻辑_报表_报表数据_查询调用命令表
        public static List<FuncrptL_2_68Model> GetFuncrptL_2_68Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_2_68Models = new List<FuncrptL_2_68Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_2_68Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_IP_ADDR_STR);
                    reqCommand.ip_port = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_IP_PORT_STR);
                    reqCommand.user_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_USER_NAME_STR);
                    reqCommand.user_password = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_USER_PASSWORD_STR);
                    reqCommand.cmd_id = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CMD_ID_INT);
                    reqCommand.cmd_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CMD_TYPE_INT);
                    reqCommand.cmd_content = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CMD_CONTENT_STR);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncrptL_2_68Models.Add(reqCommand);
                }
            }
            return FuncrptL_2_68Models;
        }
 
        //逻辑_报表_报表数据_查询同步状态表
        public static List<FuncrptL_2_69Model> GetFuncrptL_2_69Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_2_69Models = new List<FuncrptL_2_69Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_2_69Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.sync_no = packer.GetIntbyName("sync_no", i);
                reqCommand.sync_name = packer.GetStrbyName("sync_name", i);
                reqCommand.target_db_name = packer.GetStrbyName("target_db_name", i);
                reqCommand.target_table_name = packer.GetStrbyName("target_table_name", i);
                reqCommand.source_db_name = packer.GetStrbyName("source_db_name", i);
                reqCommand.source_table_name = packer.GetStrbyName("source_table_name", i);
                reqCommand.src_last_update_time = packer.GetStrbyName("src_last_update_time", i);
                reqCommand.src_max_updatetimes = packer.GetIntbyName("src_max_updatetimes", i);
                reqCommand.src_table_rows = packer.GetIntbyName("src_table_rows", i);
                reqCommand.tgt_last_update_time = packer.GetStrbyName("tgt_last_update_time", i);
                reqCommand.tgt_max_updatetimes = packer.GetIntbyName("tgt_max_updatetimes", i);
                reqCommand.tgt_table_rows = packer.GetIntbyName("tgt_table_rows", i);
                reqCommand.sync_type = packer.GetIntbyName("sync_type", i);
                reqCommand.sync_status = packer.GetIntbyName("sync_status", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
                reqCommand.begin_date = packer.GetIntbyName("begin_date", i);
                reqCommand.begin_time = packer.GetIntbyName("begin_time", i);
                reqCommand.end_date = packer.GetIntbyName("end_date", i);
                reqCommand.end_time = packer.GetIntbyName("end_time", i);
                reqCommand.deal_count = packer.GetIntbyName("deal_count", i);
 
                FuncrptL_2_69Models.Add(reqCommand);
            }
            return FuncrptL_2_69Models;
        }
 
        //逻辑_报表_报表数据_查询同步状态表
        public static List<FuncrptL_2_69Model> GetFuncrptL_2_69Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_2_69Models = new List<FuncrptL_2_69Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_2_69Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.sync_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SYNC_NO_INT);
                    reqCommand.sync_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_SYNC_NAME_STR);
                    reqCommand.target_db_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_DB_NAME_STR);
                    reqCommand.target_table_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_TABLE_NAME_STR);
                    reqCommand.source_db_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_SOURCE_DB_NAME_STR);
                    reqCommand.source_table_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_SOURCE_TABLE_NAME_STR);
                    reqCommand.src_last_update_time = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_SRC_LAST_UPDATE_TIME_STR);
                    reqCommand.src_max_updatetimes = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SRC_MAX_UPDATETIMES_INT);
                    reqCommand.src_table_rows = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SRC_TABLE_ROWS_INT);
                    reqCommand.tgt_last_update_time = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TGT_LAST_UPDATE_TIME_STR);
                    reqCommand.tgt_max_updatetimes = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TGT_MAX_UPDATETIMES_INT);
                    reqCommand.tgt_table_rows = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TGT_TABLE_ROWS_INT);
                    reqCommand.sync_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SYNC_TYPE_INT);
                    reqCommand.sync_status = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SYNC_STATUS_INT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    reqCommand.begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT);
                    reqCommand.begin_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TIME_INT);
                    reqCommand.end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT);
                    reqCommand.end_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_TIME_INT);
                    reqCommand.deal_count = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_COUNT_INT);
                    FuncrptL_2_69Models.Add(reqCommand);
                }
            }
            return FuncrptL_2_69Models;
        }
 
        //逻辑_报表_报表数据_查询产品区间统计
        public static List<FuncrptL_2_151Model> GetFuncrptL_2_151Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_2_151Models = new List<FuncrptL_2_151Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_2_151Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.curr_month = packer.GetIntbyName("curr_month", i);
                reqCommand.region_type = packer.GetIntbyName("region_type", i);
                reqCommand.region_type_name = packer.GetStrbyName("region_type_name", i);
                reqCommand.begin_date = packer.GetIntbyName("begin_date", i);
                reqCommand.end_date = packer.GetIntbyName("end_date", i);
                reqCommand.stat_days = packer.GetIntbyName("stat_days", i);
                reqCommand.rise_days = packer.GetIntbyName("rise_days", i);
                reqCommand.fall_days = packer.GetIntbyName("fall_days", i);
                reqCommand.max_cont_rise_days = packer.GetIntbyName("max_cont_rise_days", i);
                reqCommand.max_cont_fall_days = packer.GetIntbyName("max_cont_fall_days", i);
                reqCommand.day_win_ratio = packer.GetDoublebyName("day_win_ratio", i);
                reqCommand.week_cnt = packer.GetIntbyName("week_cnt", i);
                reqCommand.rise_weeks = packer.GetIntbyName("rise_weeks", i);
                reqCommand.fall_weeks = packer.GetIntbyName("fall_weeks", i);
                reqCommand.week_win_ratio = packer.GetDoublebyName("week_win_ratio", i);
                reqCommand.begin_share_net_total = packer.GetDoublebyName("begin_share_net_total", i);
                reqCommand.end_share_net_total = packer.GetDoublebyName("end_share_net_total", i);
 
                FuncrptL_2_151Models.Add(reqCommand);
            }
            return FuncrptL_2_151Models;
        }
 
        //逻辑_报表_报表数据_查询产品区间统计
        public static List<FuncrptL_2_151Model> GetFuncrptL_2_151Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_2_151Models = new List<FuncrptL_2_151Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_2_151Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.curr_month = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONTH_INT);
                    reqCommand.region_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REGION_TYPE_INT);
                    reqCommand.region_type_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REGION_TYPE_NAME_STR);
                    reqCommand.begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT);
                    reqCommand.end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT);
                    reqCommand.stat_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STAT_DAYS_INT);
                    reqCommand.rise_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISE_DAYS_INT);
                    reqCommand.fall_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FALL_DAYS_INT);
                    reqCommand.max_cont_rise_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MAX_CONT_RISE_DAYS_INT);
                    reqCommand.max_cont_fall_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MAX_CONT_FALL_DAYS_INT);
                    reqCommand.day_win_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DAY_WIN_RATIO_FLOAT);
                    reqCommand.week_cnt = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WEEK_CNT_INT);
                    reqCommand.rise_weeks = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISE_WEEKS_INT);
                    reqCommand.fall_weeks = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FALL_WEEKS_INT);
                    reqCommand.week_win_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WEEK_WIN_RATIO_FLOAT);
                    reqCommand.begin_share_net_total = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_SHARE_NET_TOTAL_FLOAT);
                    reqCommand.end_share_net_total = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_END_SHARE_NET_TOTAL_FLOAT);
                    FuncrptL_2_151Models.Add(reqCommand);
                }
            }
            return FuncrptL_2_151Models;
        }
 
        //逻辑_报表_报表数据_查询产品指数区间统计
        public static List<FuncrptL_2_153Model> GetFuncrptL_2_153Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_2_153Models = new List<FuncrptL_2_153Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_2_153Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.curr_month = packer.GetIntbyName("curr_month", i);
                reqCommand.region_type = packer.GetIntbyName("region_type", i);
                reqCommand.region_type_name = packer.GetStrbyName("region_type_name", i);
                reqCommand.begin_date = packer.GetIntbyName("begin_date", i);
                reqCommand.end_date = packer.GetIntbyName("end_date", i);
                reqCommand.stat_days = packer.GetIntbyName("stat_days", i);
                reqCommand.rise_days = packer.GetIntbyName("rise_days", i);
                reqCommand.fall_days = packer.GetIntbyName("fall_days", i);
                reqCommand.max_cont_rise_days = packer.GetIntbyName("max_cont_rise_days", i);
                reqCommand.max_cont_fall_days = packer.GetIntbyName("max_cont_fall_days", i);
                reqCommand.day_win_ratio = packer.GetDoublebyName("day_win_ratio", i);
                reqCommand.week_cnt = packer.GetIntbyName("week_cnt", i);
                reqCommand.rise_weeks = packer.GetIntbyName("rise_weeks", i);
                reqCommand.fall_weeks = packer.GetIntbyName("fall_weeks", i);
                reqCommand.week_win_ratio = packer.GetDoublebyName("week_win_ratio", i);
                reqCommand.begin_share_net_total = packer.GetDoublebyName("begin_share_net_total", i);
                reqCommand.end_share_net_total = packer.GetDoublebyName("end_share_net_total", i);
 
                FuncrptL_2_153Models.Add(reqCommand);
            }
            return FuncrptL_2_153Models;
        }
 
        //逻辑_报表_报表数据_查询产品指数区间统计
        public static List<FuncrptL_2_153Model> GetFuncrptL_2_153Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_2_153Models = new List<FuncrptL_2_153Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_2_153Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.curr_month = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONTH_INT);
                    reqCommand.region_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REGION_TYPE_INT);
                    reqCommand.region_type_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REGION_TYPE_NAME_STR);
                    reqCommand.begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT);
                    reqCommand.end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT);
                    reqCommand.stat_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STAT_DAYS_INT);
                    reqCommand.rise_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISE_DAYS_INT);
                    reqCommand.fall_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FALL_DAYS_INT);
                    reqCommand.max_cont_rise_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MAX_CONT_RISE_DAYS_INT);
                    reqCommand.max_cont_fall_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MAX_CONT_FALL_DAYS_INT);
                    reqCommand.day_win_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DAY_WIN_RATIO_FLOAT);
                    reqCommand.week_cnt = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WEEK_CNT_INT);
                    reqCommand.rise_weeks = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISE_WEEKS_INT);
                    reqCommand.fall_weeks = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FALL_WEEKS_INT);
                    reqCommand.week_win_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WEEK_WIN_RATIO_FLOAT);
                    reqCommand.begin_share_net_total = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_SHARE_NET_TOTAL_FLOAT);
                    reqCommand.end_share_net_total = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_END_SHARE_NET_TOTAL_FLOAT);
                    FuncrptL_2_153Models.Add(reqCommand);
                }
            }
            return FuncrptL_2_153Models;
        }
 
        //逻辑_报表_报表数据_查询产品区间指标
        public static List<FuncrptL_2_154Model> GetFuncrptL_2_154Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_2_154Models = new List<FuncrptL_2_154Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_2_154Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.curr_month = packer.GetIntbyName("curr_month", i);
                reqCommand.region_type = packer.GetIntbyName("region_type", i);
                reqCommand.region_type_name = packer.GetStrbyName("region_type_name", i);
                reqCommand.begin_date = packer.GetIntbyName("begin_date", i);
                reqCommand.end_date = packer.GetIntbyName("end_date", i);
                reqCommand.indicator_id = packer.GetIntbyName("indicator_id", i);
                reqCommand.indicator_name = packer.GetStrbyName("indicator_name", i);
                reqCommand.indicator_value = packer.GetDoublebyName("indicator_value", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncrptL_2_154Models.Add(reqCommand);
            }
            return FuncrptL_2_154Models;
        }
 
        //逻辑_报表_报表数据_查询产品区间指标
        public static List<FuncrptL_2_154Model> GetFuncrptL_2_154Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_2_154Models = new List<FuncrptL_2_154Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_2_154Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.curr_month = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONTH_INT);
                    reqCommand.region_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REGION_TYPE_INT);
                    reqCommand.region_type_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REGION_TYPE_NAME_STR);
                    reqCommand.begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT);
                    reqCommand.end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT);
                    reqCommand.indicator_id = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDICATOR_ID_INT);
                    reqCommand.indicator_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_INDICATOR_NAME_STR);
                    reqCommand.indicator_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INDICATOR_VALUE_FLOAT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncrptL_2_154Models.Add(reqCommand);
                }
            }
            return FuncrptL_2_154Models;
        }
 
        //逻辑_报表_报表数据_查询产品业绩基准区间指标
        public static List<FuncrptL_2_156Model> GetFuncrptL_2_156Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_2_156Models = new List<FuncrptL_2_156Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_2_156Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.curr_month = packer.GetIntbyName("curr_month", i);
                reqCommand.region_type = packer.GetIntbyName("region_type", i);
                reqCommand.region_type_name = packer.GetStrbyName("region_type_name", i);
                reqCommand.begin_date = packer.GetIntbyName("begin_date", i);
                reqCommand.end_date = packer.GetIntbyName("end_date", i);
                reqCommand.indicator_id = packer.GetIntbyName("indicator_id", i);
                reqCommand.indicator_name = packer.GetStrbyName("indicator_name", i);
                reqCommand.indicator_value = packer.GetDoublebyName("indicator_value", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
                reqCommand.achi_compa_crite = packer.GetIntbyName("achi_compa_crite", i);
                reqCommand.achi_crite_value = packer.GetDoublebyName("achi_crite_value", i);
                reqCommand.cmp_value = packer.GetDoublebyName("cmp_value", i);
                reqCommand.indicator_memo = packer.GetStrbyName("indicator_memo", i);
 
                FuncrptL_2_156Models.Add(reqCommand);
            }
            return FuncrptL_2_156Models;
        }
 
        //逻辑_报表_报表数据_查询产品业绩基准区间指标
        public static List<FuncrptL_2_156Model> GetFuncrptL_2_156Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_2_156Models = new List<FuncrptL_2_156Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_2_156Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.curr_month = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONTH_INT);
                    reqCommand.region_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REGION_TYPE_INT);
                    reqCommand.region_type_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REGION_TYPE_NAME_STR);
                    reqCommand.begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT);
                    reqCommand.end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT);
                    reqCommand.indicator_id = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDICATOR_ID_INT);
                    reqCommand.indicator_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_INDICATOR_NAME_STR);
                    reqCommand.indicator_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INDICATOR_VALUE_FLOAT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    reqCommand.achi_compa_crite = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ACHI_COMPA_CRITE_INT);
                    reqCommand.achi_crite_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACHI_CRITE_VALUE_FLOAT);
                    reqCommand.cmp_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CMP_VALUE_FLOAT);
                    reqCommand.indicator_memo = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_INDICATOR_MEMO_STR);
                    FuncrptL_2_156Models.Add(reqCommand);
                }
            }
            return FuncrptL_2_156Models;
        }
 
        //逻辑_报表_报表数据_查询产品日净值
        public static List<FuncrptL_2_160Model> GetFuncrptL_2_160Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_2_160Models = new List<FuncrptL_2_160Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_2_160Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.share_net = packer.GetDoublebyName("share_net", i);
                reqCommand.last_share_net = packer.GetDoublebyName("last_share_net", i);
                reqCommand.share_net_total = packer.GetDoublebyName("share_net_total", i);
                reqCommand.pre_share_net_total = packer.GetDoublebyName("pre_share_net_total", i);
                reqCommand.net_change = packer.GetDoublebyName("net_change", i);
                reqCommand.net_growth_rate = packer.GetDoublebyName("net_growth_rate", i);
                reqCommand.grp_row = packer.GetInt64byName("grp_row", i);
                reqCommand.nav_asset = packer.GetDoublebyName("nav_asset", i);
                reqCommand.asset_market_value = packer.GetDoublebyName("asset_market_value", i);
                reqCommand.fund_share_total = packer.GetDoublebyName("fund_share_total", i);
                reqCommand.fund_asset_net = packer.GetDoublebyName("fund_asset_net", i);
                reqCommand.pd_nav_day_ratio = packer.GetDoublebyName("pd_nav_day_ratio", i);
                reqCommand.pd_nav_month_ratio = packer.GetDoublebyName("pd_nav_month_ratio", i);
                reqCommand.total_realiz_pandl_ratio = packer.GetDoublebyName("total_realiz_pandl_ratio", i);
                reqCommand.pre_fee_share_net_total = packer.GetDoublebyName("pre_fee_share_net_total", i);
                reqCommand.post_fee_share_net_total = packer.GetDoublebyName("post_fee_share_net_total", i);
                reqCommand.achieve_performance = packer.GetDoublebyName("achieve_performance", i);
                reqCommand.recover_param = packer.GetDoublebyName("recover_param", i);
                reqCommand.last_init_date = packer.GetIntbyName("last_init_date", i);
 
                FuncrptL_2_160Models.Add(reqCommand);
            }
            return FuncrptL_2_160Models;
        }
 
        //逻辑_报表_报表数据_查询产品日净值
        public static List<FuncrptL_2_160Model> GetFuncrptL_2_160Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_2_160Models = new List<FuncrptL_2_160Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_2_160Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.share_net = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SHARE_NET_FLOAT);
                    reqCommand.last_share_net = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_SHARE_NET_FLOAT);
                    reqCommand.share_net_total = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SHARE_NET_TOTAL_FLOAT);
                    reqCommand.pre_share_net_total = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SHARE_NET_TOTAL_FLOAT);
                    reqCommand.net_change = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NET_CHANGE_FLOAT);
                    reqCommand.net_growth_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NET_GROWTH_RATE_FLOAT);
                    reqCommand.grp_row = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_GRP_ROW_INT64);
                    reqCommand.nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT);
                    reqCommand.asset_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_MARKET_VALUE_FLOAT);
                    reqCommand.fund_share_total = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_SHARE_TOTAL_FLOAT);
                    reqCommand.fund_asset_net = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_ASSET_NET_FLOAT);
                    reqCommand.pd_nav_day_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAV_DAY_RATIO_FLOAT);
                    reqCommand.pd_nav_month_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAV_MONTH_RATIO_FLOAT);
                    reqCommand.total_realiz_pandl_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_REALIZ_PANDL_RATIO_FLOAT);
                    reqCommand.pre_fee_share_net_total = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_FEE_SHARE_NET_TOTAL_FLOAT);
                    reqCommand.post_fee_share_net_total = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POST_FEE_SHARE_NET_TOTAL_FLOAT);
                    reqCommand.achieve_performance = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACHIEVE_PERFORMANCE_FLOAT);
                    reqCommand.recover_param = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RECOVER_PARAM_FLOAT);
                    reqCommand.last_init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LAST_INIT_DATE_INT);
                    FuncrptL_2_160Models.Add(reqCommand);
                }
            }
            return FuncrptL_2_160Models;
        }
 
        //逻辑_报表_报表数据_查询产品日收益率
        public static List<FuncrptL_2_181Model> GetFuncrptL_2_181Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_2_181Models = new List<FuncrptL_2_181Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_2_181Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.share_net = packer.GetDoublebyName("share_net", i);
                reqCommand.last_share_net = packer.GetDoublebyName("last_share_net", i);
                reqCommand.share_net_total = packer.GetDoublebyName("share_net_total", i);
                reqCommand.pre_share_net_total = packer.GetDoublebyName("pre_share_net_total", i);
                reqCommand.net_change = packer.GetDoublebyName("net_change", i);
                reqCommand.net_growth_rate = packer.GetDoublebyName("net_growth_rate", i);
                reqCommand.grp_row = packer.GetInt64byName("grp_row", i);
                reqCommand.asset_market_value = packer.GetDoublebyName("asset_market_value", i);
                reqCommand.fund_share_total = packer.GetDoublebyName("fund_share_total", i);
                reqCommand.fund_asset_net = packer.GetDoublebyName("fund_asset_net", i);
                reqCommand.pd_nav_day_ratio = packer.GetDoublebyName("pd_nav_day_ratio", i);
                reqCommand.pd_nav_month_ratio = packer.GetDoublebyName("pd_nav_month_ratio", i);
                reqCommand.total_realiz_pandl_ratio = packer.GetDoublebyName("total_realiz_pandl_ratio", i);
                reqCommand.pre_fee_share_net_total = packer.GetDoublebyName("pre_fee_share_net_total", i);
                reqCommand.post_fee_share_net_total = packer.GetDoublebyName("post_fee_share_net_total", i);
 
                FuncrptL_2_181Models.Add(reqCommand);
            }
            return FuncrptL_2_181Models;
        }
 
        //逻辑_报表_报表数据_查询产品日收益率
        public static List<FuncrptL_2_181Model> GetFuncrptL_2_181Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_2_181Models = new List<FuncrptL_2_181Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_2_181Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.share_net = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SHARE_NET_FLOAT);
                    reqCommand.last_share_net = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_SHARE_NET_FLOAT);
                    reqCommand.share_net_total = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SHARE_NET_TOTAL_FLOAT);
                    reqCommand.pre_share_net_total = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SHARE_NET_TOTAL_FLOAT);
                    reqCommand.net_change = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NET_CHANGE_FLOAT);
                    reqCommand.net_growth_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NET_GROWTH_RATE_FLOAT);
                    reqCommand.grp_row = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_GRP_ROW_INT64);
                    reqCommand.asset_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_MARKET_VALUE_FLOAT);
                    reqCommand.fund_share_total = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_SHARE_TOTAL_FLOAT);
                    reqCommand.fund_asset_net = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_ASSET_NET_FLOAT);
                    reqCommand.pd_nav_day_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAV_DAY_RATIO_FLOAT);
                    reqCommand.pd_nav_month_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAV_MONTH_RATIO_FLOAT);
                    reqCommand.total_realiz_pandl_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_REALIZ_PANDL_RATIO_FLOAT);
                    reqCommand.pre_fee_share_net_total = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_FEE_SHARE_NET_TOTAL_FLOAT);
                    reqCommand.post_fee_share_net_total = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POST_FEE_SHARE_NET_TOTAL_FLOAT);
                    FuncrptL_2_181Models.Add(reqCommand);
                }
            }
            return FuncrptL_2_181Models;
        }
 
        //逻辑_报表_报表数据_查询指数日收益率
        public static List<FuncrptL_2_182Model> GetFuncrptL_2_182Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_2_182Models = new List<FuncrptL_2_182Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_2_182Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_name = packer.GetStrbyName("stock_name", i);
                reqCommand.today_close_price = packer.GetDoublebyName("today_close_price", i);
                reqCommand.pre_close_price = packer.GetDoublebyName("pre_close_price", i);
                reqCommand.price_change = packer.GetDoublebyName("price_change", i);
                reqCommand.price_growth_rate = packer.GetDoublebyName("price_growth_rate", i);
                reqCommand.grp_row = packer.GetInt64byName("grp_row", i);
 
                FuncrptL_2_182Models.Add(reqCommand);
            }
            return FuncrptL_2_182Models;
        }
 
        //逻辑_报表_报表数据_查询指数日收益率
        public static List<FuncrptL_2_182Model> GetFuncrptL_2_182Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_2_182Models = new List<FuncrptL_2_182Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_2_182Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    reqCommand.today_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_CLOSE_PRICE_FLOAT);
                    reqCommand.pre_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_CLOSE_PRICE_FLOAT);
                    reqCommand.price_change = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_CHANGE_FLOAT);
                    reqCommand.price_growth_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_GROWTH_RATE_FLOAT);
                    reqCommand.grp_row = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_GRP_ROW_INT64);
                    FuncrptL_2_182Models.Add(reqCommand);
                }
            }
            return FuncrptL_2_182Models;
        }
 
        //逻辑_报表_报表数据_查询产品周收益率
        public static List<FuncrptL_2_183Model> GetFuncrptL_2_183Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_2_183Models = new List<FuncrptL_2_183Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_2_183Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.curr_year = packer.GetIntbyName("curr_year", i);
                reqCommand.week_no = packer.GetIntbyName("week_no", i);
                reqCommand.share_net = packer.GetDoublebyName("share_net", i);
                reqCommand.share_net_total = packer.GetDoublebyName("share_net_total", i);
                reqCommand.pre_share_net_total = packer.GetDoublebyName("pre_share_net_total", i);
                reqCommand.net_change = packer.GetDoublebyName("net_change", i);
                reqCommand.net_growth_rate = packer.GetDoublebyName("net_growth_rate", i);
                reqCommand.stat_days = packer.GetIntbyName("stat_days", i);
                reqCommand.begin_date = packer.GetIntbyName("begin_date", i);
                reqCommand.end_date = packer.GetIntbyName("end_date", i);
                reqCommand.grp_row = packer.GetInt64byName("grp_row", i);
                reqCommand.pre_fee_share_net_total = packer.GetDoublebyName("pre_fee_share_net_total", i);
                reqCommand.post_fee_share_net_total = packer.GetDoublebyName("post_fee_share_net_total", i);
 
                FuncrptL_2_183Models.Add(reqCommand);
            }
            return FuncrptL_2_183Models;
        }
 
        //逻辑_报表_报表数据_查询产品周收益率
        public static List<FuncrptL_2_183Model> GetFuncrptL_2_183Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_2_183Models = new List<FuncrptL_2_183Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_2_183Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.curr_year = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CURR_YEAR_INT);
                    reqCommand.week_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WEEK_NO_INT);
                    reqCommand.share_net = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SHARE_NET_FLOAT);
                    reqCommand.share_net_total = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SHARE_NET_TOTAL_FLOAT);
                    reqCommand.pre_share_net_total = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SHARE_NET_TOTAL_FLOAT);
                    reqCommand.net_change = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NET_CHANGE_FLOAT);
                    reqCommand.net_growth_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NET_GROWTH_RATE_FLOAT);
                    reqCommand.stat_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STAT_DAYS_INT);
                    reqCommand.begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT);
                    reqCommand.end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT);
                    reqCommand.grp_row = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_GRP_ROW_INT64);
                    reqCommand.pre_fee_share_net_total = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_FEE_SHARE_NET_TOTAL_FLOAT);
                    reqCommand.post_fee_share_net_total = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POST_FEE_SHARE_NET_TOTAL_FLOAT);
                    FuncrptL_2_183Models.Add(reqCommand);
                }
            }
            return FuncrptL_2_183Models;
        }
 
        //逻辑_报表_报表数据_查询指数周收益率
        public static List<FuncrptL_2_184Model> GetFuncrptL_2_184Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_2_184Models = new List<FuncrptL_2_184Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_2_184Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_name = packer.GetStrbyName("stock_name", i);
                reqCommand.curr_year = packer.GetIntbyName("curr_year", i);
                reqCommand.week_no = packer.GetIntbyName("week_no", i);
                reqCommand.today_close_price = packer.GetDoublebyName("today_close_price", i);
                reqCommand.pre_close_price = packer.GetDoublebyName("pre_close_price", i);
                reqCommand.price_change = packer.GetDoublebyName("price_change", i);
                reqCommand.price_growth_rate = packer.GetDoublebyName("price_growth_rate", i);
                reqCommand.begin_date = packer.GetIntbyName("begin_date", i);
                reqCommand.end_date = packer.GetIntbyName("end_date", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
                reqCommand.grp_row = packer.GetInt64byName("grp_row", i);
 
                FuncrptL_2_184Models.Add(reqCommand);
            }
            return FuncrptL_2_184Models;
        }
 
        //逻辑_报表_报表数据_查询指数周收益率
        public static List<FuncrptL_2_184Model> GetFuncrptL_2_184Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_2_184Models = new List<FuncrptL_2_184Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_2_184Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    reqCommand.curr_year = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CURR_YEAR_INT);
                    reqCommand.week_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WEEK_NO_INT);
                    reqCommand.today_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_CLOSE_PRICE_FLOAT);
                    reqCommand.pre_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_CLOSE_PRICE_FLOAT);
                    reqCommand.price_change = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_CHANGE_FLOAT);
                    reqCommand.price_growth_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_GROWTH_RATE_FLOAT);
                    reqCommand.begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT);
                    reqCommand.end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    reqCommand.grp_row = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_GRP_ROW_INT64);
                    FuncrptL_2_184Models.Add(reqCommand);
                }
            }
            return FuncrptL_2_184Models;
        }
 
        //逻辑_报表_报表数据_查询产品月收益率
        public static List<FuncrptL_2_185Model> GetFuncrptL_2_185Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_2_185Models = new List<FuncrptL_2_185Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_2_185Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.curr_month = packer.GetIntbyName("curr_month", i);
                reqCommand.share_net = packer.GetDoublebyName("share_net", i);
                reqCommand.share_net_total = packer.GetDoublebyName("share_net_total", i);
                reqCommand.pre_share_net_total = packer.GetDoublebyName("pre_share_net_total", i);
                reqCommand.stat_days = packer.GetIntbyName("stat_days", i);
                reqCommand.rise_days = packer.GetIntbyName("rise_days", i);
                reqCommand.fall_days = packer.GetIntbyName("fall_days", i);
                reqCommand.max_cont_rise_days = packer.GetIntbyName("max_cont_rise_days", i);
                reqCommand.max_cont_fall_days = packer.GetIntbyName("max_cont_fall_days", i);
                reqCommand.net_change = packer.GetDoublebyName("net_change", i);
                reqCommand.net_growth_rate = packer.GetDoublebyName("net_growth_rate", i);
                reqCommand.begin_date = packer.GetIntbyName("begin_date", i);
                reqCommand.end_date = packer.GetIntbyName("end_date", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
                reqCommand.grp_row = packer.GetInt64byName("grp_row", i);
                reqCommand.pre_fee_share_net_total = packer.GetDoublebyName("pre_fee_share_net_total", i);
                reqCommand.post_fee_share_net_total = packer.GetDoublebyName("post_fee_share_net_total", i);
 
                FuncrptL_2_185Models.Add(reqCommand);
            }
            return FuncrptL_2_185Models;
        }
 
        //逻辑_报表_报表数据_查询产品月收益率
        public static List<FuncrptL_2_185Model> GetFuncrptL_2_185Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_2_185Models = new List<FuncrptL_2_185Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_2_185Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.curr_month = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONTH_INT);
                    reqCommand.share_net = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SHARE_NET_FLOAT);
                    reqCommand.share_net_total = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SHARE_NET_TOTAL_FLOAT);
                    reqCommand.pre_share_net_total = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SHARE_NET_TOTAL_FLOAT);
                    reqCommand.stat_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STAT_DAYS_INT);
                    reqCommand.rise_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISE_DAYS_INT);
                    reqCommand.fall_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FALL_DAYS_INT);
                    reqCommand.max_cont_rise_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MAX_CONT_RISE_DAYS_INT);
                    reqCommand.max_cont_fall_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MAX_CONT_FALL_DAYS_INT);
                    reqCommand.net_change = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NET_CHANGE_FLOAT);
                    reqCommand.net_growth_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NET_GROWTH_RATE_FLOAT);
                    reqCommand.begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT);
                    reqCommand.end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    reqCommand.grp_row = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_GRP_ROW_INT64);
                    reqCommand.pre_fee_share_net_total = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_FEE_SHARE_NET_TOTAL_FLOAT);
                    reqCommand.post_fee_share_net_total = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POST_FEE_SHARE_NET_TOTAL_FLOAT);
                    FuncrptL_2_185Models.Add(reqCommand);
                }
            }
            return FuncrptL_2_185Models;
        }
 
        //逻辑_报表_报表数据_查询指数月收益率
        public static List<FuncrptL_2_186Model> GetFuncrptL_2_186Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_2_186Models = new List<FuncrptL_2_186Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_2_186Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_name = packer.GetStrbyName("stock_name", i);
                reqCommand.curr_month = packer.GetIntbyName("curr_month", i);
                reqCommand.today_close_price = packer.GetDoublebyName("today_close_price", i);
                reqCommand.pre_close_price = packer.GetDoublebyName("pre_close_price", i);
                reqCommand.stat_days = packer.GetIntbyName("stat_days", i);
                reqCommand.rise_days = packer.GetIntbyName("rise_days", i);
                reqCommand.fall_days = packer.GetIntbyName("fall_days", i);
                reqCommand.max_cont_rise_days = packer.GetIntbyName("max_cont_rise_days", i);
                reqCommand.max_cont_fall_days = packer.GetIntbyName("max_cont_fall_days", i);
                reqCommand.price_change = packer.GetDoublebyName("price_change", i);
                reqCommand.price_growth_rate = packer.GetDoublebyName("price_growth_rate", i);
                reqCommand.begin_date = packer.GetIntbyName("begin_date", i);
                reqCommand.end_date = packer.GetIntbyName("end_date", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
                reqCommand.grp_row = packer.GetInt64byName("grp_row", i);
 
                FuncrptL_2_186Models.Add(reqCommand);
            }
            return FuncrptL_2_186Models;
        }
 
        //逻辑_报表_报表数据_查询指数月收益率
        public static List<FuncrptL_2_186Model> GetFuncrptL_2_186Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_2_186Models = new List<FuncrptL_2_186Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_2_186Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    reqCommand.curr_month = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONTH_INT);
                    reqCommand.today_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_CLOSE_PRICE_FLOAT);
                    reqCommand.pre_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_CLOSE_PRICE_FLOAT);
                    reqCommand.stat_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STAT_DAYS_INT);
                    reqCommand.rise_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISE_DAYS_INT);
                    reqCommand.fall_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FALL_DAYS_INT);
                    reqCommand.max_cont_rise_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MAX_CONT_RISE_DAYS_INT);
                    reqCommand.max_cont_fall_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MAX_CONT_FALL_DAYS_INT);
                    reqCommand.price_change = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_CHANGE_FLOAT);
                    reqCommand.price_growth_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_GROWTH_RATE_FLOAT);
                    reqCommand.begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT);
                    reqCommand.end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    reqCommand.grp_row = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_GRP_ROW_INT64);
                    FuncrptL_2_186Models.Add(reqCommand);
                }
            }
            return FuncrptL_2_186Models;
        }
 
        //逻辑_报表_报表数据_查询基金经理与交易员关系
        public static List<FuncrptL_2_211Model> GetFuncrptL_2_211Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_2_211Models = new List<FuncrptL_2_211Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_2_211Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.fund_manager_no = packer.GetIntbyName("fund_manager_no", i);
                reqCommand.fund_manager_name = packer.GetStrbyName("fund_manager_name", i);
                reqCommand.trader_no = packer.GetIntbyName("trader_no", i);
                reqCommand.trader_name = packer.GetStrbyName("trader_name", i);
                reqCommand.show_order = packer.GetIntbyName("show_order", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncrptL_2_211Models.Add(reqCommand);
            }
            return FuncrptL_2_211Models;
        }
 
        //逻辑_报表_报表数据_查询基金经理与交易员关系
        public static List<FuncrptL_2_211Model> GetFuncrptL_2_211Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_2_211Models = new List<FuncrptL_2_211Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_2_211Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.fund_manager_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_NO_INT);
                    reqCommand.fund_manager_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_NAME_STR);
                    reqCommand.trader_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRADER_NO_INT);
                    reqCommand.trader_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TRADER_NAME_STR);
                    reqCommand.show_order = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SHOW_ORDER_INT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncrptL_2_211Models.Add(reqCommand);
                }
            }
            return FuncrptL_2_211Models;
        }
 
        //逻辑_报表_报表数据_查询产品资产
        public static List<FuncrptL_2_301Model> GetFuncrptL_2_301Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_2_301Models = new List<FuncrptL_2_301Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_2_301Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.runtime = packer.GetIntbyName("runtime", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.begin_NAV = packer.GetDoublebyName("begin_NAV", i);
                reqCommand.nav_asset = packer.GetDoublebyName("nav_asset", i);
                reqCommand.total_asset = packer.GetDoublebyName("total_asset", i);
                reqCommand.stock_asset = packer.GetDoublebyName("stock_asset", i);
                reqCommand.futu_asset = packer.GetDoublebyName("futu_asset", i);
                reqCommand.option_asset = packer.GetDoublebyName("option_asset", i);
                reqCommand.warrant_asset = packer.GetDoublebyName("warrant_asset", i);
                reqCommand.fund_asset = packer.GetDoublebyName("fund_asset", i);
                reqCommand.cash_asset = packer.GetDoublebyName("cash_asset", i);
                reqCommand.repo_asset = packer.GetDoublebyName("repo_asset", i);
                reqCommand.bond_asset = packer.GetDoublebyName("bond_asset", i);
                reqCommand.other_asset = packer.GetDoublebyName("other_asset", i);
                reqCommand.acco_cash = packer.GetDoublebyName("acco_cash", i);
                reqCommand.cash_bala = packer.GetDoublebyName("cash_bala", i);
                reqCommand.apply_amt = packer.GetDoublebyName("apply_amt", i);
                reqCommand.redemp_amt = packer.GetDoublebyName("redemp_amt", i);
                reqCommand.total_cash_divide = packer.GetDoublebyName("total_cash_divide", i);
                reqCommand.money_fund_asset = packer.GetDoublebyName("money_fund_asset", i);
                reqCommand.unit_nav = packer.GetDoublebyName("unit_nav", i);
                reqCommand.pre_pd_unit_nav = packer.GetDoublebyName("pre_pd_unit_nav", i);
                reqCommand.total_unit_nav = packer.GetDoublebyName("total_unit_nav", i);
                reqCommand.last_week_pd_nav = packer.GetDoublebyName("last_week_pd_nav", i);
                reqCommand.last_month_pd_nav = packer.GetDoublebyName("last_month_pd_nav", i);
                reqCommand.last_quarter_pd_nav = packer.GetDoublebyName("last_quarter_pd_nav", i);
                reqCommand.last_year_pd_nav = packer.GetDoublebyName("last_year_pd_nav", i);
                reqCommand.pd_all_share = packer.GetDoublebyName("pd_all_share", i);
                reqCommand.curr_share = packer.GetDoublebyName("curr_share", i);
                reqCommand.pre_share = packer.GetDoublebyName("pre_share", i);
                reqCommand.total_payab_amt = packer.GetDoublebyName("total_payab_amt", i);
                reqCommand.total_rece_amt = packer.GetDoublebyName("total_rece_amt", i);
                reqCommand.product_unit_nav_ration = packer.GetDoublebyName("product_unit_nav_ration", i);
                reqCommand.buy_amt = packer.GetDoublebyName("buy_amt", i);
                reqCommand.sellout_amt = packer.GetDoublebyName("sellout_amt", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncrptL_2_301Models.Add(reqCommand);
            }
            return FuncrptL_2_301Models;
        }
 
        //逻辑_报表_报表数据_查询产品资产
        public static List<FuncrptL_2_301Model> GetFuncrptL_2_301Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_2_301Models = new List<FuncrptL_2_301Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_2_301Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.runtime = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RUNTIME_INT);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.begin_NAV = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_NAV_FLOAT);
                    reqCommand.nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT);
                    reqCommand.total_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_ASSET_FLOAT);
                    reqCommand.stock_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_FLOAT);
                    reqCommand.futu_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ASSET_FLOAT);
                    reqCommand.option_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPTION_ASSET_FLOAT);
                    reqCommand.warrant_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WARRANT_ASSET_FLOAT);
                    reqCommand.fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_ASSET_FLOAT);
                    reqCommand.cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_ASSET_FLOAT);
                    reqCommand.repo_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPO_ASSET_FLOAT);
                    reqCommand.bond_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ASSET_FLOAT);
                    reqCommand.other_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_ASSET_FLOAT);
                    reqCommand.acco_cash = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_CASH_FLOAT);
                    reqCommand.cash_bala = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_BALA_FLOAT);
                    reqCommand.apply_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_APPLY_AMT_FLOAT);
                    reqCommand.redemp_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REDEMP_AMT_FLOAT);
                    reqCommand.total_cash_divide = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_CASH_DIVIDE_FLOAT);
                    reqCommand.money_fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MONEY_FUND_ASSET_FLOAT);
                    reqCommand.unit_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_NAV_FLOAT);
                    reqCommand.pre_pd_unit_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_PD_UNIT_NAV_FLOAT);
                    reqCommand.total_unit_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_UNIT_NAV_FLOAT);
                    reqCommand.last_week_pd_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_WEEK_PD_NAV_FLOAT);
                    reqCommand.last_month_pd_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_MONTH_PD_NAV_FLOAT);
                    reqCommand.last_quarter_pd_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_QUARTER_PD_NAV_FLOAT);
                    reqCommand.last_year_pd_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_YEAR_PD_NAV_FLOAT);
                    reqCommand.pd_all_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_ALL_SHARE_FLOAT);
                    reqCommand.curr_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_SHARE_FLOAT);
                    reqCommand.pre_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SHARE_FLOAT);
                    reqCommand.total_payab_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_PAYAB_AMT_FLOAT);
                    reqCommand.total_rece_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_RECE_AMT_FLOAT);
                    reqCommand.product_unit_nav_ration = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRODUCT_UNIT_NAV_RATION_FLOAT);
                    reqCommand.buy_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_AMT_FLOAT);
                    reqCommand.sellout_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELLOUT_AMT_FLOAT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncrptL_2_301Models.Add(reqCommand);
                }
            }
            return FuncrptL_2_301Models;
        }
 
        //逻辑_报表_报表数据_查询产品持仓
        public static List<FuncrptL_2_302Model> GetFuncrptL_2_302Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_2_302Models = new List<FuncrptL_2_302Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_2_302Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_name = packer.GetStrbyName("stock_name", i);
                reqCommand.asset_acco = packer.GetStrbyName("asset_acco", i);
                reqCommand.stock_acco = packer.GetStrbyName("stock_acco", i);
                reqCommand.invest_type = packer.GetIntbyName("invest_type", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.asset_type = packer.GetIntbyName("asset_type", i);
                reqCommand.asset_kind = packer.GetIntbyName("asset_kind", i);
                reqCommand.begin_qty = packer.GetDoublebyName("begin_qty", i);
                reqCommand.curr_qty = packer.GetDoublebyName("curr_qty", i);
                reqCommand.frozen_qty = packer.GetDoublebyName("frozen_qty", i);
                reqCommand.unfroz_qty = packer.GetDoublebyName("unfroz_qty", i);
                reqCommand.cost_amt = packer.GetDoublebyName("cost_amt", i);
                reqCommand.realize_pandl = packer.GetDoublebyName("realize_pandl", i);
                reqCommand.intrst_cost_amt = packer.GetDoublebyName("intrst_cost_amt", i);
                reqCommand.intrst_pandl = packer.GetDoublebyName("intrst_pandl", i);
                reqCommand.last_price = packer.GetDoublebyName("last_price", i);
                reqCommand.stock_asset_value = packer.GetDoublebyName("stock_asset_value", i);
                reqCommand.value_dirty_price = packer.GetDoublebyName("value_dirty_price", i);
                reqCommand.value_net_price = packer.GetDoublebyName("value_net_price", i);
                reqCommand.buy_qty = packer.GetDoublebyName("buy_qty", i);
                reqCommand.buy_amt = packer.GetDoublebyName("buy_amt", i);
                reqCommand.sell_qty = packer.GetDoublebyName("sell_qty", i);
                reqCommand.sellout_amt = packer.GetDoublebyName("sellout_amt", i);
 
                FuncrptL_2_302Models.Add(reqCommand);
            }
            return FuncrptL_2_302Models;
        }
 
        //逻辑_报表_报表数据_查询产品持仓
        public static List<FuncrptL_2_302Model> GetFuncrptL_2_302Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_2_302Models = new List<FuncrptL_2_302Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_2_302Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    reqCommand.asset_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STR);
                    reqCommand.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                    reqCommand.invest_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INVEST_TYPE_INT);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    reqCommand.asset_kind = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_KIND_INT);
                    reqCommand.begin_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_QTY_FLOAT);
                    reqCommand.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    reqCommand.frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_QTY_FLOAT);
                    reqCommand.unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_QTY_FLOAT);
                    reqCommand.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                    reqCommand.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    reqCommand.intrst_cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_COST_AMT_FLOAT);
                    reqCommand.intrst_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_PANDL_FLOAT);
                    reqCommand.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    reqCommand.stock_asset_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_VALUE_FLOAT);
                    reqCommand.value_dirty_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VALUE_DIRTY_PRICE_FLOAT);
                    reqCommand.value_net_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VALUE_NET_PRICE_FLOAT);
                    reqCommand.buy_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_QTY_FLOAT);
                    reqCommand.buy_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_AMT_FLOAT);
                    reqCommand.sell_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_QTY_FLOAT);
                    reqCommand.sellout_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELLOUT_AMT_FLOAT);
                    FuncrptL_2_302Models.Add(reqCommand);
                }
            }
            return FuncrptL_2_302Models;
        }
 
        //逻辑_报表_报表数据_查询产品行业
        public static List<FuncrptL_2_303Model> GetFuncrptL_2_303Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_2_303Models = new List<FuncrptL_2_303Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_2_303Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.industry_std = packer.GetIntbyName("industry_std", i);
                reqCommand.industry_classification = packer.GetIntbyName("industry_classification", i);
                reqCommand.industry_id = packer.GetIntbyName("industry_id", i);
                reqCommand.industry_code = packer.GetStrbyName("industry_code", i);
                reqCommand.indu_name = packer.GetStrbyName("indu_name", i);
                reqCommand.basket_qty = packer.GetDoublebyName("basket_qty", i);
                reqCommand.cost_amt = packer.GetDoublebyName("cost_amt", i);
                reqCommand.posi_market_value = packer.GetDoublebyName("posi_market_value", i);
                reqCommand.weight_ratio = packer.GetDoublebyName("weight_ratio", i);
                reqCommand.float_pandl = packer.GetDoublebyName("float_pandl", i);
                reqCommand.realize_pandl = packer.GetDoublebyName("realize_pandl", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncrptL_2_303Models.Add(reqCommand);
            }
            return FuncrptL_2_303Models;
        }
 
        //逻辑_报表_报表数据_查询产品行业
        public static List<FuncrptL_2_303Model> GetFuncrptL_2_303Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_2_303Models = new List<FuncrptL_2_303Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_2_303Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.industry_std = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDUSTRY_STD_INT);
                    reqCommand.industry_classification = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDUSTRY_CLASSIFICATION_INT);
                    reqCommand.industry_id = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDUSTRY_ID_INT);
                    reqCommand.industry_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_INDUSTRY_CODE_STR);
                    reqCommand.indu_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_INDU_NAME_STR);
                    reqCommand.basket_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_QTY_FLOAT);
                    reqCommand.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                    reqCommand.posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_MARKET_VALUE_FLOAT);
                    reqCommand.weight_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WEIGHT_RATIO_FLOAT);
                    reqCommand.float_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FLOAT_PANDL_FLOAT);
                    reqCommand.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncrptL_2_303Models.Add(reqCommand);
                }
            }
            return FuncrptL_2_303Models;
        }
 
        //逻辑_报表_报表数据_查询产品行业区间盈亏
        public static List<FuncrptL_2_304Model> GetFuncrptL_2_304Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_2_304Models = new List<FuncrptL_2_304Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_2_304Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.begin_date = packer.GetIntbyName("begin_date", i);
                reqCommand.end_date = packer.GetIntbyName("end_date", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.industry_std = packer.GetIntbyName("industry_std", i);
                reqCommand.industry_classification = packer.GetIntbyName("industry_classification", i);
                reqCommand.industry_id = packer.GetIntbyName("industry_id", i);
                reqCommand.industry_code = packer.GetStrbyName("industry_code", i);
                reqCommand.indu_name = packer.GetStrbyName("indu_name", i);
                reqCommand.begin_qty = packer.GetDoublebyName("begin_qty", i);
                reqCommand.begin_cost_amt = packer.GetDoublebyName("begin_cost_amt", i);
                reqCommand.begin_posi_market_value = packer.GetDoublebyName("begin_posi_market_value", i);
                reqCommand.begin_realize_pandl = packer.GetDoublebyName("begin_realize_pandl", i);
                reqCommand.end_cur_qty = packer.GetIntbyName("end_cur_qty", i);
                reqCommand.end_cost_amt = packer.GetDoublebyName("end_cost_amt", i);
                reqCommand.end_posi_market_value = packer.GetDoublebyName("end_posi_market_value", i);
                reqCommand.end_realize_pandl = packer.GetDoublebyName("end_realize_pandl", i);
                reqCommand.float_pandl = packer.GetDoublebyName("float_pandl", i);
                reqCommand.interval_realize_pandl = packer.GetDoublebyName("interval_realize_pandl", i);
                reqCommand.interval_pandl = packer.GetDoublebyName("interval_pandl", i);
 
                FuncrptL_2_304Models.Add(reqCommand);
            }
            return FuncrptL_2_304Models;
        }
 
        //逻辑_报表_报表数据_查询产品行业区间盈亏
        public static List<FuncrptL_2_304Model> GetFuncrptL_2_304Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_2_304Models = new List<FuncrptL_2_304Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_2_304Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT);
                    reqCommand.end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.industry_std = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDUSTRY_STD_INT);
                    reqCommand.industry_classification = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDUSTRY_CLASSIFICATION_INT);
                    reqCommand.industry_id = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDUSTRY_ID_INT);
                    reqCommand.industry_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_INDUSTRY_CODE_STR);
                    reqCommand.indu_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_INDU_NAME_STR);
                    reqCommand.begin_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_QTY_FLOAT);
                    reqCommand.begin_cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_COST_AMT_FLOAT);
                    reqCommand.begin_posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_POSI_MARKET_VALUE_FLOAT);
                    reqCommand.begin_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_REALIZE_PANDL_FLOAT);
                    reqCommand.end_cur_qty = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_CUR_QTY_INT);
                    reqCommand.end_cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_END_COST_AMT_FLOAT);
                    reqCommand.end_posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_END_POSI_MARKET_VALUE_FLOAT);
                    reqCommand.end_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_END_REALIZE_PANDL_FLOAT);
                    reqCommand.float_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FLOAT_PANDL_FLOAT);
                    reqCommand.interval_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTERVAL_REALIZE_PANDL_FLOAT);
                    reqCommand.interval_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTERVAL_PANDL_FLOAT);
                    FuncrptL_2_304Models.Add(reqCommand);
                }
            }
            return FuncrptL_2_304Models;
        }
 
        //逻辑_报表_报表数据_查询汇总机构证券买卖成交
        public static List<FuncrptL_2_305Model> GetFuncrptL_2_305Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_2_305Models = new List<FuncrptL_2_305Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_2_305Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.asset_type = packer.GetIntbyName("asset_type", i);
                reqCommand.order_price = packer.GetDoublebyName("order_price", i);
                reqCommand.order_qty = packer.GetDoublebyName("order_qty", i);
                reqCommand.strike_qty = packer.GetDoublebyName("strike_qty", i);
                reqCommand.strike_price = packer.GetDoublebyName("strike_price", i);
                reqCommand.strike_amt = packer.GetDoublebyName("strike_amt", i);
                reqCommand.buy_qty = packer.GetDoublebyName("buy_qty", i);
                reqCommand.buy_amt = packer.GetDoublebyName("buy_amt", i);
                reqCommand.buy_strike_price = packer.GetDoublebyName("buy_strike_price", i);
                reqCommand.sell_qty = packer.GetDoublebyName("sell_qty", i);
                reqCommand.sellout_amt = packer.GetDoublebyName("sellout_amt", i);
                reqCommand.sell_strike_price = packer.GetDoublebyName("sell_strike_price", i);
                reqCommand.diff_qty = packer.GetDoublebyName("diff_qty", i);
                reqCommand.buy_begin_time = packer.GetIntbyName("buy_begin_time", i);
                reqCommand.buy_end_time = packer.GetIntbyName("buy_end_time", i);
                reqCommand.sell_begin_time = packer.GetIntbyName("sell_begin_time", i);
                reqCommand.sell_end_time = packer.GetIntbyName("sell_end_time", i);
 
                FuncrptL_2_305Models.Add(reqCommand);
            }
            return FuncrptL_2_305Models;
        }
 
        //逻辑_报表_报表数据_查询汇总机构证券买卖成交
        public static List<FuncrptL_2_305Model> GetFuncrptL_2_305Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_2_305Models = new List<FuncrptL_2_305Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_2_305Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    reqCommand.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    reqCommand.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    reqCommand.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    reqCommand.strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_PRICE_FLOAT);
                    reqCommand.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    reqCommand.buy_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_QTY_FLOAT);
                    reqCommand.buy_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_AMT_FLOAT);
                    reqCommand.buy_strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_STRIKE_PRICE_FLOAT);
                    reqCommand.sell_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_QTY_FLOAT);
                    reqCommand.sellout_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELLOUT_AMT_FLOAT);
                    reqCommand.sell_strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_STRIKE_PRICE_FLOAT);
                    reqCommand.diff_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DIFF_QTY_FLOAT);
                    reqCommand.buy_begin_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUY_BEGIN_TIME_INT);
                    reqCommand.buy_end_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUY_END_TIME_INT);
                    reqCommand.sell_begin_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SELL_BEGIN_TIME_INT);
                    reqCommand.sell_end_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SELL_END_TIME_INT);
                    FuncrptL_2_305Models.Add(reqCommand);
                }
            }
            return FuncrptL_2_305Models;
        }
 
        //逻辑_报表_报表数据_查询汇总产品证券买卖成交
        public static List<FuncrptL_2_306Model> GetFuncrptL_2_306Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_2_306Models = new List<FuncrptL_2_306Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_2_306Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.asset_type = packer.GetIntbyName("asset_type", i);
                reqCommand.order_price = packer.GetDoublebyName("order_price", i);
                reqCommand.order_qty = packer.GetDoublebyName("order_qty", i);
                reqCommand.strike_qty = packer.GetDoublebyName("strike_qty", i);
                reqCommand.strike_price = packer.GetDoublebyName("strike_price", i);
                reqCommand.strike_amt = packer.GetDoublebyName("strike_amt", i);
                reqCommand.buy_qty = packer.GetDoublebyName("buy_qty", i);
                reqCommand.buy_amt = packer.GetDoublebyName("buy_amt", i);
                reqCommand.buy_strike_price = packer.GetDoublebyName("buy_strike_price", i);
                reqCommand.sell_qty = packer.GetDoublebyName("sell_qty", i);
                reqCommand.sellout_amt = packer.GetDoublebyName("sellout_amt", i);
                reqCommand.sell_strike_price = packer.GetDoublebyName("sell_strike_price", i);
                reqCommand.diff_qty = packer.GetDoublebyName("diff_qty", i);
                reqCommand.buy_begin_time = packer.GetIntbyName("buy_begin_time", i);
                reqCommand.buy_end_time = packer.GetIntbyName("buy_end_time", i);
                reqCommand.sell_begin_time = packer.GetIntbyName("sell_begin_time", i);
                reqCommand.sell_end_time = packer.GetIntbyName("sell_end_time", i);
 
                FuncrptL_2_306Models.Add(reqCommand);
            }
            return FuncrptL_2_306Models;
        }
 
        //逻辑_报表_报表数据_查询汇总产品证券买卖成交
        public static List<FuncrptL_2_306Model> GetFuncrptL_2_306Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_2_306Models = new List<FuncrptL_2_306Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_2_306Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    reqCommand.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    reqCommand.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    reqCommand.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    reqCommand.strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_PRICE_FLOAT);
                    reqCommand.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    reqCommand.buy_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_QTY_FLOAT);
                    reqCommand.buy_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_AMT_FLOAT);
                    reqCommand.buy_strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_STRIKE_PRICE_FLOAT);
                    reqCommand.sell_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_QTY_FLOAT);
                    reqCommand.sellout_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELLOUT_AMT_FLOAT);
                    reqCommand.sell_strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_STRIKE_PRICE_FLOAT);
                    reqCommand.diff_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DIFF_QTY_FLOAT);
                    reqCommand.buy_begin_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUY_BEGIN_TIME_INT);
                    reqCommand.buy_end_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUY_END_TIME_INT);
                    reqCommand.sell_begin_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SELL_BEGIN_TIME_INT);
                    reqCommand.sell_end_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SELL_END_TIME_INT);
                    FuncrptL_2_306Models.Add(reqCommand);
                }
            }
            return FuncrptL_2_306Models;
        }
 
        //逻辑_报表_报表数据_查询汇总产品证券成交
        public static List<FuncrptL_2_307Model> GetFuncrptL_2_307Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_2_307Models = new List<FuncrptL_2_307Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_2_307Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.asset_acco = packer.GetStrbyName("asset_acco", i);
                reqCommand.stock_acco = packer.GetStrbyName("stock_acco", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.invest_type = packer.GetIntbyName("invest_type", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.strike_aver_price = packer.GetDoublebyName("strike_aver_price", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.order_price = packer.GetDoublebyName("order_price", i);
                reqCommand.order_qty = packer.GetDoublebyName("order_qty", i);
                reqCommand.strike_qty = packer.GetDoublebyName("strike_qty", i);
                reqCommand.strike_amt = packer.GetDoublebyName("strike_amt", i);
                reqCommand.all_fee = packer.GetDoublebyName("all_fee", i);
                reqCommand.stamp_tax = packer.GetDoublebyName("stamp_tax", i);
                reqCommand.trans_fee = packer.GetDoublebyName("trans_fee", i);
                reqCommand.brkage_fee = packer.GetDoublebyName("brkage_fee", i);
                reqCommand.SEC_charges = packer.GetDoublebyName("SEC_charges", i);
                reqCommand.other_fee = packer.GetDoublebyName("other_fee", i);
                reqCommand.trade_commis = packer.GetDoublebyName("trade_commis", i);
                reqCommand.other_commis = packer.GetDoublebyName("other_commis", i);
                reqCommand.bond_accr_intrst = packer.GetDoublebyName("bond_accr_intrst", i);
                reqCommand.net_price_flag = packer.GetIntbyName("net_price_flag", i);
                reqCommand.bank_ib_member = packer.GetStrbyName("bank_ib_member", i);
                reqCommand.last_price = packer.GetDoublebyName("last_price", i);
                reqCommand.quot_strike_qty = packer.GetDoublebyName("quot_strike_qty", i);
                reqCommand.quot_strike_amt = packer.GetDoublebyName("quot_strike_amt", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
                reqCommand.src_data_type = packer.GetIntbyName("src_data_type", i);
 
                FuncrptL_2_307Models.Add(reqCommand);
            }
            return FuncrptL_2_307Models;
        }
 
        //逻辑_报表_报表数据_查询汇总产品证券成交
        public static List<FuncrptL_2_307Model> GetFuncrptL_2_307Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_2_307Models = new List<FuncrptL_2_307Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_2_307Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.asset_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STR);
                    reqCommand.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.invest_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INVEST_TYPE_INT);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.strike_aver_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AVER_PRICE_FLOAT);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    reqCommand.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    reqCommand.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    reqCommand.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    reqCommand.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                    reqCommand.stamp_tax = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STAMP_TAX_FLOAT);
                    reqCommand.trans_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_FEE_FLOAT);
                    reqCommand.brkage_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BRKAGE_FEE_FLOAT);
                    reqCommand.SEC_charges = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SEC_CHARGES_FLOAT);
                    reqCommand.other_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_FEE_FLOAT);
                    reqCommand.trade_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_COMMIS_FLOAT);
                    reqCommand.other_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_COMMIS_FLOAT);
                    reqCommand.bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT);
                    reqCommand.net_price_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLAG_INT);
                    reqCommand.bank_ib_member = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BANK_IB_MEMBER_STR);
                    reqCommand.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    reqCommand.quot_strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_QUOT_STRIKE_QTY_FLOAT);
                    reqCommand.quot_strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_QUOT_STRIKE_AMT_FLOAT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    reqCommand.src_data_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SRC_DATA_TYPE_INT);
                    FuncrptL_2_307Models.Add(reqCommand);
                }
            }
            return FuncrptL_2_307Models;
        }
 
        //逻辑_报表_报表数据_查询区间汇总产品证券成交
        public static List<FuncrptL_2_308Model> GetFuncrptL_2_308Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_2_308Models = new List<FuncrptL_2_308Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_2_308Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.begin_date = packer.GetIntbyName("begin_date", i);
                reqCommand.end_date = packer.GetIntbyName("end_date", i);
                reqCommand.stat_days = packer.GetIntbyName("stat_days", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.asset_acco = packer.GetStrbyName("asset_acco", i);
                reqCommand.stock_acco = packer.GetStrbyName("stock_acco", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.invest_type = packer.GetIntbyName("invest_type", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.order_qty = packer.GetDoublebyName("order_qty", i);
                reqCommand.strike_qty = packer.GetDoublebyName("strike_qty", i);
                reqCommand.strike_amt = packer.GetDoublebyName("strike_amt", i);
                reqCommand.all_fee = packer.GetDoublebyName("all_fee", i);
                reqCommand.stamp_tax = packer.GetDoublebyName("stamp_tax", i);
                reqCommand.trans_fee = packer.GetDoublebyName("trans_fee", i);
                reqCommand.brkage_fee = packer.GetDoublebyName("brkage_fee", i);
                reqCommand.SEC_charges = packer.GetDoublebyName("SEC_charges", i);
                reqCommand.other_fee = packer.GetDoublebyName("other_fee", i);
                reqCommand.trade_commis = packer.GetDoublebyName("trade_commis", i);
                reqCommand.other_commis = packer.GetDoublebyName("other_commis", i);
                reqCommand.bond_accr_intrst = packer.GetDoublebyName("bond_accr_intrst", i);
                reqCommand.quot_strike_qty = packer.GetDoublebyName("quot_strike_qty", i);
                reqCommand.quot_strike_amt = packer.GetDoublebyName("quot_strike_amt", i);
 
                FuncrptL_2_308Models.Add(reqCommand);
            }
            return FuncrptL_2_308Models;
        }
 
        //逻辑_报表_报表数据_查询区间汇总产品证券成交
        public static List<FuncrptL_2_308Model> GetFuncrptL_2_308Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_2_308Models = new List<FuncrptL_2_308Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_2_308Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT);
                    reqCommand.end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT);
                    reqCommand.stat_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STAT_DAYS_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.asset_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STR);
                    reqCommand.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.invest_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INVEST_TYPE_INT);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    reqCommand.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    reqCommand.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    reqCommand.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                    reqCommand.stamp_tax = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STAMP_TAX_FLOAT);
                    reqCommand.trans_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_FEE_FLOAT);
                    reqCommand.brkage_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BRKAGE_FEE_FLOAT);
                    reqCommand.SEC_charges = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SEC_CHARGES_FLOAT);
                    reqCommand.other_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_FEE_FLOAT);
                    reqCommand.trade_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_COMMIS_FLOAT);
                    reqCommand.other_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_COMMIS_FLOAT);
                    reqCommand.bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT);
                    reqCommand.quot_strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_QUOT_STRIKE_QTY_FLOAT);
                    reqCommand.quot_strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_QUOT_STRIKE_AMT_FLOAT);
                    FuncrptL_2_308Models.Add(reqCommand);
                }
            }
            return FuncrptL_2_308Models;
        }
 
        //逻辑_报表_报表数据_查询汇总产品资金流水
        public static List<FuncrptL_2_309Model> GetFuncrptL_2_309Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_2_309Models = new List<FuncrptL_2_309Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_2_309Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.busi_flag = packer.GetIntbyName("busi_flag", i);
                reqCommand.occur_amt = packer.GetDoublebyName("occur_amt", i);
 
                FuncrptL_2_309Models.Add(reqCommand);
            }
            return FuncrptL_2_309Models;
        }
 
        //逻辑_报表_报表数据_查询汇总产品资金流水
        public static List<FuncrptL_2_309Model> GetFuncrptL_2_309Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_2_309Models = new List<FuncrptL_2_309Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_2_309Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.busi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT);
                    reqCommand.occur_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_AMT_FLOAT);
                    FuncrptL_2_309Models.Add(reqCommand);
                }
            }
            return FuncrptL_2_309Models;
        }
 
        //逻辑_报表_报表数据_查询区间汇总产品资金流水
        public static List<FuncrptL_2_310Model> GetFuncrptL_2_310Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_2_310Models = new List<FuncrptL_2_310Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_2_310Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.begin_date = packer.GetIntbyName("begin_date", i);
                reqCommand.end_date = packer.GetIntbyName("end_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.busi_flag = packer.GetIntbyName("busi_flag", i);
                reqCommand.occur_amt = packer.GetDoublebyName("occur_amt", i);
 
                FuncrptL_2_310Models.Add(reqCommand);
            }
            return FuncrptL_2_310Models;
        }
 
        //逻辑_报表_报表数据_查询区间汇总产品资金流水
        public static List<FuncrptL_2_310Model> GetFuncrptL_2_310Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_2_310Models = new List<FuncrptL_2_310Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_2_310Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT);
                    reqCommand.end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.busi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT);
                    reqCommand.occur_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_AMT_FLOAT);
                    FuncrptL_2_310Models.Add(reqCommand);
                }
            }
            return FuncrptL_2_310Models;
        }
 
        //逻辑_报表_报表数据_查询月汇总产品持仓成交
        public static List<FuncrptL_2_311Model> GetFuncrptL_2_311Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_2_311Models = new List<FuncrptL_2_311Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_2_311Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.curr_month = packer.GetIntbyName("curr_month", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.begin_NAV = packer.GetDoublebyName("begin_NAV", i);
                reqCommand.end_nav_asset = packer.GetDoublebyName("end_nav_asset", i);
                reqCommand.avg_nav_asset = packer.GetDoublebyName("avg_nav_asset", i);
                reqCommand.avg_total_asset = packer.GetDoublebyName("avg_total_asset", i);
                reqCommand.avg_stock_asset = packer.GetDoublebyName("avg_stock_asset", i);
                reqCommand.avg_futu_asset = packer.GetDoublebyName("avg_futu_asset", i);
                reqCommand.avg_option_asset = packer.GetDoublebyName("avg_option_asset", i);
                reqCommand.avg_warrant_asset = packer.GetDoublebyName("avg_warrant_asset", i);
                reqCommand.avg_fund_asset = packer.GetDoublebyName("avg_fund_asset", i);
                reqCommand.avg_cash_asset = packer.GetDoublebyName("avg_cash_asset", i);
                reqCommand.avg_repo_asset = packer.GetDoublebyName("avg_repo_asset", i);
                reqCommand.avg_bond_asset = packer.GetDoublebyName("avg_bond_asset", i);
                reqCommand.avg_money_fund_asset = packer.GetDoublebyName("avg_money_fund_asset", i);
                reqCommand.pd_begin_unit_nav = packer.GetDoublebyName("pd_begin_unit_nav", i);
                reqCommand.end_unit_nav = packer.GetDoublebyName("end_unit_nav", i);
                reqCommand.avg_pd_all_share = packer.GetDoublebyName("avg_pd_all_share", i);
                reqCommand.buy_amt = packer.GetDoublebyName("buy_amt", i);
                reqCommand.sellout_amt = packer.GetDoublebyName("sellout_amt", i);
                reqCommand.begin_date = packer.GetIntbyName("begin_date", i);
                reqCommand.end_date = packer.GetIntbyName("end_date", i);
                reqCommand.stat_days = packer.GetIntbyName("stat_days", i);
                reqCommand.month_apply_amt = packer.GetDoublebyName("month_apply_amt", i);
                reqCommand.trade_deduct_amt = packer.GetDoublebyName("trade_deduct_amt", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncrptL_2_311Models.Add(reqCommand);
            }
            return FuncrptL_2_311Models;
        }
 
        //逻辑_报表_报表数据_查询月汇总产品持仓成交
        public static List<FuncrptL_2_311Model> GetFuncrptL_2_311Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_2_311Models = new List<FuncrptL_2_311Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_2_311Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.curr_month = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONTH_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.begin_NAV = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_NAV_FLOAT);
                    reqCommand.end_nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_END_NAV_ASSET_FLOAT);
                    reqCommand.avg_nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVG_NAV_ASSET_FLOAT);
                    reqCommand.avg_total_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVG_TOTAL_ASSET_FLOAT);
                    reqCommand.avg_stock_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVG_STOCK_ASSET_FLOAT);
                    reqCommand.avg_futu_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVG_FUTU_ASSET_FLOAT);
                    reqCommand.avg_option_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVG_OPTION_ASSET_FLOAT);
                    reqCommand.avg_warrant_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVG_WARRANT_ASSET_FLOAT);
                    reqCommand.avg_fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVG_FUND_ASSET_FLOAT);
                    reqCommand.avg_cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVG_CASH_ASSET_FLOAT);
                    reqCommand.avg_repo_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVG_REPO_ASSET_FLOAT);
                    reqCommand.avg_bond_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVG_BOND_ASSET_FLOAT);
                    reqCommand.avg_money_fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVG_MONEY_FUND_ASSET_FLOAT);
                    reqCommand.pd_begin_unit_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_BEGIN_UNIT_NAV_FLOAT);
                    reqCommand.end_unit_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_END_UNIT_NAV_FLOAT);
                    reqCommand.avg_pd_all_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVG_PD_ALL_SHARE_FLOAT);
                    reqCommand.buy_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_AMT_FLOAT);
                    reqCommand.sellout_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELLOUT_AMT_FLOAT);
                    reqCommand.begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT);
                    reqCommand.end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT);
                    reqCommand.stat_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STAT_DAYS_INT);
                    reqCommand.month_apply_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MONTH_APPLY_AMT_FLOAT);
                    reqCommand.trade_deduct_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_DEDUCT_AMT_FLOAT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncrptL_2_311Models.Add(reqCommand);
                }
            }
            return FuncrptL_2_311Models;
        }
 
        //逻辑_报表_报表数据_查询结算提前待入账记录表
        public static List<FuncrptL_2_312Model> GetFuncrptL_2_312Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_2_312Models = new List<FuncrptL_2_312Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_2_312Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.exch_crncy_type = packer.GetStrbyName("exch_crncy_type", i);
                reqCommand.exch_rate = packer.GetDoublebyName("exch_rate", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.trade_code_no = packer.GetIntbyName("trade_code_no", i);
                reqCommand.target_code_no = packer.GetIntbyName("target_code_no", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.asset_type = packer.GetIntbyName("asset_type", i);
                reqCommand.pre_entry_qty = packer.GetDoublebyName("pre_entry_qty", i);
                reqCommand.pre_entry_amt = packer.GetDoublebyName("pre_entry_amt", i);
                reqCommand.impawn_ratio = packer.GetDoublebyName("impawn_ratio", i);
                reqCommand.bond_accr_intrst = packer.GetDoublebyName("bond_accr_intrst", i);
                reqCommand.busi_flag = packer.GetIntbyName("busi_flag", i);
                reqCommand.act_record_flag = packer.GetIntbyName("act_record_flag", i);
                reqCommand.acco_entry_flag = packer.GetIntbyName("acco_entry_flag", i);
                reqCommand.entry_money_jour_no = packer.GetInt64byName("entry_money_jour_no", i);
                reqCommand.entry_status = packer.GetStrbyName("entry_status", i);
                reqCommand.reg_date = packer.GetIntbyName("reg_date", i);
                reqCommand.arrive_date = packer.GetIntbyName("arrive_date", i);
                reqCommand.begin_trade_date = packer.GetIntbyName("begin_trade_date", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
                reqCommand.src_data_type = packer.GetIntbyName("src_data_type", i);
 
                FuncrptL_2_312Models.Add(reqCommand);
            }
            return FuncrptL_2_312Models;
        }
 
        //逻辑_报表_报表数据_查询结算提前待入账记录表
        public static List<FuncrptL_2_312Model> GetFuncrptL_2_312Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_2_312Models = new List<FuncrptL_2_312Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_2_312Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.exch_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR);
                    reqCommand.exch_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_RATE_FLOAT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.trade_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_NO_INT);
                    reqCommand.target_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_NO_INT);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    reqCommand.pre_entry_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ENTRY_QTY_FLOAT);
                    reqCommand.pre_entry_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ENTRY_AMT_FLOAT);
                    reqCommand.impawn_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_IMPAWN_RATIO_FLOAT);
                    reqCommand.bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT);
                    reqCommand.busi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT);
                    reqCommand.act_record_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ACT_RECORD_FLAG_INT);
                    reqCommand.acco_entry_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_ENTRY_FLAG_INT);
                    reqCommand.entry_money_jour_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_MONEY_JOUR_NO_INT64);
                    reqCommand.entry_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_STATUS_STR);
                    reqCommand.reg_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REG_DATE_INT);
                    reqCommand.arrive_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ARRIVE_DATE_INT);
                    reqCommand.begin_trade_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TRADE_DATE_INT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    reqCommand.src_data_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SRC_DATA_TYPE_INT);
                    FuncrptL_2_312Models.Add(reqCommand);
                }
            }
            return FuncrptL_2_312Models;
        }
 
        //逻辑_报表_报表数据_查询统计基金经理资产
        public static List<FuncrptL_2_314Model> GetFuncrptL_2_314Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_2_314Models = new List<FuncrptL_2_314Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_2_314Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.fund_manager_no = packer.GetIntbyName("fund_manager_no", i);
                reqCommand.fund_manager_name = packer.GetStrbyName("fund_manager_name", i);
                reqCommand.total_count = packer.GetIntbyName("total_count", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.begin_NAV = packer.GetDoublebyName("begin_NAV", i);
                reqCommand.nav_asset = packer.GetDoublebyName("nav_asset", i);
                reqCommand.total_asset = packer.GetDoublebyName("total_asset", i);
                reqCommand.stock_asset = packer.GetDoublebyName("stock_asset", i);
                reqCommand.futu_asset = packer.GetDoublebyName("futu_asset", i);
                reqCommand.option_asset = packer.GetDoublebyName("option_asset", i);
                reqCommand.warrant_asset = packer.GetDoublebyName("warrant_asset", i);
                reqCommand.fund_asset = packer.GetDoublebyName("fund_asset", i);
                reqCommand.cash_asset = packer.GetDoublebyName("cash_asset", i);
                reqCommand.repo_asset = packer.GetDoublebyName("repo_asset", i);
                reqCommand.bond_asset = packer.GetDoublebyName("bond_asset", i);
                reqCommand.other_asset = packer.GetDoublebyName("other_asset", i);
                reqCommand.acco_cash = packer.GetDoublebyName("acco_cash", i);
                reqCommand.total_cash_divide = packer.GetDoublebyName("total_cash_divide", i);
                reqCommand.money_fund_asset = packer.GetDoublebyName("money_fund_asset", i);
                reqCommand.unit_nav = packer.GetDoublebyName("unit_nav", i);
                reqCommand.pd_all_share = packer.GetDoublebyName("pd_all_share", i);
                reqCommand.curr_share = packer.GetDoublebyName("curr_share", i);
                reqCommand.total_payab_amt = packer.GetDoublebyName("total_payab_amt", i);
                reqCommand.total_rece_amt = packer.GetDoublebyName("total_rece_amt", i);
                reqCommand.buy_amt = packer.GetDoublebyName("buy_amt", i);
                reqCommand.sellout_amt = packer.GetDoublebyName("sellout_amt", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncrptL_2_314Models.Add(reqCommand);
            }
            return FuncrptL_2_314Models;
        }
 
        //逻辑_报表_报表数据_查询统计基金经理资产
        public static List<FuncrptL_2_314Model> GetFuncrptL_2_314Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_2_314Models = new List<FuncrptL_2_314Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_2_314Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.fund_manager_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_NO_INT);
                    reqCommand.fund_manager_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_NAME_STR);
                    reqCommand.total_count = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_COUNT_INT);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.begin_NAV = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_NAV_FLOAT);
                    reqCommand.nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT);
                    reqCommand.total_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_ASSET_FLOAT);
                    reqCommand.stock_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_FLOAT);
                    reqCommand.futu_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ASSET_FLOAT);
                    reqCommand.option_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPTION_ASSET_FLOAT);
                    reqCommand.warrant_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WARRANT_ASSET_FLOAT);
                    reqCommand.fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_ASSET_FLOAT);
                    reqCommand.cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_ASSET_FLOAT);
                    reqCommand.repo_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPO_ASSET_FLOAT);
                    reqCommand.bond_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ASSET_FLOAT);
                    reqCommand.other_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_ASSET_FLOAT);
                    reqCommand.acco_cash = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_CASH_FLOAT);
                    reqCommand.total_cash_divide = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_CASH_DIVIDE_FLOAT);
                    reqCommand.money_fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MONEY_FUND_ASSET_FLOAT);
                    reqCommand.unit_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_NAV_FLOAT);
                    reqCommand.pd_all_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_ALL_SHARE_FLOAT);
                    reqCommand.curr_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_SHARE_FLOAT);
                    reqCommand.total_payab_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_PAYAB_AMT_FLOAT);
                    reqCommand.total_rece_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_RECE_AMT_FLOAT);
                    reqCommand.buy_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_AMT_FLOAT);
                    reqCommand.sellout_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELLOUT_AMT_FLOAT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncrptL_2_314Models.Add(reqCommand);
                }
            }
            return FuncrptL_2_314Models;
        }
 
        //逻辑_报表_报表数据_查询统计基金经理持仓
        public static List<FuncrptL_2_316Model> GetFuncrptL_2_316Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_2_316Models = new List<FuncrptL_2_316Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_2_316Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.fund_manager_no = packer.GetIntbyName("fund_manager_no", i);
                reqCommand.fund_manager_name = packer.GetStrbyName("fund_manager_name", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.total_count = packer.GetIntbyName("total_count", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_name = packer.GetStrbyName("stock_name", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.asset_type = packer.GetIntbyName("asset_type", i);
                reqCommand.begin_qty = packer.GetDoublebyName("begin_qty", i);
                reqCommand.curr_qty = packer.GetDoublebyName("curr_qty", i);
                reqCommand.frozen_qty = packer.GetDoublebyName("frozen_qty", i);
                reqCommand.unfroz_qty = packer.GetDoublebyName("unfroz_qty", i);
                reqCommand.total_stock_issue = packer.GetDoublebyName("total_stock_issue", i);
                reqCommand.circl_stock_capit = packer.GetDoublebyName("circl_stock_capit", i);
                reqCommand.cost_amt = packer.GetDoublebyName("cost_amt", i);
                reqCommand.realize_pandl = packer.GetDoublebyName("realize_pandl", i);
                reqCommand.intrst_cost_amt = packer.GetDoublebyName("intrst_cost_amt", i);
                reqCommand.intrst_pandl = packer.GetDoublebyName("intrst_pandl", i);
                reqCommand.last_price = packer.GetDoublebyName("last_price", i);
                reqCommand.posi_market_value = packer.GetDoublebyName("posi_market_value", i);
                reqCommand.buy_qty = packer.GetDoublebyName("buy_qty", i);
                reqCommand.buy_amt = packer.GetDoublebyName("buy_amt", i);
                reqCommand.sell_qty = packer.GetDoublebyName("sell_qty", i);
                reqCommand.sellout_amt = packer.GetDoublebyName("sellout_amt", i);
                reqCommand.quot_strike_qty = packer.GetDoublebyName("quot_strike_qty", i);
                reqCommand.quot_strike_amt = packer.GetDoublebyName("quot_strike_amt", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncrptL_2_316Models.Add(reqCommand);
            }
            return FuncrptL_2_316Models;
        }
 
        //逻辑_报表_报表数据_查询统计基金经理持仓
        public static List<FuncrptL_2_316Model> GetFuncrptL_2_316Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_2_316Models = new List<FuncrptL_2_316Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_2_316Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.fund_manager_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_NO_INT);
                    reqCommand.fund_manager_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_NAME_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.total_count = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_COUNT_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    reqCommand.begin_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_QTY_FLOAT);
                    reqCommand.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    reqCommand.frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_QTY_FLOAT);
                    reqCommand.unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_QTY_FLOAT);
                    reqCommand.total_stock_issue = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_STOCK_ISSUE_FLOAT);
                    reqCommand.circl_stock_capit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CIRCL_STOCK_CAPIT_FLOAT);
                    reqCommand.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                    reqCommand.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    reqCommand.intrst_cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_COST_AMT_FLOAT);
                    reqCommand.intrst_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_PANDL_FLOAT);
                    reqCommand.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    reqCommand.posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_MARKET_VALUE_FLOAT);
                    reqCommand.buy_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_QTY_FLOAT);
                    reqCommand.buy_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_AMT_FLOAT);
                    reqCommand.sell_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_QTY_FLOAT);
                    reqCommand.sellout_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELLOUT_AMT_FLOAT);
                    reqCommand.quot_strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_QUOT_STRIKE_QTY_FLOAT);
                    reqCommand.quot_strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_QUOT_STRIKE_AMT_FLOAT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncrptL_2_316Models.Add(reqCommand);
                }
            }
            return FuncrptL_2_316Models;
        }
 
        //逻辑_报表_报表数据_查询机构业绩报告配置
        public static List<FuncrptL_2_404Model> GetFuncrptL_2_404Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_2_404Models = new List<FuncrptL_2_404Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_2_404Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.config_no = packer.GetInt64byName("config_no", i);
                reqCommand.config_name = packer.GetStrbyName("config_name", i);
                reqCommand.show_order = packer.GetIntbyName("show_order", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncrptL_2_404Models.Add(reqCommand);
            }
            return FuncrptL_2_404Models;
        }
 
        //逻辑_报表_报表数据_查询机构业绩报告配置
        public static List<FuncrptL_2_404Model> GetFuncrptL_2_404Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_2_404Models = new List<FuncrptL_2_404Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_2_404Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.config_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_NO_INT64);
                    reqCommand.config_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_NAME_STR);
                    reqCommand.show_order = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SHOW_ORDER_INT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncrptL_2_404Models.Add(reqCommand);
                }
            }
            return FuncrptL_2_404Models;
        }
 
        //逻辑_报表_报表数据_查询产品业绩报告附加信息
        public static List<FuncrptL_2_409Model> GetFuncrptL_2_409Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_2_409Models = new List<FuncrptL_2_409Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_2_409Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.rpt_add_info = packer.GetStrbyName("rpt_add_info", i);
 
                FuncrptL_2_409Models.Add(reqCommand);
            }
            return FuncrptL_2_409Models;
        }
 
        //逻辑_报表_报表数据_查询产品业绩报告附加信息
        public static List<FuncrptL_2_409Model> GetFuncrptL_2_409Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_2_409Models = new List<FuncrptL_2_409Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_2_409Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.rpt_add_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RPT_ADD_INFO_STR);
                    FuncrptL_2_409Models.Add(reqCommand);
                }
            }
            return FuncrptL_2_409Models;
        }
 
        //逻辑_报表_报表数据_查询基金经理信息
        public static List<FuncrptL_2_414Model> GetFuncrptL_2_414Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_2_414Models = new List<FuncrptL_2_414Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_2_414Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.fund_manager_no = packer.GetIntbyName("fund_manager_no", i);
                reqCommand.fund_manager_name = packer.GetStrbyName("fund_manager_name", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncrptL_2_414Models.Add(reqCommand);
            }
            return FuncrptL_2_414Models;
        }
 
        //逻辑_报表_报表数据_查询基金经理信息
        public static List<FuncrptL_2_414Model> GetFuncrptL_2_414Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_2_414Models = new List<FuncrptL_2_414Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_2_414Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.fund_manager_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_NO_INT);
                    reqCommand.fund_manager_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_NAME_STR);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncrptL_2_414Models.Add(reqCommand);
                }
            }
            return FuncrptL_2_414Models;
        }
 
        //逻辑_报表_报表数据_查询交易员信息
        public static List<FuncrptL_2_419Model> GetFuncrptL_2_419Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_2_419Models = new List<FuncrptL_2_419Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_2_419Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.fund_manager_no = packer.GetIntbyName("fund_manager_no", i);
                reqCommand.fund_manager_name = packer.GetStrbyName("fund_manager_name", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncrptL_2_419Models.Add(reqCommand);
            }
            return FuncrptL_2_419Models;
        }
 
        //逻辑_报表_报表数据_查询交易员信息
        public static List<FuncrptL_2_419Model> GetFuncrptL_2_419Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_2_419Models = new List<FuncrptL_2_419Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_2_419Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.fund_manager_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_NO_INT);
                    reqCommand.fund_manager_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_NAME_STR);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncrptL_2_419Models.Add(reqCommand);
                }
            }
            return FuncrptL_2_419Models;
        }
 
        //逻辑_报表_报表数据_查询产品基金经理与交易员
        public static List<FuncrptL_2_424Model> GetFuncrptL_2_424Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_2_424Models = new List<FuncrptL_2_424Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_2_424Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.fund_manager_no = packer.GetIntbyName("fund_manager_no", i);
                reqCommand.fund_manager_name = packer.GetStrbyName("fund_manager_name", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncrptL_2_424Models.Add(reqCommand);
            }
            return FuncrptL_2_424Models;
        }
 
        //逻辑_报表_报表数据_查询产品基金经理与交易员
        public static List<FuncrptL_2_424Model> GetFuncrptL_2_424Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_2_424Models = new List<FuncrptL_2_424Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_2_424Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.fund_manager_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_NO_INT);
                    reqCommand.fund_manager_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_NAME_STR);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncrptL_2_424Models.Add(reqCommand);
                }
            }
            return FuncrptL_2_424Models;
        }
 
        //逻辑_报表_报表数据_查询产品持仓导入外部交割流水
        public static List<FuncrptL_2_428Model> GetFuncrptL_2_428Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_2_428Models = new List<FuncrptL_2_428Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_2_428Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
                reqCommand.pass_deli_jour_no = packer.GetInt64byName("pass_deli_jour_no", i);
                reqCommand.strike_date = packer.GetIntbyName("strike_date", i);
                reqCommand.strike_time = packer.GetIntbyName("strike_time", i);
                reqCommand.strike_no = packer.GetStrbyName("strike_no", i);
                reqCommand.report_date = packer.GetIntbyName("report_date", i);
                reqCommand.report_time = packer.GetIntbyName("report_time", i);
                reqCommand.report_no = packer.GetStrbyName("report_no", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_acco = packer.GetStrbyName("stock_acco", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.order_price = packer.GetDoublebyName("order_price", i);
                reqCommand.order_qty = packer.GetDoublebyName("order_qty", i);
                reqCommand.strike_price = packer.GetDoublebyName("strike_price", i);
                reqCommand.strike_qty = packer.GetDoublebyName("strike_qty", i);
                reqCommand.strike_amt = packer.GetDoublebyName("strike_amt", i);
                reqCommand.strike_num = packer.GetIntbyName("strike_num", i);
                reqCommand.entry_end_qty = packer.GetDoublebyName("entry_end_qty", i);
                reqCommand.entry_end_amt = packer.GetDoublebyName("entry_end_amt", i);
                reqCommand.out_all_fee = packer.GetDoublebyName("out_all_fee", i);
                reqCommand.out_stamp_tax = packer.GetDoublebyName("out_stamp_tax", i);
                reqCommand.out_trans_fee = packer.GetDoublebyName("out_trans_fee", i);
                reqCommand.out_brkage = packer.GetDoublebyName("out_brkage", i);
                reqCommand.out_SEC_charges = packer.GetDoublebyName("out_SEC_charges", i);
                reqCommand.out_other_fee = packer.GetDoublebyName("out_other_fee", i);
                reqCommand.out_brkage_commis = packer.GetDoublebyName("out_brkage_commis", i);
                reqCommand.out_chann_commis = packer.GetDoublebyName("out_chann_commis", i);
                reqCommand.out_divi_commis = packer.GetDoublebyName("out_divi_commis", i);
                reqCommand.out_other_commis = packer.GetDoublebyName("out_other_commis", i);
                reqCommand.busi_flag = packer.GetIntbyName("busi_flag", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncrptL_2_428Models.Add(reqCommand);
            }
            return FuncrptL_2_428Models;
        }
 
        //逻辑_报表_报表数据_查询产品持仓导入外部交割流水
        public static List<FuncrptL_2_428Model> GetFuncrptL_2_428Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_2_428Models = new List<FuncrptL_2_428Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_2_428Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    reqCommand.pass_deli_jour_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_PASS_DELI_JOUR_NO_INT64);
                    reqCommand.strike_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT);
                    reqCommand.strike_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_TIME_INT);
                    reqCommand.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                    reqCommand.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                    reqCommand.report_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_TIME_INT);
                    reqCommand.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    reqCommand.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    reqCommand.strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_PRICE_FLOAT);
                    reqCommand.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    reqCommand.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    reqCommand.strike_num = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NUM_INT);
                    reqCommand.entry_end_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_END_QTY_FLOAT);
                    reqCommand.entry_end_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_END_AMT_FLOAT);
                    reqCommand.out_all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ALL_FEE_FLOAT);
                    reqCommand.out_stamp_tax = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_STAMP_TAX_FLOAT);
                    reqCommand.out_trans_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_TRANS_FEE_FLOAT);
                    reqCommand.out_brkage = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_BRKAGE_FLOAT);
                    reqCommand.out_SEC_charges = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_SEC_CHARGES_FLOAT);
                    reqCommand.out_other_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_OTHER_FEE_FLOAT);
                    reqCommand.out_brkage_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_BRKAGE_COMMIS_FLOAT);
                    reqCommand.out_chann_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_CHANN_COMMIS_FLOAT);
                    reqCommand.out_divi_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_DIVI_COMMIS_FLOAT);
                    reqCommand.out_other_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_OTHER_COMMIS_FLOAT);
                    reqCommand.busi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncrptL_2_428Models.Add(reqCommand);
                }
            }
            return FuncrptL_2_428Models;
        }
 
    }
}
