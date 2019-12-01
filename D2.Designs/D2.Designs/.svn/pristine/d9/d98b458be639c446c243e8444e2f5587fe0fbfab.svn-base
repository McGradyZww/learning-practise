using LdNet.ClientSdk.Model;
using LdNet.ClientCore.Sdk;
using LdNet.Communication;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using LDsdkDefineEx;

namespace LdNet.ClientSdk.Response
{
    public class rptL_3_1_Response : IResponse
    {
        #region 构造函数
        public rptL_3_1_Response()
        {
            this.rptL_3_1_InfoList = new ObservableCollection<rptL_3_1_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_3_1_Info> rptL_3_1_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_3_1_Info info = new rptL_3_1_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_code = unpacker.GetStr("pd_code");
            info.pd_name = unpacker.GetStr("pd_name");
            info.found_date = unpacker.GetInt("found_date");
            info.runtime = unpacker.GetInt("runtime");
            info.unit_nav = unpacker.GetDouble("unit_nav");
            info.daily_pandl_ratio = unpacker.GetDouble("daily_pandl_ratio");
            info.daily_pandl_ratio_year = unpacker.GetDouble("daily_pandl_ratio_year");
            info.total_unit_nav = unpacker.GetDouble("total_unit_nav");
            info.total_realiz_pandl_ratio = unpacker.GetDouble("total_realiz_pandl_ratio");
            info.total_realize_pandl_ratio_year = unpacker.GetDouble("total_realize_pandl_ratio_year");
            info.excess_earning_year = unpacker.GetDouble("excess_earning_year");
            info.day_retracement = unpacker.GetDouble("day_retracement");
            info.day_continue_retracement = unpacker.GetDouble("day_continue_retracement");
            rptL_3_1_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_3_1_InfoList.Add((rptL_3_1_Info)info);
        }
        #endregion

