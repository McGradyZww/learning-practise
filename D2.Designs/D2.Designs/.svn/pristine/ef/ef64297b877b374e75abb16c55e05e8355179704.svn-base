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

    public static class TrdFutuPublic
    {
        //逻辑_交易期货_公用_获取业务记录编号
        public static List<FunctdfutuL_1_2Model> GetFunctdfutuL_1_2Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdfutuL_1_2Models = new List<FunctdfutuL_1_2Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdfutuL_1_2Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.curr_no = packer.GetInt64byName("curr_no", i);
 
                FunctdfutuL_1_2Models.Add(reqCommand);
            }
            return FunctdfutuL_1_2Models;
        }
 
        //逻辑_交易期货_公用_获取业务记录编号
        public static List<FunctdfutuL_1_2Model> GetFunctdfutuL_1_2Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdfutuL_1_2Models = new List<FunctdfutuL_1_2Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdfutuL_1_2Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.curr_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_CURR_NO_INT64);
                FunctdfutuL_1_2Models.Add(reqCommand);
            }
            return FunctdfutuL_1_2Models;
        }
 
        //逻辑_交易期货_公用_数据归历史
        public static List<FunctdfutuL_1_3Model> GetFunctdfutuL_1_3Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdfutuL_1_3Models = new List<FunctdfutuL_1_3Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdfutuL_1_3Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.task_strike_status = packer.GetStrbyName("task_strike_status", i);
 
                FunctdfutuL_1_3Models.Add(reqCommand);
            }
            return FunctdfutuL_1_3Models;
        }
 
        //逻辑_交易期货_公用_数据归历史
        public static List<FunctdfutuL_1_3Model> GetFunctdfutuL_1_3Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdfutuL_1_3Models = new List<FunctdfutuL_1_3Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdfutuL_1_3Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.task_strike_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STRIKE_STATUS_STR);
                FunctdfutuL_1_3Models.Add(reqCommand);
            }
            return FunctdfutuL_1_3Models;
        }
 
    }
}
