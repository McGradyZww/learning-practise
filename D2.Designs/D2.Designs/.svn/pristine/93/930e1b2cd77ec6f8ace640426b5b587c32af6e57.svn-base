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

    public static class RptBasic
    {
        //逻辑_报表_报表基础_查询系统初始化日期
        public static List<FuncrptL_1_3Model> GetFuncrptL_1_3Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_1_3Models = new List<FuncrptL_1_3Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_1_3Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.last_init_date = packer.GetIntbyName("last_init_date", i);
                reqCommand.next_init_date = packer.GetIntbyName("next_init_date", i);
 
                FuncrptL_1_3Models.Add(reqCommand);
            }
            return FuncrptL_1_3Models;
        }
 
        //逻辑_报表_报表基础_查询系统初始化日期
        public static List<FuncrptL_1_3Model> GetFuncrptL_1_3Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_1_3Models = new List<FuncrptL_1_3Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncrptL_1_3Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                reqCommand.last_init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LAST_INIT_DATE_INT);
                reqCommand.next_init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NEXT_INIT_DATE_INT);
                FuncrptL_1_3Models.Add(reqCommand);
            }
            return FuncrptL_1_3Models;
        }
 
    }
}
