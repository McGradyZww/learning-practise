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

    public static class ProductAccoBack
    {
        //逻辑_产品_账户运维_查询全部产品
        public static List<FuncprodL_5_1Model> GetFuncprodL_5_1Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncprodL_5_1Models = new List<FuncprodL_5_1Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncprodL_5_1Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_code = packer.GetStrbyName("pd_code", i);
                reqCommand.pd_name = packer.GetStrbyName("pd_name", i);
                reqCommand.pd_status = packer.GetStrbyName("pd_status", i);
 
                FuncprodL_5_1Models.Add(reqCommand);
            }
            return FuncprodL_5_1Models;
        }
 
        //逻辑_产品_账户运维_查询全部产品
        public static List<FuncprodL_5_1Model> GetFuncprodL_5_1Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncprodL_5_1Models = new List<FuncprodL_5_1Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncprodL_5_1Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    reqCommand.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    reqCommand.pd_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_STATUS_STR);
                    FuncprodL_5_1Models.Add(reqCommand);
                }
            }
            return FuncprodL_5_1Models;
        }
 
        //逻辑_产品_账户运维_查询全部资产账户
        public static List<FuncprodL_5_2Model> GetFuncprodL_5_2Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncprodL_5_2Models = new List<FuncprodL_5_2Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncprodL_5_2Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.asset_acco = packer.GetStrbyName("asset_acco", i);
                reqCommand.asset_acco_name = packer.GetStrbyName("asset_acco_name", i);
                reqCommand.asset_acco_status = packer.GetStrbyName("asset_acco_status", i);
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
                reqCommand.busi_depart = packer.GetStrbyName("busi_depart", i);
 
                FuncprodL_5_2Models.Add(reqCommand);
            }
            return FuncprodL_5_2Models;
        }
 
        //逻辑_产品_账户运维_查询全部资产账户
        public static List<FuncprodL_5_2Model> GetFuncprodL_5_2Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncprodL_5_2Models = new List<FuncprodL_5_2Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncprodL_5_2Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.asset_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STR);
                    reqCommand.asset_acco_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NAME_STR);
                    reqCommand.asset_acco_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STATUS_STR);
                    reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    reqCommand.busi_depart = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_DEPART_STR);
                    FuncprodL_5_2Models.Add(reqCommand);
                }
            }
            return FuncprodL_5_2Models;
        }
 
        //逻辑_产品_账户运维_查询产品信息
        public static List<FuncprodL_5_4Model> GetFuncprodL_5_4Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncprodL_5_4Models = new List<FuncprodL_5_4Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncprodL_5_4Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_code = packer.GetStrbyName("pd_code", i);
                reqCommand.pd_name = packer.GetStrbyName("pd_name", i);
                reqCommand.pd_flname = packer.GetStrbyName("pd_flname", i);
                reqCommand.pd_manager = packer.GetStrbyName("pd_manager", i);
                reqCommand.found_date = packer.GetIntbyName("found_date", i);
                reqCommand.pd_type = packer.GetIntbyName("pd_type", i);
                reqCommand.apply_currency = packer.GetStrbyName("apply_currency", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.first_asset = packer.GetDoublebyName("first_asset", i);
                reqCommand.first_amt = packer.GetDoublebyName("first_amt", i);
                reqCommand.pd_all_share = packer.GetDoublebyName("pd_all_share", i);
                reqCommand.curr_share = packer.GetDoublebyName("curr_share", i);
                reqCommand.pre_share = packer.GetDoublebyName("pre_share", i);
                reqCommand.his_max_per_nav = packer.GetDoublebyName("his_max_per_nav", i);
                reqCommand.pre_nav = packer.GetDoublebyName("pre_nav", i);
                reqCommand.coust_full_name = packer.GetStrbyName("coust_full_name", i);
                reqCommand.coust_acco = packer.GetStrbyName("coust_acco", i);
                reqCommand.coust_acco_name = packer.GetStrbyName("coust_acco_name", i);
                reqCommand.cost_calc_type = packer.GetIntbyName("cost_calc_type", i);
                reqCommand.allow_exch = packer.GetStrbyName("allow_exch", i);
                reqCommand.allow_stock_type = packer.GetStrbyName("allow_stock_type", i);
                reqCommand.busi_config_str = packer.GetStrbyName("busi_config_str", i);
                reqCommand.comm_appr_oper = packer.GetIntbyName("comm_appr_oper", i);
                reqCommand.market_price_ratio = packer.GetDoublebyName("market_price_ratio", i);
                reqCommand.forbid_order_dir = packer.GetStrbyName("forbid_order_dir", i);
                reqCommand.warn_posi_value = packer.GetDoublebyName("warn_posi_value", i);
                reqCommand.close_posi_value = packer.GetDoublebyName("close_posi_value", i);
                reqCommand.target_posi_ratio = packer.GetDoublebyName("target_posi_ratio", i);
                reqCommand.beta_coeffi = packer.GetDoublebyName("beta_coeffi", i);
                reqCommand.custom_pd_class = packer.GetStrbyName("custom_pd_class", i);
                reqCommand.pd_status = packer.GetStrbyName("pd_status", i);
                reqCommand.index_value = packer.GetIntbyName("index_value", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncprodL_5_4Models.Add(reqCommand);
            }
            return FuncprodL_5_4Models;
        }
 
        //逻辑_产品_账户运维_查询产品信息
        public static List<FuncprodL_5_4Model> GetFuncprodL_5_4Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncprodL_5_4Models = new List<FuncprodL_5_4Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncprodL_5_4Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    reqCommand.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    reqCommand.pd_flname = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_FLNAME_STR);
                    reqCommand.pd_manager = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_MANAGER_STR);
                    reqCommand.found_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FOUND_DATE_INT);
                    reqCommand.pd_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_TYPE_INT);
                    reqCommand.apply_currency = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_APPLY_CURRENCY_STR);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.first_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FIRST_ASSET_FLOAT);
                    reqCommand.first_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FIRST_AMT_FLOAT);
                    reqCommand.pd_all_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_ALL_SHARE_FLOAT);
                    reqCommand.curr_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_SHARE_FLOAT);
                    reqCommand.pre_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SHARE_FLOAT);
                    reqCommand.his_max_per_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HIS_MAX_PER_NAV_FLOAT);
                    reqCommand.pre_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_NAV_FLOAT);
                    reqCommand.coust_full_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COUST_FULL_NAME_STR);
                    reqCommand.coust_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COUST_ACCO_STR);
                    reqCommand.coust_acco_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COUST_ACCO_NAME_STR);
                    reqCommand.cost_calc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COST_CALC_TYPE_INT);
                    reqCommand.allow_exch = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_EXCH_STR);
                    reqCommand.allow_stock_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_STOCK_TYPE_STR);
                    reqCommand.busi_config_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_CONFIG_STR_STR);
                    reqCommand.comm_appr_oper = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_OPER_INT);
                    reqCommand.market_price_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_PRICE_RATIO_FLOAT);
                    reqCommand.forbid_order_dir = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FORBID_ORDER_DIR_STR);
                    reqCommand.warn_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WARN_POSI_VALUE_FLOAT);
                    reqCommand.close_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_VALUE_FLOAT);
                    reqCommand.target_posi_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_POSI_RATIO_FLOAT);
                    reqCommand.beta_coeffi = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BETA_COEFFI_FLOAT);
                    reqCommand.custom_pd_class = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CUSTOM_PD_CLASS_STR);
                    reqCommand.pd_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_STATUS_STR);
                    reqCommand.index_value = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDEX_VALUE_INT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncprodL_5_4Models.Add(reqCommand);
                }
            }
            return FuncprodL_5_4Models;
        }
 
        //逻辑_产品_账户运维_查询资产账户信息
        public static List<FuncprodL_5_6Model> GetFuncprodL_5_6Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncprodL_5_6Models = new List<FuncprodL_5_6Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncprodL_5_6Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.update_date = packer.GetIntbyName("update_date", i);
                reqCommand.update_time = packer.GetIntbyName("update_time", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.asset_acco = packer.GetStrbyName("asset_acco", i);
                reqCommand.asset_acco_name = packer.GetStrbyName("asset_acco_name", i);
                reqCommand.asset_acco_type = packer.GetIntbyName("asset_acco_type", i);
                reqCommand.trade_pwd = packer.GetStrbyName("trade_pwd", i);
                reqCommand.asset_acco_status = packer.GetStrbyName("asset_acco_status", i);
                reqCommand.busi_config_str = packer.GetStrbyName("busi_config_str", i);
                reqCommand.market_price_ratio = packer.GetDoublebyName("market_price_ratio", i);
                reqCommand.allow_exch = packer.GetStrbyName("allow_exch", i);
                reqCommand.allow_stock_type = packer.GetStrbyName("allow_stock_type", i);
                reqCommand.split_fee_typr_str = packer.GetStrbyName("split_fee_typr_str", i);
                reqCommand.busi_limit_str = packer.GetStrbyName("busi_limit_str", i);
                reqCommand.exter_comm_flag = packer.GetIntbyName("exter_comm_flag", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncprodL_5_6Models.Add(reqCommand);
            }
            return FuncprodL_5_6Models;
        }
 
        //逻辑_产品_账户运维_查询资产账户信息
        public static List<FuncprodL_5_6Model> GetFuncprodL_5_6Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncprodL_5_6Models = new List<FuncprodL_5_6Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncprodL_5_6Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    reqCommand.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    reqCommand.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    reqCommand.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.asset_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STR);
                    reqCommand.asset_acco_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NAME_STR);
                    reqCommand.asset_acco_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_TYPE_INT);
                    reqCommand.trade_pwd = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_PWD_STR);
                    reqCommand.asset_acco_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STATUS_STR);
                    reqCommand.busi_config_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_CONFIG_STR_STR);
                    reqCommand.market_price_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_PRICE_RATIO_FLOAT);
                    reqCommand.allow_exch = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_EXCH_STR);
                    reqCommand.allow_stock_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_STOCK_TYPE_STR);
                    reqCommand.split_fee_typr_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_SPLIT_FEE_TYPR_STR_STR);
                    reqCommand.busi_limit_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_LIMIT_STR_STR);
                    reqCommand.exter_comm_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXTER_COMM_FLAG_INT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncprodL_5_6Models.Add(reqCommand);
                }
            }
            return FuncprodL_5_6Models;
        }
 
        //逻辑_产品_账户运维_查询证券同步所需资产账户信息
        public static List<FuncprodL_5_8Model> GetFuncprodL_5_8Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncprodL_5_8Models = new List<FuncprodL_5_8Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncprodL_5_8Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.asset_acco = packer.GetStrbyName("asset_acco", i);
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
                reqCommand.online_status = packer.GetIntbyName("online_status", i);
 
                FuncprodL_5_8Models.Add(reqCommand);
            }
            return FuncprodL_5_8Models;
        }
 
        //逻辑_产品_账户运维_查询证券同步所需资产账户信息
        public static List<FuncprodL_5_8Model> GetFuncprodL_5_8Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncprodL_5_8Models = new List<FuncprodL_5_8Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncprodL_5_8Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.asset_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STR);
                    reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    reqCommand.online_status = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ONLINE_STATUS_INT);
                    FuncprodL_5_8Models.Add(reqCommand);
                }
            }
            return FuncprodL_5_8Models;
        }
 
        //逻辑_产品_账户运维_查询全部资产账户通道信息
        public static List<FuncprodL_5_74Model> GetFuncprodL_5_74Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncprodL_5_74Models = new List<FuncprodL_5_74Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncprodL_5_74Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.update_date = packer.GetIntbyName("update_date", i);
                reqCommand.update_time = packer.GetIntbyName("update_time", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.pass_type = packer.GetIntbyName("pass_type", i);
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
                reqCommand.online_status = packer.GetIntbyName("online_status", i);
                reqCommand.config_str = packer.GetStrbyName("config_str", i);
                reqCommand.read_flag = packer.GetIntbyName("read_flag", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncprodL_5_74Models.Add(reqCommand);
            }
            return FuncprodL_5_74Models;
        }
 
        //逻辑_产品_账户运维_查询全部资产账户通道信息
        public static List<FuncprodL_5_74Model> GetFuncprodL_5_74Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncprodL_5_74Models = new List<FuncprodL_5_74Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncprodL_5_74Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    reqCommand.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    reqCommand.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    reqCommand.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.pass_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_TYPE_INT);
                    reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    reqCommand.online_status = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ONLINE_STATUS_INT);
                    reqCommand.config_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_STR_STR);
                    reqCommand.read_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_READ_FLAG_INT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncprodL_5_74Models.Add(reqCommand);
                }
            }
            return FuncprodL_5_74Models;
        }
 
        //逻辑_产品_账户运维_查询符合资产帐户类型的产品
        public static List<FuncprodL_5_76Model> GetFuncprodL_5_76Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncprodL_5_76Models = new List<FuncprodL_5_76Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncprodL_5_76Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_code = packer.GetStrbyName("pd_code", i);
                reqCommand.pd_name = packer.GetStrbyName("pd_name", i);
                reqCommand.pd_status = packer.GetStrbyName("pd_status", i);
 
                FuncprodL_5_76Models.Add(reqCommand);
            }
            return FuncprodL_5_76Models;
        }
 
        //逻辑_产品_账户运维_查询符合资产帐户类型的产品
        public static List<FuncprodL_5_76Model> GetFuncprodL_5_76Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncprodL_5_76Models = new List<FuncprodL_5_76Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncprodL_5_76Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    reqCommand.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    reqCommand.pd_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_STATUS_STR);
                    FuncprodL_5_76Models.Add(reqCommand);
                }
            }
            return FuncprodL_5_76Models;
        }
 
        //逻辑_产品_账户运维_查询报盘回写通道信息
        public static List<FuncprodL_5_77Model> GetFuncprodL_5_77Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncprodL_5_77Models = new List<FuncprodL_5_77Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncprodL_5_77Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.mac_addr = packer.GetStrbyName("mac_addr", i);
                reqCommand.offer_name = packer.GetStrbyName("offer_name", i);
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.offer_server_name = packer.GetStrbyName("offer_server_name", i);
                reqCommand.offer_server_ip = packer.GetStrbyName("offer_server_ip", i);
                reqCommand.software_start_time = packer.GetIntbyName("software_start_time", i);
                reqCommand.pass_status = packer.GetStrbyName("pass_status", i);
                reqCommand.bkup_field_1 = packer.GetStrbyName("bkup_field_1", i);
                reqCommand.bkup_field_2 = packer.GetIntbyName("bkup_field_2", i);
                reqCommand.bkup_field_3 = packer.GetDoublebyName("bkup_field_3", i);
 
                FuncprodL_5_77Models.Add(reqCommand);
            }
            return FuncprodL_5_77Models;
        }
 
        //逻辑_产品_账户运维_查询报盘回写通道信息
        public static List<FuncprodL_5_77Model> GetFuncprodL_5_77Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncprodL_5_77Models = new List<FuncprodL_5_77Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncprodL_5_77Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.mac_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MAC_ADDR_STR);
                    reqCommand.offer_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OFFER_NAME_STR);
                    reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    reqCommand.offer_server_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OFFER_SERVER_NAME_STR);
                    reqCommand.offer_server_ip = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OFFER_SERVER_IP_STR);
                    reqCommand.software_start_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SOFTWARE_START_TIME_INT);
                    reqCommand.pass_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PASS_STATUS_STR);
                    reqCommand.bkup_field_1 = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BKUP_FIELD_1_STR);
                    reqCommand.bkup_field_2 = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BKUP_FIELD_2_INT);
                    reqCommand.bkup_field_3 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BKUP_FIELD_3_FLOAT);
                    FuncprodL_5_77Models.Add(reqCommand);
                }
            }
            return FuncprodL_5_77Models;
        }
 
        //逻辑_产品_账户运维_查询产品限制信息
        public static List<FuncprodL_5_82Model> GetFuncprodL_5_82Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncprodL_5_82Models = new List<FuncprodL_5_82Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncprodL_5_82Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.update_date = packer.GetIntbyName("update_date", i);
                reqCommand.update_time = packer.GetIntbyName("update_time", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.cost_calc_type = packer.GetIntbyName("cost_calc_type", i);
                reqCommand.allow_exch = packer.GetStrbyName("allow_exch", i);
                reqCommand.allow_stock_type = packer.GetStrbyName("allow_stock_type", i);
                reqCommand.busi_config_str = packer.GetStrbyName("busi_config_str", i);
                reqCommand.comm_appr_oper = packer.GetIntbyName("comm_appr_oper", i);
                reqCommand.market_price_ratio = packer.GetDoublebyName("market_price_ratio", i);
                reqCommand.forbid_order_dir = packer.GetStrbyName("forbid_order_dir", i);
                reqCommand.pd_status = packer.GetStrbyName("pd_status", i);
                reqCommand.comm_no_limit_price_ratio = packer.GetDoublebyName("comm_no_limit_price_ratio", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncprodL_5_82Models.Add(reqCommand);
            }
            return FuncprodL_5_82Models;
        }
 
        //逻辑_产品_账户运维_查询产品限制信息
        public static List<FuncprodL_5_82Model> GetFuncprodL_5_82Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncprodL_5_82Models = new List<FuncprodL_5_82Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncprodL_5_82Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    reqCommand.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    reqCommand.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    reqCommand.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.cost_calc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COST_CALC_TYPE_INT);
                    reqCommand.allow_exch = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_EXCH_STR);
                    reqCommand.allow_stock_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_STOCK_TYPE_STR);
                    reqCommand.busi_config_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_CONFIG_STR_STR);
                    reqCommand.comm_appr_oper = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_OPER_INT);
                    reqCommand.market_price_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_PRICE_RATIO_FLOAT);
                    reqCommand.forbid_order_dir = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FORBID_ORDER_DIR_STR);
                    reqCommand.pd_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_STATUS_STR);
                    reqCommand.comm_no_limit_price_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_NO_LIMIT_PRICE_RATIO_FLOAT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncprodL_5_82Models.Add(reqCommand);
                }
            }
            return FuncprodL_5_82Models;
        }
 
        //逻辑_产品_账户运维_新增产品信息
        public static List<FuncprodL_5_83Model> GetFuncprodL_5_83Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncprodL_5_83Models = new List<FuncprodL_5_83Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncprodL_5_83Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
 
                FuncprodL_5_83Models.Add(reqCommand);
            }
            return FuncprodL_5_83Models;
        }
 
        //逻辑_产品_账户运维_新增产品信息
        public static List<FuncprodL_5_83Model> GetFuncprodL_5_83Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncprodL_5_83Models = new List<FuncprodL_5_83Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncprodL_5_83Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                FuncprodL_5_83Models.Add(reqCommand);
            }
            return FuncprodL_5_83Models;
        }
 
        //逻辑_产品_账户运维_导入产品信息
        public static List<FuncprodL_5_84Model> GetFuncprodL_5_84Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncprodL_5_84Models = new List<FuncprodL_5_84Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncprodL_5_84Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
 
                FuncprodL_5_84Models.Add(reqCommand);
            }
            return FuncprodL_5_84Models;
        }
 
        //逻辑_产品_账户运维_导入产品信息
        public static List<FuncprodL_5_84Model> GetFuncprodL_5_84Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncprodL_5_84Models = new List<FuncprodL_5_84Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncprodL_5_84Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                FuncprodL_5_84Models.Add(reqCommand);
            }
            return FuncprodL_5_84Models;
        }
 
        //逻辑_产品_账户运维_新增资产账户信息
        public static List<FuncprodL_5_86Model> GetFuncprodL_5_86Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncprodL_5_86Models = new List<FuncprodL_5_86Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncprodL_5_86Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
 
                FuncprodL_5_86Models.Add(reqCommand);
            }
            return FuncprodL_5_86Models;
        }
 
        //逻辑_产品_账户运维_新增资产账户信息
        public static List<FuncprodL_5_86Model> GetFuncprodL_5_86Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncprodL_5_86Models = new List<FuncprodL_5_86Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncprodL_5_86Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                FuncprodL_5_86Models.Add(reqCommand);
            }
            return FuncprodL_5_86Models;
        }
 
        //逻辑_产品_账户运维_查询所有产品信息
        public static List<FuncprodL_5_93Model> GetFuncprodL_5_93Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncprodL_5_93Models = new List<FuncprodL_5_93Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncprodL_5_93Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.update_date = packer.GetIntbyName("update_date", i);
                reqCommand.update_time = packer.GetIntbyName("update_time", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_code = packer.GetStrbyName("pd_code", i);
                reqCommand.pd_name = packer.GetStrbyName("pd_name", i);
                reqCommand.pd_flname = packer.GetStrbyName("pd_flname", i);
                reqCommand.fund_reg_code = packer.GetStrbyName("fund_reg_code", i);
                reqCommand.pd_manager = packer.GetStrbyName("pd_manager", i);
                reqCommand.found_date = packer.GetIntbyName("found_date", i);
                reqCommand.pd_type = packer.GetIntbyName("pd_type", i);
                reqCommand.apply_currency = packer.GetStrbyName("apply_currency", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.first_asset = packer.GetDoublebyName("first_asset", i);
                reqCommand.first_amt = packer.GetDoublebyName("first_amt", i);
                reqCommand.pd_all_share = packer.GetDoublebyName("pd_all_share", i);
                reqCommand.curr_share = packer.GetDoublebyName("curr_share", i);
                reqCommand.pre_share = packer.GetDoublebyName("pre_share", i);
                reqCommand.his_max_per_nav = packer.GetDoublebyName("his_max_per_nav", i);
                reqCommand.pre_nav = packer.GetDoublebyName("pre_nav", i);
                reqCommand.coust_full_name = packer.GetStrbyName("coust_full_name", i);
                reqCommand.coust_acco = packer.GetStrbyName("coust_acco", i);
                reqCommand.coust_acco_name = packer.GetStrbyName("coust_acco_name", i);
                reqCommand.warn_posi_value = packer.GetDoublebyName("warn_posi_value", i);
                reqCommand.close_posi_value = packer.GetDoublebyName("close_posi_value", i);
                reqCommand.target_posi_ratio = packer.GetDoublebyName("target_posi_ratio", i);
                reqCommand.beta_coeffi = packer.GetDoublebyName("beta_coeffi", i);
                reqCommand.custom_pd_class = packer.GetStrbyName("custom_pd_class", i);
                reqCommand.pd_status = packer.GetStrbyName("pd_status", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
                reqCommand.index_value = packer.GetIntbyName("index_value", i);
 
                FuncprodL_5_93Models.Add(reqCommand);
            }
            return FuncprodL_5_93Models;
        }
 
        //逻辑_产品_账户运维_查询所有产品信息
        public static List<FuncprodL_5_93Model> GetFuncprodL_5_93Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncprodL_5_93Models = new List<FuncprodL_5_93Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncprodL_5_93Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    reqCommand.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    reqCommand.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    reqCommand.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    reqCommand.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    reqCommand.pd_flname = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_FLNAME_STR);
                    reqCommand.fund_reg_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FUND_REG_CODE_STR);
                    reqCommand.pd_manager = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_MANAGER_STR);
                    reqCommand.found_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FOUND_DATE_INT);
                    reqCommand.pd_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_TYPE_INT);
                    reqCommand.apply_currency = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_APPLY_CURRENCY_STR);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.first_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FIRST_ASSET_FLOAT);
                    reqCommand.first_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FIRST_AMT_FLOAT);
                    reqCommand.pd_all_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_ALL_SHARE_FLOAT);
                    reqCommand.curr_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_SHARE_FLOAT);
                    reqCommand.pre_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SHARE_FLOAT);
                    reqCommand.his_max_per_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HIS_MAX_PER_NAV_FLOAT);
                    reqCommand.pre_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_NAV_FLOAT);
                    reqCommand.coust_full_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COUST_FULL_NAME_STR);
                    reqCommand.coust_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COUST_ACCO_STR);
                    reqCommand.coust_acco_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COUST_ACCO_NAME_STR);
                    reqCommand.warn_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WARN_POSI_VALUE_FLOAT);
                    reqCommand.close_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_VALUE_FLOAT);
                    reqCommand.target_posi_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_POSI_RATIO_FLOAT);
                    reqCommand.beta_coeffi = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BETA_COEFFI_FLOAT);
                    reqCommand.custom_pd_class = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CUSTOM_PD_CLASS_STR);
                    reqCommand.pd_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_STATUS_STR);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    reqCommand.index_value = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDEX_VALUE_INT);
                    FuncprodL_5_93Models.Add(reqCommand);
                }
            }
            return FuncprodL_5_93Models;
        }
 
    }
}
