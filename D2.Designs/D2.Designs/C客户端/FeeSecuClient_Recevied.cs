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

    public static class FeeSecuClient
    {
        //逻辑_公共_证券费用客户端_新增证券费用模板
        public static List<FuncpubL_23_11Model> GetFuncpubL_23_11Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_23_11Models = new List<FuncpubL_23_11Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_23_11Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.fee_tmplat_no = packer.GetIntbyName("fee_tmplat_no", i);
 
                FuncpubL_23_11Models.Add(reqCommand);
            }
            return FuncpubL_23_11Models;
        }
 
        //逻辑_公共_证券费用客户端_新增证券费用模板
        public static List<FuncpubL_23_11Model> GetFuncpubL_23_11Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_23_11Models = new List<FuncpubL_23_11Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncpubL_23_11Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.fee_tmplat_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_INT);
                FuncpubL_23_11Models.Add(reqCommand);
            }
            return FuncpubL_23_11Models;
        }
 
        //逻辑_公共_证券费用客户端_查询证券费用模板
        public static List<FuncpubL_23_14Model> GetFuncpubL_23_14Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_23_14Models = new List<FuncpubL_23_14Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_23_14Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.fee_tmplat_no = packer.GetIntbyName("fee_tmplat_no", i);
                reqCommand.fee_tmplat_name = packer.GetStrbyName("fee_tmplat_name", i);
                reqCommand.fee_tmplat_kind = packer.GetIntbyName("fee_tmplat_kind", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncpubL_23_14Models.Add(reqCommand);
            }
            return FuncpubL_23_14Models;
        }
 
        //逻辑_公共_证券费用客户端_查询证券费用模板
        public static List<FuncpubL_23_14Model> GetFuncpubL_23_14Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_23_14Models = new List<FuncpubL_23_14Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_23_14Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.fee_tmplat_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_INT);
                    reqCommand.fee_tmplat_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NAME_STR);
                    reqCommand.fee_tmplat_kind = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_KIND_INT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncpubL_23_14Models.Add(reqCommand);
                }
            }
            return FuncpubL_23_14Models;
        }
 
        //逻辑_公共_证券费用客户端_查询证券费用模板流水
        public static List<FuncpubL_23_15Model> GetFuncpubL_23_15Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_23_15Models = new List<FuncpubL_23_15Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_23_15Model();
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
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.fee_tmplat_no = packer.GetIntbyName("fee_tmplat_no", i);
                reqCommand.fee_tmplat_name = packer.GetStrbyName("fee_tmplat_name", i);
                reqCommand.fee_tmplat_kind = packer.GetIntbyName("fee_tmplat_kind", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncpubL_23_15Models.Add(reqCommand);
            }
            return FuncpubL_23_15Models;
        }
 
        //逻辑_公共_证券费用客户端_查询证券费用模板流水
        public static List<FuncpubL_23_15Model> GetFuncpubL_23_15Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_23_15Models = new List<FuncpubL_23_15Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_23_15Model();
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
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.fee_tmplat_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_INT);
                    reqCommand.fee_tmplat_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NAME_STR);
                    reqCommand.fee_tmplat_kind = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_KIND_INT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncpubL_23_15Models.Add(reqCommand);
                }
            }
            return FuncpubL_23_15Models;
        }
 
        //逻辑_公共_证券费用客户端_查询历史证券费用模板流水
        public static List<FuncpubL_23_16Model> GetFuncpubL_23_16Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_23_16Models = new List<FuncpubL_23_16Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_23_16Model();
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
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.fee_tmplat_no = packer.GetIntbyName("fee_tmplat_no", i);
                reqCommand.fee_tmplat_name = packer.GetStrbyName("fee_tmplat_name", i);
                reqCommand.fee_tmplat_kind = packer.GetIntbyName("fee_tmplat_kind", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncpubL_23_16Models.Add(reqCommand);
            }
            return FuncpubL_23_16Models;
        }
 
        //逻辑_公共_证券费用客户端_查询历史证券费用模板流水
        public static List<FuncpubL_23_16Model> GetFuncpubL_23_16Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_23_16Models = new List<FuncpubL_23_16Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_23_16Model();
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
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.fee_tmplat_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_INT);
                    reqCommand.fee_tmplat_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NAME_STR);
                    reqCommand.fee_tmplat_kind = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_KIND_INT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncpubL_23_16Models.Add(reqCommand);
                }
            }
            return FuncpubL_23_16Models;
        }
 
        //逻辑_公共_证券费用客户端_复制证券费用模板
        public static List<FuncpubL_23_17Model> GetFuncpubL_23_17Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_23_17Models = new List<FuncpubL_23_17Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_23_17Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.fee_tmplat_no = packer.GetIntbyName("fee_tmplat_no", i);
 
                FuncpubL_23_17Models.Add(reqCommand);
            }
            return FuncpubL_23_17Models;
        }
 
        //逻辑_公共_证券费用客户端_复制证券费用模板
        public static List<FuncpubL_23_17Model> GetFuncpubL_23_17Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_23_17Models = new List<FuncpubL_23_17Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncpubL_23_17Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.fee_tmplat_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_INT);
                FuncpubL_23_17Models.Add(reqCommand);
            }
            return FuncpubL_23_17Models;
        }
 
        //逻辑_公共_证券费用客户端_查询证券类型费用模板明细
        public static List<FuncpubL_23_24Model> GetFuncpubL_23_24Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_23_24Models = new List<FuncpubL_23_24Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_23_24Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.fee_no = packer.GetIntbyName("fee_no", i);
                reqCommand.fee_tmplat_no = packer.GetIntbyName("fee_tmplat_no", i);
                reqCommand.secu_fee_type = packer.GetIntbyName("secu_fee_type", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.amt_ratio = packer.GetDoublebyName("amt_ratio", i);
                reqCommand.amt_value = packer.GetDoublebyName("amt_value", i);
                reqCommand.par_value_ratio = packer.GetDoublebyName("par_value_ratio", i);
                reqCommand.par_value_value = packer.GetDoublebyName("par_value_value", i);
                reqCommand.max_fee = packer.GetDoublebyName("max_fee", i);
                reqCommand.min_fee = packer.GetDoublebyName("min_fee", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncpubL_23_24Models.Add(reqCommand);
            }
            return FuncpubL_23_24Models;
        }
 
        //逻辑_公共_证券费用客户端_查询证券类型费用模板明细
        public static List<FuncpubL_23_24Model> GetFuncpubL_23_24Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_23_24Models = new List<FuncpubL_23_24Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_23_24Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.fee_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_NO_INT);
                    reqCommand.fee_tmplat_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_INT);
                    reqCommand.secu_fee_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SECU_FEE_TYPE_INT);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.amt_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_RATIO_FLOAT);
                    reqCommand.amt_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_VALUE_FLOAT);
                    reqCommand.par_value_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_RATIO_FLOAT);
                    reqCommand.par_value_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_VALUE_FLOAT);
                    reqCommand.max_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_FEE_FLOAT);
                    reqCommand.min_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_FEE_FLOAT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncpubL_23_24Models.Add(reqCommand);
                }
            }
            return FuncpubL_23_24Models;
        }
 
        //逻辑_公共_证券费用客户端_查询证券类型费用模板明细流水
        public static List<FuncpubL_23_25Model> GetFuncpubL_23_25Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_23_25Models = new List<FuncpubL_23_25Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_23_25Model();
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
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.fee_tmplat_no = packer.GetIntbyName("fee_tmplat_no", i);
                reqCommand.jour_occur_field = packer.GetStrbyName("jour_occur_field", i);
                reqCommand.jour_after_occur_info = packer.GetStrbyName("jour_after_occur_info", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncpubL_23_25Models.Add(reqCommand);
            }
            return FuncpubL_23_25Models;
        }
 
        //逻辑_公共_证券费用客户端_查询证券类型费用模板明细流水
        public static List<FuncpubL_23_25Model> GetFuncpubL_23_25Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_23_25Models = new List<FuncpubL_23_25Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_23_25Model();
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
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.fee_tmplat_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_INT);
                    reqCommand.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    reqCommand.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncpubL_23_25Models.Add(reqCommand);
                }
            }
            return FuncpubL_23_25Models;
        }
 
        //逻辑_公共_证券费用客户端_查询历史证券类型费用模板明细流水
        public static List<FuncpubL_23_26Model> GetFuncpubL_23_26Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_23_26Models = new List<FuncpubL_23_26Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_23_26Model();
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
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.fee_tmplat_no = packer.GetIntbyName("fee_tmplat_no", i);
                reqCommand.jour_occur_field = packer.GetStrbyName("jour_occur_field", i);
                reqCommand.jour_after_occur_info = packer.GetStrbyName("jour_after_occur_info", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncpubL_23_26Models.Add(reqCommand);
            }
            return FuncpubL_23_26Models;
        }
 
        //逻辑_公共_证券费用客户端_查询历史证券类型费用模板明细流水
        public static List<FuncpubL_23_26Model> GetFuncpubL_23_26Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_23_26Models = new List<FuncpubL_23_26Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_23_26Model();
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
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.fee_tmplat_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_INT);
                    reqCommand.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    reqCommand.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncpubL_23_26Models.Add(reqCommand);
                }
            }
            return FuncpubL_23_26Models;
        }
 
        //逻辑_公共_证券费用客户端_查询证券代码费用模板明细
        public static List<FuncpubL_23_34Model> GetFuncpubL_23_34Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_23_34Models = new List<FuncpubL_23_34Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_23_34Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.fee_tmplat_no = packer.GetIntbyName("fee_tmplat_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.fee_no = packer.GetIntbyName("fee_no", i);
                reqCommand.secu_fee_type = packer.GetIntbyName("secu_fee_type", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.amt_ratio = packer.GetDoublebyName("amt_ratio", i);
                reqCommand.amt_value = packer.GetDoublebyName("amt_value", i);
                reqCommand.par_value_ratio = packer.GetDoublebyName("par_value_ratio", i);
                reqCommand.par_value_value = packer.GetDoublebyName("par_value_value", i);
                reqCommand.max_fee = packer.GetDoublebyName("max_fee", i);
                reqCommand.min_fee = packer.GetDoublebyName("min_fee", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncpubL_23_34Models.Add(reqCommand);
            }
            return FuncpubL_23_34Models;
        }
 
        //逻辑_公共_证券费用客户端_查询证券代码费用模板明细
        public static List<FuncpubL_23_34Model> GetFuncpubL_23_34Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_23_34Models = new List<FuncpubL_23_34Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_23_34Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.fee_tmplat_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.fee_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_NO_INT);
                    reqCommand.secu_fee_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SECU_FEE_TYPE_INT);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.amt_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_RATIO_FLOAT);
                    reqCommand.amt_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_VALUE_FLOAT);
                    reqCommand.par_value_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_RATIO_FLOAT);
                    reqCommand.par_value_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_VALUE_FLOAT);
                    reqCommand.max_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_FEE_FLOAT);
                    reqCommand.min_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_FEE_FLOAT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncpubL_23_34Models.Add(reqCommand);
                }
            }
            return FuncpubL_23_34Models;
        }
 
        //逻辑_公共_证券费用客户端_查询证券代码费用模板明细流水
        public static List<FuncpubL_23_35Model> GetFuncpubL_23_35Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_23_35Models = new List<FuncpubL_23_35Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_23_35Model();
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
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.fee_tmplat_no = packer.GetIntbyName("fee_tmplat_no", i);
                reqCommand.jour_occur_field = packer.GetStrbyName("jour_occur_field", i);
                reqCommand.jour_after_occur_info = packer.GetStrbyName("jour_after_occur_info", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncpubL_23_35Models.Add(reqCommand);
            }
            return FuncpubL_23_35Models;
        }
 
        //逻辑_公共_证券费用客户端_查询证券代码费用模板明细流水
        public static List<FuncpubL_23_35Model> GetFuncpubL_23_35Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_23_35Models = new List<FuncpubL_23_35Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_23_35Model();
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
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.fee_tmplat_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_INT);
                    reqCommand.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    reqCommand.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncpubL_23_35Models.Add(reqCommand);
                }
            }
            return FuncpubL_23_35Models;
        }
 
        //逻辑_公共_证券费用客户端_查询历史证券代码费用模板明细流水
        public static List<FuncpubL_23_36Model> GetFuncpubL_23_36Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_23_36Models = new List<FuncpubL_23_36Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_23_36Model();
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
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.fee_tmplat_no = packer.GetIntbyName("fee_tmplat_no", i);
                reqCommand.jour_occur_field = packer.GetStrbyName("jour_occur_field", i);
                reqCommand.jour_after_occur_info = packer.GetStrbyName("jour_after_occur_info", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncpubL_23_36Models.Add(reqCommand);
            }
            return FuncpubL_23_36Models;
        }
 
        //逻辑_公共_证券费用客户端_查询历史证券代码费用模板明细流水
        public static List<FuncpubL_23_36Model> GetFuncpubL_23_36Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_23_36Models = new List<FuncpubL_23_36Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_23_36Model();
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
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.fee_tmplat_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_INT);
                    reqCommand.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    reqCommand.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncpubL_23_36Models.Add(reqCommand);
                }
            }
            return FuncpubL_23_36Models;
        }
 
        //逻辑_公共_证券费用客户端_查询资产账户证券费用模板
        public static List<FuncpubL_23_74Model> GetFuncpubL_23_74Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_23_74Models = new List<FuncpubL_23_74Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_23_74Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.secu_code_spec_fee_tmplat_no = packer.GetIntbyName("secu_code_spec_fee_tmplat_no", i);
                reqCommand.secu_type_spec_fee_tmplat_no = packer.GetIntbyName("secu_type_spec_fee_tmplat_no", i);
                reqCommand.secu_code_fee_tmplat_no = packer.GetIntbyName("secu_code_fee_tmplat_no", i);
                reqCommand.secu_type_fee_tmplat_no = packer.GetIntbyName("secu_type_fee_tmplat_no", i);
                reqCommand.secu_code_out_fee_tmplat_no = packer.GetIntbyName("secu_code_out_fee_tmplat_no", i);
                reqCommand.secu_type_out_fee_tmplat_no = packer.GetIntbyName("secu_type_out_fee_tmplat_no", i);
 
                FuncpubL_23_74Models.Add(reqCommand);
            }
            return FuncpubL_23_74Models;
        }
 
        //逻辑_公共_证券费用客户端_查询资产账户证券费用模板
        public static List<FuncpubL_23_74Model> GetFuncpubL_23_74Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_23_74Models = new List<FuncpubL_23_74Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_23_74Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.secu_code_spec_fee_tmplat_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SECU_CODE_SPEC_FEE_TMPLAT_NO_INT);
                    reqCommand.secu_type_spec_fee_tmplat_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SECU_TYPE_SPEC_FEE_TMPLAT_NO_INT);
                    reqCommand.secu_code_fee_tmplat_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SECU_CODE_FEE_TMPLAT_NO_INT);
                    reqCommand.secu_type_fee_tmplat_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SECU_TYPE_FEE_TMPLAT_NO_INT);
                    reqCommand.secu_code_out_fee_tmplat_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SECU_CODE_OUT_FEE_TMPLAT_NO_INT);
                    reqCommand.secu_type_out_fee_tmplat_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SECU_TYPE_OUT_FEE_TMPLAT_NO_INT);
                    FuncpubL_23_74Models.Add(reqCommand);
                }
            }
            return FuncpubL_23_74Models;
        }
 
        //逻辑_公共_证券费用客户端_查询资产账户证券费用模板流水
        public static List<FuncpubL_23_75Model> GetFuncpubL_23_75Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_23_75Models = new List<FuncpubL_23_75Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_23_75Model();
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
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.jour_occur_field = packer.GetStrbyName("jour_occur_field", i);
                reqCommand.jour_after_occur_info = packer.GetStrbyName("jour_after_occur_info", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncpubL_23_75Models.Add(reqCommand);
            }
            return FuncpubL_23_75Models;
        }
 
        //逻辑_公共_证券费用客户端_查询资产账户证券费用模板流水
        public static List<FuncpubL_23_75Model> GetFuncpubL_23_75Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_23_75Models = new List<FuncpubL_23_75Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_23_75Model();
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
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    reqCommand.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncpubL_23_75Models.Add(reqCommand);
                }
            }
            return FuncpubL_23_75Models;
        }
 
        //逻辑_公共_证券费用客户端_查询历史资产账户证券费用模板流水
        public static List<FuncpubL_23_76Model> GetFuncpubL_23_76Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_23_76Models = new List<FuncpubL_23_76Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_23_76Model();
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
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.jour_occur_field = packer.GetStrbyName("jour_occur_field", i);
                reqCommand.jour_after_occur_info = packer.GetStrbyName("jour_after_occur_info", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncpubL_23_76Models.Add(reqCommand);
            }
            return FuncpubL_23_76Models;
        }
 
        //逻辑_公共_证券费用客户端_查询历史资产账户证券费用模板流水
        public static List<FuncpubL_23_76Model> GetFuncpubL_23_76Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_23_76Models = new List<FuncpubL_23_76Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_23_76Model();
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
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    reqCommand.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncpubL_23_76Models.Add(reqCommand);
                }
            }
            return FuncpubL_23_76Models;
        }
 
        //逻辑_公共_证券费用客户端_查询系统证券类型费用
        public static List<FuncpubL_23_104Model> GetFuncpubL_23_104Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_23_104Models = new List<FuncpubL_23_104Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_23_104Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.fee_no = packer.GetIntbyName("fee_no", i);
                reqCommand.secu_fee_type = packer.GetIntbyName("secu_fee_type", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.amt_ratio = packer.GetDoublebyName("amt_ratio", i);
                reqCommand.amt_value = packer.GetDoublebyName("amt_value", i);
                reqCommand.par_value_ratio = packer.GetDoublebyName("par_value_ratio", i);
                reqCommand.par_value_value = packer.GetDoublebyName("par_value_value", i);
                reqCommand.max_fee = packer.GetDoublebyName("max_fee", i);
                reqCommand.min_fee = packer.GetDoublebyName("min_fee", i);
 
                FuncpubL_23_104Models.Add(reqCommand);
            }
            return FuncpubL_23_104Models;
        }
 
        //逻辑_公共_证券费用客户端_查询系统证券类型费用
        public static List<FuncpubL_23_104Model> GetFuncpubL_23_104Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_23_104Models = new List<FuncpubL_23_104Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_23_104Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.fee_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_NO_INT);
                    reqCommand.secu_fee_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SECU_FEE_TYPE_INT);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.amt_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_RATIO_FLOAT);
                    reqCommand.amt_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_VALUE_FLOAT);
                    reqCommand.par_value_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_RATIO_FLOAT);
                    reqCommand.par_value_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_VALUE_FLOAT);
                    reqCommand.max_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_FEE_FLOAT);
                    reqCommand.min_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_FEE_FLOAT);
                    FuncpubL_23_104Models.Add(reqCommand);
                }
            }
            return FuncpubL_23_104Models;
        }
 
        //逻辑_公共_证券费用客户端_查询系统证券代码费用
        public static List<FuncpubL_23_114Model> GetFuncpubL_23_114Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_23_114Models = new List<FuncpubL_23_114Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_23_114Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.fee_no = packer.GetIntbyName("fee_no", i);
                reqCommand.secu_fee_type = packer.GetIntbyName("secu_fee_type", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.amt_ratio = packer.GetDoublebyName("amt_ratio", i);
                reqCommand.amt_value = packer.GetDoublebyName("amt_value", i);
                reqCommand.par_value_ratio = packer.GetDoublebyName("par_value_ratio", i);
                reqCommand.par_value_value = packer.GetDoublebyName("par_value_value", i);
                reqCommand.max_fee = packer.GetDoublebyName("max_fee", i);
                reqCommand.min_fee = packer.GetDoublebyName("min_fee", i);
 
                FuncpubL_23_114Models.Add(reqCommand);
            }
            return FuncpubL_23_114Models;
        }
 
        //逻辑_公共_证券费用客户端_查询系统证券代码费用
        public static List<FuncpubL_23_114Model> GetFuncpubL_23_114Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_23_114Models = new List<FuncpubL_23_114Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_23_114Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.fee_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_NO_INT);
                    reqCommand.secu_fee_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SECU_FEE_TYPE_INT);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.amt_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_RATIO_FLOAT);
                    reqCommand.amt_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_VALUE_FLOAT);
                    reqCommand.par_value_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_RATIO_FLOAT);
                    reqCommand.par_value_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_VALUE_FLOAT);
                    reqCommand.max_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_FEE_FLOAT);
                    reqCommand.min_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_FEE_FLOAT);
                    FuncpubL_23_114Models.Add(reqCommand);
                }
            }
            return FuncpubL_23_114Models;
        }
 
        //逻辑_公共_证券费用客户端_查询产品费用
        public static List<FuncpubL_23_164Model> GetFuncpubL_23_164Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_23_164Models = new List<FuncpubL_23_164Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_23_164Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.pd_fee_type = packer.GetIntbyName("pd_fee_type", i);
                reqCommand.pd_fee_name = packer.GetStrbyName("pd_fee_name", i);
                reqCommand.pd_fee_rate = packer.GetDoublebyName("pd_fee_rate", i);
                reqCommand.pd_fee_cacl_type = packer.GetIntbyName("pd_fee_cacl_type", i);
                reqCommand.pd_fee_cacl_base = packer.GetDoublebyName("pd_fee_cacl_base", i);
                reqCommand.min_fee = packer.GetDoublebyName("min_fee", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncpubL_23_164Models.Add(reqCommand);
            }
            return FuncpubL_23_164Models;
        }
 
        //逻辑_公共_证券费用客户端_查询产品费用
        public static List<FuncpubL_23_164Model> GetFuncpubL_23_164Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_23_164Models = new List<FuncpubL_23_164Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_23_164Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.pd_fee_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_FEE_TYPE_INT);
                    reqCommand.pd_fee_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_FEE_NAME_STR);
                    reqCommand.pd_fee_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_FEE_RATE_FLOAT);
                    reqCommand.pd_fee_cacl_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_FEE_CACL_TYPE_INT);
                    reqCommand.pd_fee_cacl_base = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_FEE_CACL_BASE_FLOAT);
                    reqCommand.min_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_FEE_FLOAT);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncpubL_23_164Models.Add(reqCommand);
                }
            }
            return FuncpubL_23_164Models;
        }
 
        //逻辑_公共_证券费用客户端_查询产品费用流水
        public static List<FuncpubL_23_165Model> GetFuncpubL_23_165Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_23_165Models = new List<FuncpubL_23_165Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_23_165Model();
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
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.pd_fee_type = packer.GetIntbyName("pd_fee_type", i);
                reqCommand.jour_occur_field = packer.GetStrbyName("jour_occur_field", i);
                reqCommand.jour_after_occur_info = packer.GetStrbyName("jour_after_occur_info", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncpubL_23_165Models.Add(reqCommand);
            }
            return FuncpubL_23_165Models;
        }
 
        //逻辑_公共_证券费用客户端_查询产品费用流水
        public static List<FuncpubL_23_165Model> GetFuncpubL_23_165Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_23_165Models = new List<FuncpubL_23_165Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_23_165Model();
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
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.pd_fee_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_FEE_TYPE_INT);
                    reqCommand.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    reqCommand.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncpubL_23_165Models.Add(reqCommand);
                }
            }
            return FuncpubL_23_165Models;
        }
 
        //逻辑_公共_证券费用客户端_查询历史产品费用流水
        public static List<FuncpubL_23_166Model> GetFuncpubL_23_166Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_23_166Models = new List<FuncpubL_23_166Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_23_166Model();
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
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.pd_fee_type = packer.GetIntbyName("pd_fee_type", i);
                reqCommand.jour_occur_field = packer.GetStrbyName("jour_occur_field", i);
                reqCommand.jour_after_occur_info = packer.GetStrbyName("jour_after_occur_info", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncpubL_23_166Models.Add(reqCommand);
            }
            return FuncpubL_23_166Models;
        }
 
        //逻辑_公共_证券费用客户端_查询历史产品费用流水
        public static List<FuncpubL_23_166Model> GetFuncpubL_23_166Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_23_166Models = new List<FuncpubL_23_166Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_23_166Model();
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
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.pd_fee_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_FEE_TYPE_INT);
                    reqCommand.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    reqCommand.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncpubL_23_166Models.Add(reqCommand);
                }
            }
            return FuncpubL_23_166Models;
        }
 
        //逻辑_公共_证券费用客户端_计算证券费用
        public static List<FuncpubL_23_201Model> GetFuncpubL_23_201Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_23_201Models = new List<FuncpubL_23_201Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_23_201Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.stamp_tax = packer.GetDoublebyName("stamp_tax", i);
                reqCommand.trans_fee = packer.GetDoublebyName("trans_fee", i);
                reqCommand.brkage_fee = packer.GetDoublebyName("brkage_fee", i);
                reqCommand.SEC_charges = packer.GetDoublebyName("SEC_charges", i);
                reqCommand.other_fee = packer.GetDoublebyName("other_fee", i);
                reqCommand.trade_commis = packer.GetDoublebyName("trade_commis", i);
                reqCommand.other_commis = packer.GetDoublebyName("other_commis", i);
 
                FuncpubL_23_201Models.Add(reqCommand);
            }
            return FuncpubL_23_201Models;
        }
 
        //逻辑_公共_证券费用客户端_计算证券费用
        public static List<FuncpubL_23_201Model> GetFuncpubL_23_201Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_23_201Models = new List<FuncpubL_23_201Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncpubL_23_201Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.stamp_tax = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STAMP_TAX_FLOAT);
                reqCommand.trans_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_FEE_FLOAT);
                reqCommand.brkage_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BRKAGE_FEE_FLOAT);
                reqCommand.SEC_charges = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SEC_CHARGES_FLOAT);
                reqCommand.other_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_FEE_FLOAT);
                reqCommand.trade_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_COMMIS_FLOAT);
                reqCommand.other_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_COMMIS_FLOAT);
                FuncpubL_23_201Models.Add(reqCommand);
            }
            return FuncpubL_23_201Models;
        }
 
        //逻辑_公共_证券费用客户端_查询费用编号
        public static List<FuncpubL_23_302Model> GetFuncpubL_23_302Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_23_302Models = new List<FuncpubL_23_302Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_23_302Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.fee_no = packer.GetIntbyName("fee_no", i);
                reqCommand.secu_fee_type = packer.GetIntbyName("secu_fee_type", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.contrc_dir = packer.GetIntbyName("contrc_dir", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncpubL_23_302Models.Add(reqCommand);
            }
            return FuncpubL_23_302Models;
        }
 
        //逻辑_公共_证券费用客户端_查询费用编号
        public static List<FuncpubL_23_302Model> GetFuncpubL_23_302Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_23_302Models = new List<FuncpubL_23_302Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_23_302Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.fee_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_NO_INT);
                    reqCommand.secu_fee_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SECU_FEE_TYPE_INT);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.contrc_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_DIR_INT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncpubL_23_302Models.Add(reqCommand);
                }
            }
            return FuncpubL_23_302Models;
        }
 
    }
}
