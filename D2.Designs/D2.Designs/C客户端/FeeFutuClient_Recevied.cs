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

    public static class FeeFutuClient
    {
        //逻辑_公共_期货费用客户端_新增期货费用模板
        public static List<FuncpubL_18_41Model> GetFuncpubL_18_41Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_18_41Models = new List<FuncpubL_18_41Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_18_41Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.fee_tmplat_no = packer.GetIntbyName("fee_tmplat_no", i);
 
                FuncpubL_18_41Models.Add(reqCommand);
            }
            return FuncpubL_18_41Models;
        }
 
        //逻辑_公共_期货费用客户端_新增期货费用模板
        public static List<FuncpubL_18_41Model> GetFuncpubL_18_41Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_18_41Models = new List<FuncpubL_18_41Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncpubL_18_41Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.fee_tmplat_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_INT);
                FuncpubL_18_41Models.Add(reqCommand);
            }
            return FuncpubL_18_41Models;
        }
 
        //逻辑_公共_期货费用客户端_查询期货费用模板
        public static List<FuncpubL_18_44Model> GetFuncpubL_18_44Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_18_44Models = new List<FuncpubL_18_44Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_18_44Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.fee_tmplat_no = packer.GetIntbyName("fee_tmplat_no", i);
                reqCommand.fee_tmplat_name = packer.GetStrbyName("fee_tmplat_name", i);
                reqCommand.fee_tmplat_kind = packer.GetIntbyName("fee_tmplat_kind", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncpubL_18_44Models.Add(reqCommand);
            }
            return FuncpubL_18_44Models;
        }
 
        //逻辑_公共_期货费用客户端_查询期货费用模板
        public static List<FuncpubL_18_44Model> GetFuncpubL_18_44Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_18_44Models = new List<FuncpubL_18_44Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_18_44Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.fee_tmplat_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_INT);
                    reqCommand.fee_tmplat_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NAME_STR);
                    reqCommand.fee_tmplat_kind = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_KIND_INT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncpubL_18_44Models.Add(reqCommand);
                }
            }
            return FuncpubL_18_44Models;
        }
 
        //逻辑_公共_期货费用客户端_查询期货费用模板流水
        public static List<FuncpubL_18_45Model> GetFuncpubL_18_45Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_18_45Models = new List<FuncpubL_18_45Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_18_45Model();
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
 
                FuncpubL_18_45Models.Add(reqCommand);
            }
            return FuncpubL_18_45Models;
        }
 
        //逻辑_公共_期货费用客户端_查询期货费用模板流水
        public static List<FuncpubL_18_45Model> GetFuncpubL_18_45Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_18_45Models = new List<FuncpubL_18_45Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_18_45Model();
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
                    FuncpubL_18_45Models.Add(reqCommand);
                }
            }
            return FuncpubL_18_45Models;
        }
 
        //逻辑_公共_期货费用客户端_查询历史期货费用模板流水
        public static List<FuncpubL_18_46Model> GetFuncpubL_18_46Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_18_46Models = new List<FuncpubL_18_46Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_18_46Model();
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
 
                FuncpubL_18_46Models.Add(reqCommand);
            }
            return FuncpubL_18_46Models;
        }
 
        //逻辑_公共_期货费用客户端_查询历史期货费用模板流水
        public static List<FuncpubL_18_46Model> GetFuncpubL_18_46Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_18_46Models = new List<FuncpubL_18_46Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_18_46Model();
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
                    FuncpubL_18_46Models.Add(reqCommand);
                }
            }
            return FuncpubL_18_46Models;
        }
 
        //逻辑_公共_期货费用客户端_查询合约类型费用模板明细
        public static List<FuncpubL_18_54Model> GetFuncpubL_18_54Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_18_54Models = new List<FuncpubL_18_54Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_18_54Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.fee_tmplat_no = packer.GetIntbyName("fee_tmplat_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.contrc_type = packer.GetIntbyName("contrc_type", i);
                reqCommand.fee_no = packer.GetIntbyName("fee_no", i);
                reqCommand.futu_fee_type = packer.GetIntbyName("futu_fee_type", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.contrc_dir = packer.GetIntbyName("contrc_dir", i);
                reqCommand.amt_ratio = packer.GetDoublebyName("amt_ratio", i);
                reqCommand.amt_value = packer.GetDoublebyName("amt_value", i);
                reqCommand.par_value_ratio = packer.GetDoublebyName("par_value_ratio", i);
                reqCommand.par_value_value = packer.GetDoublebyName("par_value_value", i);
                reqCommand.max_fee = packer.GetDoublebyName("max_fee", i);
                reqCommand.min_fee = packer.GetDoublebyName("min_fee", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
                reqCommand.hedge_type = packer.GetIntbyName("hedge_type", i);
 
                FuncpubL_18_54Models.Add(reqCommand);
            }
            return FuncpubL_18_54Models;
        }
 
        //逻辑_公共_期货费用客户端_查询合约类型费用模板明细
        public static List<FuncpubL_18_54Model> GetFuncpubL_18_54Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_18_54Models = new List<FuncpubL_18_54Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_18_54Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.fee_tmplat_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    reqCommand.fee_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_NO_INT);
                    reqCommand.futu_fee_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_FEE_TYPE_INT);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.contrc_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_DIR_INT);
                    reqCommand.amt_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_RATIO_FLOAT);
                    reqCommand.amt_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_VALUE_FLOAT);
                    reqCommand.par_value_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_RATIO_FLOAT);
                    reqCommand.par_value_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_VALUE_FLOAT);
                    reqCommand.max_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_FEE_FLOAT);
                    reqCommand.min_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_FEE_FLOAT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    reqCommand.hedge_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT);
                    FuncpubL_18_54Models.Add(reqCommand);
                }
            }
            return FuncpubL_18_54Models;
        }
 
        //逻辑_公共_期货费用客户端_查询合约类型费用模板明细流水
        public static List<FuncpubL_18_55Model> GetFuncpubL_18_55Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_18_55Models = new List<FuncpubL_18_55Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_18_55Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.opor_co_no = packer.GetIntbyName("opor_co_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.oper_mac = packer.GetStrbyName("oper_mac", i);
                reqCommand.oper_ip_addr = packer.GetStrbyName("oper_ip_addr", i);
                reqCommand.oper_info = packer.GetStrbyName("oper_info", i);
                reqCommand.oper_way = packer.GetStrbyName("oper_way", i);
                reqCommand.oper_func_code = packer.GetStrbyName("oper_func_code", i);
                reqCommand.oper_menu_no = packer.GetIntbyName("oper_menu_no", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.contrc_type = packer.GetIntbyName("contrc_type", i);
                reqCommand.fee_tmplat_no = packer.GetIntbyName("fee_tmplat_no", i);
                reqCommand.jour_occur_field = packer.GetStrbyName("jour_occur_field", i);
                reqCommand.jour_after_occur_info = packer.GetStrbyName("jour_after_occur_info", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncpubL_18_55Models.Add(reqCommand);
            }
            return FuncpubL_18_55Models;
        }
 
        //逻辑_公共_期货费用客户端_查询合约类型费用模板明细流水
        public static List<FuncpubL_18_55Model> GetFuncpubL_18_55Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_18_55Models = new List<FuncpubL_18_55Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_18_55Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    reqCommand.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    reqCommand.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    reqCommand.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    reqCommand.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    reqCommand.oper_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MENU_NO_INT);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    reqCommand.fee_tmplat_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_INT);
                    reqCommand.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    reqCommand.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncpubL_18_55Models.Add(reqCommand);
                }
            }
            return FuncpubL_18_55Models;
        }
 
        //逻辑_公共_期货费用客户端_查询历史合约类型费用模板明细流水
        public static List<FuncpubL_18_56Model> GetFuncpubL_18_56Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_18_56Models = new List<FuncpubL_18_56Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_18_56Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.opor_co_no = packer.GetIntbyName("opor_co_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.oper_mac = packer.GetStrbyName("oper_mac", i);
                reqCommand.oper_ip_addr = packer.GetStrbyName("oper_ip_addr", i);
                reqCommand.oper_info = packer.GetStrbyName("oper_info", i);
                reqCommand.oper_way = packer.GetStrbyName("oper_way", i);
                reqCommand.oper_func_code = packer.GetStrbyName("oper_func_code", i);
                reqCommand.oper_menu_no = packer.GetIntbyName("oper_menu_no", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.contrc_type = packer.GetIntbyName("contrc_type", i);
                reqCommand.fee_tmplat_no = packer.GetIntbyName("fee_tmplat_no", i);
                reqCommand.jour_occur_field = packer.GetStrbyName("jour_occur_field", i);
                reqCommand.jour_after_occur_info = packer.GetStrbyName("jour_after_occur_info", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncpubL_18_56Models.Add(reqCommand);
            }
            return FuncpubL_18_56Models;
        }
 
        //逻辑_公共_期货费用客户端_查询历史合约类型费用模板明细流水
        public static List<FuncpubL_18_56Model> GetFuncpubL_18_56Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_18_56Models = new List<FuncpubL_18_56Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_18_56Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    reqCommand.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    reqCommand.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    reqCommand.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    reqCommand.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    reqCommand.oper_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MENU_NO_INT);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    reqCommand.fee_tmplat_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_INT);
                    reqCommand.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    reqCommand.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncpubL_18_56Models.Add(reqCommand);
                }
            }
            return FuncpubL_18_56Models;
        }
 
        //逻辑_公共_期货费用客户端_查询合约代码费用模板明细
        public static List<FuncpubL_18_64Model> GetFuncpubL_18_64Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_18_64Models = new List<FuncpubL_18_64Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_18_64Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.fee_tmplat_no = packer.GetIntbyName("fee_tmplat_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.contrc_code_no = packer.GetIntbyName("contrc_code_no", i);
                reqCommand.fee_no = packer.GetIntbyName("fee_no", i);
                reqCommand.futu_fee_type = packer.GetIntbyName("futu_fee_type", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.contrc_dir = packer.GetIntbyName("contrc_dir", i);
                reqCommand.amt_ratio = packer.GetDoublebyName("amt_ratio", i);
                reqCommand.amt_value = packer.GetDoublebyName("amt_value", i);
                reqCommand.par_value_ratio = packer.GetDoublebyName("par_value_ratio", i);
                reqCommand.par_value_value = packer.GetDoublebyName("par_value_value", i);
                reqCommand.max_fee = packer.GetDoublebyName("max_fee", i);
                reqCommand.min_fee = packer.GetDoublebyName("min_fee", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
                reqCommand.hedge_type = packer.GetIntbyName("hedge_type", i);
 
                FuncpubL_18_64Models.Add(reqCommand);
            }
            return FuncpubL_18_64Models;
        }
 
        //逻辑_公共_期货费用客户端_查询合约代码费用模板明细
        public static List<FuncpubL_18_64Model> GetFuncpubL_18_64Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_18_64Models = new List<FuncpubL_18_64Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_18_64Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.fee_tmplat_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    reqCommand.fee_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_NO_INT);
                    reqCommand.futu_fee_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_FEE_TYPE_INT);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.contrc_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_DIR_INT);
                    reqCommand.amt_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_RATIO_FLOAT);
                    reqCommand.amt_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_VALUE_FLOAT);
                    reqCommand.par_value_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_RATIO_FLOAT);
                    reqCommand.par_value_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_VALUE_FLOAT);
                    reqCommand.max_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_FEE_FLOAT);
                    reqCommand.min_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_FEE_FLOAT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    reqCommand.hedge_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT);
                    FuncpubL_18_64Models.Add(reqCommand);
                }
            }
            return FuncpubL_18_64Models;
        }
 
        //逻辑_公共_期货费用客户端_查询合约代码费用模板明细流水
        public static List<FuncpubL_18_65Model> GetFuncpubL_18_65Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_18_65Models = new List<FuncpubL_18_65Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_18_65Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.opor_co_no = packer.GetIntbyName("opor_co_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.oper_mac = packer.GetStrbyName("oper_mac", i);
                reqCommand.oper_ip_addr = packer.GetStrbyName("oper_ip_addr", i);
                reqCommand.oper_info = packer.GetStrbyName("oper_info", i);
                reqCommand.oper_way = packer.GetStrbyName("oper_way", i);
                reqCommand.oper_func_code = packer.GetStrbyName("oper_func_code", i);
                reqCommand.oper_menu_no = packer.GetIntbyName("oper_menu_no", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.contrc_code_no = packer.GetIntbyName("contrc_code_no", i);
                reqCommand.fee_tmplat_no = packer.GetIntbyName("fee_tmplat_no", i);
                reqCommand.jour_occur_field = packer.GetStrbyName("jour_occur_field", i);
                reqCommand.jour_after_occur_info = packer.GetStrbyName("jour_after_occur_info", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncpubL_18_65Models.Add(reqCommand);
            }
            return FuncpubL_18_65Models;
        }
 
        //逻辑_公共_期货费用客户端_查询合约代码费用模板明细流水
        public static List<FuncpubL_18_65Model> GetFuncpubL_18_65Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_18_65Models = new List<FuncpubL_18_65Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_18_65Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    reqCommand.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    reqCommand.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    reqCommand.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    reqCommand.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    reqCommand.oper_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MENU_NO_INT);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    reqCommand.fee_tmplat_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_INT);
                    reqCommand.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    reqCommand.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncpubL_18_65Models.Add(reqCommand);
                }
            }
            return FuncpubL_18_65Models;
        }
 
        //逻辑_公共_期货费用客户端_查询历史合约代码费用模板明细流水
        public static List<FuncpubL_18_66Model> GetFuncpubL_18_66Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_18_66Models = new List<FuncpubL_18_66Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_18_66Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.opor_co_no = packer.GetIntbyName("opor_co_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.oper_mac = packer.GetStrbyName("oper_mac", i);
                reqCommand.oper_ip_addr = packer.GetStrbyName("oper_ip_addr", i);
                reqCommand.oper_info = packer.GetStrbyName("oper_info", i);
                reqCommand.oper_way = packer.GetStrbyName("oper_way", i);
                reqCommand.oper_func_code = packer.GetStrbyName("oper_func_code", i);
                reqCommand.oper_menu_no = packer.GetIntbyName("oper_menu_no", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.contrc_code_no = packer.GetIntbyName("contrc_code_no", i);
                reqCommand.fee_tmplat_no = packer.GetIntbyName("fee_tmplat_no", i);
                reqCommand.jour_occur_field = packer.GetStrbyName("jour_occur_field", i);
                reqCommand.jour_after_occur_info = packer.GetStrbyName("jour_after_occur_info", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncpubL_18_66Models.Add(reqCommand);
            }
            return FuncpubL_18_66Models;
        }
 
        //逻辑_公共_期货费用客户端_查询历史合约代码费用模板明细流水
        public static List<FuncpubL_18_66Model> GetFuncpubL_18_66Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_18_66Models = new List<FuncpubL_18_66Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_18_66Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    reqCommand.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    reqCommand.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    reqCommand.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    reqCommand.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    reqCommand.oper_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MENU_NO_INT);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    reqCommand.fee_tmplat_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_INT);
                    reqCommand.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    reqCommand.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncpubL_18_66Models.Add(reqCommand);
                }
            }
            return FuncpubL_18_66Models;
        }
 
        //逻辑_公共_期货费用客户端_查询资产账户期货费用模板
        public static List<FuncpubL_18_74Model> GetFuncpubL_18_74Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_18_74Models = new List<FuncpubL_18_74Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_18_74Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.futu_code_spec_fee_tmplat_no = packer.GetIntbyName("futu_code_spec_fee_tmplat_no", i);
                reqCommand.futu_type_spec_fee_tmplat_no = packer.GetIntbyName("futu_type_spec_fee_tmplat_no", i);
                reqCommand.futu_code_fee_tmplat_no = packer.GetIntbyName("futu_code_fee_tmplat_no", i);
                reqCommand.futu_type_fee_tmplat_no = packer.GetIntbyName("futu_type_fee_tmplat_no", i);
                reqCommand.futu_code_out_fee_tmplat_no = packer.GetIntbyName("futu_code_out_fee_tmplat_no", i);
                reqCommand.futu_type_out_fee_tmplat_no = packer.GetIntbyName("futu_type_out_fee_tmplat_no", i);
 
                FuncpubL_18_74Models.Add(reqCommand);
            }
            return FuncpubL_18_74Models;
        }
 
        //逻辑_公共_期货费用客户端_查询资产账户期货费用模板
        public static List<FuncpubL_18_74Model> GetFuncpubL_18_74Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_18_74Models = new List<FuncpubL_18_74Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_18_74Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.futu_code_spec_fee_tmplat_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_CODE_SPEC_FEE_TMPLAT_NO_INT);
                    reqCommand.futu_type_spec_fee_tmplat_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_TYPE_SPEC_FEE_TMPLAT_NO_INT);
                    reqCommand.futu_code_fee_tmplat_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_CODE_FEE_TMPLAT_NO_INT);
                    reqCommand.futu_type_fee_tmplat_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_TYPE_FEE_TMPLAT_NO_INT);
                    reqCommand.futu_code_out_fee_tmplat_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_CODE_OUT_FEE_TMPLAT_NO_INT);
                    reqCommand.futu_type_out_fee_tmplat_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_TYPE_OUT_FEE_TMPLAT_NO_INT);
                    FuncpubL_18_74Models.Add(reqCommand);
                }
            }
            return FuncpubL_18_74Models;
        }
 
        //逻辑_公共_期货费用客户端_查询资产账户期货费用模板流水
        public static List<FuncpubL_18_75Model> GetFuncpubL_18_75Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_18_75Models = new List<FuncpubL_18_75Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_18_75Model();
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
 
                FuncpubL_18_75Models.Add(reqCommand);
            }
            return FuncpubL_18_75Models;
        }
 
        //逻辑_公共_期货费用客户端_查询资产账户期货费用模板流水
        public static List<FuncpubL_18_75Model> GetFuncpubL_18_75Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_18_75Models = new List<FuncpubL_18_75Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_18_75Model();
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
                    FuncpubL_18_75Models.Add(reqCommand);
                }
            }
            return FuncpubL_18_75Models;
        }
 
        //逻辑_公共_期货费用客户端_查询历史资产账户期货费用模板流水
        public static List<FuncpubL_18_76Model> GetFuncpubL_18_76Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_18_76Models = new List<FuncpubL_18_76Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_18_76Model();
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
 
                FuncpubL_18_76Models.Add(reqCommand);
            }
            return FuncpubL_18_76Models;
        }
 
        //逻辑_公共_期货费用客户端_查询历史资产账户期货费用模板流水
        public static List<FuncpubL_18_76Model> GetFuncpubL_18_76Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_18_76Models = new List<FuncpubL_18_76Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_18_76Model();
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
                    FuncpubL_18_76Models.Add(reqCommand);
                }
            }
            return FuncpubL_18_76Models;
        }
 
        //逻辑_公共_期货费用客户端_查询系统合约类型费用
        public static List<FuncpubL_18_144Model> GetFuncpubL_18_144Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_18_144Models = new List<FuncpubL_18_144Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_18_144Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.contrc_type = packer.GetIntbyName("contrc_type", i);
                reqCommand.fee_no = packer.GetIntbyName("fee_no", i);
                reqCommand.futu_fee_type = packer.GetIntbyName("futu_fee_type", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.contrc_dir = packer.GetIntbyName("contrc_dir", i);
                reqCommand.amt_ratio = packer.GetDoublebyName("amt_ratio", i);
                reqCommand.amt_value = packer.GetDoublebyName("amt_value", i);
                reqCommand.par_value_ratio = packer.GetDoublebyName("par_value_ratio", i);
                reqCommand.par_value_value = packer.GetDoublebyName("par_value_value", i);
                reqCommand.max_fee = packer.GetDoublebyName("max_fee", i);
                reqCommand.min_fee = packer.GetDoublebyName("min_fee", i);
 
                FuncpubL_18_144Models.Add(reqCommand);
            }
            return FuncpubL_18_144Models;
        }
 
        //逻辑_公共_期货费用客户端_查询系统合约类型费用
        public static List<FuncpubL_18_144Model> GetFuncpubL_18_144Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_18_144Models = new List<FuncpubL_18_144Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_18_144Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    reqCommand.fee_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_NO_INT);
                    reqCommand.futu_fee_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_FEE_TYPE_INT);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.contrc_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_DIR_INT);
                    reqCommand.amt_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_RATIO_FLOAT);
                    reqCommand.amt_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_VALUE_FLOAT);
                    reqCommand.par_value_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_RATIO_FLOAT);
                    reqCommand.par_value_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_VALUE_FLOAT);
                    reqCommand.max_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_FEE_FLOAT);
                    reqCommand.min_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_FEE_FLOAT);
                    FuncpubL_18_144Models.Add(reqCommand);
                }
            }
            return FuncpubL_18_144Models;
        }
 
        //逻辑_公共_期货费用客户端_查询系统合约代码费用
        public static List<FuncpubL_18_154Model> GetFuncpubL_18_154Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_18_154Models = new List<FuncpubL_18_154Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_18_154Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.contrc_code_no = packer.GetIntbyName("contrc_code_no", i);
                reqCommand.fee_no = packer.GetIntbyName("fee_no", i);
                reqCommand.futu_fee_type = packer.GetIntbyName("futu_fee_type", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.contrc_dir = packer.GetIntbyName("contrc_dir", i);
                reqCommand.amt_ratio = packer.GetDoublebyName("amt_ratio", i);
                reqCommand.amt_value = packer.GetDoublebyName("amt_value", i);
                reqCommand.par_value_ratio = packer.GetDoublebyName("par_value_ratio", i);
                reqCommand.par_value_value = packer.GetDoublebyName("par_value_value", i);
                reqCommand.max_fee = packer.GetDoublebyName("max_fee", i);
                reqCommand.min_fee = packer.GetDoublebyName("min_fee", i);
 
                FuncpubL_18_154Models.Add(reqCommand);
            }
            return FuncpubL_18_154Models;
        }
 
        //逻辑_公共_期货费用客户端_查询系统合约代码费用
        public static List<FuncpubL_18_154Model> GetFuncpubL_18_154Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_18_154Models = new List<FuncpubL_18_154Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_18_154Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    reqCommand.fee_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_NO_INT);
                    reqCommand.futu_fee_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_FEE_TYPE_INT);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.contrc_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_DIR_INT);
                    reqCommand.amt_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_RATIO_FLOAT);
                    reqCommand.amt_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_VALUE_FLOAT);
                    reqCommand.par_value_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_RATIO_FLOAT);
                    reqCommand.par_value_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_VALUE_FLOAT);
                    reqCommand.max_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_FEE_FLOAT);
                    reqCommand.min_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_FEE_FLOAT);
                    FuncpubL_18_154Models.Add(reqCommand);
                }
            }
            return FuncpubL_18_154Models;
        }
 
        //逻辑_公共_期货费用客户端_计算期货费用
        public static List<FuncpubL_18_203Model> GetFuncpubL_18_203Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_18_203Models = new List<FuncpubL_18_203Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_18_203Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.rece_margin = packer.GetDoublebyName("rece_margin", i);
                reqCommand.trade_commis = packer.GetDoublebyName("trade_commis", i);
                reqCommand.report_fee = packer.GetDoublebyName("report_fee", i);
                reqCommand.wtdraw_fee = packer.GetDoublebyName("wtdraw_fee", i);
                reqCommand.deli_fee = packer.GetDoublebyName("deli_fee", i);
                reqCommand.other_fee = packer.GetDoublebyName("other_fee", i);
                reqCommand.other_commis = packer.GetDoublebyName("other_commis", i);
 
                FuncpubL_18_203Models.Add(reqCommand);
            }
            return FuncpubL_18_203Models;
        }
 
        //逻辑_公共_期货费用客户端_计算期货费用
        public static List<FuncpubL_18_203Model> GetFuncpubL_18_203Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_18_203Models = new List<FuncpubL_18_203Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncpubL_18_203Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.rece_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RECE_MARGIN_FLOAT);
                reqCommand.trade_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_COMMIS_FLOAT);
                reqCommand.report_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_FEE_FLOAT);
                reqCommand.wtdraw_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_FEE_FLOAT);
                reqCommand.deli_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DELI_FEE_FLOAT);
                reqCommand.other_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_FEE_FLOAT);
                reqCommand.other_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_COMMIS_FLOAT);
                FuncpubL_18_203Models.Add(reqCommand);
            }
            return FuncpubL_18_203Models;
        }
 
        //逻辑_公共_期货费用客户端_查询费用编号
        public static List<FuncpubL_18_302Model> GetFuncpubL_18_302Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_18_302Models = new List<FuncpubL_18_302Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_18_302Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.fee_no = packer.GetIntbyName("fee_no", i);
                reqCommand.futu_fee_type = packer.GetIntbyName("futu_fee_type", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.contrc_dir = packer.GetIntbyName("contrc_dir", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncpubL_18_302Models.Add(reqCommand);
            }
            return FuncpubL_18_302Models;
        }
 
        //逻辑_公共_期货费用客户端_查询费用编号
        public static List<FuncpubL_18_302Model> GetFuncpubL_18_302Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_18_302Models = new List<FuncpubL_18_302Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_18_302Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.fee_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_NO_INT);
                    reqCommand.futu_fee_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_FEE_TYPE_INT);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.contrc_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_DIR_INT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncpubL_18_302Models.Add(reqCommand);
                }
            }
            return FuncpubL_18_302Models;
        }
 
        //逻辑_公共_期货费用客户端_获取期货保证金参数
        public static List<FuncpubL_18_303Model> GetFuncpubL_18_303Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_18_303Models = new List<FuncpubL_18_303Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_18_303Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.margin_ratio = packer.GetDoublebyName("margin_ratio", i);
 
                FuncpubL_18_303Models.Add(reqCommand);
            }
            return FuncpubL_18_303Models;
        }
 
        //逻辑_公共_期货费用客户端_获取期货保证金参数
        public static List<FuncpubL_18_303Model> GetFuncpubL_18_303Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_18_303Models = new List<FuncpubL_18_303Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncpubL_18_303Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.margin_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARGIN_RATIO_FLOAT);
                FuncpubL_18_303Models.Add(reqCommand);
            }
            return FuncpubL_18_303Models;
        }
 
        //逻辑_公共_期货费用客户端_复制期货费用模板
        public static List<FuncpubL_18_78Model> GetFuncpubL_18_78Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_18_78Models = new List<FuncpubL_18_78Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_18_78Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.fee_tmplat_no = packer.GetIntbyName("fee_tmplat_no", i);
 
                FuncpubL_18_78Models.Add(reqCommand);
            }
            return FuncpubL_18_78Models;
        }
 
        //逻辑_公共_期货费用客户端_复制期货费用模板
        public static List<FuncpubL_18_78Model> GetFuncpubL_18_78Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_18_78Models = new List<FuncpubL_18_78Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncpubL_18_78Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.fee_tmplat_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_INT);
                FuncpubL_18_78Models.Add(reqCommand);
            }
            return FuncpubL_18_78Models;
        }
 
    }
}
