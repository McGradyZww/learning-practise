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

    public static class ClearSecuPublic
    {
        //逻辑_清算证券_公用_查询处理流程统计数据
        public static List<FuncclsecuL_1_43Model> GetFuncclsecuL_1_43Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncclsecuL_1_43Models = new List<FuncclsecuL_1_43Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncclsecuL_1_43Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.sett_flow_step = packer.GetIntbyName("sett_flow_step", i);
                reqCommand.total_count = packer.GetIntbyName("total_count", i);
                reqCommand.total_amt = packer.GetDoublebyName("total_amt", i);
                reqCommand.total_succ_count = packer.GetIntbyName("total_succ_count", i);
                reqCommand.total_succ_amt = packer.GetDoublebyName("total_succ_amt", i);
                reqCommand.total_fail_count = packer.GetIntbyName("total_fail_count", i);
                reqCommand.total_fail_amt = packer.GetDoublebyName("total_fail_amt", i);
 
                FuncclsecuL_1_43Models.Add(reqCommand);
            }
            return FuncclsecuL_1_43Models;
        }
 
        //逻辑_清算证券_公用_查询处理流程统计数据
        public static List<FuncclsecuL_1_43Model> GetFuncclsecuL_1_43Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncclsecuL_1_43Models = new List<FuncclsecuL_1_43Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncclsecuL_1_43Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.sett_flow_step = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SETT_FLOW_STEP_INT);
                    reqCommand.total_count = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_COUNT_INT);
                    reqCommand.total_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_AMT_FLOAT);
                    reqCommand.total_succ_count = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_SUCC_COUNT_INT);
                    reqCommand.total_succ_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_SUCC_AMT_FLOAT);
                    reqCommand.total_fail_count = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_FAIL_COUNT_INT);
                    reqCommand.total_fail_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_FAIL_AMT_FLOAT);
                    FuncclsecuL_1_43Models.Add(reqCommand);
                }
            }
            return FuncclsecuL_1_43Models;
        }
 
        //逻辑_清算证券_公用_数据归历史定时任务
        public static List<FuncclsecuL_1_51Model> GetFuncclsecuL_1_51Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncclsecuL_1_51Models = new List<FuncclsecuL_1_51Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncclsecuL_1_51Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.task_strike_status = packer.GetStrbyName("task_strike_status", i);
 
                FuncclsecuL_1_51Models.Add(reqCommand);
            }
            return FuncclsecuL_1_51Models;
        }
 
        //逻辑_清算证券_公用_数据归历史定时任务
        public static List<FuncclsecuL_1_51Model> GetFuncclsecuL_1_51Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncclsecuL_1_51Models = new List<FuncclsecuL_1_51Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncclsecuL_1_51Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.task_strike_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STRIKE_STATUS_STR);
                FuncclsecuL_1_51Models.Add(reqCommand);
            }
            return FuncclsecuL_1_51Models;
        }
 
    }
}
