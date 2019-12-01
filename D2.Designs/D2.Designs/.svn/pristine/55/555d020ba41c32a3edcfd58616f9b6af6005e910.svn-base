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

    public static class TrdSecuPublic
    {
        //逻辑_交易证券_公用_新增篮子
        public static List<FunctdsecuL_1_11Model> GetFunctdsecuL_1_11Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_1_11Models = new List<FunctdsecuL_1_11Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_1_11Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.basket_id = packer.GetInt64byName("basket_id", i);
 
                FunctdsecuL_1_11Models.Add(reqCommand);
            }
            return FunctdsecuL_1_11Models;
        }
 
        //逻辑_交易证券_公用_新增篮子
        public static List<FunctdsecuL_1_11Model> GetFunctdsecuL_1_11Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_1_11Models = new List<FunctdsecuL_1_11Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_1_11Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.basket_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_ID_INT64);
                FunctdsecuL_1_11Models.Add(reqCommand);
            }
            return FunctdsecuL_1_11Models;
        }
 
        //逻辑_交易证券_公用_查询篮子
        public static List<FunctdsecuL_1_14Model> GetFunctdsecuL_1_14Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_1_14Models = new List<FunctdsecuL_1_14Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_1_14Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.basket_name = packer.GetStrbyName("basket_name", i);
                reqCommand.weight_type = packer.GetIntbyName("weight_type", i);
                reqCommand.is_public = packer.GetIntbyName("is_public", i);
                reqCommand.compos_count = packer.GetIntbyName("compos_count", i);
                reqCommand.basket_status = packer.GetStrbyName("basket_status", i);
                reqCommand.basket_id = packer.GetInt64byName("basket_id", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.cash_replace_amt = packer.GetDoublebyName("cash_replace_amt", i);
 
                FunctdsecuL_1_14Models.Add(reqCommand);
            }
            return FunctdsecuL_1_14Models;
        }
 
        //逻辑_交易证券_公用_查询篮子
        public static List<FunctdsecuL_1_14Model> GetFunctdsecuL_1_14Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_1_14Models = new List<FunctdsecuL_1_14Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_1_14Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.basket_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_NAME_STR);
                    reqCommand.weight_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WEIGHT_TYPE_INT);
                    reqCommand.is_public = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_PUBLIC_INT);
                    reqCommand.compos_count = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMPOS_COUNT_INT);
                    reqCommand.basket_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_STATUS_STR);
                    reqCommand.basket_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_ID_INT64);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.cash_replace_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_REPLACE_AMT_FLOAT);
                    FunctdsecuL_1_14Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_1_14Models;
        }
 
        //逻辑_交易证券_公用_新增篮子成份
        public static List<FunctdsecuL_1_21Model> GetFunctdsecuL_1_21Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_1_21Models = new List<FunctdsecuL_1_21Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_1_21Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
 
                FunctdsecuL_1_21Models.Add(reqCommand);
            }
            return FunctdsecuL_1_21Models;
        }
 
        //逻辑_交易证券_公用_新增篮子成份
        public static List<FunctdsecuL_1_21Model> GetFunctdsecuL_1_21Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_1_21Models = new List<FunctdsecuL_1_21Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_1_21Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                FunctdsecuL_1_21Models.Add(reqCommand);
            }
            return FunctdsecuL_1_21Models;
        }
 
        //逻辑_交易证券_公用_查询篮子成份
        public static List<FunctdsecuL_1_24Model> GetFunctdsecuL_1_24Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_1_24Models = new List<FunctdsecuL_1_24Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_1_24Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.basket_id = packer.GetInt64byName("basket_id", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.compos_qty = packer.GetDoublebyName("compos_qty", i);
                reqCommand.compos_ratio = packer.GetDoublebyName("compos_ratio", i);
                reqCommand.repl_stock_code_no = packer.GetIntbyName("repl_stock_code_no", i);
                reqCommand.repl_qty = packer.GetDoublebyName("repl_qty", i);
 
                FunctdsecuL_1_24Models.Add(reqCommand);
            }
            return FunctdsecuL_1_24Models;
        }
 
        //逻辑_交易证券_公用_查询篮子成份
        public static List<FunctdsecuL_1_24Model> GetFunctdsecuL_1_24Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_1_24Models = new List<FunctdsecuL_1_24Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_1_24Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.basket_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_ID_INT64);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.compos_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMPOS_QTY_FLOAT);
                    reqCommand.compos_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMPOS_RATIO_FLOAT);
                    reqCommand.repl_stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPL_STOCK_CODE_NO_INT);
                    reqCommand.repl_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPL_QTY_FLOAT);
                    FunctdsecuL_1_24Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_1_24Models;
        }
 
        //逻辑_交易证券_公用_数据归历史
        public static List<FunctdsecuL_1_51Model> GetFunctdsecuL_1_51Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_1_51Models = new List<FunctdsecuL_1_51Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_1_51Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.task_strike_status = packer.GetStrbyName("task_strike_status", i);
 
                FunctdsecuL_1_51Models.Add(reqCommand);
            }
            return FunctdsecuL_1_51Models;
        }
 
        //逻辑_交易证券_公用_数据归历史
        public static List<FunctdsecuL_1_51Model> GetFunctdsecuL_1_51Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_1_51Models = new List<FunctdsecuL_1_51Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_1_51Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.task_strike_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STRIKE_STATUS_STR);
                FunctdsecuL_1_51Models.Add(reqCommand);
            }
            return FunctdsecuL_1_51Models;
        }
 
        //逻辑_交易证券_公用_数据归档
        public static List<FunctdsecuL_1_54Model> GetFunctdsecuL_1_54Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_1_54Models = new List<FunctdsecuL_1_54Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_1_54Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.task_strike_status = packer.GetStrbyName("task_strike_status", i);
 
                FunctdsecuL_1_54Models.Add(reqCommand);
            }
            return FunctdsecuL_1_54Models;
        }
 
        //逻辑_交易证券_公用_数据归档
        public static List<FunctdsecuL_1_54Model> GetFunctdsecuL_1_54Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_1_54Models = new List<FunctdsecuL_1_54Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_1_54Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.task_strike_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STRIKE_STATUS_STR);
                FunctdsecuL_1_54Models.Add(reqCommand);
            }
            return FunctdsecuL_1_54Models;
        }
 
        //逻辑_交易证券_公用_获取业务记录编号
        public static List<FunctdsecuL_1_901Model> GetFunctdsecuL_1_901Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_1_901Models = new List<FunctdsecuL_1_901Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_1_901Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.curr_no = packer.GetInt64byName("curr_no", i);
 
                FunctdsecuL_1_901Models.Add(reqCommand);
            }
            return FunctdsecuL_1_901Models;
        }
 
        //逻辑_交易证券_公用_获取业务记录编号
        public static List<FunctdsecuL_1_901Model> GetFunctdsecuL_1_901Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_1_901Models = new List<FunctdsecuL_1_901Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_1_901Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.curr_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_CURR_NO_INT64);
                FunctdsecuL_1_901Models.Add(reqCommand);
            }
            return FunctdsecuL_1_901Models;
        }
 
        //逻辑_交易证券_公用_新增组合
        public static List<FunctdsecuL_1_31Model> GetFunctdsecuL_1_31Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_1_31Models = new List<FunctdsecuL_1_31Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_1_31Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.combo_id = packer.GetInt64byName("combo_id", i);
 
                FunctdsecuL_1_31Models.Add(reqCommand);
            }
            return FunctdsecuL_1_31Models;
        }
 
        //逻辑_交易证券_公用_新增组合
        public static List<FunctdsecuL_1_31Model> GetFunctdsecuL_1_31Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_1_31Models = new List<FunctdsecuL_1_31Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_1_31Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.combo_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_ID_INT64);
                FunctdsecuL_1_31Models.Add(reqCommand);
            }
            return FunctdsecuL_1_31Models;
        }
 
        //逻辑_交易证券_公用_查询组合
        public static List<FunctdsecuL_1_34Model> GetFunctdsecuL_1_34Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_1_34Models = new List<FunctdsecuL_1_34Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_1_34Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.combo_code = packer.GetStrbyName("combo_code", i);
                reqCommand.comb_name = packer.GetStrbyName("comb_name", i);
                reqCommand.is_public = packer.GetIntbyName("is_public", i);
                reqCommand.create_failure_validity_date = packer.GetIntbyName("create_failure_validity_date", i);
                reqCommand.create_end_validity_date = packer.GetIntbyName("create_end_validity_date", i);
                reqCommand.rebalance_failure_validity_date = packer.GetIntbyName("rebalance_failure_validity_date", i);
                reqCommand.rebalance_end_validity_date = packer.GetIntbyName("rebalance_end_validity_date", i);
                reqCommand.repair_failure_validity_date = packer.GetIntbyName("repair_failure_validity_date", i);
                reqCommand.repair_end_validity_date = packer.GetIntbyName("repair_end_validity_date", i);
                reqCommand.broke_validity_date = packer.GetIntbyName("broke_validity_date", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdsecuL_1_34Models.Add(reqCommand);
            }
            return FunctdsecuL_1_34Models;
        }
 
        //逻辑_交易证券_公用_查询组合
        public static List<FunctdsecuL_1_34Model> GetFunctdsecuL_1_34Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_1_34Models = new List<FunctdsecuL_1_34Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_1_34Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.combo_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_CODE_STR);
                    reqCommand.comb_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMB_NAME_STR);
                    reqCommand.is_public = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_PUBLIC_INT);
                    reqCommand.create_failure_validity_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_FAILURE_VALIDITY_DATE_INT);
                    reqCommand.create_end_validity_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_END_VALIDITY_DATE_INT);
                    reqCommand.rebalance_failure_validity_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REBALANCE_FAILURE_VALIDITY_DATE_INT);
                    reqCommand.rebalance_end_validity_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REBALANCE_END_VALIDITY_DATE_INT);
                    reqCommand.repair_failure_validity_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPAIR_FAILURE_VALIDITY_DATE_INT);
                    reqCommand.repair_end_validity_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPAIR_END_VALIDITY_DATE_INT);
                    reqCommand.broke_validity_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BROKE_VALIDITY_DATE_INT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdsecuL_1_34Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_1_34Models;
        }
 
        //逻辑_交易证券_公用_新增组合证券
        public static List<FunctdsecuL_1_35Model> GetFunctdsecuL_1_35Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_1_35Models = new List<FunctdsecuL_1_35Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_1_35Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.combo_stock_id = packer.GetInt64byName("combo_stock_id", i);
 
                FunctdsecuL_1_35Models.Add(reqCommand);
            }
            return FunctdsecuL_1_35Models;
        }
 
        //逻辑_交易证券_公用_新增组合证券
        public static List<FunctdsecuL_1_35Model> GetFunctdsecuL_1_35Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_1_35Models = new List<FunctdsecuL_1_35Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_1_35Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.combo_stock_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_STOCK_ID_INT64);
                FunctdsecuL_1_35Models.Add(reqCommand);
            }
            return FunctdsecuL_1_35Models;
        }
 
        //逻辑_交易证券_公用_查询组合证券
        public static List<FunctdsecuL_1_38Model> GetFunctdsecuL_1_38Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_1_38Models = new List<FunctdsecuL_1_38Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_1_38Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.combo_code = packer.GetStrbyName("combo_code", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.combo_ratio = packer.GetDoublebyName("combo_ratio", i);
                reqCommand.combo_qty = packer.GetDoublebyName("combo_qty", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdsecuL_1_38Models.Add(reqCommand);
            }
            return FunctdsecuL_1_38Models;
        }
 
        //逻辑_交易证券_公用_查询组合证券
        public static List<FunctdsecuL_1_38Model> GetFunctdsecuL_1_38Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_1_38Models = new List<FunctdsecuL_1_38Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_1_38Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.combo_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_CODE_STR);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.combo_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_RATIO_FLOAT);
                    reqCommand.combo_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_QTY_FLOAT);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdsecuL_1_38Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_1_38Models;
        }
 
        //逻辑_交易证券_公用_转入产品证券负债明细记录
        public static List<FunctdsecuL_1_56Model> GetFunctdsecuL_1_56Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_1_56Models = new List<FunctdsecuL_1_56Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_1_56Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.task_strike_status = packer.GetStrbyName("task_strike_status", i);
 
                FunctdsecuL_1_56Models.Add(reqCommand);
            }
            return FunctdsecuL_1_56Models;
        }
 
        //逻辑_交易证券_公用_转入产品证券负债明细记录
        public static List<FunctdsecuL_1_56Model> GetFunctdsecuL_1_56Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_1_56Models = new List<FunctdsecuL_1_56Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_1_56Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.task_strike_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STRIKE_STATUS_STR);
                FunctdsecuL_1_56Models.Add(reqCommand);
            }
            return FunctdsecuL_1_56Models;
        }
 
        //逻辑_交易证券_公用_新增指令自动分发规则
        public static List<FunctdsecuL_1_40Model> GetFunctdsecuL_1_40Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_1_40Models = new List<FunctdsecuL_1_40Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_1_40Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
 
                FunctdsecuL_1_40Models.Add(reqCommand);
            }
            return FunctdsecuL_1_40Models;
        }
 
        //逻辑_交易证券_公用_新增指令自动分发规则
        public static List<FunctdsecuL_1_40Model> GetFunctdsecuL_1_40Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_1_40Models = new List<FunctdsecuL_1_40Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_1_40Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                FunctdsecuL_1_40Models.Add(reqCommand);
            }
            return FunctdsecuL_1_40Models;
        }
 
        //逻辑_交易证券_公用_查询指令自动分发规则
        public static List<FunctdsecuL_1_43Model> GetFunctdsecuL_1_43Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_1_43Models = new List<FunctdsecuL_1_43Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_1_43Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.rule_name = packer.GetStrbyName("rule_name", i);
                reqCommand.prior_type = packer.GetIntbyName("prior_type", i);
                reqCommand.exch_group_no_str = packer.GetStrbyName("exch_group_no_str", i);
                reqCommand.exch_no_str = packer.GetStrbyName("exch_no_str", i);
                reqCommand.stock_type_str = packer.GetStrbyName("stock_type_str", i);
                reqCommand.stock_code_str = packer.GetStrbyName("stock_code_str", i);
                reqCommand.opor_no_str = packer.GetStrbyName("opor_no_str", i);
                reqCommand.distribute_last_trader = packer.GetIntbyName("distribute_last_trader", i);
                reqCommand.distribute_by_jobs = packer.GetIntbyName("distribute_by_jobs", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdsecuL_1_43Models.Add(reqCommand);
            }
            return FunctdsecuL_1_43Models;
        }
 
        //逻辑_交易证券_公用_查询指令自动分发规则
        public static List<FunctdsecuL_1_43Model> GetFunctdsecuL_1_43Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_1_43Models = new List<FunctdsecuL_1_43Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_1_43Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.rule_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RULE_NAME_STR);
                    reqCommand.prior_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRIOR_TYPE_INT);
                    reqCommand.exch_group_no_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_STR_STR);
                    reqCommand.exch_no_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR);
                    reqCommand.stock_type_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_STR_STR);
                    reqCommand.stock_code_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR_STR);
                    reqCommand.opor_no_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_STR_STR);
                    reqCommand.distribute_last_trader = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DISTRIBUTE_LAST_TRADER_INT);
                    reqCommand.distribute_by_jobs = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DISTRIBUTE_BY_JOBS_INT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdsecuL_1_43Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_1_43Models;
        }
 
    }
}
