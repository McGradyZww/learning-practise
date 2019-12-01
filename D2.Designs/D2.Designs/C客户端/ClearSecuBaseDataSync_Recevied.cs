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

    public static class ClearSecuBaseDataSync
    {
        //逻辑_清算证券_基础数据同步_查询公司行为表
        public static List<FuncclsecuL_4_101Model> GetFuncclsecuL_4_101Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncclsecuL_4_101Models = new List<FuncclsecuL_4_101Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncclsecuL_4_101Model();
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
                reqCommand.placement_price = packer.GetDoublebyName("placement_price", i);
                reqCommand.notice_date = packer.GetIntbyName("notice_date", i);
                reqCommand.reg_date = packer.GetIntbyName("reg_date", i);
                reqCommand.ex_date = packer.GetIntbyName("ex_date", i);
                reqCommand.arrive_date = packer.GetIntbyName("arrive_date", i);
                reqCommand.begin_trade_date = packer.GetIntbyName("begin_trade_date", i);
                reqCommand.deal_flag = packer.GetIntbyName("deal_flag", i);
                reqCommand.busi_flag = packer.GetIntbyName("busi_flag", i);
 
                FuncclsecuL_4_101Models.Add(reqCommand);
            }
            return FuncclsecuL_4_101Models;
        }
 
        //逻辑_清算证券_基础数据同步_查询公司行为表
        public static List<FuncclsecuL_4_101Model> GetFuncclsecuL_4_101Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncclsecuL_4_101Models = new List<FuncclsecuL_4_101Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncclsecuL_4_101Model();
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
                    reqCommand.placement_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PLACEMENT_PRICE_FLOAT);
                    reqCommand.notice_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NOTICE_DATE_INT);
                    reqCommand.reg_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REG_DATE_INT);
                    reqCommand.ex_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EX_DATE_INT);
                    reqCommand.arrive_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ARRIVE_DATE_INT);
                    reqCommand.begin_trade_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TRADE_DATE_INT);
                    reqCommand.deal_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_FLAG_INT);
                    reqCommand.busi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT);
                    FuncclsecuL_4_101Models.Add(reqCommand);
                }
            }
            return FuncclsecuL_4_101Models;
        }
 
    }
}
