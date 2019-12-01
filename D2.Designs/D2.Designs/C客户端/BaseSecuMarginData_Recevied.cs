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

    public static class BaseSecuMarginData
    {
        //逻辑_公共_融资融券基础数据_新增可冲抵保证金证券表
        public static List<FuncpubL_29_1Model> GetFuncpubL_29_1Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_29_1Models = new List<FuncpubL_29_1Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_29_1Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
 
                FuncpubL_29_1Models.Add(reqCommand);
            }
            return FuncpubL_29_1Models;
        }
 
        //逻辑_公共_融资融券基础数据_新增可冲抵保证金证券表
        public static List<FuncpubL_29_1Model> GetFuncpubL_29_1Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_29_1Models = new List<FuncpubL_29_1Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncpubL_29_1Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                FuncpubL_29_1Models.Add(reqCommand);
            }
            return FuncpubL_29_1Models;
        }
 
        //逻辑_公共_融资融券基础数据_查询可冲抵保证金证券表
        public static List<FuncpubL_29_4Model> GetFuncpubL_29_4Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_29_4Models = new List<FuncpubL_29_4Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_29_4Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.discount_rate = packer.GetDoublebyName("discount_rate", i);
                reqCommand.offset_status = packer.GetIntbyName("offset_status", i);
 
                FuncpubL_29_4Models.Add(reqCommand);
            }
            return FuncpubL_29_4Models;
        }
 
        //逻辑_公共_融资融券基础数据_查询可冲抵保证金证券表
        public static List<FuncpubL_29_4Model> GetFuncpubL_29_4Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_29_4Models = new List<FuncpubL_29_4Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_29_4Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.discount_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DISCOUNT_RATE_FLOAT);
                    reqCommand.offset_status = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OFFSET_STATUS_INT);
                    FuncpubL_29_4Models.Add(reqCommand);
                }
            }
            return FuncpubL_29_4Models;
        }
 
        //逻辑_公共_融资融券基础数据_新增融资融券配置表
        public static List<FuncpubL_29_5Model> GetFuncpubL_29_5Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_29_5Models = new List<FuncpubL_29_5Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_29_5Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
 
                FuncpubL_29_5Models.Add(reqCommand);
            }
            return FuncpubL_29_5Models;
        }
 
        //逻辑_公共_融资融券基础数据_新增融资融券配置表
        public static List<FuncpubL_29_5Model> GetFuncpubL_29_5Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_29_5Models = new List<FuncpubL_29_5Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncpubL_29_5Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                FuncpubL_29_5Models.Add(reqCommand);
            }
            return FuncpubL_29_5Models;
        }
 
        //逻辑_公共_融资融券基础数据_查询融资融券配置表
        public static List<FuncpubL_29_8Model> GetFuncpubL_29_8Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_29_8Models = new List<FuncpubL_29_8Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_29_8Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.fina_year_intrst_rate = packer.GetDoublebyName("fina_year_intrst_rate", i);
                reqCommand.secu_loan_year_intrst_rate = packer.GetDoublebyName("secu_loan_year_intrst_rate", i);
                reqCommand.fina_pen_intrst_rate = packer.GetDoublebyName("fina_pen_intrst_rate", i);
                reqCommand.secu_loan_pen_intrst_rate = packer.GetDoublebyName("secu_loan_pen_intrst_rate", i);
                reqCommand.intrst_sett_day = packer.GetIntbyName("intrst_sett_day", i);
 
                FuncpubL_29_8Models.Add(reqCommand);
            }
            return FuncpubL_29_8Models;
        }
 
        //逻辑_公共_融资融券基础数据_查询融资融券配置表
        public static List<FuncpubL_29_8Model> GetFuncpubL_29_8Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_29_8Models = new List<FuncpubL_29_8Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_29_8Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.fina_year_intrst_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_YEAR_INTRST_RATE_FLOAT);
                    reqCommand.secu_loan_year_intrst_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SECU_LOAN_YEAR_INTRST_RATE_FLOAT);
                    reqCommand.fina_pen_intrst_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_PEN_INTRST_RATE_FLOAT);
                    reqCommand.secu_loan_pen_intrst_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SECU_LOAN_PEN_INTRST_RATE_FLOAT);
                    reqCommand.intrst_sett_day = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_SETT_DAY_INT);
                    FuncpubL_29_8Models.Add(reqCommand);
                }
            }
            return FuncpubL_29_8Models;
        }
 
        //逻辑_公共_融资融券基础数据_新增融资融券标的证券表
        public static List<FuncpubL_29_9Model> GetFuncpubL_29_9Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_29_9Models = new List<FuncpubL_29_9Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_29_9Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
 
                FuncpubL_29_9Models.Add(reqCommand);
            }
            return FuncpubL_29_9Models;
        }
 
        //逻辑_公共_融资融券基础数据_新增融资融券标的证券表
        public static List<FuncpubL_29_9Model> GetFuncpubL_29_9Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_29_9Models = new List<FuncpubL_29_9Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncpubL_29_9Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                FuncpubL_29_9Models.Add(reqCommand);
            }
            return FuncpubL_29_9Models;
        }
 
        //逻辑_公共_融资融券基础数据_查询融资融券标的证券表
        public static List<FuncpubL_29_12Model> GetFuncpubL_29_12Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_29_12Models = new List<FuncpubL_29_12Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_29_12Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.fina_status = packer.GetStrbyName("fina_status", i);
                reqCommand.secu_loan_status = packer.GetStrbyName("secu_loan_status", i);
 
                FuncpubL_29_12Models.Add(reqCommand);
            }
            return FuncpubL_29_12Models;
        }
 
        //逻辑_公共_融资融券基础数据_查询融资融券标的证券表
        public static List<FuncpubL_29_12Model> GetFuncpubL_29_12Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_29_12Models = new List<FuncpubL_29_12Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_29_12Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.fina_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FINA_STATUS_STR);
                    reqCommand.secu_loan_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_SECU_LOAN_STATUS_STR);
                    FuncpubL_29_12Models.Add(reqCommand);
                }
            }
            return FuncpubL_29_12Models;
        }
 
        //逻辑_公共_融资融券基础数据_新增融资融券券商禁止标的证券表
        public static List<FuncpubL_29_13Model> GetFuncpubL_29_13Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_29_13Models = new List<FuncpubL_29_13Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_29_13Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
 
                FuncpubL_29_13Models.Add(reqCommand);
            }
            return FuncpubL_29_13Models;
        }
 
        //逻辑_公共_融资融券基础数据_新增融资融券券商禁止标的证券表
        public static List<FuncpubL_29_13Model> GetFuncpubL_29_13Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_29_13Models = new List<FuncpubL_29_13Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncpubL_29_13Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                FuncpubL_29_13Models.Add(reqCommand);
            }
            return FuncpubL_29_13Models;
        }
 
        //逻辑_公共_融资融券基础数据_查询融资融券券商禁止标的证券表
        public static List<FuncpubL_29_16Model> GetFuncpubL_29_16Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_29_16Models = new List<FuncpubL_29_16Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_29_16Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.fina_status = packer.GetStrbyName("fina_status", i);
                reqCommand.secu_loan_status = packer.GetStrbyName("secu_loan_status", i);
 
                FuncpubL_29_16Models.Add(reqCommand);
            }
            return FuncpubL_29_16Models;
        }
 
        //逻辑_公共_融资融券基础数据_查询融资融券券商禁止标的证券表
        public static List<FuncpubL_29_16Model> GetFuncpubL_29_16Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_29_16Models = new List<FuncpubL_29_16Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_29_16Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.fina_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FINA_STATUS_STR);
                    reqCommand.secu_loan_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_SECU_LOAN_STATUS_STR);
                    FuncpubL_29_16Models.Add(reqCommand);
                }
            }
            return FuncpubL_29_16Models;
        }
 
        //逻辑_公共_融资融券基础数据_新增融资融券保证金比例配置表
        public static List<FuncpubL_29_17Model> GetFuncpubL_29_17Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_29_17Models = new List<FuncpubL_29_17Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_29_17Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
 
                FuncpubL_29_17Models.Add(reqCommand);
            }
            return FuncpubL_29_17Models;
        }
 
        //逻辑_公共_融资融券基础数据_新增融资融券保证金比例配置表
        public static List<FuncpubL_29_17Model> GetFuncpubL_29_17Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_29_17Models = new List<FuncpubL_29_17Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncpubL_29_17Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                FuncpubL_29_17Models.Add(reqCommand);
            }
            return FuncpubL_29_17Models;
        }
 
        //逻辑_公共_融资融券基础数据_查询融资融券保证金比例配置表
        public static List<FuncpubL_29_20Model> GetFuncpubL_29_20Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_29_20Models = new List<FuncpubL_29_20Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_29_20Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.fina_marg_ratio = packer.GetDoublebyName("fina_marg_ratio", i);
                reqCommand.secu_loan_marg_ratio = packer.GetDoublebyName("secu_loan_marg_ratio", i);
                reqCommand.secu_loan_price_limit = packer.GetDoublebyName("secu_loan_price_limit", i);
 
                FuncpubL_29_20Models.Add(reqCommand);
            }
            return FuncpubL_29_20Models;
        }
 
        //逻辑_公共_融资融券基础数据_查询融资融券保证金比例配置表
        public static List<FuncpubL_29_20Model> GetFuncpubL_29_20Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_29_20Models = new List<FuncpubL_29_20Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_29_20Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.fina_marg_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_MARG_RATIO_FLOAT);
                    reqCommand.secu_loan_marg_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SECU_LOAN_MARG_RATIO_FLOAT);
                    reqCommand.secu_loan_price_limit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SECU_LOAN_PRICE_LIMIT_FLOAT);
                    FuncpubL_29_20Models.Add(reqCommand);
                }
            }
            return FuncpubL_29_20Models;
        }
 
        //逻辑_公共_融资融券基础数据_获取融资融券保证金比例配置
        public static List<FuncpubL_29_21Model> GetFuncpubL_29_21Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_29_21Models = new List<FuncpubL_29_21Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_29_21Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.fina_marg_ratio = packer.GetDoublebyName("fina_marg_ratio", i);
                reqCommand.secu_loan_marg_ratio = packer.GetDoublebyName("secu_loan_marg_ratio", i);
                reqCommand.secu_loan_price_limit = packer.GetDoublebyName("secu_loan_price_limit", i);
 
                FuncpubL_29_21Models.Add(reqCommand);
            }
            return FuncpubL_29_21Models;
        }
 
        //逻辑_公共_融资融券基础数据_获取融资融券保证金比例配置
        public static List<FuncpubL_29_21Model> GetFuncpubL_29_21Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_29_21Models = new List<FuncpubL_29_21Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncpubL_29_21Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.fina_marg_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_MARG_RATIO_FLOAT);
                reqCommand.secu_loan_marg_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SECU_LOAN_MARG_RATIO_FLOAT);
                reqCommand.secu_loan_price_limit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SECU_LOAN_PRICE_LIMIT_FLOAT);
                FuncpubL_29_21Models.Add(reqCommand);
            }
            return FuncpubL_29_21Models;
        }
 
        //逻辑_公共_融资融券基础数据_获取可冲抵保证金证券表
        public static List<FuncpubL_29_22Model> GetFuncpubL_29_22Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_29_22Models = new List<FuncpubL_29_22Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_29_22Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.discount_rate = packer.GetDoublebyName("discount_rate", i);
                reqCommand.offset_status = packer.GetIntbyName("offset_status", i);
 
                FuncpubL_29_22Models.Add(reqCommand);
            }
            return FuncpubL_29_22Models;
        }
 
        //逻辑_公共_融资融券基础数据_获取可冲抵保证金证券表
        public static List<FuncpubL_29_22Model> GetFuncpubL_29_22Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_29_22Models = new List<FuncpubL_29_22Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_29_22Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.discount_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DISCOUNT_RATE_FLOAT);
                    reqCommand.offset_status = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OFFSET_STATUS_INT);
                    FuncpubL_29_22Models.Add(reqCommand);
                }
            }
            return FuncpubL_29_22Models;
        }
 
        //逻辑_公共_融资融券基础数据_查询机构融资融券保证金比例
        public static List<FuncpubL_29_23Model> GetFuncpubL_29_23Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_29_23Models = new List<FuncpubL_29_23Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_29_23Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.fina_marg_ratio = packer.GetDoublebyName("fina_marg_ratio", i);
                reqCommand.secu_loan_marg_ratio = packer.GetDoublebyName("secu_loan_marg_ratio", i);
                reqCommand.secu_loan_price_limit = packer.GetDoublebyName("secu_loan_price_limit", i);
 
                FuncpubL_29_23Models.Add(reqCommand);
            }
            return FuncpubL_29_23Models;
        }
 
        //逻辑_公共_融资融券基础数据_查询机构融资融券保证金比例
        public static List<FuncpubL_29_23Model> GetFuncpubL_29_23Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_29_23Models = new List<FuncpubL_29_23Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_29_23Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.fina_marg_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_MARG_RATIO_FLOAT);
                    reqCommand.secu_loan_marg_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SECU_LOAN_MARG_RATIO_FLOAT);
                    reqCommand.secu_loan_price_limit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SECU_LOAN_PRICE_LIMIT_FLOAT);
                    FuncpubL_29_23Models.Add(reqCommand);
                }
            }
            return FuncpubL_29_23Models;
        }
 
    }
}
