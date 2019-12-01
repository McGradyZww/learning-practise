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

    public static class RiskSecuIF
    {
        //逻辑_风控证券_接口_查询风控服务器资产账户资产
        public static List<FuncrksecuL_5_21Model> GetFuncrksecuL_5_21Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrksecuL_5_21Models = new List<FuncrksecuL_5_21Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrksecuL_5_21Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
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
                reqCommand.hk_thrgh_stock_asset = packer.GetDoublebyName("hk_thrgh_stock_asset", i);
                reqCommand.futu_long_market_value = packer.GetDoublebyName("futu_long_market_value", i);
                reqCommand.futu_short_market_value = packer.GetDoublebyName("futu_short_market_value", i);
 
                FuncrksecuL_5_21Models.Add(reqCommand);
            }
            return FuncrksecuL_5_21Models;
        }
 
        //逻辑_风控证券_接口_查询风控服务器资产账户资产
        public static List<FuncrksecuL_5_21Model> GetFuncrksecuL_5_21Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrksecuL_5_21Models = new List<FuncrksecuL_5_21Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrksecuL_5_21Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
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
                    reqCommand.hk_thrgh_stock_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HK_THRGH_STOCK_ASSET_FLOAT);
                    reqCommand.futu_long_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_LONG_MARKET_VALUE_FLOAT);
                    reqCommand.futu_short_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_SHORT_MARKET_VALUE_FLOAT);
                    FuncrksecuL_5_21Models.Add(reqCommand);
                }
            }
            return FuncrksecuL_5_21Models;
        }
 
        //逻辑_风控证券_接口_单条检查客户风险
        public static List<FuncrksecuL_5_22Model> GetFuncrksecuL_5_22Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrksecuL_5_22Models = new List<FuncrksecuL_5_22Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrksecuL_5_22Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.compli_trig_id = packer.GetInt64byName("compli_trig_id", i);
 
                FuncrksecuL_5_22Models.Add(reqCommand);
            }
            return FuncrksecuL_5_22Models;
        }
 
        //逻辑_风控证券_接口_单条检查客户风险
        public static List<FuncrksecuL_5_22Model> GetFuncrksecuL_5_22Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrksecuL_5_22Models = new List<FuncrksecuL_5_22Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncrksecuL_5_22Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.compli_trig_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_TRIG_ID_INT64);
                FuncrksecuL_5_22Models.Add(reqCommand);
            }
            return FuncrksecuL_5_22Models;
        }
 
    }
}