        //逻辑_报表_报表查询_查询报表单产品收益率
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_3_1_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    info.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    info.found_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FOUND_DATE_INT);
                    info.runtime = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RUNTIME_INT);
                    info.unit_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_NAV_FLOAT);
                    info.daily_pandl_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DAILY_PANDL_RATIO_FLOAT);
                    info.daily_pandl_ratio_year = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DAILY_PANDL_RATIO_YEAR_FLOAT);
                    info.total_unit_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_UNIT_NAV_FLOAT);
                    info.total_realiz_pandl_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_REALIZ_PANDL_RATIO_FLOAT);
                    info.total_realize_pandl_ratio_year = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_REALIZE_PANDL_RATIO_YEAR_FLOAT);
                    info.excess_earning_year = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_EXCESS_EARNING_YEAR_FLOAT);
                    info.day_retracement = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DAY_RETRACEMENT_FLOAT);
                    info.day_continue_retracement = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DAY_CONTINUE_RETRACEMENT_FLOAT);
                    rptL_3_1_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_3_2_Response : IResponse
    {
        #region 构造函数
        public rptL_3_2_Response()
        {
            this.rptL_3_2_InfoList = new ObservableCollection<rptL_3_2_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_3_2_Info> rptL_3_2_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_3_2_Info info = new rptL_3_2_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.pd_no = unpacker.GetInt("pd_no");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_code = unpacker.GetStr("pd_code");
            info.pd_name = unpacker.GetStr("pd_name");
            info.unit_nav = unpacker.GetDouble("unit_nav");
            info.daily_pandl_ratio = unpacker.GetDouble("daily_pandl_ratio");
            info.total_realize_pandl_ratio_year = unpacker.GetDouble("total_realize_pandl_ratio_year");
            info.sharpe_ration = unpacker.GetDouble("sharpe_ration");
            info.max_retracement = unpacker.GetDouble("max_retracement");
            info.market_value_sh = unpacker.GetDouble("market_value_sh");
            info.market_value_avg_sh = unpacker.GetDouble("market_value_avg_sh");
            info.sh_remainday_two = unpacker.GetInt("sh_remainday_two");
            info.sh_remainday_three = unpacker.GetInt("sh_remainday_three");
            info.sh_remainday_five = unpacker.GetInt("sh_remainday_five");
            info.market_value_sz = unpacker.GetDouble("market_value_sz");
            info.market_value_avg_sz = unpacker.GetDouble("market_value_avg_sz");
            info.sz_remainday_two = unpacker.GetInt("sz_remainday_two");
            info.sz_remainday_three = unpacker.GetInt("sz_remainday_three");
            info.sz_remainday_five = unpacker.GetInt("sz_remainday_five");
            rptL_3_2_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_3_2_InfoList.Add((rptL_3_2_Info)info);
        }
        #endregion

        //逻辑_报表_报表查询_查询报表收益率分析
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_3_2_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    info.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    info.unit_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_NAV_FLOAT);
                    info.daily_pandl_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DAILY_PANDL_RATIO_FLOAT);
                    info.total_realize_pandl_ratio_year = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_REALIZE_PANDL_RATIO_YEAR_FLOAT);
                    info.sharpe_ration = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SHARPE_RATION_FLOAT);
                    info.max_retracement = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_RETRACEMENT_FLOAT);
                    info.market_value_sh = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_VALUE_SH_FLOAT);
                    info.market_value_avg_sh = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_VALUE_AVG_SH_FLOAT);
                    info.sh_remainday_two = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SH_REMAINDAY_TWO_INT);
                    info.sh_remainday_three = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SH_REMAINDAY_THREE_INT);
                    info.sh_remainday_five = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SH_REMAINDAY_FIVE_INT);
                    info.market_value_sz = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_VALUE_SZ_FLOAT);
                    info.market_value_avg_sz = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_VALUE_AVG_SZ_FLOAT);
                    info.sz_remainday_two = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SZ_REMAINDAY_TWO_INT);
                    info.sz_remainday_three = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SZ_REMAINDAY_THREE_INT);
                    info.sz_remainday_five = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SZ_REMAINDAY_FIVE_INT);
                    rptL_3_2_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_3_3_Response : IResponse
    {
        #region 构造函数
        public rptL_3_3_Response()
        {
            this.rptL_3_3_InfoList = new ObservableCollection<rptL_3_3_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_3_3_Info> rptL_3_3_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_3_3_Info info = new rptL_3_3_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.mach_date = unpacker.GetInt("mach_date");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_code = unpacker.GetStr("pd_code");
            info.pd_name = unpacker.GetStr("pd_name");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.pd_curr_share = unpacker.GetDouble("pd_curr_share");
            info.unit_nav = unpacker.GetDouble("unit_nav");
            info.nav_asset = unpacker.GetDouble("nav_asset");
            info.remark_info = unpacker.GetStr("remark_info");
            rptL_3_3_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_3_3_InfoList.Add((rptL_3_3_Info)info);
        }
        #endregion

        //逻辑_报表_报表查询_查询报表产品资产记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_3_3_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.mach_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MACH_DATE_INT);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    info.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.pd_curr_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_CURR_SHARE_FLOAT);
                    info.unit_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_NAV_FLOAT);
                    info.nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    rptL_3_3_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_3_4_Response : IResponse
    {
        #region 构造函数
        public rptL_3_4_Response()
        {
            this.rptL_3_4_InfoList = new ObservableCollection<rptL_3_4_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_3_4_Info> rptL_3_4_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_3_4_Info info = new rptL_3_4_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.region_no = unpacker.GetInt("region_no");
            info.region_name = unpacker.GetStr("region_name");
            info.product_return_rate = unpacker.GetDouble("product_return_rate");
            info.max_product_increase = unpacker.GetDouble("max_product_increase");
            info.cmp_product_return_rate = unpacker.GetDouble("cmp_product_return_rate");
            rptL_3_4_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_3_4_InfoList.Add((rptL_3_4_Info)info);
        }
        #endregion

        //逻辑_报表_报表查询_查询报表产品净值回报率
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_3_4_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.region_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REGION_NO_INT);
                    info.region_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REGION_NAME_STR);
                    info.product_return_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRODUCT_RETURN_RATE_FLOAT);
                    info.max_product_increase = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_PRODUCT_INCREASE_FLOAT);
                    info.cmp_product_return_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CMP_PRODUCT_RETURN_RATE_FLOAT);
                    rptL_3_4_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_3_6_Response : IResponse
    {
        #region 构造函数
        public rptL_3_6_Response()
        {
            this.rptL_3_6_InfoList = new ObservableCollection<rptL_3_6_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_3_6_Info> rptL_3_6_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_3_6_Info info = new rptL_3_6_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_asset_type = unpacker.GetInt("pd_asset_type");
            info.pd_code = unpacker.GetStr("pd_code");
            info.pd_name = unpacker.GetStr("pd_name");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_name = unpacker.GetStr("stock_name");
            info.last_price = unpacker.GetDouble("last_price");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.cost_amt = unpacker.GetDouble("cost_amt");
            info.stop_status = unpacker.GetStr("stop_status");
            info.circl_flag = unpacker.GetInt("circl_flag");
            info.today_pandl = unpacker.GetDouble("today_pandl");
            rptL_3_6_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_3_6_InfoList.Add((rptL_3_6_Info)info);
        }
        #endregion

        //逻辑_报表_报表查询_查询报表产品资产明细汇总统计历史记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_3_6_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_ASSET_TYPE_INT);
                    info.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    info.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    info.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                    info.stop_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOP_STATUS_STR);
                    info.circl_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CIRCL_FLAG_INT);
                    info.today_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_PANDL_FLOAT);
                    rptL_3_6_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_3_7_Response : IResponse
    {
        #region 构造函数
        public rptL_3_7_Response()
        {
            this.rptL_3_7_InfoList = new ObservableCollection<rptL_3_7_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_3_7_Info> rptL_3_7_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_3_7_Info info = new rptL_3_7_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_code = unpacker.GetStr("pd_code");
            info.pd_name = unpacker.GetStr("pd_name");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.total_asset = unpacker.GetDouble("total_asset");
            info.stock_market_value = unpacker.GetDouble("stock_market_value");
            info.pd_share = unpacker.GetDouble("pd_share");
            info.unit_nav = unpacker.GetDouble("unit_nav");
            info.week_nav_change = unpacker.GetDouble("week_nav_change");
            info.day_nav_change = unpacker.GetDouble("day_nav_change");
            info.cash_asset = unpacker.GetDouble("cash_asset");
            info.cash_nav_ratio = unpacker.GetDouble("cash_nav_ratio");
            info.stock_asset_ratio = unpacker.GetDouble("stock_asset_ratio");
            rptL_3_7_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_3_7_InfoList.Add((rptL_3_7_Info)info);
        }
        #endregion

        //逻辑_报表_报表查询_查询周净值累变报表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_3_7_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    info.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.total_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_ASSET_FLOAT);
                    info.stock_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_MARKET_VALUE_FLOAT);
                    info.pd_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_SHARE_FLOAT);
                    info.unit_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_NAV_FLOAT);
                    info.week_nav_change = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WEEK_NAV_CHANGE_FLOAT);
                    info.day_nav_change = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DAY_NAV_CHANGE_FLOAT);
                    info.cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_ASSET_FLOAT);
                    info.cash_nav_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_NAV_RATIO_FLOAT);
                    info.stock_asset_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_RATIO_FLOAT);
                    rptL_3_7_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_3_8_Response : IResponse
    {
        #region 构造函数
        public rptL_3_8_Response()
        {
            this.rptL_3_8_InfoList = new ObservableCollection<rptL_3_8_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_3_8_Info> rptL_3_8_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_3_8_Info info = new rptL_3_8_Info();
            info.init_date = unpacker.GetInt("init_date");
            info.pd_no = unpacker.GetInt("pd_no");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_code = unpacker.GetStr("pd_code");
            info.pd_name = unpacker.GetStr("pd_name");
            info.unit_nav = unpacker.GetDouble("unit_nav");
            info.daily_pandl_ratio = unpacker.GetDouble("daily_pandl_ratio");
            info.daily_pandl_ratio_year = unpacker.GetDouble("daily_pandl_ratio_year");
            info.nav_fluct = unpacker.GetDouble("nav_fluct");
            info.max_retracement = unpacker.GetDouble("max_retracement");
            info.curr_share = unpacker.GetDouble("curr_share");
            info.total_asset = unpacker.GetDouble("total_asset");
            rptL_3_8_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_3_8_InfoList.Add((rptL_3_8_Info)info);
        }
        #endregion

        //逻辑_报表_报表查询_查询产品详情信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_3_8_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    info.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    info.unit_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_NAV_FLOAT);
                    info.daily_pandl_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DAILY_PANDL_RATIO_FLOAT);
                    info.daily_pandl_ratio_year = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DAILY_PANDL_RATIO_YEAR_FLOAT);
                    info.nav_fluct = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_FLUCT_FLOAT);
                    info.max_retracement = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_RETRACEMENT_FLOAT);
                    info.curr_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_SHARE_FLOAT);
                    info.total_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_ASSET_FLOAT);
                    rptL_3_8_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_3_9_Response : IResponse
    {
        #region 构造函数
        public rptL_3_9_Response()
        {
            this.rptL_3_9_InfoList = new ObservableCollection<rptL_3_9_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_3_9_Info> rptL_3_9_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_3_9_Info info = new rptL_3_9_Info();
            rptL_3_9_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_3_9_InfoList.Add((rptL_3_9_Info)info);
        }
        #endregion

        //逻辑_报表_报表查询_计算跟投分析
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_3_9_Info();
                rptL_3_9_InfoList.Add(info);
            }
        }
    }

    public class rptL_3_10_Response : IResponse
    {
        #region 构造函数
        public rptL_3_10_Response()
        {
            this.rptL_3_10_InfoList = new ObservableCollection<rptL_3_10_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_3_10_Info> rptL_3_10_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_3_10_Info info = new rptL_3_10_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.pd_no = unpacker.GetInt("pd_no");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_code = unpacker.GetStr("pd_code");
            info.pd_name = unpacker.GetStr("pd_name");
            info.net_performance = unpacker.GetDouble("net_performance");
            info.total_unit_nav = unpacker.GetDouble("total_unit_nav");
            info.market_value_posi_ratio = unpacker.GetDouble("market_value_posi_ratio");
            info.pd_manager = unpacker.GetStr("pd_manager");
            info.nav_asset = unpacker.GetDouble("nav_asset");
            info.cash_asset = unpacker.GetDouble("cash_asset");
            info.profit_year = unpacker.GetDouble("profit_year");
            info.profit_year_ratio = unpacker.GetDouble("profit_year_ratio");
            info.follow_share = unpacker.GetDouble("follow_share");
            info.follow_nav_asset = unpacker.GetDouble("follow_nav_asset");
            info.follow_income_year = unpacker.GetDouble("follow_income_year");
            info.follow_income_total = unpacker.GetDouble("follow_income_total");
            info.follow_profit_ratio = unpacker.GetDouble("follow_profit_ratio");
            info.warn_value = unpacker.GetDouble("warn_value");
            info.stop_value = unpacker.GetDouble("stop_value");
            info.curr_share = unpacker.GetDouble("curr_share");
            info.max_retracement = unpacker.GetDouble("max_retracement");
            info.found_date = unpacker.GetInt("found_date");
            info.last_year_nav = unpacker.GetDouble("last_year_nav");
            rptL_3_10_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_3_10_InfoList.Add((rptL_3_10_Info)info);
        }
        #endregion

        //逻辑_报表_报表查询_查询跟投分析
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_3_10_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    info.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    info.net_performance = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NET_PERFORMANCE_FLOAT);
                    info.total_unit_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_UNIT_NAV_FLOAT);
                    info.market_value_posi_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_VALUE_POSI_RATIO_FLOAT);
                    info.pd_manager = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_MANAGER_STR);
                    info.nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT);
                    info.cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_ASSET_FLOAT);
                    info.profit_year = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PROFIT_YEAR_FLOAT);
                    info.profit_year_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PROFIT_YEAR_RATIO_FLOAT);
                    info.follow_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FOLLOW_SHARE_FLOAT);
                    info.follow_nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FOLLOW_NAV_ASSET_FLOAT);
                    info.follow_income_year = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FOLLOW_INCOME_YEAR_FLOAT);
                    info.follow_income_total = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FOLLOW_INCOME_TOTAL_FLOAT);
                    info.follow_profit_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FOLLOW_PROFIT_RATIO_FLOAT);
                    info.warn_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WARN_VALUE_FLOAT);
                    info.stop_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOP_VALUE_FLOAT);
                    info.curr_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_SHARE_FLOAT);
                    info.max_retracement = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_RETRACEMENT_FLOAT);
                    info.found_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FOUND_DATE_INT);
                    info.last_year_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_YEAR_NAV_FLOAT);
                    rptL_3_10_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_3_11_Response : IResponse
    {
        #region 构造函数
        public rptL_3_11_Response()
        {
            this.rptL_3_11_InfoList = new ObservableCollection<rptL_3_11_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_3_11_Info> rptL_3_11_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_3_11_Info info = new rptL_3_11_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.begin_date = unpacker.GetInt("begin_date");
            info.end_date = unpacker.GetInt("end_date");
            info.pd_no = unpacker.GetInt("pd_no");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_code = unpacker.GetStr("pd_code");
            info.pd_name = unpacker.GetStr("pd_name");
            info.nav_asset = unpacker.GetDouble("nav_asset");
            info.posi_market_value = unpacker.GetDouble("posi_market_value");
            info.cash_asset = unpacker.GetDouble("cash_asset");
            info.product_return_rate = unpacker.GetDouble("product_return_rate");
            info.standard_return = unpacker.GetDouble("standard_return");
            info.curr_share = unpacker.GetDouble("curr_share");
            info.unit_nav = unpacker.GetDouble("unit_nav");
            info.interval_pandl = unpacker.GetDouble("interval_pandl");
            info.total_realiz_pandl_ratio = unpacker.GetDouble("total_realiz_pandl_ratio");
            info.cmp_product_return_rate = unpacker.GetDouble("cmp_product_return_rate");
            rptL_3_11_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_3_11_InfoList.Add((rptL_3_11_Info)info);
        }
        #endregion

        //逻辑_报表_报表查询_查询盈亏分析
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_3_11_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT);
                    info.end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    info.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    info.nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT);
                    info.posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_MARKET_VALUE_FLOAT);
                    info.cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_ASSET_FLOAT);
                    info.product_return_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRODUCT_RETURN_RATE_FLOAT);
                    info.standard_return = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STANDARD_RETURN_FLOAT);
                    info.curr_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_SHARE_FLOAT);
                    info.unit_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_NAV_FLOAT);
                    info.interval_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTERVAL_PANDL_FLOAT);
                    info.total_realiz_pandl_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_REALIZ_PANDL_RATIO_FLOAT);
                    info.cmp_product_return_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CMP_PRODUCT_RETURN_RATE_FLOAT);
                    rptL_3_11_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_3_12_Response : IResponse
    {
        #region 构造函数
        public rptL_3_12_Response()
        {
            this.rptL_3_12_InfoList = new ObservableCollection<rptL_3_12_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_3_12_Info> rptL_3_12_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_3_12_Info info = new rptL_3_12_Info();
            info.init_date = unpacker.GetInt("init_date");
            info.pd_no = unpacker.GetInt("pd_no");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_code = unpacker.GetStr("pd_code");
            info.pd_name = unpacker.GetStr("pd_name");
            info.product_return_rate = unpacker.GetDouble("product_return_rate");
            info.total_asset = unpacker.GetDouble("total_asset");
            info.standard_return = unpacker.GetDouble("standard_return");
            info.cmp_product_return_rate = unpacker.GetDouble("cmp_product_return_rate");
            rptL_3_12_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_3_12_InfoList.Add((rptL_3_12_Info)info);
        }
        #endregion

        //逻辑_报表_报表查询_查询回报统计
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_3_12_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    info.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    info.product_return_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRODUCT_RETURN_RATE_FLOAT);
                    info.total_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_ASSET_FLOAT);
                    info.standard_return = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STANDARD_RETURN_FLOAT);
                    info.cmp_product_return_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CMP_PRODUCT_RETURN_RATE_FLOAT);
                    rptL_3_12_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_3_13_Response : IResponse
    {
        #region 构造函数
        public rptL_3_13_Response()
        {
            this.rptL_3_13_InfoList = new ObservableCollection<rptL_3_13_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_3_13_Info> rptL_3_13_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_3_13_Info info = new rptL_3_13_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.begin_date = unpacker.GetInt("begin_date");
            info.end_date = unpacker.GetInt("end_date");
            info.pd_no = unpacker.GetInt("pd_no");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_code = unpacker.GetStr("pd_code");
            info.pd_name = unpacker.GetStr("pd_name");
            info.asset_market_value = unpacker.GetDouble("asset_market_value");
            info.weight_ratio = unpacker.GetDouble("weight_ratio");
            info.interval_pandl = unpacker.GetDouble("interval_pandl");
            info.product_return_rate = unpacker.GetDouble("product_return_rate");
            info.return_rate = unpacker.GetDouble("return_rate");
            rptL_3_13_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_3_13_InfoList.Add((rptL_3_13_Info)info);
        }
        #endregion

        //逻辑_报表_报表查询_查询归因分析
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_3_13_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT);
                    info.end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    info.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    info.asset_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_MARKET_VALUE_FLOAT);
                    info.weight_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WEIGHT_RATIO_FLOAT);
                    info.interval_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTERVAL_PANDL_FLOAT);
                    info.product_return_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRODUCT_RETURN_RATE_FLOAT);
                    info.return_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RETURN_RATE_FLOAT);
                    rptL_3_13_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_3_14_Response : IResponse
    {
        #region 构造函数
        public rptL_3_14_Response()
        {
            this.rptL_3_14_InfoList = new ObservableCollection<rptL_3_14_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_3_14_Info> rptL_3_14_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_3_14_Info info = new rptL_3_14_Info();
            info.pd_no = unpacker.GetInt("pd_no");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_code = unpacker.GetStr("pd_code");
            info.pd_name = unpacker.GetStr("pd_name");
            info.asset_market_value = unpacker.GetDouble("asset_market_value");
            info.weight_ratio = unpacker.GetDouble("weight_ratio");
            info.asset_kind = unpacker.GetInt("asset_kind");
            info.interval_pandl = unpacker.GetDouble("interval_pandl");
            rptL_3_14_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_3_14_InfoList.Add((rptL_3_14_Info)info);
        }
        #endregion

        //逻辑_报表_报表查询_查询资产分析
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_3_14_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    info.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    info.asset_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_MARKET_VALUE_FLOAT);
                    info.weight_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WEIGHT_RATIO_FLOAT);
                    info.asset_kind = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_KIND_INT);
                    info.interval_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTERVAL_PANDL_FLOAT);
                    rptL_3_14_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_3_15_Response : IResponse
    {
        #region 构造函数
        public rptL_3_15_Response()
        {
            this.rptL_3_15_InfoList = new ObservableCollection<rptL_3_15_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_3_15_Info> rptL_3_15_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_3_15_Info info = new rptL_3_15_Info();
            info.begin_date = unpacker.GetInt("begin_date");
            info.end_date = unpacker.GetInt("end_date");
            info.pd_no = unpacker.GetInt("pd_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_name = unpacker.GetStr("stock_name");
            info.last_price = unpacker.GetDouble("last_price");
            info.posi_qty = unpacker.GetDouble("posi_qty");
            info.asset_market_value = unpacker.GetDouble("asset_market_value");
            info.weight_ratio = unpacker.GetDouble("weight_ratio");
            info.interval_pandl = unpacker.GetDouble("interval_pandl");
            info.product_return_rate = unpacker.GetDouble("product_return_rate");
            info.return_rate = unpacker.GetDouble("return_rate");
            rptL_3_15_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_3_15_InfoList.Add((rptL_3_15_Info)info);
        }
        #endregion

        //逻辑_报表_报表查询_查询持仓分析
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_3_15_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT);
                    info.end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    info.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    info.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    info.asset_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_MARKET_VALUE_FLOAT);
                    info.weight_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WEIGHT_RATIO_FLOAT);
                    info.interval_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTERVAL_PANDL_FLOAT);
                    info.product_return_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRODUCT_RETURN_RATE_FLOAT);
                    info.return_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RETURN_RATE_FLOAT);
                    rptL_3_15_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_3_16_Response : IResponse
    {
        #region 构造函数
        public rptL_3_16_Response()
        {
            this.rptL_3_16_InfoList = new ObservableCollection<rptL_3_16_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_3_16_Info> rptL_3_16_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_3_16_Info info = new rptL_3_16_Info();
            info.pd_no = unpacker.GetInt("pd_no");
            info.first_indu_code = unpacker.GetStr("first_indu_code");
            info.asset_market_value = unpacker.GetDouble("asset_market_value");
            info.weight_ratio = unpacker.GetDouble("weight_ratio");
            info.interval_pandl = unpacker.GetDouble("interval_pandl");
            info.product_return_rate = unpacker.GetDouble("product_return_rate");
            rptL_3_16_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_3_16_InfoList.Add((rptL_3_16_Info)info);
        }
        #endregion

        //逻辑_报表_报表查询_查询行业分析
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_3_16_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.first_indu_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FIRST_INDU_CODE_STR);
                    info.asset_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_MARKET_VALUE_FLOAT);
                    info.weight_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WEIGHT_RATIO_FLOAT);
                    info.interval_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTERVAL_PANDL_FLOAT);
                    info.product_return_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRODUCT_RETURN_RATE_FLOAT);
                    rptL_3_16_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_3_17_Response : IResponse
    {
        #region 构造函数
        public rptL_3_17_Response()
        {
            this.rptL_3_17_InfoList = new ObservableCollection<rptL_3_17_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_3_17_Info> rptL_3_17_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_3_17_Info info = new rptL_3_17_Info();
            info.begin_date = unpacker.GetInt("begin_date");
            info.end_date = unpacker.GetInt("end_date");
            info.pd_no = unpacker.GetInt("pd_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_name = unpacker.GetStr("stock_name");
            info.last_price = unpacker.GetDouble("last_price");
            info.posi_qty = unpacker.GetDouble("posi_qty");
            info.asset_market_value = unpacker.GetDouble("asset_market_value");
            info.weight_ratio = unpacker.GetDouble("weight_ratio");
            info.interval_pandl = unpacker.GetDouble("interval_pandl");
            info.product_return_rate = unpacker.GetDouble("product_return_rate");
            info.return_rate = unpacker.GetDouble("return_rate");
            rptL_3_17_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_3_17_InfoList.Add((rptL_3_17_Info)info);
        }
        #endregion

        //逻辑_报表_报表查询_查询行业持仓分析
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_3_17_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT);
                    info.end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    info.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    info.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    info.asset_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_MARKET_VALUE_FLOAT);
                    info.weight_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WEIGHT_RATIO_FLOAT);
                    info.interval_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTERVAL_PANDL_FLOAT);
                    info.product_return_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRODUCT_RETURN_RATE_FLOAT);
                    info.return_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RETURN_RATE_FLOAT);
                    rptL_3_17_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_3_18_Response : IResponse
    {
        #region 构造函数
        public rptL_3_18_Response()
        {
            this.rptL_3_18_InfoList = new ObservableCollection<rptL_3_18_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_3_18_Info> rptL_3_18_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_3_18_Info info = new rptL_3_18_Info();
            info.pd_no = unpacker.GetInt("pd_no");
            info.pd_name = unpacker.GetStr("pd_name");
            info.pd_code = unpacker.GetStr("pd_code");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_name = unpacker.GetStr("stock_name");
            info.stock_asset_value = unpacker.GetDouble("stock_asset_value");
            info.cost_price = unpacker.GetDouble("cost_price");
            info.posi_qty = unpacker.GetDouble("posi_qty");
            info.cost_amt = unpacker.GetDouble("cost_amt");
            info.float_pandl = unpacker.GetDouble("float_pandl");
            info.weight_ratio = unpacker.GetDouble("weight_ratio");
            rptL_3_18_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_3_18_InfoList.Add((rptL_3_18_Info)info);
        }
        #endregion

        //逻辑_报表_报表查询_查询产品持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_3_18_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    info.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    info.stock_asset_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_VALUE_FLOAT);
                    info.cost_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_PRICE_FLOAT);
                    info.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    info.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                    info.float_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FLOAT_PANDL_FLOAT);
                    info.weight_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WEIGHT_RATIO_FLOAT);
                    rptL_3_18_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_3_19_Response : IResponse
    {
        #region 构造函数
        public rptL_3_19_Response()
        {
            this.rptL_3_19_InfoList = new ObservableCollection<rptL_3_19_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_3_19_Info> rptL_3_19_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_3_19_Info info = new rptL_3_19_Info();
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_name = unpacker.GetStr("stock_name");
            info.last_price = unpacker.GetDouble("last_price");
            info.posi_qty = unpacker.GetDouble("posi_qty");
            info.stock_asset_value = unpacker.GetDouble("stock_asset_value");
            info.cost_price = unpacker.GetDouble("cost_price");
            info.weight_ratio = unpacker.GetDouble("weight_ratio");
            info.float_pandl = unpacker.GetDouble("float_pandl");
            rptL_3_19_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_3_19_InfoList.Add((rptL_3_19_Info)info);
        }
        #endregion

        //逻辑_报表_报表查询_查询产品持仓对比
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_3_19_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    info.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    info.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    info.stock_asset_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_VALUE_FLOAT);
                    info.cost_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_PRICE_FLOAT);
                    info.weight_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WEIGHT_RATIO_FLOAT);
                    info.float_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FLOAT_PANDL_FLOAT);
                    rptL_3_19_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_3_20_Response : IResponse
    {
        #region 构造函数
        public rptL_3_20_Response()
        {
            this.rptL_3_20_InfoList = new ObservableCollection<rptL_3_20_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_3_20_Info> rptL_3_20_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_3_20_Info info = new rptL_3_20_Info();
            info.pd_name = unpacker.GetStr("pd_name");
            info.pd_manager = unpacker.GetStr("pd_manager");
            info.posi_qty = unpacker.GetDouble("posi_qty");
            info.stock_asset_value = unpacker.GetDouble("stock_asset_value");
            info.cost_price = unpacker.GetDouble("cost_price");
            info.weight_ratio = unpacker.GetDouble("weight_ratio");
            info.float_pandl = unpacker.GetDouble("float_pandl");
            info.asset_market_value = unpacker.GetDouble("asset_market_value");
            info.asset_ratio = unpacker.GetDouble("asset_ratio");
            rptL_3_20_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_3_20_InfoList.Add((rptL_3_20_Info)info);
        }
        #endregion

        //逻辑_报表_报表查询_查询持仓证券产品
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_3_20_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    info.pd_manager = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_MANAGER_STR);
                    info.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    info.stock_asset_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_VALUE_FLOAT);
                    info.cost_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_PRICE_FLOAT);
                    info.weight_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WEIGHT_RATIO_FLOAT);
                    info.float_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FLOAT_PANDL_FLOAT);
                    info.asset_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_MARKET_VALUE_FLOAT);
                    info.asset_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_RATIO_FLOAT);
                    rptL_3_20_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_3_21_Response : IResponse
    {
        #region 构造函数
        public rptL_3_21_Response()
        {
            this.rptL_3_21_InfoList = new ObservableCollection<rptL_3_21_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_3_21_Info> rptL_3_21_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_3_21_Info info = new rptL_3_21_Info();
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_type = unpacker.GetInt("stock_type");
            info.asset_type = unpacker.GetInt("asset_type");
            info.begin_qty = unpacker.GetDouble("begin_qty");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.cost_amt = unpacker.GetDouble("cost_amt");
            info.realize_pandl = unpacker.GetDouble("realize_pandl");
            info.intrst_cost_amt = unpacker.GetDouble("intrst_cost_amt");
            info.intrst_pandl = unpacker.GetDouble("intrst_pandl");
            info.cost_price = unpacker.GetDouble("cost_price");
            info.float_pandl = unpacker.GetDouble("float_pandl");
            info.posi_market_value = unpacker.GetDouble("posi_market_value");
            info.order_price = unpacker.GetDouble("order_price");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.strike_price = unpacker.GetDouble("strike_price");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.buy_qty = unpacker.GetDouble("buy_qty");
            info.buy_amt = unpacker.GetDouble("buy_amt");
            info.buy_strike_price = unpacker.GetDouble("buy_strike_price");
            info.sell_qty = unpacker.GetDouble("sell_qty");
            info.sellout_amt = unpacker.GetDouble("sellout_amt");
            info.sell_strike_price = unpacker.GetDouble("sell_strike_price");
            info.diff_qty = unpacker.GetDouble("diff_qty");
            rptL_3_21_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_3_21_InfoList.Add((rptL_3_21_Info)info);
        }
        #endregion

        //逻辑_报表_报表查询_持仓分析查询汇总证券代码
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_3_21_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    info.begin_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_QTY_FLOAT);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                    info.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    info.intrst_cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_COST_AMT_FLOAT);
                    info.intrst_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_PANDL_FLOAT);
                    info.cost_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_PRICE_FLOAT);
                    info.float_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FLOAT_PANDL_FLOAT);
                    info.posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_MARKET_VALUE_FLOAT);
                    info.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_PRICE_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    info.buy_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_QTY_FLOAT);
                    info.buy_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_AMT_FLOAT);
                    info.buy_strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_STRIKE_PRICE_FLOAT);
                    info.sell_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_QTY_FLOAT);
                    info.sellout_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELLOUT_AMT_FLOAT);
                    info.sell_strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_STRIKE_PRICE_FLOAT);
                    info.diff_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DIFF_QTY_FLOAT);
                    rptL_3_21_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_3_22_Response : IResponse
    {
        #region 构造函数
        public rptL_3_22_Response()
        {
            this.rptL_3_22_InfoList = new ObservableCollection<rptL_3_22_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_3_22_Info> rptL_3_22_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_3_22_Info info = new rptL_3_22_Info();
            info.pd_no = unpacker.GetInt("pd_no");
            info.pd_name = unpacker.GetStr("pd_name");
            info.pd_code = unpacker.GetStr("pd_code");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_name = unpacker.GetStr("stock_name");
            info.stock_asset_value = unpacker.GetDouble("stock_asset_value");
            info.cost_price = unpacker.GetDouble("cost_price");
            info.posi_qty = unpacker.GetDouble("posi_qty");
            info.cost_amt = unpacker.GetDouble("cost_amt");
            info.float_pandl = unpacker.GetDouble("float_pandl");
            rptL_3_22_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_3_22_InfoList.Add((rptL_3_22_Info)info);
        }
        #endregion

        //逻辑_报表_报表查询_持仓分析查询汇总市场
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_3_22_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    info.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    info.stock_asset_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_VALUE_FLOAT);
                    info.cost_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_PRICE_FLOAT);
                    info.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    info.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                    info.float_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FLOAT_PANDL_FLOAT);
                    rptL_3_22_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_3_23_Response : IResponse
    {
        #region 构造函数
        public rptL_3_23_Response()
        {
            this.rptL_3_23_InfoList = new ObservableCollection<rptL_3_23_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_3_23_Info> rptL_3_23_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_3_23_Info info = new rptL_3_23_Info();
            info.pd_no = unpacker.GetInt("pd_no");
            info.pd_name = unpacker.GetStr("pd_name");
            info.pd_code = unpacker.GetStr("pd_code");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_name = unpacker.GetStr("stock_name");
            info.stock_asset_value = unpacker.GetDouble("stock_asset_value");
            info.cost_price = unpacker.GetDouble("cost_price");
            info.posi_qty = unpacker.GetDouble("posi_qty");
            info.cost_amt = unpacker.GetDouble("cost_amt");
            info.float_pandl = unpacker.GetDouble("float_pandl");
            rptL_3_23_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_3_23_InfoList.Add((rptL_3_23_Info)info);
        }
        #endregion

        //逻辑_报表_报表查询_持仓分析查询汇总证券类别
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_3_23_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    info.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    info.stock_asset_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_VALUE_FLOAT);
                    info.cost_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_PRICE_FLOAT);
                    info.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    info.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                    info.float_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FLOAT_PANDL_FLOAT);
                    rptL_3_23_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_3_24_Response : IResponse
    {
        #region 构造函数
        public rptL_3_24_Response()
        {
            this.rptL_3_24_InfoList = new ObservableCollection<rptL_3_24_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_3_24_Info> rptL_3_24_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_3_24_Info info = new rptL_3_24_Info();
            info.pd_no = unpacker.GetInt("pd_no");
            info.pd_name = unpacker.GetStr("pd_name");
            info.pd_code = unpacker.GetStr("pd_code");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_name = unpacker.GetStr("stock_name");
            info.stock_asset_value = unpacker.GetDouble("stock_asset_value");
            info.cost_price = unpacker.GetDouble("cost_price");
            info.posi_qty = unpacker.GetDouble("posi_qty");
            info.cost_amt = unpacker.GetDouble("cost_amt");
            info.float_pandl = unpacker.GetDouble("float_pandl");
            rptL_3_24_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_3_24_InfoList.Add((rptL_3_24_Info)info);
        }
        #endregion

        //逻辑_报表_报表查询_持仓分析查询汇总产品汇总
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_3_24_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    info.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    info.stock_asset_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_VALUE_FLOAT);
                    info.cost_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_PRICE_FLOAT);
                    info.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    info.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                    info.float_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FLOAT_PANDL_FLOAT);
                    rptL_3_24_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_3_25_Response : IResponse
    {
        #region 构造函数
        public rptL_3_25_Response()
        {
            this.rptL_3_25_InfoList = new ObservableCollection<rptL_3_25_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_3_25_Info> rptL_3_25_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_3_25_Info info = new rptL_3_25_Info();
            info.pd_no = unpacker.GetInt("pd_no");
            info.pd_name = unpacker.GetStr("pd_name");
            info.pd_code = unpacker.GetStr("pd_code");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_name = unpacker.GetStr("stock_name");
            info.stock_asset_value = unpacker.GetDouble("stock_asset_value");
            info.cost_price = unpacker.GetDouble("cost_price");
            info.posi_qty = unpacker.GetDouble("posi_qty");
            info.cost_amt = unpacker.GetDouble("cost_amt");
            info.float_pandl = unpacker.GetDouble("float_pandl");
            rptL_3_25_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_3_25_InfoList.Add((rptL_3_25_Info)info);
        }
        #endregion

        //逻辑_报表_报表查询_持仓分析查询明细持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_3_25_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    info.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    info.stock_asset_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_VALUE_FLOAT);
                    info.cost_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_PRICE_FLOAT);
                    info.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    info.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                    info.float_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FLOAT_PANDL_FLOAT);
                    rptL_3_25_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_3_26_Response : IResponse
    {
        #region 构造函数
        public rptL_3_26_Response()
        {
            this.rptL_3_26_InfoList = new ObservableCollection<rptL_3_26_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_3_26_Info> rptL_3_26_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_3_26_Info info = new rptL_3_26_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.pd_no = unpacker.GetInt("pd_no");
            info.pd_code = unpacker.GetStr("pd_code");
            info.pd_name = unpacker.GetStr("pd_name");
            info.exch_no = unpacker.GetInt("exch_no");
            info.bond_code = unpacker.GetStr("bond_code");
            info.stock_name = unpacker.GetStr("stock_name");
            info.last_price = unpacker.GetDouble("last_price");
            info.posi_qty = unpacker.GetDouble("posi_qty");
            info.stock_asset_value = unpacker.GetDouble("stock_asset_value");
            info.cost_price = unpacker.GetDouble("cost_price");
            info.rating_agency = unpacker.GetStr("rating_agency");
            info.bond_level = unpacker.GetInt("bond_level");
            info.bond_accr_intrst = unpacker.GetDouble("bond_accr_intrst");
            info.value_dirty_price = unpacker.GetDouble("value_dirty_price");
            info.value_net_price = unpacker.GetDouble("value_net_price");
            info.value_price_yield = unpacker.GetDouble("value_price_yield");
            info.value_price_modi_dur = unpacker.GetDouble("value_price_modi_dur");
            info.value_price_conve = unpacker.GetDouble("value_price_conve");
            info.value_price_point_value = unpacker.GetDouble("value_price_point_value");
            info.value_price_intrst_dur = unpacker.GetDouble("value_price_intrst_dur");
            info.value_price_intrst_conve = unpacker.GetDouble("value_price_intrst_conve");
            info.value_price_spread_dur = unpacker.GetDouble("value_price_spread_dur");
            info.value_price_spread_Conve = unpacker.GetDouble("value_price_spread_Conve");
            info.true_dirty_price = unpacker.GetDouble("true_dirty_price");
            info.true_net_price = unpacker.GetDouble("true_net_price");
            info.true_yield = unpacker.GetDouble("true_yield");
            info.true_remain_limit = unpacker.GetDouble("true_remain_limit");
            info.true_avg_modi_dur = unpacker.GetDouble("true_avg_modi_dur");
            info.true_conve = unpacker.GetDouble("true_conve");
            info.true_point_value = unpacker.GetDouble("true_point_value");
            info.true_intrst_dur = unpacker.GetDouble("true_intrst_dur");
            info.true_intrst_conve = unpacker.GetDouble("true_intrst_conve");
            info.true_spread_dur = unpacker.GetDouble("true_spread_dur");
            info.true_spread_conve = unpacker.GetDouble("true_spread_conve");
            info.abs_liq_coeffi = unpacker.GetDouble("abs_liq_coeffi");
            info.pstion_per = unpacker.GetDouble("pstion_per");
            info.rela_liq_coeffi = unpacker.GetDouble("rela_liq_coeffi");
            info.rela_liq_num = unpacker.GetDouble("rela_liq_num");
            info.sett_value_dirty_rice = unpacker.GetDouble("sett_value_dirty_rice");
            info.sett_accr_intrst = unpacker.GetDouble("sett_accr_intrst");
            info.remain_capit = unpacker.GetDouble("remain_capit");
            info.point_spread_yield = unpacker.GetDouble("point_spread_yield");
            rptL_3_26_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_3_26_InfoList.Add((rptL_3_26_Info)info);
        }
        #endregion

        //逻辑_报表_报表查询_债券分析查询明细
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_3_26_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    info.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.bond_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BOND_CODE_STR);
                    info.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    info.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    info.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    info.stock_asset_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_VALUE_FLOAT);
                    info.cost_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_PRICE_FLOAT);
                    info.rating_agency = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RATING_AGENCY_STR);
                    info.bond_level = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BOND_LEVEL_INT);
                    info.bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT);
                    info.value_dirty_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VALUE_DIRTY_PRICE_FLOAT);
                    info.value_net_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VALUE_NET_PRICE_FLOAT);
                    info.value_price_yield = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VALUE_PRICE_YIELD_FLOAT);
                    info.value_price_modi_dur = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VALUE_PRICE_MODI_DUR_FLOAT);
                    info.value_price_conve = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VALUE_PRICE_CONVE_FLOAT);
                    info.value_price_point_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VALUE_PRICE_POINT_VALUE_FLOAT);
                    info.value_price_intrst_dur = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VALUE_PRICE_INTRST_DUR_FLOAT);
                    info.value_price_intrst_conve = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VALUE_PRICE_INTRST_CONVE_FLOAT);
                    info.value_price_spread_dur = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VALUE_PRICE_SPREAD_DUR_FLOAT);
                    info.value_price_spread_Conve = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VALUE_PRICE_SPREAD_CONVE_FLOAT);
                    info.true_dirty_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRUE_DIRTY_PRICE_FLOAT);
                    info.true_net_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRUE_NET_PRICE_FLOAT);
                    info.true_yield = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRUE_YIELD_FLOAT);
                    info.true_remain_limit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRUE_REMAIN_LIMIT_FLOAT);
                    info.true_avg_modi_dur = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRUE_AVG_MODI_DUR_FLOAT);
                    info.true_conve = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRUE_CONVE_FLOAT);
                    info.true_point_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRUE_POINT_VALUE_FLOAT);
                    info.true_intrst_dur = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRUE_INTRST_DUR_FLOAT);
                    info.true_intrst_conve = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRUE_INTRST_CONVE_FLOAT);
                    info.true_spread_dur = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRUE_SPREAD_DUR_FLOAT);
                    info.true_spread_conve = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRUE_SPREAD_CONVE_FLOAT);
                    info.abs_liq_coeffi = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ABS_LIQ_COEFFI_FLOAT);
                    info.pstion_per = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PSTION_PER_FLOAT);
                    info.rela_liq_coeffi = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RELA_LIQ_COEFFI_FLOAT);
                    info.rela_liq_num = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RELA_LIQ_NUM_FLOAT);
                    info.sett_value_dirty_rice = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SETT_VALUE_DIRTY_RICE_FLOAT);
                    info.sett_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SETT_ACCR_INTRST_FLOAT);
                    info.remain_capit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REMAIN_CAPIT_FLOAT);
                    info.point_spread_yield = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POINT_SPREAD_YIELD_FLOAT);
                    rptL_3_26_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_3_27_Response : IResponse
    {
        #region 构造函数
        public rptL_3_27_Response()
        {
            this.rptL_3_27_InfoList = new ObservableCollection<rptL_3_27_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_3_27_Info> rptL_3_27_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_3_27_Info info = new rptL_3_27_Info();
            info.pd_no = unpacker.GetInt("pd_no");
            info.pd_code = unpacker.GetStr("pd_code");
            info.pd_name = unpacker.GetStr("pd_name");
            info.end_date = unpacker.GetInt("end_date");
            info.co_no = unpacker.GetInt("co_no");
            info.first_indu_code = unpacker.GetStr("first_indu_code");
            info.end_date_weight = unpacker.GetDouble("end_date_weight");
            info.end_date_revenue = unpacker.GetDouble("end_date_revenue");
            info.clean_price_profit = unpacker.GetDouble("clean_price_profit");
            info.clean_price_revenue = unpacker.GetDouble("clean_price_revenue");
            info.total_return = unpacker.GetDouble("total_return");
            info.interest_revenue_total = unpacker.GetDouble("interest_revenue_total");
            info.face_value = unpacker.GetDouble("face_value");
            info.clean_price_market_value = unpacker.GetDouble("clean_price_market_value");
            info.dirty_price_market_value = unpacker.GetDouble("dirty_price_market_value");
            rptL_3_27_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_3_27_InfoList.Add((rptL_3_27_Info)info);
        }
        #endregion

        //逻辑_报表_报表查询_债券分析查询行业权重
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_3_27_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    info.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    info.end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.first_indu_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FIRST_INDU_CODE_STR);
                    info.end_date_weight = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_WEIGHT_FLOAT);
                    info.end_date_revenue = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_REVENUE_FLOAT);
                    info.clean_price_profit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLEAN_PRICE_PROFIT_FLOAT);
                    info.clean_price_revenue = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLEAN_PRICE_REVENUE_FLOAT);
                    info.total_return = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_RETURN_FLOAT);
                    info.interest_revenue_total = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTEREST_REVENUE_TOTAL_FLOAT);
                    info.face_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FACE_VALUE_FLOAT);
                    info.clean_price_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLEAN_PRICE_MARKET_VALUE_FLOAT);
                    info.dirty_price_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DIRTY_PRICE_MARKET_VALUE_FLOAT);
                    rptL_3_27_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_3_29_Response : IResponse
    {
        #region 构造函数
        public rptL_3_29_Response()
        {
            this.rptL_3_29_InfoList = new ObservableCollection<rptL_3_29_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_3_29_Info> rptL_3_29_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_3_29_Info info = new rptL_3_29_Info();
            info.pd_no = unpacker.GetInt("pd_no");
            info.pd_name = unpacker.GetStr("pd_name");
            info.pd_code = unpacker.GetStr("pd_code");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_name = unpacker.GetStr("stock_name");
            info.stock_asset_value = unpacker.GetDouble("stock_asset_value");
            info.cost_price = unpacker.GetDouble("cost_price");
            info.posi_qty = unpacker.GetDouble("posi_qty");
            info.cost_amt = unpacker.GetDouble("cost_amt");
            info.float_pandl = unpacker.GetDouble("float_pandl");
            rptL_3_29_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_3_29_InfoList.Add((rptL_3_29_Info)info);
        }
        #endregion

        //逻辑_报表_报表查询_期货持仓查询明细
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_3_29_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    info.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    info.stock_asset_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_VALUE_FLOAT);
                    info.cost_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_PRICE_FLOAT);
                    info.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    info.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                    info.float_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FLOAT_PANDL_FLOAT);
                    rptL_3_29_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_3_30_Response : IResponse
    {
        #region 构造函数
        public rptL_3_30_Response()
        {
            this.rptL_3_30_InfoList = new ObservableCollection<rptL_3_30_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_3_30_Info> rptL_3_30_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_3_30_Info info = new rptL_3_30_Info();
            info.pd_no = unpacker.GetInt("pd_no");
            info.pd_name = unpacker.GetStr("pd_name");
            info.pd_code = unpacker.GetStr("pd_code");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_name = unpacker.GetStr("stock_name");
            info.stock_asset_value = unpacker.GetDouble("stock_asset_value");
            info.cost_price = unpacker.GetDouble("cost_price");
            info.posi_qty = unpacker.GetDouble("posi_qty");
            info.cost_amt = unpacker.GetDouble("cost_amt");
            info.float_pandl = unpacker.GetDouble("float_pandl");
            rptL_3_30_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_3_30_InfoList.Add((rptL_3_30_Info)info);
        }
        #endregion

        //逻辑_报表_报表查询_期货保证金分析
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_3_30_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    info.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    info.stock_asset_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_VALUE_FLOAT);
                    info.cost_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_PRICE_FLOAT);
                    info.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    info.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                    info.float_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FLOAT_PANDL_FLOAT);
                    rptL_3_30_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_3_31_Response : IResponse
    {
        #region 构造函数
        public rptL_3_31_Response()
        {
            this.rptL_3_31_InfoList = new ObservableCollection<rptL_3_31_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_3_31_Info> rptL_3_31_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_3_31_Info info = new rptL_3_31_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_code = unpacker.GetStr("pd_code");
            info.pd_name = unpacker.GetStr("pd_name");
            info.product_id = unpacker.GetInt64("product_id");
            info.contrc_name = unpacker.GetStr("contrc_name");
            info.contrc_code = unpacker.GetStr("contrc_code");
            info.exch_no = unpacker.GetInt("exch_no");
            info.posi_market_value = unpacker.GetDouble("posi_market_value");
            info.stock_acco = unpacker.GetStr("stock_acco");
            info.futu_acco = unpacker.GetStr("futu_acco");
            info.asset_acco = unpacker.GetStr("asset_acco");
            info.invest_type = unpacker.GetInt("invest_type");
            info.lngsht_type = unpacker.GetInt("lngsht_type");
            info.contrc_unit = unpacker.GetInt("contrc_unit");
            info.hedge_type = unpacker.GetInt("hedge_type");
            info.begin_qty = unpacker.GetDouble("begin_qty");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.frozen_qty = unpacker.GetDouble("frozen_qty");
            info.unfroz_qty = unpacker.GetDouble("unfroz_qty");
            info.buy_pre_sett_qty = unpacker.GetDouble("buy_pre_sett_qty");
            info.sell_pre_sett_qty = unpacker.GetDouble("sell_pre_sett_qty");
            info.rece_margin = unpacker.GetDouble("rece_margin");
            info.realize_pandl = unpacker.GetDouble("realize_pandl");
            info.avail_qty = unpacker.GetDouble("avail_qty");
            rptL_3_31_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_3_31_InfoList.Add((rptL_3_31_Info)info);
        }
        #endregion

        //逻辑_报表_报表查询_期货持仓产品持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_3_31_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    info.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    info.product_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_PRODUCT_ID_INT64);
                    info.contrc_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_NAME_STR);
                    info.contrc_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_MARKET_VALUE_FLOAT);
                    info.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                    info.futu_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_STR);
                    info.asset_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STR);
                    info.invest_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INVEST_TYPE_INT);
                    info.lngsht_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT);
                    info.contrc_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_UNIT_INT);
                    info.hedge_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT);
                    info.begin_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_QTY_FLOAT);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_QTY_FLOAT);
                    info.unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_QTY_FLOAT);
                    info.buy_pre_sett_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_PRE_SETT_QTY_FLOAT);
                    info.sell_pre_sett_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_PRE_SETT_QTY_FLOAT);
                    info.rece_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RECE_MARGIN_FLOAT);
                    info.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    info.avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVAIL_QTY_FLOAT);
                    rptL_3_31_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_3_32_Response : IResponse
    {
        #region 构造函数
        public rptL_3_32_Response()
        {
            this.rptL_3_32_InfoList = new ObservableCollection<rptL_3_32_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_3_32_Info> rptL_3_32_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_3_32_Info info = new rptL_3_32_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.detail_posi_id = unpacker.GetInt64("detail_posi_id");
            info.co_no = unpacker.GetInt("co_no");
            info.product_id = unpacker.GetInt64("product_id");
            info.pd_code = unpacker.GetStr("pd_code");
            info.pd_name = unpacker.GetStr("pd_name");
            info.contrc_type = unpacker.GetInt("contrc_type");
            info.contrc_code = unpacker.GetStr("contrc_code");
            info.exch_no = unpacker.GetInt("exch_no");
            info.asset_acco = unpacker.GetStr("asset_acco");
            info.futu_acco = unpacker.GetStr("futu_acco");
            info.invest_type = unpacker.GetInt("invest_type");
            info.lngsht_type = unpacker.GetInt("lngsht_type");
            info.open_posi_date = unpacker.GetInt("open_posi_date");
            info.open_posi_time = unpacker.GetInt("open_posi_time");
            info.strike_no = unpacker.GetStr("strike_no");
            info.open_posi_price = unpacker.GetDouble("open_posi_price");
            info.open_posi_qty = unpacker.GetDouble("open_posi_qty");
            info.trade_capt_qty = unpacker.GetDouble("trade_capt_qty");
            info.strike_capt_qty = unpacker.GetDouble("strike_capt_qty");
            info.open_posi_fee = unpacker.GetDouble("open_posi_fee");
            info.close_posi_fee = unpacker.GetDouble("close_posi_fee");
            info.marked_sett_price = unpacker.GetDouble("marked_sett_price");
            info.marked_pandl = unpacker.GetDouble("marked_pandl");
            info.close_pandl = unpacker.GetDouble("close_pandl");
            info.rece_margin = unpacker.GetDouble("rece_margin");
            info.hedge_type = unpacker.GetInt("hedge_type");
            info.open_amount = unpacker.GetDouble("open_amount");
            rptL_3_32_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_3_32_InfoList.Add((rptL_3_32_Info)info);
        }
        #endregion

        //逻辑_报表_报表查询_期货持仓产品持仓明细
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_3_32_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.detail_posi_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_DETAIL_POSI_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.product_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_PRODUCT_ID_INT64);
                    info.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    info.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    info.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    info.contrc_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.asset_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STR);
                    info.futu_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_STR);
                    info.invest_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INVEST_TYPE_INT);
                    info.lngsht_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT);
                    info.open_posi_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_DATE_INT);
                    info.open_posi_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_TIME_INT);
                    info.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                    info.open_posi_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_PRICE_FLOAT);
                    info.open_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_QTY_FLOAT);
                    info.trade_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CAPT_QTY_FLOAT);
                    info.strike_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_CAPT_QTY_FLOAT);
                    info.open_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_FEE_FLOAT);
                    info.close_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_FEE_FLOAT);
                    info.marked_sett_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKED_SETT_PRICE_FLOAT);
                    info.marked_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKED_PANDL_FLOAT);
                    info.close_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_PANDL_FLOAT);
                    info.rece_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RECE_MARGIN_FLOAT);
                    info.hedge_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT);
                    info.open_amount = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_AMOUNT_FLOAT);
                    rptL_3_32_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_3_34_Response : IResponse
    {
        #region 构造函数
        public rptL_3_34_Response()
        {
            this.rptL_3_34_InfoList = new ObservableCollection<rptL_3_34_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_3_34_Info> rptL_3_34_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_3_34_Info info = new rptL_3_34_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.pd_no = unpacker.GetInt("pd_no");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_code = unpacker.GetStr("pd_code");
            info.pd_name = unpacker.GetStr("pd_name");
            info.unit_nav = unpacker.GetDouble("unit_nav");
            info.nav_asset = unpacker.GetDouble("nav_asset");
            info.fund_share_total = unpacker.GetDouble("fund_share_total");
            info.daily_pandl_ratio = unpacker.GetDouble("daily_pandl_ratio");
            info.total_realize_pandl_ratio_year = unpacker.GetDouble("total_realize_pandl_ratio_year");
            info.fund_manager = unpacker.GetStr("fund_manager");
            info.standard_return = unpacker.GetDouble("standard_return");
            info.cmp_product_return_rate = unpacker.GetDouble("cmp_product_return_rate");
            info.trade_days = unpacker.GetInt("trade_days");
            info.excess_earning_year = unpacker.GetDouble("excess_earning_year");
            info.annual_yield = unpacker.GetDouble("annual_yield");
            info.max_retracement = unpacker.GetDouble("max_retracement");
            info.max_rise_range = unpacker.GetDouble("max_rise_range");
            info.volatility = unpacker.GetDouble("volatility");
            info.volatility_yearly = unpacker.GetDouble("volatility_yearly");
            info.sharpe_ration = unpacker.GetDouble("sharpe_ration");
            info.down_risk = unpacker.GetDouble("down_risk");
            info.sortino_ratio = unpacker.GetDouble("sortino_ratio");
            info.jensen_index = unpacker.GetDouble("jensen_index");
            info.beta_ratio = unpacker.GetDouble("beta_ratio");
            info.info_ratio = unpacker.GetDouble("info_ratio");
            info.kamabi = unpacker.GetDouble("kamabi");
            info.timing_ability = unpacker.GetDouble("timing_ability");
            info.stock_selection_ability = unpacker.GetDouble("stock_selection_ability");
            rptL_3_34_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_3_34_InfoList.Add((rptL_3_34_Info)info);
        }
        #endregion

        //逻辑_报表_报表查询_查询产品风险指标
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_3_34_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    info.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    info.unit_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_NAV_FLOAT);
                    info.nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT);
                    info.fund_share_total = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_SHARE_TOTAL_FLOAT);
                    info.daily_pandl_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DAILY_PANDL_RATIO_FLOAT);
                    info.total_realize_pandl_ratio_year = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_REALIZE_PANDL_RATIO_YEAR_FLOAT);
                    info.fund_manager = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_STR);
                    info.standard_return = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STANDARD_RETURN_FLOAT);
                    info.cmp_product_return_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CMP_PRODUCT_RETURN_RATE_FLOAT);
                    info.trade_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_DAYS_INT);
                    info.excess_earning_year = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_EXCESS_EARNING_YEAR_FLOAT);
                    info.annual_yield = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ANNUAL_YIELD_FLOAT);
                    info.max_retracement = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_RETRACEMENT_FLOAT);
                    info.max_rise_range = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_RISE_RANGE_FLOAT);
                    info.volatility = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VOLATILITY_FLOAT);
                    info.volatility_yearly = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VOLATILITY_YEARLY_FLOAT);
                    info.sharpe_ration = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SHARPE_RATION_FLOAT);
                    info.down_risk = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DOWN_RISK_FLOAT);
                    info.sortino_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SORTINO_RATIO_FLOAT);
                    info.jensen_index = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_JENSEN_INDEX_FLOAT);
                    info.beta_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BETA_RATIO_FLOAT);
                    info.info_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INFO_RATIO_FLOAT);
                    info.kamabi = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_KAMABI_FLOAT);
                    info.timing_ability = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TIMING_ABILITY_FLOAT);
                    info.stock_selection_ability = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_SELECTION_ABILITY_FLOAT);
                    rptL_3_34_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_3_35_Response : IResponse
    {
        #region 构造函数
        public rptL_3_35_Response()
        {
            this.rptL_3_35_InfoList = new ObservableCollection<rptL_3_35_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_3_35_Info> rptL_3_35_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_3_35_Info info = new rptL_3_35_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.pd_no = unpacker.GetInt("pd_no");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_code = unpacker.GetStr("pd_code");
            info.pd_name = unpacker.GetStr("pd_name");
            info.fund_manager = unpacker.GetStr("fund_manager");
            info.annual_yield = unpacker.GetDouble("annual_yield");
            info.standard_return = unpacker.GetDouble("standard_return");
            info.distributional_effect_rate = unpacker.GetDouble("distributional_effect_rate");
            info.selection_effect_rate = unpacker.GetDouble("selection_effect_rate");
            info.interaction_effect_rate = unpacker.GetDouble("interaction_effect_rate");
            info.all_effect_rate = unpacker.GetDouble("all_effect_rate");
            info.cmp_product_return_rate = unpacker.GetDouble("cmp_product_return_rate");
            rptL_3_35_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_3_35_InfoList.Add((rptL_3_35_Info)info);
        }
        #endregion

        //逻辑_报表_报表查询_查询产品归因效应
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_3_35_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    info.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    info.fund_manager = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_STR);
                    info.annual_yield = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ANNUAL_YIELD_FLOAT);
                    info.standard_return = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STANDARD_RETURN_FLOAT);
                    info.distributional_effect_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DISTRIBUTIONAL_EFFECT_RATE_FLOAT);
                    info.selection_effect_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELECTION_EFFECT_RATE_FLOAT);
                    info.interaction_effect_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTERACTION_EFFECT_RATE_FLOAT);
                    info.all_effect_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_EFFECT_RATE_FLOAT);
                    info.cmp_product_return_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CMP_PRODUCT_RETURN_RATE_FLOAT);
                    rptL_3_35_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_3_36_Response : IResponse
    {
        #region 构造函数
        public rptL_3_36_Response()
        {
            this.rptL_3_36_InfoList = new ObservableCollection<rptL_3_36_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_3_36_Info> rptL_3_36_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_3_36_Info info = new rptL_3_36_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.begin_date = unpacker.GetInt("begin_date");
            info.end_date = unpacker.GetInt("end_date");
            info.pd_no = unpacker.GetInt("pd_no");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_code = unpacker.GetStr("pd_code");
            info.pd_name = unpacker.GetStr("pd_name");
            info.trade_stock_cnt = unpacker.GetInt("trade_stock_cnt");
            info.profit_total = unpacker.GetDouble("profit_total");
            info.profit_stock_cnt = unpacker.GetInt("profit_stock_cnt");
            info.loss_stock_cnt = unpacker.GetInt("loss_stock_cnt");
            info.profit_balance = unpacker.GetDouble("profit_balance");
            info.loss_balance = unpacker.GetDouble("loss_balance");
            info.win_rate = unpacker.GetDouble("win_rate");
            info.profit_loss_ratio = unpacker.GetDouble("profit_loss_ratio");
            info.max_stock_10_ratio = unpacker.GetDouble("max_stock_10_ratio");
            info.max_stock_10_avg_days = unpacker.GetInt("max_stock_10_avg_days");
            info.tnover_rate = unpacker.GetDouble("tnover_rate");
            rptL_3_36_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_3_36_InfoList.Add((rptL_3_36_Info)info);
        }
        #endregion

        //逻辑_报表_报表查询_查询产品区间交易统计
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_3_36_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT);
                    info.end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    info.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    info.trade_stock_cnt = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_STOCK_CNT_INT);
                    info.profit_total = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PROFIT_TOTAL_FLOAT);
                    info.profit_stock_cnt = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PROFIT_STOCK_CNT_INT);
                    info.loss_stock_cnt = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LOSS_STOCK_CNT_INT);
                    info.profit_balance = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PROFIT_BALANCE_FLOAT);
                    info.loss_balance = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOSS_BALANCE_FLOAT);
                    info.win_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WIN_RATE_FLOAT);
                    info.profit_loss_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PROFIT_LOSS_RATIO_FLOAT);
                    info.max_stock_10_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_STOCK_10_RATIO_FLOAT);
                    info.max_stock_10_avg_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MAX_STOCK_10_AVG_DAYS_INT);
                    info.tnover_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TNOVER_RATE_FLOAT);
                    rptL_3_36_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_3_37_Response : IResponse
    {
        #region 构造函数
        public rptL_3_37_Response()
        {
            this.rptL_3_37_InfoList = new ObservableCollection<rptL_3_37_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_3_37_Info> rptL_3_37_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_3_37_Info info = new rptL_3_37_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.curr_month = unpacker.GetInt("curr_month");
            info.trade_days = unpacker.GetInt("trade_days");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.pd_code = unpacker.GetStr("pd_code");
            info.pd_name = unpacker.GetStr("pd_name");
            info.bond_code = unpacker.GetStr("bond_code");
            info.stock_name = unpacker.GetStr("stock_name");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.intrst_ratio = unpacker.GetDouble("intrst_ratio");
            info.begin_date = unpacker.GetInt("begin_date");
            info.begin_value = unpacker.GetDouble("begin_value");
            info.begin_net_price = unpacker.GetDouble("begin_net_price");
            info.begin_full_price = unpacker.GetDouble("begin_full_price");
            info.end_date = unpacker.GetInt("end_date");
            info.end_value = unpacker.GetDouble("end_value");
            info.end_net_price = unpacker.GetDouble("end_net_price");
            info.end_full_price = unpacker.GetDouble("end_full_price");
            info.pay_interest_term = unpacker.GetDouble("pay_interest_term");
            info.profit_from_capital = unpacker.GetDouble("profit_from_capital");
            info.coupon_yield = unpacker.GetDouble("coupon_yield");
            info.cb_profit = unpacker.GetDouble("cb_profit");
            info.bond_kind = unpacker.GetInt("bond_kind");
            info.recover_capital = unpacker.GetDouble("recover_capital");
            info.value_price_modi_dur = unpacker.GetDouble("value_price_modi_dur");
            rptL_3_37_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_3_37_InfoList.Add((rptL_3_37_Info)info);
        }
        #endregion

        //逻辑_报表_报表查询_查询产品债券月度持仓统计
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_3_37_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.curr_month = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONTH_INT);
                    info.trade_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_DAYS_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    info.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    info.bond_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BOND_CODE_STR);
                    info.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.intrst_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_RATIO_FLOAT);
                    info.begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT);
                    info.begin_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_VALUE_FLOAT);
                    info.begin_net_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_NET_PRICE_FLOAT);
                    info.begin_full_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_FULL_PRICE_FLOAT);
                    info.end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT);
                    info.end_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_END_VALUE_FLOAT);
                    info.end_net_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_END_NET_PRICE_FLOAT);
                    info.end_full_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_END_FULL_PRICE_FLOAT);
                    info.pay_interest_term = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAY_INTEREST_TERM_FLOAT);
                    info.profit_from_capital = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PROFIT_FROM_CAPITAL_FLOAT);
                    info.coupon_yield = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COUPON_YIELD_FLOAT);
                    info.cb_profit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CB_PROFIT_FLOAT);
                    info.bond_kind = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BOND_KIND_INT);
                    info.recover_capital = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RECOVER_CAPITAL_FLOAT);
                    info.value_price_modi_dur = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VALUE_PRICE_MODI_DUR_FLOAT);
                    rptL_3_37_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_3_38_Response : IResponse
    {
        #region 构造函数
        public rptL_3_38_Response()
        {
            this.rptL_3_38_InfoList = new ObservableCollection<rptL_3_38_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_3_38_Info> rptL_3_38_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_3_38_Info info = new rptL_3_38_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.curr_month = unpacker.GetInt("curr_month");
            info.pd_no = unpacker.GetInt("pd_no");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_code = unpacker.GetStr("pd_code");
            info.pd_name = unpacker.GetStr("pd_name");
            info.exch_no = unpacker.GetInt("exch_no");
            info.bond_code = unpacker.GetStr("bond_code");
            info.stock_name = unpacker.GetStr("stock_name");
            info.trade_qty = unpacker.GetDouble("trade_qty");
            info.order_dir = unpacker.GetInt("order_dir");
            info.trade_date = unpacker.GetInt("trade_date");
            info.bank_ib_member = unpacker.GetStr("bank_ib_member");
            info.value_yield = unpacker.GetDouble("value_yield");
            info.value_net_price = unpacker.GetDouble("value_net_price");
            info.trade_yield = unpacker.GetDouble("trade_yield");
            info.trade_net_price = unpacker.GetDouble("trade_net_price");
            info.profit = unpacker.GetDouble("profit");
            info.bond_kind = unpacker.GetInt("bond_kind");
            rptL_3_38_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_3_38_InfoList.Add((rptL_3_38_Info)info);
        }
        #endregion

        //逻辑_报表_报表查询_查询产品债券月度交易明细
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_3_38_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.curr_month = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONTH_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    info.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.bond_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BOND_CODE_STR);
                    info.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    info.trade_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_QTY_FLOAT);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.trade_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_DATE_INT);
                    info.bank_ib_member = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BANK_IB_MEMBER_STR);
                    info.value_yield = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VALUE_YIELD_FLOAT);
                    info.value_net_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VALUE_NET_PRICE_FLOAT);
                    info.trade_yield = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_YIELD_FLOAT);
                    info.trade_net_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_NET_PRICE_FLOAT);
                    info.profit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PROFIT_FLOAT);
                    info.bond_kind = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BOND_KIND_INT);
                    rptL_3_38_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_3_39_Response : IResponse
    {
        #region 构造函数
        public rptL_3_39_Response()
        {
            this.rptL_3_39_InfoList = new ObservableCollection<rptL_3_39_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_3_39_Info> rptL_3_39_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_3_39_Info info = new rptL_3_39_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.curr_month = unpacker.GetInt("curr_month");
            info.pd_no = unpacker.GetInt("pd_no");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_code = unpacker.GetStr("pd_code");
            info.pd_name = unpacker.GetStr("pd_name");
            info.exch_no = unpacker.GetInt("exch_no");
            info.bond_code = unpacker.GetStr("bond_code");
            info.stock_name = unpacker.GetStr("stock_name");
            info.bond_type = unpacker.GetInt("bond_type");
            info.avg_invest_ratio = unpacker.GetDouble("avg_invest_ratio");
            info.avg_yield = unpacker.GetDouble("avg_yield");
            info.yield_ratio = unpacker.GetDouble("yield_ratio");
            info.holder_profit = unpacker.GetDouble("holder_profit");
            info.trade_profit = unpacker.GetDouble("trade_profit");
            info.total_profit = unpacker.GetDouble("total_profit");
            info.bond_cr_level = unpacker.GetDouble("bond_cr_level");
            info.rem_per = unpacker.GetDouble("rem_per");
            info.bond_limit = unpacker.GetDouble("bond_limit");
            rptL_3_39_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_3_39_InfoList.Add((rptL_3_39_Info)info);
        }
        #endregion

        //逻辑_报表_报表查询_查询产品债券月度交易汇总
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_3_39_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.curr_month = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONTH_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    info.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.bond_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BOND_CODE_STR);
                    info.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    info.bond_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BOND_TYPE_INT);
                    info.avg_invest_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVG_INVEST_RATIO_FLOAT);
                    info.avg_yield = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVG_YIELD_FLOAT);
                    info.yield_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_YIELD_RATIO_FLOAT);
                    info.holder_profit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HOLDER_PROFIT_FLOAT);
                    info.trade_profit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_PROFIT_FLOAT);
                    info.total_profit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_PROFIT_FLOAT);
                    info.bond_cr_level = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_CR_LEVEL_FLOAT);
                    info.rem_per = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REM_PER_FLOAT);
                    info.bond_limit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_LIMIT_FLOAT);
                    rptL_3_39_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_3_40_Response : IResponse
    {
        #region 构造函数
        public rptL_3_40_Response()
        {
            this.rptL_3_40_InfoList = new ObservableCollection<rptL_3_40_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_3_40_Info> rptL_3_40_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_3_40_Info info = new rptL_3_40_Info();
            info.curr_month = unpacker.GetInt("curr_month");
            info.pd_no = unpacker.GetInt("pd_no");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_code = unpacker.GetStr("pd_code");
            info.pd_name = unpacker.GetStr("pd_name");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.asset_type = unpacker.GetInt("asset_type");
            info.begin_invest_ratio = unpacker.GetDouble("begin_invest_ratio");
            info.end_invest_ratio = unpacker.GetDouble("end_invest_ratio");
            info.avg_invest_ratio = unpacker.GetDouble("avg_invest_ratio");
            info.return_on_investment = unpacker.GetDouble("return_on_investment");
            info.yield_ratio = unpacker.GetDouble("yield_ratio");
            info.cmp_ytm = unpacker.GetDouble("cmp_ytm");
            info.excess_earning_year = unpacker.GetDouble("excess_earning_year");
            info.begin_market_value = unpacker.GetDouble("begin_market_value");
            info.end_market_value = unpacker.GetDouble("end_market_value");
            info.avg_market_value = unpacker.GetDouble("avg_market_value");
            info.holder_profit = unpacker.GetDouble("holder_profit");
            info.trade_profit = unpacker.GetDouble("trade_profit");
            info.total_profit = unpacker.GetDouble("total_profit");
            rptL_3_40_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_3_40_InfoList.Add((rptL_3_40_Info)info);
        }
        #endregion

        //逻辑_报表_报表查询_查询产品债券月度资产统计
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_3_40_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.curr_month = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONTH_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    info.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    info.begin_invest_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_INVEST_RATIO_FLOAT);
                    info.end_invest_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_END_INVEST_RATIO_FLOAT);
                    info.avg_invest_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVG_INVEST_RATIO_FLOAT);
                    info.return_on_investment = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RETURN_ON_INVESTMENT_FLOAT);
                    info.yield_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_YIELD_RATIO_FLOAT);
                    info.cmp_ytm = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CMP_YTM_FLOAT);
                    info.excess_earning_year = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_EXCESS_EARNING_YEAR_FLOAT);
                    info.begin_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_MARKET_VALUE_FLOAT);
                    info.end_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_END_MARKET_VALUE_FLOAT);
                    info.avg_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVG_MARKET_VALUE_FLOAT);
                    info.holder_profit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HOLDER_PROFIT_FLOAT);
                    info.trade_profit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_PROFIT_FLOAT);
                    info.total_profit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_PROFIT_FLOAT);
                    rptL_3_40_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_3_61_Response : IResponse
    {
        #region 构造函数
        public rptL_3_61_Response()
        {
            this.rptL_3_61_InfoList = new ObservableCollection<rptL_3_61_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_3_61_Info> rptL_3_61_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_3_61_Info info = new rptL_3_61_Info();
            info.init_date = unpacker.GetInt("init_date");
            info.pd_no = unpacker.GetInt("pd_no");
            info.pd_code = unpacker.GetStr("pd_code");
            info.pd_name = unpacker.GetStr("pd_name");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_name = unpacker.GetStr("stock_name");
            info.stock_asset_value = unpacker.GetDouble("stock_asset_value");
            info.cost_price = unpacker.GetDouble("cost_price");
            info.posi_qty = unpacker.GetDouble("posi_qty");
            info.cost_amt = unpacker.GetDouble("cost_amt");
            info.float_pandl = unpacker.GetDouble("float_pandl");
            info.weight_ratio = unpacker.GetDouble("weight_ratio");
            rptL_3_61_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_3_61_InfoList.Add((rptL_3_61_Info)info);
        }
        #endregion

        //逻辑_报表_报表查询_查询产品持仓明细
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_3_61_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    info.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    info.stock_asset_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_VALUE_FLOAT);
                    info.cost_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_PRICE_FLOAT);
                    info.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    info.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                    info.float_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FLOAT_PANDL_FLOAT);
                    info.weight_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WEIGHT_RATIO_FLOAT);
                    rptL_3_61_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_3_62_Response : IResponse
    {
        #region 构造函数
        public rptL_3_62_Response()
        {
            this.rptL_3_62_InfoList = new ObservableCollection<rptL_3_62_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_3_62_Info> rptL_3_62_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_3_62_Info info = new rptL_3_62_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.pd_no = unpacker.GetInt("pd_no");
            info.pd_code = unpacker.GetStr("pd_code");
            info.pd_name = unpacker.GetStr("pd_name");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_name = unpacker.GetStr("stock_name");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.order_dir = unpacker.GetInt("order_dir");
            info.order_price = unpacker.GetDouble("order_price");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.order_frozen_amt = unpacker.GetDouble("order_frozen_amt");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.asset_type = unpacker.GetInt("asset_type");
            info.stock_type = unpacker.GetInt("stock_type");
            rptL_3_62_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_3_62_InfoList.Add((rptL_3_62_Info)info);
        }
        #endregion

        //逻辑_报表_报表查询_查询产品交易明细
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_3_62_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    info.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    info.order_frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_FROZEN_AMT_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    rptL_3_62_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_3_63_Response : IResponse
    {
        #region 构造函数
        public rptL_3_63_Response()
        {
            this.rptL_3_63_InfoList = new ObservableCollection<rptL_3_63_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_3_63_Info> rptL_3_63_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_3_63_Info info = new rptL_3_63_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.pd_no = unpacker.GetInt("pd_no");
            info.pd_code = unpacker.GetStr("pd_code");
            info.pd_name = unpacker.GetStr("pd_name");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.order_dir = unpacker.GetInt("order_dir");
            info.order_frozen_amt = unpacker.GetDouble("order_frozen_amt");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.asset_type = unpacker.GetInt("asset_type");
            rptL_3_63_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_3_63_InfoList.Add((rptL_3_63_Info)info);
        }
        #endregion

        //逻辑_报表_报表查询_查询产品交易汇总方向
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_3_63_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    info.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.order_frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_FROZEN_AMT_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    info.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    rptL_3_63_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_3_64_Response : IResponse
    {
        #region 构造函数
        public rptL_3_64_Response()
        {
            this.rptL_3_64_InfoList = new ObservableCollection<rptL_3_64_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_3_64_Info> rptL_3_64_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_3_64_Info info = new rptL_3_64_Info();
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_name = unpacker.GetStr("stock_name");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.order_dir = unpacker.GetInt("order_dir");
            info.order_frozen_amt = unpacker.GetDouble("order_frozen_amt");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.asset_type = unpacker.GetInt("asset_type");
            rptL_3_64_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_3_64_InfoList.Add((rptL_3_64_Info)info);
        }
        #endregion

        //逻辑_报表_报表查询_查询产品交易汇总证券机构
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_3_64_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.order_frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_FROZEN_AMT_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    info.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    rptL_3_64_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_3_66_Response : IResponse
    {
        #region 构造函数
        public rptL_3_66_Response()
        {
            this.rptL_3_66_InfoList = new ObservableCollection<rptL_3_66_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_3_66_Info> rptL_3_66_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_3_66_Info info = new rptL_3_66_Info();
            info.pd_no = unpacker.GetInt("pd_no");
            info.pd_code = unpacker.GetStr("pd_code");
            info.pd_name = unpacker.GetStr("pd_name");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_name = unpacker.GetStr("stock_name");
            info.stock_type = unpacker.GetInt("stock_type");
            info.today_buy_qty = unpacker.GetDouble("today_buy_qty");
            info.today_sell_qty = unpacker.GetDouble("today_sell_qty");
            info.posi_qty = unpacker.GetDouble("posi_qty");
            info.cost_price = unpacker.GetDouble("cost_price");
            info.today_close_price = unpacker.GetDouble("today_close_price");
            info.posi_market_value = unpacker.GetDouble("posi_market_value");
            rptL_3_66_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_3_66_InfoList.Add((rptL_3_66_Info)info);
        }
        #endregion

        //逻辑_报表_报表查询_查询产品持仓汇总
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_3_66_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    info.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.today_buy_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_BUY_QTY_FLOAT);
                    info.today_sell_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_SELL_QTY_FLOAT);
                    info.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    info.cost_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_PRICE_FLOAT);
                    info.today_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_CLOSE_PRICE_FLOAT);
                    info.posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_MARKET_VALUE_FLOAT);
                    rptL_3_66_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_3_67_Response : IResponse
    {
        #region 构造函数
        public rptL_3_67_Response()
        {
            this.rptL_3_67_InfoList = new ObservableCollection<rptL_3_67_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_3_67_Info> rptL_3_67_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_3_67_Info info = new rptL_3_67_Info();
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_name = unpacker.GetStr("stock_name");
            info.stock_type = unpacker.GetInt("stock_type");
            info.today_buy_qty = unpacker.GetDouble("today_buy_qty");
            info.today_sell_qty = unpacker.GetDouble("today_sell_qty");
            info.posi_qty = unpacker.GetDouble("posi_qty");
            info.today_close_price = unpacker.GetDouble("today_close_price");
            info.posi_market_value = unpacker.GetDouble("posi_market_value");
            info.posi_nav_ratio = unpacker.GetDouble("posi_nav_ratio");
            rptL_3_67_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_3_67_InfoList.Add((rptL_3_67_Info)info);
        }
        #endregion

        //逻辑_报表_报表查询_查询机构持仓汇总
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_3_67_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.today_buy_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_BUY_QTY_FLOAT);
                    info.today_sell_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_SELL_QTY_FLOAT);
                    info.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    info.today_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_CLOSE_PRICE_FLOAT);
                    info.posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_MARKET_VALUE_FLOAT);
                    info.posi_nav_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_NAV_RATIO_FLOAT);
                    rptL_3_67_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_3_68_Response : IResponse
    {
        #region 构造函数
        public rptL_3_68_Response()
        {
            this.rptL_3_68_InfoList = new ObservableCollection<rptL_3_68_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_3_68_Info> rptL_3_68_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_3_68_Info info = new rptL_3_68_Info();
            info.pd_no = unpacker.GetInt("pd_no");
            info.pd_code = unpacker.GetStr("pd_code");
            info.pd_name = unpacker.GetStr("pd_name");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_name = unpacker.GetStr("stock_name");
            info.stock_type = unpacker.GetInt("stock_type");
            info.pre_holding_qty = unpacker.GetDouble("pre_holding_qty");
            info.today_buy_qty = unpacker.GetDouble("today_buy_qty");
            info.today_buy_amt = unpacker.GetDouble("today_buy_amt");
            info.today_buy_price = unpacker.GetDouble("today_buy_price");
            info.buy_begin_time = unpacker.GetInt("buy_begin_time");
            info.buy_end_time = unpacker.GetInt("buy_end_time");
            info.today_sell_qty = unpacker.GetDouble("today_sell_qty");
            info.today_sell_amt = unpacker.GetDouble("today_sell_amt");
            info.today_sell_price = unpacker.GetDouble("today_sell_price");
            info.sell_begin_time = unpacker.GetInt("sell_begin_time");
            info.sell_end_time = unpacker.GetInt("sell_end_time");
            info.posi_qty = unpacker.GetDouble("posi_qty");
            info.today_close_price = unpacker.GetDouble("today_close_price");
            info.posi_market_value = unpacker.GetDouble("posi_market_value");
            rptL_3_68_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_3_68_InfoList.Add((rptL_3_68_Info)info);
        }
        #endregion

        //逻辑_报表_报表查询_查询产品持仓交易汇总
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_3_68_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    info.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.pre_holding_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_HOLDING_QTY_FLOAT);
                    info.today_buy_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_BUY_QTY_FLOAT);
                    info.today_buy_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_BUY_AMT_FLOAT);
                    info.today_buy_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_BUY_PRICE_FLOAT);
                    info.buy_begin_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUY_BEGIN_TIME_INT);
                    info.buy_end_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUY_END_TIME_INT);
                    info.today_sell_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_SELL_QTY_FLOAT);
                    info.today_sell_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_SELL_AMT_FLOAT);
                    info.today_sell_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_SELL_PRICE_FLOAT);
                    info.sell_begin_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SELL_BEGIN_TIME_INT);
                    info.sell_end_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SELL_END_TIME_INT);
                    info.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    info.today_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_CLOSE_PRICE_FLOAT);
                    info.posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_MARKET_VALUE_FLOAT);
                    rptL_3_68_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_3_81_Response : IResponse
    {
        #region 构造函数
        public rptL_3_81_Response()
        {
            this.rptL_3_81_InfoList = new ObservableCollection<rptL_3_81_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_3_81_Info> rptL_3_81_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_3_81_Info info = new rptL_3_81_Info();
            info.init_date = unpacker.GetInt("init_date");
            info.pd_no = unpacker.GetInt("pd_no");
            info.co_no = unpacker.GetInt("co_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.exch_group_pd_share = unpacker.GetDouble("exch_group_pd_share");
            info.unit_nav = unpacker.GetDouble("unit_nav");
            info.pre_nav = unpacker.GetDouble("pre_nav");
            info.nav_asset = unpacker.GetDouble("nav_asset");
            info.nav_fluct = unpacker.GetDouble("nav_fluct");
            info.posi_ratio = unpacker.GetDouble("posi_ratio");
            info.securities_ratio = unpacker.GetDouble("securities_ratio");
            info.float_pandl = unpacker.GetDouble("float_pandl");
            info.realize_pandl = unpacker.GetDouble("realize_pandl");
            info.total_divi_amt = unpacker.GetDouble("total_divi_amt");
            info.first_asset = unpacker.GetDouble("first_asset");
            info.strategy_type = unpacker.GetInt("strategy_type");
            info.total_pre_fee = unpacker.GetDouble("total_pre_fee");
            info.posi_market_value = unpacker.GetDouble("posi_market_value");
            info.cash_asset = unpacker.GetDouble("cash_asset");
            info.stock_asset = unpacker.GetDouble("stock_asset");
            info.bond_asset = unpacker.GetDouble("bond_asset");
            info.fund_asset = unpacker.GetDouble("fund_asset");
            info.repo_asset = unpacker.GetDouble("repo_asset");
            info.other_asset = unpacker.GetDouble("other_asset");
            info.total_payab_amt = unpacker.GetDouble("total_payab_amt");
            info.total_rece_amt = unpacker.GetDouble("total_rece_amt");
            rptL_3_81_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_3_81_InfoList.Add((rptL_3_81_Info)info);
        }
        #endregion

        //逻辑_报表_报表查询_查询交易组资产持仓附加属性
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_3_81_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.exch_group_pd_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_PD_SHARE_FLOAT);
                    info.unit_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_NAV_FLOAT);
                    info.pre_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_NAV_FLOAT);
                    info.nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT);
                    info.nav_fluct = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_FLUCT_FLOAT);
                    info.posi_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_RATIO_FLOAT);
                    info.securities_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SECURITIES_RATIO_FLOAT);
                    info.float_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FLOAT_PANDL_FLOAT);
                    info.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    info.total_divi_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_DIVI_AMT_FLOAT);
                    info.first_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FIRST_ASSET_FLOAT);
                    info.strategy_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_TYPE_INT);
                    info.total_pre_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_PRE_FEE_FLOAT);
                    info.posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_MARKET_VALUE_FLOAT);
                    info.cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_ASSET_FLOAT);
                    info.stock_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_FLOAT);
                    info.bond_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ASSET_FLOAT);
                    info.fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_ASSET_FLOAT);
                    info.repo_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPO_ASSET_FLOAT);
                    info.other_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_ASSET_FLOAT);
                    info.total_payab_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_PAYAB_AMT_FLOAT);
                    info.total_rece_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_RECE_AMT_FLOAT);
                    rptL_3_81_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_3_82_Response : IResponse
    {
        #region 构造函数
        public rptL_3_82_Response()
        {
            this.rptL_3_82_InfoList = new ObservableCollection<rptL_3_82_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_3_82_Info> rptL_3_82_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_3_82_Info info = new rptL_3_82_Info();
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.posi_market_value = unpacker.GetDouble("posi_market_value");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            rptL_3_82_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_3_82_InfoList.Add((rptL_3_82_Info)info);
        }
        #endregion

        //逻辑_报表_报表查询_查询机构证券持仓成交
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_3_82_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_MARKET_VALUE_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    rptL_3_82_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_3_83_Response : IResponse
    {
        #region 构造函数
        public rptL_3_83_Response()
        {
            this.rptL_3_83_InfoList = new ObservableCollection<rptL_3_83_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_3_83_Info> rptL_3_83_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_3_83_Info info = new rptL_3_83_Info();
            info.init_date = unpacker.GetInt("init_date");
            info.pd_no = unpacker.GetInt("pd_no");
            info.co_no = unpacker.GetInt("co_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.posi_market_value = unpacker.GetDouble("posi_market_value");
            info.posi_ratio = unpacker.GetDouble("posi_ratio");
            info.float_pandl = unpacker.GetDouble("float_pandl");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.cost_amt = unpacker.GetDouble("cost_amt");
            info.realize_pandl = unpacker.GetDouble("realize_pandl");
            info.cost_price = unpacker.GetDouble("cost_price");
            info.last_price = unpacker.GetDouble("last_price");
            rptL_3_83_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_3_83_InfoList.Add((rptL_3_83_Info)info);
        }
        #endregion

        //逻辑_报表_报表查询_查询交易组证券持仓明细
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_3_83_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_MARKET_VALUE_FLOAT);
                    info.posi_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_RATIO_FLOAT);
                    info.float_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FLOAT_PANDL_FLOAT);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                    info.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    info.cost_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_PRICE_FLOAT);
                    info.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    rptL_3_83_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_3_101_Response : IResponse
    {
        #region 构造函数
        public rptL_3_101_Response()
        {
            this.rptL_3_101_InfoList = new ObservableCollection<rptL_3_101_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_3_101_Info> rptL_3_101_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_3_101_Info info = new rptL_3_101_Info();
            info.begin_date = unpacker.GetInt("begin_date");
            info.end_date = unpacker.GetInt("end_date");
            info.pd_no = unpacker.GetInt("pd_no");
            info.co_no = unpacker.GetInt("co_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_type = unpacker.GetInt("stock_type");
            info.asset_type = unpacker.GetInt("asset_type");
            info.begin_close_price = unpacker.GetDouble("begin_close_price");
            info.begin_qty = unpacker.GetDouble("begin_qty");
            info.begin_cost_amt = unpacker.GetDouble("begin_cost_amt");
            info.begin_posi_market_value = unpacker.GetDouble("begin_posi_market_value");
            info.begin_realize_pandl = unpacker.GetDouble("begin_realize_pandl");
            info.end_close_price = unpacker.GetDouble("end_close_price");
            info.end_cur_qty = unpacker.GetInt("end_cur_qty");
            info.end_cost_amt = unpacker.GetDouble("end_cost_amt");
            info.end_posi_market_value = unpacker.GetDouble("end_posi_market_value");
            info.end_realize_pandl = unpacker.GetDouble("end_realize_pandl");
            info.float_pandl = unpacker.GetDouble("float_pandl");
            info.interval_realize_pandl = unpacker.GetDouble("interval_realize_pandl");
            info.interval_pandl = unpacker.GetDouble("interval_pandl");
            rptL_3_101_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_3_101_InfoList.Add((rptL_3_101_Info)info);
        }
        #endregion

        //逻辑_报表_报表查询_查询交易组持仓区间盈亏
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_3_101_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT);
                    info.end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    info.begin_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_CLOSE_PRICE_FLOAT);
                    info.begin_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_QTY_FLOAT);
                    info.begin_cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_COST_AMT_FLOAT);
                    info.begin_posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_POSI_MARKET_VALUE_FLOAT);
                    info.begin_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_REALIZE_PANDL_FLOAT);
                    info.end_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_END_CLOSE_PRICE_FLOAT);
                    info.end_cur_qty = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_CUR_QTY_INT);
                    info.end_cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_END_COST_AMT_FLOAT);
                    info.end_posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_END_POSI_MARKET_VALUE_FLOAT);
                    info.end_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_END_REALIZE_PANDL_FLOAT);
                    info.float_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FLOAT_PANDL_FLOAT);
                    info.interval_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTERVAL_REALIZE_PANDL_FLOAT);
                    info.interval_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTERVAL_PANDL_FLOAT);
                    rptL_3_101_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_3_102_Response : IResponse
    {
        #region 构造函数
        public rptL_3_102_Response()
        {
            this.rptL_3_102_InfoList = new ObservableCollection<rptL_3_102_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_3_102_Info> rptL_3_102_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_3_102_Info info = new rptL_3_102_Info();
            info.begin_date = unpacker.GetInt("begin_date");
            info.end_date = unpacker.GetInt("end_date");
            info.pd_no = unpacker.GetInt("pd_no");
            info.co_no = unpacker.GetInt("co_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.weight_ratio = unpacker.GetDouble("weight_ratio");
            info.begin_cost_amt = unpacker.GetDouble("begin_cost_amt");
            info.begin_posi_market_value = unpacker.GetDouble("begin_posi_market_value");
            info.begin_realize_pandl = unpacker.GetDouble("begin_realize_pandl");
            info.end_cost_amt = unpacker.GetDouble("end_cost_amt");
            info.end_posi_market_value = unpacker.GetDouble("end_posi_market_value");
            info.end_realize_pandl = unpacker.GetDouble("end_realize_pandl");
            info.float_pandl = unpacker.GetDouble("float_pandl");
            info.interval_realize_pandl = unpacker.GetDouble("interval_realize_pandl");
            info.interval_pandl = unpacker.GetDouble("interval_pandl");
            rptL_3_102_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_3_102_InfoList.Add((rptL_3_102_Info)info);
        }
        #endregion

        //逻辑_报表_报表查询_查询交易组持仓区间盈亏行业
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_3_102_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT);
                    info.end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.weight_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WEIGHT_RATIO_FLOAT);
                    info.begin_cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_COST_AMT_FLOAT);
                    info.begin_posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_POSI_MARKET_VALUE_FLOAT);
                    info.begin_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_REALIZE_PANDL_FLOAT);
                    info.end_cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_END_COST_AMT_FLOAT);
                    info.end_posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_END_POSI_MARKET_VALUE_FLOAT);
                    info.end_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_END_REALIZE_PANDL_FLOAT);
                    info.float_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FLOAT_PANDL_FLOAT);
                    info.interval_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTERVAL_REALIZE_PANDL_FLOAT);
                    info.interval_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTERVAL_PANDL_FLOAT);
                    rptL_3_102_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_3_103_Response : IResponse
    {
        #region 构造函数
        public rptL_3_103_Response()
        {
            this.rptL_3_103_InfoList = new ObservableCollection<rptL_3_103_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_3_103_Info> rptL_3_103_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_3_103_Info info = new rptL_3_103_Info();
            info.begin_date = unpacker.GetInt("begin_date");
            info.end_date = unpacker.GetInt("end_date");
            info.pd_no = unpacker.GetInt("pd_no");
            info.co_no = unpacker.GetInt("co_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_type = unpacker.GetInt("stock_type");
            info.asset_type = unpacker.GetInt("asset_type");
            info.begin_close_price = unpacker.GetDouble("begin_close_price");
            info.begin_qty = unpacker.GetDouble("begin_qty");
            info.begin_cost_amt = unpacker.GetDouble("begin_cost_amt");
            info.begin_posi_market_value = unpacker.GetDouble("begin_posi_market_value");
            info.begin_realize_pandl = unpacker.GetDouble("begin_realize_pandl");
            info.end_close_price = unpacker.GetDouble("end_close_price");
            info.end_cur_qty = unpacker.GetInt("end_cur_qty");
            info.end_cost_amt = unpacker.GetDouble("end_cost_amt");
            info.end_posi_market_value = unpacker.GetDouble("end_posi_market_value");
            info.end_realize_pandl = unpacker.GetDouble("end_realize_pandl");
            info.float_pandl = unpacker.GetDouble("float_pandl");
            info.interval_realize_pandl = unpacker.GetDouble("interval_realize_pandl");
            info.interval_pandl = unpacker.GetDouble("interval_pandl");
            info.max_posi_market_value = unpacker.GetDouble("max_posi_market_value");
            rptL_3_103_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_3_103_InfoList.Add((rptL_3_103_Info)info);
        }
        #endregion

        //逻辑_报表_报表查询_查询产品持仓区间盈亏
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_3_103_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT);
                    info.end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    info.begin_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_CLOSE_PRICE_FLOAT);
                    info.begin_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_QTY_FLOAT);
                    info.begin_cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_COST_AMT_FLOAT);
                    info.begin_posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_POSI_MARKET_VALUE_FLOAT);
                    info.begin_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_REALIZE_PANDL_FLOAT);
                    info.end_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_END_CLOSE_PRICE_FLOAT);
                    info.end_cur_qty = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_CUR_QTY_INT);
                    info.end_cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_END_COST_AMT_FLOAT);
                    info.end_posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_END_POSI_MARKET_VALUE_FLOAT);
                    info.end_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_END_REALIZE_PANDL_FLOAT);
                    info.float_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FLOAT_PANDL_FLOAT);
                    info.interval_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTERVAL_REALIZE_PANDL_FLOAT);
                    info.interval_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTERVAL_PANDL_FLOAT);
                    info.max_posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_POSI_MARKET_VALUE_FLOAT);
                    rptL_3_103_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_3_201_Response : IResponse
    {
        #region 构造函数
        public rptL_3_201_Response()
        {
            this.rptL_3_201_InfoList = new ObservableCollection<rptL_3_201_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_3_201_Info> rptL_3_201_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_3_201_Info info = new rptL_3_201_Info();
            info.begin_date = unpacker.GetInt("begin_date");
            info.end_date = unpacker.GetInt("end_date");
            info.pd_no = unpacker.GetInt("pd_no");
            info.share_net = unpacker.GetDouble("share_net");
            info.share_net_total = unpacker.GetDouble("share_net_total");
            info.sharpe_ration = unpacker.GetDouble("sharpe_ration");
            info.max_retracement = unpacker.GetDouble("max_retracement");
            info.annual_yield = unpacker.GetDouble("annual_yield");
            info.net_growth_rate_stdev = unpacker.GetDouble("net_growth_rate_stdev");
            info.achi_compa_pandl_ratio = unpacker.GetDouble("achi_compa_pandl_ratio");
            info.profit_year_ratio = unpacker.GetDouble("profit_year_ratio");
            rptL_3_201_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_3_201_InfoList.Add((rptL_3_201_Info)info);
        }
        #endregion

        //逻辑_报表_报表查询_查询平台产品夏普比率
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_3_201_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT);
                    info.end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.share_net = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SHARE_NET_FLOAT);
                    info.share_net_total = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SHARE_NET_TOTAL_FLOAT);
                    info.sharpe_ration = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SHARPE_RATION_FLOAT);
                    info.max_retracement = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_RETRACEMENT_FLOAT);
                    info.annual_yield = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ANNUAL_YIELD_FLOAT);
                    info.net_growth_rate_stdev = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NET_GROWTH_RATE_STDEV_FLOAT);
                    info.achi_compa_pandl_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACHI_COMPA_PANDL_RATIO_FLOAT);
                    info.profit_year_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PROFIT_YEAR_RATIO_FLOAT);
                    rptL_3_201_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_3_202_Response : IResponse
    {
        #region 构造函数
        public rptL_3_202_Response()
        {
            this.rptL_3_202_InfoList = new ObservableCollection<rptL_3_202_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_3_202_Info> rptL_3_202_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_3_202_Info info = new rptL_3_202_Info();
            info.init_date = unpacker.GetInt("init_date");
            info.pd_no = unpacker.GetInt("pd_no");
            info.share_net_total = unpacker.GetDouble("share_net_total");
            info.pre_nav = unpacker.GetDouble("pre_nav");
            info.busin_date = unpacker.GetInt("busin_date");
            info.return_ratio_in_single_month = unpacker.GetDouble("return_ratio_in_single_month");
            rptL_3_202_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_3_202_InfoList.Add((rptL_3_202_Info)info);
        }
        #endregion

        //逻辑_报表_报表查询_查询平台产品月收益率
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_3_202_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.share_net_total = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SHARE_NET_TOTAL_FLOAT);
                    info.pre_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_NAV_FLOAT);
                    info.busin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSIN_DATE_INT);
                    info.return_ratio_in_single_month = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RETURN_RATIO_IN_SINGLE_MONTH_FLOAT);
                    rptL_3_202_InfoList.Add(info);
                }
            }
        }
    }

}
