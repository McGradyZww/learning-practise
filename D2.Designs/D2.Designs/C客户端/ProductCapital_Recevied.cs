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

    public static class ProductCapital
    {
        //逻辑_产品_资金_查询产品资金
        public static List<FuncprodL_3_4Model> GetFuncprodL_3_4Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncprodL_3_4Models = new List<FuncprodL_3_4Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncprodL_3_4Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.update_date = packer.GetIntbyName("update_date", i);
                reqCommand.update_time = packer.GetIntbyName("update_time", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.begin_amt = packer.GetDoublebyName("begin_amt", i);
                reqCommand.first_amt = packer.GetDoublebyName("first_amt", i);
                reqCommand.curr_amt = packer.GetDoublebyName("curr_amt", i);
                reqCommand.pd_dist_amt = packer.GetDoublebyName("pd_dist_amt", i);
                reqCommand.pd_auth_amt = packer.GetDoublebyName("pd_auth_amt", i);
                reqCommand.amt_check_diff = packer.GetDoublebyName("amt_check_diff", i);
                reqCommand.pre_settle_amt = packer.GetDoublebyName("pre_settle_amt", i);
                reqCommand.total_cash_divide = packer.GetDoublebyName("total_cash_divide", i);
                reqCommand.total_pre_fee = packer.GetDoublebyName("total_pre_fee", i);
                reqCommand.total_rece_amt = packer.GetDoublebyName("total_rece_amt", i);
                reqCommand.total_payab_amt = packer.GetDoublebyName("total_payab_amt", i);
                reqCommand.total_change_amt = packer.GetDoublebyName("total_change_amt", i);
                reqCommand.intrst_cacl_amt = packer.GetDoublebyName("intrst_cacl_amt", i);
                reqCommand.pre_entry_intrst_amt = packer.GetDoublebyName("pre_entry_intrst_amt", i);
 
                FuncprodL_3_4Models.Add(reqCommand);
            }
            return FuncprodL_3_4Models;
        }
 
        //逻辑_产品_资金_查询产品资金
        public static List<FuncprodL_3_4Model> GetFuncprodL_3_4Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncprodL_3_4Models = new List<FuncprodL_3_4Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncprodL_3_4Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    reqCommand.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    reqCommand.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    reqCommand.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.begin_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_AMT_FLOAT);
                    reqCommand.first_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FIRST_AMT_FLOAT);
                    reqCommand.curr_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_AMT_FLOAT);
                    reqCommand.pd_dist_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_DIST_AMT_FLOAT);
                    reqCommand.pd_auth_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_AUTH_AMT_FLOAT);
                    reqCommand.amt_check_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_CHECK_DIFF_FLOAT);
                    reqCommand.pre_settle_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SETTLE_AMT_FLOAT);
                    reqCommand.total_cash_divide = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_CASH_DIVIDE_FLOAT);
                    reqCommand.total_pre_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_PRE_FEE_FLOAT);
                    reqCommand.total_rece_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_RECE_AMT_FLOAT);
                    reqCommand.total_payab_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_PAYAB_AMT_FLOAT);
                    reqCommand.total_change_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_CHANGE_AMT_FLOAT);
                    reqCommand.intrst_cacl_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_CACL_AMT_FLOAT);
                    reqCommand.pre_entry_intrst_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ENTRY_INTRST_AMT_FLOAT);
                    FuncprodL_3_4Models.Add(reqCommand);
                }
            }
            return FuncprodL_3_4Models;
        }
 
        //逻辑_产品_资金_查询产品资金流水
        public static List<FuncprodL_3_5Model> GetFuncprodL_3_5Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncprodL_3_5Models = new List<FuncprodL_3_5Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncprodL_3_5Model();
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
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.busi_flag = packer.GetIntbyName("busi_flag", i);
                reqCommand.occur_amt = packer.GetDoublebyName("occur_amt", i);
                reqCommand.occur_end_amt = packer.GetDoublebyName("occur_end_amt", i);
                reqCommand.jour_occur_field = packer.GetStrbyName("jour_occur_field", i);
                reqCommand.jour_after_occur_info = packer.GetStrbyName("jour_after_occur_info", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncprodL_3_5Models.Add(reqCommand);
            }
            return FuncprodL_3_5Models;
        }
 
        //逻辑_产品_资金_查询产品资金流水
        public static List<FuncprodL_3_5Model> GetFuncprodL_3_5Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncprodL_3_5Models = new List<FuncprodL_3_5Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncprodL_3_5Model();
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
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.busi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT);
                    reqCommand.occur_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_AMT_FLOAT);
                    reqCommand.occur_end_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_END_AMT_FLOAT);
                    reqCommand.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    reqCommand.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncprodL_3_5Models.Add(reqCommand);
                }
            }
            return FuncprodL_3_5Models;
        }
 
        //逻辑_产品_资金_查询历史产品资金流水
        public static List<FuncprodL_3_6Model> GetFuncprodL_3_6Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncprodL_3_6Models = new List<FuncprodL_3_6Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncprodL_3_6Model();
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
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.busi_flag = packer.GetIntbyName("busi_flag", i);
                reqCommand.occur_amt = packer.GetDoublebyName("occur_amt", i);
                reqCommand.occur_end_amt = packer.GetDoublebyName("occur_end_amt", i);
                reqCommand.jour_occur_field = packer.GetStrbyName("jour_occur_field", i);
                reqCommand.jour_after_occur_info = packer.GetStrbyName("jour_after_occur_info", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncprodL_3_6Models.Add(reqCommand);
            }
            return FuncprodL_3_6Models;
        }
 
        //逻辑_产品_资金_查询历史产品资金流水
        public static List<FuncprodL_3_6Model> GetFuncprodL_3_6Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncprodL_3_6Models = new List<FuncprodL_3_6Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncprodL_3_6Model();
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
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.busi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT);
                    reqCommand.occur_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_AMT_FLOAT);
                    reqCommand.occur_end_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_END_AMT_FLOAT);
                    reqCommand.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    reqCommand.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncprodL_3_6Models.Add(reqCommand);
                }
            }
            return FuncprodL_3_6Models;
        }
 
        //逻辑_产品_资金_查询产品资产
        public static List<FuncprodL_3_21Model> GetFuncprodL_3_21Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncprodL_3_21Models = new List<FuncprodL_3_21Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncprodL_3_21Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.begin_evalu_nav_asset = packer.GetDoublebyName("begin_evalu_nav_asset", i);
                reqCommand.evalu_nav_asset = packer.GetDoublebyName("evalu_nav_asset", i);
                reqCommand.begin_NAV = packer.GetDoublebyName("begin_NAV", i);
                reqCommand.nav_asset = packer.GetDoublebyName("nav_asset", i);
                reqCommand.total_cash_asset = packer.GetDoublebyName("total_cash_asset", i);
                reqCommand.stock_cash_asset = packer.GetDoublebyName("stock_cash_asset", i);
                reqCommand.futu_cash_asset = packer.GetDoublebyName("futu_cash_asset", i);
                reqCommand.stock_asset = packer.GetDoublebyName("stock_asset", i);
                reqCommand.fund_asset = packer.GetDoublebyName("fund_asset", i);
                reqCommand.money_fund_asset = packer.GetDoublebyName("money_fund_asset", i);
                reqCommand.not_money_fund_asset = packer.GetDoublebyName("not_money_fund_asset", i);
                reqCommand.bond_asset = packer.GetDoublebyName("bond_asset", i);
                reqCommand.futu_asset = packer.GetDoublebyName("futu_asset", i);
                reqCommand.repo_asset = packer.GetDoublebyName("repo_asset", i);
                reqCommand.other_asset = packer.GetDoublebyName("other_asset", i);
                reqCommand.hk_thrgh_stock_asset = packer.GetDoublebyName("hk_thrgh_stock_asset", i);
                reqCommand.futu_long_market_value = packer.GetDoublebyName("futu_long_market_value", i);
                reqCommand.futu_short_market_value = packer.GetDoublebyName("futu_short_market_value", i);
                reqCommand.curr_share = packer.GetDoublebyName("curr_share", i);
                reqCommand.pre_share = packer.GetDoublebyName("pre_share", i);
 
                FuncprodL_3_21Models.Add(reqCommand);
            }
            return FuncprodL_3_21Models;
        }
 
        //逻辑_产品_资金_查询产品资产
        public static List<FuncprodL_3_21Model> GetFuncprodL_3_21Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncprodL_3_21Models = new List<FuncprodL_3_21Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncprodL_3_21Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.begin_evalu_nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_EVALU_NAV_ASSET_FLOAT);
                    reqCommand.evalu_nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_EVALU_NAV_ASSET_FLOAT);
                    reqCommand.begin_NAV = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_NAV_FLOAT);
                    reqCommand.nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT);
                    reqCommand.total_cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_CASH_ASSET_FLOAT);
                    reqCommand.stock_cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CASH_ASSET_FLOAT);
                    reqCommand.futu_cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_CASH_ASSET_FLOAT);
                    reqCommand.stock_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_FLOAT);
                    reqCommand.fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_ASSET_FLOAT);
                    reqCommand.money_fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MONEY_FUND_ASSET_FLOAT);
                    reqCommand.not_money_fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NOT_MONEY_FUND_ASSET_FLOAT);
                    reqCommand.bond_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ASSET_FLOAT);
                    reqCommand.futu_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ASSET_FLOAT);
                    reqCommand.repo_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPO_ASSET_FLOAT);
                    reqCommand.other_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_ASSET_FLOAT);
                    reqCommand.hk_thrgh_stock_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HK_THRGH_STOCK_ASSET_FLOAT);
                    reqCommand.futu_long_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_LONG_MARKET_VALUE_FLOAT);
                    reqCommand.futu_short_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_SHORT_MARKET_VALUE_FLOAT);
                    reqCommand.curr_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_SHARE_FLOAT);
                    reqCommand.pre_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SHARE_FLOAT);
                    FuncprodL_3_21Models.Add(reqCommand);
                }
            }
            return FuncprodL_3_21Models;
        }
 
        //逻辑_产品_资金_查询历史产品资产
        public static List<FuncprodL_3_22Model> GetFuncprodL_3_22Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncprodL_3_22Models = new List<FuncprodL_3_22Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncprodL_3_22Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.begin_NAV = packer.GetDoublebyName("begin_NAV", i);
                reqCommand.nav_asset = packer.GetDoublebyName("nav_asset", i);
                reqCommand.total_cash_asset = packer.GetDoublebyName("total_cash_asset", i);
                reqCommand.stock_cash_asset = packer.GetDoublebyName("stock_cash_asset", i);
                reqCommand.futu_cash_asset = packer.GetDoublebyName("futu_cash_asset", i);
                reqCommand.stock_asset = packer.GetDoublebyName("stock_asset", i);
                reqCommand.fund_asset = packer.GetDoublebyName("fund_asset", i);
                reqCommand.money_fund_asset = packer.GetDoublebyName("money_fund_asset", i);
                reqCommand.not_money_fund_asset = packer.GetDoublebyName("not_money_fund_asset", i);
                reqCommand.bond_asset = packer.GetDoublebyName("bond_asset", i);
                reqCommand.futu_asset = packer.GetDoublebyName("futu_asset", i);
                reqCommand.repo_asset = packer.GetDoublebyName("repo_asset", i);
                reqCommand.other_asset = packer.GetDoublebyName("other_asset", i);
                reqCommand.hk_thrgh_stock_asset = packer.GetDoublebyName("hk_thrgh_stock_asset", i);
                reqCommand.futu_long_market_value = packer.GetDoublebyName("futu_long_market_value", i);
                reqCommand.futu_short_market_value = packer.GetDoublebyName("futu_short_market_value", i);
                reqCommand.curr_share = packer.GetDoublebyName("curr_share", i);
                reqCommand.pre_share = packer.GetDoublebyName("pre_share", i);
 
                FuncprodL_3_22Models.Add(reqCommand);
            }
            return FuncprodL_3_22Models;
        }
 
        //逻辑_产品_资金_查询历史产品资产
        public static List<FuncprodL_3_22Model> GetFuncprodL_3_22Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncprodL_3_22Models = new List<FuncprodL_3_22Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncprodL_3_22Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.begin_NAV = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_NAV_FLOAT);
                    reqCommand.nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT);
                    reqCommand.total_cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_CASH_ASSET_FLOAT);
                    reqCommand.stock_cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CASH_ASSET_FLOAT);
                    reqCommand.futu_cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_CASH_ASSET_FLOAT);
                    reqCommand.stock_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_FLOAT);
                    reqCommand.fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_ASSET_FLOAT);
                    reqCommand.money_fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MONEY_FUND_ASSET_FLOAT);
                    reqCommand.not_money_fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NOT_MONEY_FUND_ASSET_FLOAT);
                    reqCommand.bond_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ASSET_FLOAT);
                    reqCommand.futu_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ASSET_FLOAT);
                    reqCommand.repo_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPO_ASSET_FLOAT);
                    reqCommand.other_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_ASSET_FLOAT);
                    reqCommand.hk_thrgh_stock_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HK_THRGH_STOCK_ASSET_FLOAT);
                    reqCommand.futu_long_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_LONG_MARKET_VALUE_FLOAT);
                    reqCommand.futu_short_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_SHORT_MARKET_VALUE_FLOAT);
                    reqCommand.curr_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_SHARE_FLOAT);
                    reqCommand.pre_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SHARE_FLOAT);
                    FuncprodL_3_22Models.Add(reqCommand);
                }
            }
            return FuncprodL_3_22Models;
        }
 
        //逻辑_产品_资金_查询银行账户资金
        public static List<FuncprodL_3_74Model> GetFuncprodL_3_74Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncprodL_3_74Models = new List<FuncprodL_3_74Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncprodL_3_74Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.update_date = packer.GetIntbyName("update_date", i);
                reqCommand.update_time = packer.GetIntbyName("update_time", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.bank_acco_no = packer.GetIntbyName("bank_acco_no", i);
                reqCommand.bank_name = packer.GetStrbyName("bank_name", i);
                reqCommand.bank_acco = packer.GetStrbyName("bank_acco", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.curr_amt = packer.GetDoublebyName("curr_amt", i);
                reqCommand.intrst_rate = packer.GetDoublebyName("intrst_rate", i);
                reqCommand.intrst_base_amt = packer.GetDoublebyName("intrst_base_amt", i);
                reqCommand.pre_entry_intrst_amt = packer.GetDoublebyName("pre_entry_intrst_amt", i);
 
                FuncprodL_3_74Models.Add(reqCommand);
            }
            return FuncprodL_3_74Models;
        }
 
        //逻辑_产品_资金_查询银行账户资金
        public static List<FuncprodL_3_74Model> GetFuncprodL_3_74Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncprodL_3_74Models = new List<FuncprodL_3_74Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncprodL_3_74Model();
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
                    reqCommand.bank_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BANK_NAME_STR);
                    reqCommand.bank_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BANK_ACCO_STR);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.curr_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_AMT_FLOAT);
                    reqCommand.intrst_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_RATE_FLOAT);
                    reqCommand.intrst_base_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_BASE_AMT_FLOAT);
                    reqCommand.pre_entry_intrst_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ENTRY_INTRST_AMT_FLOAT);
                    FuncprodL_3_74Models.Add(reqCommand);
                }
            }
            return FuncprodL_3_74Models;
        }
 
        //逻辑_产品_资金_查询历史银行账户资金
        public static List<FuncprodL_3_75Model> GetFuncprodL_3_75Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncprodL_3_75Models = new List<FuncprodL_3_75Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncprodL_3_75Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.update_date = packer.GetIntbyName("update_date", i);
                reqCommand.update_time = packer.GetIntbyName("update_time", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.bank_acco_no = packer.GetIntbyName("bank_acco_no", i);
                reqCommand.bank_name = packer.GetStrbyName("bank_name", i);
                reqCommand.bank_acco = packer.GetStrbyName("bank_acco", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.curr_amt = packer.GetDoublebyName("curr_amt", i);
                reqCommand.intrst_rate = packer.GetDoublebyName("intrst_rate", i);
                reqCommand.intrst_base_amt = packer.GetDoublebyName("intrst_base_amt", i);
                reqCommand.pre_entry_intrst_amt = packer.GetDoublebyName("pre_entry_intrst_amt", i);
 
                FuncprodL_3_75Models.Add(reqCommand);
            }
            return FuncprodL_3_75Models;
        }
 
        //逻辑_产品_资金_查询历史银行账户资金
        public static List<FuncprodL_3_75Model> GetFuncprodL_3_75Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncprodL_3_75Models = new List<FuncprodL_3_75Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncprodL_3_75Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    reqCommand.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    reqCommand.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    reqCommand.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.bank_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BANK_ACCO_NO_INT);
                    reqCommand.bank_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BANK_NAME_STR);
                    reqCommand.bank_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BANK_ACCO_STR);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.curr_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_AMT_FLOAT);
                    reqCommand.intrst_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_RATE_FLOAT);
                    reqCommand.intrst_base_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_BASE_AMT_FLOAT);
                    reqCommand.pre_entry_intrst_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ENTRY_INTRST_AMT_FLOAT);
                    FuncprodL_3_75Models.Add(reqCommand);
                }
            }
            return FuncprodL_3_75Models;
        }
 
        //逻辑_产品_资金_查询银行账户资金流水
        public static List<FuncprodL_3_76Model> GetFuncprodL_3_76Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncprodL_3_76Models = new List<FuncprodL_3_76Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncprodL_3_76Model();
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
                reqCommand.bank_name = packer.GetStrbyName("bank_name", i);
                reqCommand.bank_acco = packer.GetStrbyName("bank_acco", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.busi_flag = packer.GetIntbyName("busi_flag", i);
                reqCommand.occur_amt = packer.GetDoublebyName("occur_amt", i);
                reqCommand.occur_end_amt = packer.GetDoublebyName("occur_end_amt", i);
                reqCommand.jour_occur_field = packer.GetStrbyName("jour_occur_field", i);
                reqCommand.jour_after_occur_info = packer.GetStrbyName("jour_after_occur_info", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncprodL_3_76Models.Add(reqCommand);
            }
            return FuncprodL_3_76Models;
        }
 
        //逻辑_产品_资金_查询银行账户资金流水
        public static List<FuncprodL_3_76Model> GetFuncprodL_3_76Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncprodL_3_76Models = new List<FuncprodL_3_76Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncprodL_3_76Model();
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
                    reqCommand.bank_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BANK_NAME_STR);
                    reqCommand.bank_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BANK_ACCO_STR);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.busi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT);
                    reqCommand.occur_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_AMT_FLOAT);
                    reqCommand.occur_end_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_END_AMT_FLOAT);
                    reqCommand.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    reqCommand.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncprodL_3_76Models.Add(reqCommand);
                }
            }
            return FuncprodL_3_76Models;
        }
 
        //逻辑_产品_资金_查询历史银行账户资金流水
        public static List<FuncprodL_3_77Model> GetFuncprodL_3_77Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncprodL_3_77Models = new List<FuncprodL_3_77Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncprodL_3_77Model();
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
                reqCommand.bank_name = packer.GetStrbyName("bank_name", i);
                reqCommand.bank_acco = packer.GetStrbyName("bank_acco", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.busi_flag = packer.GetIntbyName("busi_flag", i);
                reqCommand.occur_amt = packer.GetDoublebyName("occur_amt", i);
                reqCommand.occur_end_amt = packer.GetDoublebyName("occur_end_amt", i);
                reqCommand.jour_occur_field = packer.GetStrbyName("jour_occur_field", i);
                reqCommand.jour_after_occur_info = packer.GetStrbyName("jour_after_occur_info", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncprodL_3_77Models.Add(reqCommand);
            }
            return FuncprodL_3_77Models;
        }
 
        //逻辑_产品_资金_查询历史银行账户资金流水
        public static List<FuncprodL_3_77Model> GetFuncprodL_3_77Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncprodL_3_77Models = new List<FuncprodL_3_77Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncprodL_3_77Model();
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
                    reqCommand.bank_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BANK_NAME_STR);
                    reqCommand.bank_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BANK_ACCO_STR);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.busi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT);
                    reqCommand.occur_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_AMT_FLOAT);
                    reqCommand.occur_end_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_END_AMT_FLOAT);
                    reqCommand.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    reqCommand.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncprodL_3_77Models.Add(reqCommand);
                }
            }
            return FuncprodL_3_77Models;
        }
 
    }
}
