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

    public static class BaseSecuData
    {
        //逻辑_公共_证券基础数据_查询证券模板
        public static List<FuncpubL_1_6Model> GetFuncpubL_1_6Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_1_6Models = new List<FuncpubL_1_6Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_1_6Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.model_name = packer.GetStrbyName("model_name", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code_feature = packer.GetStrbyName("stock_code_feature", i);
                reqCommand.stock_name_feature = packer.GetStrbyName("stock_name_feature", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
 
                FuncpubL_1_6Models.Add(reqCommand);
            }
            return FuncpubL_1_6Models;
        }
 
        //逻辑_公共_证券基础数据_查询证券模板
        public static List<FuncpubL_1_6Model> GetFuncpubL_1_6Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_1_6Models = new List<FuncpubL_1_6Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_1_6Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.model_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MODEL_NAME_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code_feature = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_FEATURE_STR);
                    reqCommand.stock_name_feature = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_FEATURE_STR);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    FuncpubL_1_6Models.Add(reqCommand);
                }
            }
            return FuncpubL_1_6Models;
        }
 
        //逻辑_公共_证券基础数据_查询证券类型
        public static List<FuncpubL_1_14Model> GetFuncpubL_1_14Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_1_14Models = new List<FuncpubL_1_14Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_1_14Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.stock_type_name = packer.GetStrbyName("stock_type_name", i);
                reqCommand.asset_type = packer.GetIntbyName("asset_type", i);
                reqCommand.par_value = packer.GetDoublebyName("par_value", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.exch_crncy_type = packer.GetStrbyName("exch_crncy_type", i);
                reqCommand.capit_reback_days = packer.GetIntbyName("capit_reback_days", i);
                reqCommand.posi_reback_days = packer.GetIntbyName("posi_reback_days", i);
                reqCommand.type_unit = packer.GetIntbyName("type_unit", i);
                reqCommand.report_unit = packer.GetIntbyName("report_unit", i);
                reqCommand.min_unit = packer.GetIntbyName("min_unit", i);
                reqCommand.max_qty = packer.GetDoublebyName("max_qty", i);
                reqCommand.min_qty = packer.GetDoublebyName("min_qty", i);
                reqCommand.is_order_dir_flag = packer.GetIntbyName("is_order_dir_flag", i);
                reqCommand.time_stamp = packer.GetIntbyName("time_stamp", i);
 
                FuncpubL_1_14Models.Add(reqCommand);
            }
            return FuncpubL_1_14Models;
        }
 
        //逻辑_公共_证券基础数据_查询证券类型
        public static List<FuncpubL_1_14Model> GetFuncpubL_1_14Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_1_14Models = new List<FuncpubL_1_14Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_1_14Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.stock_type_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_NAME_STR);
                    reqCommand.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    reqCommand.par_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_FLOAT);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.exch_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR);
                    reqCommand.capit_reback_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CAPIT_REBACK_DAYS_INT);
                    reqCommand.posi_reback_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_POSI_REBACK_DAYS_INT);
                    reqCommand.type_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TYPE_UNIT_INT);
                    reqCommand.report_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_UNIT_INT);
                    reqCommand.min_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MIN_UNIT_INT);
                    reqCommand.max_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_QTY_FLOAT);
                    reqCommand.min_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_QTY_FLOAT);
                    reqCommand.is_order_dir_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_ORDER_DIR_FLAG_INT);
                    reqCommand.time_stamp = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT);
                    FuncpubL_1_14Models.Add(reqCommand);
                }
            }
            return FuncpubL_1_14Models;
        }
 
        //逻辑_公共_证券基础数据_查询证券类型流水
        public static List<FuncpubL_1_15Model> GetFuncpubL_1_15Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_1_15Models = new List<FuncpubL_1_15Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_1_15Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.opor_co_no = packer.GetIntbyName("opor_co_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.oper_mac = packer.GetStrbyName("oper_mac", i);
                reqCommand.oper_ip_addr = packer.GetStrbyName("oper_ip_addr", i);
                reqCommand.oper_info = packer.GetStrbyName("oper_info", i);
                reqCommand.oper_way = packer.GetStrbyName("oper_way", i);
                reqCommand.oper_menu_no = packer.GetIntbyName("oper_menu_no", i);
                reqCommand.oper_func_code = packer.GetStrbyName("oper_func_code", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.jour_occur_field = packer.GetStrbyName("jour_occur_field", i);
                reqCommand.jour_after_occur_info = packer.GetStrbyName("jour_after_occur_info", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncpubL_1_15Models.Add(reqCommand);
            }
            return FuncpubL_1_15Models;
        }
 
        //逻辑_公共_证券基础数据_查询证券类型流水
        public static List<FuncpubL_1_15Model> GetFuncpubL_1_15Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_1_15Models = new List<FuncpubL_1_15Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_1_15Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    reqCommand.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    reqCommand.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    reqCommand.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    reqCommand.oper_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MENU_NO_INT);
                    reqCommand.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    reqCommand.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncpubL_1_15Models.Add(reqCommand);
                }
            }
            return FuncpubL_1_15Models;
        }
 
        //逻辑_公共_证券基础数据_查询历史证券类型流水
        public static List<FuncpubL_1_16Model> GetFuncpubL_1_16Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_1_16Models = new List<FuncpubL_1_16Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_1_16Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.opor_co_no = packer.GetIntbyName("opor_co_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.oper_mac = packer.GetStrbyName("oper_mac", i);
                reqCommand.oper_ip_addr = packer.GetStrbyName("oper_ip_addr", i);
                reqCommand.oper_info = packer.GetStrbyName("oper_info", i);
                reqCommand.oper_way = packer.GetStrbyName("oper_way", i);
                reqCommand.oper_menu_no = packer.GetIntbyName("oper_menu_no", i);
                reqCommand.oper_func_code = packer.GetStrbyName("oper_func_code", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.jour_occur_field = packer.GetStrbyName("jour_occur_field", i);
                reqCommand.jour_after_occur_info = packer.GetStrbyName("jour_after_occur_info", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncpubL_1_16Models.Add(reqCommand);
            }
            return FuncpubL_1_16Models;
        }
 
        //逻辑_公共_证券基础数据_查询历史证券类型流水
        public static List<FuncpubL_1_16Model> GetFuncpubL_1_16Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_1_16Models = new List<FuncpubL_1_16Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_1_16Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    reqCommand.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    reqCommand.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    reqCommand.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    reqCommand.oper_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MENU_NO_INT);
                    reqCommand.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    reqCommand.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncpubL_1_16Models.Add(reqCommand);
                }
            }
            return FuncpubL_1_16Models;
        }
 
        //逻辑_公共_证券基础数据_查询证券类型订单方向
        public static List<FuncpubL_1_24Model> GetFuncpubL_1_24Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_1_24Models = new List<FuncpubL_1_24Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_1_24Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.cash_frozen_type = packer.GetIntbyName("cash_frozen_type", i);
                reqCommand.order_split_flag = packer.GetIntbyName("order_split_flag", i);
                reqCommand.min_unit = packer.GetIntbyName("min_unit", i);
                reqCommand.min_qty = packer.GetDoublebyName("min_qty", i);
                reqCommand.max_qty = packer.GetDoublebyName("max_qty", i);
                reqCommand.time_stamp = packer.GetIntbyName("time_stamp", i);
 
                FuncpubL_1_24Models.Add(reqCommand);
            }
            return FuncpubL_1_24Models;
        }
 
        //逻辑_公共_证券基础数据_查询证券类型订单方向
        public static List<FuncpubL_1_24Model> GetFuncpubL_1_24Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_1_24Models = new List<FuncpubL_1_24Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_1_24Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.cash_frozen_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CASH_FROZEN_TYPE_INT);
                    reqCommand.order_split_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_SPLIT_FLAG_INT);
                    reqCommand.min_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MIN_UNIT_INT);
                    reqCommand.min_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_QTY_FLOAT);
                    reqCommand.max_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_QTY_FLOAT);
                    reqCommand.time_stamp = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT);
                    FuncpubL_1_24Models.Add(reqCommand);
                }
            }
            return FuncpubL_1_24Models;
        }
 
        //逻辑_公共_证券基础数据_新增证券代码信息
        public static List<FuncpubL_1_41Model> GetFuncpubL_1_41Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_1_41Models = new List<FuncpubL_1_41Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_1_41Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
 
                FuncpubL_1_41Models.Add(reqCommand);
            }
            return FuncpubL_1_41Models;
        }
 
        //逻辑_公共_证券基础数据_新增证券代码信息
        public static List<FuncpubL_1_41Model> GetFuncpubL_1_41Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_1_41Models = new List<FuncpubL_1_41Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncpubL_1_41Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                FuncpubL_1_41Models.Add(reqCommand);
            }
            return FuncpubL_1_41Models;
        }
 
        //逻辑_公共_证券基础数据_查询证券信息
        public static List<FuncpubL_1_43Model> GetFuncpubL_1_43Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_1_43Models = new List<FuncpubL_1_43Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_1_43Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_name = packer.GetStrbyName("stock_name", i);
                reqCommand.pinyin_short = packer.GetStrbyName("pinyin_short", i);
 
                FuncpubL_1_43Models.Add(reqCommand);
            }
            return FuncpubL_1_43Models;
        }
 
        //逻辑_公共_证券基础数据_查询证券信息
        public static List<FuncpubL_1_43Model> GetFuncpubL_1_43Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_1_43Models = new List<FuncpubL_1_43Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_1_43Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    reqCommand.pinyin_short = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PINYIN_SHORT_STR);
                    FuncpubL_1_43Models.Add(reqCommand);
                }
            }
            return FuncpubL_1_43Models;
        }
 
        //逻辑_公共_证券基础数据_查询证券代码信息
        public static List<FuncpubL_1_44Model> GetFuncpubL_1_44Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_1_44Models = new List<FuncpubL_1_44Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_1_44Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_name = packer.GetStrbyName("stock_name", i);
                reqCommand.pinyin_short = packer.GetStrbyName("pinyin_short", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.asset_type = packer.GetIntbyName("asset_type", i);
                reqCommand.par_value = packer.GetDoublebyName("par_value", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.exch_crncy_type = packer.GetStrbyName("exch_crncy_type", i);
                reqCommand.total_stock_issue = packer.GetDoublebyName("total_stock_issue", i);
                reqCommand.circl_stock_capit = packer.GetDoublebyName("circl_stock_capit", i);
                reqCommand.capit_reback_days = packer.GetIntbyName("capit_reback_days", i);
                reqCommand.posi_reback_days = packer.GetIntbyName("posi_reback_days", i);
                reqCommand.type_unit = packer.GetIntbyName("type_unit", i);
                reqCommand.report_unit = packer.GetIntbyName("report_unit", i);
                reqCommand.min_unit = packer.GetIntbyName("min_unit", i);
                reqCommand.max_qty = packer.GetDoublebyName("max_qty", i);
                reqCommand.min_qty = packer.GetDoublebyName("min_qty", i);
                reqCommand.is_order_dir_flag = packer.GetIntbyName("is_order_dir_flag", i);
                reqCommand.price_up = packer.GetDoublebyName("price_up", i);
                reqCommand.price_down = packer.GetDoublebyName("price_down", i);
                reqCommand.step_price = packer.GetDoublebyName("step_price", i);
                reqCommand.fair_price = packer.GetDoublebyName("fair_price", i);
                reqCommand.stop_status = packer.GetStrbyName("stop_status", i);
                reqCommand.hk_stock_flag = packer.GetIntbyName("hk_stock_flag", i);
                reqCommand.time_stamp = packer.GetIntbyName("time_stamp", i);
 
                FuncpubL_1_44Models.Add(reqCommand);
            }
            return FuncpubL_1_44Models;
        }
 
        //逻辑_公共_证券基础数据_查询证券代码信息
        public static List<FuncpubL_1_44Model> GetFuncpubL_1_44Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_1_44Models = new List<FuncpubL_1_44Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_1_44Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    reqCommand.pinyin_short = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PINYIN_SHORT_STR);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    reqCommand.par_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_FLOAT);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.exch_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR);
                    reqCommand.total_stock_issue = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_STOCK_ISSUE_FLOAT);
                    reqCommand.circl_stock_capit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CIRCL_STOCK_CAPIT_FLOAT);
                    reqCommand.capit_reback_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CAPIT_REBACK_DAYS_INT);
                    reqCommand.posi_reback_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_POSI_REBACK_DAYS_INT);
                    reqCommand.type_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TYPE_UNIT_INT);
                    reqCommand.report_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_UNIT_INT);
                    reqCommand.min_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MIN_UNIT_INT);
                    reqCommand.max_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_QTY_FLOAT);
                    reqCommand.min_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_QTY_FLOAT);
                    reqCommand.is_order_dir_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_ORDER_DIR_FLAG_INT);
                    reqCommand.price_up = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_UP_FLOAT);
                    reqCommand.price_down = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_DOWN_FLOAT);
                    reqCommand.step_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STEP_PRICE_FLOAT);
                    reqCommand.fair_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FAIR_PRICE_FLOAT);
                    reqCommand.stop_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOP_STATUS_STR);
                    reqCommand.hk_stock_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HK_STOCK_FLAG_INT);
                    reqCommand.time_stamp = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT);
                    FuncpubL_1_44Models.Add(reqCommand);
                }
            }
            return FuncpubL_1_44Models;
        }
 
        //逻辑_公共_证券基础数据_查询证券代码信息流水
        public static List<FuncpubL_1_45Model> GetFuncpubL_1_45Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_1_45Models = new List<FuncpubL_1_45Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_1_45Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.opor_co_no = packer.GetIntbyName("opor_co_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.oper_mac = packer.GetStrbyName("oper_mac", i);
                reqCommand.oper_ip_addr = packer.GetStrbyName("oper_ip_addr", i);
                reqCommand.oper_info = packer.GetStrbyName("oper_info", i);
                reqCommand.oper_way = packer.GetStrbyName("oper_way", i);
                reqCommand.oper_menu_no = packer.GetIntbyName("oper_menu_no", i);
                reqCommand.oper_func_code = packer.GetStrbyName("oper_func_code", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.jour_occur_field = packer.GetStrbyName("jour_occur_field", i);
                reqCommand.jour_after_occur_info = packer.GetStrbyName("jour_after_occur_info", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncpubL_1_45Models.Add(reqCommand);
            }
            return FuncpubL_1_45Models;
        }
 
        //逻辑_公共_证券基础数据_查询证券代码信息流水
        public static List<FuncpubL_1_45Model> GetFuncpubL_1_45Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_1_45Models = new List<FuncpubL_1_45Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_1_45Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    reqCommand.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    reqCommand.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    reqCommand.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    reqCommand.oper_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MENU_NO_INT);
                    reqCommand.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    reqCommand.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncpubL_1_45Models.Add(reqCommand);
                }
            }
            return FuncpubL_1_45Models;
        }
 
        //逻辑_公共_证券基础数据_查询历史证券代码信息流水
        public static List<FuncpubL_1_46Model> GetFuncpubL_1_46Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_1_46Models = new List<FuncpubL_1_46Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_1_46Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.opor_co_no = packer.GetIntbyName("opor_co_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.oper_mac = packer.GetStrbyName("oper_mac", i);
                reqCommand.oper_ip_addr = packer.GetStrbyName("oper_ip_addr", i);
                reqCommand.oper_info = packer.GetStrbyName("oper_info", i);
                reqCommand.oper_way = packer.GetStrbyName("oper_way", i);
                reqCommand.oper_menu_no = packer.GetIntbyName("oper_menu_no", i);
                reqCommand.oper_func_code = packer.GetStrbyName("oper_func_code", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.jour_occur_field = packer.GetStrbyName("jour_occur_field", i);
                reqCommand.jour_after_occur_info = packer.GetStrbyName("jour_after_occur_info", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncpubL_1_46Models.Add(reqCommand);
            }
            return FuncpubL_1_46Models;
        }
 
        //逻辑_公共_证券基础数据_查询历史证券代码信息流水
        public static List<FuncpubL_1_46Model> GetFuncpubL_1_46Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_1_46Models = new List<FuncpubL_1_46Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_1_46Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    reqCommand.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    reqCommand.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    reqCommand.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    reqCommand.oper_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MENU_NO_INT);
                    reqCommand.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    reqCommand.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncpubL_1_46Models.Add(reqCommand);
                }
            }
            return FuncpubL_1_46Models;
        }
 
        //逻辑_公共_证券基础数据_查询证券代码列表
        public static List<FuncpubL_1_47Model> GetFuncpubL_1_47Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_1_47Models = new List<FuncpubL_1_47Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_1_47Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_name = packer.GetStrbyName("stock_name", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.asset_type = packer.GetIntbyName("asset_type", i);
                reqCommand.hk_stock_flag = packer.GetIntbyName("hk_stock_flag", i);
 
                FuncpubL_1_47Models.Add(reqCommand);
            }
            return FuncpubL_1_47Models;
        }
 
        //逻辑_公共_证券基础数据_查询证券代码列表
        public static List<FuncpubL_1_47Model> GetFuncpubL_1_47Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_1_47Models = new List<FuncpubL_1_47Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_1_47Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    reqCommand.hk_stock_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HK_STOCK_FLAG_INT);
                    FuncpubL_1_47Models.Add(reqCommand);
                }
            }
            return FuncpubL_1_47Models;
        }
 
        //逻辑_公共_证券基础数据_查询客户端证券代码信息
        public static List<FuncpubL_1_49Model> GetFuncpubL_1_49Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_1_49Models = new List<FuncpubL_1_49Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_1_49Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_name = packer.GetStrbyName("stock_name", i);
                reqCommand.pinyin_short = packer.GetStrbyName("pinyin_short", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.asset_type = packer.GetIntbyName("asset_type", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.capit_reback_days = packer.GetIntbyName("capit_reback_days", i);
                reqCommand.posi_reback_days = packer.GetIntbyName("posi_reback_days", i);
                reqCommand.min_unit = packer.GetIntbyName("min_unit", i);
                reqCommand.max_qty = packer.GetDoublebyName("max_qty", i);
                reqCommand.min_qty = packer.GetDoublebyName("min_qty", i);
                reqCommand.step_price = packer.GetDoublebyName("step_price", i);
                reqCommand.stop_status = packer.GetStrbyName("stop_status", i);
                reqCommand.hk_stock_flag = packer.GetIntbyName("hk_stock_flag", i);
                reqCommand.time_stamp = packer.GetIntbyName("time_stamp", i);
 
                FuncpubL_1_49Models.Add(reqCommand);
            }
            return FuncpubL_1_49Models;
        }
 
        //逻辑_公共_证券基础数据_查询客户端证券代码信息
        public static List<FuncpubL_1_49Model> GetFuncpubL_1_49Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_1_49Models = new List<FuncpubL_1_49Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_1_49Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    reqCommand.pinyin_short = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PINYIN_SHORT_STR);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.capit_reback_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CAPIT_REBACK_DAYS_INT);
                    reqCommand.posi_reback_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_POSI_REBACK_DAYS_INT);
                    reqCommand.min_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MIN_UNIT_INT);
                    reqCommand.max_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_QTY_FLOAT);
                    reqCommand.min_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_QTY_FLOAT);
                    reqCommand.step_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STEP_PRICE_FLOAT);
                    reqCommand.stop_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOP_STATUS_STR);
                    reqCommand.hk_stock_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HK_STOCK_FLAG_INT);
                    reqCommand.time_stamp = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT);
                    FuncpubL_1_49Models.Add(reqCommand);
                }
            }
            return FuncpubL_1_49Models;
        }
 
        //逻辑_公共_证券基础数据_查询证券代码订单方向
        public static List<FuncpubL_1_54Model> GetFuncpubL_1_54Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_1_54Models = new List<FuncpubL_1_54Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_1_54Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.cash_frozen_type = packer.GetIntbyName("cash_frozen_type", i);
                reqCommand.order_split_flag = packer.GetIntbyName("order_split_flag", i);
                reqCommand.min_unit = packer.GetIntbyName("min_unit", i);
                reqCommand.min_qty = packer.GetDoublebyName("min_qty", i);
                reqCommand.max_qty = packer.GetDoublebyName("max_qty", i);
                reqCommand.time_stamp = packer.GetIntbyName("time_stamp", i);
 
                FuncpubL_1_54Models.Add(reqCommand);
            }
            return FuncpubL_1_54Models;
        }
 
        //逻辑_公共_证券基础数据_查询证券代码订单方向
        public static List<FuncpubL_1_54Model> GetFuncpubL_1_54Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_1_54Models = new List<FuncpubL_1_54Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_1_54Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.cash_frozen_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CASH_FROZEN_TYPE_INT);
                    reqCommand.order_split_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_SPLIT_FLAG_INT);
                    reqCommand.min_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MIN_UNIT_INT);
                    reqCommand.min_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_QTY_FLOAT);
                    reqCommand.max_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_QTY_FLOAT);
                    reqCommand.time_stamp = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT);
                    FuncpubL_1_54Models.Add(reqCommand);
                }
            }
            return FuncpubL_1_54Models;
        }
 
        //逻辑_公共_证券基础数据_查询证券代码订单方向流水
        public static List<FuncpubL_1_55Model> GetFuncpubL_1_55Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_1_55Models = new List<FuncpubL_1_55Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_1_55Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.opor_co_no = packer.GetIntbyName("opor_co_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.oper_mac = packer.GetStrbyName("oper_mac", i);
                reqCommand.oper_ip_addr = packer.GetStrbyName("oper_ip_addr", i);
                reqCommand.oper_info = packer.GetStrbyName("oper_info", i);
                reqCommand.oper_way = packer.GetStrbyName("oper_way", i);
                reqCommand.oper_menu_no = packer.GetIntbyName("oper_menu_no", i);
                reqCommand.oper_func_code = packer.GetStrbyName("oper_func_code", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.jour_occur_field = packer.GetStrbyName("jour_occur_field", i);
                reqCommand.jour_after_occur_info = packer.GetStrbyName("jour_after_occur_info", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncpubL_1_55Models.Add(reqCommand);
            }
            return FuncpubL_1_55Models;
        }
 
        //逻辑_公共_证券基础数据_查询证券代码订单方向流水
        public static List<FuncpubL_1_55Model> GetFuncpubL_1_55Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_1_55Models = new List<FuncpubL_1_55Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_1_55Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    reqCommand.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    reqCommand.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    reqCommand.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    reqCommand.oper_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MENU_NO_INT);
                    reqCommand.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    reqCommand.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncpubL_1_55Models.Add(reqCommand);
                }
            }
            return FuncpubL_1_55Models;
        }
 
        //逻辑_公共_证券基础数据_查询历史证券代码订单方向流水
        public static List<FuncpubL_1_56Model> GetFuncpubL_1_56Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_1_56Models = new List<FuncpubL_1_56Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_1_56Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.opor_co_no = packer.GetIntbyName("opor_co_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.oper_mac = packer.GetStrbyName("oper_mac", i);
                reqCommand.oper_ip_addr = packer.GetStrbyName("oper_ip_addr", i);
                reqCommand.oper_info = packer.GetStrbyName("oper_info", i);
                reqCommand.oper_way = packer.GetStrbyName("oper_way", i);
                reqCommand.oper_menu_no = packer.GetIntbyName("oper_menu_no", i);
                reqCommand.oper_func_code = packer.GetStrbyName("oper_func_code", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.jour_occur_field = packer.GetStrbyName("jour_occur_field", i);
                reqCommand.jour_after_occur_info = packer.GetStrbyName("jour_after_occur_info", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncpubL_1_56Models.Add(reqCommand);
            }
            return FuncpubL_1_56Models;
        }
 
        //逻辑_公共_证券基础数据_查询历史证券代码订单方向流水
        public static List<FuncpubL_1_56Model> GetFuncpubL_1_56Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_1_56Models = new List<FuncpubL_1_56Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_1_56Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    reqCommand.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    reqCommand.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    reqCommand.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    reqCommand.oper_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MENU_NO_INT);
                    reqCommand.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    reqCommand.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncpubL_1_56Models.Add(reqCommand);
                }
            }
            return FuncpubL_1_56Models;
        }
 
        //逻辑_公共_证券基础数据_查询证券代码映射
        public static List<FuncpubL_1_64Model> GetFuncpubL_1_64Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_1_64Models = new List<FuncpubL_1_64Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_1_64Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.trade_code = packer.GetStrbyName("trade_code", i);
                reqCommand.target_code = packer.GetStrbyName("target_code", i);
                reqCommand.time_stamp = packer.GetIntbyName("time_stamp", i);
 
                FuncpubL_1_64Models.Add(reqCommand);
            }
            return FuncpubL_1_64Models;
        }
 
        //逻辑_公共_证券基础数据_查询证券代码映射
        public static List<FuncpubL_1_64Model> GetFuncpubL_1_64Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_1_64Models = new List<FuncpubL_1_64Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_1_64Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.trade_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_STR);
                    reqCommand.target_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_STR);
                    reqCommand.time_stamp = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT);
                    FuncpubL_1_64Models.Add(reqCommand);
                }
            }
            return FuncpubL_1_64Models;
        }
 
        //逻辑_公共_证券基础数据_查询证券代码映射流水
        public static List<FuncpubL_1_65Model> GetFuncpubL_1_65Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_1_65Models = new List<FuncpubL_1_65Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_1_65Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.opor_co_no = packer.GetIntbyName("opor_co_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.oper_mac = packer.GetStrbyName("oper_mac", i);
                reqCommand.oper_ip_addr = packer.GetStrbyName("oper_ip_addr", i);
                reqCommand.oper_info = packer.GetStrbyName("oper_info", i);
                reqCommand.oper_way = packer.GetStrbyName("oper_way", i);
                reqCommand.oper_menu_no = packer.GetIntbyName("oper_menu_no", i);
                reqCommand.oper_func_code = packer.GetStrbyName("oper_func_code", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.trade_code = packer.GetStrbyName("trade_code", i);
                reqCommand.target_code = packer.GetStrbyName("target_code", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncpubL_1_65Models.Add(reqCommand);
            }
            return FuncpubL_1_65Models;
        }
 
        //逻辑_公共_证券基础数据_查询证券代码映射流水
        public static List<FuncpubL_1_65Model> GetFuncpubL_1_65Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_1_65Models = new List<FuncpubL_1_65Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_1_65Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    reqCommand.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    reqCommand.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    reqCommand.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    reqCommand.oper_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MENU_NO_INT);
                    reqCommand.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.trade_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_STR);
                    reqCommand.target_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncpubL_1_65Models.Add(reqCommand);
                }
            }
            return FuncpubL_1_65Models;
        }
 
        //逻辑_公共_证券基础数据_查询历史证券代码映射流水
        public static List<FuncpubL_1_66Model> GetFuncpubL_1_66Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_1_66Models = new List<FuncpubL_1_66Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_1_66Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.opor_co_no = packer.GetIntbyName("opor_co_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.oper_mac = packer.GetStrbyName("oper_mac", i);
                reqCommand.oper_ip_addr = packer.GetStrbyName("oper_ip_addr", i);
                reqCommand.oper_info = packer.GetStrbyName("oper_info", i);
                reqCommand.oper_way = packer.GetStrbyName("oper_way", i);
                reqCommand.oper_menu_no = packer.GetIntbyName("oper_menu_no", i);
                reqCommand.oper_func_code = packer.GetStrbyName("oper_func_code", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.trade_code = packer.GetStrbyName("trade_code", i);
                reqCommand.target_code = packer.GetStrbyName("target_code", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncpubL_1_66Models.Add(reqCommand);
            }
            return FuncpubL_1_66Models;
        }
 
        //逻辑_公共_证券基础数据_查询历史证券代码映射流水
        public static List<FuncpubL_1_66Model> GetFuncpubL_1_66Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_1_66Models = new List<FuncpubL_1_66Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_1_66Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    reqCommand.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    reqCommand.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    reqCommand.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    reqCommand.oper_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MENU_NO_INT);
                    reqCommand.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.trade_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_STR);
                    reqCommand.target_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncpubL_1_66Models.Add(reqCommand);
                }
            }
            return FuncpubL_1_66Models;
        }
 
        //逻辑_公共_证券基础数据_查询新股信息
        public static List<FuncpubL_1_34Model> GetFuncpubL_1_34Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_1_34Models = new List<FuncpubL_1_34Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_1_34Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_name = packer.GetStrbyName("stock_name", i);
                reqCommand.trade_code = packer.GetStrbyName("trade_code", i);
                reqCommand.target_code = packer.GetStrbyName("target_code", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.trade_code_no = packer.GetIntbyName("trade_code_no", i);
                reqCommand.target_code_no = packer.GetIntbyName("target_code_no", i);
                reqCommand.apply_date = packer.GetIntbyName("apply_date", i);
                reqCommand.apply_limit = packer.GetDoublebyName("apply_limit", i);
                reqCommand.begin_trade_date = packer.GetIntbyName("begin_trade_date", i);
                reqCommand.issue_price = packer.GetDoublebyName("issue_price", i);
 
                FuncpubL_1_34Models.Add(reqCommand);
            }
            return FuncpubL_1_34Models;
        }
 
        //逻辑_公共_证券基础数据_查询新股信息
        public static List<FuncpubL_1_34Model> GetFuncpubL_1_34Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_1_34Models = new List<FuncpubL_1_34Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_1_34Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    reqCommand.trade_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_STR);
                    reqCommand.target_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_STR);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.trade_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_NO_INT);
                    reqCommand.target_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_NO_INT);
                    reqCommand.apply_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_APPLY_DATE_INT);
                    reqCommand.apply_limit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_APPLY_LIMIT_FLOAT);
                    reqCommand.begin_trade_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TRADE_DATE_INT);
                    reqCommand.issue_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ISSUE_PRICE_FLOAT);
                    FuncpubL_1_34Models.Add(reqCommand);
                }
            }
            return FuncpubL_1_34Models;
        }
 
        //逻辑_公共_证券基础数据_查询当日新股信息
        public static List<FuncpubL_1_35Model> GetFuncpubL_1_35Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_1_35Models = new List<FuncpubL_1_35Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_1_35Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_name = packer.GetStrbyName("stock_name", i);
                reqCommand.trade_code = packer.GetStrbyName("trade_code", i);
                reqCommand.target_code = packer.GetStrbyName("target_code", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.trade_code_no = packer.GetIntbyName("trade_code_no", i);
                reqCommand.target_code_no = packer.GetIntbyName("target_code_no", i);
                reqCommand.apply_date = packer.GetIntbyName("apply_date", i);
                reqCommand.apply_limit = packer.GetDoublebyName("apply_limit", i);
                reqCommand.begin_trade_date = packer.GetIntbyName("begin_trade_date", i);
                reqCommand.issue_price = packer.GetDoublebyName("issue_price", i);
 
                FuncpubL_1_35Models.Add(reqCommand);
            }
            return FuncpubL_1_35Models;
        }
 
        //逻辑_公共_证券基础数据_查询当日新股信息
        public static List<FuncpubL_1_35Model> GetFuncpubL_1_35Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_1_35Models = new List<FuncpubL_1_35Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_1_35Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    reqCommand.trade_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_STR);
                    reqCommand.target_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_STR);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.trade_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_NO_INT);
                    reqCommand.target_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_NO_INT);
                    reqCommand.apply_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_APPLY_DATE_INT);
                    reqCommand.apply_limit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_APPLY_LIMIT_FLOAT);
                    reqCommand.begin_trade_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TRADE_DATE_INT);
                    reqCommand.issue_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ISSUE_PRICE_FLOAT);
                    FuncpubL_1_35Models.Add(reqCommand);
                }
            }
            return FuncpubL_1_35Models;
        }
 
        //逻辑_公共_证券基础数据_查询可转债信息
        public static List<FuncpubL_1_36Model> GetFuncpubL_1_36Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_1_36Models = new List<FuncpubL_1_36Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_1_36Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_name = packer.GetStrbyName("stock_name", i);
                reqCommand.trade_code = packer.GetStrbyName("trade_code", i);
                reqCommand.target_code = packer.GetStrbyName("target_code", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.trade_code_no = packer.GetIntbyName("trade_code_no", i);
                reqCommand.target_code_no = packer.GetIntbyName("target_code_no", i);
                reqCommand.apply_date = packer.GetIntbyName("apply_date", i);
                reqCommand.apply_limit = packer.GetDoublebyName("apply_limit", i);
                reqCommand.begin_trade_date = packer.GetIntbyName("begin_trade_date", i);
                reqCommand.issue_price = packer.GetDoublebyName("issue_price", i);
 
                FuncpubL_1_36Models.Add(reqCommand);
            }
            return FuncpubL_1_36Models;
        }
 
        //逻辑_公共_证券基础数据_查询可转债信息
        public static List<FuncpubL_1_36Model> GetFuncpubL_1_36Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_1_36Models = new List<FuncpubL_1_36Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_1_36Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    reqCommand.trade_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_STR);
                    reqCommand.target_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_STR);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.trade_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_NO_INT);
                    reqCommand.target_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_NO_INT);
                    reqCommand.apply_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_APPLY_DATE_INT);
                    reqCommand.apply_limit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_APPLY_LIMIT_FLOAT);
                    reqCommand.begin_trade_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TRADE_DATE_INT);
                    reqCommand.issue_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ISSUE_PRICE_FLOAT);
                    FuncpubL_1_36Models.Add(reqCommand);
                }
            }
            return FuncpubL_1_36Models;
        }
 
        //逻辑_公共_证券基础数据_查询当日可转债信息
        public static List<FuncpubL_1_37Model> GetFuncpubL_1_37Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_1_37Models = new List<FuncpubL_1_37Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_1_37Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_name = packer.GetStrbyName("stock_name", i);
                reqCommand.trade_code = packer.GetStrbyName("trade_code", i);
                reqCommand.target_code = packer.GetStrbyName("target_code", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.trade_code_no = packer.GetIntbyName("trade_code_no", i);
                reqCommand.target_code_no = packer.GetIntbyName("target_code_no", i);
                reqCommand.apply_date = packer.GetIntbyName("apply_date", i);
                reqCommand.apply_limit = packer.GetDoublebyName("apply_limit", i);
                reqCommand.begin_trade_date = packer.GetIntbyName("begin_trade_date", i);
                reqCommand.issue_price = packer.GetDoublebyName("issue_price", i);
 
                FuncpubL_1_37Models.Add(reqCommand);
            }
            return FuncpubL_1_37Models;
        }
 
        //逻辑_公共_证券基础数据_查询当日可转债信息
        public static List<FuncpubL_1_37Model> GetFuncpubL_1_37Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_1_37Models = new List<FuncpubL_1_37Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_1_37Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    reqCommand.trade_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_STR);
                    reqCommand.target_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_STR);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.trade_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_NO_INT);
                    reqCommand.target_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_NO_INT);
                    reqCommand.apply_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_APPLY_DATE_INT);
                    reqCommand.apply_limit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_APPLY_LIMIT_FLOAT);
                    reqCommand.begin_trade_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TRADE_DATE_INT);
                    reqCommand.issue_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ISSUE_PRICE_FLOAT);
                    FuncpubL_1_37Models.Add(reqCommand);
                }
            }
            return FuncpubL_1_37Models;
        }
 
        //逻辑_公共_证券基础数据_查询证券行情
        public static List<FuncpubL_1_74Model> GetFuncpubL_1_74Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_1_74Models = new List<FuncpubL_1_74Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_1_74Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_name = packer.GetStrbyName("stock_name", i);
                reqCommand.up_limit_price = packer.GetDoublebyName("up_limit_price", i);
                reqCommand.down_limit_price = packer.GetDoublebyName("down_limit_price", i);
                reqCommand.last_price = packer.GetDoublebyName("last_price", i);
                reqCommand.pre_close_price = packer.GetDoublebyName("pre_close_price", i);
                reqCommand.today_open_price = packer.GetDoublebyName("today_open_price", i);
                reqCommand.today_close_price = packer.GetDoublebyName("today_close_price", i);
                reqCommand.today_max_price = packer.GetDoublebyName("today_max_price", i);
                reqCommand.today_min_price = packer.GetDoublebyName("today_min_price", i);
                reqCommand.buy_price_1 = packer.GetDoublebyName("buy_price_1", i);
                reqCommand.buy_qty_1 = packer.GetDoublebyName("buy_qty_1", i);
                reqCommand.buy_price_2 = packer.GetDoublebyName("buy_price_2", i);
                reqCommand.buy_qty_2 = packer.GetDoublebyName("buy_qty_2", i);
                reqCommand.buy_price_3 = packer.GetDoublebyName("buy_price_3", i);
                reqCommand.buy_qty_3 = packer.GetDoublebyName("buy_qty_3", i);
                reqCommand.buy_price_4 = packer.GetDoublebyName("buy_price_4", i);
                reqCommand.buy_qty_4 = packer.GetDoublebyName("buy_qty_4", i);
                reqCommand.buy_price_5 = packer.GetDoublebyName("buy_price_5", i);
                reqCommand.buy_qty_5 = packer.GetDoublebyName("buy_qty_5", i);
                reqCommand.sell_price_1 = packer.GetDoublebyName("sell_price_1", i);
                reqCommand.sell_qty_1 = packer.GetDoublebyName("sell_qty_1", i);
                reqCommand.sell_price_2 = packer.GetDoublebyName("sell_price_2", i);
                reqCommand.sell_qty_2 = packer.GetDoublebyName("sell_qty_2", i);
                reqCommand.sell_price_3 = packer.GetDoublebyName("sell_price_3", i);
                reqCommand.sell_qty_3 = packer.GetDoublebyName("sell_qty_3", i);
                reqCommand.sell_price_4 = packer.GetDoublebyName("sell_price_4", i);
                reqCommand.sell_qty_4 = packer.GetDoublebyName("sell_qty_4", i);
                reqCommand.sell_price_5 = packer.GetDoublebyName("sell_price_5", i);
                reqCommand.sell_qty_5 = packer.GetDoublebyName("sell_qty_5", i);
                reqCommand.strike_qty = packer.GetDoublebyName("strike_qty", i);
                reqCommand.strike_amt = packer.GetDoublebyName("strike_amt", i);
                reqCommand.pe_ratio = packer.GetDoublebyName("pe_ratio", i);
                reqCommand.time_stamp = packer.GetIntbyName("time_stamp", i);
 
                FuncpubL_1_74Models.Add(reqCommand);
            }
            return FuncpubL_1_74Models;
        }
 
        //逻辑_公共_证券基础数据_查询证券行情
        public static List<FuncpubL_1_74Model> GetFuncpubL_1_74Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_1_74Models = new List<FuncpubL_1_74Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_1_74Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    reqCommand.up_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UP_LIMIT_PRICE_FLOAT);
                    reqCommand.down_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DOWN_LIMIT_PRICE_FLOAT);
                    reqCommand.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    reqCommand.pre_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_CLOSE_PRICE_FLOAT);
                    reqCommand.today_open_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_OPEN_PRICE_FLOAT);
                    reqCommand.today_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_CLOSE_PRICE_FLOAT);
                    reqCommand.today_max_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_MAX_PRICE_FLOAT);
                    reqCommand.today_min_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_MIN_PRICE_FLOAT);
                    reqCommand.buy_price_1 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_PRICE_1_FLOAT);
                    reqCommand.buy_qty_1 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_QTY_1_FLOAT);
                    reqCommand.buy_price_2 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_PRICE_2_FLOAT);
                    reqCommand.buy_qty_2 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_QTY_2_FLOAT);
                    reqCommand.buy_price_3 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_PRICE_3_FLOAT);
                    reqCommand.buy_qty_3 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_QTY_3_FLOAT);
                    reqCommand.buy_price_4 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_PRICE_4_FLOAT);
                    reqCommand.buy_qty_4 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_QTY_4_FLOAT);
                    reqCommand.buy_price_5 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_PRICE_5_FLOAT);
                    reqCommand.buy_qty_5 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_QTY_5_FLOAT);
                    reqCommand.sell_price_1 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_PRICE_1_FLOAT);
                    reqCommand.sell_qty_1 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_QTY_1_FLOAT);
                    reqCommand.sell_price_2 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_PRICE_2_FLOAT);
                    reqCommand.sell_qty_2 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_QTY_2_FLOAT);
                    reqCommand.sell_price_3 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_PRICE_3_FLOAT);
                    reqCommand.sell_qty_3 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_QTY_3_FLOAT);
                    reqCommand.sell_price_4 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_PRICE_4_FLOAT);
                    reqCommand.sell_qty_4 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_QTY_4_FLOAT);
                    reqCommand.sell_price_5 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_PRICE_5_FLOAT);
                    reqCommand.sell_qty_5 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_QTY_5_FLOAT);
                    reqCommand.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    reqCommand.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    reqCommand.pe_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PE_RATIO_FLOAT);
                    reqCommand.time_stamp = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT);
                    FuncpubL_1_74Models.Add(reqCommand);
                }
            }
            return FuncpubL_1_74Models;
        }
 
        //逻辑_公共_证券基础数据_批量获取证券行情
        public static List<FuncpubL_1_77Model> GetFuncpubL_1_77Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_1_77Models = new List<FuncpubL_1_77Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_1_77Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_name = packer.GetStrbyName("stock_name", i);
                reqCommand.up_limit_price = packer.GetDoublebyName("up_limit_price", i);
                reqCommand.down_limit_price = packer.GetDoublebyName("down_limit_price", i);
                reqCommand.last_price = packer.GetDoublebyName("last_price", i);
                reqCommand.pre_close_price = packer.GetDoublebyName("pre_close_price", i);
                reqCommand.today_open_price = packer.GetDoublebyName("today_open_price", i);
                reqCommand.today_close_price = packer.GetDoublebyName("today_close_price", i);
                reqCommand.today_max_price = packer.GetDoublebyName("today_max_price", i);
                reqCommand.today_min_price = packer.GetDoublebyName("today_min_price", i);
                reqCommand.buy_price_1 = packer.GetDoublebyName("buy_price_1", i);
                reqCommand.buy_qty_1 = packer.GetDoublebyName("buy_qty_1", i);
                reqCommand.buy_price_2 = packer.GetDoublebyName("buy_price_2", i);
                reqCommand.buy_qty_2 = packer.GetDoublebyName("buy_qty_2", i);
                reqCommand.buy_price_3 = packer.GetDoublebyName("buy_price_3", i);
                reqCommand.buy_qty_3 = packer.GetDoublebyName("buy_qty_3", i);
                reqCommand.buy_price_4 = packer.GetDoublebyName("buy_price_4", i);
                reqCommand.buy_qty_4 = packer.GetDoublebyName("buy_qty_4", i);
                reqCommand.buy_price_5 = packer.GetDoublebyName("buy_price_5", i);
                reqCommand.buy_qty_5 = packer.GetDoublebyName("buy_qty_5", i);
                reqCommand.sell_price_1 = packer.GetDoublebyName("sell_price_1", i);
                reqCommand.sell_qty_1 = packer.GetDoublebyName("sell_qty_1", i);
                reqCommand.sell_price_2 = packer.GetDoublebyName("sell_price_2", i);
                reqCommand.sell_qty_2 = packer.GetDoublebyName("sell_qty_2", i);
                reqCommand.sell_price_3 = packer.GetDoublebyName("sell_price_3", i);
                reqCommand.sell_qty_3 = packer.GetDoublebyName("sell_qty_3", i);
                reqCommand.sell_price_4 = packer.GetDoublebyName("sell_price_4", i);
                reqCommand.sell_qty_4 = packer.GetDoublebyName("sell_qty_4", i);
                reqCommand.sell_price_5 = packer.GetDoublebyName("sell_price_5", i);
                reqCommand.sell_qty_5 = packer.GetDoublebyName("sell_qty_5", i);
                reqCommand.strike_qty = packer.GetDoublebyName("strike_qty", i);
                reqCommand.strike_amt = packer.GetDoublebyName("strike_amt", i);
                reqCommand.pe_ratio = packer.GetDoublebyName("pe_ratio", i);
                reqCommand.time_stamp = packer.GetIntbyName("time_stamp", i);
 
                FuncpubL_1_77Models.Add(reqCommand);
            }
            return FuncpubL_1_77Models;
        }
 
        //逻辑_公共_证券基础数据_批量获取证券行情
        public static List<FuncpubL_1_77Model> GetFuncpubL_1_77Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_1_77Models = new List<FuncpubL_1_77Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_1_77Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    reqCommand.up_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UP_LIMIT_PRICE_FLOAT);
                    reqCommand.down_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DOWN_LIMIT_PRICE_FLOAT);
                    reqCommand.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    reqCommand.pre_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_CLOSE_PRICE_FLOAT);
                    reqCommand.today_open_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_OPEN_PRICE_FLOAT);
                    reqCommand.today_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_CLOSE_PRICE_FLOAT);
                    reqCommand.today_max_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_MAX_PRICE_FLOAT);
                    reqCommand.today_min_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_MIN_PRICE_FLOAT);
                    reqCommand.buy_price_1 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_PRICE_1_FLOAT);
                    reqCommand.buy_qty_1 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_QTY_1_FLOAT);
                    reqCommand.buy_price_2 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_PRICE_2_FLOAT);
                    reqCommand.buy_qty_2 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_QTY_2_FLOAT);
                    reqCommand.buy_price_3 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_PRICE_3_FLOAT);
                    reqCommand.buy_qty_3 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_QTY_3_FLOAT);
                    reqCommand.buy_price_4 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_PRICE_4_FLOAT);
                    reqCommand.buy_qty_4 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_QTY_4_FLOAT);
                    reqCommand.buy_price_5 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_PRICE_5_FLOAT);
                    reqCommand.buy_qty_5 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_QTY_5_FLOAT);
                    reqCommand.sell_price_1 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_PRICE_1_FLOAT);
                    reqCommand.sell_qty_1 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_QTY_1_FLOAT);
                    reqCommand.sell_price_2 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_PRICE_2_FLOAT);
                    reqCommand.sell_qty_2 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_QTY_2_FLOAT);
                    reqCommand.sell_price_3 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_PRICE_3_FLOAT);
                    reqCommand.sell_qty_3 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_QTY_3_FLOAT);
                    reqCommand.sell_price_4 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_PRICE_4_FLOAT);
                    reqCommand.sell_qty_4 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_QTY_4_FLOAT);
                    reqCommand.sell_price_5 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_PRICE_5_FLOAT);
                    reqCommand.sell_qty_5 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_QTY_5_FLOAT);
                    reqCommand.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    reqCommand.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    reqCommand.pe_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PE_RATIO_FLOAT);
                    reqCommand.time_stamp = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT);
                    FuncpubL_1_77Models.Add(reqCommand);
                }
            }
            return FuncpubL_1_77Models;
        }
 
        //逻辑_公共_证券基础数据_获取证券行情
        public static List<FuncpubL_1_78Model> GetFuncpubL_1_78Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_1_78Models = new List<FuncpubL_1_78Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_1_78Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_name = packer.GetStrbyName("stock_name", i);
                reqCommand.up_limit_price = packer.GetDoublebyName("up_limit_price", i);
                reqCommand.down_limit_price = packer.GetDoublebyName("down_limit_price", i);
                reqCommand.last_price = packer.GetDoublebyName("last_price", i);
                reqCommand.pre_close_price = packer.GetDoublebyName("pre_close_price", i);
 
                FuncpubL_1_78Models.Add(reqCommand);
            }
            return FuncpubL_1_78Models;
        }
 
        //逻辑_公共_证券基础数据_获取证券行情
        public static List<FuncpubL_1_78Model> GetFuncpubL_1_78Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_1_78Models = new List<FuncpubL_1_78Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncpubL_1_78Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                reqCommand.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                reqCommand.up_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UP_LIMIT_PRICE_FLOAT);
                reqCommand.down_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DOWN_LIMIT_PRICE_FLOAT);
                reqCommand.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                reqCommand.pre_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_CLOSE_PRICE_FLOAT);
                FuncpubL_1_78Models.Add(reqCommand);
            }
            return FuncpubL_1_78Models;
        }
 
        //逻辑_公共_证券基础数据_查询证券行情流水
        public static List<FuncpubL_1_75Model> GetFuncpubL_1_75Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_1_75Models = new List<FuncpubL_1_75Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_1_75Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.opor_co_no = packer.GetIntbyName("opor_co_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.oper_mac = packer.GetStrbyName("oper_mac", i);
                reqCommand.oper_ip_addr = packer.GetStrbyName("oper_ip_addr", i);
                reqCommand.oper_info = packer.GetStrbyName("oper_info", i);
                reqCommand.oper_way = packer.GetStrbyName("oper_way", i);
                reqCommand.oper_menu_no = packer.GetIntbyName("oper_menu_no", i);
                reqCommand.oper_func_code = packer.GetStrbyName("oper_func_code", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.jour_occur_field = packer.GetStrbyName("jour_occur_field", i);
                reqCommand.jour_after_occur_info = packer.GetStrbyName("jour_after_occur_info", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncpubL_1_75Models.Add(reqCommand);
            }
            return FuncpubL_1_75Models;
        }
 
        //逻辑_公共_证券基础数据_查询证券行情流水
        public static List<FuncpubL_1_75Model> GetFuncpubL_1_75Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_1_75Models = new List<FuncpubL_1_75Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_1_75Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    reqCommand.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    reqCommand.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    reqCommand.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    reqCommand.oper_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MENU_NO_INT);
                    reqCommand.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    reqCommand.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncpubL_1_75Models.Add(reqCommand);
                }
            }
            return FuncpubL_1_75Models;
        }
 
        //逻辑_公共_证券基础数据_查询历史证券行情流水
        public static List<FuncpubL_1_76Model> GetFuncpubL_1_76Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_1_76Models = new List<FuncpubL_1_76Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_1_76Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.opor_co_no = packer.GetIntbyName("opor_co_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.oper_mac = packer.GetStrbyName("oper_mac", i);
                reqCommand.oper_ip_addr = packer.GetStrbyName("oper_ip_addr", i);
                reqCommand.oper_info = packer.GetStrbyName("oper_info", i);
                reqCommand.oper_way = packer.GetStrbyName("oper_way", i);
                reqCommand.oper_menu_no = packer.GetIntbyName("oper_menu_no", i);
                reqCommand.oper_func_code = packer.GetStrbyName("oper_func_code", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.jour_occur_field = packer.GetStrbyName("jour_occur_field", i);
                reqCommand.jour_after_occur_info = packer.GetStrbyName("jour_after_occur_info", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncpubL_1_76Models.Add(reqCommand);
            }
            return FuncpubL_1_76Models;
        }
 
        //逻辑_公共_证券基础数据_查询历史证券行情流水
        public static List<FuncpubL_1_76Model> GetFuncpubL_1_76Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_1_76Models = new List<FuncpubL_1_76Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_1_76Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    reqCommand.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    reqCommand.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    reqCommand.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    reqCommand.oper_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MENU_NO_INT);
                    reqCommand.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    reqCommand.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncpubL_1_76Models.Add(reqCommand);
                }
            }
            return FuncpubL_1_76Models;
        }
 
        //逻辑_公共_证券基础数据_证券行情归档定时任务
        public static List<FuncpubL_1_79Model> GetFuncpubL_1_79Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_1_79Models = new List<FuncpubL_1_79Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_1_79Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.task_strike_status = packer.GetStrbyName("task_strike_status", i);
 
                FuncpubL_1_79Models.Add(reqCommand);
            }
            return FuncpubL_1_79Models;
        }
 
        //逻辑_公共_证券基础数据_证券行情归档定时任务
        public static List<FuncpubL_1_79Model> GetFuncpubL_1_79Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_1_79Models = new List<FuncpubL_1_79Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncpubL_1_79Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.task_strike_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STRIKE_STATUS_STR);
                FuncpubL_1_79Models.Add(reqCommand);
            }
            return FuncpubL_1_79Models;
        }
 
        //逻辑_公共_证券基础数据_查询债券属性信息
        public static List<FuncpubL_1_84Model> GetFuncpubL_1_84Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_1_84Models = new List<FuncpubL_1_84Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_1_84Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_name = packer.GetStrbyName("stock_name", i);
                reqCommand.issue_date = packer.GetIntbyName("issue_date", i);
                reqCommand.end_date = packer.GetIntbyName("end_date", i);
                reqCommand.value_date = packer.GetIntbyName("value_date", i);
                reqCommand.next_value_date = packer.GetIntbyName("next_value_date", i);
                reqCommand.begin_trade_date = packer.GetIntbyName("begin_trade_date", i);
                reqCommand.bond_limit = packer.GetDoublebyName("bond_limit", i);
                reqCommand.issue_price = packer.GetDoublebyName("issue_price", i);
                reqCommand.par_value = packer.GetDoublebyName("par_value", i);
                reqCommand.intrst_ratio = packer.GetDoublebyName("intrst_ratio", i);
                reqCommand.intrst_days = packer.GetIntbyName("intrst_days", i);
                reqCommand.pay_inteval = packer.GetIntbyName("pay_inteval", i);
                reqCommand.bond_accr_intrst = packer.GetDoublebyName("bond_accr_intrst", i);
                reqCommand.bond_rate_type = packer.GetIntbyName("bond_rate_type", i);
                reqCommand.inteval_days = packer.GetIntbyName("inteval_days", i);
                reqCommand.net_price_flag = packer.GetIntbyName("net_price_flag", i);
                reqCommand.last_trade_date = packer.GetIntbyName("last_trade_date", i);
                reqCommand.rights_type = packer.GetIntbyName("rights_type", i);
                reqCommand.trans_begin_date = packer.GetIntbyName("trans_begin_date", i);
                reqCommand.trans_end_date = packer.GetIntbyName("trans_end_date", i);
                reqCommand.exec_begin_date = packer.GetIntbyName("exec_begin_date", i);
                reqCommand.exec_end_date = packer.GetIntbyName("exec_end_date", i);
                reqCommand.impawn_ratio = packer.GetDoublebyName("impawn_ratio", i);
                reqCommand.trade_code = packer.GetStrbyName("trade_code", i);
                reqCommand.target_code = packer.GetStrbyName("target_code", i);
                reqCommand.time_stamp = packer.GetIntbyName("time_stamp", i);
 
                FuncpubL_1_84Models.Add(reqCommand);
            }
            return FuncpubL_1_84Models;
        }
 
        //逻辑_公共_证券基础数据_查询债券属性信息
        public static List<FuncpubL_1_84Model> GetFuncpubL_1_84Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_1_84Models = new List<FuncpubL_1_84Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_1_84Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    reqCommand.issue_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ISSUE_DATE_INT);
                    reqCommand.end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT);
                    reqCommand.value_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_VALUE_DATE_INT);
                    reqCommand.next_value_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NEXT_VALUE_DATE_INT);
                    reqCommand.begin_trade_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TRADE_DATE_INT);
                    reqCommand.bond_limit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_LIMIT_FLOAT);
                    reqCommand.issue_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ISSUE_PRICE_FLOAT);
                    reqCommand.par_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_FLOAT);
                    reqCommand.intrst_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_RATIO_FLOAT);
                    reqCommand.intrst_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_DAYS_INT);
                    reqCommand.pay_inteval = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PAY_INTEVAL_INT);
                    reqCommand.bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT);
                    reqCommand.bond_rate_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BOND_RATE_TYPE_INT);
                    reqCommand.inteval_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INTEVAL_DAYS_INT);
                    reqCommand.net_price_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLAG_INT);
                    reqCommand.last_trade_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LAST_TRADE_DATE_INT);
                    reqCommand.rights_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RIGHTS_TYPE_INT);
                    reqCommand.trans_begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_BEGIN_DATE_INT);
                    reqCommand.trans_end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_END_DATE_INT);
                    reqCommand.exec_begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_BEGIN_DATE_INT);
                    reqCommand.exec_end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_END_DATE_INT);
                    reqCommand.impawn_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_IMPAWN_RATIO_FLOAT);
                    reqCommand.trade_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_STR);
                    reqCommand.target_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_STR);
                    reqCommand.time_stamp = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT);
                    FuncpubL_1_84Models.Add(reqCommand);
                }
            }
            return FuncpubL_1_84Models;
        }
 
        //逻辑_公共_证券基础数据_获取债券属性
        public static List<FuncpubL_1_88Model> GetFuncpubL_1_88Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_1_88Models = new List<FuncpubL_1_88Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_1_88Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_name = packer.GetStrbyName("stock_name", i);
                reqCommand.issue_date = packer.GetIntbyName("issue_date", i);
                reqCommand.end_date = packer.GetIntbyName("end_date", i);
                reqCommand.value_date = packer.GetIntbyName("value_date", i);
                reqCommand.next_value_date = packer.GetIntbyName("next_value_date", i);
                reqCommand.begin_trade_date = packer.GetIntbyName("begin_trade_date", i);
                reqCommand.bond_limit = packer.GetDoublebyName("bond_limit", i);
                reqCommand.issue_price = packer.GetDoublebyName("issue_price", i);
                reqCommand.par_value = packer.GetDoublebyName("par_value", i);
                reqCommand.intrst_ratio = packer.GetDoublebyName("intrst_ratio", i);
                reqCommand.intrst_days = packer.GetIntbyName("intrst_days", i);
                reqCommand.pay_inteval = packer.GetIntbyName("pay_inteval", i);
                reqCommand.bond_accr_intrst = packer.GetDoublebyName("bond_accr_intrst", i);
                reqCommand.bond_rate_type = packer.GetIntbyName("bond_rate_type", i);
                reqCommand.inteval_days = packer.GetIntbyName("inteval_days", i);
                reqCommand.net_price_flag = packer.GetIntbyName("net_price_flag", i);
                reqCommand.last_trade_date = packer.GetIntbyName("last_trade_date", i);
                reqCommand.rights_type = packer.GetIntbyName("rights_type", i);
                reqCommand.trans_begin_date = packer.GetIntbyName("trans_begin_date", i);
                reqCommand.trans_end_date = packer.GetIntbyName("trans_end_date", i);
                reqCommand.exec_begin_date = packer.GetIntbyName("exec_begin_date", i);
                reqCommand.exec_end_date = packer.GetIntbyName("exec_end_date", i);
                reqCommand.impawn_ratio = packer.GetDoublebyName("impawn_ratio", i);
                reqCommand.trade_code = packer.GetStrbyName("trade_code", i);
                reqCommand.target_code = packer.GetStrbyName("target_code", i);
 
                FuncpubL_1_88Models.Add(reqCommand);
            }
            return FuncpubL_1_88Models;
        }
 
        //逻辑_公共_证券基础数据_获取债券属性
        public static List<FuncpubL_1_88Model> GetFuncpubL_1_88Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_1_88Models = new List<FuncpubL_1_88Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncpubL_1_88Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                reqCommand.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                reqCommand.issue_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ISSUE_DATE_INT);
                reqCommand.end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT);
                reqCommand.value_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_VALUE_DATE_INT);
                reqCommand.next_value_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NEXT_VALUE_DATE_INT);
                reqCommand.begin_trade_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TRADE_DATE_INT);
                reqCommand.bond_limit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_LIMIT_FLOAT);
                reqCommand.issue_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ISSUE_PRICE_FLOAT);
                reqCommand.par_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_FLOAT);
                reqCommand.intrst_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_RATIO_FLOAT);
                reqCommand.intrst_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_DAYS_INT);
                reqCommand.pay_inteval = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PAY_INTEVAL_INT);
                reqCommand.bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT);
                reqCommand.bond_rate_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BOND_RATE_TYPE_INT);
                reqCommand.inteval_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INTEVAL_DAYS_INT);
                reqCommand.net_price_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLAG_INT);
                reqCommand.last_trade_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LAST_TRADE_DATE_INT);
                reqCommand.rights_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RIGHTS_TYPE_INT);
                reqCommand.trans_begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_BEGIN_DATE_INT);
                reqCommand.trans_end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_END_DATE_INT);
                reqCommand.exec_begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_BEGIN_DATE_INT);
                reqCommand.exec_end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_END_DATE_INT);
                reqCommand.impawn_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_IMPAWN_RATIO_FLOAT);
                reqCommand.trade_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_STR);
                reqCommand.target_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_STR);
                FuncpubL_1_88Models.Add(reqCommand);
            }
            return FuncpubL_1_88Models;
        }
 
        //逻辑_公共_证券基础数据_查询债券属性流水
        public static List<FuncpubL_1_85Model> GetFuncpubL_1_85Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_1_85Models = new List<FuncpubL_1_85Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_1_85Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.opor_co_no = packer.GetIntbyName("opor_co_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.oper_mac = packer.GetStrbyName("oper_mac", i);
                reqCommand.oper_ip_addr = packer.GetStrbyName("oper_ip_addr", i);
                reqCommand.oper_info = packer.GetStrbyName("oper_info", i);
                reqCommand.oper_way = packer.GetStrbyName("oper_way", i);
                reqCommand.oper_menu_no = packer.GetIntbyName("oper_menu_no", i);
                reqCommand.oper_func_code = packer.GetStrbyName("oper_func_code", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.jour_occur_field = packer.GetStrbyName("jour_occur_field", i);
                reqCommand.jour_after_occur_info = packer.GetStrbyName("jour_after_occur_info", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncpubL_1_85Models.Add(reqCommand);
            }
            return FuncpubL_1_85Models;
        }
 
        //逻辑_公共_证券基础数据_查询债券属性流水
        public static List<FuncpubL_1_85Model> GetFuncpubL_1_85Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_1_85Models = new List<FuncpubL_1_85Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_1_85Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    reqCommand.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    reqCommand.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    reqCommand.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    reqCommand.oper_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MENU_NO_INT);
                    reqCommand.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    reqCommand.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncpubL_1_85Models.Add(reqCommand);
                }
            }
            return FuncpubL_1_85Models;
        }
 
        //逻辑_公共_证券基础数据_查询历史债券属性流水
        public static List<FuncpubL_1_86Model> GetFuncpubL_1_86Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_1_86Models = new List<FuncpubL_1_86Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_1_86Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.opor_co_no = packer.GetIntbyName("opor_co_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.oper_mac = packer.GetStrbyName("oper_mac", i);
                reqCommand.oper_ip_addr = packer.GetStrbyName("oper_ip_addr", i);
                reqCommand.oper_info = packer.GetStrbyName("oper_info", i);
                reqCommand.oper_way = packer.GetStrbyName("oper_way", i);
                reqCommand.oper_menu_no = packer.GetIntbyName("oper_menu_no", i);
                reqCommand.oper_func_code = packer.GetStrbyName("oper_func_code", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.jour_occur_field = packer.GetStrbyName("jour_occur_field", i);
                reqCommand.jour_after_occur_info = packer.GetStrbyName("jour_after_occur_info", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncpubL_1_86Models.Add(reqCommand);
            }
            return FuncpubL_1_86Models;
        }
 
        //逻辑_公共_证券基础数据_查询历史债券属性流水
        public static List<FuncpubL_1_86Model> GetFuncpubL_1_86Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_1_86Models = new List<FuncpubL_1_86Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_1_86Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    reqCommand.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    reqCommand.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    reqCommand.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    reqCommand.oper_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MENU_NO_INT);
                    reqCommand.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    reqCommand.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncpubL_1_86Models.Add(reqCommand);
                }
            }
            return FuncpubL_1_86Models;
        }
 
        //逻辑_公共_证券基础数据_查询债券质押信息
        public static List<FuncpubL_1_87Model> GetFuncpubL_1_87Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_1_87Models = new List<FuncpubL_1_87Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_1_87Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.impawn_code_no = packer.GetIntbyName("impawn_code_no", i);
                reqCommand.impawn_code = packer.GetStrbyName("impawn_code", i);
                reqCommand.impawn_ratio = packer.GetDoublebyName("impawn_ratio", i);
 
                FuncpubL_1_87Models.Add(reqCommand);
            }
            return FuncpubL_1_87Models;
        }
 
        //逻辑_公共_证券基础数据_查询债券质押信息
        public static List<FuncpubL_1_87Model> GetFuncpubL_1_87Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_1_87Models = new List<FuncpubL_1_87Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_1_87Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.impawn_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IMPAWN_CODE_NO_INT);
                    reqCommand.impawn_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_IMPAWN_CODE_STR);
                    reqCommand.impawn_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_IMPAWN_RATIO_FLOAT);
                    FuncpubL_1_87Models.Add(reqCommand);
                }
            }
            return FuncpubL_1_87Models;
        }
 
        //逻辑_公共_证券基础数据_查询债券利率
        public static List<FuncpubL_1_94Model> GetFuncpubL_1_94Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_1_94Models = new List<FuncpubL_1_94Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_1_94Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.intrst_begin_date = packer.GetIntbyName("intrst_begin_date", i);
                reqCommand.intrst_ratio = packer.GetDoublebyName("intrst_ratio", i);
                reqCommand.time_stamp = packer.GetIntbyName("time_stamp", i);
 
                FuncpubL_1_94Models.Add(reqCommand);
            }
            return FuncpubL_1_94Models;
        }
 
        //逻辑_公共_证券基础数据_查询债券利率
        public static List<FuncpubL_1_94Model> GetFuncpubL_1_94Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_1_94Models = new List<FuncpubL_1_94Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_1_94Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.intrst_begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_BEGIN_DATE_INT);
                    reqCommand.intrst_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_RATIO_FLOAT);
                    reqCommand.time_stamp = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT);
                    FuncpubL_1_94Models.Add(reqCommand);
                }
            }
            return FuncpubL_1_94Models;
        }
 
        //逻辑_公共_证券基础数据_查询债券利率流水
        public static List<FuncpubL_1_95Model> GetFuncpubL_1_95Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_1_95Models = new List<FuncpubL_1_95Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_1_95Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.opor_co_no = packer.GetIntbyName("opor_co_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.oper_mac = packer.GetStrbyName("oper_mac", i);
                reqCommand.oper_ip_addr = packer.GetStrbyName("oper_ip_addr", i);
                reqCommand.oper_info = packer.GetStrbyName("oper_info", i);
                reqCommand.oper_way = packer.GetStrbyName("oper_way", i);
                reqCommand.oper_menu_no = packer.GetIntbyName("oper_menu_no", i);
                reqCommand.oper_func_code = packer.GetStrbyName("oper_func_code", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.intrst_begin_date = packer.GetIntbyName("intrst_begin_date", i);
                reqCommand.intrst_ratio = packer.GetDoublebyName("intrst_ratio", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncpubL_1_95Models.Add(reqCommand);
            }
            return FuncpubL_1_95Models;
        }
 
        //逻辑_公共_证券基础数据_查询债券利率流水
        public static List<FuncpubL_1_95Model> GetFuncpubL_1_95Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_1_95Models = new List<FuncpubL_1_95Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_1_95Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    reqCommand.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    reqCommand.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    reqCommand.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    reqCommand.oper_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MENU_NO_INT);
                    reqCommand.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.intrst_begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_BEGIN_DATE_INT);
                    reqCommand.intrst_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_RATIO_FLOAT);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncpubL_1_95Models.Add(reqCommand);
                }
            }
            return FuncpubL_1_95Models;
        }
 
        //逻辑_公共_证券基础数据_查询历史债券利率流水
        public static List<FuncpubL_1_96Model> GetFuncpubL_1_96Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_1_96Models = new List<FuncpubL_1_96Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_1_96Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.opor_co_no = packer.GetIntbyName("opor_co_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.oper_mac = packer.GetStrbyName("oper_mac", i);
                reqCommand.oper_ip_addr = packer.GetStrbyName("oper_ip_addr", i);
                reqCommand.oper_info = packer.GetStrbyName("oper_info", i);
                reqCommand.oper_way = packer.GetStrbyName("oper_way", i);
                reqCommand.oper_menu_no = packer.GetIntbyName("oper_menu_no", i);
                reqCommand.oper_func_code = packer.GetStrbyName("oper_func_code", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.intrst_begin_date = packer.GetIntbyName("intrst_begin_date", i);
                reqCommand.intrst_ratio = packer.GetDoublebyName("intrst_ratio", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncpubL_1_96Models.Add(reqCommand);
            }
            return FuncpubL_1_96Models;
        }
 
        //逻辑_公共_证券基础数据_查询历史债券利率流水
        public static List<FuncpubL_1_96Model> GetFuncpubL_1_96Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_1_96Models = new List<FuncpubL_1_96Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_1_96Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    reqCommand.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    reqCommand.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    reqCommand.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    reqCommand.oper_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MENU_NO_INT);
                    reqCommand.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.intrst_begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_BEGIN_DATE_INT);
                    reqCommand.intrst_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_RATIO_FLOAT);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncpubL_1_96Models.Add(reqCommand);
                }
            }
            return FuncpubL_1_96Models;
        }
 
        //逻辑_公共_证券基础数据_查询债券评级信息
        public static List<FuncpubL_1_104Model> GetFuncpubL_1_104Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_1_104Models = new List<FuncpubL_1_104Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_1_104Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.rating_agency = packer.GetStrbyName("rating_agency", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.bond_level = packer.GetIntbyName("bond_level", i);
                reqCommand.time_stamp = packer.GetIntbyName("time_stamp", i);
 
                FuncpubL_1_104Models.Add(reqCommand);
            }
            return FuncpubL_1_104Models;
        }
 
        //逻辑_公共_证券基础数据_查询债券评级信息
        public static List<FuncpubL_1_104Model> GetFuncpubL_1_104Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_1_104Models = new List<FuncpubL_1_104Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_1_104Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.rating_agency = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RATING_AGENCY_STR);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.bond_level = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BOND_LEVEL_INT);
                    reqCommand.time_stamp = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT);
                    FuncpubL_1_104Models.Add(reqCommand);
                }
            }
            return FuncpubL_1_104Models;
        }
 
        //逻辑_公共_证券基础数据_查询债券评级流水
        public static List<FuncpubL_1_105Model> GetFuncpubL_1_105Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_1_105Models = new List<FuncpubL_1_105Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_1_105Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.opor_co_no = packer.GetIntbyName("opor_co_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.oper_mac = packer.GetStrbyName("oper_mac", i);
                reqCommand.oper_ip_addr = packer.GetStrbyName("oper_ip_addr", i);
                reqCommand.oper_info = packer.GetStrbyName("oper_info", i);
                reqCommand.oper_way = packer.GetStrbyName("oper_way", i);
                reqCommand.oper_menu_no = packer.GetIntbyName("oper_menu_no", i);
                reqCommand.oper_func_code = packer.GetStrbyName("oper_func_code", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.rating_agency = packer.GetStrbyName("rating_agency", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.bond_level = packer.GetIntbyName("bond_level", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncpubL_1_105Models.Add(reqCommand);
            }
            return FuncpubL_1_105Models;
        }
 
        //逻辑_公共_证券基础数据_查询债券评级流水
        public static List<FuncpubL_1_105Model> GetFuncpubL_1_105Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_1_105Models = new List<FuncpubL_1_105Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_1_105Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    reqCommand.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    reqCommand.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    reqCommand.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    reqCommand.oper_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MENU_NO_INT);
                    reqCommand.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.rating_agency = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RATING_AGENCY_STR);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.bond_level = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BOND_LEVEL_INT);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncpubL_1_105Models.Add(reqCommand);
                }
            }
            return FuncpubL_1_105Models;
        }
 
        //逻辑_公共_证券基础数据_查询历史债券评级流水
        public static List<FuncpubL_1_106Model> GetFuncpubL_1_106Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_1_106Models = new List<FuncpubL_1_106Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_1_106Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.opor_co_no = packer.GetIntbyName("opor_co_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.oper_mac = packer.GetStrbyName("oper_mac", i);
                reqCommand.oper_ip_addr = packer.GetStrbyName("oper_ip_addr", i);
                reqCommand.oper_info = packer.GetStrbyName("oper_info", i);
                reqCommand.oper_way = packer.GetStrbyName("oper_way", i);
                reqCommand.oper_menu_no = packer.GetIntbyName("oper_menu_no", i);
                reqCommand.oper_func_code = packer.GetStrbyName("oper_func_code", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.rating_agency = packer.GetStrbyName("rating_agency", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.bond_level = packer.GetIntbyName("bond_level", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncpubL_1_106Models.Add(reqCommand);
            }
            return FuncpubL_1_106Models;
        }
 
        //逻辑_公共_证券基础数据_查询历史债券评级流水
        public static List<FuncpubL_1_106Model> GetFuncpubL_1_106Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_1_106Models = new List<FuncpubL_1_106Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_1_106Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    reqCommand.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    reqCommand.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    reqCommand.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    reqCommand.oper_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MENU_NO_INT);
                    reqCommand.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.rating_agency = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RATING_AGENCY_STR);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.bond_level = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BOND_LEVEL_INT);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncpubL_1_106Models.Add(reqCommand);
                }
            }
            return FuncpubL_1_106Models;
        }
 
        //逻辑_公共_证券基础数据_查询回购代码信息
        public static List<FuncpubL_1_130Model> GetFuncpubL_1_130Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_1_130Models = new List<FuncpubL_1_130Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_1_130Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.stock_name = packer.GetStrbyName("stock_name", i);
                reqCommand.repo_days = packer.GetIntbyName("repo_days", i);
                reqCommand.cash_capt_days = packer.GetIntbyName("cash_capt_days", i);
                reqCommand.last_price = packer.GetDoublebyName("last_price", i);
 
                FuncpubL_1_130Models.Add(reqCommand);
            }
            return FuncpubL_1_130Models;
        }
 
        //逻辑_公共_证券基础数据_查询回购代码信息
        public static List<FuncpubL_1_130Model> GetFuncpubL_1_130Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_1_130Models = new List<FuncpubL_1_130Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_1_130Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    reqCommand.repo_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPO_DAYS_INT);
                    reqCommand.cash_capt_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CASH_CAPT_DAYS_INT);
                    reqCommand.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    FuncpubL_1_130Models.Add(reqCommand);
                }
            }
            return FuncpubL_1_130Models;
        }
 
        //逻辑_公共_证券基础数据_逆回购获取代码费用信息
        public static List<FuncpubL_1_131Model> GetFuncpubL_1_131Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_1_131Models = new List<FuncpubL_1_131Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_1_131Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.amt_ratio_str = packer.GetStrbyName("amt_ratio_str", i);
                reqCommand.amt_value_str = packer.GetStrbyName("amt_value_str", i);
                reqCommand.max_fee_str = packer.GetStrbyName("max_fee_str", i);
                reqCommand.min_fee_str = packer.GetStrbyName("min_fee_str", i);
                reqCommand.par_value = packer.GetDoublebyName("par_value", i);
 
                FuncpubL_1_131Models.Add(reqCommand);
            }
            return FuncpubL_1_131Models;
        }
 
        //逻辑_公共_证券基础数据_逆回购获取代码费用信息
        public static List<FuncpubL_1_131Model> GetFuncpubL_1_131Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_1_131Models = new List<FuncpubL_1_131Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncpubL_1_131Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.amt_ratio_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_AMT_RATIO_STR_STR);
                reqCommand.amt_value_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_AMT_VALUE_STR_STR);
                reqCommand.max_fee_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MAX_FEE_STR_STR);
                reqCommand.min_fee_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MIN_FEE_STR_STR);
                reqCommand.par_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_FLOAT);
                FuncpubL_1_131Models.Add(reqCommand);
            }
            return FuncpubL_1_131Models;
        }
 
        //逻辑_公共_证券基础数据_查询港股价位
        public static List<FuncpubL_1_140Model> GetFuncpubL_1_140Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_1_140Models = new List<FuncpubL_1_140Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_1_140Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.begin_price = packer.GetDoublebyName("begin_price", i);
                reqCommand.end_price = packer.GetDoublebyName("end_price", i);
                reqCommand.step_price = packer.GetDoublebyName("step_price", i);
 
                FuncpubL_1_140Models.Add(reqCommand);
            }
            return FuncpubL_1_140Models;
        }
 
        //逻辑_公共_证券基础数据_查询港股价位
        public static List<FuncpubL_1_140Model> GetFuncpubL_1_140Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_1_140Models = new List<FuncpubL_1_140Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_1_140Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.begin_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_PRICE_FLOAT);
                    reqCommand.end_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_END_PRICE_FLOAT);
                    reqCommand.step_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STEP_PRICE_FLOAT);
                    FuncpubL_1_140Models.Add(reqCommand);
                }
            }
            return FuncpubL_1_140Models;
        }
 
        //逻辑_公共_证券基础数据_编号获取证券信息
        public static List<FuncpubL_1_141Model> GetFuncpubL_1_141Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_1_141Models = new List<FuncpubL_1_141Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_1_141Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_name = packer.GetStrbyName("stock_name", i);
 
                FuncpubL_1_141Models.Add(reqCommand);
            }
            return FuncpubL_1_141Models;
        }
 
        //逻辑_公共_证券基础数据_编号获取证券信息
        public static List<FuncpubL_1_141Model> GetFuncpubL_1_141Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_1_141Models = new List<FuncpubL_1_141Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_1_141Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    FuncpubL_1_141Models.Add(reqCommand);
                }
            }
            return FuncpubL_1_141Models;
        }
 
        //逻辑_公共_证券基础数据_查询基金属性信息
        public static List<FuncpubL_1_145Model> GetFuncpubL_1_145Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_1_145Models = new List<FuncpubL_1_145Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_1_145Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_name = packer.GetStrbyName("stock_name", i);
                reqCommand.fund_kind = packer.GetIntbyName("fund_kind", i);
                reqCommand.fund_manager = packer.GetStrbyName("fund_manager", i);
                reqCommand.fund_trustee = packer.GetStrbyName("fund_trustee", i);
                reqCommand.distribution_scale = packer.GetDoublebyName("distribution_scale", i);
                reqCommand.charging_method = packer.GetIntbyName("charging_method", i);
                reqCommand.default_divide_type = packer.GetIntbyName("default_divide_type", i);
                reqCommand.fund_found_date = packer.GetIntbyName("fund_found_date", i);
                reqCommand.fund_expire_date = packer.GetIntbyName("fund_expire_date", i);
                reqCommand.subscription_trade_mark = packer.GetIntbyName("subscription_trade_mark", i);
                reqCommand.purchase_trade_mark = packer.GetIntbyName("purchase_trade_mark", i);
                reqCommand.rede_trade_mark = packer.GetIntbyName("rede_trade_mark", i);
                reqCommand.first_minimum_amt = packer.GetDoublebyName("first_minimum_amt", i);
                reqCommand.minimum_subscription_amt = packer.GetDoublebyName("minimum_subscription_amt", i);
                reqCommand.minimum_purchase_amt = packer.GetDoublebyName("minimum_purchase_amt", i);
                reqCommand.minimum_rede_share = packer.GetDoublebyName("minimum_rede_share", i);
                reqCommand.minimum_holding_share = packer.GetDoublebyName("minimum_holding_share", i);
                reqCommand.minimum_turning_out_share = packer.GetDoublebyName("minimum_turning_out_share", i);
                reqCommand.rede_money_to_account_days = packer.GetIntbyName("rede_money_to_account_days", i);
                reqCommand.registration_agency = packer.GetStrbyName("registration_agency", i);
                reqCommand.time_stamp = packer.GetIntbyName("time_stamp", i);
 
                FuncpubL_1_145Models.Add(reqCommand);
            }
            return FuncpubL_1_145Models;
        }
 
        //逻辑_公共_证券基础数据_查询基金属性信息
        public static List<FuncpubL_1_145Model> GetFuncpubL_1_145Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_1_145Models = new List<FuncpubL_1_145Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_1_145Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    reqCommand.fund_kind = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUND_KIND_INT);
                    reqCommand.fund_manager = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_STR);
                    reqCommand.fund_trustee = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FUND_TRUSTEE_STR);
                    reqCommand.distribution_scale = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DISTRIBUTION_SCALE_FLOAT);
                    reqCommand.charging_method = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CHARGING_METHOD_INT);
                    reqCommand.default_divide_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEFAULT_DIVIDE_TYPE_INT);
                    reqCommand.fund_found_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUND_FOUND_DATE_INT);
                    reqCommand.fund_expire_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUND_EXPIRE_DATE_INT);
                    reqCommand.subscription_trade_mark = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SUBSCRIPTION_TRADE_MARK_INT);
                    reqCommand.purchase_trade_mark = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PURCHASE_TRADE_MARK_INT);
                    reqCommand.rede_trade_mark = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REDE_TRADE_MARK_INT);
                    reqCommand.first_minimum_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FIRST_MINIMUM_AMT_FLOAT);
                    reqCommand.minimum_subscription_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MINIMUM_SUBSCRIPTION_AMT_FLOAT);
                    reqCommand.minimum_purchase_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MINIMUM_PURCHASE_AMT_FLOAT);
                    reqCommand.minimum_rede_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MINIMUM_REDE_SHARE_FLOAT);
                    reqCommand.minimum_holding_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MINIMUM_HOLDING_SHARE_FLOAT);
                    reqCommand.minimum_turning_out_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MINIMUM_TURNING_OUT_SHARE_FLOAT);
                    reqCommand.rede_money_to_account_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REDE_MONEY_TO_ACCOUNT_DAYS_INT);
                    reqCommand.registration_agency = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REGISTRATION_AGENCY_STR);
                    reqCommand.time_stamp = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT);
                    FuncpubL_1_145Models.Add(reqCommand);
                }
            }
            return FuncpubL_1_145Models;
        }
 
        //逻辑_公共_证券基础数据_获取基金属性
        public static List<FuncpubL_1_146Model> GetFuncpubL_1_146Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_1_146Models = new List<FuncpubL_1_146Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_1_146Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_name = packer.GetStrbyName("stock_name", i);
                reqCommand.fund_kind = packer.GetIntbyName("fund_kind", i);
                reqCommand.fund_manager = packer.GetStrbyName("fund_manager", i);
                reqCommand.fund_trustee = packer.GetStrbyName("fund_trustee", i);
                reqCommand.distribution_scale = packer.GetDoublebyName("distribution_scale", i);
                reqCommand.charging_method = packer.GetIntbyName("charging_method", i);
                reqCommand.default_divide_type = packer.GetIntbyName("default_divide_type", i);
                reqCommand.fund_found_date = packer.GetIntbyName("fund_found_date", i);
                reqCommand.fund_expire_date = packer.GetIntbyName("fund_expire_date", i);
                reqCommand.subscription_trade_mark = packer.GetIntbyName("subscription_trade_mark", i);
                reqCommand.purchase_trade_mark = packer.GetIntbyName("purchase_trade_mark", i);
                reqCommand.rede_trade_mark = packer.GetIntbyName("rede_trade_mark", i);
                reqCommand.first_minimum_amt = packer.GetDoublebyName("first_minimum_amt", i);
                reqCommand.minimum_subscription_amt = packer.GetDoublebyName("minimum_subscription_amt", i);
                reqCommand.minimum_purchase_amt = packer.GetDoublebyName("minimum_purchase_amt", i);
                reqCommand.minimum_rede_share = packer.GetDoublebyName("minimum_rede_share", i);
                reqCommand.minimum_holding_share = packer.GetDoublebyName("minimum_holding_share", i);
                reqCommand.minimum_turning_out_share = packer.GetDoublebyName("minimum_turning_out_share", i);
                reqCommand.rede_money_to_account_days = packer.GetIntbyName("rede_money_to_account_days", i);
                reqCommand.registration_agency = packer.GetStrbyName("registration_agency", i);
                reqCommand.time_stamp = packer.GetIntbyName("time_stamp", i);
 
                FuncpubL_1_146Models.Add(reqCommand);
            }
            return FuncpubL_1_146Models;
        }
 
        //逻辑_公共_证券基础数据_获取基金属性
        public static List<FuncpubL_1_146Model> GetFuncpubL_1_146Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_1_146Models = new List<FuncpubL_1_146Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncpubL_1_146Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                reqCommand.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                reqCommand.fund_kind = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUND_KIND_INT);
                reqCommand.fund_manager = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_STR);
                reqCommand.fund_trustee = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FUND_TRUSTEE_STR);
                reqCommand.distribution_scale = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DISTRIBUTION_SCALE_FLOAT);
                reqCommand.charging_method = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CHARGING_METHOD_INT);
                reqCommand.default_divide_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEFAULT_DIVIDE_TYPE_INT);
                reqCommand.fund_found_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUND_FOUND_DATE_INT);
                reqCommand.fund_expire_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUND_EXPIRE_DATE_INT);
                reqCommand.subscription_trade_mark = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SUBSCRIPTION_TRADE_MARK_INT);
                reqCommand.purchase_trade_mark = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PURCHASE_TRADE_MARK_INT);
                reqCommand.rede_trade_mark = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REDE_TRADE_MARK_INT);
                reqCommand.first_minimum_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FIRST_MINIMUM_AMT_FLOAT);
                reqCommand.minimum_subscription_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MINIMUM_SUBSCRIPTION_AMT_FLOAT);
                reqCommand.minimum_purchase_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MINIMUM_PURCHASE_AMT_FLOAT);
                reqCommand.minimum_rede_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MINIMUM_REDE_SHARE_FLOAT);
                reqCommand.minimum_holding_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MINIMUM_HOLDING_SHARE_FLOAT);
                reqCommand.minimum_turning_out_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MINIMUM_TURNING_OUT_SHARE_FLOAT);
                reqCommand.rede_money_to_account_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REDE_MONEY_TO_ACCOUNT_DAYS_INT);
                reqCommand.registration_agency = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REGISTRATION_AGENCY_STR);
                reqCommand.time_stamp = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT);
                FuncpubL_1_146Models.Add(reqCommand);
            }
            return FuncpubL_1_146Models;
        }
 
        //逻辑_公共_证券基础数据_查询基金属性流水
        public static List<FuncpubL_1_147Model> GetFuncpubL_1_147Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_1_147Models = new List<FuncpubL_1_147Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_1_147Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.opor_co_no = packer.GetIntbyName("opor_co_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.oper_mac = packer.GetStrbyName("oper_mac", i);
                reqCommand.oper_ip_addr = packer.GetStrbyName("oper_ip_addr", i);
                reqCommand.oper_info = packer.GetStrbyName("oper_info", i);
                reqCommand.oper_way = packer.GetStrbyName("oper_way", i);
                reqCommand.oper_menu_no = packer.GetIntbyName("oper_menu_no", i);
                reqCommand.oper_func_code = packer.GetStrbyName("oper_func_code", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.jour_occur_field = packer.GetStrbyName("jour_occur_field", i);
                reqCommand.jour_after_occur_info = packer.GetStrbyName("jour_after_occur_info", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncpubL_1_147Models.Add(reqCommand);
            }
            return FuncpubL_1_147Models;
        }
 
        //逻辑_公共_证券基础数据_查询基金属性流水
        public static List<FuncpubL_1_147Model> GetFuncpubL_1_147Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_1_147Models = new List<FuncpubL_1_147Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_1_147Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    reqCommand.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    reqCommand.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    reqCommand.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    reqCommand.oper_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MENU_NO_INT);
                    reqCommand.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    reqCommand.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncpubL_1_147Models.Add(reqCommand);
                }
            }
            return FuncpubL_1_147Models;
        }
 
        //逻辑_公共_证券基础数据_查询历史基金属性流水
        public static List<FuncpubL_1_148Model> GetFuncpubL_1_148Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_1_148Models = new List<FuncpubL_1_148Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_1_148Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.opor_co_no = packer.GetIntbyName("opor_co_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.oper_mac = packer.GetStrbyName("oper_mac", i);
                reqCommand.oper_ip_addr = packer.GetStrbyName("oper_ip_addr", i);
                reqCommand.oper_info = packer.GetStrbyName("oper_info", i);
                reqCommand.oper_way = packer.GetStrbyName("oper_way", i);
                reqCommand.oper_menu_no = packer.GetIntbyName("oper_menu_no", i);
                reqCommand.oper_func_code = packer.GetStrbyName("oper_func_code", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.jour_occur_field = packer.GetStrbyName("jour_occur_field", i);
                reqCommand.jour_after_occur_info = packer.GetStrbyName("jour_after_occur_info", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncpubL_1_148Models.Add(reqCommand);
            }
            return FuncpubL_1_148Models;
        }
 
        //逻辑_公共_证券基础数据_查询历史基金属性流水
        public static List<FuncpubL_1_148Model> GetFuncpubL_1_148Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_1_148Models = new List<FuncpubL_1_148Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_1_148Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    reqCommand.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    reqCommand.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    reqCommand.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    reqCommand.oper_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MENU_NO_INT);
                    reqCommand.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    reqCommand.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncpubL_1_148Models.Add(reqCommand);
                }
            }
            return FuncpubL_1_148Models;
        }
 
        //逻辑_公共_证券基础数据_查询新股开板监控信息
        public static List<FuncpubL_1_151Model> GetFuncpubL_1_151Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_1_151Models = new List<FuncpubL_1_151Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_1_151Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_name = packer.GetStrbyName("stock_name", i);
                reqCommand.trade_code = packer.GetStrbyName("trade_code", i);
                reqCommand.target_code = packer.GetStrbyName("target_code", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.trade_code_no = packer.GetIntbyName("trade_code_no", i);
                reqCommand.target_code_no = packer.GetIntbyName("target_code_no", i);
                reqCommand.apply_date = packer.GetIntbyName("apply_date", i);
                reqCommand.apply_limit = packer.GetDoublebyName("apply_limit", i);
                reqCommand.begin_trade_date = packer.GetIntbyName("begin_trade_date", i);
                reqCommand.issue_price = packer.GetDoublebyName("issue_price", i);
                reqCommand.warn_trade_amount = packer.GetDoublebyName("warn_trade_amount", i);
                reqCommand.warn_buy_amount = packer.GetDoublebyName("warn_buy_amount", i);
                reqCommand.warn_auto_sell = packer.GetIntbyName("warn_auto_sell", i);
                reqCommand.is_warn = packer.GetIntbyName("is_warn", i);
                reqCommand.stock_open_date = packer.GetIntbyName("stock_open_date", i);
                reqCommand.stock_open_price = packer.GetDoublebyName("stock_open_price", i);
                reqCommand.strike_qty = packer.GetDoublebyName("strike_qty", i);
                reqCommand.buy_qty_1 = packer.GetDoublebyName("buy_qty_1", i);
                reqCommand.up_limit_price = packer.GetDoublebyName("up_limit_price", i);
                reqCommand.last_price = packer.GetDoublebyName("last_price", i);
 
                FuncpubL_1_151Models.Add(reqCommand);
            }
            return FuncpubL_1_151Models;
        }
 
        //逻辑_公共_证券基础数据_查询新股开板监控信息
        public static List<FuncpubL_1_151Model> GetFuncpubL_1_151Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_1_151Models = new List<FuncpubL_1_151Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_1_151Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    reqCommand.trade_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_STR);
                    reqCommand.target_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_STR);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.trade_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_NO_INT);
                    reqCommand.target_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_NO_INT);
                    reqCommand.apply_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_APPLY_DATE_INT);
                    reqCommand.apply_limit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_APPLY_LIMIT_FLOAT);
                    reqCommand.begin_trade_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TRADE_DATE_INT);
                    reqCommand.issue_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ISSUE_PRICE_FLOAT);
                    reqCommand.warn_trade_amount = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WARN_TRADE_AMOUNT_FLOAT);
                    reqCommand.warn_buy_amount = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WARN_BUY_AMOUNT_FLOAT);
                    reqCommand.warn_auto_sell = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WARN_AUTO_SELL_INT);
                    reqCommand.is_warn = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_WARN_INT);
                    reqCommand.stock_open_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_OPEN_DATE_INT);
                    reqCommand.stock_open_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_OPEN_PRICE_FLOAT);
                    reqCommand.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    reqCommand.buy_qty_1 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_QTY_1_FLOAT);
                    reqCommand.up_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UP_LIMIT_PRICE_FLOAT);
                    reqCommand.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    FuncpubL_1_151Models.Add(reqCommand);
                }
            }
            return FuncpubL_1_151Models;
        }
 
        //逻辑_公共_证券基础数据_查询触警新股信息
        public static List<FuncpubL_1_155Model> GetFuncpubL_1_155Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_1_155Models = new List<FuncpubL_1_155Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_1_155Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_name = packer.GetStrbyName("stock_name", i);
                reqCommand.warn_trade_amount = packer.GetDoublebyName("warn_trade_amount", i);
                reqCommand.strike_qty = packer.GetDoublebyName("strike_qty", i);
                reqCommand.warn_buy_amount = packer.GetDoublebyName("warn_buy_amount", i);
                reqCommand.buy_qty_1 = packer.GetDoublebyName("buy_qty_1", i);
                reqCommand.up_limit_price = packer.GetDoublebyName("up_limit_price", i);
                reqCommand.last_price = packer.GetDoublebyName("last_price", i);
 
                FuncpubL_1_155Models.Add(reqCommand);
            }
            return FuncpubL_1_155Models;
        }
 
        //逻辑_公共_证券基础数据_查询触警新股信息
        public static List<FuncpubL_1_155Model> GetFuncpubL_1_155Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_1_155Models = new List<FuncpubL_1_155Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_1_155Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    reqCommand.warn_trade_amount = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WARN_TRADE_AMOUNT_FLOAT);
                    reqCommand.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    reqCommand.warn_buy_amount = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WARN_BUY_AMOUNT_FLOAT);
                    reqCommand.buy_qty_1 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_QTY_1_FLOAT);
                    reqCommand.up_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UP_LIMIT_PRICE_FLOAT);
                    reqCommand.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    FuncpubL_1_155Models.Add(reqCommand);
                }
            }
            return FuncpubL_1_155Models;
        }
 
        //逻辑_公共_证券基础数据_查询所有新股信息
        public static List<FuncpubL_1_157Model> GetFuncpubL_1_157Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_1_157Models = new List<FuncpubL_1_157Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_1_157Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_name = packer.GetStrbyName("stock_name", i);
                reqCommand.trade_code = packer.GetStrbyName("trade_code", i);
                reqCommand.target_code = packer.GetStrbyName("target_code", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.trade_code_no = packer.GetIntbyName("trade_code_no", i);
                reqCommand.target_code_no = packer.GetIntbyName("target_code_no", i);
                reqCommand.apply_date = packer.GetIntbyName("apply_date", i);
                reqCommand.apply_limit = packer.GetDoublebyName("apply_limit", i);
                reqCommand.begin_trade_date = packer.GetIntbyName("begin_trade_date", i);
                reqCommand.issue_price = packer.GetDoublebyName("issue_price", i);
 
                FuncpubL_1_157Models.Add(reqCommand);
            }
            return FuncpubL_1_157Models;
        }
 
        //逻辑_公共_证券基础数据_查询所有新股信息
        public static List<FuncpubL_1_157Model> GetFuncpubL_1_157Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_1_157Models = new List<FuncpubL_1_157Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_1_157Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    reqCommand.trade_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_STR);
                    reqCommand.target_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_STR);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.trade_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_NO_INT);
                    reqCommand.target_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_NO_INT);
                    reqCommand.apply_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_APPLY_DATE_INT);
                    reqCommand.apply_limit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_APPLY_LIMIT_FLOAT);
                    reqCommand.begin_trade_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TRADE_DATE_INT);
                    reqCommand.issue_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ISSUE_PRICE_FLOAT);
                    FuncpubL_1_157Models.Add(reqCommand);
                }
            }
            return FuncpubL_1_157Models;
        }
 
        //逻辑_公共_证券基础数据_查询基金产品对照关系
        public static List<FuncpubL_1_160Model> GetFuncpubL_1_160Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_1_160Models = new List<FuncpubL_1_160Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_1_160Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_name = packer.GetStrbyName("stock_name", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
 
                FuncpubL_1_160Models.Add(reqCommand);
            }
            return FuncpubL_1_160Models;
        }
 
        //逻辑_公共_证券基础数据_查询基金产品对照关系
        public static List<FuncpubL_1_160Model> GetFuncpubL_1_160Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_1_160Models = new List<FuncpubL_1_160Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_1_160Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    FuncpubL_1_160Models.Add(reqCommand);
                }
            }
            return FuncpubL_1_160Models;
        }
 
        //逻辑_公共_证券基础数据_查询特殊证券行情计算单位
        public static List<FuncpubL_1_164Model> GetFuncpubL_1_164Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_1_164Models = new List<FuncpubL_1_164Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_1_164Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.quot_calc_unit = packer.GetDoublebyName("quot_calc_unit", i);
 
                FuncpubL_1_164Models.Add(reqCommand);
            }
            return FuncpubL_1_164Models;
        }
 
        //逻辑_公共_证券基础数据_查询特殊证券行情计算单位
        public static List<FuncpubL_1_164Model> GetFuncpubL_1_164Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_1_164Models = new List<FuncpubL_1_164Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_1_164Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.quot_calc_unit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_QUOT_CALC_UNIT_FLOAT);
                    FuncpubL_1_164Models.Add(reqCommand);
                }
            }
            return FuncpubL_1_164Models;
        }
 
        //逻辑_公共_证券基础数据_查询证券收盘价
        public static List<FuncpubL_1_177Model> GetFuncpubL_1_177Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_1_177Models = new List<FuncpubL_1_177Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_1_177Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_name = packer.GetStrbyName("stock_name", i);
                reqCommand.up_limit_price = packer.GetDoublebyName("up_limit_price", i);
                reqCommand.down_limit_price = packer.GetDoublebyName("down_limit_price", i);
                reqCommand.last_price = packer.GetDoublebyName("last_price", i);
                reqCommand.pre_close_price = packer.GetDoublebyName("pre_close_price", i);
                reqCommand.today_open_price = packer.GetDoublebyName("today_open_price", i);
                reqCommand.today_close_price = packer.GetDoublebyName("today_close_price", i);
                reqCommand.today_max_price = packer.GetDoublebyName("today_max_price", i);
                reqCommand.today_min_price = packer.GetDoublebyName("today_min_price", i);
 
                FuncpubL_1_177Models.Add(reqCommand);
            }
            return FuncpubL_1_177Models;
        }
 
        //逻辑_公共_证券基础数据_查询证券收盘价
        public static List<FuncpubL_1_177Model> GetFuncpubL_1_177Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_1_177Models = new List<FuncpubL_1_177Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_1_177Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    reqCommand.up_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UP_LIMIT_PRICE_FLOAT);
                    reqCommand.down_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DOWN_LIMIT_PRICE_FLOAT);
                    reqCommand.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    reqCommand.pre_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_CLOSE_PRICE_FLOAT);
                    reqCommand.today_open_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_OPEN_PRICE_FLOAT);
                    reqCommand.today_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_CLOSE_PRICE_FLOAT);
                    reqCommand.today_max_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_MAX_PRICE_FLOAT);
                    reqCommand.today_min_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_MIN_PRICE_FLOAT);
                    FuncpubL_1_177Models.Add(reqCommand);
                }
            }
            return FuncpubL_1_177Models;
        }
 
    }
}
