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

    public static class ProductSecuCapitalBack
    {
        //逻辑_产品证券_资金运维_查询资产账户内外资金差异记录
        public static List<FuncpdsecuL_10_1Model> GetFuncpdsecuL_10_1Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpdsecuL_10_1Models = new List<FuncpdsecuL_10_1Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpdsecuL_10_1Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.acco_curr_amt = packer.GetDoublebyName("acco_curr_amt", i);
                reqCommand.acco_avail_amt = packer.GetDoublebyName("acco_avail_amt", i);
                reqCommand.out_curr_amt = packer.GetDoublebyName("out_curr_amt", i);
                reqCommand.out_enable_amt = packer.GetDoublebyName("out_enable_amt", i);
                reqCommand.sys_avail_amt_diff = packer.GetDoublebyName("sys_avail_amt_diff", i);
                reqCommand.acco_curr_amt_diff = packer.GetDoublebyName("acco_curr_amt_diff", i);
                reqCommand.acco_avail_amt_diff = packer.GetDoublebyName("acco_avail_amt_diff", i);
                reqCommand.total_payab_amt = packer.GetDoublebyName("total_payab_amt", i);
                reqCommand.total_rece_amt = packer.GetDoublebyName("total_rece_amt", i);
                reqCommand.out_total_payab_amt = packer.GetDoublebyName("out_total_payab_amt", i);
                reqCommand.out_total_rece_amt = packer.GetDoublebyName("out_total_rece_amt", i);
                reqCommand.acco_total_payab_amt_diff = packer.GetDoublebyName("acco_total_payab_amt_diff", i);
                reqCommand.acco_total_rece_amt_diff = packer.GetDoublebyName("acco_total_rece_amt_diff", i);
                reqCommand.deal_flag = packer.GetIntbyName("deal_flag", i);
                reqCommand.asset_sync_flag = packer.GetIntbyName("asset_sync_flag", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncpdsecuL_10_1Models.Add(reqCommand);
            }
            return FuncpdsecuL_10_1Models;
        }
 
        //逻辑_产品证券_资金运维_查询资产账户内外资金差异记录
        public static List<FuncpdsecuL_10_1Model> GetFuncpdsecuL_10_1Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpdsecuL_10_1Models = new List<FuncpdsecuL_10_1Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpdsecuL_10_1Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.acco_curr_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_CURR_AMT_FLOAT);
                    reqCommand.acco_avail_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_AVAIL_AMT_FLOAT);
                    reqCommand.out_curr_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_CURR_AMT_FLOAT);
                    reqCommand.out_enable_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ENABLE_AMT_FLOAT);
                    reqCommand.sys_avail_amt_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SYS_AVAIL_AMT_DIFF_FLOAT);
                    reqCommand.acco_curr_amt_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_CURR_AMT_DIFF_FLOAT);
                    reqCommand.acco_avail_amt_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_AVAIL_AMT_DIFF_FLOAT);
                    reqCommand.total_payab_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_PAYAB_AMT_FLOAT);
                    reqCommand.total_rece_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_RECE_AMT_FLOAT);
                    reqCommand.out_total_payab_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_TOTAL_PAYAB_AMT_FLOAT);
                    reqCommand.out_total_rece_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_TOTAL_RECE_AMT_FLOAT);
                    reqCommand.acco_total_payab_amt_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_TOTAL_PAYAB_AMT_DIFF_FLOAT);
                    reqCommand.acco_total_rece_amt_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_TOTAL_RECE_AMT_DIFF_FLOAT);
                    reqCommand.deal_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_FLAG_INT);
                    reqCommand.asset_sync_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_SYNC_FLAG_INT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncpdsecuL_10_1Models.Add(reqCommand);
                }
            }
            return FuncpdsecuL_10_1Models;
        }
 
        //逻辑_产品证券_资金运维_处理资产账户内外资金差异记录
        public static List<FuncpdsecuL_10_2Model> GetFuncpdsecuL_10_2Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpdsecuL_10_2Models = new List<FuncpdsecuL_10_2Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpdsecuL_10_2Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
 
                FuncpdsecuL_10_2Models.Add(reqCommand);
            }
            return FuncpdsecuL_10_2Models;
        }
 
        //逻辑_产品证券_资金运维_处理资产账户内外资金差异记录
        public static List<FuncpdsecuL_10_2Model> GetFuncpdsecuL_10_2Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpdsecuL_10_2Models = new List<FuncpdsecuL_10_2Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncpdsecuL_10_2Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                FuncpdsecuL_10_2Models.Add(reqCommand);
            }
            return FuncpdsecuL_10_2Models;
        }
 
        //逻辑_产品证券_资金运维_查询估值外部资金
        public static List<FuncpdsecuL_10_4Model> GetFuncpdsecuL_10_4Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpdsecuL_10_4Models = new List<FuncpdsecuL_10_4Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpdsecuL_10_4Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.update_date = packer.GetIntbyName("update_date", i);
                reqCommand.update_time = packer.GetIntbyName("update_time", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.out_curr_amt = packer.GetDoublebyName("out_curr_amt", i);
                reqCommand.out_enable_amt = packer.GetDoublebyName("out_enable_amt", i);
                reqCommand.out_frozen_amt = packer.GetDoublebyName("out_frozen_amt", i);
                reqCommand.out_unfroz_amt = packer.GetDoublebyName("out_unfroz_amt", i);
 
                FuncpdsecuL_10_4Models.Add(reqCommand);
            }
            return FuncpdsecuL_10_4Models;
        }
 
        //逻辑_产品证券_资金运维_查询估值外部资金
        public static List<FuncpdsecuL_10_4Model> GetFuncpdsecuL_10_4Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpdsecuL_10_4Models = new List<FuncpdsecuL_10_4Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpdsecuL_10_4Model();
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
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.out_curr_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_CURR_AMT_FLOAT);
                    reqCommand.out_enable_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ENABLE_AMT_FLOAT);
                    reqCommand.out_frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_FROZEN_AMT_FLOAT);
                    reqCommand.out_unfroz_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_UNFROZ_AMT_FLOAT);
                    FuncpdsecuL_10_4Models.Add(reqCommand);
                }
            }
            return FuncpdsecuL_10_4Models;
        }
 
        //逻辑_产品证券_资金运维_查询外部资金
        public static List<FuncpdsecuL_10_5Model> GetFuncpdsecuL_10_5Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpdsecuL_10_5Models = new List<FuncpdsecuL_10_5Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpdsecuL_10_5Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.update_date = packer.GetIntbyName("update_date", i);
                reqCommand.update_time = packer.GetIntbyName("update_time", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.out_curr_amt = packer.GetDoublebyName("out_curr_amt", i);
                reqCommand.out_enable_amt = packer.GetDoublebyName("out_enable_amt", i);
                reqCommand.out_frozen_amt = packer.GetDoublebyName("out_frozen_amt", i);
                reqCommand.out_unfroz_amt = packer.GetDoublebyName("out_unfroz_amt", i);
                reqCommand.out_total_payab_amt = packer.GetDoublebyName("out_total_payab_amt", i);
                reqCommand.out_total_rece_amt = packer.GetDoublebyName("out_total_rece_amt", i);
 
                FuncpdsecuL_10_5Models.Add(reqCommand);
            }
            return FuncpdsecuL_10_5Models;
        }
 
        //逻辑_产品证券_资金运维_查询外部资金
        public static List<FuncpdsecuL_10_5Model> GetFuncpdsecuL_10_5Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpdsecuL_10_5Models = new List<FuncpdsecuL_10_5Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpdsecuL_10_5Model();
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
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.out_curr_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_CURR_AMT_FLOAT);
                    reqCommand.out_enable_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ENABLE_AMT_FLOAT);
                    reqCommand.out_frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_FROZEN_AMT_FLOAT);
                    reqCommand.out_unfroz_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_UNFROZ_AMT_FLOAT);
                    reqCommand.out_total_payab_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_TOTAL_PAYAB_AMT_FLOAT);
                    reqCommand.out_total_rece_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_TOTAL_RECE_AMT_FLOAT);
                    FuncpdsecuL_10_5Models.Add(reqCommand);
                }
            }
            return FuncpdsecuL_10_5Models;
        }
 
        //逻辑_产品证券_资金运维_查询交易组资金
        public static List<FuncpdsecuL_10_23Model> GetFuncpdsecuL_10_23Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpdsecuL_10_23Models = new List<FuncpdsecuL_10_23Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpdsecuL_10_23Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.update_date = packer.GetIntbyName("update_date", i);
                reqCommand.update_time = packer.GetIntbyName("update_time", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.begin_amt = packer.GetDoublebyName("begin_amt", i);
                reqCommand.curr_amt = packer.GetDoublebyName("curr_amt", i);
                reqCommand.frozen_amt = packer.GetDoublebyName("frozen_amt", i);
                reqCommand.unfroz_amt = packer.GetDoublebyName("unfroz_amt", i);
                reqCommand.pre_settle_amt = packer.GetDoublebyName("pre_settle_amt", i);
                reqCommand.shsz_avail_change_amt = packer.GetDoublebyName("shsz_avail_change_amt", i);
                reqCommand.hk_avail_change_amt = packer.GetDoublebyName("hk_avail_change_amt", i);
                reqCommand.amt_check_diff = packer.GetDoublebyName("amt_check_diff", i);
                reqCommand.T_hk_buy_total_amt = packer.GetDoublebyName("T_hk_buy_total_amt", i);
                reqCommand.T_hk_sell_total_amt = packer.GetDoublebyName("T_hk_sell_total_amt", i);
                reqCommand.T1_hk_buy_total_amt = packer.GetDoublebyName("T1_hk_buy_total_amt", i);
                reqCommand.T1_hk_sell_total_amt = packer.GetDoublebyName("T1_hk_sell_total_amt", i);
                reqCommand.total_rece_amt = packer.GetDoublebyName("total_rece_amt", i);
                reqCommand.total_payab_amt = packer.GetDoublebyName("total_payab_amt", i);
                reqCommand.total_change_amt = packer.GetDoublebyName("total_change_amt", i);
                reqCommand.realize_pandl = packer.GetDoublebyName("realize_pandl", i);
                reqCommand.intrst_rate = packer.GetDoublebyName("intrst_rate", i);
                reqCommand.intrst_base_amt = packer.GetDoublebyName("intrst_base_amt", i);
                reqCommand.pre_entry_intrst_amt = packer.GetDoublebyName("pre_entry_intrst_amt", i);
 
                FuncpdsecuL_10_23Models.Add(reqCommand);
            }
            return FuncpdsecuL_10_23Models;
        }
 
        //逻辑_产品证券_资金运维_查询交易组资金
        public static List<FuncpdsecuL_10_23Model> GetFuncpdsecuL_10_23Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpdsecuL_10_23Models = new List<FuncpdsecuL_10_23Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpdsecuL_10_23Model();
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
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.begin_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_AMT_FLOAT);
                    reqCommand.curr_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_AMT_FLOAT);
                    reqCommand.frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_AMT_FLOAT);
                    reqCommand.unfroz_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_AMT_FLOAT);
                    reqCommand.pre_settle_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SETTLE_AMT_FLOAT);
                    reqCommand.shsz_avail_change_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SHSZ_AVAIL_CHANGE_AMT_FLOAT);
                    reqCommand.hk_avail_change_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HK_AVAIL_CHANGE_AMT_FLOAT);
                    reqCommand.amt_check_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_CHECK_DIFF_FLOAT);
                    reqCommand.T_hk_buy_total_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_T_HK_BUY_TOTAL_AMT_FLOAT);
                    reqCommand.T_hk_sell_total_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_T_HK_SELL_TOTAL_AMT_FLOAT);
                    reqCommand.T1_hk_buy_total_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_T1_HK_BUY_TOTAL_AMT_FLOAT);
                    reqCommand.T1_hk_sell_total_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_T1_HK_SELL_TOTAL_AMT_FLOAT);
                    reqCommand.total_rece_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_RECE_AMT_FLOAT);
                    reqCommand.total_payab_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_PAYAB_AMT_FLOAT);
                    reqCommand.total_change_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_CHANGE_AMT_FLOAT);
                    reqCommand.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    reqCommand.intrst_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_RATE_FLOAT);
                    reqCommand.intrst_base_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_BASE_AMT_FLOAT);
                    reqCommand.pre_entry_intrst_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ENTRY_INTRST_AMT_FLOAT);
                    FuncpdsecuL_10_23Models.Add(reqCommand);
                }
            }
            return FuncpdsecuL_10_23Models;
        }
 
        //逻辑_产品证券_资金运维_查询通道内外资金差异
        public static List<FuncpdsecuL_10_25Model> GetFuncpdsecuL_10_25Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpdsecuL_10_25Models = new List<FuncpdsecuL_10_25Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpdsecuL_10_25Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.acco_curr_amt = packer.GetDoublebyName("acco_curr_amt", i);
                reqCommand.acco_avail_amt = packer.GetDoublebyName("acco_avail_amt", i);
                reqCommand.out_curr_amt = packer.GetDoublebyName("out_curr_amt", i);
                reqCommand.out_enable_amt = packer.GetDoublebyName("out_enable_amt", i);
                reqCommand.sys_avail_amt_diff = packer.GetDoublebyName("sys_avail_amt_diff", i);
                reqCommand.acco_curr_amt_diff = packer.GetDoublebyName("acco_curr_amt_diff", i);
                reqCommand.acco_avail_amt_diff = packer.GetDoublebyName("acco_avail_amt_diff", i);
                reqCommand.total_payab_amt = packer.GetDoublebyName("total_payab_amt", i);
                reqCommand.total_rece_amt = packer.GetDoublebyName("total_rece_amt", i);
                reqCommand.out_total_payab_amt = packer.GetDoublebyName("out_total_payab_amt", i);
                reqCommand.out_total_rece_amt = packer.GetDoublebyName("out_total_rece_amt", i);
                reqCommand.acco_total_payab_amt_diff = packer.GetDoublebyName("acco_total_payab_amt_diff", i);
                reqCommand.acco_total_rece_amt_diff = packer.GetDoublebyName("acco_total_rece_amt_diff", i);
                reqCommand.deal_flag = packer.GetIntbyName("deal_flag", i);
                reqCommand.asset_sync_flag = packer.GetIntbyName("asset_sync_flag", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncpdsecuL_10_25Models.Add(reqCommand);
            }
            return FuncpdsecuL_10_25Models;
        }
 
        //逻辑_产品证券_资金运维_查询通道内外资金差异
        public static List<FuncpdsecuL_10_25Model> GetFuncpdsecuL_10_25Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpdsecuL_10_25Models = new List<FuncpdsecuL_10_25Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpdsecuL_10_25Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.acco_curr_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_CURR_AMT_FLOAT);
                    reqCommand.acco_avail_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_AVAIL_AMT_FLOAT);
                    reqCommand.out_curr_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_CURR_AMT_FLOAT);
                    reqCommand.out_enable_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ENABLE_AMT_FLOAT);
                    reqCommand.sys_avail_amt_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SYS_AVAIL_AMT_DIFF_FLOAT);
                    reqCommand.acco_curr_amt_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_CURR_AMT_DIFF_FLOAT);
                    reqCommand.acco_avail_amt_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_AVAIL_AMT_DIFF_FLOAT);
                    reqCommand.total_payab_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_PAYAB_AMT_FLOAT);
                    reqCommand.total_rece_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_RECE_AMT_FLOAT);
                    reqCommand.out_total_payab_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_TOTAL_PAYAB_AMT_FLOAT);
                    reqCommand.out_total_rece_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_TOTAL_RECE_AMT_FLOAT);
                    reqCommand.acco_total_payab_amt_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_TOTAL_PAYAB_AMT_DIFF_FLOAT);
                    reqCommand.acco_total_rece_amt_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_TOTAL_RECE_AMT_DIFF_FLOAT);
                    reqCommand.deal_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_FLAG_INT);
                    reqCommand.asset_sync_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_SYNC_FLAG_INT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncpdsecuL_10_25Models.Add(reqCommand);
                }
            }
            return FuncpdsecuL_10_25Models;
        }
 
        //逻辑_产品证券_资金运维_查询资产账户资金流水
        public static List<FuncpdsecuL_10_27Model> GetFuncpdsecuL_10_27Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpdsecuL_10_27Models = new List<FuncpdsecuL_10_27Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpdsecuL_10_27Model();
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
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.busi_flag = packer.GetIntbyName("busi_flag", i);
                reqCommand.occur_amt = packer.GetDoublebyName("occur_amt", i);
                reqCommand.occur_end_amt = packer.GetDoublebyName("occur_end_amt", i);
                reqCommand.jour_occur_field = packer.GetStrbyName("jour_occur_field", i);
                reqCommand.jour_after_occur_info = packer.GetStrbyName("jour_after_occur_info", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncpdsecuL_10_27Models.Add(reqCommand);
            }
            return FuncpdsecuL_10_27Models;
        }
 
        //逻辑_产品证券_资金运维_查询资产账户资金流水
        public static List<FuncpdsecuL_10_27Model> GetFuncpdsecuL_10_27Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpdsecuL_10_27Models = new List<FuncpdsecuL_10_27Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpdsecuL_10_27Model();
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
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.busi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT);
                    reqCommand.occur_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_AMT_FLOAT);
                    reqCommand.occur_end_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_END_AMT_FLOAT);
                    reqCommand.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    reqCommand.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncpdsecuL_10_27Models.Add(reqCommand);
                }
            }
            return FuncpdsecuL_10_27Models;
        }
 
        //逻辑_产品证券_资金运维_查询历史资产账户资金流水
        public static List<FuncpdsecuL_10_28Model> GetFuncpdsecuL_10_28Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpdsecuL_10_28Models = new List<FuncpdsecuL_10_28Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpdsecuL_10_28Model();
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
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.busi_flag = packer.GetIntbyName("busi_flag", i);
                reqCommand.occur_amt = packer.GetDoublebyName("occur_amt", i);
                reqCommand.occur_end_amt = packer.GetDoublebyName("occur_end_amt", i);
                reqCommand.jour_occur_field = packer.GetStrbyName("jour_occur_field", i);
                reqCommand.jour_after_occur_info = packer.GetStrbyName("jour_after_occur_info", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncpdsecuL_10_28Models.Add(reqCommand);
            }
            return FuncpdsecuL_10_28Models;
        }
 
        //逻辑_产品证券_资金运维_查询历史资产账户资金流水
        public static List<FuncpdsecuL_10_28Model> GetFuncpdsecuL_10_28Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpdsecuL_10_28Models = new List<FuncpdsecuL_10_28Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpdsecuL_10_28Model();
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
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.busi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT);
                    reqCommand.occur_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_AMT_FLOAT);
                    reqCommand.occur_end_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_END_AMT_FLOAT);
                    reqCommand.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    reqCommand.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncpdsecuL_10_28Models.Add(reqCommand);
                }
            }
            return FuncpdsecuL_10_28Models;
        }
 
    }
}
