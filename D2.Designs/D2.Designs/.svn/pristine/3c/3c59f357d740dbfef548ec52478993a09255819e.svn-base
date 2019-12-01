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

    public static class FutuQuotServer
    {
        //逻辑_公共_期货行情服务_请求行情快照
        public static List<FuncpubL_14_1Model> GetFuncpubL_14_1Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_14_1Models = new List<FuncpubL_14_1Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_14_1Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.contrc_code = packer.GetStrbyName("contrc_code", i);
                reqCommand.quot_price_info = packer.GetStrbyName("quot_price_info", i);
 
                FuncpubL_14_1Models.Add(reqCommand);
            }
            return FuncpubL_14_1Models;
        }
 
        //逻辑_公共_期货行情服务_请求行情快照
        public static List<FuncpubL_14_1Model> GetFuncpubL_14_1Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_14_1Models = new List<FuncpubL_14_1Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncpubL_14_1Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                reqCommand.contrc_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR);
                reqCommand.quot_price_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_QUOT_PRICE_INFO_STR);
                FuncpubL_14_1Models.Add(reqCommand);
            }
            return FuncpubL_14_1Models;
        }
 
    }
}
