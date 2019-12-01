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

    public static class TrdFutuAcco
    {
        //逻辑_交易期货_账户_计算交易组资金可用
        public static List<FunctdfutuL_2_1Model> GetFunctdfutuL_2_1Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdfutuL_2_1Models = new List<FunctdfutuL_2_1Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdfutuL_2_1Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.comm_avail_amt = packer.GetDoublebyName("comm_avail_amt", i);
                reqCommand.trade_avail_amt = packer.GetDoublebyName("trade_avail_amt", i);
                reqCommand.static_avail_amt = packer.GetDoublebyName("static_avail_amt", i);
 
                FunctdfutuL_2_1Models.Add(reqCommand);
            }
            return FunctdfutuL_2_1Models;
        }
 
        //逻辑_交易期货_账户_计算交易组资金可用
        public static List<FunctdfutuL_2_1Model> GetFunctdfutuL_2_1Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdfutuL_2_1Models = new List<FunctdfutuL_2_1Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdfutuL_2_1Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.comm_avail_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_AVAIL_AMT_FLOAT);
                reqCommand.trade_avail_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_AVAIL_AMT_FLOAT);
                reqCommand.static_avail_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STATIC_AVAIL_AMT_FLOAT);
                FunctdfutuL_2_1Models.Add(reqCommand);
            }
            return FunctdfutuL_2_1Models;
        }
 
        //逻辑_交易期货_账户_计算资产账户资金可用
        public static List<FunctdfutuL_2_2Model> GetFunctdfutuL_2_2Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdfutuL_2_2Models = new List<FunctdfutuL_2_2Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdfutuL_2_2Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.comm_avail_amt = packer.GetDoublebyName("comm_avail_amt", i);
                reqCommand.trade_avail_amt = packer.GetDoublebyName("trade_avail_amt", i);
                reqCommand.static_avail_amt = packer.GetDoublebyName("static_avail_amt", i);
 
                FunctdfutuL_2_2Models.Add(reqCommand);
            }
            return FunctdfutuL_2_2Models;
        }
 
        //逻辑_交易期货_账户_计算资产账户资金可用
        public static List<FunctdfutuL_2_2Model> GetFunctdfutuL_2_2Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdfutuL_2_2Models = new List<FunctdfutuL_2_2Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdfutuL_2_2Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.comm_avail_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_AVAIL_AMT_FLOAT);
                reqCommand.trade_avail_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_AVAIL_AMT_FLOAT);
                reqCommand.static_avail_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STATIC_AVAIL_AMT_FLOAT);
                FunctdfutuL_2_2Models.Add(reqCommand);
            }
            return FunctdfutuL_2_2Models;
        }
 
        //逻辑_交易期货_账户_计算交易组持仓可用
        public static List<FunctdfutuL_2_3Model> GetFunctdfutuL_2_3Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdfutuL_2_3Models = new List<FunctdfutuL_2_3Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdfutuL_2_3Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.comm_avail_qty = packer.GetDoublebyName("comm_avail_qty", i);
                reqCommand.trade_avail_qty = packer.GetDoublebyName("trade_avail_qty", i);
                reqCommand.static_avail_qty = packer.GetDoublebyName("static_avail_qty", i);
 
                FunctdfutuL_2_3Models.Add(reqCommand);
            }
            return FunctdfutuL_2_3Models;
        }
 
        //逻辑_交易期货_账户_计算交易组持仓可用
        public static List<FunctdfutuL_2_3Model> GetFunctdfutuL_2_3Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdfutuL_2_3Models = new List<FunctdfutuL_2_3Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdfutuL_2_3Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.comm_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_AVAIL_QTY_FLOAT);
                reqCommand.trade_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_AVAIL_QTY_FLOAT);
                reqCommand.static_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STATIC_AVAIL_QTY_FLOAT);
                FunctdfutuL_2_3Models.Add(reqCommand);
            }
            return FunctdfutuL_2_3Models;
        }
 
        //逻辑_交易期货_账户_计算资产账户持仓可用
        public static List<FunctdfutuL_2_4Model> GetFunctdfutuL_2_4Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdfutuL_2_4Models = new List<FunctdfutuL_2_4Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdfutuL_2_4Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.comm_avail_qty = packer.GetDoublebyName("comm_avail_qty", i);
                reqCommand.trade_avail_qty = packer.GetDoublebyName("trade_avail_qty", i);
                reqCommand.static_avail_qty = packer.GetDoublebyName("static_avail_qty", i);
 
                FunctdfutuL_2_4Models.Add(reqCommand);
            }
            return FunctdfutuL_2_4Models;
        }
 
        //逻辑_交易期货_账户_计算资产账户持仓可用
        public static List<FunctdfutuL_2_4Model> GetFunctdfutuL_2_4Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdfutuL_2_4Models = new List<FunctdfutuL_2_4Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdfutuL_2_4Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.comm_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_AVAIL_QTY_FLOAT);
                reqCommand.trade_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_AVAIL_QTY_FLOAT);
                reqCommand.static_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STATIC_AVAIL_QTY_FLOAT);
                FunctdfutuL_2_4Models.Add(reqCommand);
            }
            return FunctdfutuL_2_4Models;
        }
 
        //逻辑_交易期货_账户_查询交易组资金
        public static List<FunctdfutuL_2_5Model> GetFunctdfutuL_2_5Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdfutuL_2_5Models = new List<FunctdfutuL_2_5Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdfutuL_2_5Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_crncy_type = packer.GetStrbyName("exch_crncy_type", i);
                reqCommand.begin_amt = packer.GetDoublebyName("begin_amt", i);
                reqCommand.curr_amt = packer.GetDoublebyName("curr_amt", i);
                reqCommand.frozen_amt = packer.GetDoublebyName("frozen_amt", i);
                reqCommand.unfroz_amt = packer.GetDoublebyName("unfroz_amt", i);
                reqCommand.comm_frozen_amt = packer.GetDoublebyName("comm_frozen_amt", i);
                reqCommand.comm_unfroz_amt = packer.GetDoublebyName("comm_unfroz_amt", i);
                reqCommand.comm_capt_amt = packer.GetDoublebyName("comm_capt_amt", i);
                reqCommand.comm_releas_amt = packer.GetDoublebyName("comm_releas_amt", i);
                reqCommand.trade_capt_amt = packer.GetDoublebyName("trade_capt_amt", i);
                reqCommand.trade_releas_amt = packer.GetDoublebyName("trade_releas_amt", i);
                reqCommand.strike_capt_amt = packer.GetDoublebyName("strike_capt_amt", i);
                reqCommand.strike_releas_amt = packer.GetDoublebyName("strike_releas_amt", i);
                reqCommand.capt_margin = packer.GetDoublebyName("capt_margin", i);
                reqCommand.trade_fee = packer.GetDoublebyName("trade_fee", i);
                reqCommand.strike_fee = packer.GetDoublebyName("strike_fee", i);
                reqCommand.close_pandl = packer.GetDoublebyName("close_pandl", i);
                reqCommand.marked_pandl = packer.GetDoublebyName("marked_pandl", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdfutuL_2_5Models.Add(reqCommand);
            }
            return FunctdfutuL_2_5Models;
        }
 
        //逻辑_交易期货_账户_查询交易组资金
        public static List<FunctdfutuL_2_5Model> GetFunctdfutuL_2_5Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdfutuL_2_5Models = new List<FunctdfutuL_2_5Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdfutuL_2_5Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.exch_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR);
                    reqCommand.begin_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_AMT_FLOAT);
                    reqCommand.curr_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_AMT_FLOAT);
                    reqCommand.frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_AMT_FLOAT);
                    reqCommand.unfroz_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_AMT_FLOAT);
                    reqCommand.comm_frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_FROZEN_AMT_FLOAT);
                    reqCommand.comm_unfroz_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_UNFROZ_AMT_FLOAT);
                    reqCommand.comm_capt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_CAPT_AMT_FLOAT);
                    reqCommand.comm_releas_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_RELEAS_AMT_FLOAT);
                    reqCommand.trade_capt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CAPT_AMT_FLOAT);
                    reqCommand.trade_releas_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_RELEAS_AMT_FLOAT);
                    reqCommand.strike_capt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_CAPT_AMT_FLOAT);
                    reqCommand.strike_releas_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_AMT_FLOAT);
                    reqCommand.capt_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CAPT_MARGIN_FLOAT);
                    reqCommand.trade_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_FEE_FLOAT);
                    reqCommand.strike_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_FEE_FLOAT);
                    reqCommand.close_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_PANDL_FLOAT);
                    reqCommand.marked_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKED_PANDL_FLOAT);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdfutuL_2_5Models.Add(reqCommand);
                }
            }
            return FunctdfutuL_2_5Models;
        }
 
        //逻辑_交易期货_账户_查询资产账户资金
        public static List<FunctdfutuL_2_6Model> GetFunctdfutuL_2_6Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdfutuL_2_6Models = new List<FunctdfutuL_2_6Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdfutuL_2_6Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_crncy_type = packer.GetStrbyName("exch_crncy_type", i);
                reqCommand.begin_amt = packer.GetDoublebyName("begin_amt", i);
                reqCommand.curr_amt = packer.GetDoublebyName("curr_amt", i);
                reqCommand.frozen_amt = packer.GetDoublebyName("frozen_amt", i);
                reqCommand.unfroz_amt = packer.GetDoublebyName("unfroz_amt", i);
                reqCommand.comm_frozen_amt = packer.GetDoublebyName("comm_frozen_amt", i);
                reqCommand.comm_unfroz_amt = packer.GetDoublebyName("comm_unfroz_amt", i);
                reqCommand.comm_capt_amt = packer.GetDoublebyName("comm_capt_amt", i);
                reqCommand.comm_releas_amt = packer.GetDoublebyName("comm_releas_amt", i);
                reqCommand.trade_capt_amt = packer.GetDoublebyName("trade_capt_amt", i);
                reqCommand.trade_releas_amt = packer.GetDoublebyName("trade_releas_amt", i);
                reqCommand.strike_capt_amt = packer.GetDoublebyName("strike_capt_amt", i);
                reqCommand.strike_releas_amt = packer.GetDoublebyName("strike_releas_amt", i);
                reqCommand.capt_margin = packer.GetDoublebyName("capt_margin", i);
                reqCommand.trade_fee = packer.GetDoublebyName("trade_fee", i);
                reqCommand.strike_fee = packer.GetDoublebyName("strike_fee", i);
                reqCommand.close_pandl = packer.GetDoublebyName("close_pandl", i);
                reqCommand.marked_pandl = packer.GetDoublebyName("marked_pandl", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdfutuL_2_6Models.Add(reqCommand);
            }
            return FunctdfutuL_2_6Models;
        }
 
        //逻辑_交易期货_账户_查询资产账户资金
        public static List<FunctdfutuL_2_6Model> GetFunctdfutuL_2_6Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdfutuL_2_6Models = new List<FunctdfutuL_2_6Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdfutuL_2_6Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.exch_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR);
                    reqCommand.begin_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_AMT_FLOAT);
                    reqCommand.curr_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_AMT_FLOAT);
                    reqCommand.frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_AMT_FLOAT);
                    reqCommand.unfroz_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_AMT_FLOAT);
                    reqCommand.comm_frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_FROZEN_AMT_FLOAT);
                    reqCommand.comm_unfroz_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_UNFROZ_AMT_FLOAT);
                    reqCommand.comm_capt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_CAPT_AMT_FLOAT);
                    reqCommand.comm_releas_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_RELEAS_AMT_FLOAT);
                    reqCommand.trade_capt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CAPT_AMT_FLOAT);
                    reqCommand.trade_releas_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_RELEAS_AMT_FLOAT);
                    reqCommand.strike_capt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_CAPT_AMT_FLOAT);
                    reqCommand.strike_releas_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_AMT_FLOAT);
                    reqCommand.capt_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CAPT_MARGIN_FLOAT);
                    reqCommand.trade_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_FEE_FLOAT);
                    reqCommand.strike_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_FEE_FLOAT);
                    reqCommand.close_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_PANDL_FLOAT);
                    reqCommand.marked_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKED_PANDL_FLOAT);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdfutuL_2_6Models.Add(reqCommand);
                }
            }
            return FunctdfutuL_2_6Models;
        }
 
        //逻辑_交易期货_账户_查询交易组持仓
        public static List<FunctdfutuL_2_7Model> GetFunctdfutuL_2_7Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdfutuL_2_7Models = new List<FunctdfutuL_2_7Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdfutuL_2_7Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_crncy_type = packer.GetStrbyName("exch_crncy_type", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.futu_acco_no = packer.GetIntbyName("futu_acco_no", i);
                reqCommand.contrc_code_no = packer.GetIntbyName("contrc_code_no", i);
                reqCommand.contrc_type = packer.GetIntbyName("contrc_type", i);
                reqCommand.contrc_unit = packer.GetIntbyName("contrc_unit", i);
                reqCommand.lngsht_type = packer.GetIntbyName("lngsht_type", i);
                reqCommand.hedge_type = packer.GetIntbyName("hedge_type", i);
                reqCommand.comb_code = packer.GetStrbyName("comb_code", i);
                reqCommand.frozen_qty = packer.GetDoublebyName("frozen_qty", i);
                reqCommand.unfroz_qty = packer.GetDoublebyName("unfroz_qty", i);
                reqCommand.comm_releas_qty = packer.GetDoublebyName("comm_releas_qty", i);
                reqCommand.trade_releas_qty = packer.GetDoublebyName("trade_releas_qty", i);
                reqCommand.strike_releas_qty = packer.GetDoublebyName("strike_releas_qty", i);
                reqCommand.pre_comm_capt_qty = packer.GetDoublebyName("pre_comm_capt_qty", i);
                reqCommand.today_comm_capt_qty = packer.GetDoublebyName("today_comm_capt_qty", i);
                reqCommand.old_trade_capt_qty = packer.GetDoublebyName("old_trade_capt_qty", i);
                reqCommand.today_trade_capt_qty = packer.GetDoublebyName("today_trade_capt_qty", i);
                reqCommand.pre_strike_capt_qty = packer.GetDoublebyName("pre_strike_capt_qty", i);
                reqCommand.today_strike_capt_qty = packer.GetDoublebyName("today_strike_capt_qty", i);
                reqCommand.rece_margin = packer.GetDoublebyName("rece_margin", i);
                reqCommand.pre_settle_price = packer.GetDoublebyName("pre_settle_price", i);
                reqCommand.realize_pandl = packer.GetDoublebyName("realize_pandl", i);
                reqCommand.open_amount = packer.GetDoublebyName("open_amount", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdfutuL_2_7Models.Add(reqCommand);
            }
            return FunctdfutuL_2_7Models;
        }
 
        //逻辑_交易期货_账户_查询交易组持仓
        public static List<FunctdfutuL_2_7Model> GetFunctdfutuL_2_7Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdfutuL_2_7Models = new List<FunctdfutuL_2_7Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdfutuL_2_7Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.exch_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.futu_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT);
                    reqCommand.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    reqCommand.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    reqCommand.contrc_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_UNIT_INT);
                    reqCommand.lngsht_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT);
                    reqCommand.hedge_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT);
                    reqCommand.comb_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMB_CODE_STR);
                    reqCommand.frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_QTY_FLOAT);
                    reqCommand.unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_QTY_FLOAT);
                    reqCommand.comm_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_RELEAS_QTY_FLOAT);
                    reqCommand.trade_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_RELEAS_QTY_FLOAT);
                    reqCommand.strike_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_QTY_FLOAT);
                    reqCommand.pre_comm_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_COMM_CAPT_QTY_FLOAT);
                    reqCommand.today_comm_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_COMM_CAPT_QTY_FLOAT);
                    reqCommand.old_trade_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OLD_TRADE_CAPT_QTY_FLOAT);
                    reqCommand.today_trade_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_TRADE_CAPT_QTY_FLOAT);
                    reqCommand.pre_strike_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_STRIKE_CAPT_QTY_FLOAT);
                    reqCommand.today_strike_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_STRIKE_CAPT_QTY_FLOAT);
                    reqCommand.rece_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RECE_MARGIN_FLOAT);
                    reqCommand.pre_settle_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SETTLE_PRICE_FLOAT);
                    reqCommand.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    reqCommand.open_amount = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_AMOUNT_FLOAT);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdfutuL_2_7Models.Add(reqCommand);
                }
            }
            return FunctdfutuL_2_7Models;
        }
 
        //逻辑_交易期货_账户_查询资产账户持仓
        public static List<FunctdfutuL_2_8Model> GetFunctdfutuL_2_8Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdfutuL_2_8Models = new List<FunctdfutuL_2_8Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdfutuL_2_8Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_crncy_type = packer.GetStrbyName("exch_crncy_type", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.futu_acco_no = packer.GetIntbyName("futu_acco_no", i);
                reqCommand.contrc_code_no = packer.GetIntbyName("contrc_code_no", i);
                reqCommand.contrc_type = packer.GetIntbyName("contrc_type", i);
                reqCommand.contrc_unit = packer.GetIntbyName("contrc_unit", i);
                reqCommand.lngsht_type = packer.GetIntbyName("lngsht_type", i);
                reqCommand.hedge_type = packer.GetIntbyName("hedge_type", i);
                reqCommand.comb_code = packer.GetStrbyName("comb_code", i);
                reqCommand.frozen_qty = packer.GetDoublebyName("frozen_qty", i);
                reqCommand.unfroz_qty = packer.GetDoublebyName("unfroz_qty", i);
                reqCommand.trade_releas_qty = packer.GetDoublebyName("trade_releas_qty", i);
                reqCommand.strike_releas_qty = packer.GetDoublebyName("strike_releas_qty", i);
                reqCommand.old_trade_capt_qty = packer.GetDoublebyName("old_trade_capt_qty", i);
                reqCommand.today_trade_capt_qty = packer.GetDoublebyName("today_trade_capt_qty", i);
                reqCommand.pre_strike_capt_qty = packer.GetDoublebyName("pre_strike_capt_qty", i);
                reqCommand.today_strike_capt_qty = packer.GetDoublebyName("today_strike_capt_qty", i);
                reqCommand.rece_margin = packer.GetDoublebyName("rece_margin", i);
                reqCommand.pre_settle_price = packer.GetDoublebyName("pre_settle_price", i);
                reqCommand.open_amount = packer.GetDoublebyName("open_amount", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdfutuL_2_8Models.Add(reqCommand);
            }
            return FunctdfutuL_2_8Models;
        }
 
        //逻辑_交易期货_账户_查询资产账户持仓
        public static List<FunctdfutuL_2_8Model> GetFunctdfutuL_2_8Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdfutuL_2_8Models = new List<FunctdfutuL_2_8Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdfutuL_2_8Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.exch_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.futu_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT);
                    reqCommand.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    reqCommand.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    reqCommand.contrc_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_UNIT_INT);
                    reqCommand.lngsht_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT);
                    reqCommand.hedge_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT);
                    reqCommand.comb_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMB_CODE_STR);
                    reqCommand.frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_QTY_FLOAT);
                    reqCommand.unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_QTY_FLOAT);
                    reqCommand.trade_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_RELEAS_QTY_FLOAT);
                    reqCommand.strike_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_QTY_FLOAT);
                    reqCommand.old_trade_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OLD_TRADE_CAPT_QTY_FLOAT);
                    reqCommand.today_trade_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_TRADE_CAPT_QTY_FLOAT);
                    reqCommand.pre_strike_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_STRIKE_CAPT_QTY_FLOAT);
                    reqCommand.today_strike_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_STRIKE_CAPT_QTY_FLOAT);
                    reqCommand.rece_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RECE_MARGIN_FLOAT);
                    reqCommand.pre_settle_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SETTLE_PRICE_FLOAT);
                    reqCommand.open_amount = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_AMOUNT_FLOAT);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdfutuL_2_8Models.Add(reqCommand);
                }
            }
            return FunctdfutuL_2_8Models;
        }
 
        //逻辑_交易期货_账户_查询交易组持仓明细
        public static List<FunctdfutuL_2_9Model> GetFunctdfutuL_2_9Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdfutuL_2_9Models = new List<FunctdfutuL_2_9Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdfutuL_2_9Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.detail_posi_id = packer.GetInt64byName("detail_posi_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.futu_acco_no = packer.GetIntbyName("futu_acco_no", i);
                reqCommand.contrc_code_no = packer.GetIntbyName("contrc_code_no", i);
                reqCommand.contrc_type = packer.GetIntbyName("contrc_type", i);
                reqCommand.invest_type = packer.GetIntbyName("invest_type", i);
                reqCommand.lngsht_type = packer.GetIntbyName("lngsht_type", i);
                reqCommand.hedge_type = packer.GetIntbyName("hedge_type", i);
                reqCommand.open_posi_date = packer.GetIntbyName("open_posi_date", i);
                reqCommand.open_posi_time = packer.GetIntbyName("open_posi_time", i);
                reqCommand.strike_no = packer.GetStrbyName("strike_no", i);
                reqCommand.open_posi_price = packer.GetDoublebyName("open_posi_price", i);
                reqCommand.open_posi_qty = packer.GetDoublebyName("open_posi_qty", i);
                reqCommand.open_amount = packer.GetDoublebyName("open_amount", i);
                reqCommand.trade_capt_qty = packer.GetDoublebyName("trade_capt_qty", i);
                reqCommand.strike_capt_qty = packer.GetDoublebyName("strike_capt_qty", i);
                reqCommand.open_posi_fee = packer.GetDoublebyName("open_posi_fee", i);
                reqCommand.close_posi_fee = packer.GetDoublebyName("close_posi_fee", i);
                reqCommand.marked_sett_price = packer.GetDoublebyName("marked_sett_price", i);
                reqCommand.marked_pandl = packer.GetDoublebyName("marked_pandl", i);
                reqCommand.close_pandl = packer.GetDoublebyName("close_pandl", i);
                reqCommand.rece_margin = packer.GetDoublebyName("rece_margin", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdfutuL_2_9Models.Add(reqCommand);
            }
            return FunctdfutuL_2_9Models;
        }
 
        //逻辑_交易期货_账户_查询交易组持仓明细
        public static List<FunctdfutuL_2_9Model> GetFunctdfutuL_2_9Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdfutuL_2_9Models = new List<FunctdfutuL_2_9Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdfutuL_2_9Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.detail_posi_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_DETAIL_POSI_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.futu_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT);
                    reqCommand.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    reqCommand.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    reqCommand.invest_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INVEST_TYPE_INT);
                    reqCommand.lngsht_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT);
                    reqCommand.hedge_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT);
                    reqCommand.open_posi_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_DATE_INT);
                    reqCommand.open_posi_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_TIME_INT);
                    reqCommand.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                    reqCommand.open_posi_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_PRICE_FLOAT);
                    reqCommand.open_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_QTY_FLOAT);
                    reqCommand.open_amount = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_AMOUNT_FLOAT);
                    reqCommand.trade_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CAPT_QTY_FLOAT);
                    reqCommand.strike_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_CAPT_QTY_FLOAT);
                    reqCommand.open_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_FEE_FLOAT);
                    reqCommand.close_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_FEE_FLOAT);
                    reqCommand.marked_sett_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKED_SETT_PRICE_FLOAT);
                    reqCommand.marked_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKED_PANDL_FLOAT);
                    reqCommand.close_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_PANDL_FLOAT);
                    reqCommand.rece_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RECE_MARGIN_FLOAT);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdfutuL_2_9Models.Add(reqCommand);
                }
            }
            return FunctdfutuL_2_9Models;
        }
 
        //逻辑_交易期货_账户_查询历史交易组业务资金
        public static List<FunctdfutuL_2_10Model> GetFunctdfutuL_2_10Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdfutuL_2_10Models = new List<FunctdfutuL_2_10Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdfutuL_2_10Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_crncy_type = packer.GetStrbyName("exch_crncy_type", i);
                reqCommand.begin_amt = packer.GetDoublebyName("begin_amt", i);
                reqCommand.curr_amt = packer.GetDoublebyName("curr_amt", i);
                reqCommand.frozen_amt = packer.GetDoublebyName("frozen_amt", i);
                reqCommand.unfroz_amt = packer.GetDoublebyName("unfroz_amt", i);
                reqCommand.comm_frozen_amt = packer.GetDoublebyName("comm_frozen_amt", i);
                reqCommand.comm_unfroz_amt = packer.GetDoublebyName("comm_unfroz_amt", i);
                reqCommand.comm_capt_amt = packer.GetDoublebyName("comm_capt_amt", i);
                reqCommand.comm_releas_amt = packer.GetDoublebyName("comm_releas_amt", i);
                reqCommand.trade_capt_amt = packer.GetDoublebyName("trade_capt_amt", i);
                reqCommand.trade_releas_amt = packer.GetDoublebyName("trade_releas_amt", i);
                reqCommand.strike_capt_amt = packer.GetDoublebyName("strike_capt_amt", i);
                reqCommand.strike_releas_amt = packer.GetDoublebyName("strike_releas_amt", i);
                reqCommand.capt_margin = packer.GetDoublebyName("capt_margin", i);
                reqCommand.trade_fee = packer.GetDoublebyName("trade_fee", i);
                reqCommand.strike_fee = packer.GetDoublebyName("strike_fee", i);
                reqCommand.close_pandl = packer.GetDoublebyName("close_pandl", i);
                reqCommand.marked_pandl = packer.GetDoublebyName("marked_pandl", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdfutuL_2_10Models.Add(reqCommand);
            }
            return FunctdfutuL_2_10Models;
        }
 
        //逻辑_交易期货_账户_查询历史交易组业务资金
        public static List<FunctdfutuL_2_10Model> GetFunctdfutuL_2_10Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdfutuL_2_10Models = new List<FunctdfutuL_2_10Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdfutuL_2_10Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.exch_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR);
                    reqCommand.begin_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_AMT_FLOAT);
                    reqCommand.curr_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_AMT_FLOAT);
                    reqCommand.frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_AMT_FLOAT);
                    reqCommand.unfroz_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_AMT_FLOAT);
                    reqCommand.comm_frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_FROZEN_AMT_FLOAT);
                    reqCommand.comm_unfroz_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_UNFROZ_AMT_FLOAT);
                    reqCommand.comm_capt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_CAPT_AMT_FLOAT);
                    reqCommand.comm_releas_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_RELEAS_AMT_FLOAT);
                    reqCommand.trade_capt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CAPT_AMT_FLOAT);
                    reqCommand.trade_releas_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_RELEAS_AMT_FLOAT);
                    reqCommand.strike_capt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_CAPT_AMT_FLOAT);
                    reqCommand.strike_releas_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_AMT_FLOAT);
                    reqCommand.capt_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CAPT_MARGIN_FLOAT);
                    reqCommand.trade_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_FEE_FLOAT);
                    reqCommand.strike_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_FEE_FLOAT);
                    reqCommand.close_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_PANDL_FLOAT);
                    reqCommand.marked_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKED_PANDL_FLOAT);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdfutuL_2_10Models.Add(reqCommand);
                }
            }
            return FunctdfutuL_2_10Models;
        }
 
    }
}
