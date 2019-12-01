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

    public static class BaseClient
    {
        //逻辑_公共_基础客户端_获取机器日期时间
        public static List<FuncpubL_17_8Model> GetFuncpubL_17_8Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_17_8Models = new List<FuncpubL_17_8Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_17_8Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.mach_date = packer.GetIntbyName("mach_date", i);
                reqCommand.mach_time = packer.GetIntbyName("mach_time", i);
 
                FuncpubL_17_8Models.Add(reqCommand);
            }
            return FuncpubL_17_8Models;
        }
 
        //逻辑_公共_基础客户端_获取机器日期时间
        public static List<FuncpubL_17_8Model> GetFuncpubL_17_8Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_17_8Models = new List<FuncpubL_17_8Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncpubL_17_8Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.mach_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MACH_DATE_INT);
                reqCommand.mach_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MACH_TIME_INT);
                FuncpubL_17_8Models.Add(reqCommand);
            }
            return FuncpubL_17_8Models;
        }
 
        //逻辑_公共_基础客户端_查询机构信息
        public static List<FuncpubL_17_18Model> GetFuncpubL_17_18Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_17_18Models = new List<FuncpubL_17_18Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_17_18Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.co_name = packer.GetStrbyName("co_name", i);
                reqCommand.co_type = packer.GetIntbyName("co_type", i);
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.conta_addr = packer.GetStrbyName("conta_addr", i);
                reqCommand.conta_name = packer.GetStrbyName("conta_name", i);
                reqCommand.phone_number = packer.GetStrbyName("phone_number", i);
                reqCommand.pd_qty_max = packer.GetIntbyName("pd_qty_max", i);
                reqCommand.max_acco_count = packer.GetIntbyName("max_acco_count", i);
                reqCommand.opor_qty_max = packer.GetIntbyName("opor_qty_max", i);
                reqCommand.co_status = packer.GetStrbyName("co_status", i);
                reqCommand.allow_exch = packer.GetStrbyName("allow_exch", i);
                reqCommand.allow_stock_type = packer.GetStrbyName("allow_stock_type", i);
                reqCommand.busi_config_str = packer.GetStrbyName("busi_config_str", i);
                reqCommand.comm_appr_oper = packer.GetIntbyName("comm_appr_oper", i);
                reqCommand.market_price_ratio = packer.GetDoublebyName("market_price_ratio", i);
                reqCommand.mul_acco_trd_assign_set = packer.GetStrbyName("mul_acco_trd_assign_set", i);
                reqCommand.mul_acco_trd_choice = packer.GetIntbyName("mul_acco_trd_choice", i);
                reqCommand.mul_acco_trd_qty_set = packer.GetStrbyName("mul_acco_trd_qty_set", i);
                reqCommand.genus_algo_strategy_set = packer.GetStrbyName("genus_algo_strategy_set", i);
                reqCommand.base_crncy_type = packer.GetStrbyName("base_crncy_type", i);
 
                FuncpubL_17_18Models.Add(reqCommand);
            }
            return FuncpubL_17_18Models;
        }
 
        //逻辑_公共_基础客户端_查询机构信息
        public static List<FuncpubL_17_18Model> GetFuncpubL_17_18Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_17_18Models = new List<FuncpubL_17_18Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_17_18Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.co_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CO_NAME_STR);
                    reqCommand.co_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_TYPE_INT);
                    reqCommand.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    reqCommand.conta_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTA_ADDR_STR);
                    reqCommand.conta_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTA_NAME_STR);
                    reqCommand.phone_number = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PHONE_NUMBER_STR);
                    reqCommand.pd_qty_max = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_QTY_MAX_INT);
                    reqCommand.max_acco_count = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MAX_ACCO_COUNT_INT);
                    reqCommand.opor_qty_max = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_QTY_MAX_INT);
                    reqCommand.co_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CO_STATUS_STR);
                    reqCommand.allow_exch = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_EXCH_STR);
                    reqCommand.allow_stock_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_STOCK_TYPE_STR);
                    reqCommand.busi_config_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_CONFIG_STR_STR);
                    reqCommand.comm_appr_oper = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_OPER_INT);
                    reqCommand.market_price_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_PRICE_RATIO_FLOAT);
                    reqCommand.mul_acco_trd_assign_set = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MUL_ACCO_TRD_ASSIGN_SET_STR);
                    reqCommand.mul_acco_trd_choice = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MUL_ACCO_TRD_CHOICE_INT);
                    reqCommand.mul_acco_trd_qty_set = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MUL_ACCO_TRD_QTY_SET_STR);
                    reqCommand.genus_algo_strategy_set = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_GENUS_ALGO_STRATEGY_SET_STR);
                    reqCommand.base_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BASE_CRNCY_TYPE_STR);
                    FuncpubL_17_18Models.Add(reqCommand);
                }
            }
            return FuncpubL_17_18Models;
        }
 
        //逻辑_公共_基础客户端_查询系统配置
        public static List<FuncpubL_17_32Model> GetFuncpubL_17_32Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_17_32Models = new List<FuncpubL_17_32Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_17_32Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.config_no = packer.GetInt64byName("config_no", i);
                reqCommand.config_name = packer.GetStrbyName("config_name", i);
                reqCommand.config_choice_type = packer.GetIntbyName("config_choice_type", i);
                reqCommand.config_value = packer.GetStrbyName("config_value", i);
                reqCommand.dict_field_name = packer.GetStrbyName("dict_field_name", i);
                reqCommand.config_memo = packer.GetStrbyName("config_memo", i);
 
                FuncpubL_17_32Models.Add(reqCommand);
            }
            return FuncpubL_17_32Models;
        }
 
        //逻辑_公共_基础客户端_查询系统配置
        public static List<FuncpubL_17_32Model> GetFuncpubL_17_32Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_17_32Models = new List<FuncpubL_17_32Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_17_32Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.config_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_NO_INT64);
                    reqCommand.config_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_NAME_STR);
                    reqCommand.config_choice_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_CHOICE_TYPE_INT);
                    reqCommand.config_value = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_VALUE_STR);
                    reqCommand.dict_field_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DICT_FIELD_NAME_STR);
                    reqCommand.config_memo = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_MEMO_STR);
                    FuncpubL_17_32Models.Add(reqCommand);
                }
            }
            return FuncpubL_17_32Models;
        }
 
        //逻辑_公共_基础客户端_查询机构汇率
        public static List<FuncpubL_17_38Model> GetFuncpubL_17_38Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_17_38Models = new List<FuncpubL_17_38Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_17_38Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.for_crncy_type = packer.GetStrbyName("for_crncy_type", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.buy_exch_rate = packer.GetDoublebyName("buy_exch_rate", i);
                reqCommand.sale_exch_rate = packer.GetDoublebyName("sale_exch_rate", i);
 
                FuncpubL_17_38Models.Add(reqCommand);
            }
            return FuncpubL_17_38Models;
        }
 
        //逻辑_公共_基础客户端_查询机构汇率
        public static List<FuncpubL_17_38Model> GetFuncpubL_17_38Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_17_38Models = new List<FuncpubL_17_38Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_17_38Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.for_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FOR_CRNCY_TYPE_STR);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.buy_exch_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_EXCH_RATE_FLOAT);
                    reqCommand.sale_exch_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SALE_EXCH_RATE_FLOAT);
                    FuncpubL_17_38Models.Add(reqCommand);
                }
            }
            return FuncpubL_17_38Models;
        }
 
        //逻辑_公共_基础客户端_上线通道
        public static List<FuncpubL_17_154Model> GetFuncpubL_17_154Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_17_154Models = new List<FuncpubL_17_154Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_17_154Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
 
                FuncpubL_17_154Models.Add(reqCommand);
            }
            return FuncpubL_17_154Models;
        }
 
        //逻辑_公共_基础客户端_上线通道
        public static List<FuncpubL_17_154Model> GetFuncpubL_17_154Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_17_154Models = new List<FuncpubL_17_154Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncpubL_17_154Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                FuncpubL_17_154Models.Add(reqCommand);
            }
            return FuncpubL_17_154Models;
        }
 
        //逻辑_公共_基础客户端_下线通道
        public static List<FuncpubL_17_155Model> GetFuncpubL_17_155Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_17_155Models = new List<FuncpubL_17_155Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_17_155Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
 
                FuncpubL_17_155Models.Add(reqCommand);
            }
            return FuncpubL_17_155Models;
        }
 
        //逻辑_公共_基础客户端_下线通道
        public static List<FuncpubL_17_155Model> GetFuncpubL_17_155Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_17_155Models = new List<FuncpubL_17_155Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncpubL_17_155Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                FuncpubL_17_155Models.Add(reqCommand);
            }
            return FuncpubL_17_155Models;
        }
 
        //逻辑_公共_基础客户端_获取港股通汇率信息
        public static List<FuncpubL_17_117Model> GetFuncpubL_17_117Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_17_117Models = new List<FuncpubL_17_117Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_17_117Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.sh_hk_buy_ref_rate = packer.GetDoublebyName("sh_hk_buy_ref_rate", i);
                reqCommand.sh_hk_sell_ref_rate = packer.GetDoublebyName("sh_hk_sell_ref_rate", i);
                reqCommand.sh_hk_settle_buy_rate = packer.GetDoublebyName("sh_hk_settle_buy_rate", i);
                reqCommand.sh_hk_settle_sell_rate = packer.GetDoublebyName("sh_hk_settle_sell_rate", i);
                reqCommand.sz_hk_buy_ref_rate = packer.GetDoublebyName("sz_hk_buy_ref_rate", i);
                reqCommand.sz_hk_sell_ref_rate = packer.GetDoublebyName("sz_hk_sell_ref_rate", i);
                reqCommand.sz_hk_settle_buy_rate = packer.GetDoublebyName("sz_hk_settle_buy_rate", i);
                reqCommand.sz_hksettle_sell_rate = packer.GetDoublebyName("sz_hksettle_sell_rate", i);
 
                FuncpubL_17_117Models.Add(reqCommand);
            }
            return FuncpubL_17_117Models;
        }
 
        //逻辑_公共_基础客户端_获取港股通汇率信息
        public static List<FuncpubL_17_117Model> GetFuncpubL_17_117Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_17_117Models = new List<FuncpubL_17_117Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncpubL_17_117Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.sh_hk_buy_ref_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SH_HK_BUY_REF_RATE_FLOAT);
                reqCommand.sh_hk_sell_ref_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SH_HK_SELL_REF_RATE_FLOAT);
                reqCommand.sh_hk_settle_buy_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SH_HK_SETTLE_BUY_RATE_FLOAT);
                reqCommand.sh_hk_settle_sell_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SH_HK_SETTLE_SELL_RATE_FLOAT);
                reqCommand.sz_hk_buy_ref_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SZ_HK_BUY_REF_RATE_FLOAT);
                reqCommand.sz_hk_sell_ref_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SZ_HK_SELL_REF_RATE_FLOAT);
                reqCommand.sz_hk_settle_buy_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SZ_HK_SETTLE_BUY_RATE_FLOAT);
                reqCommand.sz_hksettle_sell_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SZ_HKSETTLE_SELL_RATE_FLOAT);
                FuncpubL_17_117Models.Add(reqCommand);
            }
            return FuncpubL_17_117Models;
        }
 
        //逻辑_公共_基础客户端_更新港股通额度信息
        public static List<FuncpubL_17_118Model> GetFuncpubL_17_118Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_17_118Models = new List<FuncpubL_17_118Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_17_118Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FuncpubL_17_118Models.Add(reqCommand);
            }
            return FuncpubL_17_118Models;
        }
 
        //逻辑_公共_基础客户端_更新港股通额度信息
        public static List<FuncpubL_17_118Model> GetFuncpubL_17_118Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_17_118Models = new List<FuncpubL_17_118Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncpubL_17_118Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                FuncpubL_17_118Models.Add(reqCommand);
            }
            return FuncpubL_17_118Models;
        }
 
        //逻辑_公共_基础客户端_查询港股通额度信息
        public static List<FuncpubL_17_119Model> GetFuncpubL_17_119Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_17_119Models = new List<FuncpubL_17_119Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_17_119Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.begin_limit = packer.GetDoublebyName("begin_limit", i);
                reqCommand.remain_limit = packer.GetDoublebyName("remain_limit", i);
                reqCommand.limit_status = packer.GetIntbyName("limit_status", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FuncpubL_17_119Models.Add(reqCommand);
            }
            return FuncpubL_17_119Models;
        }
 
        //逻辑_公共_基础客户端_查询港股通额度信息
        public static List<FuncpubL_17_119Model> GetFuncpubL_17_119Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_17_119Models = new List<FuncpubL_17_119Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_17_119Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.begin_limit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_LIMIT_FLOAT);
                    reqCommand.remain_limit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REMAIN_LIMIT_FLOAT);
                    reqCommand.limit_status = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LIMIT_STATUS_INT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FuncpubL_17_119Models.Add(reqCommand);
                }
            }
            return FuncpubL_17_119Models;
        }
 
        //逻辑_公共_基础客户端_查询数据字典
        public static List<FuncpubL_17_180Model> GetFuncpubL_17_180Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_17_180Models = new List<FuncpubL_17_180Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_17_180Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.dict_no = packer.GetIntbyName("dict_no", i);
                reqCommand.dict_name = packer.GetStrbyName("dict_name", i);
                reqCommand.dict_field_name = packer.GetStrbyName("dict_field_name", i);
                reqCommand.dict_item_name = packer.GetStrbyName("dict_item_name", i);
                reqCommand.dict_item_value = packer.GetStrbyName("dict_item_value", i);
                reqCommand.time_stamp = packer.GetIntbyName("time_stamp", i);
 
                FuncpubL_17_180Models.Add(reqCommand);
            }
            return FuncpubL_17_180Models;
        }
 
        //逻辑_公共_基础客户端_查询数据字典
        public static List<FuncpubL_17_180Model> GetFuncpubL_17_180Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_17_180Models = new List<FuncpubL_17_180Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_17_180Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.dict_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DICT_NO_INT);
                    reqCommand.dict_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DICT_NAME_STR);
                    reqCommand.dict_field_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DICT_FIELD_NAME_STR);
                    reqCommand.dict_item_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DICT_ITEM_NAME_STR);
                    reqCommand.dict_item_value = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DICT_ITEM_VALUE_STR);
                    reqCommand.time_stamp = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT);
                    FuncpubL_17_180Models.Add(reqCommand);
                }
            }
            return FuncpubL_17_180Models;
        }
 
        //逻辑_公共_基础客户端_查询业务标志
        public static List<FuncpubL_17_181Model> GetFuncpubL_17_181Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_17_181Models = new List<FuncpubL_17_181Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_17_181Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.busi_type = packer.GetIntbyName("busi_type", i);
                reqCommand.busi_sub_type = packer.GetIntbyName("busi_sub_type", i);
                reqCommand.busi_flag = packer.GetIntbyName("busi_flag", i);
                reqCommand.busi_name = packer.GetStrbyName("busi_name", i);
                reqCommand.time_stamp = packer.GetIntbyName("time_stamp", i);
 
                FuncpubL_17_181Models.Add(reqCommand);
            }
            return FuncpubL_17_181Models;
        }
 
        //逻辑_公共_基础客户端_查询业务标志
        public static List<FuncpubL_17_181Model> GetFuncpubL_17_181Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_17_181Models = new List<FuncpubL_17_181Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_17_181Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.busi_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_TYPE_INT);
                    reqCommand.busi_sub_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_SUB_TYPE_INT);
                    reqCommand.busi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT);
                    reqCommand.busi_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_NAME_STR);
                    reqCommand.time_stamp = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT);
                    FuncpubL_17_181Models.Add(reqCommand);
                }
            }
            return FuncpubL_17_181Models;
        }
 
        //逻辑_公共_基础客户端_获取基础证券行情
        public static List<FuncpubL_17_182Model> GetFuncpubL_17_182Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_17_182Models = new List<FuncpubL_17_182Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_17_182Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.up_limit_price = packer.GetDoublebyName("up_limit_price", i);
                reqCommand.down_limit_price = packer.GetDoublebyName("down_limit_price", i);
                reqCommand.last_price = packer.GetDoublebyName("last_price", i);
 
                FuncpubL_17_182Models.Add(reqCommand);
            }
            return FuncpubL_17_182Models;
        }
 
        //逻辑_公共_基础客户端_获取基础证券行情
        public static List<FuncpubL_17_182Model> GetFuncpubL_17_182Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_17_182Models = new List<FuncpubL_17_182Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncpubL_17_182Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.up_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UP_LIMIT_PRICE_FLOAT);
                reqCommand.down_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DOWN_LIMIT_PRICE_FLOAT);
                reqCommand.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                FuncpubL_17_182Models.Add(reqCommand);
            }
            return FuncpubL_17_182Models;
        }
 
        //逻辑_公共_基础客户端_获取所需港股通汇率信息
        public static List<FuncpubL_17_120Model> GetFuncpubL_17_120Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_17_120Models = new List<FuncpubL_17_120Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_17_120Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.sh_hk_buy_ref_rate = packer.GetDoublebyName("sh_hk_buy_ref_rate", i);
                reqCommand.sh_hk_sell_ref_rate = packer.GetDoublebyName("sh_hk_sell_ref_rate", i);
                reqCommand.sh_hk_settle_buy_rate = packer.GetDoublebyName("sh_hk_settle_buy_rate", i);
                reqCommand.sh_hk_settle_sell_rate = packer.GetDoublebyName("sh_hk_settle_sell_rate", i);
                reqCommand.sz_hk_buy_ref_rate = packer.GetDoublebyName("sz_hk_buy_ref_rate", i);
                reqCommand.sz_hk_sell_ref_rate = packer.GetDoublebyName("sz_hk_sell_ref_rate", i);
                reqCommand.sz_hk_settle_buy_rate = packer.GetDoublebyName("sz_hk_settle_buy_rate", i);
                reqCommand.sz_hksettle_sell_rate = packer.GetDoublebyName("sz_hksettle_sell_rate", i);
                reqCommand.busin_date = packer.GetIntbyName("busin_date", i);
                reqCommand.pboc_rate = packer.GetDoublebyName("pboc_rate", i);
 
                FuncpubL_17_120Models.Add(reqCommand);
            }
            return FuncpubL_17_120Models;
        }
 
        //逻辑_公共_基础客户端_获取所需港股通汇率信息
        public static List<FuncpubL_17_120Model> GetFuncpubL_17_120Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_17_120Models = new List<FuncpubL_17_120Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncpubL_17_120Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.sh_hk_buy_ref_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SH_HK_BUY_REF_RATE_FLOAT);
                reqCommand.sh_hk_sell_ref_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SH_HK_SELL_REF_RATE_FLOAT);
                reqCommand.sh_hk_settle_buy_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SH_HK_SETTLE_BUY_RATE_FLOAT);
                reqCommand.sh_hk_settle_sell_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SH_HK_SETTLE_SELL_RATE_FLOAT);
                reqCommand.sz_hk_buy_ref_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SZ_HK_BUY_REF_RATE_FLOAT);
                reqCommand.sz_hk_sell_ref_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SZ_HK_SELL_REF_RATE_FLOAT);
                reqCommand.sz_hk_settle_buy_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SZ_HK_SETTLE_BUY_RATE_FLOAT);
                reqCommand.sz_hksettle_sell_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SZ_HKSETTLE_SELL_RATE_FLOAT);
                reqCommand.busin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSIN_DATE_INT);
                reqCommand.pboc_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PBOC_RATE_FLOAT);
                FuncpubL_17_120Models.Add(reqCommand);
            }
            return FuncpubL_17_120Models;
        }
 
        //逻辑_公共_基础客户端_查询对冲篮子信息结果集
        public static List<FuncpubL_17_126Model> GetFuncpubL_17_126Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_17_126Models = new List<FuncpubL_17_126Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_17_126Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.record_batch_no = packer.GetIntbyName("record_batch_no", i);
                reqCommand.comm_trd_type = packer.GetIntbyName("comm_trd_type", i);
                reqCommand.basket_id = packer.GetInt64byName("basket_id", i);
                reqCommand.basket_name = packer.GetStrbyName("basket_name", i);
                reqCommand.futu_qty = packer.GetDoublebyName("futu_qty", i);
                reqCommand.spot_qty = packer.GetDoublebyName("spot_qty", i);
                reqCommand.basket_copies = packer.GetDoublebyName("basket_copies", i);
                reqCommand.remain_copies = packer.GetDoublebyName("remain_copies", i);
                reqCommand.cash_replace_amt = packer.GetDoublebyName("cash_replace_amt", i);
                reqCommand.hedging_pankou = packer.GetDoublebyName("hedging_pankou", i);
                reqCommand.name_base_diff = packer.GetDoublebyName("name_base_diff", i);
                reqCommand.basket_base_diff = packer.GetDoublebyName("basket_base_diff", i);
                reqCommand.track_base_diff = packer.GetDoublebyName("track_base_diff", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FuncpubL_17_126Models.Add(reqCommand);
            }
            return FuncpubL_17_126Models;
        }
 
        //逻辑_公共_基础客户端_查询对冲篮子信息结果集
        public static List<FuncpubL_17_126Model> GetFuncpubL_17_126Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_17_126Models = new List<FuncpubL_17_126Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_17_126Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.record_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RECORD_BATCH_NO_INT);
                    reqCommand.comm_trd_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_TRD_TYPE_INT);
                    reqCommand.basket_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_ID_INT64);
                    reqCommand.basket_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_NAME_STR);
                    reqCommand.futu_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_QTY_FLOAT);
                    reqCommand.spot_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SPOT_QTY_FLOAT);
                    reqCommand.basket_copies = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_COPIES_FLOAT);
                    reqCommand.remain_copies = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REMAIN_COPIES_FLOAT);
                    reqCommand.cash_replace_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_REPLACE_AMT_FLOAT);
                    reqCommand.hedging_pankou = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HEDGING_PANKOU_FLOAT);
                    reqCommand.name_base_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAME_BASE_DIFF_FLOAT);
                    reqCommand.basket_base_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_BASE_DIFF_FLOAT);
                    reqCommand.track_base_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRACK_BASE_DIFF_FLOAT);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FuncpubL_17_126Models.Add(reqCommand);
                }
            }
            return FuncpubL_17_126Models;
        }
 
        //逻辑_公共_基础客户端_查询历史对冲篮子信息结果集
        public static List<FuncpubL_17_127Model> GetFuncpubL_17_127Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_17_127Models = new List<FuncpubL_17_127Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_17_127Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.record_batch_no = packer.GetIntbyName("record_batch_no", i);
                reqCommand.comm_trd_type = packer.GetIntbyName("comm_trd_type", i);
                reqCommand.basket_id = packer.GetInt64byName("basket_id", i);
                reqCommand.basket_name = packer.GetStrbyName("basket_name", i);
                reqCommand.futu_qty = packer.GetDoublebyName("futu_qty", i);
                reqCommand.spot_qty = packer.GetDoublebyName("spot_qty", i);
                reqCommand.basket_copies = packer.GetDoublebyName("basket_copies", i);
                reqCommand.remain_copies = packer.GetDoublebyName("remain_copies", i);
                reqCommand.cash_replace_amt = packer.GetDoublebyName("cash_replace_amt", i);
                reqCommand.hedging_pankou = packer.GetDoublebyName("hedging_pankou", i);
                reqCommand.name_base_diff = packer.GetDoublebyName("name_base_diff", i);
                reqCommand.basket_base_diff = packer.GetDoublebyName("basket_base_diff", i);
                reqCommand.track_base_diff = packer.GetDoublebyName("track_base_diff", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FuncpubL_17_127Models.Add(reqCommand);
            }
            return FuncpubL_17_127Models;
        }
 
        //逻辑_公共_基础客户端_查询历史对冲篮子信息结果集
        public static List<FuncpubL_17_127Model> GetFuncpubL_17_127Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_17_127Models = new List<FuncpubL_17_127Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_17_127Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.record_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RECORD_BATCH_NO_INT);
                    reqCommand.comm_trd_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_TRD_TYPE_INT);
                    reqCommand.basket_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_ID_INT64);
                    reqCommand.basket_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_NAME_STR);
                    reqCommand.futu_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_QTY_FLOAT);
                    reqCommand.spot_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SPOT_QTY_FLOAT);
                    reqCommand.basket_copies = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_COPIES_FLOAT);
                    reqCommand.remain_copies = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REMAIN_COPIES_FLOAT);
                    reqCommand.cash_replace_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_REPLACE_AMT_FLOAT);
                    reqCommand.hedging_pankou = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HEDGING_PANKOU_FLOAT);
                    reqCommand.name_base_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAME_BASE_DIFF_FLOAT);
                    reqCommand.basket_base_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_BASE_DIFF_FLOAT);
                    reqCommand.track_base_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRACK_BASE_DIFF_FLOAT);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FuncpubL_17_127Models.Add(reqCommand);
                }
            }
            return FuncpubL_17_127Models;
        }
 
    }
}
