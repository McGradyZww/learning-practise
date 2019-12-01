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

    public static class EvaData
    {
        //逻辑_平台估值_业务数据_查询估值产品证券持仓
        public static List<FuncevaL_2_14Model> GetFuncevaL_2_14Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncevaL_2_14Models = new List<FuncevaL_2_14Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncevaL_2_14Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.asset_acco = packer.GetStrbyName("asset_acco", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_acco = packer.GetStrbyName("stock_acco", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_name = packer.GetStrbyName("stock_name", i);
                reqCommand.invest_type = packer.GetIntbyName("invest_type", i);
                reqCommand.begin_qty = packer.GetDoublebyName("begin_qty", i);
                reqCommand.curr_qty = packer.GetDoublebyName("curr_qty", i);
                reqCommand.frozen_qty = packer.GetDoublebyName("frozen_qty", i);
                reqCommand.unfroz_qty = packer.GetDoublebyName("unfroz_qty", i);
                reqCommand.curr_cost_amt = packer.GetDoublebyName("curr_cost_amt", i);
                reqCommand.last_price = packer.GetDoublebyName("last_price", i);
                reqCommand.exch_rate = packer.GetDoublebyName("exch_rate", i);
                reqCommand.realize_pandl = packer.GetDoublebyName("realize_pandl", i);
                reqCommand.intrst_cost_amt = packer.GetDoublebyName("intrst_cost_amt", i);
                reqCommand.intrst_pandl = packer.GetDoublebyName("intrst_pandl", i);
                reqCommand.evalu_data_source = packer.GetIntbyName("evalu_data_source", i);
 
                FuncevaL_2_14Models.Add(reqCommand);
            }
            return FuncevaL_2_14Models;
        }
 
        //逻辑_平台估值_业务数据_查询估值产品证券持仓
        public static List<FuncevaL_2_14Model> GetFuncevaL_2_14Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncevaL_2_14Models = new List<FuncevaL_2_14Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncevaL_2_14Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.asset_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    reqCommand.invest_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INVEST_TYPE_INT);
                    reqCommand.begin_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_QTY_FLOAT);
                    reqCommand.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    reqCommand.frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_QTY_FLOAT);
                    reqCommand.unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_QTY_FLOAT);
                    reqCommand.curr_cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_COST_AMT_FLOAT);
                    reqCommand.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    reqCommand.exch_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_RATE_FLOAT);
                    reqCommand.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    reqCommand.intrst_cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_COST_AMT_FLOAT);
                    reqCommand.intrst_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_PANDL_FLOAT);
                    reqCommand.evalu_data_source = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EVALU_DATA_SOURCE_INT);
                    FuncevaL_2_14Models.Add(reqCommand);
                }
            }
            return FuncevaL_2_14Models;
        }
 
        //逻辑_平台估值_业务数据_查询估值产品交易组证券持仓
        public static List<FuncevaL_2_15Model> GetFuncevaL_2_15Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncevaL_2_15Models = new List<FuncevaL_2_15Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncevaL_2_15Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.asset_acco = packer.GetStrbyName("asset_acco", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_acco = packer.GetStrbyName("stock_acco", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_name = packer.GetStrbyName("stock_name", i);
                reqCommand.invest_type = packer.GetIntbyName("invest_type", i);
                reqCommand.begin_qty = packer.GetDoublebyName("begin_qty", i);
                reqCommand.curr_qty = packer.GetDoublebyName("curr_qty", i);
                reqCommand.frozen_qty = packer.GetDoublebyName("frozen_qty", i);
                reqCommand.unfroz_qty = packer.GetDoublebyName("unfroz_qty", i);
                reqCommand.curr_cost_amt = packer.GetDoublebyName("curr_cost_amt", i);
                reqCommand.last_price = packer.GetDoublebyName("last_price", i);
                reqCommand.exch_rate = packer.GetDoublebyName("exch_rate", i);
                reqCommand.realize_pandl = packer.GetDoublebyName("realize_pandl", i);
                reqCommand.intrst_cost_amt = packer.GetDoublebyName("intrst_cost_amt", i);
                reqCommand.intrst_pandl = packer.GetDoublebyName("intrst_pandl", i);
 
                FuncevaL_2_15Models.Add(reqCommand);
            }
            return FuncevaL_2_15Models;
        }
 
        //逻辑_平台估值_业务数据_查询估值产品交易组证券持仓
        public static List<FuncevaL_2_15Model> GetFuncevaL_2_15Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncevaL_2_15Models = new List<FuncevaL_2_15Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncevaL_2_15Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.asset_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STR);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    reqCommand.invest_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INVEST_TYPE_INT);
                    reqCommand.begin_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_QTY_FLOAT);
                    reqCommand.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    reqCommand.frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_QTY_FLOAT);
                    reqCommand.unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_QTY_FLOAT);
                    reqCommand.curr_cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_COST_AMT_FLOAT);
                    reqCommand.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    reqCommand.exch_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_RATE_FLOAT);
                    reqCommand.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    reqCommand.intrst_cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_COST_AMT_FLOAT);
                    reqCommand.intrst_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_PANDL_FLOAT);
                    FuncevaL_2_15Models.Add(reqCommand);
                }
            }
            return FuncevaL_2_15Models;
        }
 
        //逻辑_平台估值_业务数据_查询估值产品期货持仓
        public static List<FuncevaL_2_16Model> GetFuncevaL_2_16Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncevaL_2_16Models = new List<FuncevaL_2_16Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncevaL_2_16Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.futu_acco_no = packer.GetIntbyName("futu_acco_no", i);
                reqCommand.contrc_code_no = packer.GetIntbyName("contrc_code_no", i);
                reqCommand.contrc_type = packer.GetIntbyName("contrc_type", i);
                reqCommand.lngsht_type = packer.GetIntbyName("lngsht_type", i);
                reqCommand.hedge_type = packer.GetIntbyName("hedge_type", i);
                reqCommand.comb_code = packer.GetStrbyName("comb_code", i);
                reqCommand.contrc_unit = packer.GetIntbyName("contrc_unit", i);
                reqCommand.begin_qty = packer.GetDoublebyName("begin_qty", i);
                reqCommand.curr_qty = packer.GetDoublebyName("curr_qty", i);
                reqCommand.frozen_qty = packer.GetDoublebyName("frozen_qty", i);
                reqCommand.unfroz_qty = packer.GetDoublebyName("unfroz_qty", i);
                reqCommand.pre_settle_price = packer.GetDoublebyName("pre_settle_price", i);
                reqCommand.sett_price = packer.GetDoublebyName("sett_price", i);
                reqCommand.rece_margin = packer.GetDoublebyName("rece_margin", i);
                reqCommand.open_amount = packer.GetDoublebyName("open_amount", i);
                reqCommand.realize_pandl = packer.GetDoublebyName("realize_pandl", i);
                reqCommand.close_pandl = packer.GetDoublebyName("close_pandl", i);
                reqCommand.today_posi_flag = packer.GetIntbyName("today_posi_flag", i);
                reqCommand.evalu_data_source = packer.GetIntbyName("evalu_data_source", i);
 
                FuncevaL_2_16Models.Add(reqCommand);
            }
            return FuncevaL_2_16Models;
        }
 
        //逻辑_平台估值_业务数据_查询估值产品期货持仓
        public static List<FuncevaL_2_16Model> GetFuncevaL_2_16Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncevaL_2_16Models = new List<FuncevaL_2_16Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncevaL_2_16Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.futu_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT);
                    reqCommand.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    reqCommand.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    reqCommand.lngsht_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT);
                    reqCommand.hedge_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT);
                    reqCommand.comb_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMB_CODE_STR);
                    reqCommand.contrc_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_UNIT_INT);
                    reqCommand.begin_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_QTY_FLOAT);
                    reqCommand.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    reqCommand.frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_QTY_FLOAT);
                    reqCommand.unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_QTY_FLOAT);
                    reqCommand.pre_settle_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SETTLE_PRICE_FLOAT);
                    reqCommand.sett_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SETT_PRICE_FLOAT);
                    reqCommand.rece_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RECE_MARGIN_FLOAT);
                    reqCommand.open_amount = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_AMOUNT_FLOAT);
                    reqCommand.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    reqCommand.close_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_PANDL_FLOAT);
                    reqCommand.today_posi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_POSI_FLAG_INT);
                    reqCommand.evalu_data_source = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EVALU_DATA_SOURCE_INT);
                    FuncevaL_2_16Models.Add(reqCommand);
                }
            }
            return FuncevaL_2_16Models;
        }
 
        //逻辑_平台估值_业务数据_查询估值产品账户资金
        public static List<FuncevaL_2_24Model> GetFuncevaL_2_24Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncevaL_2_24Models = new List<FuncevaL_2_24Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncevaL_2_24Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.pd_acco_type = packer.GetIntbyName("pd_acco_type", i);
                reqCommand.asset_acco = packer.GetStrbyName("asset_acco", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.begin_amt = packer.GetDoublebyName("begin_amt", i);
                reqCommand.curr_amt = packer.GetDoublebyName("curr_amt", i);
                reqCommand.frozen_amt = packer.GetDoublebyName("frozen_amt", i);
                reqCommand.unfroz_amt = packer.GetDoublebyName("unfroz_amt", i);
                reqCommand.intrst_base_amt = packer.GetDoublebyName("intrst_base_amt", i);
                reqCommand.intrst_cacl_amt = packer.GetDoublebyName("intrst_cacl_amt", i);
                reqCommand.evalu_data_source = packer.GetIntbyName("evalu_data_source", i);
 
                FuncevaL_2_24Models.Add(reqCommand);
            }
            return FuncevaL_2_24Models;
        }
 
        //逻辑_平台估值_业务数据_查询估值产品账户资金
        public static List<FuncevaL_2_24Model> GetFuncevaL_2_24Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncevaL_2_24Models = new List<FuncevaL_2_24Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncevaL_2_24Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.pd_acco_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_ACCO_TYPE_INT);
                    reqCommand.asset_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STR);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.begin_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_AMT_FLOAT);
                    reqCommand.curr_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_AMT_FLOAT);
                    reqCommand.frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_AMT_FLOAT);
                    reqCommand.unfroz_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_AMT_FLOAT);
                    reqCommand.intrst_base_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_BASE_AMT_FLOAT);
                    reqCommand.intrst_cacl_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_CACL_AMT_FLOAT);
                    reqCommand.evalu_data_source = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EVALU_DATA_SOURCE_INT);
                    FuncevaL_2_24Models.Add(reqCommand);
                }
            }
            return FuncevaL_2_24Models;
        }
 
        //逻辑_平台估值_业务数据_查询估值产品交易组账户资金
        public static List<FuncevaL_2_25Model> GetFuncevaL_2_25Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncevaL_2_25Models = new List<FuncevaL_2_25Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncevaL_2_25Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.pd_acco_type = packer.GetIntbyName("pd_acco_type", i);
                reqCommand.asset_acco = packer.GetStrbyName("asset_acco", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.begin_amt = packer.GetDoublebyName("begin_amt", i);
                reqCommand.curr_amt = packer.GetDoublebyName("curr_amt", i);
                reqCommand.frozen_amt = packer.GetDoublebyName("frozen_amt", i);
                reqCommand.unfroz_amt = packer.GetDoublebyName("unfroz_amt", i);
                reqCommand.intrst_base_amt = packer.GetDoublebyName("intrst_base_amt", i);
                reqCommand.intrst_cacl_amt = packer.GetDoublebyName("intrst_cacl_amt", i);
 
                FuncevaL_2_25Models.Add(reqCommand);
            }
            return FuncevaL_2_25Models;
        }
 
        //逻辑_平台估值_业务数据_查询估值产品交易组账户资金
        public static List<FuncevaL_2_25Model> GetFuncevaL_2_25Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncevaL_2_25Models = new List<FuncevaL_2_25Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncevaL_2_25Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.pd_acco_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_ACCO_TYPE_INT);
                    reqCommand.asset_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STR);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.begin_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_AMT_FLOAT);
                    reqCommand.curr_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_AMT_FLOAT);
                    reqCommand.frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_AMT_FLOAT);
                    reqCommand.unfroz_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_AMT_FLOAT);
                    reqCommand.intrst_base_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_BASE_AMT_FLOAT);
                    reqCommand.intrst_cacl_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_CACL_AMT_FLOAT);
                    FuncevaL_2_25Models.Add(reqCommand);
                }
            }
            return FuncevaL_2_25Models;
        }
 
        //逻辑_平台估值_业务数据_查询估值产品银行流水
        public static List<FuncevaL_2_44Model> GetFuncevaL_2_44Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncevaL_2_44Models = new List<FuncevaL_2_44Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncevaL_2_44Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.asset_acco = packer.GetStrbyName("asset_acco", i);
                reqCommand.occur_dir = packer.GetIntbyName("occur_dir", i);
                reqCommand.occur_amt = packer.GetDoublebyName("occur_amt", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncevaL_2_44Models.Add(reqCommand);
            }
            return FuncevaL_2_44Models;
        }
 
        //逻辑_平台估值_业务数据_查询估值产品银行流水
        public static List<FuncevaL_2_44Model> GetFuncevaL_2_44Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncevaL_2_44Models = new List<FuncevaL_2_44Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncevaL_2_44Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.asset_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STR);
                    reqCommand.occur_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_DIR_INT);
                    reqCommand.occur_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_AMT_FLOAT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncevaL_2_44Models.Add(reqCommand);
                }
            }
            return FuncevaL_2_44Models;
        }
 
        //逻辑_平台估值_业务数据_查询估值产品场外交易
        public static List<FuncevaL_2_54Model> GetFuncevaL_2_54Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncevaL_2_54Models = new List<FuncevaL_2_54Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncevaL_2_54Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.strike_qty = packer.GetDoublebyName("strike_qty", i);
                reqCommand.strike_price = packer.GetDoublebyName("strike_price", i);
                reqCommand.expire_date = packer.GetIntbyName("expire_date", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncevaL_2_54Models.Add(reqCommand);
            }
            return FuncevaL_2_54Models;
        }
 
        //逻辑_平台估值_业务数据_查询估值产品场外交易
        public static List<FuncevaL_2_54Model> GetFuncevaL_2_54Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncevaL_2_54Models = new List<FuncevaL_2_54Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncevaL_2_54Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    reqCommand.strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_PRICE_FLOAT);
                    reqCommand.expire_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXPIRE_DATE_INT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncevaL_2_54Models.Add(reqCommand);
                }
            }
            return FuncevaL_2_54Models;
        }
 
    }
}
