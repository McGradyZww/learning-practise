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

    public static class EvaTotal
    {
        //逻辑_平台估值_估值汇总_查询估值产品资产信息
        public static List<FuncevaL_3_3Model> GetFuncevaL_3_3Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncevaL_3_3Models = new List<FuncevaL_3_3Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncevaL_3_3Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.pd_curr_share = packer.GetDoublebyName("pd_curr_share", i);
                reqCommand.eva_pd_curr_share = packer.GetStrbyName("eva_pd_curr_share", i);
                reqCommand.total_asset = packer.GetDoublebyName("total_asset", i);
                reqCommand.nav_asset = packer.GetDoublebyName("nav_asset", i);
                reqCommand.eva_nav_asset = packer.GetStrbyName("eva_nav_asset", i);
                reqCommand.cash_bala = packer.GetDoublebyName("cash_bala", i);
                reqCommand.acco_cash = packer.GetDoublebyName("acco_cash", i);
                reqCommand.pre_acco_cash = packer.GetDoublebyName("pre_acco_cash", i);
                reqCommand.stock_market_value = packer.GetDoublebyName("stock_market_value", i);
                reqCommand.fund_asset = packer.GetDoublebyName("fund_asset", i);
                reqCommand.bond_asset = packer.GetDoublebyName("bond_asset", i);
                reqCommand.futu_asset = packer.GetDoublebyName("futu_asset", i);
                reqCommand.option_asset = packer.GetDoublebyName("option_asset", i);
                reqCommand.other_asset = packer.GetDoublebyName("other_asset", i);
                reqCommand.accumulative_receivable = packer.GetDoublebyName("accumulative_receivable", i);
                reqCommand.accumulative_payable = packer.GetDoublebyName("accumulative_payable", i);
                reqCommand.apply_amt = packer.GetDoublebyName("apply_amt", i);
                reqCommand.redemp_amt = packer.GetDoublebyName("redemp_amt", i);
                reqCommand.unit_nav = packer.GetDoublebyName("unit_nav", i);
                reqCommand.eva_unit_nav = packer.GetStrbyName("eva_unit_nav", i);
                reqCommand.total_cash_divide = packer.GetDoublebyName("total_cash_divide", i);
                reqCommand.total_unit_nav = packer.GetDoublebyName("total_unit_nav", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
                reqCommand.daily_pandl_ratio = packer.GetDoublebyName("daily_pandl_ratio", i);
                reqCommand.update_date = packer.GetIntbyName("update_date", i);
                reqCommand.update_time = packer.GetIntbyName("update_time", i);
 
                FuncevaL_3_3Models.Add(reqCommand);
            }
            return FuncevaL_3_3Models;
        }
 
        //逻辑_平台估值_估值汇总_查询估值产品资产信息
        public static List<FuncevaL_3_3Model> GetFuncevaL_3_3Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncevaL_3_3Models = new List<FuncevaL_3_3Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncevaL_3_3Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.pd_curr_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_CURR_SHARE_FLOAT);
                    reqCommand.eva_pd_curr_share = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EVA_PD_CURR_SHARE_STR);
                    reqCommand.total_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_ASSET_FLOAT);
                    reqCommand.nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT);
                    reqCommand.eva_nav_asset = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EVA_NAV_ASSET_STR);
                    reqCommand.cash_bala = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_BALA_FLOAT);
                    reqCommand.acco_cash = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_CASH_FLOAT);
                    reqCommand.pre_acco_cash = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ACCO_CASH_FLOAT);
                    reqCommand.stock_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_MARKET_VALUE_FLOAT);
                    reqCommand.fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_ASSET_FLOAT);
                    reqCommand.bond_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ASSET_FLOAT);
                    reqCommand.futu_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ASSET_FLOAT);
                    reqCommand.option_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPTION_ASSET_FLOAT);
                    reqCommand.other_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_ASSET_FLOAT);
                    reqCommand.accumulative_receivable = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCUMULATIVE_RECEIVABLE_FLOAT);
                    reqCommand.accumulative_payable = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCUMULATIVE_PAYABLE_FLOAT);
                    reqCommand.apply_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_APPLY_AMT_FLOAT);
                    reqCommand.redemp_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REDEMP_AMT_FLOAT);
                    reqCommand.unit_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_NAV_FLOAT);
                    reqCommand.eva_unit_nav = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EVA_UNIT_NAV_STR);
                    reqCommand.total_cash_divide = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_CASH_DIVIDE_FLOAT);
                    reqCommand.total_unit_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_UNIT_NAV_FLOAT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    reqCommand.daily_pandl_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DAILY_PANDL_RATIO_FLOAT);
                    reqCommand.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    reqCommand.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    FuncevaL_3_3Models.Add(reqCommand);
                }
            }
            return FuncevaL_3_3Models;
        }
 
        //逻辑_平台估值_估值汇总_查询估值产品应收应付汇总
        public static List<FuncevaL_3_4Model> GetFuncevaL_3_4Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncevaL_3_4Models = new List<FuncevaL_3_4Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncevaL_3_4Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.pd_manage_fee = packer.GetDoublebyName("pd_manage_fee", i);
                reqCommand.pd_trustee_fee = packer.GetDoublebyName("pd_trustee_fee", i);
                reqCommand.pd_service_fee = packer.GetDoublebyName("pd_service_fee", i);
                reqCommand.pd_cons_fee = packer.GetDoublebyName("pd_cons_fee", i);
                reqCommand.pd_other_fee = packer.GetDoublebyName("pd_other_fee", i);
                reqCommand.intrst_cacl_amt = packer.GetDoublebyName("intrst_cacl_amt", i);
                reqCommand.intrst_base_amt = packer.GetDoublebyName("intrst_base_amt", i);
 
                FuncevaL_3_4Models.Add(reqCommand);
            }
            return FuncevaL_3_4Models;
        }
 
        //逻辑_平台估值_估值汇总_查询估值产品应收应付汇总
        public static List<FuncevaL_3_4Model> GetFuncevaL_3_4Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncevaL_3_4Models = new List<FuncevaL_3_4Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncevaL_3_4Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.pd_manage_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_MANAGE_FEE_FLOAT);
                    reqCommand.pd_trustee_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_TRUSTEE_FEE_FLOAT);
                    reqCommand.pd_service_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_SERVICE_FEE_FLOAT);
                    reqCommand.pd_cons_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_CONS_FEE_FLOAT);
                    reqCommand.pd_other_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_OTHER_FEE_FLOAT);
                    reqCommand.intrst_cacl_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_CACL_AMT_FLOAT);
                    reqCommand.intrst_base_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_BASE_AMT_FLOAT);
                    FuncevaL_3_4Models.Add(reqCommand);
                }
            }
            return FuncevaL_3_4Models;
        }
 
        //逻辑_平台估值_估值汇总_查询估值产品费用
        public static List<FuncevaL_3_8Model> GetFuncevaL_3_8Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncevaL_3_8Models = new List<FuncevaL_3_8Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncevaL_3_8Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.pd_fee_type = packer.GetIntbyName("pd_fee_type", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.begin_amt = packer.GetDoublebyName("begin_amt", i);
                reqCommand.curr_amt = packer.GetDoublebyName("curr_amt", i);
                reqCommand.pd_net_asset = packer.GetDoublebyName("pd_net_asset", i);
                reqCommand.confirm_apply = packer.GetDoublebyName("confirm_apply", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
                reqCommand.manual_flag = packer.GetIntbyName("manual_flag", i);
 
                FuncevaL_3_8Models.Add(reqCommand);
            }
            return FuncevaL_3_8Models;
        }
 
        //逻辑_平台估值_估值汇总_查询估值产品费用
        public static List<FuncevaL_3_8Model> GetFuncevaL_3_8Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncevaL_3_8Models = new List<FuncevaL_3_8Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncevaL_3_8Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.pd_fee_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_FEE_TYPE_INT);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.begin_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_AMT_FLOAT);
                    reqCommand.curr_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_AMT_FLOAT);
                    reqCommand.pd_net_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_NET_ASSET_FLOAT);
                    reqCommand.confirm_apply = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CONFIRM_APPLY_FLOAT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    reqCommand.manual_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MANUAL_FLAG_INT);
                    FuncevaL_3_8Models.Add(reqCommand);
                }
            }
            return FuncevaL_3_8Models;
        }
 
        //逻辑_平台估值_估值汇总_查询估值产品利息
        public static List<FuncevaL_3_12Model> GetFuncevaL_3_12Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncevaL_3_12Models = new List<FuncevaL_3_12Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncevaL_3_12Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.pd_rate_type = packer.GetIntbyName("pd_rate_type", i);
                reqCommand.asset_acco = packer.GetStrbyName("asset_acco", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.begin_amt = packer.GetDoublebyName("begin_amt", i);
                reqCommand.curr_amt = packer.GetDoublebyName("curr_amt", i);
                reqCommand.intrst_base_amt = packer.GetDoublebyName("intrst_base_amt", i);
                reqCommand.confirm_apply = packer.GetDoublebyName("confirm_apply", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
                reqCommand.manual_flag = packer.GetIntbyName("manual_flag", i);
 
                FuncevaL_3_12Models.Add(reqCommand);
            }
            return FuncevaL_3_12Models;
        }
 
        //逻辑_平台估值_估值汇总_查询估值产品利息
        public static List<FuncevaL_3_12Model> GetFuncevaL_3_12Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncevaL_3_12Models = new List<FuncevaL_3_12Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncevaL_3_12Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.pd_rate_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_RATE_TYPE_INT);
                    reqCommand.asset_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STR);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.begin_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_AMT_FLOAT);
                    reqCommand.curr_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_AMT_FLOAT);
                    reqCommand.intrst_base_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_BASE_AMT_FLOAT);
                    reqCommand.confirm_apply = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CONFIRM_APPLY_FLOAT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    reqCommand.manual_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MANUAL_FLAG_INT);
                    FuncevaL_3_12Models.Add(reqCommand);
                }
            }
            return FuncevaL_3_12Models;
        }
 
        //逻辑_平台估值_估值汇总_查询估值产品费用流水
        public static List<FuncevaL_3_20Model> GetFuncevaL_3_20Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncevaL_3_20Models = new List<FuncevaL_3_20Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncevaL_3_20Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.pd_fee_type = packer.GetIntbyName("pd_fee_type", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.occur_amt = packer.GetDoublebyName("occur_amt", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncevaL_3_20Models.Add(reqCommand);
            }
            return FuncevaL_3_20Models;
        }
 
        //逻辑_平台估值_估值汇总_查询估值产品费用流水
        public static List<FuncevaL_3_20Model> GetFuncevaL_3_20Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncevaL_3_20Models = new List<FuncevaL_3_20Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncevaL_3_20Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.pd_fee_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_FEE_TYPE_INT);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.occur_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_AMT_FLOAT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncevaL_3_20Models.Add(reqCommand);
                }
            }
            return FuncevaL_3_20Models;
        }
 
        //逻辑_平台估值_估值汇总_查询估值产品利息流水
        public static List<FuncevaL_3_24Model> GetFuncevaL_3_24Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncevaL_3_24Models = new List<FuncevaL_3_24Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncevaL_3_24Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.pd_rate_type = packer.GetIntbyName("pd_rate_type", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.occur_amt = packer.GetDoublebyName("occur_amt", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncevaL_3_24Models.Add(reqCommand);
            }
            return FuncevaL_3_24Models;
        }
 
        //逻辑_平台估值_估值汇总_查询估值产品利息流水
        public static List<FuncevaL_3_24Model> GetFuncevaL_3_24Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncevaL_3_24Models = new List<FuncevaL_3_24Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncevaL_3_24Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.pd_rate_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_RATE_TYPE_INT);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.occur_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_AMT_FLOAT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncevaL_3_24Models.Add(reqCommand);
                }
            }
            return FuncevaL_3_24Models;
        }
 
        //逻辑_平台估值_估值汇总_查询外部估值科目数据
        public static List<FuncevaL_3_26Model> GetFuncevaL_3_26Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncevaL_3_26Models = new List<FuncevaL_3_26Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncevaL_3_26Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.fina_acco_code = packer.GetStrbyName("fina_acco_code", i);
                reqCommand.fina_acco_name = packer.GetStrbyName("fina_acco_name", i);
                reqCommand.amount = packer.GetStrbyName("amount", i);
                reqCommand.unit_cost = packer.GetStrbyName("unit_cost", i);
                reqCommand.prime_cost = packer.GetStrbyName("prime_cost", i);
                reqCommand.cost_net_ratio = packer.GetStrbyName("cost_net_ratio", i);
                reqCommand.market_price = packer.GetStrbyName("market_price", i);
                reqCommand.market_value = packer.GetStrbyName("market_value", i);
                reqCommand.market_net_ratio = packer.GetStrbyName("market_net_ratio", i);
                reqCommand.evalu_add_value = packer.GetDoublebyName("evalu_add_value", i);
                reqCommand.evalu_add_str = packer.GetStrbyName("evalu_add_str", i);
                reqCommand.stop_info = packer.GetStrbyName("stop_info", i);
                reqCommand.rights_info = packer.GetStrbyName("rights_info", i);
 
                FuncevaL_3_26Models.Add(reqCommand);
            }
            return FuncevaL_3_26Models;
        }
 
        //逻辑_平台估值_估值汇总_查询外部估值科目数据
        public static List<FuncevaL_3_26Model> GetFuncevaL_3_26Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncevaL_3_26Models = new List<FuncevaL_3_26Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncevaL_3_26Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.fina_acco_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FINA_ACCO_CODE_STR);
                    reqCommand.fina_acco_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FINA_ACCO_NAME_STR);
                    reqCommand.amount = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_AMOUNT_STR);
                    reqCommand.unit_cost = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_COST_STR);
                    reqCommand.prime_cost = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PRIME_COST_STR);
                    reqCommand.cost_net_ratio = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COST_NET_RATIO_STR);
                    reqCommand.market_price = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_PRICE_STR);
                    reqCommand.market_value = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_VALUE_STR);
                    reqCommand.market_net_ratio = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_NET_RATIO_STR);
                    reqCommand.evalu_add_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_EVALU_ADD_VALUE_FLOAT);
                    reqCommand.evalu_add_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EVALU_ADD_STR_STR);
                    reqCommand.stop_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOP_INFO_STR);
                    reqCommand.rights_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RIGHTS_INFO_STR);
                    FuncevaL_3_26Models.Add(reqCommand);
                }
            }
            return FuncevaL_3_26Models;
        }
 
        //逻辑_平台估值_估值汇总_查询外部估值数据核对结果
        public static List<FuncevaL_3_27Model> GetFuncevaL_3_27Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncevaL_3_27Models = new List<FuncevaL_3_27Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncevaL_3_27Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.pd_curr_share = packer.GetDoublebyName("pd_curr_share", i);
                reqCommand.pd_curr_share_std = packer.GetDoublebyName("pd_curr_share_std", i);
                reqCommand.total_asset = packer.GetDoublebyName("total_asset", i);
                reqCommand.total_asset_std = packer.GetDoublebyName("total_asset_std", i);
                reqCommand.nav_asset = packer.GetDoublebyName("nav_asset", i);
                reqCommand.nav_asset_std = packer.GetDoublebyName("nav_asset_std", i);
                reqCommand.cash_bala = packer.GetDoublebyName("cash_bala", i);
                reqCommand.cash_bala_std = packer.GetDoublebyName("cash_bala_std", i);
                reqCommand.acco_cash = packer.GetDoublebyName("acco_cash", i);
                reqCommand.acco_cash_std = packer.GetDoublebyName("acco_cash_std", i);
                reqCommand.stock_market_value = packer.GetDoublebyName("stock_market_value", i);
                reqCommand.stock_market_value_std = packer.GetDoublebyName("stock_market_value_std", i);
                reqCommand.fund_asset = packer.GetDoublebyName("fund_asset", i);
                reqCommand.fund_asset_std = packer.GetDoublebyName("fund_asset_std", i);
                reqCommand.bond_asset = packer.GetDoublebyName("bond_asset", i);
                reqCommand.bond_asset_std = packer.GetDoublebyName("bond_asset_std", i);
                reqCommand.futu_asset = packer.GetDoublebyName("futu_asset", i);
                reqCommand.futu_asset_std = packer.GetDoublebyName("futu_asset_std", i);
                reqCommand.option_asset = packer.GetDoublebyName("option_asset", i);
                reqCommand.option_asset_std = packer.GetDoublebyName("option_asset_std", i);
                reqCommand.other_asset = packer.GetDoublebyName("other_asset", i);
                reqCommand.other_asset_std = packer.GetDoublebyName("other_asset_std", i);
                reqCommand.accumulative_receivable = packer.GetDoublebyName("accumulative_receivable", i);
                reqCommand.accumulative_receivable_std = packer.GetDoublebyName("accumulative_receivable_std", i);
                reqCommand.accumulative_payable = packer.GetDoublebyName("accumulative_payable", i);
                reqCommand.accumulative_payable_std = packer.GetDoublebyName("accumulative_payable_std", i);
                reqCommand.unit_nav = packer.GetDoublebyName("unit_nav", i);
                reqCommand.unit_nav_std = packer.GetDoublebyName("unit_nav_std", i);
 
                FuncevaL_3_27Models.Add(reqCommand);
            }
            return FuncevaL_3_27Models;
        }
 
        //逻辑_平台估值_估值汇总_查询外部估值数据核对结果
        public static List<FuncevaL_3_27Model> GetFuncevaL_3_27Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncevaL_3_27Models = new List<FuncevaL_3_27Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncevaL_3_27Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.pd_curr_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_CURR_SHARE_FLOAT);
                    reqCommand.pd_curr_share_std = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_CURR_SHARE_STD_FLOAT);
                    reqCommand.total_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_ASSET_FLOAT);
                    reqCommand.total_asset_std = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_ASSET_STD_FLOAT);
                    reqCommand.nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT);
                    reqCommand.nav_asset_std = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_STD_FLOAT);
                    reqCommand.cash_bala = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_BALA_FLOAT);
                    reqCommand.cash_bala_std = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_BALA_STD_FLOAT);
                    reqCommand.acco_cash = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_CASH_FLOAT);
                    reqCommand.acco_cash_std = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_CASH_STD_FLOAT);
                    reqCommand.stock_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_MARKET_VALUE_FLOAT);
                    reqCommand.stock_market_value_std = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_MARKET_VALUE_STD_FLOAT);
                    reqCommand.fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_ASSET_FLOAT);
                    reqCommand.fund_asset_std = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_ASSET_STD_FLOAT);
                    reqCommand.bond_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ASSET_FLOAT);
                    reqCommand.bond_asset_std = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ASSET_STD_FLOAT);
                    reqCommand.futu_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ASSET_FLOAT);
                    reqCommand.futu_asset_std = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ASSET_STD_FLOAT);
                    reqCommand.option_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPTION_ASSET_FLOAT);
                    reqCommand.option_asset_std = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPTION_ASSET_STD_FLOAT);
                    reqCommand.other_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_ASSET_FLOAT);
                    reqCommand.other_asset_std = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_ASSET_STD_FLOAT);
                    reqCommand.accumulative_receivable = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCUMULATIVE_RECEIVABLE_FLOAT);
                    reqCommand.accumulative_receivable_std = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCUMULATIVE_RECEIVABLE_STD_FLOAT);
                    reqCommand.accumulative_payable = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCUMULATIVE_PAYABLE_FLOAT);
                    reqCommand.accumulative_payable_std = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCUMULATIVE_PAYABLE_STD_FLOAT);
                    reqCommand.unit_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_NAV_FLOAT);
                    reqCommand.unit_nav_std = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_NAV_STD_FLOAT);
                    FuncevaL_3_27Models.Add(reqCommand);
                }
            }
            return FuncevaL_3_27Models;
        }
 
        //逻辑_平台估值_估值汇总_查询外部估值费用核对结果
        public static List<FuncevaL_3_28Model> GetFuncevaL_3_28Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncevaL_3_28Models = new List<FuncevaL_3_28Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncevaL_3_28Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.pd_fee_type = packer.GetIntbyName("pd_fee_type", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.curr_amt = packer.GetDoublebyName("curr_amt", i);
                reqCommand.market_value = packer.GetStrbyName("market_value", i);
 
                FuncevaL_3_28Models.Add(reqCommand);
            }
            return FuncevaL_3_28Models;
        }
 
        //逻辑_平台估值_估值汇总_查询外部估值费用核对结果
        public static List<FuncevaL_3_28Model> GetFuncevaL_3_28Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncevaL_3_28Models = new List<FuncevaL_3_28Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncevaL_3_28Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.pd_fee_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_FEE_TYPE_INT);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.curr_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_AMT_FLOAT);
                    reqCommand.market_value = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_VALUE_STR);
                    FuncevaL_3_28Models.Add(reqCommand);
                }
            }
            return FuncevaL_3_28Models;
        }
 
        //逻辑_平台估值_估值汇总_查询外部估值利息核对结果
        public static List<FuncevaL_3_29Model> GetFuncevaL_3_29Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncevaL_3_29Models = new List<FuncevaL_3_29Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncevaL_3_29Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.asset_acco = packer.GetStrbyName("asset_acco", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.curr_amt = packer.GetDoublebyName("curr_amt", i);
                reqCommand.market_value = packer.GetStrbyName("market_value", i);
 
                FuncevaL_3_29Models.Add(reqCommand);
            }
            return FuncevaL_3_29Models;
        }
 
        //逻辑_平台估值_估值汇总_查询外部估值利息核对结果
        public static List<FuncevaL_3_29Model> GetFuncevaL_3_29Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncevaL_3_29Models = new List<FuncevaL_3_29Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncevaL_3_29Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.asset_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STR);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.curr_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_AMT_FLOAT);
                    reqCommand.market_value = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_VALUE_STR);
                    FuncevaL_3_29Models.Add(reqCommand);
                }
            }
            return FuncevaL_3_29Models;
        }
 
        //逻辑_平台估值_估值汇总_查询估值产品增值税明细
        public static List<FuncevaL_3_30Model> GetFuncevaL_3_30Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncevaL_3_30Models = new List<FuncevaL_3_30Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncevaL_3_30Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.vat_loan = packer.GetDoublebyName("vat_loan", i);
                reqCommand.calc_pay = packer.GetDoublebyName("calc_pay", i);
                reqCommand.vat_pay_offset = packer.GetDoublebyName("vat_pay_offset", i);
                reqCommand.vat_transfer = packer.GetDoublebyName("vat_transfer", i);
                reqCommand.vat_pay_add = packer.GetDoublebyName("vat_pay_add", i);
                reqCommand.calc_estimate = packer.GetDoublebyName("calc_estimate", i);
                reqCommand.vat_estimate_offset = packer.GetDoublebyName("vat_estimate_offset", i);
                reqCommand.vat_estimate = packer.GetDoublebyName("vat_estimate", i);
                reqCommand.vat_estimate_add = packer.GetDoublebyName("vat_estimate_add", i);
 
                FuncevaL_3_30Models.Add(reqCommand);
            }
            return FuncevaL_3_30Models;
        }
 
        //逻辑_平台估值_估值汇总_查询估值产品增值税明细
        public static List<FuncevaL_3_30Model> GetFuncevaL_3_30Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncevaL_3_30Models = new List<FuncevaL_3_30Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncevaL_3_30Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.vat_loan = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VAT_LOAN_FLOAT);
                    reqCommand.calc_pay = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CALC_PAY_FLOAT);
                    reqCommand.vat_pay_offset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VAT_PAY_OFFSET_FLOAT);
                    reqCommand.vat_transfer = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VAT_TRANSFER_FLOAT);
                    reqCommand.vat_pay_add = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VAT_PAY_ADD_FLOAT);
                    reqCommand.calc_estimate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CALC_ESTIMATE_FLOAT);
                    reqCommand.vat_estimate_offset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VAT_ESTIMATE_OFFSET_FLOAT);
                    reqCommand.vat_estimate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VAT_ESTIMATE_FLOAT);
                    reqCommand.vat_estimate_add = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VAT_ESTIMATE_ADD_FLOAT);
                    FuncevaL_3_30Models.Add(reqCommand);
                }
            }
            return FuncevaL_3_30Models;
        }
 
        //逻辑_平台估值_估值汇总_查询产品估值核对数据
        public static List<FuncevaL_3_31Model> GetFuncevaL_3_31Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncevaL_3_31Models = new List<FuncevaL_3_31Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncevaL_3_31Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.eva_check_type = packer.GetIntbyName("eva_check_type", i);
                reqCommand.fina_acco_code = packer.GetStrbyName("fina_acco_code", i);
                reqCommand.fina_acco_name = packer.GetStrbyName("fina_acco_name", i);
                reqCommand.market_value = packer.GetStrbyName("market_value", i);
                reqCommand.curr_amt = packer.GetDoublebyName("curr_amt", i);
 
                FuncevaL_3_31Models.Add(reqCommand);
            }
            return FuncevaL_3_31Models;
        }
 
        //逻辑_平台估值_估值汇总_查询产品估值核对数据
        public static List<FuncevaL_3_31Model> GetFuncevaL_3_31Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncevaL_3_31Models = new List<FuncevaL_3_31Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncevaL_3_31Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.eva_check_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EVA_CHECK_TYPE_INT);
                    reqCommand.fina_acco_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FINA_ACCO_CODE_STR);
                    reqCommand.fina_acco_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FINA_ACCO_NAME_STR);
                    reqCommand.market_value = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_VALUE_STR);
                    reqCommand.curr_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_AMT_FLOAT);
                    FuncevaL_3_31Models.Add(reqCommand);
                }
            }
            return FuncevaL_3_31Models;
        }
 
        //逻辑_平台估值_估值汇总_查询估值产品累计净值
        public static List<FuncevaL_3_36Model> GetFuncevaL_3_36Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncevaL_3_36Models = new List<FuncevaL_3_36Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncevaL_3_36Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.nav_asset = packer.GetDoublebyName("nav_asset", i);
                reqCommand.pd_curr_share = packer.GetDoublebyName("pd_curr_share", i);
                reqCommand.unit_nav = packer.GetDoublebyName("unit_nav", i);
                reqCommand.cash_coeffi = packer.GetDoublebyName("cash_coeffi", i);
                reqCommand.share_coeffi = packer.GetDoublebyName("share_coeffi", i);
                reqCommand.total_unit_nav = packer.GetDoublebyName("total_unit_nav", i);
                reqCommand.net_prefee_coeffi = packer.GetDoublebyName("net_prefee_coeffi", i);
                reqCommand.pre_fee_share_net_total = packer.GetDoublebyName("pre_fee_share_net_total", i);
 
                FuncevaL_3_36Models.Add(reqCommand);
            }
            return FuncevaL_3_36Models;
        }
 
        //逻辑_平台估值_估值汇总_查询估值产品累计净值
        public static List<FuncevaL_3_36Model> GetFuncevaL_3_36Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncevaL_3_36Models = new List<FuncevaL_3_36Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncevaL_3_36Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT);
                    reqCommand.pd_curr_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_CURR_SHARE_FLOAT);
                    reqCommand.unit_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_NAV_FLOAT);
                    reqCommand.cash_coeffi = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_COEFFI_FLOAT);
                    reqCommand.share_coeffi = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SHARE_COEFFI_FLOAT);
                    reqCommand.total_unit_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_UNIT_NAV_FLOAT);
                    reqCommand.net_prefee_coeffi = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NET_PREFEE_COEFFI_FLOAT);
                    reqCommand.pre_fee_share_net_total = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_FEE_SHARE_NET_TOTAL_FLOAT);
                    FuncevaL_3_36Models.Add(reqCommand);
                }
            }
            return FuncevaL_3_36Models;
        }
 
        //逻辑_平台估值_估值汇总_查询估值产品增值税成交汇总
        public static List<FuncevaL_3_43Model> GetFuncevaL_3_43Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncevaL_3_43Models = new List<FuncevaL_3_43Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncevaL_3_43Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.strike_qty = packer.GetDoublebyName("strike_qty", i);
                reqCommand.strike_amt = packer.GetDoublebyName("strike_amt", i);
                reqCommand.all_fee = packer.GetDoublebyName("all_fee", i);
                reqCommand.cost_price = packer.GetDoublebyName("cost_price", i);
                reqCommand.offset_qty = packer.GetDoublebyName("offset_qty", i);
                reqCommand.realize_pandl = packer.GetDoublebyName("realize_pandl", i);
                reqCommand.begin_qty = packer.GetDoublebyName("begin_qty", i);
                reqCommand.deal_flag = packer.GetIntbyName("deal_flag", i);
 
                FuncevaL_3_43Models.Add(reqCommand);
            }
            return FuncevaL_3_43Models;
        }
 
        //逻辑_平台估值_估值汇总_查询估值产品增值税成交汇总
        public static List<FuncevaL_3_43Model> GetFuncevaL_3_43Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncevaL_3_43Models = new List<FuncevaL_3_43Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncevaL_3_43Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    reqCommand.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    reqCommand.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                    reqCommand.cost_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_PRICE_FLOAT);
                    reqCommand.offset_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OFFSET_QTY_FLOAT);
                    reqCommand.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    reqCommand.begin_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_QTY_FLOAT);
                    reqCommand.deal_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_FLAG_INT);
                    FuncevaL_3_43Models.Add(reqCommand);
                }
            }
            return FuncevaL_3_43Models;
        }
 
        //逻辑_平台估值_估值汇总_查询估值产品增值税成交明细
        public static List<FuncevaL_3_44Model> GetFuncevaL_3_44Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncevaL_3_44Models = new List<FuncevaL_3_44Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncevaL_3_44Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.strike_no = packer.GetStrbyName("strike_no", i);
                reqCommand.strike_time = packer.GetIntbyName("strike_time", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.strike_price = packer.GetDoublebyName("strike_price", i);
                reqCommand.strike_qty = packer.GetDoublebyName("strike_qty", i);
                reqCommand.strike_amt = packer.GetDoublebyName("strike_amt", i);
                reqCommand.all_fee = packer.GetDoublebyName("all_fee", i);
                reqCommand.cost_price = packer.GetDoublebyName("cost_price", i);
                reqCommand.offset_qty = packer.GetDoublebyName("offset_qty", i);
                reqCommand.deal_flag = packer.GetIntbyName("deal_flag", i);
 
                FuncevaL_3_44Models.Add(reqCommand);
            }
            return FuncevaL_3_44Models;
        }
 
        //逻辑_平台估值_估值汇总_查询估值产品增值税成交明细
        public static List<FuncevaL_3_44Model> GetFuncevaL_3_44Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncevaL_3_44Models = new List<FuncevaL_3_44Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncevaL_3_44Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                    reqCommand.strike_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_TIME_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_PRICE_FLOAT);
                    reqCommand.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    reqCommand.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    reqCommand.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                    reqCommand.cost_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_PRICE_FLOAT);
                    reqCommand.offset_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OFFSET_QTY_FLOAT);
                    reqCommand.deal_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_FLAG_INT);
                    FuncevaL_3_44Models.Add(reqCommand);
                }
            }
            return FuncevaL_3_44Models;
        }
 
        //逻辑_平台估值_估值汇总_查询产品估值表单位净值
        public static List<FuncevaL_3_46Model> GetFuncevaL_3_46Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncevaL_3_46Models = new List<FuncevaL_3_46Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncevaL_3_46Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.fina_acco_code = packer.GetStrbyName("fina_acco_code", i);
                reqCommand.fina_acco_name = packer.GetStrbyName("fina_acco_name", i);
                reqCommand.amount = packer.GetStrbyName("amount", i);
                reqCommand.unit_cost = packer.GetStrbyName("unit_cost", i);
                reqCommand.prime_cost = packer.GetStrbyName("prime_cost", i);
                reqCommand.cost_net_ratio = packer.GetStrbyName("cost_net_ratio", i);
                reqCommand.market_price = packer.GetStrbyName("market_price", i);
                reqCommand.market_value = packer.GetStrbyName("market_value", i);
                reqCommand.market_net_ratio = packer.GetStrbyName("market_net_ratio", i);
                reqCommand.evalu_add_value = packer.GetDoublebyName("evalu_add_value", i);
                reqCommand.stop_info = packer.GetStrbyName("stop_info", i);
                reqCommand.rights_info = packer.GetStrbyName("rights_info", i);
 
                FuncevaL_3_46Models.Add(reqCommand);
            }
            return FuncevaL_3_46Models;
        }
 
        //逻辑_平台估值_估值汇总_查询产品估值表单位净值
        public static List<FuncevaL_3_46Model> GetFuncevaL_3_46Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncevaL_3_46Models = new List<FuncevaL_3_46Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncevaL_3_46Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.fina_acco_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FINA_ACCO_CODE_STR);
                    reqCommand.fina_acco_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FINA_ACCO_NAME_STR);
                    reqCommand.amount = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_AMOUNT_STR);
                    reqCommand.unit_cost = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_COST_STR);
                    reqCommand.prime_cost = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PRIME_COST_STR);
                    reqCommand.cost_net_ratio = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COST_NET_RATIO_STR);
                    reqCommand.market_price = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_PRICE_STR);
                    reqCommand.market_value = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_VALUE_STR);
                    reqCommand.market_net_ratio = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_NET_RATIO_STR);
                    reqCommand.evalu_add_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_EVALU_ADD_VALUE_FLOAT);
                    reqCommand.stop_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOP_INFO_STR);
                    reqCommand.rights_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RIGHTS_INFO_STR);
                    FuncevaL_3_46Models.Add(reqCommand);
                }
            }
            return FuncevaL_3_46Models;
        }
 
        //逻辑_平台估值_估值汇总_查询估值产品交易组资产信息
        public static List<FuncevaL_3_47Model> GetFuncevaL_3_47Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncevaL_3_47Models = new List<FuncevaL_3_47Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncevaL_3_47Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.pd_curr_share = packer.GetDoublebyName("pd_curr_share", i);
                reqCommand.total_asset = packer.GetDoublebyName("total_asset", i);
                reqCommand.nav_asset = packer.GetDoublebyName("nav_asset", i);
                reqCommand.cash_bala = packer.GetDoublebyName("cash_bala", i);
                reqCommand.acco_cash = packer.GetDoublebyName("acco_cash", i);
                reqCommand.stock_market_value = packer.GetDoublebyName("stock_market_value", i);
                reqCommand.fund_asset = packer.GetDoublebyName("fund_asset", i);
                reqCommand.bond_asset = packer.GetDoublebyName("bond_asset", i);
                reqCommand.futu_asset = packer.GetDoublebyName("futu_asset", i);
                reqCommand.option_asset = packer.GetDoublebyName("option_asset", i);
                reqCommand.other_asset = packer.GetDoublebyName("other_asset", i);
                reqCommand.accumulative_receivable = packer.GetDoublebyName("accumulative_receivable", i);
                reqCommand.accumulative_payable = packer.GetDoublebyName("accumulative_payable", i);
                reqCommand.apply_amt = packer.GetDoublebyName("apply_amt", i);
                reqCommand.redemp_amt = packer.GetDoublebyName("redemp_amt", i);
                reqCommand.unit_nav = packer.GetDoublebyName("unit_nav", i);
                reqCommand.total_cash_divide = packer.GetDoublebyName("total_cash_divide", i);
                reqCommand.total_unit_nav = packer.GetDoublebyName("total_unit_nav", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
                reqCommand.daily_pandl_ratio = packer.GetDoublebyName("daily_pandl_ratio", i);
                reqCommand.update_date = packer.GetIntbyName("update_date", i);
                reqCommand.update_time = packer.GetIntbyName("update_time", i);
 
                FuncevaL_3_47Models.Add(reqCommand);
            }
            return FuncevaL_3_47Models;
        }
 
        //逻辑_平台估值_估值汇总_查询估值产品交易组资产信息
        public static List<FuncevaL_3_47Model> GetFuncevaL_3_47Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncevaL_3_47Models = new List<FuncevaL_3_47Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncevaL_3_47Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.pd_curr_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_CURR_SHARE_FLOAT);
                    reqCommand.total_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_ASSET_FLOAT);
                    reqCommand.nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT);
                    reqCommand.cash_bala = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_BALA_FLOAT);
                    reqCommand.acco_cash = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_CASH_FLOAT);
                    reqCommand.stock_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_MARKET_VALUE_FLOAT);
                    reqCommand.fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_ASSET_FLOAT);
                    reqCommand.bond_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ASSET_FLOAT);
                    reqCommand.futu_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ASSET_FLOAT);
                    reqCommand.option_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPTION_ASSET_FLOAT);
                    reqCommand.other_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_ASSET_FLOAT);
                    reqCommand.accumulative_receivable = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCUMULATIVE_RECEIVABLE_FLOAT);
                    reqCommand.accumulative_payable = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCUMULATIVE_PAYABLE_FLOAT);
                    reqCommand.apply_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_APPLY_AMT_FLOAT);
                    reqCommand.redemp_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REDEMP_AMT_FLOAT);
                    reqCommand.unit_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_NAV_FLOAT);
                    reqCommand.total_cash_divide = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_CASH_DIVIDE_FLOAT);
                    reqCommand.total_unit_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_UNIT_NAV_FLOAT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    reqCommand.daily_pandl_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DAILY_PANDL_RATIO_FLOAT);
                    reqCommand.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    reqCommand.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    FuncevaL_3_47Models.Add(reqCommand);
                }
            }
            return FuncevaL_3_47Models;
        }
 
        //逻辑_平台估值_估值汇总_查询估值产品交易组费用
        public static List<FuncevaL_3_51Model> GetFuncevaL_3_51Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncevaL_3_51Models = new List<FuncevaL_3_51Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncevaL_3_51Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.pd_fee_type = packer.GetIntbyName("pd_fee_type", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.begin_amt = packer.GetDoublebyName("begin_amt", i);
                reqCommand.curr_amt = packer.GetDoublebyName("curr_amt", i);
                reqCommand.pd_net_asset = packer.GetDoublebyName("pd_net_asset", i);
                reqCommand.confirm_apply = packer.GetDoublebyName("confirm_apply", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
                reqCommand.manual_flag = packer.GetIntbyName("manual_flag", i);
 
                FuncevaL_3_51Models.Add(reqCommand);
            }
            return FuncevaL_3_51Models;
        }
 
        //逻辑_平台估值_估值汇总_查询估值产品交易组费用
        public static List<FuncevaL_3_51Model> GetFuncevaL_3_51Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncevaL_3_51Models = new List<FuncevaL_3_51Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncevaL_3_51Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.pd_fee_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_FEE_TYPE_INT);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.begin_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_AMT_FLOAT);
                    reqCommand.curr_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_AMT_FLOAT);
                    reqCommand.pd_net_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_NET_ASSET_FLOAT);
                    reqCommand.confirm_apply = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CONFIRM_APPLY_FLOAT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    reqCommand.manual_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MANUAL_FLAG_INT);
                    FuncevaL_3_51Models.Add(reqCommand);
                }
            }
            return FuncevaL_3_51Models;
        }
 
        //逻辑_平台估值_估值汇总_查询估值产品交易组利息
        public static List<FuncevaL_3_55Model> GetFuncevaL_3_55Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncevaL_3_55Models = new List<FuncevaL_3_55Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncevaL_3_55Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.pd_rate_type = packer.GetIntbyName("pd_rate_type", i);
                reqCommand.asset_acco = packer.GetStrbyName("asset_acco", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.begin_amt = packer.GetDoublebyName("begin_amt", i);
                reqCommand.curr_amt = packer.GetDoublebyName("curr_amt", i);
                reqCommand.intrst_base_amt = packer.GetDoublebyName("intrst_base_amt", i);
                reqCommand.confirm_apply = packer.GetDoublebyName("confirm_apply", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
                reqCommand.manual_flag = packer.GetIntbyName("manual_flag", i);
 
                FuncevaL_3_55Models.Add(reqCommand);
            }
            return FuncevaL_3_55Models;
        }
 
        //逻辑_平台估值_估值汇总_查询估值产品交易组利息
        public static List<FuncevaL_3_55Model> GetFuncevaL_3_55Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncevaL_3_55Models = new List<FuncevaL_3_55Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncevaL_3_55Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.pd_rate_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_RATE_TYPE_INT);
                    reqCommand.asset_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STR);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.begin_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_AMT_FLOAT);
                    reqCommand.curr_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_AMT_FLOAT);
                    reqCommand.intrst_base_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_BASE_AMT_FLOAT);
                    reqCommand.confirm_apply = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CONFIRM_APPLY_FLOAT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    reqCommand.manual_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MANUAL_FLAG_INT);
                    FuncevaL_3_55Models.Add(reqCommand);
                }
            }
            return FuncevaL_3_55Models;
        }
 
    }
}
