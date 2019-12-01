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

    public static class ClearSecuSett
    {
        //逻辑_清算证券_结算_查询公司行为记录
        public static List<FuncclsecuL_3_4Model> GetFuncclsecuL_3_4Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncclsecuL_3_4Models = new List<FuncclsecuL_3_4Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncclsecuL_3_4Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.divi_cacl_num = packer.GetIntbyName("divi_cacl_num", i);
                reqCommand.divi_amt = packer.GetDoublebyName("divi_amt", i);
                reqCommand.divi_qty = packer.GetDoublebyName("divi_qty", i);
                reqCommand.equity_trans_qty = packer.GetDoublebyName("equity_trans_qty", i);
                reqCommand.rights_issue_qty = packer.GetDoublebyName("rights_issue_qty", i);
                reqCommand.placement_price = packer.GetDoublebyName("placement_price", i);
                reqCommand.notice_date = packer.GetIntbyName("notice_date", i);
                reqCommand.reg_date = packer.GetIntbyName("reg_date", i);
                reqCommand.ex_date = packer.GetIntbyName("ex_date", i);
                reqCommand.arrive_date = packer.GetIntbyName("arrive_date", i);
                reqCommand.begin_trade_date = packer.GetIntbyName("begin_trade_date", i);
                reqCommand.deal_flag = packer.GetIntbyName("deal_flag", i);
                reqCommand.busi_flag = packer.GetIntbyName("busi_flag", i);
 
                FuncclsecuL_3_4Models.Add(reqCommand);
            }
            return FuncclsecuL_3_4Models;
        }
 
        //逻辑_清算证券_结算_查询公司行为记录
        public static List<FuncclsecuL_3_4Model> GetFuncclsecuL_3_4Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncclsecuL_3_4Models = new List<FuncclsecuL_3_4Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncclsecuL_3_4Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.divi_cacl_num = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DIVI_CACL_NUM_INT);
                    reqCommand.divi_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DIVI_AMT_FLOAT);
                    reqCommand.divi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DIVI_QTY_FLOAT);
                    reqCommand.equity_trans_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_EQUITY_TRANS_QTY_FLOAT);
                    reqCommand.rights_issue_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RIGHTS_ISSUE_QTY_FLOAT);
                    reqCommand.placement_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PLACEMENT_PRICE_FLOAT);
                    reqCommand.notice_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NOTICE_DATE_INT);
                    reqCommand.reg_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REG_DATE_INT);
                    reqCommand.ex_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EX_DATE_INT);
                    reqCommand.arrive_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ARRIVE_DATE_INT);
                    reqCommand.begin_trade_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TRADE_DATE_INT);
                    reqCommand.deal_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_FLAG_INT);
                    reqCommand.busi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT);
                    FuncclsecuL_3_4Models.Add(reqCommand);
                }
            }
            return FuncclsecuL_3_4Models;
        }
 
        //逻辑_清算证券_结算_查询机构税率记录
        public static List<FuncclsecuL_3_14Model> GetFuncclsecuL_3_14Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncclsecuL_3_14Models = new List<FuncclsecuL_3_14Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncclsecuL_3_14Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.divi_tax_rate = packer.GetDoublebyName("divi_tax_rate", i);
 
                FuncclsecuL_3_14Models.Add(reqCommand);
            }
            return FuncclsecuL_3_14Models;
        }
 
        //逻辑_清算证券_结算_查询机构税率记录
        public static List<FuncclsecuL_3_14Model> GetFuncclsecuL_3_14Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncclsecuL_3_14Models = new List<FuncclsecuL_3_14Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncclsecuL_3_14Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.divi_tax_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DIVI_TAX_RATE_FLOAT);
                    FuncclsecuL_3_14Models.Add(reqCommand);
                }
            }
            return FuncclsecuL_3_14Models;
        }
 
        //逻辑_清算证券_结算_查询机构产品税率记录
        public static List<FuncclsecuL_3_19Model> GetFuncclsecuL_3_19Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncclsecuL_3_19Models = new List<FuncclsecuL_3_19Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncclsecuL_3_19Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.divi_tax_rate = packer.GetDoublebyName("divi_tax_rate", i);
 
                FuncclsecuL_3_19Models.Add(reqCommand);
            }
            return FuncclsecuL_3_19Models;
        }
 
        //逻辑_清算证券_结算_查询机构产品税率记录
        public static List<FuncclsecuL_3_19Model> GetFuncclsecuL_3_19Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncclsecuL_3_19Models = new List<FuncclsecuL_3_19Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncclsecuL_3_19Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.divi_tax_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DIVI_TAX_RATE_FLOAT);
                    FuncclsecuL_3_19Models.Add(reqCommand);
                }
            }
            return FuncclsecuL_3_19Models;
        }
 
        //逻辑_清算证券_结算_查询新股中签记录
        public static List<FuncclsecuL_3_24Model> GetFuncclsecuL_3_24Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncclsecuL_3_24Models = new List<FuncclsecuL_3_24Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncclsecuL_3_24Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.strike_date = packer.GetIntbyName("strike_date", i);
                reqCommand.strike_no = packer.GetStrbyName("strike_no", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.strike_price = packer.GetDoublebyName("strike_price", i);
                reqCommand.strike_qty = packer.GetDoublebyName("strike_qty", i);
                reqCommand.strike_amt = packer.GetDoublebyName("strike_amt", i);
 
                FuncclsecuL_3_24Models.Add(reqCommand);
            }
            return FuncclsecuL_3_24Models;
        }
 
        //逻辑_清算证券_结算_查询新股中签记录
        public static List<FuncclsecuL_3_24Model> GetFuncclsecuL_3_24Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncclsecuL_3_24Models = new List<FuncclsecuL_3_24Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncclsecuL_3_24Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.strike_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT);
                    reqCommand.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_PRICE_FLOAT);
                    reqCommand.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    reqCommand.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    FuncclsecuL_3_24Models.Add(reqCommand);
                }
            }
            return FuncclsecuL_3_24Models;
        }
 
        //逻辑_清算证券_结算_查询历史新股中签记录
        public static List<FuncclsecuL_3_26Model> GetFuncclsecuL_3_26Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncclsecuL_3_26Models = new List<FuncclsecuL_3_26Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncclsecuL_3_26Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.strike_date = packer.GetIntbyName("strike_date", i);
                reqCommand.strike_no = packer.GetStrbyName("strike_no", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.strike_price = packer.GetDoublebyName("strike_price", i);
                reqCommand.strike_qty = packer.GetDoublebyName("strike_qty", i);
                reqCommand.strike_amt = packer.GetDoublebyName("strike_amt", i);
 
                FuncclsecuL_3_26Models.Add(reqCommand);
            }
            return FuncclsecuL_3_26Models;
        }
 
        //逻辑_清算证券_结算_查询历史新股中签记录
        public static List<FuncclsecuL_3_26Model> GetFuncclsecuL_3_26Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncclsecuL_3_26Models = new List<FuncclsecuL_3_26Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncclsecuL_3_26Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.strike_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT);
                    reqCommand.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_PRICE_FLOAT);
                    reqCommand.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    reqCommand.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    FuncclsecuL_3_26Models.Add(reqCommand);
                }
            }
            return FuncclsecuL_3_26Models;
        }
 
        //逻辑_清算证券_结算_转入新股申购记录
        public static List<FuncclsecuL_3_31Model> GetFuncclsecuL_3_31Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncclsecuL_3_31Models = new List<FuncclsecuL_3_31Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncclsecuL_3_31Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.record_count = packer.GetIntbyName("record_count", i);
                reqCommand.deal_info = packer.GetStrbyName("deal_info", i);
 
                FuncclsecuL_3_31Models.Add(reqCommand);
            }
            return FuncclsecuL_3_31Models;
        }
 
        //逻辑_清算证券_结算_转入新股申购记录
        public static List<FuncclsecuL_3_31Model> GetFuncclsecuL_3_31Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncclsecuL_3_31Models = new List<FuncclsecuL_3_31Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncclsecuL_3_31Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.record_count = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RECORD_COUNT_INT);
                reqCommand.deal_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_INFO_STR);
                FuncclsecuL_3_31Models.Add(reqCommand);
            }
            return FuncclsecuL_3_31Models;
        }
 
        //逻辑_清算证券_结算_查询新股申购记录
        public static List<FuncclsecuL_3_34Model> GetFuncclsecuL_3_34Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncclsecuL_3_34Models = new List<FuncclsecuL_3_34Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncclsecuL_3_34Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.dist_qty = packer.GetIntbyName("dist_qty", i);
                reqCommand.nav_asset = packer.GetDoublebyName("nav_asset", i);
                reqCommand.deal_flag = packer.GetIntbyName("deal_flag", i);
                reqCommand.trade_code_no = packer.GetIntbyName("trade_code_no", i);
                reqCommand.target_code_no = packer.GetIntbyName("target_code_no", i);
 
                FuncclsecuL_3_34Models.Add(reqCommand);
            }
            return FuncclsecuL_3_34Models;
        }
 
        //逻辑_清算证券_结算_查询新股申购记录
        public static List<FuncclsecuL_3_34Model> GetFuncclsecuL_3_34Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncclsecuL_3_34Models = new List<FuncclsecuL_3_34Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncclsecuL_3_34Model();
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
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.dist_qty = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DIST_QTY_INT);
                    reqCommand.nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT);
                    reqCommand.deal_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_FLAG_INT);
                    reqCommand.trade_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_NO_INT);
                    reqCommand.target_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_NO_INT);
                    FuncclsecuL_3_34Models.Add(reqCommand);
                }
            }
            return FuncclsecuL_3_34Models;
        }
 
        //逻辑_清算证券_结算_查询新股申购中签记录
        public static List<FuncclsecuL_3_36Model> GetFuncclsecuL_3_36Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncclsecuL_3_36Models = new List<FuncclsecuL_3_36Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncclsecuL_3_36Model();
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
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.dist_qty = packer.GetIntbyName("dist_qty", i);
                reqCommand.nav_asset = packer.GetDoublebyName("nav_asset", i);
                reqCommand.deal_flag = packer.GetIntbyName("deal_flag", i);
                reqCommand.trade_code_no = packer.GetIntbyName("trade_code_no", i);
                reqCommand.target_code_no = packer.GetIntbyName("target_code_no", i);
 
                FuncclsecuL_3_36Models.Add(reqCommand);
            }
            return FuncclsecuL_3_36Models;
        }
 
        //逻辑_清算证券_结算_查询新股申购中签记录
        public static List<FuncclsecuL_3_36Model> GetFuncclsecuL_3_36Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncclsecuL_3_36Models = new List<FuncclsecuL_3_36Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncclsecuL_3_36Model();
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
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.dist_qty = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DIST_QTY_INT);
                    reqCommand.nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT);
                    reqCommand.deal_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_FLAG_INT);
                    reqCommand.trade_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_NO_INT);
                    reqCommand.target_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_NO_INT);
                    FuncclsecuL_3_36Models.Add(reqCommand);
                }
            }
            return FuncclsecuL_3_36Models;
        }
 
        //逻辑_清算证券_结算_查询可转债中签记录
        public static List<FuncclsecuL_3_40Model> GetFuncclsecuL_3_40Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncclsecuL_3_40Models = new List<FuncclsecuL_3_40Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncclsecuL_3_40Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.strike_date = packer.GetIntbyName("strike_date", i);
                reqCommand.strike_no = packer.GetStrbyName("strike_no", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.strike_price = packer.GetDoublebyName("strike_price", i);
                reqCommand.strike_qty = packer.GetDoublebyName("strike_qty", i);
                reqCommand.strike_amt = packer.GetDoublebyName("strike_amt", i);
 
                FuncclsecuL_3_40Models.Add(reqCommand);
            }
            return FuncclsecuL_3_40Models;
        }
 
        //逻辑_清算证券_结算_查询可转债中签记录
        public static List<FuncclsecuL_3_40Model> GetFuncclsecuL_3_40Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncclsecuL_3_40Models = new List<FuncclsecuL_3_40Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncclsecuL_3_40Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.strike_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT);
                    reqCommand.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_PRICE_FLOAT);
                    reqCommand.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    reqCommand.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    FuncclsecuL_3_40Models.Add(reqCommand);
                }
            }
            return FuncclsecuL_3_40Models;
        }
 
        //逻辑_清算证券_结算_查询历史可转债中签记录
        public static List<FuncclsecuL_3_41Model> GetFuncclsecuL_3_41Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncclsecuL_3_41Models = new List<FuncclsecuL_3_41Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncclsecuL_3_41Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.strike_date = packer.GetIntbyName("strike_date", i);
                reqCommand.strike_no = packer.GetStrbyName("strike_no", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.strike_price = packer.GetDoublebyName("strike_price", i);
                reqCommand.strike_qty = packer.GetDoublebyName("strike_qty", i);
                reqCommand.strike_amt = packer.GetDoublebyName("strike_amt", i);
 
                FuncclsecuL_3_41Models.Add(reqCommand);
            }
            return FuncclsecuL_3_41Models;
        }
 
        //逻辑_清算证券_结算_查询历史可转债中签记录
        public static List<FuncclsecuL_3_41Model> GetFuncclsecuL_3_41Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncclsecuL_3_41Models = new List<FuncclsecuL_3_41Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncclsecuL_3_41Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.strike_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT);
                    reqCommand.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_PRICE_FLOAT);
                    reqCommand.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    reqCommand.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    FuncclsecuL_3_41Models.Add(reqCommand);
                }
            }
            return FuncclsecuL_3_41Models;
        }
 
        //逻辑_清算证券_结算_查询回购记录
        public static List<FuncclsecuL_3_44Model> GetFuncclsecuL_3_44Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncclsecuL_3_44Models = new List<FuncclsecuL_3_44Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncclsecuL_3_44Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.strike_date = packer.GetIntbyName("strike_date", i);
                reqCommand.strike_no = packer.GetStrbyName("strike_no", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.repo_qty = packer.GetDoublebyName("repo_qty", i);
                reqCommand.repo_amt = packer.GetDoublebyName("repo_amt", i);
                reqCommand.repo_rate = packer.GetDoublebyName("repo_rate", i);
                reqCommand.repo_trade_date = packer.GetIntbyName("repo_trade_date", i);
                reqCommand.repo_order_id = packer.GetInt64byName("repo_order_id", i);
                reqCommand.repo_strike_id = packer.GetInt64byName("repo_strike_id", i);
                reqCommand.intrst_days = packer.GetIntbyName("intrst_days", i);
                reqCommand.repo_cale_days = packer.GetIntbyName("repo_cale_days", i);
                reqCommand.repo_back_date = packer.GetIntbyName("repo_back_date", i);
                reqCommand.repo_back_trade_date = packer.GetIntbyName("repo_back_trade_date", i);
                reqCommand.repo_back_amt = packer.GetDoublebyName("repo_back_amt", i);
                reqCommand.repo_back_intrst = packer.GetDoublebyName("repo_back_intrst", i);
                reqCommand.repo_status = packer.GetStrbyName("repo_status", i);
                reqCommand.busi_flag = packer.GetIntbyName("busi_flag", i);
                reqCommand.trade_code_no = packer.GetIntbyName("trade_code_no", i);
                reqCommand.target_code_no = packer.GetIntbyName("target_code_no", i);
 
                FuncclsecuL_3_44Models.Add(reqCommand);
            }
            return FuncclsecuL_3_44Models;
        }
 
        //逻辑_清算证券_结算_查询回购记录
        public static List<FuncclsecuL_3_44Model> GetFuncclsecuL_3_44Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncclsecuL_3_44Models = new List<FuncclsecuL_3_44Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncclsecuL_3_44Model();
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
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.strike_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT);
                    reqCommand.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.repo_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPO_QTY_FLOAT);
                    reqCommand.repo_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPO_AMT_FLOAT);
                    reqCommand.repo_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPO_RATE_FLOAT);
                    reqCommand.repo_trade_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPO_TRADE_DATE_INT);
                    reqCommand.repo_order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_REPO_ORDER_ID_INT64);
                    reqCommand.repo_strike_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_REPO_STRIKE_ID_INT64);
                    reqCommand.intrst_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_DAYS_INT);
                    reqCommand.repo_cale_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPO_CALE_DAYS_INT);
                    reqCommand.repo_back_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPO_BACK_DATE_INT);
                    reqCommand.repo_back_trade_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPO_BACK_TRADE_DATE_INT);
                    reqCommand.repo_back_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPO_BACK_AMT_FLOAT);
                    reqCommand.repo_back_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPO_BACK_INTRST_FLOAT);
                    reqCommand.repo_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPO_STATUS_STR);
                    reqCommand.busi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT);
                    reqCommand.trade_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_NO_INT);
                    reqCommand.target_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_NO_INT);
                    FuncclsecuL_3_44Models.Add(reqCommand);
                }
            }
            return FuncclsecuL_3_44Models;
        }
 
        //逻辑_清算证券_结算_查询提前待入账记录
        public static List<FuncclsecuL_3_86Model> GetFuncclsecuL_3_86Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncclsecuL_3_86Models = new List<FuncclsecuL_3_86Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncclsecuL_3_86Model();
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
                reqCommand.pre_entry_qty = packer.GetDoublebyName("pre_entry_qty", i);
                reqCommand.pre_entry_amt = packer.GetDoublebyName("pre_entry_amt", i);
                reqCommand.bond_accr_intrst = packer.GetDoublebyName("bond_accr_intrst", i);
                reqCommand.busi_flag = packer.GetIntbyName("busi_flag", i);
                reqCommand.act_record_flag = packer.GetIntbyName("act_record_flag", i);
                reqCommand.acco_entry_flag = packer.GetIntbyName("acco_entry_flag", i);
                reqCommand.entry_status = packer.GetStrbyName("entry_status", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.reg_date = packer.GetIntbyName("reg_date", i);
                reqCommand.arrive_date = packer.GetIntbyName("arrive_date", i);
 
                FuncclsecuL_3_86Models.Add(reqCommand);
            }
            return FuncclsecuL_3_86Models;
        }
 
        //逻辑_清算证券_结算_查询提前待入账记录
        public static List<FuncclsecuL_3_86Model> GetFuncclsecuL_3_86Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncclsecuL_3_86Models = new List<FuncclsecuL_3_86Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncclsecuL_3_86Model();
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
                    reqCommand.pre_entry_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ENTRY_QTY_FLOAT);
                    reqCommand.pre_entry_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ENTRY_AMT_FLOAT);
                    reqCommand.bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT);
                    reqCommand.busi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT);
                    reqCommand.act_record_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ACT_RECORD_FLAG_INT);
                    reqCommand.acco_entry_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_ENTRY_FLAG_INT);
                    reqCommand.entry_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_STATUS_STR);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.reg_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REG_DATE_INT);
                    reqCommand.arrive_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ARRIVE_DATE_INT);
                    FuncclsecuL_3_86Models.Add(reqCommand);
                }
            }
            return FuncclsecuL_3_86Models;
        }
 
        //逻辑_清算证券_结算_查询待入账记录
        public static List<FuncclsecuL_3_87Model> GetFuncclsecuL_3_87Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncclsecuL_3_87Models = new List<FuncclsecuL_3_87Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncclsecuL_3_87Model();
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
                reqCommand.strike_date = packer.GetIntbyName("strike_date", i);
                reqCommand.strike_no = packer.GetStrbyName("strike_no", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.strike_price = packer.GetDoublebyName("strike_price", i);
                reqCommand.strike_qty = packer.GetDoublebyName("strike_qty", i);
                reqCommand.strike_amt = packer.GetDoublebyName("strike_amt", i);
                reqCommand.pre_entry_qty = packer.GetDoublebyName("pre_entry_qty", i);
                reqCommand.pre_entry_amt = packer.GetDoublebyName("pre_entry_amt", i);
                reqCommand.busi_flag = packer.GetIntbyName("busi_flag", i);
                reqCommand.entry_status = packer.GetStrbyName("entry_status", i);
                reqCommand.undo_status = packer.GetStrbyName("undo_status", i);
                reqCommand.entry_money_jour_no = packer.GetInt64byName("entry_money_jour_no", i);
                reqCommand.entry_posi_jour_no = packer.GetInt64byName("entry_posi_jour_no", i);
                reqCommand.deli_jour_no = packer.GetInt64byName("deli_jour_no", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.trade_code_no = packer.GetIntbyName("trade_code_no", i);
                reqCommand.target_code_no = packer.GetIntbyName("target_code_no", i);
                reqCommand.intrst_days = packer.GetIntbyName("intrst_days", i);
                reqCommand.bond_accr_intrst = packer.GetDoublebyName("bond_accr_intrst", i);
                reqCommand.impawn_ratio = packer.GetDoublebyName("impawn_ratio", i);
                reqCommand.repo_back_date = packer.GetIntbyName("repo_back_date", i);
 
                FuncclsecuL_3_87Models.Add(reqCommand);
            }
            return FuncclsecuL_3_87Models;
        }
 
        //逻辑_清算证券_结算_查询待入账记录
        public static List<FuncclsecuL_3_87Model> GetFuncclsecuL_3_87Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncclsecuL_3_87Models = new List<FuncclsecuL_3_87Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncclsecuL_3_87Model();
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
                    reqCommand.strike_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT);
                    reqCommand.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_PRICE_FLOAT);
                    reqCommand.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    reqCommand.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    reqCommand.pre_entry_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ENTRY_QTY_FLOAT);
                    reqCommand.pre_entry_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ENTRY_AMT_FLOAT);
                    reqCommand.busi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT);
                    reqCommand.entry_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_STATUS_STR);
                    reqCommand.undo_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_UNDO_STATUS_STR);
                    reqCommand.entry_money_jour_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_MONEY_JOUR_NO_INT64);
                    reqCommand.entry_posi_jour_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_POSI_JOUR_NO_INT64);
                    reqCommand.deli_jour_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_DELI_JOUR_NO_INT64);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.trade_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_NO_INT);
                    reqCommand.target_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_NO_INT);
                    reqCommand.intrst_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_DAYS_INT);
                    reqCommand.bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT);
                    reqCommand.impawn_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_IMPAWN_RATIO_FLOAT);
                    reqCommand.repo_back_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPO_BACK_DATE_INT);
                    FuncclsecuL_3_87Models.Add(reqCommand);
                }
            }
            return FuncclsecuL_3_87Models;
        }
 
        //逻辑_清算证券_结算_入账处理
        public static List<FuncclsecuL_3_88Model> GetFuncclsecuL_3_88Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncclsecuL_3_88Models = new List<FuncclsecuL_3_88Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncclsecuL_3_88Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.record_count = packer.GetIntbyName("record_count", i);
                reqCommand.deal_info = packer.GetStrbyName("deal_info", i);
 
                FuncclsecuL_3_88Models.Add(reqCommand);
            }
            return FuncclsecuL_3_88Models;
        }
 
        //逻辑_清算证券_结算_入账处理
        public static List<FuncclsecuL_3_88Model> GetFuncclsecuL_3_88Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncclsecuL_3_88Models = new List<FuncclsecuL_3_88Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncclsecuL_3_88Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.record_count = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RECORD_COUNT_INT);
                reqCommand.deal_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_INFO_STR);
                FuncclsecuL_3_88Models.Add(reqCommand);
            }
            return FuncclsecuL_3_88Models;
        }
 
        //逻辑_清算证券_结算_结算处理定时任务
        public static List<FuncclsecuL_3_152Model> GetFuncclsecuL_3_152Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncclsecuL_3_152Models = new List<FuncclsecuL_3_152Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncclsecuL_3_152Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.task_strike_status = packer.GetStrbyName("task_strike_status", i);
 
                FuncclsecuL_3_152Models.Add(reqCommand);
            }
            return FuncclsecuL_3_152Models;
        }
 
        //逻辑_清算证券_结算_结算处理定时任务
        public static List<FuncclsecuL_3_152Model> GetFuncclsecuL_3_152Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncclsecuL_3_152Models = new List<FuncclsecuL_3_152Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncclsecuL_3_152Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.task_strike_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STRIKE_STATUS_STR);
                FuncclsecuL_3_152Models.Add(reqCommand);
            }
            return FuncclsecuL_3_152Models;
        }
 
        //逻辑_清算证券_结算_入账定时任务
        public static List<FuncclsecuL_3_153Model> GetFuncclsecuL_3_153Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncclsecuL_3_153Models = new List<FuncclsecuL_3_153Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncclsecuL_3_153Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.task_strike_status = packer.GetStrbyName("task_strike_status", i);
 
                FuncclsecuL_3_153Models.Add(reqCommand);
            }
            return FuncclsecuL_3_153Models;
        }
 
        //逻辑_清算证券_结算_入账定时任务
        public static List<FuncclsecuL_3_153Model> GetFuncclsecuL_3_153Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncclsecuL_3_153Models = new List<FuncclsecuL_3_153Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncclsecuL_3_153Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.task_strike_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STRIKE_STATUS_STR);
                FuncclsecuL_3_153Models.Add(reqCommand);
            }
            return FuncclsecuL_3_153Models;
        }
 
        //逻辑_清算证券_结算_查询统计数据
        public static List<FuncclsecuL_3_202Model> GetFuncclsecuL_3_202Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncclsecuL_3_202Models = new List<FuncclsecuL_3_202Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncclsecuL_3_202Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.busi_flag = packer.GetIntbyName("busi_flag", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.sett_num = packer.GetIntbyName("sett_num", i);
                reqCommand.entry_qty = packer.GetDoublebyName("entry_qty", i);
                reqCommand.entry_amt = packer.GetDoublebyName("entry_amt", i);
 
                FuncclsecuL_3_202Models.Add(reqCommand);
            }
            return FuncclsecuL_3_202Models;
        }
 
        //逻辑_清算证券_结算_查询统计数据
        public static List<FuncclsecuL_3_202Model> GetFuncclsecuL_3_202Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncclsecuL_3_202Models = new List<FuncclsecuL_3_202Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncclsecuL_3_202Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.busi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.sett_num = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SETT_NUM_INT);
                    reqCommand.entry_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_QTY_FLOAT);
                    reqCommand.entry_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_AMT_FLOAT);
                    FuncclsecuL_3_202Models.Add(reqCommand);
                }
            }
            return FuncclsecuL_3_202Models;
        }
 
        //逻辑_清算证券_结算_查询公司行为表
        public static List<FuncclsecuL_3_203Model> GetFuncclsecuL_3_203Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncclsecuL_3_203Models = new List<FuncclsecuL_3_203Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncclsecuL_3_203Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.asset_type = packer.GetIntbyName("asset_type", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.par_value = packer.GetDoublebyName("par_value", i);
                reqCommand.divi_cacl_num = packer.GetIntbyName("divi_cacl_num", i);
                reqCommand.divi_amt = packer.GetDoublebyName("divi_amt", i);
                reqCommand.divi_qty = packer.GetDoublebyName("divi_qty", i);
                reqCommand.equity_trans_qty = packer.GetDoublebyName("equity_trans_qty", i);
                reqCommand.rights_issue_qty = packer.GetDoublebyName("rights_issue_qty", i);
                reqCommand.notice_date = packer.GetIntbyName("notice_date", i);
                reqCommand.reg_date = packer.GetIntbyName("reg_date", i);
                reqCommand.ex_date = packer.GetIntbyName("ex_date", i);
                reqCommand.arrive_date = packer.GetIntbyName("arrive_date", i);
                reqCommand.begin_trade_date = packer.GetIntbyName("begin_trade_date", i);
                reqCommand.deal_flag = packer.GetIntbyName("deal_flag", i);
 
                FuncclsecuL_3_203Models.Add(reqCommand);
            }
            return FuncclsecuL_3_203Models;
        }
 
        //逻辑_清算证券_结算_查询公司行为表
        public static List<FuncclsecuL_3_203Model> GetFuncclsecuL_3_203Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncclsecuL_3_203Models = new List<FuncclsecuL_3_203Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncclsecuL_3_203Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.par_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_FLOAT);
                    reqCommand.divi_cacl_num = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DIVI_CACL_NUM_INT);
                    reqCommand.divi_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DIVI_AMT_FLOAT);
                    reqCommand.divi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DIVI_QTY_FLOAT);
                    reqCommand.equity_trans_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_EQUITY_TRANS_QTY_FLOAT);
                    reqCommand.rights_issue_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RIGHTS_ISSUE_QTY_FLOAT);
                    reqCommand.notice_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NOTICE_DATE_INT);
                    reqCommand.reg_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REG_DATE_INT);
                    reqCommand.ex_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EX_DATE_INT);
                    reqCommand.arrive_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ARRIVE_DATE_INT);
                    reqCommand.begin_trade_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TRADE_DATE_INT);
                    reqCommand.deal_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_FLAG_INT);
                    FuncclsecuL_3_203Models.Add(reqCommand);
                }
            }
            return FuncclsecuL_3_203Models;
        }
 
        //逻辑_清算证券_结算_查询配股登记信息
        public static List<FuncclsecuL_3_204Model> GetFuncclsecuL_3_204Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncclsecuL_3_204Models = new List<FuncclsecuL_3_204Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncclsecuL_3_204Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.curr_qty = packer.GetDoublebyName("curr_qty", i);
                reqCommand.rights_issue_qty = packer.GetDoublebyName("rights_issue_qty", i);
                reqCommand.placement_price = packer.GetDoublebyName("placement_price", i);
                reqCommand.avail_pla_qty = packer.GetDoublebyName("avail_pla_qty", i);
                reqCommand.frozen_qty = packer.GetDoublebyName("frozen_qty", i);
                reqCommand.frozen_amt = packer.GetDoublebyName("frozen_amt", i);
                reqCommand.reg_date = packer.GetIntbyName("reg_date", i);
                reqCommand.ex_date = packer.GetIntbyName("ex_date", i);
                reqCommand.arrive_date = packer.GetIntbyName("arrive_date", i);
                reqCommand.begin_trade_date = packer.GetIntbyName("begin_trade_date", i);
                reqCommand.placement_status = packer.GetStrbyName("placement_status", i);
 
                FuncclsecuL_3_204Models.Add(reqCommand);
            }
            return FuncclsecuL_3_204Models;
        }
 
        //逻辑_清算证券_结算_查询配股登记信息
        public static List<FuncclsecuL_3_204Model> GetFuncclsecuL_3_204Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncclsecuL_3_204Models = new List<FuncclsecuL_3_204Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncclsecuL_3_204Model();
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
                    reqCommand.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    reqCommand.rights_issue_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RIGHTS_ISSUE_QTY_FLOAT);
                    reqCommand.placement_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PLACEMENT_PRICE_FLOAT);
                    reqCommand.avail_pla_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVAIL_PLA_QTY_FLOAT);
                    reqCommand.frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_QTY_FLOAT);
                    reqCommand.frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_AMT_FLOAT);
                    reqCommand.reg_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REG_DATE_INT);
                    reqCommand.ex_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EX_DATE_INT);
                    reqCommand.arrive_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ARRIVE_DATE_INT);
                    reqCommand.begin_trade_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TRADE_DATE_INT);
                    reqCommand.placement_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PLACEMENT_STATUS_STR);
                    FuncclsecuL_3_204Models.Add(reqCommand);
                }
            }
            return FuncclsecuL_3_204Models;
        }
 
    }
}
