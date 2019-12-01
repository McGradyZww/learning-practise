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

    public static class BaseFutuData
    {
        //逻辑_公共_期货基础数据_查询合约类型
        public static List<FuncpubL_13_114Model> GetFuncpubL_13_114Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_13_114Models = new List<FuncpubL_13_114Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_13_114Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.contrc_type = packer.GetIntbyName("contrc_type", i);
                reqCommand.contrc_type_name = packer.GetStrbyName("contrc_type_name", i);
                reqCommand.asset_type = packer.GetIntbyName("asset_type", i);
                reqCommand.par_value = packer.GetDoublebyName("par_value", i);
                reqCommand.contrc_unit = packer.GetIntbyName("contrc_unit", i);
                reqCommand.report_unit = packer.GetIntbyName("report_unit", i);
                reqCommand.min_unit = packer.GetIntbyName("min_unit", i);
                reqCommand.max_qty = packer.GetDoublebyName("max_qty", i);
                reqCommand.min_qty = packer.GetDoublebyName("min_qty", i);
                reqCommand.type_unit = packer.GetIntbyName("type_unit", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.exch_crncy_type = packer.GetStrbyName("exch_crncy_type", i);
                reqCommand.capit_reback_days = packer.GetIntbyName("capit_reback_days", i);
                reqCommand.posi_reback_days = packer.GetIntbyName("posi_reback_days", i);
                reqCommand.is_order_dir_flag = packer.GetIntbyName("is_order_dir_flag", i);
                reqCommand.time_stamp = packer.GetIntbyName("time_stamp", i);
 
                FuncpubL_13_114Models.Add(reqCommand);
            }
            return FuncpubL_13_114Models;
        }
 
        //逻辑_公共_期货基础数据_查询合约类型
        public static List<FuncpubL_13_114Model> GetFuncpubL_13_114Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_13_114Models = new List<FuncpubL_13_114Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_13_114Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    reqCommand.contrc_type_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_NAME_STR);
                    reqCommand.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    reqCommand.par_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_FLOAT);
                    reqCommand.contrc_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_UNIT_INT);
                    reqCommand.report_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_UNIT_INT);
                    reqCommand.min_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MIN_UNIT_INT);
                    reqCommand.max_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_QTY_FLOAT);
                    reqCommand.min_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_QTY_FLOAT);
                    reqCommand.type_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TYPE_UNIT_INT);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.exch_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR);
                    reqCommand.capit_reback_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CAPIT_REBACK_DAYS_INT);
                    reqCommand.posi_reback_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_POSI_REBACK_DAYS_INT);
                    reqCommand.is_order_dir_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_ORDER_DIR_FLAG_INT);
                    reqCommand.time_stamp = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT);
                    FuncpubL_13_114Models.Add(reqCommand);
                }
            }
            return FuncpubL_13_114Models;
        }
 
        //逻辑_公共_期货基础数据_查询合约类型流水
        public static List<FuncpubL_13_115Model> GetFuncpubL_13_115Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_13_115Models = new List<FuncpubL_13_115Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_13_115Model();
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
                reqCommand.contrc_type = packer.GetIntbyName("contrc_type", i);
                reqCommand.jour_occur_field = packer.GetStrbyName("jour_occur_field", i);
                reqCommand.jour_after_occur_info = packer.GetStrbyName("jour_after_occur_info", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncpubL_13_115Models.Add(reqCommand);
            }
            return FuncpubL_13_115Models;
        }
 
        //逻辑_公共_期货基础数据_查询合约类型流水
        public static List<FuncpubL_13_115Model> GetFuncpubL_13_115Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_13_115Models = new List<FuncpubL_13_115Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_13_115Model();
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
                    reqCommand.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    reqCommand.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    reqCommand.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncpubL_13_115Models.Add(reqCommand);
                }
            }
            return FuncpubL_13_115Models;
        }
 
        //逻辑_公共_期货基础数据_查询历史合约类型流水
        public static List<FuncpubL_13_116Model> GetFuncpubL_13_116Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_13_116Models = new List<FuncpubL_13_116Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_13_116Model();
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
                reqCommand.contrc_type = packer.GetIntbyName("contrc_type", i);
                reqCommand.jour_occur_field = packer.GetStrbyName("jour_occur_field", i);
                reqCommand.jour_after_occur_info = packer.GetStrbyName("jour_after_occur_info", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncpubL_13_116Models.Add(reqCommand);
            }
            return FuncpubL_13_116Models;
        }
 
        //逻辑_公共_期货基础数据_查询历史合约类型流水
        public static List<FuncpubL_13_116Model> GetFuncpubL_13_116Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_13_116Models = new List<FuncpubL_13_116Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_13_116Model();
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
                    reqCommand.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    reqCommand.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    reqCommand.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncpubL_13_116Models.Add(reqCommand);
                }
            }
            return FuncpubL_13_116Models;
        }
 
        //逻辑_公共_期货基础数据_查询合约类型订单方向
        public static List<FuncpubL_13_124Model> GetFuncpubL_13_124Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_13_124Models = new List<FuncpubL_13_124Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_13_124Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.contrc_type = packer.GetIntbyName("contrc_type", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.cash_frozen_type = packer.GetIntbyName("cash_frozen_type", i);
                reqCommand.order_split_flag = packer.GetIntbyName("order_split_flag", i);
                reqCommand.min_unit = packer.GetIntbyName("min_unit", i);
                reqCommand.min_qty = packer.GetDoublebyName("min_qty", i);
                reqCommand.max_qty = packer.GetDoublebyName("max_qty", i);
                reqCommand.time_stamp = packer.GetIntbyName("time_stamp", i);
 
                FuncpubL_13_124Models.Add(reqCommand);
            }
            return FuncpubL_13_124Models;
        }
 
        //逻辑_公共_期货基础数据_查询合约类型订单方向
        public static List<FuncpubL_13_124Model> GetFuncpubL_13_124Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_13_124Models = new List<FuncpubL_13_124Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_13_124Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.cash_frozen_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CASH_FROZEN_TYPE_INT);
                    reqCommand.order_split_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_SPLIT_FLAG_INT);
                    reqCommand.min_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MIN_UNIT_INT);
                    reqCommand.min_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_QTY_FLOAT);
                    reqCommand.max_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_QTY_FLOAT);
                    reqCommand.time_stamp = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT);
                    FuncpubL_13_124Models.Add(reqCommand);
                }
            }
            return FuncpubL_13_124Models;
        }
 
        //逻辑_公共_期货基础数据_初始化期货代码信息
        public static List<FuncpubL_13_131Model> GetFuncpubL_13_131Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_13_131Models = new List<FuncpubL_13_131Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_13_131Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
 
                FuncpubL_13_131Models.Add(reqCommand);
            }
            return FuncpubL_13_131Models;
        }
 
        //逻辑_公共_期货基础数据_初始化期货代码信息
        public static List<FuncpubL_13_131Model> GetFuncpubL_13_131Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_13_131Models = new List<FuncpubL_13_131Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncpubL_13_131Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                FuncpubL_13_131Models.Add(reqCommand);
            }
            return FuncpubL_13_131Models;
        }
 
        //逻辑_公共_期货基础数据_期货合约列表查询
        public static List<FuncpubL_13_133Model> GetFuncpubL_13_133Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_13_133Models = new List<FuncpubL_13_133Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_13_133Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.contrc_code_no = packer.GetIntbyName("contrc_code_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.contrc_code = packer.GetStrbyName("contrc_code", i);
                reqCommand.contrc_name = packer.GetStrbyName("contrc_name", i);
                reqCommand.pinyin_short = packer.GetStrbyName("pinyin_short", i);
                reqCommand.contrc_type = packer.GetIntbyName("contrc_type", i);
                reqCommand.asset_type = packer.GetIntbyName("asset_type", i);
                reqCommand.par_value = packer.GetDoublebyName("par_value", i);
                reqCommand.contrc_unit = packer.GetIntbyName("contrc_unit", i);
                reqCommand.report_unit = packer.GetIntbyName("report_unit", i);
                reqCommand.min_unit = packer.GetIntbyName("min_unit", i);
                reqCommand.max_qty = packer.GetDoublebyName("max_qty", i);
                reqCommand.min_qty = packer.GetDoublebyName("min_qty", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.exch_crncy_type = packer.GetStrbyName("exch_crncy_type", i);
                reqCommand.capit_reback_days = packer.GetIntbyName("capit_reback_days", i);
                reqCommand.posi_reback_days = packer.GetIntbyName("posi_reback_days", i);
                reqCommand.fee_set = packer.GetStrbyName("fee_set", i);
                reqCommand.is_order_dir_flag = packer.GetIntbyName("is_order_dir_flag", i);
                reqCommand.valid_flag = packer.GetIntbyName("valid_flag", i);
                reqCommand.contrc_limit_flag = packer.GetIntbyName("contrc_limit_flag", i);
                reqCommand.margin_pref = packer.GetIntbyName("margin_pref", i);
                reqCommand.posi_type = packer.GetIntbyName("posi_type", i);
                reqCommand.deli_year = packer.GetIntbyName("deli_year", i);
                reqCommand.deli_month = packer.GetIntbyName("deli_month", i);
                reqCommand.begin_trade_date = packer.GetIntbyName("begin_trade_date", i);
                reqCommand.expire_date = packer.GetIntbyName("expire_date", i);
                reqCommand.begin_deli_date = packer.GetIntbyName("begin_deli_date", i);
                reqCommand.end_deli_date = packer.GetIntbyName("end_deli_date", i);
                reqCommand.open_order_type = packer.GetIntbyName("open_order_type", i);
                reqCommand.step_price = packer.GetDoublebyName("step_price", i);
                reqCommand.hold_qty = packer.GetDoublebyName("hold_qty", i);
                reqCommand.main_flag = packer.GetIntbyName("main_flag", i);
                reqCommand.time_stamp = packer.GetIntbyName("time_stamp", i);
 
                FuncpubL_13_133Models.Add(reqCommand);
            }
            return FuncpubL_13_133Models;
        }
 
        //逻辑_公共_期货基础数据_期货合约列表查询
        public static List<FuncpubL_13_133Model> GetFuncpubL_13_133Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_13_133Models = new List<FuncpubL_13_133Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_13_133Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.contrc_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR);
                    reqCommand.contrc_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_NAME_STR);
                    reqCommand.pinyin_short = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PINYIN_SHORT_STR);
                    reqCommand.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    reqCommand.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    reqCommand.par_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_FLOAT);
                    reqCommand.contrc_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_UNIT_INT);
                    reqCommand.report_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_UNIT_INT);
                    reqCommand.min_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MIN_UNIT_INT);
                    reqCommand.max_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_QTY_FLOAT);
                    reqCommand.min_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_QTY_FLOAT);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.exch_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR);
                    reqCommand.capit_reback_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CAPIT_REBACK_DAYS_INT);
                    reqCommand.posi_reback_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_POSI_REBACK_DAYS_INT);
                    reqCommand.fee_set = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FEE_SET_STR);
                    reqCommand.is_order_dir_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_ORDER_DIR_FLAG_INT);
                    reqCommand.valid_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_VALID_FLAG_INT);
                    reqCommand.contrc_limit_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_LIMIT_FLAG_INT);
                    reqCommand.margin_pref = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MARGIN_PREF_INT);
                    reqCommand.posi_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_POSI_TYPE_INT);
                    reqCommand.deli_year = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DELI_YEAR_INT);
                    reqCommand.deli_month = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DELI_MONTH_INT);
                    reqCommand.begin_trade_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TRADE_DATE_INT);
                    reqCommand.expire_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXPIRE_DATE_INT);
                    reqCommand.begin_deli_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DELI_DATE_INT);
                    reqCommand.end_deli_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DELI_DATE_INT);
                    reqCommand.open_order_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_ORDER_TYPE_INT);
                    reqCommand.step_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STEP_PRICE_FLOAT);
                    reqCommand.hold_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HOLD_QTY_FLOAT);
                    reqCommand.main_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MAIN_FLAG_INT);
                    reqCommand.time_stamp = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT);
                    FuncpubL_13_133Models.Add(reqCommand);
                }
            }
            return FuncpubL_13_133Models;
        }
 
        //逻辑_公共_期货基础数据_查询期货模板
        public static List<FuncpubL_13_134Model> GetFuncpubL_13_134Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_13_134Models = new List<FuncpubL_13_134Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_13_134Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.model_name = packer.GetStrbyName("model_name", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.contrc_type = packer.GetIntbyName("contrc_type", i);
                reqCommand.asset_type = packer.GetIntbyName("asset_type", i);
                reqCommand.prefix_char = packer.GetStrbyName("prefix_char", i);
                reqCommand.contrc_unit = packer.GetIntbyName("contrc_unit", i);
                reqCommand.report_unit = packer.GetIntbyName("report_unit", i);
                reqCommand.market_min_qty = packer.GetDoublebyName("market_min_qty", i);
                reqCommand.market_max_qty = packer.GetDoublebyName("market_max_qty", i);
                reqCommand.limit_min_qty = packer.GetDoublebyName("limit_min_qty", i);
                reqCommand.limit_max_qty = packer.GetDoublebyName("limit_max_qty", i);
                reqCommand.open_order_type = packer.GetIntbyName("open_order_type", i);
 
                FuncpubL_13_134Models.Add(reqCommand);
            }
            return FuncpubL_13_134Models;
        }
 
        //逻辑_公共_期货基础数据_查询期货模板
        public static List<FuncpubL_13_134Model> GetFuncpubL_13_134Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_13_134Models = new List<FuncpubL_13_134Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_13_134Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.model_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MODEL_NAME_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    reqCommand.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    reqCommand.prefix_char = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PREFIX_CHAR_STR);
                    reqCommand.contrc_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_UNIT_INT);
                    reqCommand.report_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_UNIT_INT);
                    reqCommand.market_min_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_MIN_QTY_FLOAT);
                    reqCommand.market_max_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_MAX_QTY_FLOAT);
                    reqCommand.limit_min_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LIMIT_MIN_QTY_FLOAT);
                    reqCommand.limit_max_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LIMIT_MAX_QTY_FLOAT);
                    reqCommand.open_order_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_ORDER_TYPE_INT);
                    FuncpubL_13_134Models.Add(reqCommand);
                }
            }
            return FuncpubL_13_134Models;
        }
 
        //逻辑_公共_期货基础数据_新增合约代码信息
        public static List<FuncpubL_13_141Model> GetFuncpubL_13_141Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_13_141Models = new List<FuncpubL_13_141Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_13_141Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.contrc_code_no = packer.GetIntbyName("contrc_code_no", i);
 
                FuncpubL_13_141Models.Add(reqCommand);
            }
            return FuncpubL_13_141Models;
        }
 
        //逻辑_公共_期货基础数据_新增合约代码信息
        public static List<FuncpubL_13_141Model> GetFuncpubL_13_141Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_13_141Models = new List<FuncpubL_13_141Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncpubL_13_141Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                FuncpubL_13_141Models.Add(reqCommand);
            }
            return FuncpubL_13_141Models;
        }
 
        //逻辑_公共_期货基础数据_查询合约代码信息
        public static List<FuncpubL_13_144Model> GetFuncpubL_13_144Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_13_144Models = new List<FuncpubL_13_144Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_13_144Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.contrc_code_no = packer.GetIntbyName("contrc_code_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.contrc_code = packer.GetStrbyName("contrc_code", i);
                reqCommand.contrc_name = packer.GetStrbyName("contrc_name", i);
                reqCommand.pinyin_short = packer.GetStrbyName("pinyin_short", i);
                reqCommand.contrc_type = packer.GetIntbyName("contrc_type", i);
                reqCommand.asset_type = packer.GetIntbyName("asset_type", i);
                reqCommand.par_value = packer.GetDoublebyName("par_value", i);
                reqCommand.contrc_unit = packer.GetIntbyName("contrc_unit", i);
                reqCommand.report_unit = packer.GetIntbyName("report_unit", i);
                reqCommand.min_unit = packer.GetIntbyName("min_unit", i);
                reqCommand.max_qty = packer.GetDoublebyName("max_qty", i);
                reqCommand.min_qty = packer.GetDoublebyName("min_qty", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.exch_crncy_type = packer.GetStrbyName("exch_crncy_type", i);
                reqCommand.capit_reback_days = packer.GetIntbyName("capit_reback_days", i);
                reqCommand.posi_reback_days = packer.GetIntbyName("posi_reback_days", i);
                reqCommand.fee_set = packer.GetStrbyName("fee_set", i);
                reqCommand.is_order_dir_flag = packer.GetIntbyName("is_order_dir_flag", i);
                reqCommand.valid_flag = packer.GetIntbyName("valid_flag", i);
                reqCommand.contrc_limit_flag = packer.GetIntbyName("contrc_limit_flag", i);
                reqCommand.margin_pref = packer.GetIntbyName("margin_pref", i);
                reqCommand.posi_type = packer.GetIntbyName("posi_type", i);
                reqCommand.deli_year = packer.GetIntbyName("deli_year", i);
                reqCommand.deli_month = packer.GetIntbyName("deli_month", i);
                reqCommand.begin_trade_date = packer.GetIntbyName("begin_trade_date", i);
                reqCommand.expire_date = packer.GetIntbyName("expire_date", i);
                reqCommand.begin_deli_date = packer.GetIntbyName("begin_deli_date", i);
                reqCommand.end_deli_date = packer.GetIntbyName("end_deli_date", i);
                reqCommand.open_order_type = packer.GetIntbyName("open_order_type", i);
                reqCommand.step_price = packer.GetDoublebyName("step_price", i);
                reqCommand.hold_qty = packer.GetDoublebyName("hold_qty", i);
                reqCommand.main_flag = packer.GetIntbyName("main_flag", i);
                reqCommand.time_stamp = packer.GetIntbyName("time_stamp", i);
 
                FuncpubL_13_144Models.Add(reqCommand);
            }
            return FuncpubL_13_144Models;
        }
 
        //逻辑_公共_期货基础数据_查询合约代码信息
        public static List<FuncpubL_13_144Model> GetFuncpubL_13_144Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_13_144Models = new List<FuncpubL_13_144Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_13_144Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.contrc_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR);
                    reqCommand.contrc_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_NAME_STR);
                    reqCommand.pinyin_short = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PINYIN_SHORT_STR);
                    reqCommand.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    reqCommand.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    reqCommand.par_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_FLOAT);
                    reqCommand.contrc_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_UNIT_INT);
                    reqCommand.report_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_UNIT_INT);
                    reqCommand.min_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MIN_UNIT_INT);
                    reqCommand.max_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_QTY_FLOAT);
                    reqCommand.min_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_QTY_FLOAT);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.exch_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR);
                    reqCommand.capit_reback_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CAPIT_REBACK_DAYS_INT);
                    reqCommand.posi_reback_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_POSI_REBACK_DAYS_INT);
                    reqCommand.fee_set = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FEE_SET_STR);
                    reqCommand.is_order_dir_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_ORDER_DIR_FLAG_INT);
                    reqCommand.valid_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_VALID_FLAG_INT);
                    reqCommand.contrc_limit_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_LIMIT_FLAG_INT);
                    reqCommand.margin_pref = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MARGIN_PREF_INT);
                    reqCommand.posi_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_POSI_TYPE_INT);
                    reqCommand.deli_year = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DELI_YEAR_INT);
                    reqCommand.deli_month = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DELI_MONTH_INT);
                    reqCommand.begin_trade_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TRADE_DATE_INT);
                    reqCommand.expire_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXPIRE_DATE_INT);
                    reqCommand.begin_deli_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DELI_DATE_INT);
                    reqCommand.end_deli_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DELI_DATE_INT);
                    reqCommand.open_order_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_ORDER_TYPE_INT);
                    reqCommand.step_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STEP_PRICE_FLOAT);
                    reqCommand.hold_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HOLD_QTY_FLOAT);
                    reqCommand.main_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MAIN_FLAG_INT);
                    reqCommand.time_stamp = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT);
                    FuncpubL_13_144Models.Add(reqCommand);
                }
            }
            return FuncpubL_13_144Models;
        }
 
        //逻辑_公共_期货基础数据_查询客户端合约代码信息
        public static List<FuncpubL_13_148Model> GetFuncpubL_13_148Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_13_148Models = new List<FuncpubL_13_148Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_13_148Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.contrc_code_no = packer.GetIntbyName("contrc_code_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.contrc_code = packer.GetStrbyName("contrc_code", i);
                reqCommand.contrc_name = packer.GetStrbyName("contrc_name", i);
                reqCommand.pinyin_short = packer.GetStrbyName("pinyin_short", i);
                reqCommand.contrc_type = packer.GetIntbyName("contrc_type", i);
                reqCommand.asset_type = packer.GetIntbyName("asset_type", i);
                reqCommand.contrc_unit = packer.GetIntbyName("contrc_unit", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.exch_crncy_type = packer.GetStrbyName("exch_crncy_type", i);
                reqCommand.capit_reback_days = packer.GetIntbyName("capit_reback_days", i);
                reqCommand.posi_reback_days = packer.GetIntbyName("posi_reback_days", i);
                reqCommand.step_price = packer.GetDoublebyName("step_price", i);
                reqCommand.main_flag = packer.GetIntbyName("main_flag", i);
                reqCommand.time_stamp = packer.GetIntbyName("time_stamp", i);
 
                FuncpubL_13_148Models.Add(reqCommand);
            }
            return FuncpubL_13_148Models;
        }
 
        //逻辑_公共_期货基础数据_查询客户端合约代码信息
        public static List<FuncpubL_13_148Model> GetFuncpubL_13_148Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_13_148Models = new List<FuncpubL_13_148Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_13_148Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.contrc_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR);
                    reqCommand.contrc_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_NAME_STR);
                    reqCommand.pinyin_short = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PINYIN_SHORT_STR);
                    reqCommand.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    reqCommand.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    reqCommand.contrc_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_UNIT_INT);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.exch_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR);
                    reqCommand.capit_reback_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CAPIT_REBACK_DAYS_INT);
                    reqCommand.posi_reback_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_POSI_REBACK_DAYS_INT);
                    reqCommand.step_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STEP_PRICE_FLOAT);
                    reqCommand.main_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MAIN_FLAG_INT);
                    reqCommand.time_stamp = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT);
                    FuncpubL_13_148Models.Add(reqCommand);
                }
            }
            return FuncpubL_13_148Models;
        }
 
        //逻辑_公共_期货基础数据_获取合约代码信息
        public static List<FuncpubL_13_145Model> GetFuncpubL_13_145Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_13_145Models = new List<FuncpubL_13_145Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_13_145Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.contrc_code_no = packer.GetIntbyName("contrc_code_no", i);
                reqCommand.contrc_name = packer.GetStrbyName("contrc_name", i);
                reqCommand.pinyin_short = packer.GetStrbyName("pinyin_short", i);
                reqCommand.contrc_type = packer.GetIntbyName("contrc_type", i);
                reqCommand.asset_type = packer.GetIntbyName("asset_type", i);
                reqCommand.par_value = packer.GetDoublebyName("par_value", i);
                reqCommand.contrc_unit = packer.GetIntbyName("contrc_unit", i);
                reqCommand.report_unit = packer.GetIntbyName("report_unit", i);
                reqCommand.min_unit = packer.GetIntbyName("min_unit", i);
                reqCommand.max_qty = packer.GetDoublebyName("max_qty", i);
                reqCommand.min_qty = packer.GetDoublebyName("min_qty", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.exch_crncy_type = packer.GetStrbyName("exch_crncy_type", i);
                reqCommand.capit_reback_days = packer.GetIntbyName("capit_reback_days", i);
                reqCommand.posi_reback_days = packer.GetIntbyName("posi_reback_days", i);
                reqCommand.fee_set = packer.GetStrbyName("fee_set", i);
                reqCommand.is_order_dir_flag = packer.GetIntbyName("is_order_dir_flag", i);
                reqCommand.valid_flag = packer.GetIntbyName("valid_flag", i);
                reqCommand.contrc_limit_flag = packer.GetIntbyName("contrc_limit_flag", i);
                reqCommand.margin_pref = packer.GetIntbyName("margin_pref", i);
                reqCommand.posi_type = packer.GetIntbyName("posi_type", i);
                reqCommand.deli_year = packer.GetIntbyName("deli_year", i);
                reqCommand.deli_month = packer.GetIntbyName("deli_month", i);
                reqCommand.begin_trade_date = packer.GetIntbyName("begin_trade_date", i);
                reqCommand.expire_date = packer.GetIntbyName("expire_date", i);
                reqCommand.begin_deli_date = packer.GetIntbyName("begin_deli_date", i);
                reqCommand.end_deli_date = packer.GetIntbyName("end_deli_date", i);
                reqCommand.open_order_type = packer.GetIntbyName("open_order_type", i);
                reqCommand.step_price = packer.GetDoublebyName("step_price", i);
                reqCommand.hold_qty = packer.GetDoublebyName("hold_qty", i);
                reqCommand.main_flag = packer.GetIntbyName("main_flag", i);
                reqCommand.time_stamp = packer.GetIntbyName("time_stamp", i);
 
                FuncpubL_13_145Models.Add(reqCommand);
            }
            return FuncpubL_13_145Models;
        }
 
        //逻辑_公共_期货基础数据_获取合约代码信息
        public static List<FuncpubL_13_145Model> GetFuncpubL_13_145Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_13_145Models = new List<FuncpubL_13_145Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncpubL_13_145Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                reqCommand.contrc_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_NAME_STR);
                reqCommand.pinyin_short = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PINYIN_SHORT_STR);
                reqCommand.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                reqCommand.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                reqCommand.par_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_FLOAT);
                reqCommand.contrc_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_UNIT_INT);
                reqCommand.report_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_UNIT_INT);
                reqCommand.min_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MIN_UNIT_INT);
                reqCommand.max_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_QTY_FLOAT);
                reqCommand.min_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_QTY_FLOAT);
                reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                reqCommand.exch_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR);
                reqCommand.capit_reback_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CAPIT_REBACK_DAYS_INT);
                reqCommand.posi_reback_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_POSI_REBACK_DAYS_INT);
                reqCommand.fee_set = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FEE_SET_STR);
                reqCommand.is_order_dir_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_ORDER_DIR_FLAG_INT);
                reqCommand.valid_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_VALID_FLAG_INT);
                reqCommand.contrc_limit_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_LIMIT_FLAG_INT);
                reqCommand.margin_pref = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MARGIN_PREF_INT);
                reqCommand.posi_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_POSI_TYPE_INT);
                reqCommand.deli_year = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DELI_YEAR_INT);
                reqCommand.deli_month = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DELI_MONTH_INT);
                reqCommand.begin_trade_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TRADE_DATE_INT);
                reqCommand.expire_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXPIRE_DATE_INT);
                reqCommand.begin_deli_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DELI_DATE_INT);
                reqCommand.end_deli_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DELI_DATE_INT);
                reqCommand.open_order_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_ORDER_TYPE_INT);
                reqCommand.step_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STEP_PRICE_FLOAT);
                reqCommand.hold_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HOLD_QTY_FLOAT);
                reqCommand.main_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MAIN_FLAG_INT);
                reqCommand.time_stamp = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT);
                FuncpubL_13_145Models.Add(reqCommand);
            }
            return FuncpubL_13_145Models;
        }
 
        //逻辑_公共_期货基础数据_查询合约代码信息流水
        public static List<FuncpubL_13_146Model> GetFuncpubL_13_146Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_13_146Models = new List<FuncpubL_13_146Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_13_146Model();
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
                reqCommand.contrc_code_no = packer.GetIntbyName("contrc_code_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.contrc_code = packer.GetStrbyName("contrc_code", i);
                reqCommand.jour_occur_field = packer.GetStrbyName("jour_occur_field", i);
                reqCommand.jour_after_occur_info = packer.GetStrbyName("jour_after_occur_info", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncpubL_13_146Models.Add(reqCommand);
            }
            return FuncpubL_13_146Models;
        }
 
        //逻辑_公共_期货基础数据_查询合约代码信息流水
        public static List<FuncpubL_13_146Model> GetFuncpubL_13_146Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_13_146Models = new List<FuncpubL_13_146Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_13_146Model();
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
                    reqCommand.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.contrc_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR);
                    reqCommand.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    reqCommand.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncpubL_13_146Models.Add(reqCommand);
                }
            }
            return FuncpubL_13_146Models;
        }
 
        //逻辑_公共_期货基础数据_查询历史合约代码信息流水
        public static List<FuncpubL_13_147Model> GetFuncpubL_13_147Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_13_147Models = new List<FuncpubL_13_147Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_13_147Model();
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
                reqCommand.contrc_code_no = packer.GetIntbyName("contrc_code_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.contrc_code = packer.GetStrbyName("contrc_code", i);
                reqCommand.jour_occur_field = packer.GetStrbyName("jour_occur_field", i);
                reqCommand.jour_after_occur_info = packer.GetStrbyName("jour_after_occur_info", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncpubL_13_147Models.Add(reqCommand);
            }
            return FuncpubL_13_147Models;
        }
 
        //逻辑_公共_期货基础数据_查询历史合约代码信息流水
        public static List<FuncpubL_13_147Model> GetFuncpubL_13_147Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_13_147Models = new List<FuncpubL_13_147Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_13_147Model();
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
                    reqCommand.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.contrc_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR);
                    reqCommand.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    reqCommand.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncpubL_13_147Models.Add(reqCommand);
                }
            }
            return FuncpubL_13_147Models;
        }
 
        //逻辑_公共_期货基础数据_查询合约代码列表
        public static List<FuncpubL_13_149Model> GetFuncpubL_13_149Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_13_149Models = new List<FuncpubL_13_149Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_13_149Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.contrc_code_no = packer.GetIntbyName("contrc_code_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.contrc_code = packer.GetStrbyName("contrc_code", i);
                reqCommand.contrc_name = packer.GetStrbyName("contrc_name", i);
                reqCommand.contrc_type = packer.GetIntbyName("contrc_type", i);
                reqCommand.asset_type = packer.GetIntbyName("asset_type", i);
 
                FuncpubL_13_149Models.Add(reqCommand);
            }
            return FuncpubL_13_149Models;
        }
 
        //逻辑_公共_期货基础数据_查询合约代码列表
        public static List<FuncpubL_13_149Model> GetFuncpubL_13_149Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_13_149Models = new List<FuncpubL_13_149Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_13_149Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.contrc_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR);
                    reqCommand.contrc_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_NAME_STR);
                    reqCommand.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    reqCommand.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    FuncpubL_13_149Models.Add(reqCommand);
                }
            }
            return FuncpubL_13_149Models;
        }
 
        //逻辑_公共_期货基础数据_查询合约代码订单方向
        public static List<FuncpubL_13_154Model> GetFuncpubL_13_154Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_13_154Models = new List<FuncpubL_13_154Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_13_154Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.contrc_code_no = packer.GetIntbyName("contrc_code_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.cash_frozen_type = packer.GetIntbyName("cash_frozen_type", i);
                reqCommand.order_split_flag = packer.GetIntbyName("order_split_flag", i);
                reqCommand.min_unit = packer.GetIntbyName("min_unit", i);
                reqCommand.min_qty = packer.GetDoublebyName("min_qty", i);
                reqCommand.max_qty = packer.GetDoublebyName("max_qty", i);
                reqCommand.time_stamp = packer.GetIntbyName("time_stamp", i);
 
                FuncpubL_13_154Models.Add(reqCommand);
            }
            return FuncpubL_13_154Models;
        }
 
        //逻辑_公共_期货基础数据_查询合约代码订单方向
        public static List<FuncpubL_13_154Model> GetFuncpubL_13_154Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_13_154Models = new List<FuncpubL_13_154Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_13_154Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.cash_frozen_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CASH_FROZEN_TYPE_INT);
                    reqCommand.order_split_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_SPLIT_FLAG_INT);
                    reqCommand.min_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MIN_UNIT_INT);
                    reqCommand.min_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_QTY_FLOAT);
                    reqCommand.max_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_QTY_FLOAT);
                    reqCommand.time_stamp = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT);
                    FuncpubL_13_154Models.Add(reqCommand);
                }
            }
            return FuncpubL_13_154Models;
        }
 
        //逻辑_公共_期货基础数据_查询合约代码订单方向流水
        public static List<FuncpubL_13_155Model> GetFuncpubL_13_155Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_13_155Models = new List<FuncpubL_13_155Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_13_155Model();
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
                reqCommand.contrc_code_no = packer.GetIntbyName("contrc_code_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.jour_occur_field = packer.GetStrbyName("jour_occur_field", i);
                reqCommand.jour_after_occur_info = packer.GetStrbyName("jour_after_occur_info", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncpubL_13_155Models.Add(reqCommand);
            }
            return FuncpubL_13_155Models;
        }
 
        //逻辑_公共_期货基础数据_查询合约代码订单方向流水
        public static List<FuncpubL_13_155Model> GetFuncpubL_13_155Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_13_155Models = new List<FuncpubL_13_155Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_13_155Model();
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
                    reqCommand.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    reqCommand.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncpubL_13_155Models.Add(reqCommand);
                }
            }
            return FuncpubL_13_155Models;
        }
 
        //逻辑_公共_期货基础数据_查询历史合约代码订单方向流水
        public static List<FuncpubL_13_156Model> GetFuncpubL_13_156Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_13_156Models = new List<FuncpubL_13_156Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_13_156Model();
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
                reqCommand.contrc_code_no = packer.GetIntbyName("contrc_code_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.jour_occur_field = packer.GetStrbyName("jour_occur_field", i);
                reqCommand.jour_after_occur_info = packer.GetStrbyName("jour_after_occur_info", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncpubL_13_156Models.Add(reqCommand);
            }
            return FuncpubL_13_156Models;
        }
 
        //逻辑_公共_期货基础数据_查询历史合约代码订单方向流水
        public static List<FuncpubL_13_156Model> GetFuncpubL_13_156Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_13_156Models = new List<FuncpubL_13_156Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_13_156Model();
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
                    reqCommand.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    reqCommand.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncpubL_13_156Models.Add(reqCommand);
                }
            }
            return FuncpubL_13_156Models;
        }
 
        //逻辑_公共_期货基础数据_查询合约交割参数记录
        public static List<FuncpubL_13_160Model> GetFuncpubL_13_160Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_13_160Models = new List<FuncpubL_13_160Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_13_160Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.contrc_code_no = packer.GetIntbyName("contrc_code_no", i);
                reqCommand.deli_price = packer.GetDoublebyName("deli_price", i);
 
                FuncpubL_13_160Models.Add(reqCommand);
            }
            return FuncpubL_13_160Models;
        }
 
        //逻辑_公共_期货基础数据_查询合约交割参数记录
        public static List<FuncpubL_13_160Model> GetFuncpubL_13_160Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_13_160Models = new List<FuncpubL_13_160Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_13_160Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    reqCommand.deli_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DELI_PRICE_FLOAT);
                    FuncpubL_13_160Models.Add(reqCommand);
                }
            }
            return FuncpubL_13_160Models;
        }
 
        //逻辑_公共_期货基础数据_查询组合保证金参数
        public static List<FuncpubL_13_161Model> GetFuncpubL_13_161Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_13_161Models = new List<FuncpubL_13_161Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_13_161Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.comb_code = packer.GetStrbyName("comb_code", i);
                reqCommand.comb_name = packer.GetStrbyName("comb_name", i);
                reqCommand.comb_type = packer.GetIntbyName("comb_type", i);
                reqCommand.pref_type = packer.GetIntbyName("pref_type", i);
                reqCommand.partic_code = packer.GetStrbyName("partic_code", i);
                reqCommand.margin_ratio = packer.GetDoublebyName("margin_ratio", i);
                reqCommand.prior_type = packer.GetIntbyName("prior_type", i);
                reqCommand.trade_pref = packer.GetIntbyName("trade_pref", i);
                reqCommand.sett_pref = packer.GetIntbyName("sett_pref", i);
 
                FuncpubL_13_161Models.Add(reqCommand);
            }
            return FuncpubL_13_161Models;
        }
 
        //逻辑_公共_期货基础数据_查询组合保证金参数
        public static List<FuncpubL_13_161Model> GetFuncpubL_13_161Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_13_161Models = new List<FuncpubL_13_161Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_13_161Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.comb_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMB_CODE_STR);
                    reqCommand.comb_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMB_NAME_STR);
                    reqCommand.comb_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMB_TYPE_INT);
                    reqCommand.pref_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PREF_TYPE_INT);
                    reqCommand.partic_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PARTIC_CODE_STR);
                    reqCommand.margin_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARGIN_RATIO_FLOAT);
                    reqCommand.prior_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRIOR_TYPE_INT);
                    reqCommand.trade_pref = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_PREF_INT);
                    reqCommand.sett_pref = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SETT_PREF_INT);
                    FuncpubL_13_161Models.Add(reqCommand);
                }
            }
            return FuncpubL_13_161Models;
        }
 
        //逻辑_公共_期货基础数据_查询自选行情记录
        public static List<FuncpubL_13_172Model> GetFuncpubL_13_172Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_13_172Models = new List<FuncpubL_13_172Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_13_172Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.contrc_code_no = packer.GetIntbyName("contrc_code_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.contrc_code = packer.GetStrbyName("contrc_code", i);
                reqCommand.contrc_name = packer.GetStrbyName("contrc_name", i);
                reqCommand.contrc_type = packer.GetIntbyName("contrc_type", i);
 
                FuncpubL_13_172Models.Add(reqCommand);
            }
            return FuncpubL_13_172Models;
        }
 
        //逻辑_公共_期货基础数据_查询自选行情记录
        public static List<FuncpubL_13_172Model> GetFuncpubL_13_172Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_13_172Models = new List<FuncpubL_13_172Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_13_172Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.contrc_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR);
                    reqCommand.contrc_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_NAME_STR);
                    reqCommand.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    FuncpubL_13_172Models.Add(reqCommand);
                }
            }
            return FuncpubL_13_172Models;
        }
 
        //逻辑_公共_期货基础数据_查询期货行情
        public static List<FuncpubL_13_173Model> GetFuncpubL_13_173Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_13_173Models = new List<FuncpubL_13_173Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_13_173Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.contrc_code_no = packer.GetIntbyName("contrc_code_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.contrc_code = packer.GetStrbyName("contrc_code", i);
                reqCommand.contrc_name = packer.GetStrbyName("contrc_name", i);
                reqCommand.pre_close_price = packer.GetDoublebyName("pre_close_price", i);
                reqCommand.sett_price = packer.GetDoublebyName("sett_price", i);
                reqCommand.pre_settle_price = packer.GetDoublebyName("pre_settle_price", i);
                reqCommand.today_close_price = packer.GetDoublebyName("today_close_price", i);
                reqCommand.hold_qty = packer.GetDoublebyName("hold_qty", i);
                reqCommand.pre_hold_qty = packer.GetDoublebyName("pre_hold_qty", i);
                reqCommand.last_price = packer.GetDoublebyName("last_price", i);
                reqCommand.today_open_price = packer.GetDoublebyName("today_open_price", i);
                reqCommand.max_buy_price = packer.GetDoublebyName("max_buy_price", i);
                reqCommand.min_sale_price = packer.GetDoublebyName("min_sale_price", i);
                reqCommand.total_buy_qty = packer.GetDoublebyName("total_buy_qty", i);
                reqCommand.total_sale_qty = packer.GetDoublebyName("total_sale_qty", i);
                reqCommand.up_limit_price = packer.GetDoublebyName("up_limit_price", i);
                reqCommand.down_limit_price = packer.GetDoublebyName("down_limit_price", i);
                reqCommand.strike_qty = packer.GetDoublebyName("strike_qty", i);
                reqCommand.strike_amt = packer.GetDoublebyName("strike_amt", i);
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
                reqCommand.contrc_type = packer.GetIntbyName("contrc_type", i);
                reqCommand.asset_type = packer.GetIntbyName("asset_type", i);
                reqCommand.time_stamp = packer.GetIntbyName("time_stamp", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FuncpubL_13_173Models.Add(reqCommand);
            }
            return FuncpubL_13_173Models;
        }
 
        //逻辑_公共_期货基础数据_查询期货行情
        public static List<FuncpubL_13_173Model> GetFuncpubL_13_173Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_13_173Models = new List<FuncpubL_13_173Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_13_173Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.contrc_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR);
                    reqCommand.contrc_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_NAME_STR);
                    reqCommand.pre_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_CLOSE_PRICE_FLOAT);
                    reqCommand.sett_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SETT_PRICE_FLOAT);
                    reqCommand.pre_settle_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SETTLE_PRICE_FLOAT);
                    reqCommand.today_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_CLOSE_PRICE_FLOAT);
                    reqCommand.hold_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HOLD_QTY_FLOAT);
                    reqCommand.pre_hold_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_HOLD_QTY_FLOAT);
                    reqCommand.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    reqCommand.today_open_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_OPEN_PRICE_FLOAT);
                    reqCommand.max_buy_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_BUY_PRICE_FLOAT);
                    reqCommand.min_sale_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_SALE_PRICE_FLOAT);
                    reqCommand.total_buy_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_BUY_QTY_FLOAT);
                    reqCommand.total_sale_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_SALE_QTY_FLOAT);
                    reqCommand.up_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UP_LIMIT_PRICE_FLOAT);
                    reqCommand.down_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DOWN_LIMIT_PRICE_FLOAT);
                    reqCommand.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    reqCommand.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
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
                    reqCommand.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    reqCommand.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    reqCommand.time_stamp = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FuncpubL_13_173Models.Add(reqCommand);
                }
            }
            return FuncpubL_13_173Models;
        }
 
    }
}
