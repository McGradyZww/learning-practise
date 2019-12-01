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

    public static class RiskSecuDim
    {
        //逻辑_风控证券_维度_查询指数类型
        public static List<FuncrksecuL_3_1Model> GetFuncrksecuL_3_1Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrksecuL_3_1Models = new List<FuncrksecuL_3_1Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrksecuL_3_1Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.index_no = packer.GetIntbyName("index_no", i);
                reqCommand.index_code = packer.GetStrbyName("index_code", i);
                reqCommand.index_name = packer.GetStrbyName("index_name", i);
                reqCommand.index_build_orgn = packer.GetStrbyName("index_build_orgn", i);
                reqCommand.weight_type = packer.GetIntbyName("weight_type", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncrksecuL_3_1Models.Add(reqCommand);
            }
            return FuncrksecuL_3_1Models;
        }
 
        //逻辑_风控证券_维度_查询指数类型
        public static List<FuncrksecuL_3_1Model> GetFuncrksecuL_3_1Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrksecuL_3_1Models = new List<FuncrksecuL_3_1Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrksecuL_3_1Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.index_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDEX_NO_INT);
                    reqCommand.index_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_INDEX_CODE_STR);
                    reqCommand.index_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_INDEX_NAME_STR);
                    reqCommand.index_build_orgn = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_INDEX_BUILD_ORGN_STR);
                    reqCommand.weight_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WEIGHT_TYPE_INT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncrksecuL_3_1Models.Add(reqCommand);
                }
            }
            return FuncrksecuL_3_1Models;
        }
 
        //逻辑_风控证券_维度_查询指数证券代码
        public static List<FuncrksecuL_3_2Model> GetFuncrksecuL_3_2Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrksecuL_3_2Models = new List<FuncrksecuL_3_2Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrksecuL_3_2Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.index_no = packer.GetIntbyName("index_no", i);
                reqCommand.index_code = packer.GetStrbyName("index_code", i);
                reqCommand.index_name = packer.GetStrbyName("index_name", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_name = packer.GetStrbyName("stock_name", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.weight_value = packer.GetDoublebyName("weight_value", i);
                reqCommand.weight_ratio = packer.GetDoublebyName("weight_ratio", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncrksecuL_3_2Models.Add(reqCommand);
            }
            return FuncrksecuL_3_2Models;
        }
 
        //逻辑_风控证券_维度_查询指数证券代码
        public static List<FuncrksecuL_3_2Model> GetFuncrksecuL_3_2Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrksecuL_3_2Models = new List<FuncrksecuL_3_2Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrksecuL_3_2Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.index_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDEX_NO_INT);
                    reqCommand.index_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_INDEX_CODE_STR);
                    reqCommand.index_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_INDEX_NAME_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.weight_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WEIGHT_VALUE_FLOAT);
                    reqCommand.weight_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WEIGHT_RATIO_FLOAT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncrksecuL_3_2Models.Add(reqCommand);
                }
            }
            return FuncrksecuL_3_2Models;
        }
 
        //逻辑_风控证券_维度_查询行业类型
        public static List<FuncrksecuL_3_3Model> GetFuncrksecuL_3_3Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrksecuL_3_3Models = new List<FuncrksecuL_3_3Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrksecuL_3_3Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.indu_type_no = packer.GetIntbyName("indu_type_no", i);
                reqCommand.indu_type_name = packer.GetStrbyName("indu_type_name", i);
                reqCommand.indu_bulid_orgn = packer.GetStrbyName("indu_bulid_orgn", i);
                reqCommand.indu_level_total = packer.GetIntbyName("indu_level_total", i);
                reqCommand.weight_type = packer.GetIntbyName("weight_type", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncrksecuL_3_3Models.Add(reqCommand);
            }
            return FuncrksecuL_3_3Models;
        }
 
        //逻辑_风控证券_维度_查询行业类型
        public static List<FuncrksecuL_3_3Model> GetFuncrksecuL_3_3Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrksecuL_3_3Models = new List<FuncrksecuL_3_3Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrksecuL_3_3Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.indu_type_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDU_TYPE_NO_INT);
                    reqCommand.indu_type_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_INDU_TYPE_NAME_STR);
                    reqCommand.indu_bulid_orgn = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_INDU_BULID_ORGN_STR);
                    reqCommand.indu_level_total = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDU_LEVEL_TOTAL_INT);
                    reqCommand.weight_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WEIGHT_TYPE_INT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncrksecuL_3_3Models.Add(reqCommand);
                }
            }
            return FuncrksecuL_3_3Models;
        }
 
        //逻辑_风控证券_维度_查询行业层级
        public static List<FuncrksecuL_3_4Model> GetFuncrksecuL_3_4Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrksecuL_3_4Models = new List<FuncrksecuL_3_4Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrksecuL_3_4Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.indu_type_no = packer.GetIntbyName("indu_type_no", i);
                reqCommand.indu_code = packer.GetStrbyName("indu_code", i);
                reqCommand.indu_name = packer.GetStrbyName("indu_name", i);
                reqCommand.indu_level_total = packer.GetIntbyName("indu_level_total", i);
                reqCommand.indu_level = packer.GetIntbyName("indu_level", i);
                reqCommand.highup_indu_code = packer.GetStrbyName("highup_indu_code", i);
                reqCommand.weight_type = packer.GetIntbyName("weight_type", i);
                reqCommand.weight_value = packer.GetDoublebyName("weight_value", i);
                reqCommand.weight_ratio = packer.GetDoublebyName("weight_ratio", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncrksecuL_3_4Models.Add(reqCommand);
            }
            return FuncrksecuL_3_4Models;
        }
 
        //逻辑_风控证券_维度_查询行业层级
        public static List<FuncrksecuL_3_4Model> GetFuncrksecuL_3_4Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrksecuL_3_4Models = new List<FuncrksecuL_3_4Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrksecuL_3_4Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.indu_type_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDU_TYPE_NO_INT);
                    reqCommand.indu_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_INDU_CODE_STR);
                    reqCommand.indu_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_INDU_NAME_STR);
                    reqCommand.indu_level_total = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDU_LEVEL_TOTAL_INT);
                    reqCommand.indu_level = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDU_LEVEL_INT);
                    reqCommand.highup_indu_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_HIGHUP_INDU_CODE_STR);
                    reqCommand.weight_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WEIGHT_TYPE_INT);
                    reqCommand.weight_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WEIGHT_VALUE_FLOAT);
                    reqCommand.weight_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WEIGHT_RATIO_FLOAT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncrksecuL_3_4Models.Add(reqCommand);
                }
            }
            return FuncrksecuL_3_4Models;
        }
 
        //逻辑_风控证券_维度_查询行业证券代码
        public static List<FuncrksecuL_3_5Model> GetFuncrksecuL_3_5Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrksecuL_3_5Models = new List<FuncrksecuL_3_5Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrksecuL_3_5Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.indu_type_no = packer.GetIntbyName("indu_type_no", i);
                reqCommand.indu_code = packer.GetStrbyName("indu_code", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.stock_name = packer.GetStrbyName("stock_name", i);
                reqCommand.weight_value = packer.GetDoublebyName("weight_value", i);
                reqCommand.weight_ratio = packer.GetDoublebyName("weight_ratio", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncrksecuL_3_5Models.Add(reqCommand);
            }
            return FuncrksecuL_3_5Models;
        }
 
        //逻辑_风控证券_维度_查询行业证券代码
        public static List<FuncrksecuL_3_5Model> GetFuncrksecuL_3_5Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrksecuL_3_5Models = new List<FuncrksecuL_3_5Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrksecuL_3_5Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.indu_type_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDU_TYPE_NO_INT);
                    reqCommand.indu_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_INDU_CODE_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    reqCommand.weight_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WEIGHT_VALUE_FLOAT);
                    reqCommand.weight_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WEIGHT_RATIO_FLOAT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncrksecuL_3_5Models.Add(reqCommand);
                }
            }
            return FuncrksecuL_3_5Models;
        }
 
        //逻辑_风控证券_维度_查询自定义维度类型
        public static List<FuncrksecuL_3_6Model> GetFuncrksecuL_3_6Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrksecuL_3_6Models = new List<FuncrksecuL_3_6Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrksecuL_3_6Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.dime_type_code = packer.GetStrbyName("dime_type_code", i);
                reqCommand.dime_type_name = packer.GetStrbyName("dime_type_name", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncrksecuL_3_6Models.Add(reqCommand);
            }
            return FuncrksecuL_3_6Models;
        }
 
        //逻辑_风控证券_维度_查询自定义维度类型
        public static List<FuncrksecuL_3_6Model> GetFuncrksecuL_3_6Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrksecuL_3_6Models = new List<FuncrksecuL_3_6Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrksecuL_3_6Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.dime_type_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DIME_TYPE_CODE_STR);
                    reqCommand.dime_type_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DIME_TYPE_NAME_STR);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncrksecuL_3_6Models.Add(reqCommand);
                }
            }
            return FuncrksecuL_3_6Models;
        }
 
        //逻辑_风控证券_维度_查询自定义维度证券代码
        public static List<FuncrksecuL_3_7Model> GetFuncrksecuL_3_7Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrksecuL_3_7Models = new List<FuncrksecuL_3_7Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrksecuL_3_7Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.dime_type_code = packer.GetStrbyName("dime_type_code", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_name = packer.GetStrbyName("stock_name", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.weight_value = packer.GetDoublebyName("weight_value", i);
                reqCommand.weight_ratio = packer.GetDoublebyName("weight_ratio", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncrksecuL_3_7Models.Add(reqCommand);
            }
            return FuncrksecuL_3_7Models;
        }
 
        //逻辑_风控证券_维度_查询自定义维度证券代码
        public static List<FuncrksecuL_3_7Model> GetFuncrksecuL_3_7Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrksecuL_3_7Models = new List<FuncrksecuL_3_7Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrksecuL_3_7Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.dime_type_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DIME_TYPE_CODE_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.weight_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WEIGHT_VALUE_FLOAT);
                    reqCommand.weight_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WEIGHT_RATIO_FLOAT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncrksecuL_3_7Models.Add(reqCommand);
                }
            }
            return FuncrksecuL_3_7Models;
        }
 
        //逻辑_风控证券_维度_查询机构维度类型
        public static List<FuncrksecuL_3_11Model> GetFuncrksecuL_3_11Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrksecuL_3_11Models = new List<FuncrksecuL_3_11Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrksecuL_3_11Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.user_dim_type = packer.GetIntbyName("user_dim_type", i);
                reqCommand.dime_type_code = packer.GetStrbyName("dime_type_code", i);
                reqCommand.dime_type_name = packer.GetStrbyName("dime_type_name", i);
                reqCommand.weight_type = packer.GetIntbyName("weight_type", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncrksecuL_3_11Models.Add(reqCommand);
            }
            return FuncrksecuL_3_11Models;
        }
 
        //逻辑_风控证券_维度_查询机构维度类型
        public static List<FuncrksecuL_3_11Model> GetFuncrksecuL_3_11Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrksecuL_3_11Models = new List<FuncrksecuL_3_11Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrksecuL_3_11Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.user_dim_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_USER_DIM_TYPE_INT);
                    reqCommand.dime_type_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DIME_TYPE_CODE_STR);
                    reqCommand.dime_type_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DIME_TYPE_NAME_STR);
                    reqCommand.weight_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WEIGHT_TYPE_INT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncrksecuL_3_11Models.Add(reqCommand);
                }
            }
            return FuncrksecuL_3_11Models;
        }
 
        //逻辑_风控证券_维度_查询机构维度证券代码
        public static List<FuncrksecuL_3_14Model> GetFuncrksecuL_3_14Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrksecuL_3_14Models = new List<FuncrksecuL_3_14Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrksecuL_3_14Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.dime_type_code = packer.GetStrbyName("dime_type_code", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_name = packer.GetStrbyName("stock_name", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.weight_value = packer.GetDoublebyName("weight_value", i);
                reqCommand.weight_ratio = packer.GetDoublebyName("weight_ratio", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
 
                FuncrksecuL_3_14Models.Add(reqCommand);
            }
            return FuncrksecuL_3_14Models;
        }
 
        //逻辑_风控证券_维度_查询机构维度证券代码
        public static List<FuncrksecuL_3_14Model> GetFuncrksecuL_3_14Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrksecuL_3_14Models = new List<FuncrksecuL_3_14Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrksecuL_3_14Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.dime_type_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DIME_TYPE_CODE_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.weight_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WEIGHT_VALUE_FLOAT);
                    reqCommand.weight_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WEIGHT_RATIO_FLOAT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    reqCommand.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    FuncrksecuL_3_14Models.Add(reqCommand);
                }
            }
            return FuncrksecuL_3_14Models;
        }
 
        //逻辑_风控证券_维度_维度序号获取维度编码
        public static List<FuncrksecuL_3_15Model> GetFuncrksecuL_3_15Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrksecuL_3_15Models = new List<FuncrksecuL_3_15Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrksecuL_3_15Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.dime_type = packer.GetIntbyName("dime_type", i);
                reqCommand.ctrl_cond_dim_code_str = packer.GetStrbyName("ctrl_cond_dim_code_str", i);
 
                FuncrksecuL_3_15Models.Add(reqCommand);
            }
            return FuncrksecuL_3_15Models;
        }
 
        //逻辑_风控证券_维度_维度序号获取维度编码
        public static List<FuncrksecuL_3_15Model> GetFuncrksecuL_3_15Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrksecuL_3_15Models = new List<FuncrksecuL_3_15Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrksecuL_3_15Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.dime_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DIME_TYPE_INT);
                    reqCommand.ctrl_cond_dim_code_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CTRL_COND_DIM_CODE_STR_STR);
                    FuncrksecuL_3_15Models.Add(reqCommand);
                }
            }
            return FuncrksecuL_3_15Models;
        }
 
        //逻辑_风控证券_维度_维度编码获取维度序号
        public static List<FuncrksecuL_3_16Model> GetFuncrksecuL_3_16Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrksecuL_3_16Models = new List<FuncrksecuL_3_16Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrksecuL_3_16Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.dime_id = packer.GetInt64byName("dime_id", i);
 
                FuncrksecuL_3_16Models.Add(reqCommand);
            }
            return FuncrksecuL_3_16Models;
        }
 
        //逻辑_风控证券_维度_维度编码获取维度序号
        public static List<FuncrksecuL_3_16Model> GetFuncrksecuL_3_16Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrksecuL_3_16Models = new List<FuncrksecuL_3_16Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncrksecuL_3_16Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.dime_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_DIME_ID_INT64);
                FuncrksecuL_3_16Models.Add(reqCommand);
            }
            return FuncrksecuL_3_16Models;
        }
 
        //逻辑_风控证券_维度_查询证券代码股票池
        public static List<FuncrksecuL_3_24Model> GetFuncrksecuL_3_24Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrksecuL_3_24Models = new List<FuncrksecuL_3_24Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrksecuL_3_24Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncrksecuL_3_24Models.Add(reqCommand);
            }
            return FuncrksecuL_3_24Models;
        }
 
        //逻辑_风控证券_维度_查询证券代码股票池
        public static List<FuncrksecuL_3_24Model> GetFuncrksecuL_3_24Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrksecuL_3_24Models = new List<FuncrksecuL_3_24Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrksecuL_3_24Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncrksecuL_3_24Models.Add(reqCommand);
                }
            }
            return FuncrksecuL_3_24Models;
        }
 
    }
}
