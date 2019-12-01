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

    public static class TrdSecuAcco
    {
        //逻辑_交易证券_账户_计算交易组资金可用
        public static List<FunctdsecuL_2_1Model> GetFunctdsecuL_2_1Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_2_1Models = new List<FunctdsecuL_2_1Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_2_1Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.comm_avail_amt = packer.GetDoublebyName("comm_avail_amt", i);
                reqCommand.trade_avail_amt = packer.GetDoublebyName("trade_avail_amt", i);
                reqCommand.static_avail_amt = packer.GetDoublebyName("static_avail_amt", i);
 
                FunctdsecuL_2_1Models.Add(reqCommand);
            }
            return FunctdsecuL_2_1Models;
        }
 
        //逻辑_交易证券_账户_计算交易组资金可用
        public static List<FunctdsecuL_2_1Model> GetFunctdsecuL_2_1Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_2_1Models = new List<FunctdsecuL_2_1Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_2_1Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.comm_avail_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_AVAIL_AMT_FLOAT);
                reqCommand.trade_avail_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_AVAIL_AMT_FLOAT);
                reqCommand.static_avail_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STATIC_AVAIL_AMT_FLOAT);
                FunctdsecuL_2_1Models.Add(reqCommand);
            }
            return FunctdsecuL_2_1Models;
        }
 
        //逻辑_交易证券_账户_计算资产账户资金可用
        public static List<FunctdsecuL_2_2Model> GetFunctdsecuL_2_2Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_2_2Models = new List<FunctdsecuL_2_2Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_2_2Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.comm_avail_amt = packer.GetDoublebyName("comm_avail_amt", i);
                reqCommand.trade_avail_amt = packer.GetDoublebyName("trade_avail_amt", i);
                reqCommand.static_avail_amt = packer.GetDoublebyName("static_avail_amt", i);
 
                FunctdsecuL_2_2Models.Add(reqCommand);
            }
            return FunctdsecuL_2_2Models;
        }
 
        //逻辑_交易证券_账户_计算资产账户资金可用
        public static List<FunctdsecuL_2_2Model> GetFunctdsecuL_2_2Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_2_2Models = new List<FunctdsecuL_2_2Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_2_2Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.comm_avail_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_AVAIL_AMT_FLOAT);
                reqCommand.trade_avail_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_AVAIL_AMT_FLOAT);
                reqCommand.static_avail_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STATIC_AVAIL_AMT_FLOAT);
                FunctdsecuL_2_2Models.Add(reqCommand);
            }
            return FunctdsecuL_2_2Models;
        }
 
        //逻辑_交易证券_账户_计算交易组持仓可用
        public static List<FunctdsecuL_2_3Model> GetFunctdsecuL_2_3Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_2_3Models = new List<FunctdsecuL_2_3Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_2_3Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.comm_avail_qty = packer.GetDoublebyName("comm_avail_qty", i);
                reqCommand.trade_avail_qty = packer.GetDoublebyName("trade_avail_qty", i);
                reqCommand.static_avail_qty = packer.GetDoublebyName("static_avail_qty", i);
 
                FunctdsecuL_2_3Models.Add(reqCommand);
            }
            return FunctdsecuL_2_3Models;
        }
 
        //逻辑_交易证券_账户_计算交易组持仓可用
        public static List<FunctdsecuL_2_3Model> GetFunctdsecuL_2_3Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_2_3Models = new List<FunctdsecuL_2_3Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_2_3Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.comm_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_AVAIL_QTY_FLOAT);
                reqCommand.trade_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_AVAIL_QTY_FLOAT);
                reqCommand.static_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STATIC_AVAIL_QTY_FLOAT);
                FunctdsecuL_2_3Models.Add(reqCommand);
            }
            return FunctdsecuL_2_3Models;
        }
 
        //逻辑_交易证券_账户_计算资产账户持仓可用
        public static List<FunctdsecuL_2_4Model> GetFunctdsecuL_2_4Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_2_4Models = new List<FunctdsecuL_2_4Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_2_4Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.comm_avail_qty = packer.GetDoublebyName("comm_avail_qty", i);
                reqCommand.trade_avail_qty = packer.GetDoublebyName("trade_avail_qty", i);
                reqCommand.static_avail_qty = packer.GetDoublebyName("static_avail_qty", i);
 
                FunctdsecuL_2_4Models.Add(reqCommand);
            }
            return FunctdsecuL_2_4Models;
        }
 
        //逻辑_交易证券_账户_计算资产账户持仓可用
        public static List<FunctdsecuL_2_4Model> GetFunctdsecuL_2_4Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_2_4Models = new List<FunctdsecuL_2_4Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_2_4Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.comm_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_AVAIL_QTY_FLOAT);
                reqCommand.trade_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_AVAIL_QTY_FLOAT);
                reqCommand.static_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STATIC_AVAIL_QTY_FLOAT);
                FunctdsecuL_2_4Models.Add(reqCommand);
            }
            return FunctdsecuL_2_4Models;
        }
 
        //逻辑_交易证券_账户_查询交易组资金
        public static List<FunctdsecuL_2_5Model> GetFunctdsecuL_2_5Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_2_5Models = new List<FunctdsecuL_2_5Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_2_5Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.update_date = packer.GetIntbyName("update_date", i);
                reqCommand.update_time = packer.GetIntbyName("update_time", i);
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
                reqCommand.trade_frozen_amt = packer.GetDoublebyName("trade_frozen_amt", i);
                reqCommand.trade_unfroz_amt = packer.GetDoublebyName("trade_unfroz_amt", i);
                reqCommand.trade_capt_amt = packer.GetDoublebyName("trade_capt_amt", i);
                reqCommand.trade_releas_amt = packer.GetDoublebyName("trade_releas_amt", i);
                reqCommand.strike_capt_amt = packer.GetDoublebyName("strike_capt_amt", i);
                reqCommand.strike_releas_amt = packer.GetDoublebyName("strike_releas_amt", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdsecuL_2_5Models.Add(reqCommand);
            }
            return FunctdsecuL_2_5Models;
        }
 
        //逻辑_交易证券_账户_查询交易组资金
        public static List<FunctdsecuL_2_5Model> GetFunctdsecuL_2_5Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_2_5Models = new List<FunctdsecuL_2_5Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_2_5Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    reqCommand.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    reqCommand.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    reqCommand.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
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
                    reqCommand.trade_frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_FROZEN_AMT_FLOAT);
                    reqCommand.trade_unfroz_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_UNFROZ_AMT_FLOAT);
                    reqCommand.trade_capt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CAPT_AMT_FLOAT);
                    reqCommand.trade_releas_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_RELEAS_AMT_FLOAT);
                    reqCommand.strike_capt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_CAPT_AMT_FLOAT);
                    reqCommand.strike_releas_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_AMT_FLOAT);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdsecuL_2_5Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_2_5Models;
        }
 
        //逻辑_交易证券_账户_查询资产账户资金
        public static List<FunctdsecuL_2_6Model> GetFunctdsecuL_2_6Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_2_6Models = new List<FunctdsecuL_2_6Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_2_6Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.update_date = packer.GetIntbyName("update_date", i);
                reqCommand.update_time = packer.GetIntbyName("update_time", i);
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
                reqCommand.trade_frozen_amt = packer.GetDoublebyName("trade_frozen_amt", i);
                reqCommand.trade_unfroz_amt = packer.GetDoublebyName("trade_unfroz_amt", i);
                reqCommand.trade_capt_amt = packer.GetDoublebyName("trade_capt_amt", i);
                reqCommand.trade_releas_amt = packer.GetDoublebyName("trade_releas_amt", i);
                reqCommand.strike_capt_amt = packer.GetDoublebyName("strike_capt_amt", i);
                reqCommand.strike_releas_amt = packer.GetDoublebyName("strike_releas_amt", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdsecuL_2_6Models.Add(reqCommand);
            }
            return FunctdsecuL_2_6Models;
        }
 
        //逻辑_交易证券_账户_查询资产账户资金
        public static List<FunctdsecuL_2_6Model> GetFunctdsecuL_2_6Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_2_6Models = new List<FunctdsecuL_2_6Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_2_6Model();
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
                    reqCommand.exch_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR);
                    reqCommand.begin_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_AMT_FLOAT);
                    reqCommand.curr_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_AMT_FLOAT);
                    reqCommand.frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_AMT_FLOAT);
                    reqCommand.unfroz_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_AMT_FLOAT);
                    reqCommand.comm_frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_FROZEN_AMT_FLOAT);
                    reqCommand.comm_unfroz_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_UNFROZ_AMT_FLOAT);
                    reqCommand.comm_capt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_CAPT_AMT_FLOAT);
                    reqCommand.comm_releas_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_RELEAS_AMT_FLOAT);
                    reqCommand.trade_frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_FROZEN_AMT_FLOAT);
                    reqCommand.trade_unfroz_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_UNFROZ_AMT_FLOAT);
                    reqCommand.trade_capt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CAPT_AMT_FLOAT);
                    reqCommand.trade_releas_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_RELEAS_AMT_FLOAT);
                    reqCommand.strike_capt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_CAPT_AMT_FLOAT);
                    reqCommand.strike_releas_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_AMT_FLOAT);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdsecuL_2_6Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_2_6Models;
        }
 
        //逻辑_交易证券_账户_查询交易组持仓
        public static List<FunctdsecuL_2_7Model> GetFunctdsecuL_2_7Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_2_7Models = new List<FunctdsecuL_2_7Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_2_7Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.update_date = packer.GetIntbyName("update_date", i);
                reqCommand.update_time = packer.GetIntbyName("update_time", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.begin_qty = packer.GetDoublebyName("begin_qty", i);
                reqCommand.curr_qty = packer.GetDoublebyName("curr_qty", i);
                reqCommand.frozen_qty = packer.GetDoublebyName("frozen_qty", i);
                reqCommand.unfroz_qty = packer.GetDoublebyName("unfroz_qty", i);
                reqCommand.comm_frozen_qty = packer.GetDoublebyName("comm_frozen_qty", i);
                reqCommand.comm_unfroz_qty = packer.GetDoublebyName("comm_unfroz_qty", i);
                reqCommand.comm_capt_qty = packer.GetDoublebyName("comm_capt_qty", i);
                reqCommand.comm_releas_qty = packer.GetDoublebyName("comm_releas_qty", i);
                reqCommand.trade_frozen_qty = packer.GetDoublebyName("trade_frozen_qty", i);
                reqCommand.trade_unfroz_qty = packer.GetDoublebyName("trade_unfroz_qty", i);
                reqCommand.trade_capt_qty = packer.GetDoublebyName("trade_capt_qty", i);
                reqCommand.trade_releas_qty = packer.GetDoublebyName("trade_releas_qty", i);
                reqCommand.strike_capt_qty = packer.GetDoublebyName("strike_capt_qty", i);
                reqCommand.strike_releas_qty = packer.GetDoublebyName("strike_releas_qty", i);
                reqCommand.strike_frozen_qty = packer.GetDoublebyName("strike_frozen_qty", i);
                reqCommand.strike_unfroz_qty = packer.GetDoublebyName("strike_unfroz_qty", i);
                reqCommand.cost_amt = packer.GetDoublebyName("cost_amt", i);
                reqCommand.intrst_cost_amt = packer.GetDoublebyName("intrst_cost_amt", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
                reqCommand.realize_pandl = packer.GetDoublebyName("realize_pandl", i);
                reqCommand.intrst_pandl = packer.GetDoublebyName("intrst_pandl", i);
 
                FunctdsecuL_2_7Models.Add(reqCommand);
            }
            return FunctdsecuL_2_7Models;
        }
 
        //逻辑_交易证券_账户_查询交易组持仓
        public static List<FunctdsecuL_2_7Model> GetFunctdsecuL_2_7Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_2_7Models = new List<FunctdsecuL_2_7Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_2_7Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    reqCommand.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    reqCommand.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    reqCommand.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.begin_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_QTY_FLOAT);
                    reqCommand.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    reqCommand.frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_QTY_FLOAT);
                    reqCommand.unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_QTY_FLOAT);
                    reqCommand.comm_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_FROZEN_QTY_FLOAT);
                    reqCommand.comm_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_UNFROZ_QTY_FLOAT);
                    reqCommand.comm_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_CAPT_QTY_FLOAT);
                    reqCommand.comm_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_RELEAS_QTY_FLOAT);
                    reqCommand.trade_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_FROZEN_QTY_FLOAT);
                    reqCommand.trade_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_UNFROZ_QTY_FLOAT);
                    reqCommand.trade_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CAPT_QTY_FLOAT);
                    reqCommand.trade_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_RELEAS_QTY_FLOAT);
                    reqCommand.strike_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_CAPT_QTY_FLOAT);
                    reqCommand.strike_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_QTY_FLOAT);
                    reqCommand.strike_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_FROZEN_QTY_FLOAT);
                    reqCommand.strike_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_UNFROZ_QTY_FLOAT);
                    reqCommand.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                    reqCommand.intrst_cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_COST_AMT_FLOAT);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    reqCommand.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    reqCommand.intrst_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_PANDL_FLOAT);
                    FunctdsecuL_2_7Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_2_7Models;
        }
 
        //逻辑_交易证券_账户_查询资产账户持仓
        public static List<FunctdsecuL_2_8Model> GetFunctdsecuL_2_8Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_2_8Models = new List<FunctdsecuL_2_8Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_2_8Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.update_date = packer.GetIntbyName("update_date", i);
                reqCommand.update_time = packer.GetIntbyName("update_time", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.begin_qty = packer.GetDoublebyName("begin_qty", i);
                reqCommand.curr_qty = packer.GetDoublebyName("curr_qty", i);
                reqCommand.frozen_qty = packer.GetDoublebyName("frozen_qty", i);
                reqCommand.unfroz_qty = packer.GetDoublebyName("unfroz_qty", i);
                reqCommand.comm_frozen_qty = packer.GetDoublebyName("comm_frozen_qty", i);
                reqCommand.comm_unfroz_qty = packer.GetDoublebyName("comm_unfroz_qty", i);
                reqCommand.comm_capt_qty = packer.GetDoublebyName("comm_capt_qty", i);
                reqCommand.comm_releas_qty = packer.GetDoublebyName("comm_releas_qty", i);
                reqCommand.trade_frozen_qty = packer.GetDoublebyName("trade_frozen_qty", i);
                reqCommand.trade_unfroz_qty = packer.GetDoublebyName("trade_unfroz_qty", i);
                reqCommand.trade_capt_qty = packer.GetDoublebyName("trade_capt_qty", i);
                reqCommand.trade_releas_qty = packer.GetDoublebyName("trade_releas_qty", i);
                reqCommand.strike_capt_qty = packer.GetDoublebyName("strike_capt_qty", i);
                reqCommand.strike_releas_qty = packer.GetDoublebyName("strike_releas_qty", i);
                reqCommand.strike_frozen_qty = packer.GetDoublebyName("strike_frozen_qty", i);
                reqCommand.strike_unfroz_qty = packer.GetDoublebyName("strike_unfroz_qty", i);
                reqCommand.cost_amt = packer.GetDoublebyName("cost_amt", i);
                reqCommand.intrst_cost_amt = packer.GetDoublebyName("intrst_cost_amt", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
                reqCommand.realize_pandl = packer.GetDoublebyName("realize_pandl", i);
                reqCommand.intrst_pandl = packer.GetDoublebyName("intrst_pandl", i);
 
                FunctdsecuL_2_8Models.Add(reqCommand);
            }
            return FunctdsecuL_2_8Models;
        }
 
        //逻辑_交易证券_账户_查询资产账户持仓
        public static List<FunctdsecuL_2_8Model> GetFunctdsecuL_2_8Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_2_8Models = new List<FunctdsecuL_2_8Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_2_8Model();
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
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.begin_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_QTY_FLOAT);
                    reqCommand.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    reqCommand.frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_QTY_FLOAT);
                    reqCommand.unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_QTY_FLOAT);
                    reqCommand.comm_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_FROZEN_QTY_FLOAT);
                    reqCommand.comm_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_UNFROZ_QTY_FLOAT);
                    reqCommand.comm_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_CAPT_QTY_FLOAT);
                    reqCommand.comm_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_RELEAS_QTY_FLOAT);
                    reqCommand.trade_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_FROZEN_QTY_FLOAT);
                    reqCommand.trade_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_UNFROZ_QTY_FLOAT);
                    reqCommand.trade_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CAPT_QTY_FLOAT);
                    reqCommand.trade_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_RELEAS_QTY_FLOAT);
                    reqCommand.strike_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_CAPT_QTY_FLOAT);
                    reqCommand.strike_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_QTY_FLOAT);
                    reqCommand.strike_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_FROZEN_QTY_FLOAT);
                    reqCommand.strike_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_UNFROZ_QTY_FLOAT);
                    reqCommand.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                    reqCommand.intrst_cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_COST_AMT_FLOAT);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    reqCommand.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    reqCommand.intrst_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_PANDL_FLOAT);
                    FunctdsecuL_2_8Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_2_8Models;
        }
 
        //逻辑_交易证券_账户_查询交易组债券质押
        public static List<FunctdsecuL_2_33Model> GetFunctdsecuL_2_33Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_2_33Models = new List<FunctdsecuL_2_33Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_2_33Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.begin_qty = packer.GetDoublebyName("begin_qty", i);
                reqCommand.curr_qty = packer.GetDoublebyName("curr_qty", i);
                reqCommand.put_impawn_qty = packer.GetDoublebyName("put_impawn_qty", i);
                reqCommand.get_impawn_qty = packer.GetDoublebyName("get_impawn_qty", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdsecuL_2_33Models.Add(reqCommand);
            }
            return FunctdsecuL_2_33Models;
        }
 
        //逻辑_交易证券_账户_查询交易组债券质押
        public static List<FunctdsecuL_2_33Model> GetFunctdsecuL_2_33Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_2_33Models = new List<FunctdsecuL_2_33Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_2_33Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.begin_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_QTY_FLOAT);
                    reqCommand.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    reqCommand.put_impawn_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PUT_IMPAWN_QTY_FLOAT);
                    reqCommand.get_impawn_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_GET_IMPAWN_QTY_FLOAT);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdsecuL_2_33Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_2_33Models;
        }
 
        //逻辑_交易证券_账户_查询资产账户债券质押
        public static List<FunctdsecuL_2_34Model> GetFunctdsecuL_2_34Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_2_34Models = new List<FunctdsecuL_2_34Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_2_34Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.begin_qty = packer.GetDoublebyName("begin_qty", i);
                reqCommand.curr_qty = packer.GetDoublebyName("curr_qty", i);
                reqCommand.put_impawn_qty = packer.GetDoublebyName("put_impawn_qty", i);
                reqCommand.get_impawn_qty = packer.GetDoublebyName("get_impawn_qty", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdsecuL_2_34Models.Add(reqCommand);
            }
            return FunctdsecuL_2_34Models;
        }
 
        //逻辑_交易证券_账户_查询资产账户债券质押
        public static List<FunctdsecuL_2_34Model> GetFunctdsecuL_2_34Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_2_34Models = new List<FunctdsecuL_2_34Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_2_34Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.begin_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_QTY_FLOAT);
                    reqCommand.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    reqCommand.put_impawn_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PUT_IMPAWN_QTY_FLOAT);
                    reqCommand.get_impawn_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_GET_IMPAWN_QTY_FLOAT);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdsecuL_2_34Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_2_34Models;
        }
 
        //逻辑_交易证券_账户_查询交易组债券质押转回可用
        public static List<FunctdsecuL_2_37Model> GetFunctdsecuL_2_37Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_2_37Models = new List<FunctdsecuL_2_37Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_2_37Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.comm_reback_avail_qty = packer.GetDoublebyName("comm_reback_avail_qty", i);
                reqCommand.trade_reback_avail_qty = packer.GetDoublebyName("trade_reback_avail_qty", i);
 
                FunctdsecuL_2_37Models.Add(reqCommand);
            }
            return FunctdsecuL_2_37Models;
        }
 
        //逻辑_交易证券_账户_查询交易组债券质押转回可用
        public static List<FunctdsecuL_2_37Model> GetFunctdsecuL_2_37Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_2_37Models = new List<FunctdsecuL_2_37Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_2_37Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.comm_reback_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_REBACK_AVAIL_QTY_FLOAT);
                    reqCommand.trade_reback_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_REBACK_AVAIL_QTY_FLOAT);
                    FunctdsecuL_2_37Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_2_37Models;
        }
 
        //逻辑_交易证券_账户_查询交易组债券回购
        public static List<FunctdsecuL_2_43Model> GetFunctdsecuL_2_43Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_2_43Models = new List<FunctdsecuL_2_43Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_2_43Model();
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
                reqCommand.target_code_no = packer.GetIntbyName("target_code_no", i);
                reqCommand.comm_id = packer.GetInt64byName("comm_id", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.repo_qty = packer.GetDoublebyName("repo_qty", i);
                reqCommand.repo_amt = packer.GetDoublebyName("repo_amt", i);
                reqCommand.repo_rate = packer.GetDoublebyName("repo_rate", i);
                reqCommand.repo_trade_date = packer.GetIntbyName("repo_trade_date", i);
                reqCommand.repo_order_id = packer.GetInt64byName("repo_order_id", i);
                reqCommand.repo_strike_id = packer.GetInt64byName("repo_strike_id", i);
                reqCommand.repo_days = packer.GetIntbyName("repo_days", i);
                reqCommand.repo_cale_days = packer.GetIntbyName("repo_cale_days", i);
                reqCommand.repo_back_date = packer.GetIntbyName("repo_back_date", i);
                reqCommand.repo_back_amt = packer.GetDoublebyName("repo_back_amt", i);
                reqCommand.repo_back_intrst = packer.GetDoublebyName("repo_back_intrst", i);
                reqCommand.repo_back_trade_date = packer.GetIntbyName("repo_back_trade_date", i);
                reqCommand.repo_status = packer.GetStrbyName("repo_status", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdsecuL_2_43Models.Add(reqCommand);
            }
            return FunctdsecuL_2_43Models;
        }
 
        //逻辑_交易证券_账户_查询交易组债券回购
        public static List<FunctdsecuL_2_43Model> GetFunctdsecuL_2_43Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_2_43Models = new List<FunctdsecuL_2_43Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_2_43Model();
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
                    reqCommand.target_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_NO_INT);
                    reqCommand.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.repo_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPO_QTY_FLOAT);
                    reqCommand.repo_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPO_AMT_FLOAT);
                    reqCommand.repo_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPO_RATE_FLOAT);
                    reqCommand.repo_trade_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPO_TRADE_DATE_INT);
                    reqCommand.repo_order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_REPO_ORDER_ID_INT64);
                    reqCommand.repo_strike_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_REPO_STRIKE_ID_INT64);
                    reqCommand.repo_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPO_DAYS_INT);
                    reqCommand.repo_cale_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPO_CALE_DAYS_INT);
                    reqCommand.repo_back_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPO_BACK_DATE_INT);
                    reqCommand.repo_back_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPO_BACK_AMT_FLOAT);
                    reqCommand.repo_back_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPO_BACK_INTRST_FLOAT);
                    reqCommand.repo_back_trade_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPO_BACK_TRADE_DATE_INT);
                    reqCommand.repo_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPO_STATUS_STR);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdsecuL_2_43Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_2_43Models;
        }
 
        //逻辑_交易证券_账户_查询组合持仓
        public static List<FunctdsecuL_2_44Model> GetFunctdsecuL_2_44Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_2_44Models = new List<FunctdsecuL_2_44Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_2_44Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.combo_code = packer.GetStrbyName("combo_code", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.open_posi_date = packer.GetIntbyName("open_posi_date", i);
                reqCommand.curr_qty = packer.GetDoublebyName("curr_qty", i);
                reqCommand.posi_qty = packer.GetDoublebyName("posi_qty", i);
                reqCommand.frozen_qty = packer.GetDoublebyName("frozen_qty", i);
                reqCommand.unfroz_qty = packer.GetDoublebyName("unfroz_qty", i);
                reqCommand.pre_settle_qty = packer.GetDoublebyName("pre_settle_qty", i);
                reqCommand.trade_frozen_qty = packer.GetDoublebyName("trade_frozen_qty", i);
                reqCommand.trade_unfroz_qty = packer.GetDoublebyName("trade_unfroz_qty", i);
                reqCommand.trade_capt_qty = packer.GetDoublebyName("trade_capt_qty", i);
                reqCommand.trade_releas_qty = packer.GetDoublebyName("trade_releas_qty", i);
                reqCommand.strike_capt_qty = packer.GetDoublebyName("strike_capt_qty", i);
                reqCommand.strike_releas_qty = packer.GetDoublebyName("strike_releas_qty", i);
                reqCommand.strike_frozen_qty = packer.GetDoublebyName("strike_frozen_qty", i);
                reqCommand.strike_unfroz_qty = packer.GetDoublebyName("strike_unfroz_qty", i);
                reqCommand.realize_pandl = packer.GetDoublebyName("realize_pandl", i);
                reqCommand.cost_amt = packer.GetDoublebyName("cost_amt", i);
                reqCommand.intrst_cost_amt = packer.GetDoublebyName("intrst_cost_amt", i);
                reqCommand.intrst_pandl = packer.GetDoublebyName("intrst_pandl", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdsecuL_2_44Models.Add(reqCommand);
            }
            return FunctdsecuL_2_44Models;
        }
 
        //逻辑_交易证券_账户_查询组合持仓
        public static List<FunctdsecuL_2_44Model> GetFunctdsecuL_2_44Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_2_44Models = new List<FunctdsecuL_2_44Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_2_44Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    reqCommand.combo_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_CODE_STR);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.open_posi_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_DATE_INT);
                    reqCommand.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    reqCommand.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    reqCommand.frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_QTY_FLOAT);
                    reqCommand.unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_QTY_FLOAT);
                    reqCommand.pre_settle_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SETTLE_QTY_FLOAT);
                    reqCommand.trade_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_FROZEN_QTY_FLOAT);
                    reqCommand.trade_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_UNFROZ_QTY_FLOAT);
                    reqCommand.trade_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CAPT_QTY_FLOAT);
                    reqCommand.trade_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_RELEAS_QTY_FLOAT);
                    reqCommand.strike_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_CAPT_QTY_FLOAT);
                    reqCommand.strike_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_QTY_FLOAT);
                    reqCommand.strike_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_FROZEN_QTY_FLOAT);
                    reqCommand.strike_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_UNFROZ_QTY_FLOAT);
                    reqCommand.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    reqCommand.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                    reqCommand.intrst_cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_COST_AMT_FLOAT);
                    reqCommand.intrst_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_PANDL_FLOAT);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdsecuL_2_44Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_2_44Models;
        }
 
        //逻辑_交易证券_账户_查询历史组合持仓
        public static List<FunctdsecuL_2_45Model> GetFunctdsecuL_2_45Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_2_45Models = new List<FunctdsecuL_2_45Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_2_45Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.combo_code = packer.GetStrbyName("combo_code", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.open_posi_date = packer.GetIntbyName("open_posi_date", i);
                reqCommand.curr_qty = packer.GetDoublebyName("curr_qty", i);
                reqCommand.posi_qty = packer.GetDoublebyName("posi_qty", i);
                reqCommand.frozen_qty = packer.GetDoublebyName("frozen_qty", i);
                reqCommand.unfroz_qty = packer.GetDoublebyName("unfroz_qty", i);
                reqCommand.pre_settle_qty = packer.GetDoublebyName("pre_settle_qty", i);
                reqCommand.trade_frozen_qty = packer.GetDoublebyName("trade_frozen_qty", i);
                reqCommand.trade_unfroz_qty = packer.GetDoublebyName("trade_unfroz_qty", i);
                reqCommand.trade_capt_qty = packer.GetDoublebyName("trade_capt_qty", i);
                reqCommand.trade_releas_qty = packer.GetDoublebyName("trade_releas_qty", i);
                reqCommand.strike_capt_qty = packer.GetDoublebyName("strike_capt_qty", i);
                reqCommand.strike_releas_qty = packer.GetDoublebyName("strike_releas_qty", i);
                reqCommand.strike_frozen_qty = packer.GetDoublebyName("strike_frozen_qty", i);
                reqCommand.strike_unfroz_qty = packer.GetDoublebyName("strike_unfroz_qty", i);
                reqCommand.realize_pandl = packer.GetDoublebyName("realize_pandl", i);
                reqCommand.cost_amt = packer.GetDoublebyName("cost_amt", i);
                reqCommand.intrst_cost_amt = packer.GetDoublebyName("intrst_cost_amt", i);
                reqCommand.intrst_pandl = packer.GetDoublebyName("intrst_pandl", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdsecuL_2_45Models.Add(reqCommand);
            }
            return FunctdsecuL_2_45Models;
        }
 
        //逻辑_交易证券_账户_查询历史组合持仓
        public static List<FunctdsecuL_2_45Model> GetFunctdsecuL_2_45Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_2_45Models = new List<FunctdsecuL_2_45Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_2_45Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    reqCommand.combo_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_CODE_STR);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.open_posi_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_DATE_INT);
                    reqCommand.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    reqCommand.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    reqCommand.frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_QTY_FLOAT);
                    reqCommand.unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_QTY_FLOAT);
                    reqCommand.pre_settle_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SETTLE_QTY_FLOAT);
                    reqCommand.trade_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_FROZEN_QTY_FLOAT);
                    reqCommand.trade_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_UNFROZ_QTY_FLOAT);
                    reqCommand.trade_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CAPT_QTY_FLOAT);
                    reqCommand.trade_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_RELEAS_QTY_FLOAT);
                    reqCommand.strike_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_CAPT_QTY_FLOAT);
                    reqCommand.strike_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_QTY_FLOAT);
                    reqCommand.strike_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_FROZEN_QTY_FLOAT);
                    reqCommand.strike_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_UNFROZ_QTY_FLOAT);
                    reqCommand.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    reqCommand.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                    reqCommand.intrst_cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_COST_AMT_FLOAT);
                    reqCommand.intrst_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_PANDL_FLOAT);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdsecuL_2_45Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_2_45Models;
        }
 
        //逻辑_交易证券_账户_查询组合收益
        public static List<FunctdsecuL_2_46Model> GetFunctdsecuL_2_46Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_2_46Models = new List<FunctdsecuL_2_46Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_2_46Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.open_posi_date = packer.GetIntbyName("open_posi_date", i);
                reqCommand.combo_code = packer.GetStrbyName("combo_code", i);
                reqCommand.combo_copies = packer.GetDoublebyName("combo_copies", i);
                reqCommand.combo_status = packer.GetStrbyName("combo_status", i);
                reqCommand.combo_cost = packer.GetDoublebyName("combo_cost", i);
                reqCommand.combo_market_value = packer.GetDoublebyName("combo_market_value", i);
                reqCommand.realize_pandl = packer.GetDoublebyName("realize_pandl", i);
                reqCommand.sum_realize_pandl = packer.GetDoublebyName("sum_realize_pandl", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdsecuL_2_46Models.Add(reqCommand);
            }
            return FunctdsecuL_2_46Models;
        }
 
        //逻辑_交易证券_账户_查询组合收益
        public static List<FunctdsecuL_2_46Model> GetFunctdsecuL_2_46Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_2_46Models = new List<FunctdsecuL_2_46Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_2_46Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.open_posi_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_DATE_INT);
                    reqCommand.combo_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_CODE_STR);
                    reqCommand.combo_copies = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_COPIES_FLOAT);
                    reqCommand.combo_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_STATUS_STR);
                    reqCommand.combo_cost = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_COST_FLOAT);
                    reqCommand.combo_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_MARKET_VALUE_FLOAT);
                    reqCommand.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    reqCommand.sum_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SUM_REALIZE_PANDL_FLOAT);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdsecuL_2_46Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_2_46Models;
        }
 
        //逻辑_交易证券_账户_查询历史组合收益
        public static List<FunctdsecuL_2_47Model> GetFunctdsecuL_2_47Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_2_47Models = new List<FunctdsecuL_2_47Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_2_47Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.open_posi_date = packer.GetIntbyName("open_posi_date", i);
                reqCommand.combo_code = packer.GetStrbyName("combo_code", i);
                reqCommand.combo_copies = packer.GetDoublebyName("combo_copies", i);
                reqCommand.combo_status = packer.GetStrbyName("combo_status", i);
                reqCommand.combo_cost = packer.GetDoublebyName("combo_cost", i);
                reqCommand.combo_market_value = packer.GetDoublebyName("combo_market_value", i);
                reqCommand.realize_pandl = packer.GetDoublebyName("realize_pandl", i);
                reqCommand.sum_realize_pandl = packer.GetDoublebyName("sum_realize_pandl", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdsecuL_2_47Models.Add(reqCommand);
            }
            return FunctdsecuL_2_47Models;
        }
 
        //逻辑_交易证券_账户_查询历史组合收益
        public static List<FunctdsecuL_2_47Model> GetFunctdsecuL_2_47Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_2_47Models = new List<FunctdsecuL_2_47Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_2_47Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.open_posi_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_DATE_INT);
                    reqCommand.combo_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_CODE_STR);
                    reqCommand.combo_copies = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_COPIES_FLOAT);
                    reqCommand.combo_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_STATUS_STR);
                    reqCommand.combo_cost = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_COST_FLOAT);
                    reqCommand.combo_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_MARKET_VALUE_FLOAT);
                    reqCommand.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    reqCommand.sum_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SUM_REALIZE_PANDL_FLOAT);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdsecuL_2_47Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_2_47Models;
        }
 
        //逻辑_交易证券_账户_查询组合持仓汇总
        public static List<FunctdsecuL_2_48Model> GetFunctdsecuL_2_48Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_2_48Models = new List<FunctdsecuL_2_48Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_2_48Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.combo_code = packer.GetStrbyName("combo_code", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.curr_qty = packer.GetDoublebyName("curr_qty", i);
                reqCommand.posi_qty = packer.GetDoublebyName("posi_qty", i);
                reqCommand.frozen_qty = packer.GetDoublebyName("frozen_qty", i);
                reqCommand.unfroz_qty = packer.GetDoublebyName("unfroz_qty", i);
                reqCommand.pre_settle_qty = packer.GetDoublebyName("pre_settle_qty", i);
                reqCommand.trade_frozen_qty = packer.GetDoublebyName("trade_frozen_qty", i);
                reqCommand.trade_unfroz_qty = packer.GetDoublebyName("trade_unfroz_qty", i);
                reqCommand.trade_capt_qty = packer.GetDoublebyName("trade_capt_qty", i);
                reqCommand.trade_releas_qty = packer.GetDoublebyName("trade_releas_qty", i);
                reqCommand.strike_capt_qty = packer.GetDoublebyName("strike_capt_qty", i);
                reqCommand.strike_releas_qty = packer.GetDoublebyName("strike_releas_qty", i);
                reqCommand.strike_frozen_qty = packer.GetDoublebyName("strike_frozen_qty", i);
                reqCommand.strike_unfroz_qty = packer.GetDoublebyName("strike_unfroz_qty", i);
                reqCommand.realize_pandl = packer.GetDoublebyName("realize_pandl", i);
                reqCommand.cost_amt = packer.GetDoublebyName("cost_amt", i);
                reqCommand.intrst_cost_amt = packer.GetDoublebyName("intrst_cost_amt", i);
                reqCommand.intrst_pandl = packer.GetDoublebyName("intrst_pandl", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdsecuL_2_48Models.Add(reqCommand);
            }
            return FunctdsecuL_2_48Models;
        }
 
        //逻辑_交易证券_账户_查询组合持仓汇总
        public static List<FunctdsecuL_2_48Model> GetFunctdsecuL_2_48Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_2_48Models = new List<FunctdsecuL_2_48Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_2_48Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    reqCommand.combo_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_CODE_STR);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    reqCommand.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    reqCommand.frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_QTY_FLOAT);
                    reqCommand.unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_QTY_FLOAT);
                    reqCommand.pre_settle_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SETTLE_QTY_FLOAT);
                    reqCommand.trade_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_FROZEN_QTY_FLOAT);
                    reqCommand.trade_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_UNFROZ_QTY_FLOAT);
                    reqCommand.trade_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CAPT_QTY_FLOAT);
                    reqCommand.trade_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_RELEAS_QTY_FLOAT);
                    reqCommand.strike_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_CAPT_QTY_FLOAT);
                    reqCommand.strike_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_QTY_FLOAT);
                    reqCommand.strike_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_FROZEN_QTY_FLOAT);
                    reqCommand.strike_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_UNFROZ_QTY_FLOAT);
                    reqCommand.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    reqCommand.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                    reqCommand.intrst_cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_COST_AMT_FLOAT);
                    reqCommand.intrst_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_PANDL_FLOAT);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdsecuL_2_48Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_2_48Models;
        }
 
        //逻辑_交易证券_账户_查询历史组合持仓汇总
        public static List<FunctdsecuL_2_49Model> GetFunctdsecuL_2_49Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_2_49Models = new List<FunctdsecuL_2_49Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_2_49Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.combo_code = packer.GetStrbyName("combo_code", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.curr_qty = packer.GetDoublebyName("curr_qty", i);
                reqCommand.posi_qty = packer.GetDoublebyName("posi_qty", i);
                reqCommand.frozen_qty = packer.GetDoublebyName("frozen_qty", i);
                reqCommand.unfroz_qty = packer.GetDoublebyName("unfroz_qty", i);
                reqCommand.pre_settle_qty = packer.GetDoublebyName("pre_settle_qty", i);
                reqCommand.trade_frozen_qty = packer.GetDoublebyName("trade_frozen_qty", i);
                reqCommand.trade_unfroz_qty = packer.GetDoublebyName("trade_unfroz_qty", i);
                reqCommand.trade_capt_qty = packer.GetDoublebyName("trade_capt_qty", i);
                reqCommand.trade_releas_qty = packer.GetDoublebyName("trade_releas_qty", i);
                reqCommand.strike_capt_qty = packer.GetDoublebyName("strike_capt_qty", i);
                reqCommand.strike_releas_qty = packer.GetDoublebyName("strike_releas_qty", i);
                reqCommand.strike_frozen_qty = packer.GetDoublebyName("strike_frozen_qty", i);
                reqCommand.strike_unfroz_qty = packer.GetDoublebyName("strike_unfroz_qty", i);
                reqCommand.realize_pandl = packer.GetDoublebyName("realize_pandl", i);
                reqCommand.cost_amt = packer.GetDoublebyName("cost_amt", i);
                reqCommand.intrst_cost_amt = packer.GetDoublebyName("intrst_cost_amt", i);
                reqCommand.intrst_pandl = packer.GetDoublebyName("intrst_pandl", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdsecuL_2_49Models.Add(reqCommand);
            }
            return FunctdsecuL_2_49Models;
        }
 
        //逻辑_交易证券_账户_查询历史组合持仓汇总
        public static List<FunctdsecuL_2_49Model> GetFunctdsecuL_2_49Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_2_49Models = new List<FunctdsecuL_2_49Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_2_49Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    reqCommand.combo_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_CODE_STR);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    reqCommand.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    reqCommand.frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_QTY_FLOAT);
                    reqCommand.unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_QTY_FLOAT);
                    reqCommand.pre_settle_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SETTLE_QTY_FLOAT);
                    reqCommand.trade_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_FROZEN_QTY_FLOAT);
                    reqCommand.trade_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_UNFROZ_QTY_FLOAT);
                    reqCommand.trade_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CAPT_QTY_FLOAT);
                    reqCommand.trade_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_RELEAS_QTY_FLOAT);
                    reqCommand.strike_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_CAPT_QTY_FLOAT);
                    reqCommand.strike_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_QTY_FLOAT);
                    reqCommand.strike_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_FROZEN_QTY_FLOAT);
                    reqCommand.strike_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_UNFROZ_QTY_FLOAT);
                    reqCommand.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    reqCommand.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                    reqCommand.intrst_cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_COST_AMT_FLOAT);
                    reqCommand.intrst_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_PANDL_FLOAT);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdsecuL_2_49Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_2_49Models;
        }
 
        //逻辑_交易证券_账户_查询组合收益汇总
        public static List<FunctdsecuL_2_50Model> GetFunctdsecuL_2_50Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_2_50Models = new List<FunctdsecuL_2_50Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_2_50Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.combo_code = packer.GetStrbyName("combo_code", i);
                reqCommand.combo_copies = packer.GetDoublebyName("combo_copies", i);
                reqCommand.combo_status = packer.GetStrbyName("combo_status", i);
                reqCommand.combo_cost = packer.GetDoublebyName("combo_cost", i);
                reqCommand.combo_market_value = packer.GetDoublebyName("combo_market_value", i);
                reqCommand.realize_pandl = packer.GetDoublebyName("realize_pandl", i);
                reqCommand.sum_realize_pandl = packer.GetDoublebyName("sum_realize_pandl", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdsecuL_2_50Models.Add(reqCommand);
            }
            return FunctdsecuL_2_50Models;
        }
 
        //逻辑_交易证券_账户_查询组合收益汇总
        public static List<FunctdsecuL_2_50Model> GetFunctdsecuL_2_50Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_2_50Models = new List<FunctdsecuL_2_50Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_2_50Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.combo_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_CODE_STR);
                    reqCommand.combo_copies = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_COPIES_FLOAT);
                    reqCommand.combo_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_STATUS_STR);
                    reqCommand.combo_cost = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_COST_FLOAT);
                    reqCommand.combo_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_MARKET_VALUE_FLOAT);
                    reqCommand.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    reqCommand.sum_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SUM_REALIZE_PANDL_FLOAT);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdsecuL_2_50Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_2_50Models;
        }
 
        //逻辑_交易证券_账户_查询历史组合收益汇总
        public static List<FunctdsecuL_2_60Model> GetFunctdsecuL_2_60Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_2_60Models = new List<FunctdsecuL_2_60Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_2_60Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.combo_code = packer.GetStrbyName("combo_code", i);
                reqCommand.combo_copies = packer.GetDoublebyName("combo_copies", i);
                reqCommand.combo_status = packer.GetStrbyName("combo_status", i);
                reqCommand.combo_cost = packer.GetDoublebyName("combo_cost", i);
                reqCommand.combo_market_value = packer.GetDoublebyName("combo_market_value", i);
                reqCommand.realize_pandl = packer.GetDoublebyName("realize_pandl", i);
                reqCommand.sum_realize_pandl = packer.GetDoublebyName("sum_realize_pandl", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdsecuL_2_60Models.Add(reqCommand);
            }
            return FunctdsecuL_2_60Models;
        }
 
        //逻辑_交易证券_账户_查询历史组合收益汇总
        public static List<FunctdsecuL_2_60Model> GetFunctdsecuL_2_60Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_2_60Models = new List<FunctdsecuL_2_60Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_2_60Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.combo_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_CODE_STR);
                    reqCommand.combo_copies = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_COPIES_FLOAT);
                    reqCommand.combo_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_STATUS_STR);
                    reqCommand.combo_cost = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_COST_FLOAT);
                    reqCommand.combo_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_MARKET_VALUE_FLOAT);
                    reqCommand.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    reqCommand.sum_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SUM_REALIZE_PANDL_FLOAT);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdsecuL_2_60Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_2_60Models;
        }
 
        //逻辑_交易证券_账户_查询N天期内可赎回数量
        public static List<FunctdsecuL_2_61Model> GetFunctdsecuL_2_61Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_2_61Models = new List<FunctdsecuL_2_61Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_2_61Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.stat_qty = packer.GetDoublebyName("stat_qty", i);
 
                FunctdsecuL_2_61Models.Add(reqCommand);
            }
            return FunctdsecuL_2_61Models;
        }
 
        //逻辑_交易证券_账户_查询N天期内可赎回数量
        public static List<FunctdsecuL_2_61Model> GetFunctdsecuL_2_61Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_2_61Models = new List<FunctdsecuL_2_61Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_2_61Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.stat_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STAT_QTY_FLOAT);
                FunctdsecuL_2_61Models.Add(reqCommand);
            }
            return FunctdsecuL_2_61Models;
        }
 
        //逻辑_交易证券_账户_查询交易组融资融券保证金计算结果集
        public static List<FunctdsecuL_2_64Model> GetFunctdsecuL_2_64Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_2_64Models = new List<FunctdsecuL_2_64Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_2_64Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.converted_margin = packer.GetDoublebyName("converted_margin", i);
                reqCommand.fina_converted_pandl = packer.GetDoublebyName("fina_converted_pandl", i);
                reqCommand.loan_converted_pandl = packer.GetDoublebyName("loan_converted_pandl", i);
                reqCommand.fina_capt_margin = packer.GetDoublebyName("fina_capt_margin", i);
                reqCommand.loan_capt_margin = packer.GetDoublebyName("loan_capt_margin", i);
                reqCommand.keep_guarantee_ratio = packer.GetDoublebyName("keep_guarantee_ratio", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdsecuL_2_64Models.Add(reqCommand);
            }
            return FunctdsecuL_2_64Models;
        }
 
        //逻辑_交易证券_账户_查询交易组融资融券保证金计算结果集
        public static List<FunctdsecuL_2_64Model> GetFunctdsecuL_2_64Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_2_64Models = new List<FunctdsecuL_2_64Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_2_64Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.converted_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CONVERTED_MARGIN_FLOAT);
                    reqCommand.fina_converted_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_CONVERTED_PANDL_FLOAT);
                    reqCommand.loan_converted_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_CONVERTED_PANDL_FLOAT);
                    reqCommand.fina_capt_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_CAPT_MARGIN_FLOAT);
                    reqCommand.loan_capt_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_CAPT_MARGIN_FLOAT);
                    reqCommand.keep_guarantee_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_KEEP_GUARANTEE_RATIO_FLOAT);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdsecuL_2_64Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_2_64Models;
        }
 
        //逻辑_交易证券_账户_查询资产账户融资融券保证金计算结果集
        public static List<FunctdsecuL_2_65Model> GetFunctdsecuL_2_65Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_2_65Models = new List<FunctdsecuL_2_65Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_2_65Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.converted_margin = packer.GetDoublebyName("converted_margin", i);
                reqCommand.fina_converted_pandl = packer.GetDoublebyName("fina_converted_pandl", i);
                reqCommand.loan_converted_pandl = packer.GetDoublebyName("loan_converted_pandl", i);
                reqCommand.fina_capt_margin = packer.GetDoublebyName("fina_capt_margin", i);
                reqCommand.loan_capt_margin = packer.GetDoublebyName("loan_capt_margin", i);
                reqCommand.keep_guarantee_ratio = packer.GetDoublebyName("keep_guarantee_ratio", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdsecuL_2_65Models.Add(reqCommand);
            }
            return FunctdsecuL_2_65Models;
        }
 
        //逻辑_交易证券_账户_查询资产账户融资融券保证金计算结果集
        public static List<FunctdsecuL_2_65Model> GetFunctdsecuL_2_65Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_2_65Models = new List<FunctdsecuL_2_65Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_2_65Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.converted_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CONVERTED_MARGIN_FLOAT);
                    reqCommand.fina_converted_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_CONVERTED_PANDL_FLOAT);
                    reqCommand.loan_converted_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_CONVERTED_PANDL_FLOAT);
                    reqCommand.fina_capt_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_CAPT_MARGIN_FLOAT);
                    reqCommand.loan_capt_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_CAPT_MARGIN_FLOAT);
                    reqCommand.keep_guarantee_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_KEEP_GUARANTEE_RATIO_FLOAT);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdsecuL_2_65Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_2_65Models;
        }
 
        //逻辑_交易证券_账户_查询交易组业务资金负债结果集
        public static List<FunctdsecuL_2_66Model> GetFunctdsecuL_2_66Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_2_66Models = new List<FunctdsecuL_2_66Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_2_66Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.debt_loan_sell_strike_amt = packer.GetDoublebyName("debt_loan_sell_strike_amt", i);
                reqCommand.debt_strike_fee = packer.GetDoublebyName("debt_strike_fee", i);
                reqCommand.loan_return_strike_amt = packer.GetDoublebyName("loan_return_strike_amt", i);
                reqCommand.loan_return_order_amt = packer.GetDoublebyName("loan_return_order_amt", i);
                reqCommand.loan_return_comm_amt = packer.GetDoublebyName("loan_return_comm_amt", i);
                reqCommand.return_strike_fee = packer.GetDoublebyName("return_strike_fee", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdsecuL_2_66Models.Add(reqCommand);
            }
            return FunctdsecuL_2_66Models;
        }
 
        //逻辑_交易证券_账户_查询交易组业务资金负债结果集
        public static List<FunctdsecuL_2_66Model> GetFunctdsecuL_2_66Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_2_66Models = new List<FunctdsecuL_2_66Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_2_66Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.debt_loan_sell_strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_LOAN_SELL_STRIKE_AMT_FLOAT);
                    reqCommand.debt_strike_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_STRIKE_FEE_FLOAT);
                    reqCommand.loan_return_strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_RETURN_STRIKE_AMT_FLOAT);
                    reqCommand.loan_return_order_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_RETURN_ORDER_AMT_FLOAT);
                    reqCommand.loan_return_comm_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_RETURN_COMM_AMT_FLOAT);
                    reqCommand.return_strike_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RETURN_STRIKE_FEE_FLOAT);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdsecuL_2_66Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_2_66Models;
        }
 
        //逻辑_交易证券_账户_查询资产账户业务资金负债结果集
        public static List<FunctdsecuL_2_67Model> GetFunctdsecuL_2_67Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_2_67Models = new List<FunctdsecuL_2_67Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_2_67Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.debt_loan_sell_strike_amt = packer.GetDoublebyName("debt_loan_sell_strike_amt", i);
                reqCommand.debt_strike_fee = packer.GetDoublebyName("debt_strike_fee", i);
                reqCommand.loan_return_strike_amt = packer.GetDoublebyName("loan_return_strike_amt", i);
                reqCommand.loan_return_order_amt = packer.GetDoublebyName("loan_return_order_amt", i);
                reqCommand.loan_return_comm_amt = packer.GetDoublebyName("loan_return_comm_amt", i);
                reqCommand.return_strike_fee = packer.GetDoublebyName("return_strike_fee", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdsecuL_2_67Models.Add(reqCommand);
            }
            return FunctdsecuL_2_67Models;
        }
 
        //逻辑_交易证券_账户_查询资产账户业务资金负债结果集
        public static List<FunctdsecuL_2_67Model> GetFunctdsecuL_2_67Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_2_67Models = new List<FunctdsecuL_2_67Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_2_67Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.debt_loan_sell_strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_LOAN_SELL_STRIKE_AMT_FLOAT);
                    reqCommand.debt_strike_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_STRIKE_FEE_FLOAT);
                    reqCommand.loan_return_strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_RETURN_STRIKE_AMT_FLOAT);
                    reqCommand.loan_return_order_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_RETURN_ORDER_AMT_FLOAT);
                    reqCommand.loan_return_comm_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_RETURN_COMM_AMT_FLOAT);
                    reqCommand.return_strike_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RETURN_STRIKE_FEE_FLOAT);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdsecuL_2_67Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_2_67Models;
        }
 
        //逻辑_交易证券_账户_查询交易组业务持仓负债结果集
        public static List<FunctdsecuL_2_68Model> GetFunctdsecuL_2_68Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_2_68Models = new List<FunctdsecuL_2_68Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_2_68Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.asset_type = packer.GetIntbyName("asset_type", i);
                reqCommand.invest_type = packer.GetIntbyName("invest_type", i);
                reqCommand.debt_type = packer.GetIntbyName("debt_type", i);
                reqCommand.debt_fina_buy_strike_qty = packer.GetDoublebyName("debt_fina_buy_strike_qty", i);
                reqCommand.fina_return_strike_qty = packer.GetDoublebyName("fina_return_strike_qty", i);
                reqCommand.debt_loan_sell_strike_qty = packer.GetDoublebyName("debt_loan_sell_strike_qty", i);
                reqCommand.loan_return_strike_qty = packer.GetDoublebyName("loan_return_strike_qty", i);
                reqCommand.debt_fina_buy_order_qty = packer.GetDoublebyName("debt_fina_buy_order_qty", i);
                reqCommand.fina_return_order_qty = packer.GetDoublebyName("fina_return_order_qty", i);
                reqCommand.debt_loan_sell_order_qty = packer.GetDoublebyName("debt_loan_sell_order_qty", i);
                reqCommand.loan_return_order_qty = packer.GetDoublebyName("loan_return_order_qty", i);
                reqCommand.debt_fina_buy_comm_qty = packer.GetDoublebyName("debt_fina_buy_comm_qty", i);
                reqCommand.fina_return_comm_qty = packer.GetDoublebyName("fina_return_comm_qty", i);
                reqCommand.debt_loan_sell_comm_qty = packer.GetDoublebyName("debt_loan_sell_comm_qty", i);
                reqCommand.loan_return_comm_qty = packer.GetDoublebyName("loan_return_comm_qty", i);
                reqCommand.debt_fina_buy_strike_amt = packer.GetDoublebyName("debt_fina_buy_strike_amt", i);
                reqCommand.fina_return_strike_amt = packer.GetDoublebyName("fina_return_strike_amt", i);
                reqCommand.debt_loan_sell_strike_amt = packer.GetDoublebyName("debt_loan_sell_strike_amt", i);
                reqCommand.loan_return_strike_amt = packer.GetDoublebyName("loan_return_strike_amt", i);
                reqCommand.debt_fina_buy_order_amt = packer.GetDoublebyName("debt_fina_buy_order_amt", i);
                reqCommand.fina_return_order_amt = packer.GetDoublebyName("fina_return_order_amt", i);
                reqCommand.debt_loan_sell_order_amt = packer.GetDoublebyName("debt_loan_sell_order_amt", i);
                reqCommand.loan_return_order_amt = packer.GetDoublebyName("loan_return_order_amt", i);
                reqCommand.debt_fina_buy_comm_amt = packer.GetDoublebyName("debt_fina_buy_comm_amt", i);
                reqCommand.fina_return_comm_amt = packer.GetDoublebyName("fina_return_comm_amt", i);
                reqCommand.debt_loan_sell_comm_amt = packer.GetDoublebyName("debt_loan_sell_comm_amt", i);
                reqCommand.loan_return_comm_amt = packer.GetDoublebyName("loan_return_comm_amt", i);
                reqCommand.debt_strike_fee = packer.GetDoublebyName("debt_strike_fee", i);
                reqCommand.return_strike_fee = packer.GetDoublebyName("return_strike_fee", i);
                reqCommand.debt_interest = packer.GetDoublebyName("debt_interest", i);
                reqCommand.return_interest_amt = packer.GetDoublebyName("return_interest_amt", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdsecuL_2_68Models.Add(reqCommand);
            }
            return FunctdsecuL_2_68Models;
        }
 
        //逻辑_交易证券_账户_查询交易组业务持仓负债结果集
        public static List<FunctdsecuL_2_68Model> GetFunctdsecuL_2_68Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_2_68Models = new List<FunctdsecuL_2_68Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_2_68Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    reqCommand.invest_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INVEST_TYPE_INT);
                    reqCommand.debt_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_TYPE_INT);
                    reqCommand.debt_fina_buy_strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_FINA_BUY_STRIKE_QTY_FLOAT);
                    reqCommand.fina_return_strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_RETURN_STRIKE_QTY_FLOAT);
                    reqCommand.debt_loan_sell_strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_LOAN_SELL_STRIKE_QTY_FLOAT);
                    reqCommand.loan_return_strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_RETURN_STRIKE_QTY_FLOAT);
                    reqCommand.debt_fina_buy_order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_FINA_BUY_ORDER_QTY_FLOAT);
                    reqCommand.fina_return_order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_RETURN_ORDER_QTY_FLOAT);
                    reqCommand.debt_loan_sell_order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_LOAN_SELL_ORDER_QTY_FLOAT);
                    reqCommand.loan_return_order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_RETURN_ORDER_QTY_FLOAT);
                    reqCommand.debt_fina_buy_comm_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_FINA_BUY_COMM_QTY_FLOAT);
                    reqCommand.fina_return_comm_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_RETURN_COMM_QTY_FLOAT);
                    reqCommand.debt_loan_sell_comm_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_LOAN_SELL_COMM_QTY_FLOAT);
                    reqCommand.loan_return_comm_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_RETURN_COMM_QTY_FLOAT);
                    reqCommand.debt_fina_buy_strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_FINA_BUY_STRIKE_AMT_FLOAT);
                    reqCommand.fina_return_strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_RETURN_STRIKE_AMT_FLOAT);
                    reqCommand.debt_loan_sell_strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_LOAN_SELL_STRIKE_AMT_FLOAT);
                    reqCommand.loan_return_strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_RETURN_STRIKE_AMT_FLOAT);
                    reqCommand.debt_fina_buy_order_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_FINA_BUY_ORDER_AMT_FLOAT);
                    reqCommand.fina_return_order_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_RETURN_ORDER_AMT_FLOAT);
                    reqCommand.debt_loan_sell_order_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_LOAN_SELL_ORDER_AMT_FLOAT);
                    reqCommand.loan_return_order_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_RETURN_ORDER_AMT_FLOAT);
                    reqCommand.debt_fina_buy_comm_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_FINA_BUY_COMM_AMT_FLOAT);
                    reqCommand.fina_return_comm_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_RETURN_COMM_AMT_FLOAT);
                    reqCommand.debt_loan_sell_comm_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_LOAN_SELL_COMM_AMT_FLOAT);
                    reqCommand.loan_return_comm_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_RETURN_COMM_AMT_FLOAT);
                    reqCommand.debt_strike_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_STRIKE_FEE_FLOAT);
                    reqCommand.return_strike_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RETURN_STRIKE_FEE_FLOAT);
                    reqCommand.debt_interest = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_INTEREST_FLOAT);
                    reqCommand.return_interest_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RETURN_INTEREST_AMT_FLOAT);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdsecuL_2_68Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_2_68Models;
        }
 
        //逻辑_交易证券_账户_查询资产账户业务持仓负债结果集
        public static List<FunctdsecuL_2_69Model> GetFunctdsecuL_2_69Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_2_69Models = new List<FunctdsecuL_2_69Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_2_69Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.asset_type = packer.GetIntbyName("asset_type", i);
                reqCommand.invest_type = packer.GetIntbyName("invest_type", i);
                reqCommand.debt_type = packer.GetIntbyName("debt_type", i);
                reqCommand.debt_fina_buy_strike_qty = packer.GetDoublebyName("debt_fina_buy_strike_qty", i);
                reqCommand.fina_return_strike_qty = packer.GetDoublebyName("fina_return_strike_qty", i);
                reqCommand.debt_loan_sell_strike_qty = packer.GetDoublebyName("debt_loan_sell_strike_qty", i);
                reqCommand.loan_return_strike_qty = packer.GetDoublebyName("loan_return_strike_qty", i);
                reqCommand.debt_fina_buy_order_qty = packer.GetDoublebyName("debt_fina_buy_order_qty", i);
                reqCommand.fina_return_order_qty = packer.GetDoublebyName("fina_return_order_qty", i);
                reqCommand.debt_loan_sell_order_qty = packer.GetDoublebyName("debt_loan_sell_order_qty", i);
                reqCommand.loan_return_order_qty = packer.GetDoublebyName("loan_return_order_qty", i);
                reqCommand.debt_fina_buy_comm_qty = packer.GetDoublebyName("debt_fina_buy_comm_qty", i);
                reqCommand.fina_return_comm_qty = packer.GetDoublebyName("fina_return_comm_qty", i);
                reqCommand.debt_loan_sell_comm_qty = packer.GetDoublebyName("debt_loan_sell_comm_qty", i);
                reqCommand.loan_return_comm_qty = packer.GetDoublebyName("loan_return_comm_qty", i);
                reqCommand.debt_fina_buy_strike_amt = packer.GetDoublebyName("debt_fina_buy_strike_amt", i);
                reqCommand.fina_return_strike_amt = packer.GetDoublebyName("fina_return_strike_amt", i);
                reqCommand.debt_loan_sell_strike_amt = packer.GetDoublebyName("debt_loan_sell_strike_amt", i);
                reqCommand.loan_return_strike_amt = packer.GetDoublebyName("loan_return_strike_amt", i);
                reqCommand.debt_fina_buy_order_amt = packer.GetDoublebyName("debt_fina_buy_order_amt", i);
                reqCommand.fina_return_order_amt = packer.GetDoublebyName("fina_return_order_amt", i);
                reqCommand.debt_loan_sell_order_amt = packer.GetDoublebyName("debt_loan_sell_order_amt", i);
                reqCommand.loan_return_order_amt = packer.GetDoublebyName("loan_return_order_amt", i);
                reqCommand.debt_fina_buy_comm_amt = packer.GetDoublebyName("debt_fina_buy_comm_amt", i);
                reqCommand.fina_return_comm_amt = packer.GetDoublebyName("fina_return_comm_amt", i);
                reqCommand.debt_loan_sell_comm_amt = packer.GetDoublebyName("debt_loan_sell_comm_amt", i);
                reqCommand.loan_return_comm_amt = packer.GetDoublebyName("loan_return_comm_amt", i);
                reqCommand.debt_strike_fee = packer.GetDoublebyName("debt_strike_fee", i);
                reqCommand.return_strike_fee = packer.GetDoublebyName("return_strike_fee", i);
                reqCommand.debt_interest = packer.GetDoublebyName("debt_interest", i);
                reqCommand.return_interest_amt = packer.GetDoublebyName("return_interest_amt", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdsecuL_2_69Models.Add(reqCommand);
            }
            return FunctdsecuL_2_69Models;
        }
 
        //逻辑_交易证券_账户_查询资产账户业务持仓负债结果集
        public static List<FunctdsecuL_2_69Model> GetFunctdsecuL_2_69Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_2_69Models = new List<FunctdsecuL_2_69Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_2_69Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    reqCommand.invest_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INVEST_TYPE_INT);
                    reqCommand.debt_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_TYPE_INT);
                    reqCommand.debt_fina_buy_strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_FINA_BUY_STRIKE_QTY_FLOAT);
                    reqCommand.fina_return_strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_RETURN_STRIKE_QTY_FLOAT);
                    reqCommand.debt_loan_sell_strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_LOAN_SELL_STRIKE_QTY_FLOAT);
                    reqCommand.loan_return_strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_RETURN_STRIKE_QTY_FLOAT);
                    reqCommand.debt_fina_buy_order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_FINA_BUY_ORDER_QTY_FLOAT);
                    reqCommand.fina_return_order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_RETURN_ORDER_QTY_FLOAT);
                    reqCommand.debt_loan_sell_order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_LOAN_SELL_ORDER_QTY_FLOAT);
                    reqCommand.loan_return_order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_RETURN_ORDER_QTY_FLOAT);
                    reqCommand.debt_fina_buy_comm_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_FINA_BUY_COMM_QTY_FLOAT);
                    reqCommand.fina_return_comm_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_RETURN_COMM_QTY_FLOAT);
                    reqCommand.debt_loan_sell_comm_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_LOAN_SELL_COMM_QTY_FLOAT);
                    reqCommand.loan_return_comm_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_RETURN_COMM_QTY_FLOAT);
                    reqCommand.debt_fina_buy_strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_FINA_BUY_STRIKE_AMT_FLOAT);
                    reqCommand.fina_return_strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_RETURN_STRIKE_AMT_FLOAT);
                    reqCommand.debt_loan_sell_strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_LOAN_SELL_STRIKE_AMT_FLOAT);
                    reqCommand.loan_return_strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_RETURN_STRIKE_AMT_FLOAT);
                    reqCommand.debt_fina_buy_order_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_FINA_BUY_ORDER_AMT_FLOAT);
                    reqCommand.fina_return_order_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_RETURN_ORDER_AMT_FLOAT);
                    reqCommand.debt_loan_sell_order_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_LOAN_SELL_ORDER_AMT_FLOAT);
                    reqCommand.loan_return_order_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_RETURN_ORDER_AMT_FLOAT);
                    reqCommand.debt_fina_buy_comm_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_FINA_BUY_COMM_AMT_FLOAT);
                    reqCommand.fina_return_comm_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_RETURN_COMM_AMT_FLOAT);
                    reqCommand.debt_loan_sell_comm_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_LOAN_SELL_COMM_AMT_FLOAT);
                    reqCommand.loan_return_comm_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_RETURN_COMM_AMT_FLOAT);
                    reqCommand.debt_strike_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_STRIKE_FEE_FLOAT);
                    reqCommand.return_strike_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RETURN_STRIKE_FEE_FLOAT);
                    reqCommand.debt_interest = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_INTEREST_FLOAT);
                    reqCommand.return_interest_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RETURN_INTEREST_AMT_FLOAT);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdsecuL_2_69Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_2_69Models;
        }
 
        //逻辑_交易证券_账户_查询交易组负债明细结果集
        public static List<FunctdsecuL_2_70Model> GetFunctdsecuL_2_70Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_2_70Models = new List<FunctdsecuL_2_70Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_2_70Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.asset_type = packer.GetIntbyName("asset_type", i);
                reqCommand.debt_type = packer.GetIntbyName("debt_type", i);
                reqCommand.strike_qty = packer.GetDoublebyName("strike_qty", i);
                reqCommand.strike_amt = packer.GetDoublebyName("strike_amt", i);
                reqCommand.strike_fee = packer.GetDoublebyName("strike_fee", i);
                reqCommand.debt_order_no = packer.GetIntbyName("debt_order_no", i);
                reqCommand.report_no = packer.GetStrbyName("report_no", i);
                reqCommand.order_date = packer.GetIntbyName("order_date", i);
                reqCommand.order_time = packer.GetIntbyName("order_time", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.order_price = packer.GetDoublebyName("order_price", i);
                reqCommand.order_qty = packer.GetDoublebyName("order_qty", i);
                reqCommand.debt_amt = packer.GetDoublebyName("debt_amt", i);
                reqCommand.debt_qty = packer.GetDoublebyName("debt_qty", i);
                reqCommand.debt_fee = packer.GetDoublebyName("debt_fee", i);
                reqCommand.debt_interest = packer.GetDoublebyName("debt_interest", i);
                reqCommand.intrst_base_amt = packer.GetDoublebyName("intrst_base_amt", i);
                reqCommand.debt_return_amt = packer.GetDoublebyName("debt_return_amt", i);
                reqCommand.debt_return_qty = packer.GetDoublebyName("debt_return_qty", i);
                reqCommand.return_interest_amt = packer.GetDoublebyName("return_interest_amt", i);
                reqCommand.debt_status = packer.GetIntbyName("debt_status", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdsecuL_2_70Models.Add(reqCommand);
            }
            return FunctdsecuL_2_70Models;
        }
 
        //逻辑_交易证券_账户_查询交易组负债明细结果集
        public static List<FunctdsecuL_2_70Model> GetFunctdsecuL_2_70Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_2_70Models = new List<FunctdsecuL_2_70Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_2_70Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    reqCommand.debt_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_TYPE_INT);
                    reqCommand.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    reqCommand.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    reqCommand.strike_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_FEE_FLOAT);
                    reqCommand.debt_order_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_ORDER_NO_INT);
                    reqCommand.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    reqCommand.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    reqCommand.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    reqCommand.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    reqCommand.debt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_AMT_FLOAT);
                    reqCommand.debt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_QTY_FLOAT);
                    reqCommand.debt_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_FEE_FLOAT);
                    reqCommand.debt_interest = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_INTEREST_FLOAT);
                    reqCommand.intrst_base_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_BASE_AMT_FLOAT);
                    reqCommand.debt_return_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_RETURN_AMT_FLOAT);
                    reqCommand.debt_return_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_RETURN_QTY_FLOAT);
                    reqCommand.return_interest_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RETURN_INTEREST_AMT_FLOAT);
                    reqCommand.debt_status = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_STATUS_INT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdsecuL_2_70Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_2_70Models;
        }
 
        //逻辑_交易证券_账户_根据操作员查询交易组资金
        public static List<FunctdsecuL_2_90Model> GetFunctdsecuL_2_90Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_2_90Models = new List<FunctdsecuL_2_90Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_2_90Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.update_date = packer.GetIntbyName("update_date", i);
                reqCommand.update_time = packer.GetIntbyName("update_time", i);
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
                reqCommand.trade_frozen_amt = packer.GetDoublebyName("trade_frozen_amt", i);
                reqCommand.trade_unfroz_amt = packer.GetDoublebyName("trade_unfroz_amt", i);
                reqCommand.trade_capt_amt = packer.GetDoublebyName("trade_capt_amt", i);
                reqCommand.trade_releas_amt = packer.GetDoublebyName("trade_releas_amt", i);
                reqCommand.strike_capt_amt = packer.GetDoublebyName("strike_capt_amt", i);
                reqCommand.strike_releas_amt = packer.GetDoublebyName("strike_releas_amt", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdsecuL_2_90Models.Add(reqCommand);
            }
            return FunctdsecuL_2_90Models;
        }
 
        //逻辑_交易证券_账户_根据操作员查询交易组资金
        public static List<FunctdsecuL_2_90Model> GetFunctdsecuL_2_90Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_2_90Models = new List<FunctdsecuL_2_90Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_2_90Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    reqCommand.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    reqCommand.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    reqCommand.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
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
                    reqCommand.trade_frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_FROZEN_AMT_FLOAT);
                    reqCommand.trade_unfroz_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_UNFROZ_AMT_FLOAT);
                    reqCommand.trade_capt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CAPT_AMT_FLOAT);
                    reqCommand.trade_releas_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_RELEAS_AMT_FLOAT);
                    reqCommand.strike_capt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_CAPT_AMT_FLOAT);
                    reqCommand.strike_releas_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_AMT_FLOAT);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdsecuL_2_90Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_2_90Models;
        }
 
        //逻辑_交易证券_账户_根据操作员查询交易组持仓
        public static List<FunctdsecuL_2_91Model> GetFunctdsecuL_2_91Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_2_91Models = new List<FunctdsecuL_2_91Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_2_91Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.update_date = packer.GetIntbyName("update_date", i);
                reqCommand.update_time = packer.GetIntbyName("update_time", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.begin_qty = packer.GetDoublebyName("begin_qty", i);
                reqCommand.curr_qty = packer.GetDoublebyName("curr_qty", i);
                reqCommand.frozen_qty = packer.GetDoublebyName("frozen_qty", i);
                reqCommand.unfroz_qty = packer.GetDoublebyName("unfroz_qty", i);
                reqCommand.comm_frozen_qty = packer.GetDoublebyName("comm_frozen_qty", i);
                reqCommand.comm_unfroz_qty = packer.GetDoublebyName("comm_unfroz_qty", i);
                reqCommand.comm_capt_qty = packer.GetDoublebyName("comm_capt_qty", i);
                reqCommand.comm_releas_qty = packer.GetDoublebyName("comm_releas_qty", i);
                reqCommand.trade_frozen_qty = packer.GetDoublebyName("trade_frozen_qty", i);
                reqCommand.trade_unfroz_qty = packer.GetDoublebyName("trade_unfroz_qty", i);
                reqCommand.trade_capt_qty = packer.GetDoublebyName("trade_capt_qty", i);
                reqCommand.trade_releas_qty = packer.GetDoublebyName("trade_releas_qty", i);
                reqCommand.strike_capt_qty = packer.GetDoublebyName("strike_capt_qty", i);
                reqCommand.strike_releas_qty = packer.GetDoublebyName("strike_releas_qty", i);
                reqCommand.strike_frozen_qty = packer.GetDoublebyName("strike_frozen_qty", i);
                reqCommand.strike_unfroz_qty = packer.GetDoublebyName("strike_unfroz_qty", i);
                reqCommand.cost_amt = packer.GetDoublebyName("cost_amt", i);
                reqCommand.intrst_cost_amt = packer.GetDoublebyName("intrst_cost_amt", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
                reqCommand.realize_pandl = packer.GetDoublebyName("realize_pandl", i);
                reqCommand.intrst_pandl = packer.GetDoublebyName("intrst_pandl", i);
 
                FunctdsecuL_2_91Models.Add(reqCommand);
            }
            return FunctdsecuL_2_91Models;
        }
 
        //逻辑_交易证券_账户_根据操作员查询交易组持仓
        public static List<FunctdsecuL_2_91Model> GetFunctdsecuL_2_91Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_2_91Models = new List<FunctdsecuL_2_91Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_2_91Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    reqCommand.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    reqCommand.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    reqCommand.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.begin_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_QTY_FLOAT);
                    reqCommand.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    reqCommand.frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_QTY_FLOAT);
                    reqCommand.unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_QTY_FLOAT);
                    reqCommand.comm_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_FROZEN_QTY_FLOAT);
                    reqCommand.comm_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_UNFROZ_QTY_FLOAT);
                    reqCommand.comm_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_CAPT_QTY_FLOAT);
                    reqCommand.comm_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_RELEAS_QTY_FLOAT);
                    reqCommand.trade_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_FROZEN_QTY_FLOAT);
                    reqCommand.trade_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_UNFROZ_QTY_FLOAT);
                    reqCommand.trade_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CAPT_QTY_FLOAT);
                    reqCommand.trade_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_RELEAS_QTY_FLOAT);
                    reqCommand.strike_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_CAPT_QTY_FLOAT);
                    reqCommand.strike_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_QTY_FLOAT);
                    reqCommand.strike_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_FROZEN_QTY_FLOAT);
                    reqCommand.strike_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_UNFROZ_QTY_FLOAT);
                    reqCommand.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                    reqCommand.intrst_cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_COST_AMT_FLOAT);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    reqCommand.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    reqCommand.intrst_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_PANDL_FLOAT);
                    FunctdsecuL_2_91Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_2_91Models;
        }
 
        //逻辑_交易证券_账户_查询资产账户负债明细结果集
        public static List<FunctdsecuL_2_92Model> GetFunctdsecuL_2_92Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_2_92Models = new List<FunctdsecuL_2_92Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_2_92Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.asset_type = packer.GetIntbyName("asset_type", i);
                reqCommand.debt_type = packer.GetIntbyName("debt_type", i);
                reqCommand.strike_qty = packer.GetDoublebyName("strike_qty", i);
                reqCommand.strike_amt = packer.GetDoublebyName("strike_amt", i);
                reqCommand.strike_fee = packer.GetDoublebyName("strike_fee", i);
                reqCommand.debt_order_no = packer.GetIntbyName("debt_order_no", i);
                reqCommand.report_no = packer.GetStrbyName("report_no", i);
                reqCommand.order_date = packer.GetIntbyName("order_date", i);
                reqCommand.order_time = packer.GetIntbyName("order_time", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.order_price = packer.GetDoublebyName("order_price", i);
                reqCommand.order_qty = packer.GetDoublebyName("order_qty", i);
                reqCommand.debt_amt = packer.GetDoublebyName("debt_amt", i);
                reqCommand.debt_qty = packer.GetDoublebyName("debt_qty", i);
                reqCommand.debt_fee = packer.GetDoublebyName("debt_fee", i);
                reqCommand.debt_interest = packer.GetDoublebyName("debt_interest", i);
                reqCommand.intrst_base_amt = packer.GetDoublebyName("intrst_base_amt", i);
                reqCommand.debt_return_amt = packer.GetDoublebyName("debt_return_amt", i);
                reqCommand.debt_return_qty = packer.GetDoublebyName("debt_return_qty", i);
                reqCommand.return_interest_amt = packer.GetDoublebyName("return_interest_amt", i);
                reqCommand.debt_status = packer.GetIntbyName("debt_status", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdsecuL_2_92Models.Add(reqCommand);
            }
            return FunctdsecuL_2_92Models;
        }
 
        //逻辑_交易证券_账户_查询资产账户负债明细结果集
        public static List<FunctdsecuL_2_92Model> GetFunctdsecuL_2_92Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_2_92Models = new List<FunctdsecuL_2_92Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_2_92Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    reqCommand.debt_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_TYPE_INT);
                    reqCommand.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    reqCommand.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    reqCommand.strike_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_FEE_FLOAT);
                    reqCommand.debt_order_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_ORDER_NO_INT);
                    reqCommand.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    reqCommand.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    reqCommand.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    reqCommand.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    reqCommand.debt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_AMT_FLOAT);
                    reqCommand.debt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_QTY_FLOAT);
                    reqCommand.debt_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_FEE_FLOAT);
                    reqCommand.debt_interest = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_INTEREST_FLOAT);
                    reqCommand.intrst_base_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_BASE_AMT_FLOAT);
                    reqCommand.debt_return_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_RETURN_AMT_FLOAT);
                    reqCommand.debt_return_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_RETURN_QTY_FLOAT);
                    reqCommand.return_interest_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RETURN_INTEREST_AMT_FLOAT);
                    reqCommand.debt_status = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_STATUS_INT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdsecuL_2_92Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_2_92Models;
        }
 
    }
}
