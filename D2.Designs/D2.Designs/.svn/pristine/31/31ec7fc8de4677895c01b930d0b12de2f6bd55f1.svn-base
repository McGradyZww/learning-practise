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

    public static class RptQuery
    {
        //逻辑_报表_报表查询_查询报表单产品收益率
        public static List<FuncrptL_3_1Model> GetFuncrptL_3_1Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_3_1Models = new List<FuncrptL_3_1Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_3_1Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_code = packer.GetStrbyName("pd_code", i);
                reqCommand.pd_name = packer.GetStrbyName("pd_name", i);
                reqCommand.found_date = packer.GetIntbyName("found_date", i);
                reqCommand.runtime = packer.GetIntbyName("runtime", i);
                reqCommand.unit_nav = packer.GetDoublebyName("unit_nav", i);
                reqCommand.daily_pandl_ratio = packer.GetDoublebyName("daily_pandl_ratio", i);
                reqCommand.daily_pandl_ratio_year = packer.GetDoublebyName("daily_pandl_ratio_year", i);
                reqCommand.total_unit_nav = packer.GetDoublebyName("total_unit_nav", i);
                reqCommand.total_realiz_pandl_ratio = packer.GetDoublebyName("total_realiz_pandl_ratio", i);
                reqCommand.total_realize_pandl_ratio_year = packer.GetDoublebyName("total_realize_pandl_ratio_year", i);
                reqCommand.excess_earning_year = packer.GetDoublebyName("excess_earning_year", i);
                reqCommand.day_retracement = packer.GetDoublebyName("day_retracement", i);
                reqCommand.day_continue_retracement = packer.GetDoublebyName("day_continue_retracement", i);
 
                FuncrptL_3_1Models.Add(reqCommand);
            }
            return FuncrptL_3_1Models;
        }
 
        //逻辑_报表_报表查询_查询报表单产品收益率
        public static List<FuncrptL_3_1Model> GetFuncrptL_3_1Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_3_1Models = new List<FuncrptL_3_1Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_3_1Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    reqCommand.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    reqCommand.found_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FOUND_DATE_INT);
                    reqCommand.runtime = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RUNTIME_INT);
                    reqCommand.unit_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_NAV_FLOAT);
                    reqCommand.daily_pandl_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DAILY_PANDL_RATIO_FLOAT);
                    reqCommand.daily_pandl_ratio_year = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DAILY_PANDL_RATIO_YEAR_FLOAT);
                    reqCommand.total_unit_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_UNIT_NAV_FLOAT);
                    reqCommand.total_realiz_pandl_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_REALIZ_PANDL_RATIO_FLOAT);
                    reqCommand.total_realize_pandl_ratio_year = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_REALIZE_PANDL_RATIO_YEAR_FLOAT);
                    reqCommand.excess_earning_year = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_EXCESS_EARNING_YEAR_FLOAT);
                    reqCommand.day_retracement = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DAY_RETRACEMENT_FLOAT);
                    reqCommand.day_continue_retracement = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DAY_CONTINUE_RETRACEMENT_FLOAT);
                    FuncrptL_3_1Models.Add(reqCommand);
                }
            }
            return FuncrptL_3_1Models;
        }
 
        //逻辑_报表_报表查询_查询报表收益率分析
        public static List<FuncrptL_3_2Model> GetFuncrptL_3_2Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_3_2Models = new List<FuncrptL_3_2Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_3_2Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_code = packer.GetStrbyName("pd_code", i);
                reqCommand.pd_name = packer.GetStrbyName("pd_name", i);
                reqCommand.unit_nav = packer.GetDoublebyName("unit_nav", i);
                reqCommand.daily_pandl_ratio = packer.GetDoublebyName("daily_pandl_ratio", i);
                reqCommand.total_realize_pandl_ratio_year = packer.GetDoublebyName("total_realize_pandl_ratio_year", i);
                reqCommand.sharpe_ration = packer.GetDoublebyName("sharpe_ration", i);
                reqCommand.max_retracement = packer.GetDoublebyName("max_retracement", i);
                reqCommand.market_value_sh = packer.GetDoublebyName("market_value_sh", i);
                reqCommand.market_value_avg_sh = packer.GetDoublebyName("market_value_avg_sh", i);
                reqCommand.sh_remainday_two = packer.GetIntbyName("sh_remainday_two", i);
                reqCommand.sh_remainday_three = packer.GetIntbyName("sh_remainday_three", i);
                reqCommand.sh_remainday_five = packer.GetIntbyName("sh_remainday_five", i);
                reqCommand.market_value_sz = packer.GetDoublebyName("market_value_sz", i);
                reqCommand.market_value_avg_sz = packer.GetDoublebyName("market_value_avg_sz", i);
                reqCommand.sz_remainday_two = packer.GetIntbyName("sz_remainday_two", i);
                reqCommand.sz_remainday_three = packer.GetIntbyName("sz_remainday_three", i);
                reqCommand.sz_remainday_five = packer.GetIntbyName("sz_remainday_five", i);
 
                FuncrptL_3_2Models.Add(reqCommand);
            }
            return FuncrptL_3_2Models;
        }
 
        //逻辑_报表_报表查询_查询报表收益率分析
        public static List<FuncrptL_3_2Model> GetFuncrptL_3_2Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_3_2Models = new List<FuncrptL_3_2Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_3_2Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    reqCommand.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    reqCommand.unit_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_NAV_FLOAT);
                    reqCommand.daily_pandl_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DAILY_PANDL_RATIO_FLOAT);
                    reqCommand.total_realize_pandl_ratio_year = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_REALIZE_PANDL_RATIO_YEAR_FLOAT);
                    reqCommand.sharpe_ration = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SHARPE_RATION_FLOAT);
                    reqCommand.max_retracement = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_RETRACEMENT_FLOAT);
                    reqCommand.market_value_sh = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_VALUE_SH_FLOAT);
                    reqCommand.market_value_avg_sh = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_VALUE_AVG_SH_FLOAT);
                    reqCommand.sh_remainday_two = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SH_REMAINDAY_TWO_INT);
                    reqCommand.sh_remainday_three = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SH_REMAINDAY_THREE_INT);
                    reqCommand.sh_remainday_five = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SH_REMAINDAY_FIVE_INT);
                    reqCommand.market_value_sz = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_VALUE_SZ_FLOAT);
                    reqCommand.market_value_avg_sz = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_VALUE_AVG_SZ_FLOAT);
                    reqCommand.sz_remainday_two = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SZ_REMAINDAY_TWO_INT);
                    reqCommand.sz_remainday_three = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SZ_REMAINDAY_THREE_INT);
                    reqCommand.sz_remainday_five = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SZ_REMAINDAY_FIVE_INT);
                    FuncrptL_3_2Models.Add(reqCommand);
                }
            }
            return FuncrptL_3_2Models;
        }
 
        //逻辑_报表_报表查询_查询报表产品资产记录
        public static List<FuncrptL_3_3Model> GetFuncrptL_3_3Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_3_3Models = new List<FuncrptL_3_3Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_3_3Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.mach_date = packer.GetIntbyName("mach_date", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_code = packer.GetStrbyName("pd_code", i);
                reqCommand.pd_name = packer.GetStrbyName("pd_name", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.pd_curr_share = packer.GetDoublebyName("pd_curr_share", i);
                reqCommand.unit_nav = packer.GetDoublebyName("unit_nav", i);
                reqCommand.nav_asset = packer.GetDoublebyName("nav_asset", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncrptL_3_3Models.Add(reqCommand);
            }
            return FuncrptL_3_3Models;
        }
 
        //逻辑_报表_报表查询_查询报表产品资产记录
        public static List<FuncrptL_3_3Model> GetFuncrptL_3_3Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_3_3Models = new List<FuncrptL_3_3Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_3_3Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.mach_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MACH_DATE_INT);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    reqCommand.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.pd_curr_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_CURR_SHARE_FLOAT);
                    reqCommand.unit_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_NAV_FLOAT);
                    reqCommand.nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncrptL_3_3Models.Add(reqCommand);
                }
            }
            return FuncrptL_3_3Models;
        }
 
        //逻辑_报表_报表查询_查询报表产品净值回报率
        public static List<FuncrptL_3_4Model> GetFuncrptL_3_4Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_3_4Models = new List<FuncrptL_3_4Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_3_4Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.region_no = packer.GetIntbyName("region_no", i);
                reqCommand.region_name = packer.GetStrbyName("region_name", i);
                reqCommand.product_return_rate = packer.GetDoublebyName("product_return_rate", i);
                reqCommand.max_product_increase = packer.GetDoublebyName("max_product_increase", i);
                reqCommand.cmp_product_return_rate = packer.GetDoublebyName("cmp_product_return_rate", i);
 
                FuncrptL_3_4Models.Add(reqCommand);
            }
            return FuncrptL_3_4Models;
        }
 
        //逻辑_报表_报表查询_查询报表产品净值回报率
        public static List<FuncrptL_3_4Model> GetFuncrptL_3_4Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_3_4Models = new List<FuncrptL_3_4Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_3_4Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.region_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REGION_NO_INT);
                    reqCommand.region_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REGION_NAME_STR);
                    reqCommand.product_return_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRODUCT_RETURN_RATE_FLOAT);
                    reqCommand.max_product_increase = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_PRODUCT_INCREASE_FLOAT);
                    reqCommand.cmp_product_return_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CMP_PRODUCT_RETURN_RATE_FLOAT);
                    FuncrptL_3_4Models.Add(reqCommand);
                }
            }
            return FuncrptL_3_4Models;
        }
 
        //逻辑_报表_报表查询_查询报表产品资产明细汇总统计历史记录
        public static List<FuncrptL_3_6Model> GetFuncrptL_3_6Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_3_6Models = new List<FuncrptL_3_6Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_3_6Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_asset_type = packer.GetIntbyName("pd_asset_type", i);
                reqCommand.pd_code = packer.GetStrbyName("pd_code", i);
                reqCommand.pd_name = packer.GetStrbyName("pd_name", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_name = packer.GetStrbyName("stock_name", i);
                reqCommand.last_price = packer.GetDoublebyName("last_price", i);
                reqCommand.curr_qty = packer.GetDoublebyName("curr_qty", i);
                reqCommand.cost_amt = packer.GetDoublebyName("cost_amt", i);
                reqCommand.stop_status = packer.GetStrbyName("stop_status", i);
                reqCommand.circl_flag = packer.GetIntbyName("circl_flag", i);
                reqCommand.today_pandl = packer.GetDoublebyName("today_pandl", i);
 
                FuncrptL_3_6Models.Add(reqCommand);
            }
            return FuncrptL_3_6Models;
        }
 
        //逻辑_报表_报表查询_查询报表产品资产明细汇总统计历史记录
        public static List<FuncrptL_3_6Model> GetFuncrptL_3_6Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_3_6Models = new List<FuncrptL_3_6Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_3_6Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_ASSET_TYPE_INT);
                    reqCommand.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    reqCommand.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    reqCommand.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    reqCommand.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    reqCommand.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                    reqCommand.stop_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOP_STATUS_STR);
                    reqCommand.circl_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CIRCL_FLAG_INT);
                    reqCommand.today_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_PANDL_FLOAT);
                    FuncrptL_3_6Models.Add(reqCommand);
                }
            }
            return FuncrptL_3_6Models;
        }
 
        //逻辑_报表_报表查询_查询周净值累变报表
        public static List<FuncrptL_3_7Model> GetFuncrptL_3_7Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_3_7Models = new List<FuncrptL_3_7Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_3_7Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_code = packer.GetStrbyName("pd_code", i);
                reqCommand.pd_name = packer.GetStrbyName("pd_name", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.total_asset = packer.GetDoublebyName("total_asset", i);
                reqCommand.stock_market_value = packer.GetDoublebyName("stock_market_value", i);
                reqCommand.pd_share = packer.GetDoublebyName("pd_share", i);
                reqCommand.unit_nav = packer.GetDoublebyName("unit_nav", i);
                reqCommand.week_nav_change = packer.GetDoublebyName("week_nav_change", i);
                reqCommand.day_nav_change = packer.GetDoublebyName("day_nav_change", i);
                reqCommand.cash_asset = packer.GetDoublebyName("cash_asset", i);
                reqCommand.cash_nav_ratio = packer.GetDoublebyName("cash_nav_ratio", i);
                reqCommand.stock_asset_ratio = packer.GetDoublebyName("stock_asset_ratio", i);
 
                FuncrptL_3_7Models.Add(reqCommand);
            }
            return FuncrptL_3_7Models;
        }
 
        //逻辑_报表_报表查询_查询周净值累变报表
        public static List<FuncrptL_3_7Model> GetFuncrptL_3_7Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_3_7Models = new List<FuncrptL_3_7Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_3_7Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    reqCommand.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.total_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_ASSET_FLOAT);
                    reqCommand.stock_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_MARKET_VALUE_FLOAT);
                    reqCommand.pd_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_SHARE_FLOAT);
                    reqCommand.unit_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_NAV_FLOAT);
                    reqCommand.week_nav_change = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WEEK_NAV_CHANGE_FLOAT);
                    reqCommand.day_nav_change = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DAY_NAV_CHANGE_FLOAT);
                    reqCommand.cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_ASSET_FLOAT);
                    reqCommand.cash_nav_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_NAV_RATIO_FLOAT);
                    reqCommand.stock_asset_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_RATIO_FLOAT);
                    FuncrptL_3_7Models.Add(reqCommand);
                }
            }
            return FuncrptL_3_7Models;
        }
 
        //逻辑_报表_报表查询_查询产品详情信息
        public static List<FuncrptL_3_8Model> GetFuncrptL_3_8Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_3_8Models = new List<FuncrptL_3_8Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_3_8Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_code = packer.GetStrbyName("pd_code", i);
                reqCommand.pd_name = packer.GetStrbyName("pd_name", i);
                reqCommand.unit_nav = packer.GetDoublebyName("unit_nav", i);
                reqCommand.daily_pandl_ratio = packer.GetDoublebyName("daily_pandl_ratio", i);
                reqCommand.daily_pandl_ratio_year = packer.GetDoublebyName("daily_pandl_ratio_year", i);
                reqCommand.nav_fluct = packer.GetDoublebyName("nav_fluct", i);
                reqCommand.max_retracement = packer.GetDoublebyName("max_retracement", i);
                reqCommand.curr_share = packer.GetDoublebyName("curr_share", i);
                reqCommand.total_asset = packer.GetDoublebyName("total_asset", i);
 
                FuncrptL_3_8Models.Add(reqCommand);
            }
            return FuncrptL_3_8Models;
        }
 
        //逻辑_报表_报表查询_查询产品详情信息
        public static List<FuncrptL_3_8Model> GetFuncrptL_3_8Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_3_8Models = new List<FuncrptL_3_8Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_3_8Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    reqCommand.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    reqCommand.unit_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_NAV_FLOAT);
                    reqCommand.daily_pandl_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DAILY_PANDL_RATIO_FLOAT);
                    reqCommand.daily_pandl_ratio_year = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DAILY_PANDL_RATIO_YEAR_FLOAT);
                    reqCommand.nav_fluct = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_FLUCT_FLOAT);
                    reqCommand.max_retracement = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_RETRACEMENT_FLOAT);
                    reqCommand.curr_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_SHARE_FLOAT);
                    reqCommand.total_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_ASSET_FLOAT);
                    FuncrptL_3_8Models.Add(reqCommand);
                }
            }
            return FuncrptL_3_8Models;
        }
 
        //逻辑_报表_报表查询_查询跟投分析
        public static List<FuncrptL_3_10Model> GetFuncrptL_3_10Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_3_10Models = new List<FuncrptL_3_10Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_3_10Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_code = packer.GetStrbyName("pd_code", i);
                reqCommand.pd_name = packer.GetStrbyName("pd_name", i);
                reqCommand.net_performance = packer.GetDoublebyName("net_performance", i);
                reqCommand.total_unit_nav = packer.GetDoublebyName("total_unit_nav", i);
                reqCommand.market_value_posi_ratio = packer.GetDoublebyName("market_value_posi_ratio", i);
                reqCommand.pd_manager = packer.GetStrbyName("pd_manager", i);
                reqCommand.nav_asset = packer.GetDoublebyName("nav_asset", i);
                reqCommand.cash_asset = packer.GetDoublebyName("cash_asset", i);
                reqCommand.profit_year = packer.GetDoublebyName("profit_year", i);
                reqCommand.profit_year_ratio = packer.GetDoublebyName("profit_year_ratio", i);
                reqCommand.follow_share = packer.GetDoublebyName("follow_share", i);
                reqCommand.follow_nav_asset = packer.GetDoublebyName("follow_nav_asset", i);
                reqCommand.follow_income_year = packer.GetDoublebyName("follow_income_year", i);
                reqCommand.follow_income_total = packer.GetDoublebyName("follow_income_total", i);
                reqCommand.follow_profit_ratio = packer.GetDoublebyName("follow_profit_ratio", i);
                reqCommand.warn_value = packer.GetDoublebyName("warn_value", i);
                reqCommand.stop_value = packer.GetDoublebyName("stop_value", i);
                reqCommand.curr_share = packer.GetDoublebyName("curr_share", i);
                reqCommand.max_retracement = packer.GetDoublebyName("max_retracement", i);
                reqCommand.found_date = packer.GetIntbyName("found_date", i);
                reqCommand.last_year_nav = packer.GetDoublebyName("last_year_nav", i);
 
                FuncrptL_3_10Models.Add(reqCommand);
            }
            return FuncrptL_3_10Models;
        }
 
        //逻辑_报表_报表查询_查询跟投分析
        public static List<FuncrptL_3_10Model> GetFuncrptL_3_10Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_3_10Models = new List<FuncrptL_3_10Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_3_10Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    reqCommand.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    reqCommand.net_performance = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NET_PERFORMANCE_FLOAT);
                    reqCommand.total_unit_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_UNIT_NAV_FLOAT);
                    reqCommand.market_value_posi_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_VALUE_POSI_RATIO_FLOAT);
                    reqCommand.pd_manager = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_MANAGER_STR);
                    reqCommand.nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT);
                    reqCommand.cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_ASSET_FLOAT);
                    reqCommand.profit_year = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PROFIT_YEAR_FLOAT);
                    reqCommand.profit_year_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PROFIT_YEAR_RATIO_FLOAT);
                    reqCommand.follow_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FOLLOW_SHARE_FLOAT);
                    reqCommand.follow_nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FOLLOW_NAV_ASSET_FLOAT);
                    reqCommand.follow_income_year = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FOLLOW_INCOME_YEAR_FLOAT);
                    reqCommand.follow_income_total = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FOLLOW_INCOME_TOTAL_FLOAT);
                    reqCommand.follow_profit_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FOLLOW_PROFIT_RATIO_FLOAT);
                    reqCommand.warn_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WARN_VALUE_FLOAT);
                    reqCommand.stop_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOP_VALUE_FLOAT);
                    reqCommand.curr_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_SHARE_FLOAT);
                    reqCommand.max_retracement = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_RETRACEMENT_FLOAT);
                    reqCommand.found_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FOUND_DATE_INT);
                    reqCommand.last_year_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_YEAR_NAV_FLOAT);
                    FuncrptL_3_10Models.Add(reqCommand);
                }
            }
            return FuncrptL_3_10Models;
        }
 
        //逻辑_报表_报表查询_查询盈亏分析
        public static List<FuncrptL_3_11Model> GetFuncrptL_3_11Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_3_11Models = new List<FuncrptL_3_11Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_3_11Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.begin_date = packer.GetIntbyName("begin_date", i);
                reqCommand.end_date = packer.GetIntbyName("end_date", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_code = packer.GetStrbyName("pd_code", i);
                reqCommand.pd_name = packer.GetStrbyName("pd_name", i);
                reqCommand.nav_asset = packer.GetDoublebyName("nav_asset", i);
                reqCommand.posi_market_value = packer.GetDoublebyName("posi_market_value", i);
                reqCommand.cash_asset = packer.GetDoublebyName("cash_asset", i);
                reqCommand.product_return_rate = packer.GetDoublebyName("product_return_rate", i);
                reqCommand.standard_return = packer.GetDoublebyName("standard_return", i);
                reqCommand.curr_share = packer.GetDoublebyName("curr_share", i);
                reqCommand.unit_nav = packer.GetDoublebyName("unit_nav", i);
                reqCommand.interval_pandl = packer.GetDoublebyName("interval_pandl", i);
                reqCommand.total_realiz_pandl_ratio = packer.GetDoublebyName("total_realiz_pandl_ratio", i);
                reqCommand.cmp_product_return_rate = packer.GetDoublebyName("cmp_product_return_rate", i);
 
                FuncrptL_3_11Models.Add(reqCommand);
            }
            return FuncrptL_3_11Models;
        }
 
        //逻辑_报表_报表查询_查询盈亏分析
        public static List<FuncrptL_3_11Model> GetFuncrptL_3_11Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_3_11Models = new List<FuncrptL_3_11Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_3_11Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT);
                    reqCommand.end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    reqCommand.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    reqCommand.nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT);
                    reqCommand.posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_MARKET_VALUE_FLOAT);
                    reqCommand.cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_ASSET_FLOAT);
                    reqCommand.product_return_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRODUCT_RETURN_RATE_FLOAT);
                    reqCommand.standard_return = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STANDARD_RETURN_FLOAT);
                    reqCommand.curr_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_SHARE_FLOAT);
                    reqCommand.unit_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_NAV_FLOAT);
                    reqCommand.interval_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTERVAL_PANDL_FLOAT);
                    reqCommand.total_realiz_pandl_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_REALIZ_PANDL_RATIO_FLOAT);
                    reqCommand.cmp_product_return_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CMP_PRODUCT_RETURN_RATE_FLOAT);
                    FuncrptL_3_11Models.Add(reqCommand);
                }
            }
            return FuncrptL_3_11Models;
        }
 
        //逻辑_报表_报表查询_查询回报统计
        public static List<FuncrptL_3_12Model> GetFuncrptL_3_12Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_3_12Models = new List<FuncrptL_3_12Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_3_12Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_code = packer.GetStrbyName("pd_code", i);
                reqCommand.pd_name = packer.GetStrbyName("pd_name", i);
                reqCommand.product_return_rate = packer.GetDoublebyName("product_return_rate", i);
                reqCommand.total_asset = packer.GetDoublebyName("total_asset", i);
                reqCommand.standard_return = packer.GetDoublebyName("standard_return", i);
                reqCommand.cmp_product_return_rate = packer.GetDoublebyName("cmp_product_return_rate", i);
 
                FuncrptL_3_12Models.Add(reqCommand);
            }
            return FuncrptL_3_12Models;
        }
 
        //逻辑_报表_报表查询_查询回报统计
        public static List<FuncrptL_3_12Model> GetFuncrptL_3_12Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_3_12Models = new List<FuncrptL_3_12Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_3_12Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    reqCommand.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    reqCommand.product_return_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRODUCT_RETURN_RATE_FLOAT);
                    reqCommand.total_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_ASSET_FLOAT);
                    reqCommand.standard_return = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STANDARD_RETURN_FLOAT);
                    reqCommand.cmp_product_return_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CMP_PRODUCT_RETURN_RATE_FLOAT);
                    FuncrptL_3_12Models.Add(reqCommand);
                }
            }
            return FuncrptL_3_12Models;
        }
 
        //逻辑_报表_报表查询_查询归因分析
        public static List<FuncrptL_3_13Model> GetFuncrptL_3_13Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_3_13Models = new List<FuncrptL_3_13Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_3_13Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.begin_date = packer.GetIntbyName("begin_date", i);
                reqCommand.end_date = packer.GetIntbyName("end_date", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_code = packer.GetStrbyName("pd_code", i);
                reqCommand.pd_name = packer.GetStrbyName("pd_name", i);
                reqCommand.asset_market_value = packer.GetDoublebyName("asset_market_value", i);
                reqCommand.weight_ratio = packer.GetDoublebyName("weight_ratio", i);
                reqCommand.interval_pandl = packer.GetDoublebyName("interval_pandl", i);
                reqCommand.product_return_rate = packer.GetDoublebyName("product_return_rate", i);
                reqCommand.return_rate = packer.GetDoublebyName("return_rate", i);
 
                FuncrptL_3_13Models.Add(reqCommand);
            }
            return FuncrptL_3_13Models;
        }
 
        //逻辑_报表_报表查询_查询归因分析
        public static List<FuncrptL_3_13Model> GetFuncrptL_3_13Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_3_13Models = new List<FuncrptL_3_13Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_3_13Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT);
                    reqCommand.end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    reqCommand.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    reqCommand.asset_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_MARKET_VALUE_FLOAT);
                    reqCommand.weight_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WEIGHT_RATIO_FLOAT);
                    reqCommand.interval_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTERVAL_PANDL_FLOAT);
                    reqCommand.product_return_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRODUCT_RETURN_RATE_FLOAT);
                    reqCommand.return_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RETURN_RATE_FLOAT);
                    FuncrptL_3_13Models.Add(reqCommand);
                }
            }
            return FuncrptL_3_13Models;
        }
 
        //逻辑_报表_报表查询_查询资产分析
        public static List<FuncrptL_3_14Model> GetFuncrptL_3_14Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_3_14Models = new List<FuncrptL_3_14Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_3_14Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_code = packer.GetStrbyName("pd_code", i);
                reqCommand.pd_name = packer.GetStrbyName("pd_name", i);
                reqCommand.asset_market_value = packer.GetDoublebyName("asset_market_value", i);
                reqCommand.weight_ratio = packer.GetDoublebyName("weight_ratio", i);
                reqCommand.asset_kind = packer.GetIntbyName("asset_kind", i);
                reqCommand.interval_pandl = packer.GetDoublebyName("interval_pandl", i);
 
                FuncrptL_3_14Models.Add(reqCommand);
            }
            return FuncrptL_3_14Models;
        }
 
        //逻辑_报表_报表查询_查询资产分析
        public static List<FuncrptL_3_14Model> GetFuncrptL_3_14Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_3_14Models = new List<FuncrptL_3_14Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_3_14Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    reqCommand.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    reqCommand.asset_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_MARKET_VALUE_FLOAT);
                    reqCommand.weight_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WEIGHT_RATIO_FLOAT);
                    reqCommand.asset_kind = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_KIND_INT);
                    reqCommand.interval_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTERVAL_PANDL_FLOAT);
                    FuncrptL_3_14Models.Add(reqCommand);
                }
            }
            return FuncrptL_3_14Models;
        }
 
        //逻辑_报表_报表查询_查询持仓分析
        public static List<FuncrptL_3_15Model> GetFuncrptL_3_15Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_3_15Models = new List<FuncrptL_3_15Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_3_15Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.begin_date = packer.GetIntbyName("begin_date", i);
                reqCommand.end_date = packer.GetIntbyName("end_date", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_name = packer.GetStrbyName("stock_name", i);
                reqCommand.last_price = packer.GetDoublebyName("last_price", i);
                reqCommand.posi_qty = packer.GetDoublebyName("posi_qty", i);
                reqCommand.asset_market_value = packer.GetDoublebyName("asset_market_value", i);
                reqCommand.weight_ratio = packer.GetDoublebyName("weight_ratio", i);
                reqCommand.interval_pandl = packer.GetDoublebyName("interval_pandl", i);
                reqCommand.product_return_rate = packer.GetDoublebyName("product_return_rate", i);
                reqCommand.return_rate = packer.GetDoublebyName("return_rate", i);
 
                FuncrptL_3_15Models.Add(reqCommand);
            }
            return FuncrptL_3_15Models;
        }
 
        //逻辑_报表_报表查询_查询持仓分析
        public static List<FuncrptL_3_15Model> GetFuncrptL_3_15Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_3_15Models = new List<FuncrptL_3_15Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_3_15Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT);
                    reqCommand.end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    reqCommand.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    reqCommand.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    reqCommand.asset_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_MARKET_VALUE_FLOAT);
                    reqCommand.weight_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WEIGHT_RATIO_FLOAT);
                    reqCommand.interval_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTERVAL_PANDL_FLOAT);
                    reqCommand.product_return_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRODUCT_RETURN_RATE_FLOAT);
                    reqCommand.return_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RETURN_RATE_FLOAT);
                    FuncrptL_3_15Models.Add(reqCommand);
                }
            }
            return FuncrptL_3_15Models;
        }
 
        //逻辑_报表_报表查询_查询行业分析
        public static List<FuncrptL_3_16Model> GetFuncrptL_3_16Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_3_16Models = new List<FuncrptL_3_16Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_3_16Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.first_indu_code = packer.GetStrbyName("first_indu_code", i);
                reqCommand.asset_market_value = packer.GetDoublebyName("asset_market_value", i);
                reqCommand.weight_ratio = packer.GetDoublebyName("weight_ratio", i);
                reqCommand.interval_pandl = packer.GetDoublebyName("interval_pandl", i);
                reqCommand.product_return_rate = packer.GetDoublebyName("product_return_rate", i);
 
                FuncrptL_3_16Models.Add(reqCommand);
            }
            return FuncrptL_3_16Models;
        }
 
        //逻辑_报表_报表查询_查询行业分析
        public static List<FuncrptL_3_16Model> GetFuncrptL_3_16Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_3_16Models = new List<FuncrptL_3_16Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_3_16Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.first_indu_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FIRST_INDU_CODE_STR);
                    reqCommand.asset_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_MARKET_VALUE_FLOAT);
                    reqCommand.weight_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WEIGHT_RATIO_FLOAT);
                    reqCommand.interval_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTERVAL_PANDL_FLOAT);
                    reqCommand.product_return_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRODUCT_RETURN_RATE_FLOAT);
                    FuncrptL_3_16Models.Add(reqCommand);
                }
            }
            return FuncrptL_3_16Models;
        }
 
        //逻辑_报表_报表查询_查询行业持仓分析
        public static List<FuncrptL_3_17Model> GetFuncrptL_3_17Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_3_17Models = new List<FuncrptL_3_17Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_3_17Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.begin_date = packer.GetIntbyName("begin_date", i);
                reqCommand.end_date = packer.GetIntbyName("end_date", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_name = packer.GetStrbyName("stock_name", i);
                reqCommand.last_price = packer.GetDoublebyName("last_price", i);
                reqCommand.posi_qty = packer.GetDoublebyName("posi_qty", i);
                reqCommand.asset_market_value = packer.GetDoublebyName("asset_market_value", i);
                reqCommand.weight_ratio = packer.GetDoublebyName("weight_ratio", i);
                reqCommand.interval_pandl = packer.GetDoublebyName("interval_pandl", i);
                reqCommand.product_return_rate = packer.GetDoublebyName("product_return_rate", i);
                reqCommand.return_rate = packer.GetDoublebyName("return_rate", i);
 
                FuncrptL_3_17Models.Add(reqCommand);
            }
            return FuncrptL_3_17Models;
        }
 
        //逻辑_报表_报表查询_查询行业持仓分析
        public static List<FuncrptL_3_17Model> GetFuncrptL_3_17Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_3_17Models = new List<FuncrptL_3_17Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_3_17Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT);
                    reqCommand.end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    reqCommand.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    reqCommand.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    reqCommand.asset_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_MARKET_VALUE_FLOAT);
                    reqCommand.weight_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WEIGHT_RATIO_FLOAT);
                    reqCommand.interval_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTERVAL_PANDL_FLOAT);
                    reqCommand.product_return_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRODUCT_RETURN_RATE_FLOAT);
                    reqCommand.return_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RETURN_RATE_FLOAT);
                    FuncrptL_3_17Models.Add(reqCommand);
                }
            }
            return FuncrptL_3_17Models;
        }
 
        //逻辑_报表_报表查询_查询产品持仓
        public static List<FuncrptL_3_18Model> GetFuncrptL_3_18Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_3_18Models = new List<FuncrptL_3_18Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_3_18Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.pd_name = packer.GetStrbyName("pd_name", i);
                reqCommand.pd_code = packer.GetStrbyName("pd_code", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_name = packer.GetStrbyName("stock_name", i);
                reqCommand.stock_asset_value = packer.GetDoublebyName("stock_asset_value", i);
                reqCommand.cost_price = packer.GetDoublebyName("cost_price", i);
                reqCommand.posi_qty = packer.GetDoublebyName("posi_qty", i);
                reqCommand.cost_amt = packer.GetDoublebyName("cost_amt", i);
                reqCommand.float_pandl = packer.GetDoublebyName("float_pandl", i);
                reqCommand.weight_ratio = packer.GetDoublebyName("weight_ratio", i);
 
                FuncrptL_3_18Models.Add(reqCommand);
            }
            return FuncrptL_3_18Models;
        }
 
        //逻辑_报表_报表查询_查询产品持仓
        public static List<FuncrptL_3_18Model> GetFuncrptL_3_18Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_3_18Models = new List<FuncrptL_3_18Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_3_18Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    reqCommand.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    reqCommand.stock_asset_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_VALUE_FLOAT);
                    reqCommand.cost_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_PRICE_FLOAT);
                    reqCommand.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    reqCommand.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                    reqCommand.float_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FLOAT_PANDL_FLOAT);
                    reqCommand.weight_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WEIGHT_RATIO_FLOAT);
                    FuncrptL_3_18Models.Add(reqCommand);
                }
            }
            return FuncrptL_3_18Models;
        }
 
        //逻辑_报表_报表查询_查询产品持仓对比
        public static List<FuncrptL_3_19Model> GetFuncrptL_3_19Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_3_19Models = new List<FuncrptL_3_19Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_3_19Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_name = packer.GetStrbyName("stock_name", i);
                reqCommand.last_price = packer.GetDoublebyName("last_price", i);
                reqCommand.posi_qty = packer.GetDoublebyName("posi_qty", i);
                reqCommand.stock_asset_value = packer.GetDoublebyName("stock_asset_value", i);
                reqCommand.cost_price = packer.GetDoublebyName("cost_price", i);
                reqCommand.weight_ratio = packer.GetDoublebyName("weight_ratio", i);
                reqCommand.float_pandl = packer.GetDoublebyName("float_pandl", i);
 
                FuncrptL_3_19Models.Add(reqCommand);
            }
            return FuncrptL_3_19Models;
        }
 
        //逻辑_报表_报表查询_查询产品持仓对比
        public static List<FuncrptL_3_19Model> GetFuncrptL_3_19Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_3_19Models = new List<FuncrptL_3_19Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_3_19Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    reqCommand.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    reqCommand.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    reqCommand.stock_asset_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_VALUE_FLOAT);
                    reqCommand.cost_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_PRICE_FLOAT);
                    reqCommand.weight_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WEIGHT_RATIO_FLOAT);
                    reqCommand.float_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FLOAT_PANDL_FLOAT);
                    FuncrptL_3_19Models.Add(reqCommand);
                }
            }
            return FuncrptL_3_19Models;
        }
 
        //逻辑_报表_报表查询_查询持仓证券产品
        public static List<FuncrptL_3_20Model> GetFuncrptL_3_20Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_3_20Models = new List<FuncrptL_3_20Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_3_20Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.pd_name = packer.GetStrbyName("pd_name", i);
                reqCommand.pd_manager = packer.GetStrbyName("pd_manager", i);
                reqCommand.posi_qty = packer.GetDoublebyName("posi_qty", i);
                reqCommand.stock_asset_value = packer.GetDoublebyName("stock_asset_value", i);
                reqCommand.cost_price = packer.GetDoublebyName("cost_price", i);
                reqCommand.weight_ratio = packer.GetDoublebyName("weight_ratio", i);
                reqCommand.float_pandl = packer.GetDoublebyName("float_pandl", i);
                reqCommand.asset_market_value = packer.GetDoublebyName("asset_market_value", i);
                reqCommand.asset_ratio = packer.GetDoublebyName("asset_ratio", i);
 
                FuncrptL_3_20Models.Add(reqCommand);
            }
            return FuncrptL_3_20Models;
        }
 
        //逻辑_报表_报表查询_查询持仓证券产品
        public static List<FuncrptL_3_20Model> GetFuncrptL_3_20Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_3_20Models = new List<FuncrptL_3_20Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_3_20Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    reqCommand.pd_manager = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_MANAGER_STR);
                    reqCommand.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    reqCommand.stock_asset_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_VALUE_FLOAT);
                    reqCommand.cost_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_PRICE_FLOAT);
                    reqCommand.weight_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WEIGHT_RATIO_FLOAT);
                    reqCommand.float_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FLOAT_PANDL_FLOAT);
                    reqCommand.asset_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_MARKET_VALUE_FLOAT);
                    reqCommand.asset_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_RATIO_FLOAT);
                    FuncrptL_3_20Models.Add(reqCommand);
                }
            }
            return FuncrptL_3_20Models;
        }
 
        //逻辑_报表_报表查询_持仓分析查询汇总证券代码
        public static List<FuncrptL_3_21Model> GetFuncrptL_3_21Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_3_21Models = new List<FuncrptL_3_21Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_3_21Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.asset_type = packer.GetIntbyName("asset_type", i);
                reqCommand.begin_qty = packer.GetDoublebyName("begin_qty", i);
                reqCommand.curr_qty = packer.GetDoublebyName("curr_qty", i);
                reqCommand.cost_amt = packer.GetDoublebyName("cost_amt", i);
                reqCommand.realize_pandl = packer.GetDoublebyName("realize_pandl", i);
                reqCommand.intrst_cost_amt = packer.GetDoublebyName("intrst_cost_amt", i);
                reqCommand.intrst_pandl = packer.GetDoublebyName("intrst_pandl", i);
                reqCommand.cost_price = packer.GetDoublebyName("cost_price", i);
                reqCommand.float_pandl = packer.GetDoublebyName("float_pandl", i);
                reqCommand.posi_market_value = packer.GetDoublebyName("posi_market_value", i);
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
 
                FuncrptL_3_21Models.Add(reqCommand);
            }
            return FuncrptL_3_21Models;
        }
 
        //逻辑_报表_报表查询_持仓分析查询汇总证券代码
        public static List<FuncrptL_3_21Model> GetFuncrptL_3_21Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_3_21Models = new List<FuncrptL_3_21Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_3_21Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    reqCommand.begin_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_QTY_FLOAT);
                    reqCommand.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    reqCommand.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                    reqCommand.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    reqCommand.intrst_cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_COST_AMT_FLOAT);
                    reqCommand.intrst_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_PANDL_FLOAT);
                    reqCommand.cost_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_PRICE_FLOAT);
                    reqCommand.float_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FLOAT_PANDL_FLOAT);
                    reqCommand.posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_MARKET_VALUE_FLOAT);
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
                    FuncrptL_3_21Models.Add(reqCommand);
                }
            }
            return FuncrptL_3_21Models;
        }
 
        //逻辑_报表_报表查询_持仓分析查询汇总市场
        public static List<FuncrptL_3_22Model> GetFuncrptL_3_22Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_3_22Models = new List<FuncrptL_3_22Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_3_22Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.pd_name = packer.GetStrbyName("pd_name", i);
                reqCommand.pd_code = packer.GetStrbyName("pd_code", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_name = packer.GetStrbyName("stock_name", i);
                reqCommand.stock_asset_value = packer.GetDoublebyName("stock_asset_value", i);
                reqCommand.cost_price = packer.GetDoublebyName("cost_price", i);
                reqCommand.posi_qty = packer.GetDoublebyName("posi_qty", i);
                reqCommand.cost_amt = packer.GetDoublebyName("cost_amt", i);
                reqCommand.float_pandl = packer.GetDoublebyName("float_pandl", i);
 
                FuncrptL_3_22Models.Add(reqCommand);
            }
            return FuncrptL_3_22Models;
        }
 
        //逻辑_报表_报表查询_持仓分析查询汇总市场
        public static List<FuncrptL_3_22Model> GetFuncrptL_3_22Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_3_22Models = new List<FuncrptL_3_22Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_3_22Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    reqCommand.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    reqCommand.stock_asset_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_VALUE_FLOAT);
                    reqCommand.cost_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_PRICE_FLOAT);
                    reqCommand.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    reqCommand.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                    reqCommand.float_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FLOAT_PANDL_FLOAT);
                    FuncrptL_3_22Models.Add(reqCommand);
                }
            }
            return FuncrptL_3_22Models;
        }
 
        //逻辑_报表_报表查询_持仓分析查询汇总证券类别
        public static List<FuncrptL_3_23Model> GetFuncrptL_3_23Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_3_23Models = new List<FuncrptL_3_23Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_3_23Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.pd_name = packer.GetStrbyName("pd_name", i);
                reqCommand.pd_code = packer.GetStrbyName("pd_code", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_name = packer.GetStrbyName("stock_name", i);
                reqCommand.stock_asset_value = packer.GetDoublebyName("stock_asset_value", i);
                reqCommand.cost_price = packer.GetDoublebyName("cost_price", i);
                reqCommand.posi_qty = packer.GetDoublebyName("posi_qty", i);
                reqCommand.cost_amt = packer.GetDoublebyName("cost_amt", i);
                reqCommand.float_pandl = packer.GetDoublebyName("float_pandl", i);
 
                FuncrptL_3_23Models.Add(reqCommand);
            }
            return FuncrptL_3_23Models;
        }
 
        //逻辑_报表_报表查询_持仓分析查询汇总证券类别
        public static List<FuncrptL_3_23Model> GetFuncrptL_3_23Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_3_23Models = new List<FuncrptL_3_23Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_3_23Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    reqCommand.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    reqCommand.stock_asset_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_VALUE_FLOAT);
                    reqCommand.cost_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_PRICE_FLOAT);
                    reqCommand.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    reqCommand.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                    reqCommand.float_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FLOAT_PANDL_FLOAT);
                    FuncrptL_3_23Models.Add(reqCommand);
                }
            }
            return FuncrptL_3_23Models;
        }
 
        //逻辑_报表_报表查询_持仓分析查询汇总产品汇总
        public static List<FuncrptL_3_24Model> GetFuncrptL_3_24Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_3_24Models = new List<FuncrptL_3_24Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_3_24Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.pd_name = packer.GetStrbyName("pd_name", i);
                reqCommand.pd_code = packer.GetStrbyName("pd_code", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_name = packer.GetStrbyName("stock_name", i);
                reqCommand.stock_asset_value = packer.GetDoublebyName("stock_asset_value", i);
                reqCommand.cost_price = packer.GetDoublebyName("cost_price", i);
                reqCommand.posi_qty = packer.GetDoublebyName("posi_qty", i);
                reqCommand.cost_amt = packer.GetDoublebyName("cost_amt", i);
                reqCommand.float_pandl = packer.GetDoublebyName("float_pandl", i);
 
                FuncrptL_3_24Models.Add(reqCommand);
            }
            return FuncrptL_3_24Models;
        }
 
        //逻辑_报表_报表查询_持仓分析查询汇总产品汇总
        public static List<FuncrptL_3_24Model> GetFuncrptL_3_24Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_3_24Models = new List<FuncrptL_3_24Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_3_24Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    reqCommand.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    reqCommand.stock_asset_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_VALUE_FLOAT);
                    reqCommand.cost_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_PRICE_FLOAT);
                    reqCommand.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    reqCommand.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                    reqCommand.float_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FLOAT_PANDL_FLOAT);
                    FuncrptL_3_24Models.Add(reqCommand);
                }
            }
            return FuncrptL_3_24Models;
        }
 
        //逻辑_报表_报表查询_持仓分析查询明细持仓
        public static List<FuncrptL_3_25Model> GetFuncrptL_3_25Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_3_25Models = new List<FuncrptL_3_25Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_3_25Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.pd_name = packer.GetStrbyName("pd_name", i);
                reqCommand.pd_code = packer.GetStrbyName("pd_code", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_name = packer.GetStrbyName("stock_name", i);
                reqCommand.stock_asset_value = packer.GetDoublebyName("stock_asset_value", i);
                reqCommand.cost_price = packer.GetDoublebyName("cost_price", i);
                reqCommand.posi_qty = packer.GetDoublebyName("posi_qty", i);
                reqCommand.cost_amt = packer.GetDoublebyName("cost_amt", i);
                reqCommand.float_pandl = packer.GetDoublebyName("float_pandl", i);
 
                FuncrptL_3_25Models.Add(reqCommand);
            }
            return FuncrptL_3_25Models;
        }
 
        //逻辑_报表_报表查询_持仓分析查询明细持仓
        public static List<FuncrptL_3_25Model> GetFuncrptL_3_25Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_3_25Models = new List<FuncrptL_3_25Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_3_25Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    reqCommand.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    reqCommand.stock_asset_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_VALUE_FLOAT);
                    reqCommand.cost_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_PRICE_FLOAT);
                    reqCommand.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    reqCommand.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                    reqCommand.float_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FLOAT_PANDL_FLOAT);
                    FuncrptL_3_25Models.Add(reqCommand);
                }
            }
            return FuncrptL_3_25Models;
        }
 
        //逻辑_报表_报表查询_债券分析查询明细
        public static List<FuncrptL_3_26Model> GetFuncrptL_3_26Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_3_26Models = new List<FuncrptL_3_26Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_3_26Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.pd_code = packer.GetStrbyName("pd_code", i);
                reqCommand.pd_name = packer.GetStrbyName("pd_name", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.bond_code = packer.GetStrbyName("bond_code", i);
                reqCommand.stock_name = packer.GetStrbyName("stock_name", i);
                reqCommand.last_price = packer.GetDoublebyName("last_price", i);
                reqCommand.posi_qty = packer.GetDoublebyName("posi_qty", i);
                reqCommand.stock_asset_value = packer.GetDoublebyName("stock_asset_value", i);
                reqCommand.cost_price = packer.GetDoublebyName("cost_price", i);
                reqCommand.rating_agency = packer.GetStrbyName("rating_agency", i);
                reqCommand.bond_level = packer.GetIntbyName("bond_level", i);
                reqCommand.bond_accr_intrst = packer.GetDoublebyName("bond_accr_intrst", i);
                reqCommand.value_dirty_price = packer.GetDoublebyName("value_dirty_price", i);
                reqCommand.value_net_price = packer.GetDoublebyName("value_net_price", i);
                reqCommand.value_price_yield = packer.GetDoublebyName("value_price_yield", i);
                reqCommand.value_price_modi_dur = packer.GetDoublebyName("value_price_modi_dur", i);
                reqCommand.value_price_conve = packer.GetDoublebyName("value_price_conve", i);
                reqCommand.value_price_point_value = packer.GetDoublebyName("value_price_point_value", i);
                reqCommand.value_price_intrst_dur = packer.GetDoublebyName("value_price_intrst_dur", i);
                reqCommand.value_price_intrst_conve = packer.GetDoublebyName("value_price_intrst_conve", i);
                reqCommand.value_price_spread_dur = packer.GetDoublebyName("value_price_spread_dur", i);
                reqCommand.value_price_spread_Conve = packer.GetDoublebyName("value_price_spread_Conve", i);
                reqCommand.true_dirty_price = packer.GetDoublebyName("true_dirty_price", i);
                reqCommand.true_net_price = packer.GetDoublebyName("true_net_price", i);
                reqCommand.true_yield = packer.GetDoublebyName("true_yield", i);
                reqCommand.true_remain_limit = packer.GetDoublebyName("true_remain_limit", i);
                reqCommand.true_avg_modi_dur = packer.GetDoublebyName("true_avg_modi_dur", i);
                reqCommand.true_conve = packer.GetDoublebyName("true_conve", i);
                reqCommand.true_point_value = packer.GetDoublebyName("true_point_value", i);
                reqCommand.true_intrst_dur = packer.GetDoublebyName("true_intrst_dur", i);
                reqCommand.true_intrst_conve = packer.GetDoublebyName("true_intrst_conve", i);
                reqCommand.true_spread_dur = packer.GetDoublebyName("true_spread_dur", i);
                reqCommand.true_spread_conve = packer.GetDoublebyName("true_spread_conve", i);
                reqCommand.abs_liq_coeffi = packer.GetDoublebyName("abs_liq_coeffi", i);
                reqCommand.pstion_per = packer.GetDoublebyName("pstion_per", i);
                reqCommand.rela_liq_coeffi = packer.GetDoublebyName("rela_liq_coeffi", i);
                reqCommand.rela_liq_num = packer.GetDoublebyName("rela_liq_num", i);
                reqCommand.sett_value_dirty_rice = packer.GetDoublebyName("sett_value_dirty_rice", i);
                reqCommand.sett_accr_intrst = packer.GetDoublebyName("sett_accr_intrst", i);
                reqCommand.remain_capit = packer.GetDoublebyName("remain_capit", i);
                reqCommand.point_spread_yield = packer.GetDoublebyName("point_spread_yield", i);
 
                FuncrptL_3_26Models.Add(reqCommand);
            }
            return FuncrptL_3_26Models;
        }
 
        //逻辑_报表_报表查询_债券分析查询明细
        public static List<FuncrptL_3_26Model> GetFuncrptL_3_26Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_3_26Models = new List<FuncrptL_3_26Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_3_26Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    reqCommand.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.bond_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BOND_CODE_STR);
                    reqCommand.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    reqCommand.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    reqCommand.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    reqCommand.stock_asset_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_VALUE_FLOAT);
                    reqCommand.cost_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_PRICE_FLOAT);
                    reqCommand.rating_agency = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RATING_AGENCY_STR);
                    reqCommand.bond_level = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BOND_LEVEL_INT);
                    reqCommand.bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT);
                    reqCommand.value_dirty_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VALUE_DIRTY_PRICE_FLOAT);
                    reqCommand.value_net_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VALUE_NET_PRICE_FLOAT);
                    reqCommand.value_price_yield = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VALUE_PRICE_YIELD_FLOAT);
                    reqCommand.value_price_modi_dur = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VALUE_PRICE_MODI_DUR_FLOAT);
                    reqCommand.value_price_conve = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VALUE_PRICE_CONVE_FLOAT);
                    reqCommand.value_price_point_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VALUE_PRICE_POINT_VALUE_FLOAT);
                    reqCommand.value_price_intrst_dur = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VALUE_PRICE_INTRST_DUR_FLOAT);
                    reqCommand.value_price_intrst_conve = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VALUE_PRICE_INTRST_CONVE_FLOAT);
                    reqCommand.value_price_spread_dur = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VALUE_PRICE_SPREAD_DUR_FLOAT);
                    reqCommand.value_price_spread_Conve = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VALUE_PRICE_SPREAD_CONVE_FLOAT);
                    reqCommand.true_dirty_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRUE_DIRTY_PRICE_FLOAT);
                    reqCommand.true_net_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRUE_NET_PRICE_FLOAT);
                    reqCommand.true_yield = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRUE_YIELD_FLOAT);
                    reqCommand.true_remain_limit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRUE_REMAIN_LIMIT_FLOAT);
                    reqCommand.true_avg_modi_dur = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRUE_AVG_MODI_DUR_FLOAT);
                    reqCommand.true_conve = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRUE_CONVE_FLOAT);
                    reqCommand.true_point_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRUE_POINT_VALUE_FLOAT);
                    reqCommand.true_intrst_dur = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRUE_INTRST_DUR_FLOAT);
                    reqCommand.true_intrst_conve = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRUE_INTRST_CONVE_FLOAT);
                    reqCommand.true_spread_dur = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRUE_SPREAD_DUR_FLOAT);
                    reqCommand.true_spread_conve = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRUE_SPREAD_CONVE_FLOAT);
                    reqCommand.abs_liq_coeffi = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ABS_LIQ_COEFFI_FLOAT);
                    reqCommand.pstion_per = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PSTION_PER_FLOAT);
                    reqCommand.rela_liq_coeffi = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RELA_LIQ_COEFFI_FLOAT);
                    reqCommand.rela_liq_num = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RELA_LIQ_NUM_FLOAT);
                    reqCommand.sett_value_dirty_rice = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SETT_VALUE_DIRTY_RICE_FLOAT);
                    reqCommand.sett_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SETT_ACCR_INTRST_FLOAT);
                    reqCommand.remain_capit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REMAIN_CAPIT_FLOAT);
                    reqCommand.point_spread_yield = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POINT_SPREAD_YIELD_FLOAT);
                    FuncrptL_3_26Models.Add(reqCommand);
                }
            }
            return FuncrptL_3_26Models;
        }
 
        //逻辑_报表_报表查询_债券分析查询行业权重
        public static List<FuncrptL_3_27Model> GetFuncrptL_3_27Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_3_27Models = new List<FuncrptL_3_27Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_3_27Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.pd_code = packer.GetStrbyName("pd_code", i);
                reqCommand.pd_name = packer.GetStrbyName("pd_name", i);
                reqCommand.end_date = packer.GetIntbyName("end_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.first_indu_code = packer.GetStrbyName("first_indu_code", i);
                reqCommand.end_date_weight = packer.GetDoublebyName("end_date_weight", i);
                reqCommand.end_date_revenue = packer.GetDoublebyName("end_date_revenue", i);
                reqCommand.clean_price_profit = packer.GetDoublebyName("clean_price_profit", i);
                reqCommand.clean_price_revenue = packer.GetDoublebyName("clean_price_revenue", i);
                reqCommand.total_return = packer.GetDoublebyName("total_return", i);
                reqCommand.interest_revenue_total = packer.GetDoublebyName("interest_revenue_total", i);
                reqCommand.face_value = packer.GetDoublebyName("face_value", i);
                reqCommand.clean_price_market_value = packer.GetDoublebyName("clean_price_market_value", i);
                reqCommand.dirty_price_market_value = packer.GetDoublebyName("dirty_price_market_value", i);
 
                FuncrptL_3_27Models.Add(reqCommand);
            }
            return FuncrptL_3_27Models;
        }
 
        //逻辑_报表_报表查询_债券分析查询行业权重
        public static List<FuncrptL_3_27Model> GetFuncrptL_3_27Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_3_27Models = new List<FuncrptL_3_27Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_3_27Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    reqCommand.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    reqCommand.end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.first_indu_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FIRST_INDU_CODE_STR);
                    reqCommand.end_date_weight = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_WEIGHT_FLOAT);
                    reqCommand.end_date_revenue = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_REVENUE_FLOAT);
                    reqCommand.clean_price_profit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLEAN_PRICE_PROFIT_FLOAT);
                    reqCommand.clean_price_revenue = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLEAN_PRICE_REVENUE_FLOAT);
                    reqCommand.total_return = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_RETURN_FLOAT);
                    reqCommand.interest_revenue_total = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTEREST_REVENUE_TOTAL_FLOAT);
                    reqCommand.face_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FACE_VALUE_FLOAT);
                    reqCommand.clean_price_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLEAN_PRICE_MARKET_VALUE_FLOAT);
                    reqCommand.dirty_price_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DIRTY_PRICE_MARKET_VALUE_FLOAT);
                    FuncrptL_3_27Models.Add(reqCommand);
                }
            }
            return FuncrptL_3_27Models;
        }
 
        //逻辑_报表_报表查询_期货持仓查询明细
        public static List<FuncrptL_3_29Model> GetFuncrptL_3_29Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_3_29Models = new List<FuncrptL_3_29Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_3_29Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.pd_name = packer.GetStrbyName("pd_name", i);
                reqCommand.pd_code = packer.GetStrbyName("pd_code", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_name = packer.GetStrbyName("stock_name", i);
                reqCommand.stock_asset_value = packer.GetDoublebyName("stock_asset_value", i);
                reqCommand.cost_price = packer.GetDoublebyName("cost_price", i);
                reqCommand.posi_qty = packer.GetDoublebyName("posi_qty", i);
                reqCommand.cost_amt = packer.GetDoublebyName("cost_amt", i);
                reqCommand.float_pandl = packer.GetDoublebyName("float_pandl", i);
 
                FuncrptL_3_29Models.Add(reqCommand);
            }
            return FuncrptL_3_29Models;
        }
 
        //逻辑_报表_报表查询_期货持仓查询明细
        public static List<FuncrptL_3_29Model> GetFuncrptL_3_29Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_3_29Models = new List<FuncrptL_3_29Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_3_29Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    reqCommand.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    reqCommand.stock_asset_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_VALUE_FLOAT);
                    reqCommand.cost_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_PRICE_FLOAT);
                    reqCommand.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    reqCommand.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                    reqCommand.float_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FLOAT_PANDL_FLOAT);
                    FuncrptL_3_29Models.Add(reqCommand);
                }
            }
            return FuncrptL_3_29Models;
        }
 
        //逻辑_报表_报表查询_期货保证金分析
        public static List<FuncrptL_3_30Model> GetFuncrptL_3_30Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_3_30Models = new List<FuncrptL_3_30Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_3_30Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.pd_name = packer.GetStrbyName("pd_name", i);
                reqCommand.pd_code = packer.GetStrbyName("pd_code", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_name = packer.GetStrbyName("stock_name", i);
                reqCommand.stock_asset_value = packer.GetDoublebyName("stock_asset_value", i);
                reqCommand.cost_price = packer.GetDoublebyName("cost_price", i);
                reqCommand.posi_qty = packer.GetDoublebyName("posi_qty", i);
                reqCommand.cost_amt = packer.GetDoublebyName("cost_amt", i);
                reqCommand.float_pandl = packer.GetDoublebyName("float_pandl", i);
 
                FuncrptL_3_30Models.Add(reqCommand);
            }
            return FuncrptL_3_30Models;
        }
 
        //逻辑_报表_报表查询_期货保证金分析
        public static List<FuncrptL_3_30Model> GetFuncrptL_3_30Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_3_30Models = new List<FuncrptL_3_30Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_3_30Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    reqCommand.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    reqCommand.stock_asset_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_VALUE_FLOAT);
                    reqCommand.cost_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_PRICE_FLOAT);
                    reqCommand.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    reqCommand.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                    reqCommand.float_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FLOAT_PANDL_FLOAT);
                    FuncrptL_3_30Models.Add(reqCommand);
                }
            }
            return FuncrptL_3_30Models;
        }
 
        //逻辑_报表_报表查询_期货持仓产品持仓
        public static List<FuncrptL_3_31Model> GetFuncrptL_3_31Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_3_31Models = new List<FuncrptL_3_31Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_3_31Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_code = packer.GetStrbyName("pd_code", i);
                reqCommand.pd_name = packer.GetStrbyName("pd_name", i);
                reqCommand.product_id = packer.GetInt64byName("product_id", i);
                reqCommand.contrc_name = packer.GetStrbyName("contrc_name", i);
                reqCommand.contrc_code = packer.GetStrbyName("contrc_code", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.posi_market_value = packer.GetDoublebyName("posi_market_value", i);
                reqCommand.stock_acco = packer.GetStrbyName("stock_acco", i);
                reqCommand.futu_acco = packer.GetStrbyName("futu_acco", i);
                reqCommand.asset_acco = packer.GetStrbyName("asset_acco", i);
                reqCommand.invest_type = packer.GetIntbyName("invest_type", i);
                reqCommand.lngsht_type = packer.GetIntbyName("lngsht_type", i);
                reqCommand.contrc_unit = packer.GetIntbyName("contrc_unit", i);
                reqCommand.hedge_type = packer.GetIntbyName("hedge_type", i);
                reqCommand.begin_qty = packer.GetDoublebyName("begin_qty", i);
                reqCommand.curr_qty = packer.GetDoublebyName("curr_qty", i);
                reqCommand.frozen_qty = packer.GetDoublebyName("frozen_qty", i);
                reqCommand.unfroz_qty = packer.GetDoublebyName("unfroz_qty", i);
                reqCommand.buy_pre_sett_qty = packer.GetDoublebyName("buy_pre_sett_qty", i);
                reqCommand.sell_pre_sett_qty = packer.GetDoublebyName("sell_pre_sett_qty", i);
                reqCommand.rece_margin = packer.GetDoublebyName("rece_margin", i);
                reqCommand.realize_pandl = packer.GetDoublebyName("realize_pandl", i);
                reqCommand.avail_qty = packer.GetDoublebyName("avail_qty", i);
 
                FuncrptL_3_31Models.Add(reqCommand);
            }
            return FuncrptL_3_31Models;
        }
 
        //逻辑_报表_报表查询_期货持仓产品持仓
        public static List<FuncrptL_3_31Model> GetFuncrptL_3_31Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_3_31Models = new List<FuncrptL_3_31Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_3_31Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    reqCommand.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    reqCommand.product_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_PRODUCT_ID_INT64);
                    reqCommand.contrc_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_NAME_STR);
                    reqCommand.contrc_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_MARKET_VALUE_FLOAT);
                    reqCommand.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                    reqCommand.futu_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_STR);
                    reqCommand.asset_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STR);
                    reqCommand.invest_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INVEST_TYPE_INT);
                    reqCommand.lngsht_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT);
                    reqCommand.contrc_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_UNIT_INT);
                    reqCommand.hedge_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT);
                    reqCommand.begin_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_QTY_FLOAT);
                    reqCommand.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    reqCommand.frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_QTY_FLOAT);
                    reqCommand.unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_QTY_FLOAT);
                    reqCommand.buy_pre_sett_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_PRE_SETT_QTY_FLOAT);
                    reqCommand.sell_pre_sett_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_PRE_SETT_QTY_FLOAT);
                    reqCommand.rece_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RECE_MARGIN_FLOAT);
                    reqCommand.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    reqCommand.avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVAIL_QTY_FLOAT);
                    FuncrptL_3_31Models.Add(reqCommand);
                }
            }
            return FuncrptL_3_31Models;
        }
 
        //逻辑_报表_报表查询_期货持仓产品持仓明细
        public static List<FuncrptL_3_32Model> GetFuncrptL_3_32Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_3_32Models = new List<FuncrptL_3_32Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_3_32Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.detail_posi_id = packer.GetInt64byName("detail_posi_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.product_id = packer.GetInt64byName("product_id", i);
                reqCommand.pd_code = packer.GetStrbyName("pd_code", i);
                reqCommand.pd_name = packer.GetStrbyName("pd_name", i);
                reqCommand.contrc_type = packer.GetIntbyName("contrc_type", i);
                reqCommand.contrc_code = packer.GetStrbyName("contrc_code", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.asset_acco = packer.GetStrbyName("asset_acco", i);
                reqCommand.futu_acco = packer.GetStrbyName("futu_acco", i);
                reqCommand.invest_type = packer.GetIntbyName("invest_type", i);
                reqCommand.lngsht_type = packer.GetIntbyName("lngsht_type", i);
                reqCommand.open_posi_date = packer.GetIntbyName("open_posi_date", i);
                reqCommand.open_posi_time = packer.GetIntbyName("open_posi_time", i);
                reqCommand.strike_no = packer.GetStrbyName("strike_no", i);
                reqCommand.open_posi_price = packer.GetDoublebyName("open_posi_price", i);
                reqCommand.open_posi_qty = packer.GetDoublebyName("open_posi_qty", i);
                reqCommand.trade_capt_qty = packer.GetDoublebyName("trade_capt_qty", i);
                reqCommand.strike_capt_qty = packer.GetDoublebyName("strike_capt_qty", i);
                reqCommand.open_posi_fee = packer.GetDoublebyName("open_posi_fee", i);
                reqCommand.close_posi_fee = packer.GetDoublebyName("close_posi_fee", i);
                reqCommand.marked_sett_price = packer.GetDoublebyName("marked_sett_price", i);
                reqCommand.marked_pandl = packer.GetDoublebyName("marked_pandl", i);
                reqCommand.close_pandl = packer.GetDoublebyName("close_pandl", i);
                reqCommand.rece_margin = packer.GetDoublebyName("rece_margin", i);
                reqCommand.hedge_type = packer.GetIntbyName("hedge_type", i);
                reqCommand.open_amount = packer.GetDoublebyName("open_amount", i);
 
                FuncrptL_3_32Models.Add(reqCommand);
            }
            return FuncrptL_3_32Models;
        }
 
        //逻辑_报表_报表查询_期货持仓产品持仓明细
        public static List<FuncrptL_3_32Model> GetFuncrptL_3_32Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_3_32Models = new List<FuncrptL_3_32Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_3_32Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.detail_posi_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_DETAIL_POSI_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.product_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_PRODUCT_ID_INT64);
                    reqCommand.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    reqCommand.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    reqCommand.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    reqCommand.contrc_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.asset_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STR);
                    reqCommand.futu_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_STR);
                    reqCommand.invest_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INVEST_TYPE_INT);
                    reqCommand.lngsht_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT);
                    reqCommand.open_posi_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_DATE_INT);
                    reqCommand.open_posi_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_TIME_INT);
                    reqCommand.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                    reqCommand.open_posi_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_PRICE_FLOAT);
                    reqCommand.open_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_QTY_FLOAT);
                    reqCommand.trade_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CAPT_QTY_FLOAT);
                    reqCommand.strike_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_CAPT_QTY_FLOAT);
                    reqCommand.open_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_FEE_FLOAT);
                    reqCommand.close_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_FEE_FLOAT);
                    reqCommand.marked_sett_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKED_SETT_PRICE_FLOAT);
                    reqCommand.marked_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKED_PANDL_FLOAT);
                    reqCommand.close_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_PANDL_FLOAT);
                    reqCommand.rece_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RECE_MARGIN_FLOAT);
                    reqCommand.hedge_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT);
                    reqCommand.open_amount = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_AMOUNT_FLOAT);
                    FuncrptL_3_32Models.Add(reqCommand);
                }
            }
            return FuncrptL_3_32Models;
        }
 
        //逻辑_报表_报表查询_查询产品风险指标
        public static List<FuncrptL_3_34Model> GetFuncrptL_3_34Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_3_34Models = new List<FuncrptL_3_34Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_3_34Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_code = packer.GetStrbyName("pd_code", i);
                reqCommand.pd_name = packer.GetStrbyName("pd_name", i);
                reqCommand.unit_nav = packer.GetDoublebyName("unit_nav", i);
                reqCommand.nav_asset = packer.GetDoublebyName("nav_asset", i);
                reqCommand.fund_share_total = packer.GetDoublebyName("fund_share_total", i);
                reqCommand.daily_pandl_ratio = packer.GetDoublebyName("daily_pandl_ratio", i);
                reqCommand.total_realize_pandl_ratio_year = packer.GetDoublebyName("total_realize_pandl_ratio_year", i);
                reqCommand.fund_manager = packer.GetStrbyName("fund_manager", i);
                reqCommand.standard_return = packer.GetDoublebyName("standard_return", i);
                reqCommand.cmp_product_return_rate = packer.GetDoublebyName("cmp_product_return_rate", i);
                reqCommand.trade_days = packer.GetIntbyName("trade_days", i);
                reqCommand.excess_earning_year = packer.GetDoublebyName("excess_earning_year", i);
                reqCommand.annual_yield = packer.GetDoublebyName("annual_yield", i);
                reqCommand.max_retracement = packer.GetDoublebyName("max_retracement", i);
                reqCommand.max_rise_range = packer.GetDoublebyName("max_rise_range", i);
                reqCommand.volatility = packer.GetDoublebyName("volatility", i);
                reqCommand.volatility_yearly = packer.GetDoublebyName("volatility_yearly", i);
                reqCommand.sharpe_ration = packer.GetDoublebyName("sharpe_ration", i);
                reqCommand.down_risk = packer.GetDoublebyName("down_risk", i);
                reqCommand.sortino_ratio = packer.GetDoublebyName("sortino_ratio", i);
                reqCommand.jensen_index = packer.GetDoublebyName("jensen_index", i);
                reqCommand.beta_ratio = packer.GetDoublebyName("beta_ratio", i);
                reqCommand.info_ratio = packer.GetDoublebyName("info_ratio", i);
                reqCommand.kamabi = packer.GetDoublebyName("kamabi", i);
                reqCommand.timing_ability = packer.GetDoublebyName("timing_ability", i);
                reqCommand.stock_selection_ability = packer.GetDoublebyName("stock_selection_ability", i);
 
                FuncrptL_3_34Models.Add(reqCommand);
            }
            return FuncrptL_3_34Models;
        }
 
        //逻辑_报表_报表查询_查询产品风险指标
        public static List<FuncrptL_3_34Model> GetFuncrptL_3_34Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_3_34Models = new List<FuncrptL_3_34Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_3_34Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    reqCommand.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    reqCommand.unit_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_NAV_FLOAT);
                    reqCommand.nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT);
                    reqCommand.fund_share_total = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_SHARE_TOTAL_FLOAT);
                    reqCommand.daily_pandl_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DAILY_PANDL_RATIO_FLOAT);
                    reqCommand.total_realize_pandl_ratio_year = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_REALIZE_PANDL_RATIO_YEAR_FLOAT);
                    reqCommand.fund_manager = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_STR);
                    reqCommand.standard_return = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STANDARD_RETURN_FLOAT);
                    reqCommand.cmp_product_return_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CMP_PRODUCT_RETURN_RATE_FLOAT);
                    reqCommand.trade_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_DAYS_INT);
                    reqCommand.excess_earning_year = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_EXCESS_EARNING_YEAR_FLOAT);
                    reqCommand.annual_yield = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ANNUAL_YIELD_FLOAT);
                    reqCommand.max_retracement = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_RETRACEMENT_FLOAT);
                    reqCommand.max_rise_range = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_RISE_RANGE_FLOAT);
                    reqCommand.volatility = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VOLATILITY_FLOAT);
                    reqCommand.volatility_yearly = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VOLATILITY_YEARLY_FLOAT);
                    reqCommand.sharpe_ration = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SHARPE_RATION_FLOAT);
                    reqCommand.down_risk = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DOWN_RISK_FLOAT);
                    reqCommand.sortino_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SORTINO_RATIO_FLOAT);
                    reqCommand.jensen_index = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_JENSEN_INDEX_FLOAT);
                    reqCommand.beta_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BETA_RATIO_FLOAT);
                    reqCommand.info_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INFO_RATIO_FLOAT);
                    reqCommand.kamabi = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_KAMABI_FLOAT);
                    reqCommand.timing_ability = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TIMING_ABILITY_FLOAT);
                    reqCommand.stock_selection_ability = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_SELECTION_ABILITY_FLOAT);
                    FuncrptL_3_34Models.Add(reqCommand);
                }
            }
            return FuncrptL_3_34Models;
        }
 
        //逻辑_报表_报表查询_查询产品归因效应
        public static List<FuncrptL_3_35Model> GetFuncrptL_3_35Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_3_35Models = new List<FuncrptL_3_35Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_3_35Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_code = packer.GetStrbyName("pd_code", i);
                reqCommand.pd_name = packer.GetStrbyName("pd_name", i);
                reqCommand.fund_manager = packer.GetStrbyName("fund_manager", i);
                reqCommand.annual_yield = packer.GetDoublebyName("annual_yield", i);
                reqCommand.standard_return = packer.GetDoublebyName("standard_return", i);
                reqCommand.distributional_effect_rate = packer.GetDoublebyName("distributional_effect_rate", i);
                reqCommand.selection_effect_rate = packer.GetDoublebyName("selection_effect_rate", i);
                reqCommand.interaction_effect_rate = packer.GetDoublebyName("interaction_effect_rate", i);
                reqCommand.all_effect_rate = packer.GetDoublebyName("all_effect_rate", i);
                reqCommand.cmp_product_return_rate = packer.GetDoublebyName("cmp_product_return_rate", i);
 
                FuncrptL_3_35Models.Add(reqCommand);
            }
            return FuncrptL_3_35Models;
        }
 
        //逻辑_报表_报表查询_查询产品归因效应
        public static List<FuncrptL_3_35Model> GetFuncrptL_3_35Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_3_35Models = new List<FuncrptL_3_35Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_3_35Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    reqCommand.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    reqCommand.fund_manager = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_STR);
                    reqCommand.annual_yield = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ANNUAL_YIELD_FLOAT);
                    reqCommand.standard_return = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STANDARD_RETURN_FLOAT);
                    reqCommand.distributional_effect_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DISTRIBUTIONAL_EFFECT_RATE_FLOAT);
                    reqCommand.selection_effect_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELECTION_EFFECT_RATE_FLOAT);
                    reqCommand.interaction_effect_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTERACTION_EFFECT_RATE_FLOAT);
                    reqCommand.all_effect_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_EFFECT_RATE_FLOAT);
                    reqCommand.cmp_product_return_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CMP_PRODUCT_RETURN_RATE_FLOAT);
                    FuncrptL_3_35Models.Add(reqCommand);
                }
            }
            return FuncrptL_3_35Models;
        }
 
        //逻辑_报表_报表查询_查询产品区间交易统计
        public static List<FuncrptL_3_36Model> GetFuncrptL_3_36Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_3_36Models = new List<FuncrptL_3_36Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_3_36Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.begin_date = packer.GetIntbyName("begin_date", i);
                reqCommand.end_date = packer.GetIntbyName("end_date", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_code = packer.GetStrbyName("pd_code", i);
                reqCommand.pd_name = packer.GetStrbyName("pd_name", i);
                reqCommand.trade_stock_cnt = packer.GetIntbyName("trade_stock_cnt", i);
                reqCommand.profit_total = packer.GetDoublebyName("profit_total", i);
                reqCommand.profit_stock_cnt = packer.GetIntbyName("profit_stock_cnt", i);
                reqCommand.loss_stock_cnt = packer.GetIntbyName("loss_stock_cnt", i);
                reqCommand.profit_balance = packer.GetDoublebyName("profit_balance", i);
                reqCommand.loss_balance = packer.GetDoublebyName("loss_balance", i);
                reqCommand.win_rate = packer.GetDoublebyName("win_rate", i);
                reqCommand.profit_loss_ratio = packer.GetDoublebyName("profit_loss_ratio", i);
                reqCommand.max_stock_10_ratio = packer.GetDoublebyName("max_stock_10_ratio", i);
                reqCommand.max_stock_10_avg_days = packer.GetIntbyName("max_stock_10_avg_days", i);
                reqCommand.tnover_rate = packer.GetDoublebyName("tnover_rate", i);
 
                FuncrptL_3_36Models.Add(reqCommand);
            }
            return FuncrptL_3_36Models;
        }
 
        //逻辑_报表_报表查询_查询产品区间交易统计
        public static List<FuncrptL_3_36Model> GetFuncrptL_3_36Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_3_36Models = new List<FuncrptL_3_36Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_3_36Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT);
                    reqCommand.end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    reqCommand.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    reqCommand.trade_stock_cnt = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_STOCK_CNT_INT);
                    reqCommand.profit_total = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PROFIT_TOTAL_FLOAT);
                    reqCommand.profit_stock_cnt = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PROFIT_STOCK_CNT_INT);
                    reqCommand.loss_stock_cnt = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LOSS_STOCK_CNT_INT);
                    reqCommand.profit_balance = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PROFIT_BALANCE_FLOAT);
                    reqCommand.loss_balance = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOSS_BALANCE_FLOAT);
                    reqCommand.win_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WIN_RATE_FLOAT);
                    reqCommand.profit_loss_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PROFIT_LOSS_RATIO_FLOAT);
                    reqCommand.max_stock_10_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_STOCK_10_RATIO_FLOAT);
                    reqCommand.max_stock_10_avg_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MAX_STOCK_10_AVG_DAYS_INT);
                    reqCommand.tnover_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TNOVER_RATE_FLOAT);
                    FuncrptL_3_36Models.Add(reqCommand);
                }
            }
            return FuncrptL_3_36Models;
        }
 
        //逻辑_报表_报表查询_查询产品债券月度持仓统计
        public static List<FuncrptL_3_37Model> GetFuncrptL_3_37Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_3_37Models = new List<FuncrptL_3_37Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_3_37Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.curr_month = packer.GetIntbyName("curr_month", i);
                reqCommand.trade_days = packer.GetIntbyName("trade_days", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.pd_code = packer.GetStrbyName("pd_code", i);
                reqCommand.pd_name = packer.GetStrbyName("pd_name", i);
                reqCommand.bond_code = packer.GetStrbyName("bond_code", i);
                reqCommand.stock_name = packer.GetStrbyName("stock_name", i);
                reqCommand.curr_qty = packer.GetDoublebyName("curr_qty", i);
                reqCommand.intrst_ratio = packer.GetDoublebyName("intrst_ratio", i);
                reqCommand.begin_date = packer.GetIntbyName("begin_date", i);
                reqCommand.begin_value = packer.GetDoublebyName("begin_value", i);
                reqCommand.begin_net_price = packer.GetDoublebyName("begin_net_price", i);
                reqCommand.begin_full_price = packer.GetDoublebyName("begin_full_price", i);
                reqCommand.end_date = packer.GetIntbyName("end_date", i);
                reqCommand.end_value = packer.GetDoublebyName("end_value", i);
                reqCommand.end_net_price = packer.GetDoublebyName("end_net_price", i);
                reqCommand.end_full_price = packer.GetDoublebyName("end_full_price", i);
                reqCommand.pay_interest_term = packer.GetDoublebyName("pay_interest_term", i);
                reqCommand.profit_from_capital = packer.GetDoublebyName("profit_from_capital", i);
                reqCommand.coupon_yield = packer.GetDoublebyName("coupon_yield", i);
                reqCommand.cb_profit = packer.GetDoublebyName("cb_profit", i);
                reqCommand.bond_kind = packer.GetIntbyName("bond_kind", i);
                reqCommand.recover_capital = packer.GetDoublebyName("recover_capital", i);
                reqCommand.value_price_modi_dur = packer.GetDoublebyName("value_price_modi_dur", i);
 
                FuncrptL_3_37Models.Add(reqCommand);
            }
            return FuncrptL_3_37Models;
        }
 
        //逻辑_报表_报表查询_查询产品债券月度持仓统计
        public static List<FuncrptL_3_37Model> GetFuncrptL_3_37Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_3_37Models = new List<FuncrptL_3_37Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_3_37Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.curr_month = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONTH_INT);
                    reqCommand.trade_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_DAYS_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    reqCommand.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    reqCommand.bond_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BOND_CODE_STR);
                    reqCommand.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    reqCommand.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    reqCommand.intrst_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_RATIO_FLOAT);
                    reqCommand.begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT);
                    reqCommand.begin_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_VALUE_FLOAT);
                    reqCommand.begin_net_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_NET_PRICE_FLOAT);
                    reqCommand.begin_full_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_FULL_PRICE_FLOAT);
                    reqCommand.end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT);
                    reqCommand.end_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_END_VALUE_FLOAT);
                    reqCommand.end_net_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_END_NET_PRICE_FLOAT);
                    reqCommand.end_full_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_END_FULL_PRICE_FLOAT);
                    reqCommand.pay_interest_term = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAY_INTEREST_TERM_FLOAT);
                    reqCommand.profit_from_capital = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PROFIT_FROM_CAPITAL_FLOAT);
                    reqCommand.coupon_yield = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COUPON_YIELD_FLOAT);
                    reqCommand.cb_profit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CB_PROFIT_FLOAT);
                    reqCommand.bond_kind = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BOND_KIND_INT);
                    reqCommand.recover_capital = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RECOVER_CAPITAL_FLOAT);
                    reqCommand.value_price_modi_dur = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VALUE_PRICE_MODI_DUR_FLOAT);
                    FuncrptL_3_37Models.Add(reqCommand);
                }
            }
            return FuncrptL_3_37Models;
        }
 
        //逻辑_报表_报表查询_查询产品债券月度交易明细
        public static List<FuncrptL_3_38Model> GetFuncrptL_3_38Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_3_38Models = new List<FuncrptL_3_38Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_3_38Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.curr_month = packer.GetIntbyName("curr_month", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_code = packer.GetStrbyName("pd_code", i);
                reqCommand.pd_name = packer.GetStrbyName("pd_name", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.bond_code = packer.GetStrbyName("bond_code", i);
                reqCommand.stock_name = packer.GetStrbyName("stock_name", i);
                reqCommand.trade_qty = packer.GetDoublebyName("trade_qty", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.trade_date = packer.GetIntbyName("trade_date", i);
                reqCommand.bank_ib_member = packer.GetStrbyName("bank_ib_member", i);
                reqCommand.value_yield = packer.GetDoublebyName("value_yield", i);
                reqCommand.value_net_price = packer.GetDoublebyName("value_net_price", i);
                reqCommand.trade_yield = packer.GetDoublebyName("trade_yield", i);
                reqCommand.trade_net_price = packer.GetDoublebyName("trade_net_price", i);
                reqCommand.profit = packer.GetDoublebyName("profit", i);
                reqCommand.bond_kind = packer.GetIntbyName("bond_kind", i);
 
                FuncrptL_3_38Models.Add(reqCommand);
            }
            return FuncrptL_3_38Models;
        }
 
        //逻辑_报表_报表查询_查询产品债券月度交易明细
        public static List<FuncrptL_3_38Model> GetFuncrptL_3_38Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_3_38Models = new List<FuncrptL_3_38Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_3_38Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.curr_month = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONTH_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    reqCommand.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.bond_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BOND_CODE_STR);
                    reqCommand.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    reqCommand.trade_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_QTY_FLOAT);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.trade_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_DATE_INT);
                    reqCommand.bank_ib_member = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BANK_IB_MEMBER_STR);
                    reqCommand.value_yield = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VALUE_YIELD_FLOAT);
                    reqCommand.value_net_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VALUE_NET_PRICE_FLOAT);
                    reqCommand.trade_yield = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_YIELD_FLOAT);
                    reqCommand.trade_net_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_NET_PRICE_FLOAT);
                    reqCommand.profit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PROFIT_FLOAT);
                    reqCommand.bond_kind = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BOND_KIND_INT);
                    FuncrptL_3_38Models.Add(reqCommand);
                }
            }
            return FuncrptL_3_38Models;
        }
 
        //逻辑_报表_报表查询_查询产品债券月度交易汇总
        public static List<FuncrptL_3_39Model> GetFuncrptL_3_39Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_3_39Models = new List<FuncrptL_3_39Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_3_39Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.curr_month = packer.GetIntbyName("curr_month", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_code = packer.GetStrbyName("pd_code", i);
                reqCommand.pd_name = packer.GetStrbyName("pd_name", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.bond_code = packer.GetStrbyName("bond_code", i);
                reqCommand.stock_name = packer.GetStrbyName("stock_name", i);
                reqCommand.bond_type = packer.GetIntbyName("bond_type", i);
                reqCommand.avg_invest_ratio = packer.GetDoublebyName("avg_invest_ratio", i);
                reqCommand.avg_yield = packer.GetDoublebyName("avg_yield", i);
                reqCommand.yield_ratio = packer.GetDoublebyName("yield_ratio", i);
                reqCommand.holder_profit = packer.GetDoublebyName("holder_profit", i);
                reqCommand.trade_profit = packer.GetDoublebyName("trade_profit", i);
                reqCommand.total_profit = packer.GetDoublebyName("total_profit", i);
                reqCommand.bond_cr_level = packer.GetDoublebyName("bond_cr_level", i);
                reqCommand.rem_per = packer.GetDoublebyName("rem_per", i);
                reqCommand.bond_limit = packer.GetDoublebyName("bond_limit", i);
 
                FuncrptL_3_39Models.Add(reqCommand);
            }
            return FuncrptL_3_39Models;
        }
 
        //逻辑_报表_报表查询_查询产品债券月度交易汇总
        public static List<FuncrptL_3_39Model> GetFuncrptL_3_39Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_3_39Models = new List<FuncrptL_3_39Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_3_39Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.curr_month = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONTH_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    reqCommand.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.bond_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BOND_CODE_STR);
                    reqCommand.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    reqCommand.bond_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BOND_TYPE_INT);
                    reqCommand.avg_invest_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVG_INVEST_RATIO_FLOAT);
                    reqCommand.avg_yield = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVG_YIELD_FLOAT);
                    reqCommand.yield_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_YIELD_RATIO_FLOAT);
                    reqCommand.holder_profit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HOLDER_PROFIT_FLOAT);
                    reqCommand.trade_profit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_PROFIT_FLOAT);
                    reqCommand.total_profit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_PROFIT_FLOAT);
                    reqCommand.bond_cr_level = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_CR_LEVEL_FLOAT);
                    reqCommand.rem_per = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REM_PER_FLOAT);
                    reqCommand.bond_limit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_LIMIT_FLOAT);
                    FuncrptL_3_39Models.Add(reqCommand);
                }
            }
            return FuncrptL_3_39Models;
        }
 
        //逻辑_报表_报表查询_查询产品债券月度资产统计
        public static List<FuncrptL_3_40Model> GetFuncrptL_3_40Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_3_40Models = new List<FuncrptL_3_40Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_3_40Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.curr_month = packer.GetIntbyName("curr_month", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_code = packer.GetStrbyName("pd_code", i);
                reqCommand.pd_name = packer.GetStrbyName("pd_name", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.asset_type = packer.GetIntbyName("asset_type", i);
                reqCommand.begin_invest_ratio = packer.GetDoublebyName("begin_invest_ratio", i);
                reqCommand.end_invest_ratio = packer.GetDoublebyName("end_invest_ratio", i);
                reqCommand.avg_invest_ratio = packer.GetDoublebyName("avg_invest_ratio", i);
                reqCommand.return_on_investment = packer.GetDoublebyName("return_on_investment", i);
                reqCommand.yield_ratio = packer.GetDoublebyName("yield_ratio", i);
                reqCommand.cmp_ytm = packer.GetDoublebyName("cmp_ytm", i);
                reqCommand.excess_earning_year = packer.GetDoublebyName("excess_earning_year", i);
                reqCommand.begin_market_value = packer.GetDoublebyName("begin_market_value", i);
                reqCommand.end_market_value = packer.GetDoublebyName("end_market_value", i);
                reqCommand.avg_market_value = packer.GetDoublebyName("avg_market_value", i);
                reqCommand.holder_profit = packer.GetDoublebyName("holder_profit", i);
                reqCommand.trade_profit = packer.GetDoublebyName("trade_profit", i);
                reqCommand.total_profit = packer.GetDoublebyName("total_profit", i);
 
                FuncrptL_3_40Models.Add(reqCommand);
            }
            return FuncrptL_3_40Models;
        }
 
        //逻辑_报表_报表查询_查询产品债券月度资产统计
        public static List<FuncrptL_3_40Model> GetFuncrptL_3_40Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_3_40Models = new List<FuncrptL_3_40Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_3_40Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.curr_month = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONTH_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    reqCommand.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    reqCommand.begin_invest_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_INVEST_RATIO_FLOAT);
                    reqCommand.end_invest_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_END_INVEST_RATIO_FLOAT);
                    reqCommand.avg_invest_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVG_INVEST_RATIO_FLOAT);
                    reqCommand.return_on_investment = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RETURN_ON_INVESTMENT_FLOAT);
                    reqCommand.yield_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_YIELD_RATIO_FLOAT);
                    reqCommand.cmp_ytm = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CMP_YTM_FLOAT);
                    reqCommand.excess_earning_year = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_EXCESS_EARNING_YEAR_FLOAT);
                    reqCommand.begin_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_MARKET_VALUE_FLOAT);
                    reqCommand.end_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_END_MARKET_VALUE_FLOAT);
                    reqCommand.avg_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVG_MARKET_VALUE_FLOAT);
                    reqCommand.holder_profit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HOLDER_PROFIT_FLOAT);
                    reqCommand.trade_profit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_PROFIT_FLOAT);
                    reqCommand.total_profit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_PROFIT_FLOAT);
                    FuncrptL_3_40Models.Add(reqCommand);
                }
            }
            return FuncrptL_3_40Models;
        }
 
        //逻辑_报表_报表查询_查询产品持仓明细
        public static List<FuncrptL_3_61Model> GetFuncrptL_3_61Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_3_61Models = new List<FuncrptL_3_61Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_3_61Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.pd_code = packer.GetStrbyName("pd_code", i);
                reqCommand.pd_name = packer.GetStrbyName("pd_name", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_name = packer.GetStrbyName("stock_name", i);
                reqCommand.stock_asset_value = packer.GetDoublebyName("stock_asset_value", i);
                reqCommand.cost_price = packer.GetDoublebyName("cost_price", i);
                reqCommand.posi_qty = packer.GetDoublebyName("posi_qty", i);
                reqCommand.cost_amt = packer.GetDoublebyName("cost_amt", i);
                reqCommand.float_pandl = packer.GetDoublebyName("float_pandl", i);
                reqCommand.weight_ratio = packer.GetDoublebyName("weight_ratio", i);
 
                FuncrptL_3_61Models.Add(reqCommand);
            }
            return FuncrptL_3_61Models;
        }
 
        //逻辑_报表_报表查询_查询产品持仓明细
        public static List<FuncrptL_3_61Model> GetFuncrptL_3_61Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_3_61Models = new List<FuncrptL_3_61Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_3_61Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    reqCommand.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    reqCommand.stock_asset_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_VALUE_FLOAT);
                    reqCommand.cost_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_PRICE_FLOAT);
                    reqCommand.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    reqCommand.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                    reqCommand.float_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FLOAT_PANDL_FLOAT);
                    reqCommand.weight_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WEIGHT_RATIO_FLOAT);
                    FuncrptL_3_61Models.Add(reqCommand);
                }
            }
            return FuncrptL_3_61Models;
        }
 
        //逻辑_报表_报表查询_查询产品交易明细
        public static List<FuncrptL_3_62Model> GetFuncrptL_3_62Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_3_62Models = new List<FuncrptL_3_62Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_3_62Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.pd_code = packer.GetStrbyName("pd_code", i);
                reqCommand.pd_name = packer.GetStrbyName("pd_name", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_name = packer.GetStrbyName("stock_name", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.order_price = packer.GetDoublebyName("order_price", i);
                reqCommand.order_qty = packer.GetDoublebyName("order_qty", i);
                reqCommand.order_frozen_amt = packer.GetDoublebyName("order_frozen_amt", i);
                reqCommand.strike_amt = packer.GetDoublebyName("strike_amt", i);
                reqCommand.strike_qty = packer.GetDoublebyName("strike_qty", i);
                reqCommand.asset_type = packer.GetIntbyName("asset_type", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
 
                FuncrptL_3_62Models.Add(reqCommand);
            }
            return FuncrptL_3_62Models;
        }
 
        //逻辑_报表_报表查询_查询产品交易明细
        public static List<FuncrptL_3_62Model> GetFuncrptL_3_62Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_3_62Models = new List<FuncrptL_3_62Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_3_62Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    reqCommand.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    reqCommand.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    reqCommand.order_frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_FROZEN_AMT_FLOAT);
                    reqCommand.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    reqCommand.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    reqCommand.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    FuncrptL_3_62Models.Add(reqCommand);
                }
            }
            return FuncrptL_3_62Models;
        }
 
        //逻辑_报表_报表查询_查询产品交易汇总方向
        public static List<FuncrptL_3_63Model> GetFuncrptL_3_63Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_3_63Models = new List<FuncrptL_3_63Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_3_63Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.pd_code = packer.GetStrbyName("pd_code", i);
                reqCommand.pd_name = packer.GetStrbyName("pd_name", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.order_frozen_amt = packer.GetDoublebyName("order_frozen_amt", i);
                reqCommand.strike_amt = packer.GetDoublebyName("strike_amt", i);
                reqCommand.asset_type = packer.GetIntbyName("asset_type", i);
 
                FuncrptL_3_63Models.Add(reqCommand);
            }
            return FuncrptL_3_63Models;
        }
 
        //逻辑_报表_报表查询_查询产品交易汇总方向
        public static List<FuncrptL_3_63Model> GetFuncrptL_3_63Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_3_63Models = new List<FuncrptL_3_63Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_3_63Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    reqCommand.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.order_frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_FROZEN_AMT_FLOAT);
                    reqCommand.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    reqCommand.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    FuncrptL_3_63Models.Add(reqCommand);
                }
            }
            return FuncrptL_3_63Models;
        }
 
        //逻辑_报表_报表查询_查询产品交易汇总证券机构
        public static List<FuncrptL_3_64Model> GetFuncrptL_3_64Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_3_64Models = new List<FuncrptL_3_64Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_3_64Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_name = packer.GetStrbyName("stock_name", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.order_frozen_amt = packer.GetDoublebyName("order_frozen_amt", i);
                reqCommand.strike_amt = packer.GetDoublebyName("strike_amt", i);
                reqCommand.asset_type = packer.GetIntbyName("asset_type", i);
 
                FuncrptL_3_64Models.Add(reqCommand);
            }
            return FuncrptL_3_64Models;
        }
 
        //逻辑_报表_报表查询_查询产品交易汇总证券机构
        public static List<FuncrptL_3_64Model> GetFuncrptL_3_64Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_3_64Models = new List<FuncrptL_3_64Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_3_64Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.order_frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_FROZEN_AMT_FLOAT);
                    reqCommand.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    reqCommand.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    FuncrptL_3_64Models.Add(reqCommand);
                }
            }
            return FuncrptL_3_64Models;
        }
 
        //逻辑_报表_报表查询_查询产品持仓汇总
        public static List<FuncrptL_3_66Model> GetFuncrptL_3_66Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_3_66Models = new List<FuncrptL_3_66Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_3_66Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.pd_code = packer.GetStrbyName("pd_code", i);
                reqCommand.pd_name = packer.GetStrbyName("pd_name", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_name = packer.GetStrbyName("stock_name", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.today_buy_qty = packer.GetDoublebyName("today_buy_qty", i);
                reqCommand.today_sell_qty = packer.GetDoublebyName("today_sell_qty", i);
                reqCommand.posi_qty = packer.GetDoublebyName("posi_qty", i);
                reqCommand.cost_price = packer.GetDoublebyName("cost_price", i);
                reqCommand.today_close_price = packer.GetDoublebyName("today_close_price", i);
                reqCommand.posi_market_value = packer.GetDoublebyName("posi_market_value", i);
 
                FuncrptL_3_66Models.Add(reqCommand);
            }
            return FuncrptL_3_66Models;
        }
 
        //逻辑_报表_报表查询_查询产品持仓汇总
        public static List<FuncrptL_3_66Model> GetFuncrptL_3_66Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_3_66Models = new List<FuncrptL_3_66Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_3_66Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    reqCommand.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.today_buy_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_BUY_QTY_FLOAT);
                    reqCommand.today_sell_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_SELL_QTY_FLOAT);
                    reqCommand.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    reqCommand.cost_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_PRICE_FLOAT);
                    reqCommand.today_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_CLOSE_PRICE_FLOAT);
                    reqCommand.posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_MARKET_VALUE_FLOAT);
                    FuncrptL_3_66Models.Add(reqCommand);
                }
            }
            return FuncrptL_3_66Models;
        }
 
        //逻辑_报表_报表查询_查询机构持仓汇总
        public static List<FuncrptL_3_67Model> GetFuncrptL_3_67Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_3_67Models = new List<FuncrptL_3_67Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_3_67Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_name = packer.GetStrbyName("stock_name", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.today_buy_qty = packer.GetDoublebyName("today_buy_qty", i);
                reqCommand.today_sell_qty = packer.GetDoublebyName("today_sell_qty", i);
                reqCommand.posi_qty = packer.GetDoublebyName("posi_qty", i);
                reqCommand.today_close_price = packer.GetDoublebyName("today_close_price", i);
                reqCommand.posi_market_value = packer.GetDoublebyName("posi_market_value", i);
                reqCommand.posi_nav_ratio = packer.GetDoublebyName("posi_nav_ratio", i);
 
                FuncrptL_3_67Models.Add(reqCommand);
            }
            return FuncrptL_3_67Models;
        }
 
        //逻辑_报表_报表查询_查询机构持仓汇总
        public static List<FuncrptL_3_67Model> GetFuncrptL_3_67Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_3_67Models = new List<FuncrptL_3_67Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_3_67Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.today_buy_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_BUY_QTY_FLOAT);
                    reqCommand.today_sell_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_SELL_QTY_FLOAT);
                    reqCommand.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    reqCommand.today_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_CLOSE_PRICE_FLOAT);
                    reqCommand.posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_MARKET_VALUE_FLOAT);
                    reqCommand.posi_nav_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_NAV_RATIO_FLOAT);
                    FuncrptL_3_67Models.Add(reqCommand);
                }
            }
            return FuncrptL_3_67Models;
        }
 
        //逻辑_报表_报表查询_查询产品持仓交易汇总
        public static List<FuncrptL_3_68Model> GetFuncrptL_3_68Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_3_68Models = new List<FuncrptL_3_68Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_3_68Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.pd_code = packer.GetStrbyName("pd_code", i);
                reqCommand.pd_name = packer.GetStrbyName("pd_name", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_name = packer.GetStrbyName("stock_name", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.pre_holding_qty = packer.GetDoublebyName("pre_holding_qty", i);
                reqCommand.today_buy_qty = packer.GetDoublebyName("today_buy_qty", i);
                reqCommand.today_buy_amt = packer.GetDoublebyName("today_buy_amt", i);
                reqCommand.today_buy_price = packer.GetDoublebyName("today_buy_price", i);
                reqCommand.buy_begin_time = packer.GetIntbyName("buy_begin_time", i);
                reqCommand.buy_end_time = packer.GetIntbyName("buy_end_time", i);
                reqCommand.today_sell_qty = packer.GetDoublebyName("today_sell_qty", i);
                reqCommand.today_sell_amt = packer.GetDoublebyName("today_sell_amt", i);
                reqCommand.today_sell_price = packer.GetDoublebyName("today_sell_price", i);
                reqCommand.sell_begin_time = packer.GetIntbyName("sell_begin_time", i);
                reqCommand.sell_end_time = packer.GetIntbyName("sell_end_time", i);
                reqCommand.posi_qty = packer.GetDoublebyName("posi_qty", i);
                reqCommand.today_close_price = packer.GetDoublebyName("today_close_price", i);
                reqCommand.posi_market_value = packer.GetDoublebyName("posi_market_value", i);
 
                FuncrptL_3_68Models.Add(reqCommand);
            }
            return FuncrptL_3_68Models;
        }
 
        //逻辑_报表_报表查询_查询产品持仓交易汇总
        public static List<FuncrptL_3_68Model> GetFuncrptL_3_68Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_3_68Models = new List<FuncrptL_3_68Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_3_68Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    reqCommand.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.pre_holding_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_HOLDING_QTY_FLOAT);
                    reqCommand.today_buy_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_BUY_QTY_FLOAT);
                    reqCommand.today_buy_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_BUY_AMT_FLOAT);
                    reqCommand.today_buy_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_BUY_PRICE_FLOAT);
                    reqCommand.buy_begin_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUY_BEGIN_TIME_INT);
                    reqCommand.buy_end_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUY_END_TIME_INT);
                    reqCommand.today_sell_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_SELL_QTY_FLOAT);
                    reqCommand.today_sell_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_SELL_AMT_FLOAT);
                    reqCommand.today_sell_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_SELL_PRICE_FLOAT);
                    reqCommand.sell_begin_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SELL_BEGIN_TIME_INT);
                    reqCommand.sell_end_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SELL_END_TIME_INT);
                    reqCommand.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    reqCommand.today_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_CLOSE_PRICE_FLOAT);
                    reqCommand.posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_MARKET_VALUE_FLOAT);
                    FuncrptL_3_68Models.Add(reqCommand);
                }
            }
            return FuncrptL_3_68Models;
        }
 
        //逻辑_报表_报表查询_查询交易组资产持仓附加属性
        public static List<FuncrptL_3_81Model> GetFuncrptL_3_81Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_3_81Models = new List<FuncrptL_3_81Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_3_81Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.exch_group_pd_share = packer.GetDoublebyName("exch_group_pd_share", i);
                reqCommand.unit_nav = packer.GetDoublebyName("unit_nav", i);
                reqCommand.pre_nav = packer.GetDoublebyName("pre_nav", i);
                reqCommand.nav_asset = packer.GetDoublebyName("nav_asset", i);
                reqCommand.nav_fluct = packer.GetDoublebyName("nav_fluct", i);
                reqCommand.posi_ratio = packer.GetDoublebyName("posi_ratio", i);
                reqCommand.securities_ratio = packer.GetDoublebyName("securities_ratio", i);
                reqCommand.float_pandl = packer.GetDoublebyName("float_pandl", i);
                reqCommand.realize_pandl = packer.GetDoublebyName("realize_pandl", i);
                reqCommand.total_divi_amt = packer.GetDoublebyName("total_divi_amt", i);
                reqCommand.first_asset = packer.GetDoublebyName("first_asset", i);
                reqCommand.strategy_type = packer.GetIntbyName("strategy_type", i);
                reqCommand.total_pre_fee = packer.GetDoublebyName("total_pre_fee", i);
                reqCommand.posi_market_value = packer.GetDoublebyName("posi_market_value", i);
                reqCommand.cash_asset = packer.GetDoublebyName("cash_asset", i);
                reqCommand.stock_asset = packer.GetDoublebyName("stock_asset", i);
                reqCommand.bond_asset = packer.GetDoublebyName("bond_asset", i);
                reqCommand.fund_asset = packer.GetDoublebyName("fund_asset", i);
                reqCommand.repo_asset = packer.GetDoublebyName("repo_asset", i);
                reqCommand.other_asset = packer.GetDoublebyName("other_asset", i);
                reqCommand.total_payab_amt = packer.GetDoublebyName("total_payab_amt", i);
                reqCommand.total_rece_amt = packer.GetDoublebyName("total_rece_amt", i);
 
                FuncrptL_3_81Models.Add(reqCommand);
            }
            return FuncrptL_3_81Models;
        }
 
        //逻辑_报表_报表查询_查询交易组资产持仓附加属性
        public static List<FuncrptL_3_81Model> GetFuncrptL_3_81Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_3_81Models = new List<FuncrptL_3_81Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_3_81Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.exch_group_pd_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_PD_SHARE_FLOAT);
                    reqCommand.unit_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_NAV_FLOAT);
                    reqCommand.pre_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_NAV_FLOAT);
                    reqCommand.nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT);
                    reqCommand.nav_fluct = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_FLUCT_FLOAT);
                    reqCommand.posi_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_RATIO_FLOAT);
                    reqCommand.securities_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SECURITIES_RATIO_FLOAT);
                    reqCommand.float_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FLOAT_PANDL_FLOAT);
                    reqCommand.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    reqCommand.total_divi_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_DIVI_AMT_FLOAT);
                    reqCommand.first_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FIRST_ASSET_FLOAT);
                    reqCommand.strategy_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_TYPE_INT);
                    reqCommand.total_pre_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_PRE_FEE_FLOAT);
                    reqCommand.posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_MARKET_VALUE_FLOAT);
                    reqCommand.cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_ASSET_FLOAT);
                    reqCommand.stock_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_FLOAT);
                    reqCommand.bond_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ASSET_FLOAT);
                    reqCommand.fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_ASSET_FLOAT);
                    reqCommand.repo_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPO_ASSET_FLOAT);
                    reqCommand.other_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_ASSET_FLOAT);
                    reqCommand.total_payab_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_PAYAB_AMT_FLOAT);
                    reqCommand.total_rece_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_RECE_AMT_FLOAT);
                    FuncrptL_3_81Models.Add(reqCommand);
                }
            }
            return FuncrptL_3_81Models;
        }
 
        //逻辑_报表_报表查询_查询机构证券持仓成交
        public static List<FuncrptL_3_82Model> GetFuncrptL_3_82Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_3_82Models = new List<FuncrptL_3_82Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_3_82Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.posi_market_value = packer.GetDoublebyName("posi_market_value", i);
                reqCommand.strike_amt = packer.GetDoublebyName("strike_amt", i);
 
                FuncrptL_3_82Models.Add(reqCommand);
            }
            return FuncrptL_3_82Models;
        }
 
        //逻辑_报表_报表查询_查询机构证券持仓成交
        public static List<FuncrptL_3_82Model> GetFuncrptL_3_82Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_3_82Models = new List<FuncrptL_3_82Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_3_82Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_MARKET_VALUE_FLOAT);
                    reqCommand.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    FuncrptL_3_82Models.Add(reqCommand);
                }
            }
            return FuncrptL_3_82Models;
        }
 
        //逻辑_报表_报表查询_查询交易组证券持仓明细
        public static List<FuncrptL_3_83Model> GetFuncrptL_3_83Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_3_83Models = new List<FuncrptL_3_83Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_3_83Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.posi_market_value = packer.GetDoublebyName("posi_market_value", i);
                reqCommand.posi_ratio = packer.GetDoublebyName("posi_ratio", i);
                reqCommand.float_pandl = packer.GetDoublebyName("float_pandl", i);
                reqCommand.curr_qty = packer.GetDoublebyName("curr_qty", i);
                reqCommand.cost_amt = packer.GetDoublebyName("cost_amt", i);
                reqCommand.realize_pandl = packer.GetDoublebyName("realize_pandl", i);
                reqCommand.cost_price = packer.GetDoublebyName("cost_price", i);
                reqCommand.last_price = packer.GetDoublebyName("last_price", i);
 
                FuncrptL_3_83Models.Add(reqCommand);
            }
            return FuncrptL_3_83Models;
        }
 
        //逻辑_报表_报表查询_查询交易组证券持仓明细
        public static List<FuncrptL_3_83Model> GetFuncrptL_3_83Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_3_83Models = new List<FuncrptL_3_83Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_3_83Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_MARKET_VALUE_FLOAT);
                    reqCommand.posi_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_RATIO_FLOAT);
                    reqCommand.float_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FLOAT_PANDL_FLOAT);
                    reqCommand.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    reqCommand.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                    reqCommand.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    reqCommand.cost_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_PRICE_FLOAT);
                    reqCommand.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    FuncrptL_3_83Models.Add(reqCommand);
                }
            }
            return FuncrptL_3_83Models;
        }
 
        //逻辑_报表_报表查询_查询交易组持仓区间盈亏
        public static List<FuncrptL_3_101Model> GetFuncrptL_3_101Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_3_101Models = new List<FuncrptL_3_101Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_3_101Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.begin_date = packer.GetIntbyName("begin_date", i);
                reqCommand.end_date = packer.GetIntbyName("end_date", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.asset_type = packer.GetIntbyName("asset_type", i);
                reqCommand.begin_close_price = packer.GetDoublebyName("begin_close_price", i);
                reqCommand.begin_qty = packer.GetDoublebyName("begin_qty", i);
                reqCommand.begin_cost_amt = packer.GetDoublebyName("begin_cost_amt", i);
                reqCommand.begin_posi_market_value = packer.GetDoublebyName("begin_posi_market_value", i);
                reqCommand.begin_realize_pandl = packer.GetDoublebyName("begin_realize_pandl", i);
                reqCommand.end_close_price = packer.GetDoublebyName("end_close_price", i);
                reqCommand.end_cur_qty = packer.GetIntbyName("end_cur_qty", i);
                reqCommand.end_cost_amt = packer.GetDoublebyName("end_cost_amt", i);
                reqCommand.end_posi_market_value = packer.GetDoublebyName("end_posi_market_value", i);
                reqCommand.end_realize_pandl = packer.GetDoublebyName("end_realize_pandl", i);
                reqCommand.float_pandl = packer.GetDoublebyName("float_pandl", i);
                reqCommand.interval_realize_pandl = packer.GetDoublebyName("interval_realize_pandl", i);
                reqCommand.interval_pandl = packer.GetDoublebyName("interval_pandl", i);
 
                FuncrptL_3_101Models.Add(reqCommand);
            }
            return FuncrptL_3_101Models;
        }
 
        //逻辑_报表_报表查询_查询交易组持仓区间盈亏
        public static List<FuncrptL_3_101Model> GetFuncrptL_3_101Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_3_101Models = new List<FuncrptL_3_101Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_3_101Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT);
                    reqCommand.end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    reqCommand.begin_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_CLOSE_PRICE_FLOAT);
                    reqCommand.begin_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_QTY_FLOAT);
                    reqCommand.begin_cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_COST_AMT_FLOAT);
                    reqCommand.begin_posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_POSI_MARKET_VALUE_FLOAT);
                    reqCommand.begin_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_REALIZE_PANDL_FLOAT);
                    reqCommand.end_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_END_CLOSE_PRICE_FLOAT);
                    reqCommand.end_cur_qty = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_CUR_QTY_INT);
                    reqCommand.end_cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_END_COST_AMT_FLOAT);
                    reqCommand.end_posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_END_POSI_MARKET_VALUE_FLOAT);
                    reqCommand.end_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_END_REALIZE_PANDL_FLOAT);
                    reqCommand.float_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FLOAT_PANDL_FLOAT);
                    reqCommand.interval_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTERVAL_REALIZE_PANDL_FLOAT);
                    reqCommand.interval_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTERVAL_PANDL_FLOAT);
                    FuncrptL_3_101Models.Add(reqCommand);
                }
            }
            return FuncrptL_3_101Models;
        }
 
        //逻辑_报表_报表查询_查询交易组持仓区间盈亏行业
        public static List<FuncrptL_3_102Model> GetFuncrptL_3_102Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_3_102Models = new List<FuncrptL_3_102Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_3_102Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.begin_date = packer.GetIntbyName("begin_date", i);
                reqCommand.end_date = packer.GetIntbyName("end_date", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.weight_ratio = packer.GetDoublebyName("weight_ratio", i);
                reqCommand.begin_cost_amt = packer.GetDoublebyName("begin_cost_amt", i);
                reqCommand.begin_posi_market_value = packer.GetDoublebyName("begin_posi_market_value", i);
                reqCommand.begin_realize_pandl = packer.GetDoublebyName("begin_realize_pandl", i);
                reqCommand.end_cost_amt = packer.GetDoublebyName("end_cost_amt", i);
                reqCommand.end_posi_market_value = packer.GetDoublebyName("end_posi_market_value", i);
                reqCommand.end_realize_pandl = packer.GetDoublebyName("end_realize_pandl", i);
                reqCommand.float_pandl = packer.GetDoublebyName("float_pandl", i);
                reqCommand.interval_realize_pandl = packer.GetDoublebyName("interval_realize_pandl", i);
                reqCommand.interval_pandl = packer.GetDoublebyName("interval_pandl", i);
 
                FuncrptL_3_102Models.Add(reqCommand);
            }
            return FuncrptL_3_102Models;
        }
 
        //逻辑_报表_报表查询_查询交易组持仓区间盈亏行业
        public static List<FuncrptL_3_102Model> GetFuncrptL_3_102Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_3_102Models = new List<FuncrptL_3_102Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_3_102Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT);
                    reqCommand.end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.weight_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WEIGHT_RATIO_FLOAT);
                    reqCommand.begin_cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_COST_AMT_FLOAT);
                    reqCommand.begin_posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_POSI_MARKET_VALUE_FLOAT);
                    reqCommand.begin_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_REALIZE_PANDL_FLOAT);
                    reqCommand.end_cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_END_COST_AMT_FLOAT);
                    reqCommand.end_posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_END_POSI_MARKET_VALUE_FLOAT);
                    reqCommand.end_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_END_REALIZE_PANDL_FLOAT);
                    reqCommand.float_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FLOAT_PANDL_FLOAT);
                    reqCommand.interval_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTERVAL_REALIZE_PANDL_FLOAT);
                    reqCommand.interval_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTERVAL_PANDL_FLOAT);
                    FuncrptL_3_102Models.Add(reqCommand);
                }
            }
            return FuncrptL_3_102Models;
        }
 
        //逻辑_报表_报表查询_查询产品持仓区间盈亏
        public static List<FuncrptL_3_103Model> GetFuncrptL_3_103Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_3_103Models = new List<FuncrptL_3_103Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_3_103Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.begin_date = packer.GetIntbyName("begin_date", i);
                reqCommand.end_date = packer.GetIntbyName("end_date", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.asset_type = packer.GetIntbyName("asset_type", i);
                reqCommand.begin_close_price = packer.GetDoublebyName("begin_close_price", i);
                reqCommand.begin_qty = packer.GetDoublebyName("begin_qty", i);
                reqCommand.begin_cost_amt = packer.GetDoublebyName("begin_cost_amt", i);
                reqCommand.begin_posi_market_value = packer.GetDoublebyName("begin_posi_market_value", i);
                reqCommand.begin_realize_pandl = packer.GetDoublebyName("begin_realize_pandl", i);
                reqCommand.end_close_price = packer.GetDoublebyName("end_close_price", i);
                reqCommand.end_cur_qty = packer.GetIntbyName("end_cur_qty", i);
                reqCommand.end_cost_amt = packer.GetDoublebyName("end_cost_amt", i);
                reqCommand.end_posi_market_value = packer.GetDoublebyName("end_posi_market_value", i);
                reqCommand.end_realize_pandl = packer.GetDoublebyName("end_realize_pandl", i);
                reqCommand.float_pandl = packer.GetDoublebyName("float_pandl", i);
                reqCommand.interval_realize_pandl = packer.GetDoublebyName("interval_realize_pandl", i);
                reqCommand.interval_pandl = packer.GetDoublebyName("interval_pandl", i);
                reqCommand.max_posi_market_value = packer.GetDoublebyName("max_posi_market_value", i);
 
                FuncrptL_3_103Models.Add(reqCommand);
            }
            return FuncrptL_3_103Models;
        }
 
        //逻辑_报表_报表查询_查询产品持仓区间盈亏
        public static List<FuncrptL_3_103Model> GetFuncrptL_3_103Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_3_103Models = new List<FuncrptL_3_103Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_3_103Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT);
                    reqCommand.end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    reqCommand.begin_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_CLOSE_PRICE_FLOAT);
                    reqCommand.begin_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_QTY_FLOAT);
                    reqCommand.begin_cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_COST_AMT_FLOAT);
                    reqCommand.begin_posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_POSI_MARKET_VALUE_FLOAT);
                    reqCommand.begin_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_REALIZE_PANDL_FLOAT);
                    reqCommand.end_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_END_CLOSE_PRICE_FLOAT);
                    reqCommand.end_cur_qty = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_CUR_QTY_INT);
                    reqCommand.end_cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_END_COST_AMT_FLOAT);
                    reqCommand.end_posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_END_POSI_MARKET_VALUE_FLOAT);
                    reqCommand.end_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_END_REALIZE_PANDL_FLOAT);
                    reqCommand.float_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FLOAT_PANDL_FLOAT);
                    reqCommand.interval_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTERVAL_REALIZE_PANDL_FLOAT);
                    reqCommand.interval_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTERVAL_PANDL_FLOAT);
                    reqCommand.max_posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_POSI_MARKET_VALUE_FLOAT);
                    FuncrptL_3_103Models.Add(reqCommand);
                }
            }
            return FuncrptL_3_103Models;
        }
 
        //逻辑_报表_报表查询_查询平台产品夏普比率
        public static List<FuncrptL_3_201Model> GetFuncrptL_3_201Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_3_201Models = new List<FuncrptL_3_201Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_3_201Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.begin_date = packer.GetIntbyName("begin_date", i);
                reqCommand.end_date = packer.GetIntbyName("end_date", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.share_net = packer.GetDoublebyName("share_net", i);
                reqCommand.share_net_total = packer.GetDoublebyName("share_net_total", i);
                reqCommand.sharpe_ration = packer.GetDoublebyName("sharpe_ration", i);
                reqCommand.max_retracement = packer.GetDoublebyName("max_retracement", i);
                reqCommand.annual_yield = packer.GetDoublebyName("annual_yield", i);
                reqCommand.net_growth_rate_stdev = packer.GetDoublebyName("net_growth_rate_stdev", i);
                reqCommand.achi_compa_pandl_ratio = packer.GetDoublebyName("achi_compa_pandl_ratio", i);
                reqCommand.profit_year_ratio = packer.GetDoublebyName("profit_year_ratio", i);
 
                FuncrptL_3_201Models.Add(reqCommand);
            }
            return FuncrptL_3_201Models;
        }
 
        //逻辑_报表_报表查询_查询平台产品夏普比率
        public static List<FuncrptL_3_201Model> GetFuncrptL_3_201Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_3_201Models = new List<FuncrptL_3_201Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_3_201Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT);
                    reqCommand.end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.share_net = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SHARE_NET_FLOAT);
                    reqCommand.share_net_total = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SHARE_NET_TOTAL_FLOAT);
                    reqCommand.sharpe_ration = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SHARPE_RATION_FLOAT);
                    reqCommand.max_retracement = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_RETRACEMENT_FLOAT);
                    reqCommand.annual_yield = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ANNUAL_YIELD_FLOAT);
                    reqCommand.net_growth_rate_stdev = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NET_GROWTH_RATE_STDEV_FLOAT);
                    reqCommand.achi_compa_pandl_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACHI_COMPA_PANDL_RATIO_FLOAT);
                    reqCommand.profit_year_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PROFIT_YEAR_RATIO_FLOAT);
                    FuncrptL_3_201Models.Add(reqCommand);
                }
            }
            return FuncrptL_3_201Models;
        }
 
        //逻辑_报表_报表查询_查询平台产品月收益率
        public static List<FuncrptL_3_202Model> GetFuncrptL_3_202Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_3_202Models = new List<FuncrptL_3_202Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_3_202Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.share_net_total = packer.GetDoublebyName("share_net_total", i);
                reqCommand.pre_nav = packer.GetDoublebyName("pre_nav", i);
                reqCommand.busin_date = packer.GetIntbyName("busin_date", i);
                reqCommand.return_ratio_in_single_month = packer.GetDoublebyName("return_ratio_in_single_month", i);
 
                FuncrptL_3_202Models.Add(reqCommand);
            }
            return FuncrptL_3_202Models;
        }
 
        //逻辑_报表_报表查询_查询平台产品月收益率
        public static List<FuncrptL_3_202Model> GetFuncrptL_3_202Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_3_202Models = new List<FuncrptL_3_202Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_3_202Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.share_net_total = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SHARE_NET_TOTAL_FLOAT);
                    reqCommand.pre_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_NAV_FLOAT);
                    reqCommand.busin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSIN_DATE_INT);
                    reqCommand.return_ratio_in_single_month = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RETURN_RATIO_IN_SINGLE_MONTH_FLOAT);
                    FuncrptL_3_202Models.Add(reqCommand);
                }
            }
            return FuncrptL_3_202Models;
        }
 
    }
}
