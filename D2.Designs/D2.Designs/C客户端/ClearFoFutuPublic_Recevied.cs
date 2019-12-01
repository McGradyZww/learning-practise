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

    public static class ClearFoFutuPublic
    {
        //逻辑_清算外盘期货_公用_查询处理记录序号
        public static List<FuncclfofuL_1_4Model> GetFuncclfofuL_1_4Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncclfofuL_1_4Models = new List<FuncclfofuL_1_4Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncclfofuL_1_4Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.sys_busin = packer.GetIntbyName("sys_busin", i);
                reqCommand.clear_data_source = packer.GetIntbyName("clear_data_source", i);
                reqCommand.clear_date = packer.GetIntbyName("clear_date", i);
                reqCommand.clear_deal_id = packer.GetInt64byName("clear_deal_id", i);
                reqCommand.sett_clear_status = packer.GetStrbyName("sett_clear_status", i);
 
                FuncclfofuL_1_4Models.Add(reqCommand);
            }
            return FuncclfofuL_1_4Models;
        }
 
        //逻辑_清算外盘期货_公用_查询处理记录序号
        public static List<FuncclfofuL_1_4Model> GetFuncclfofuL_1_4Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncclfofuL_1_4Models = new List<FuncclfofuL_1_4Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncclfofuL_1_4Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.sys_busin = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SYS_BUSIN_INT);
                    reqCommand.clear_data_source = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLEAR_DATA_SOURCE_INT);
                    reqCommand.clear_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLEAR_DATE_INT);
                    reqCommand.clear_deal_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_CLEAR_DEAL_ID_INT64);
                    reqCommand.sett_clear_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_SETT_CLEAR_STATUS_STR);
                    FuncclfofuL_1_4Models.Add(reqCommand);
                }
            }
            return FuncclfofuL_1_4Models;
        }
 
        //逻辑_清算外盘期货_公用_查询处理流程统计数据
        public static List<FuncclfofuL_1_43Model> GetFuncclfofuL_1_43Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncclfofuL_1_43Models = new List<FuncclfofuL_1_43Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncclfofuL_1_43Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.sett_flow_step = packer.GetIntbyName("sett_flow_step", i);
                reqCommand.total_count = packer.GetIntbyName("total_count", i);
                reqCommand.total_amt = packer.GetDoublebyName("total_amt", i);
                reqCommand.total_succ_count = packer.GetIntbyName("total_succ_count", i);
                reqCommand.total_succ_amt = packer.GetDoublebyName("total_succ_amt", i);
                reqCommand.total_fail_count = packer.GetIntbyName("total_fail_count", i);
                reqCommand.total_fail_amt = packer.GetDoublebyName("total_fail_amt", i);
 
                FuncclfofuL_1_43Models.Add(reqCommand);
            }
            return FuncclfofuL_1_43Models;
        }
 
        //逻辑_清算外盘期货_公用_查询处理流程统计数据
        public static List<FuncclfofuL_1_43Model> GetFuncclfofuL_1_43Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncclfofuL_1_43Models = new List<FuncclfofuL_1_43Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncclfofuL_1_43Model();
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
                    FuncclfofuL_1_43Models.Add(reqCommand);
                }
            }
            return FuncclfofuL_1_43Models;
        }
 
        //逻辑_清算外盘期货_公用_数据归历史定时任务
        public static List<FuncclfofuL_1_51Model> GetFuncclfofuL_1_51Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncclfofuL_1_51Models = new List<FuncclfofuL_1_51Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncclfofuL_1_51Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.task_strike_status = packer.GetStrbyName("task_strike_status", i);
 
                FuncclfofuL_1_51Models.Add(reqCommand);
            }
            return FuncclfofuL_1_51Models;
        }
 
        //逻辑_清算外盘期货_公用_数据归历史定时任务
        public static List<FuncclfofuL_1_51Model> GetFuncclfofuL_1_51Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncclfofuL_1_51Models = new List<FuncclfofuL_1_51Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncclfofuL_1_51Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.task_strike_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STRIKE_STATUS_STR);
                FuncclfofuL_1_51Models.Add(reqCommand);
            }
            return FuncclfofuL_1_51Models;
        }
 
    }
}
