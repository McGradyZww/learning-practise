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

    public static class ProductFutuCapital
    {
        //逻辑_产品期货_资金_查询交易组资金
        public static List<FuncpdfutuL_2_37Model> GetFuncpdfutuL_2_37Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpdfutuL_2_37Models = new List<FuncpdfutuL_2_37Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpdfutuL_2_37Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.update_date = packer.GetIntbyName("update_date", i);
                reqCommand.update_time = packer.GetIntbyName("update_time", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.begin_amt = packer.GetDoublebyName("begin_amt", i);
                reqCommand.curr_amt = packer.GetDoublebyName("curr_amt", i);
                reqCommand.capt_margin = packer.GetDoublebyName("capt_margin", i);
                reqCommand.frozen_amt = packer.GetDoublebyName("frozen_amt", i);
                reqCommand.unfroz_amt = packer.GetDoublebyName("unfroz_amt", i);
                reqCommand.total_rece_amt = packer.GetDoublebyName("total_rece_amt", i);
                reqCommand.total_payab_amt = packer.GetDoublebyName("total_payab_amt", i);
                reqCommand.intrst_rate = packer.GetDoublebyName("intrst_rate", i);
                reqCommand.intrst_base_amt = packer.GetDoublebyName("intrst_base_amt", i);
                reqCommand.pre_entry_intrst_amt = packer.GetDoublebyName("pre_entry_intrst_amt", i);
 
                FuncpdfutuL_2_37Models.Add(reqCommand);
            }
            return FuncpdfutuL_2_37Models;
        }
 
        //逻辑_产品期货_资金_查询交易组资金
        public static List<FuncpdfutuL_2_37Model> GetFuncpdfutuL_2_37Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpdfutuL_2_37Models = new List<FuncpdfutuL_2_37Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpdfutuL_2_37Model();
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
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.begin_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_AMT_FLOAT);
                    reqCommand.curr_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_AMT_FLOAT);
                    reqCommand.capt_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CAPT_MARGIN_FLOAT);
                    reqCommand.frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_AMT_FLOAT);
                    reqCommand.unfroz_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_AMT_FLOAT);
                    reqCommand.total_rece_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_RECE_AMT_FLOAT);
                    reqCommand.total_payab_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_PAYAB_AMT_FLOAT);
                    reqCommand.intrst_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_RATE_FLOAT);
                    reqCommand.intrst_base_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_BASE_AMT_FLOAT);
                    reqCommand.pre_entry_intrst_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ENTRY_INTRST_AMT_FLOAT);
                    FuncpdfutuL_2_37Models.Add(reqCommand);
                }
            }
            return FuncpdfutuL_2_37Models;
        }
 
        //逻辑_产品期货_资金_查询历史交易组资金
        public static List<FuncpdfutuL_2_38Model> GetFuncpdfutuL_2_38Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpdfutuL_2_38Models = new List<FuncpdfutuL_2_38Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpdfutuL_2_38Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.update_date = packer.GetIntbyName("update_date", i);
                reqCommand.update_time = packer.GetIntbyName("update_time", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.begin_amt = packer.GetDoublebyName("begin_amt", i);
                reqCommand.curr_amt = packer.GetDoublebyName("curr_amt", i);
                reqCommand.capt_margin = packer.GetDoublebyName("capt_margin", i);
                reqCommand.frozen_amt = packer.GetDoublebyName("frozen_amt", i);
                reqCommand.unfroz_amt = packer.GetDoublebyName("unfroz_amt", i);
                reqCommand.total_rece_amt = packer.GetDoublebyName("total_rece_amt", i);
                reqCommand.total_payab_amt = packer.GetDoublebyName("total_payab_amt", i);
                reqCommand.intrst_rate = packer.GetDoublebyName("intrst_rate", i);
                reqCommand.intrst_base_amt = packer.GetDoublebyName("intrst_base_amt", i);
                reqCommand.pre_entry_intrst_amt = packer.GetDoublebyName("pre_entry_intrst_amt", i);
 
                FuncpdfutuL_2_38Models.Add(reqCommand);
            }
            return FuncpdfutuL_2_38Models;
        }
 
        //逻辑_产品期货_资金_查询历史交易组资金
        public static List<FuncpdfutuL_2_38Model> GetFuncpdfutuL_2_38Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpdfutuL_2_38Models = new List<FuncpdfutuL_2_38Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpdfutuL_2_38Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    reqCommand.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    reqCommand.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    reqCommand.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.begin_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_AMT_FLOAT);
                    reqCommand.curr_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_AMT_FLOAT);
                    reqCommand.capt_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CAPT_MARGIN_FLOAT);
                    reqCommand.frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_AMT_FLOAT);
                    reqCommand.unfroz_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_AMT_FLOAT);
                    reqCommand.total_rece_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_RECE_AMT_FLOAT);
                    reqCommand.total_payab_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_PAYAB_AMT_FLOAT);
                    reqCommand.intrst_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_RATE_FLOAT);
                    reqCommand.intrst_base_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_BASE_AMT_FLOAT);
                    reqCommand.pre_entry_intrst_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ENTRY_INTRST_AMT_FLOAT);
                    FuncpdfutuL_2_38Models.Add(reqCommand);
                }
            }
            return FuncpdfutuL_2_38Models;
        }
 
        //逻辑_产品期货_资金_查询交易组资金流水
        public static List<FuncpdfutuL_2_39Model> GetFuncpdfutuL_2_39Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpdfutuL_2_39Models = new List<FuncpdfutuL_2_39Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpdfutuL_2_39Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.update_date = packer.GetIntbyName("update_date", i);
                reqCommand.update_time = packer.GetIntbyName("update_time", i);
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
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.busi_flag = packer.GetIntbyName("busi_flag", i);
                reqCommand.occur_amt = packer.GetDoublebyName("occur_amt", i);
                reqCommand.occur_end_amt = packer.GetDoublebyName("occur_end_amt", i);
                reqCommand.jour_occur_field = packer.GetStrbyName("jour_occur_field", i);
                reqCommand.jour_after_occur_info = packer.GetStrbyName("jour_after_occur_info", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncpdfutuL_2_39Models.Add(reqCommand);
            }
            return FuncpdfutuL_2_39Models;
        }
 
        //逻辑_产品期货_资金_查询交易组资金流水
        public static List<FuncpdfutuL_2_39Model> GetFuncpdfutuL_2_39Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpdfutuL_2_39Models = new List<FuncpdfutuL_2_39Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpdfutuL_2_39Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    reqCommand.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    reqCommand.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    reqCommand.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
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
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.busi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT);
                    reqCommand.occur_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_AMT_FLOAT);
                    reqCommand.occur_end_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_END_AMT_FLOAT);
                    reqCommand.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    reqCommand.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncpdfutuL_2_39Models.Add(reqCommand);
                }
            }
            return FuncpdfutuL_2_39Models;
        }
 
        //逻辑_产品期货_资金_查询历史交易组资金流水
        public static List<FuncpdfutuL_2_40Model> GetFuncpdfutuL_2_40Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpdfutuL_2_40Models = new List<FuncpdfutuL_2_40Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpdfutuL_2_40Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.update_date = packer.GetIntbyName("update_date", i);
                reqCommand.update_time = packer.GetIntbyName("update_time", i);
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
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.busi_flag = packer.GetIntbyName("busi_flag", i);
                reqCommand.occur_amt = packer.GetDoublebyName("occur_amt", i);
                reqCommand.occur_end_amt = packer.GetDoublebyName("occur_end_amt", i);
                reqCommand.jour_occur_field = packer.GetStrbyName("jour_occur_field", i);
                reqCommand.jour_after_occur_info = packer.GetStrbyName("jour_after_occur_info", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncpdfutuL_2_40Models.Add(reqCommand);
            }
            return FuncpdfutuL_2_40Models;
        }
 
        //逻辑_产品期货_资金_查询历史交易组资金流水
        public static List<FuncpdfutuL_2_40Model> GetFuncpdfutuL_2_40Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpdfutuL_2_40Models = new List<FuncpdfutuL_2_40Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpdfutuL_2_40Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    reqCommand.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    reqCommand.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    reqCommand.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
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
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.busi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT);
                    reqCommand.occur_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_AMT_FLOAT);
                    reqCommand.occur_end_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_END_AMT_FLOAT);
                    reqCommand.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    reqCommand.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncpdfutuL_2_40Models.Add(reqCommand);
                }
            }
            return FuncpdfutuL_2_40Models;
        }
 
        //逻辑_产品期货_资金_查询交易组资金冻结解冻流水
        public static List<FuncpdfutuL_2_41Model> GetFuncpdfutuL_2_41Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpdfutuL_2_41Models = new List<FuncpdfutuL_2_41Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpdfutuL_2_41Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.update_date = packer.GetIntbyName("update_date", i);
                reqCommand.update_time = packer.GetIntbyName("update_time", i);
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
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.frozen_type = packer.GetIntbyName("frozen_type", i);
                reqCommand.occur_amt = packer.GetDoublebyName("occur_amt", i);
                reqCommand.expire_date = packer.GetIntbyName("expire_date", i);
                reqCommand.jour_status = packer.GetStrbyName("jour_status", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncpdfutuL_2_41Models.Add(reqCommand);
            }
            return FuncpdfutuL_2_41Models;
        }
 
        //逻辑_产品期货_资金_查询交易组资金冻结解冻流水
        public static List<FuncpdfutuL_2_41Model> GetFuncpdfutuL_2_41Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpdfutuL_2_41Models = new List<FuncpdfutuL_2_41Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpdfutuL_2_41Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    reqCommand.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    reqCommand.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    reqCommand.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
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
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.frozen_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_TYPE_INT);
                    reqCommand.occur_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_AMT_FLOAT);
                    reqCommand.expire_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXPIRE_DATE_INT);
                    reqCommand.jour_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_STATUS_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncpdfutuL_2_41Models.Add(reqCommand);
                }
            }
            return FuncpdfutuL_2_41Models;
        }
 
        //逻辑_产品期货_资金_查询历史交易组资金冻结解冻流水
        public static List<FuncpdfutuL_2_42Model> GetFuncpdfutuL_2_42Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpdfutuL_2_42Models = new List<FuncpdfutuL_2_42Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpdfutuL_2_42Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.update_date = packer.GetIntbyName("update_date", i);
                reqCommand.update_time = packer.GetIntbyName("update_time", i);
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
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.frozen_type = packer.GetIntbyName("frozen_type", i);
                reqCommand.occur_amt = packer.GetDoublebyName("occur_amt", i);
                reqCommand.expire_date = packer.GetIntbyName("expire_date", i);
                reqCommand.jour_status = packer.GetStrbyName("jour_status", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncpdfutuL_2_42Models.Add(reqCommand);
            }
            return FuncpdfutuL_2_42Models;
        }
 
        //逻辑_产品期货_资金_查询历史交易组资金冻结解冻流水
        public static List<FuncpdfutuL_2_42Model> GetFuncpdfutuL_2_42Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpdfutuL_2_42Models = new List<FuncpdfutuL_2_42Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpdfutuL_2_42Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    reqCommand.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    reqCommand.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    reqCommand.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
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
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.frozen_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_TYPE_INT);
                    reqCommand.occur_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_AMT_FLOAT);
                    reqCommand.expire_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXPIRE_DATE_INT);
                    reqCommand.jour_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_STATUS_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncpdfutuL_2_42Models.Add(reqCommand);
                }
            }
            return FuncpdfutuL_2_42Models;
        }
 
        //逻辑_产品期货_资金_查询资产账户资金
        public static List<FuncpdfutuL_2_57Model> GetFuncpdfutuL_2_57Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpdfutuL_2_57Models = new List<FuncpdfutuL_2_57Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpdfutuL_2_57Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.update_date = packer.GetIntbyName("update_date", i);
                reqCommand.update_time = packer.GetIntbyName("update_time", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.begin_amt = packer.GetDoublebyName("begin_amt", i);
                reqCommand.curr_amt = packer.GetDoublebyName("curr_amt", i);
                reqCommand.capt_margin = packer.GetDoublebyName("capt_margin", i);
                reqCommand.frozen_amt = packer.GetDoublebyName("frozen_amt", i);
                reqCommand.unfroz_amt = packer.GetDoublebyName("unfroz_amt", i);
                reqCommand.total_rece_amt = packer.GetDoublebyName("total_rece_amt", i);
                reqCommand.total_payab_amt = packer.GetDoublebyName("total_payab_amt", i);
                reqCommand.intrst_rate = packer.GetDoublebyName("intrst_rate", i);
                reqCommand.intrst_base_amt = packer.GetDoublebyName("intrst_base_amt", i);
                reqCommand.pre_entry_intrst_amt = packer.GetDoublebyName("pre_entry_intrst_amt", i);
 
                FuncpdfutuL_2_57Models.Add(reqCommand);
            }
            return FuncpdfutuL_2_57Models;
        }
 
        //逻辑_产品期货_资金_查询资产账户资金
        public static List<FuncpdfutuL_2_57Model> GetFuncpdfutuL_2_57Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpdfutuL_2_57Models = new List<FuncpdfutuL_2_57Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpdfutuL_2_57Model();
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
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.begin_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_AMT_FLOAT);
                    reqCommand.curr_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_AMT_FLOAT);
                    reqCommand.capt_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CAPT_MARGIN_FLOAT);
                    reqCommand.frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_AMT_FLOAT);
                    reqCommand.unfroz_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_AMT_FLOAT);
                    reqCommand.total_rece_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_RECE_AMT_FLOAT);
                    reqCommand.total_payab_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_PAYAB_AMT_FLOAT);
                    reqCommand.intrst_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_RATE_FLOAT);
                    reqCommand.intrst_base_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_BASE_AMT_FLOAT);
                    reqCommand.pre_entry_intrst_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ENTRY_INTRST_AMT_FLOAT);
                    FuncpdfutuL_2_57Models.Add(reqCommand);
                }
            }
            return FuncpdfutuL_2_57Models;
        }
 
        //逻辑_产品期货_资金_查询历史资产账户资金
        public static List<FuncpdfutuL_2_58Model> GetFuncpdfutuL_2_58Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpdfutuL_2_58Models = new List<FuncpdfutuL_2_58Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpdfutuL_2_58Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.update_date = packer.GetIntbyName("update_date", i);
                reqCommand.update_time = packer.GetIntbyName("update_time", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.begin_amt = packer.GetDoublebyName("begin_amt", i);
                reqCommand.curr_amt = packer.GetDoublebyName("curr_amt", i);
                reqCommand.capt_margin = packer.GetDoublebyName("capt_margin", i);
                reqCommand.frozen_amt = packer.GetDoublebyName("frozen_amt", i);
                reqCommand.unfroz_amt = packer.GetDoublebyName("unfroz_amt", i);
                reqCommand.total_rece_amt = packer.GetDoublebyName("total_rece_amt", i);
                reqCommand.total_payab_amt = packer.GetDoublebyName("total_payab_amt", i);
                reqCommand.intrst_rate = packer.GetDoublebyName("intrst_rate", i);
                reqCommand.intrst_base_amt = packer.GetDoublebyName("intrst_base_amt", i);
                reqCommand.pre_entry_intrst_amt = packer.GetDoublebyName("pre_entry_intrst_amt", i);
 
                FuncpdfutuL_2_58Models.Add(reqCommand);
            }
            return FuncpdfutuL_2_58Models;
        }
 
        //逻辑_产品期货_资金_查询历史资产账户资金
        public static List<FuncpdfutuL_2_58Model> GetFuncpdfutuL_2_58Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpdfutuL_2_58Models = new List<FuncpdfutuL_2_58Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpdfutuL_2_58Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    reqCommand.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    reqCommand.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    reqCommand.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.begin_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_AMT_FLOAT);
                    reqCommand.curr_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_AMT_FLOAT);
                    reqCommand.capt_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CAPT_MARGIN_FLOAT);
                    reqCommand.frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_AMT_FLOAT);
                    reqCommand.unfroz_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_AMT_FLOAT);
                    reqCommand.total_rece_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_RECE_AMT_FLOAT);
                    reqCommand.total_payab_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_PAYAB_AMT_FLOAT);
                    reqCommand.intrst_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_RATE_FLOAT);
                    reqCommand.intrst_base_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_BASE_AMT_FLOAT);
                    reqCommand.pre_entry_intrst_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ENTRY_INTRST_AMT_FLOAT);
                    FuncpdfutuL_2_58Models.Add(reqCommand);
                }
            }
            return FuncpdfutuL_2_58Models;
        }
 
        //逻辑_产品期货_资金_查询资产账户资金流水
        public static List<FuncpdfutuL_2_59Model> GetFuncpdfutuL_2_59Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpdfutuL_2_59Models = new List<FuncpdfutuL_2_59Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpdfutuL_2_59Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.update_date = packer.GetIntbyName("update_date", i);
                reqCommand.update_time = packer.GetIntbyName("update_time", i);
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
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.busi_flag = packer.GetIntbyName("busi_flag", i);
                reqCommand.occur_amt = packer.GetDoublebyName("occur_amt", i);
                reqCommand.occur_end_amt = packer.GetDoublebyName("occur_end_amt", i);
                reqCommand.jour_occur_field = packer.GetStrbyName("jour_occur_field", i);
                reqCommand.jour_after_occur_info = packer.GetStrbyName("jour_after_occur_info", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncpdfutuL_2_59Models.Add(reqCommand);
            }
            return FuncpdfutuL_2_59Models;
        }
 
        //逻辑_产品期货_资金_查询资产账户资金流水
        public static List<FuncpdfutuL_2_59Model> GetFuncpdfutuL_2_59Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpdfutuL_2_59Models = new List<FuncpdfutuL_2_59Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpdfutuL_2_59Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    reqCommand.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    reqCommand.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    reqCommand.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
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
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.busi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT);
                    reqCommand.occur_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_AMT_FLOAT);
                    reqCommand.occur_end_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_END_AMT_FLOAT);
                    reqCommand.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    reqCommand.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncpdfutuL_2_59Models.Add(reqCommand);
                }
            }
            return FuncpdfutuL_2_59Models;
        }
 
        //逻辑_产品期货_资金_查询历史资产账户资金流水
        public static List<FuncpdfutuL_2_60Model> GetFuncpdfutuL_2_60Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpdfutuL_2_60Models = new List<FuncpdfutuL_2_60Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpdfutuL_2_60Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.update_date = packer.GetIntbyName("update_date", i);
                reqCommand.update_time = packer.GetIntbyName("update_time", i);
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
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.busi_flag = packer.GetIntbyName("busi_flag", i);
                reqCommand.occur_amt = packer.GetDoublebyName("occur_amt", i);
                reqCommand.occur_end_amt = packer.GetDoublebyName("occur_end_amt", i);
                reqCommand.jour_occur_field = packer.GetStrbyName("jour_occur_field", i);
                reqCommand.jour_after_occur_info = packer.GetStrbyName("jour_after_occur_info", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncpdfutuL_2_60Models.Add(reqCommand);
            }
            return FuncpdfutuL_2_60Models;
        }
 
        //逻辑_产品期货_资金_查询历史资产账户资金流水
        public static List<FuncpdfutuL_2_60Model> GetFuncpdfutuL_2_60Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpdfutuL_2_60Models = new List<FuncpdfutuL_2_60Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpdfutuL_2_60Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    reqCommand.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    reqCommand.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    reqCommand.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
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
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.busi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT);
                    reqCommand.occur_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_AMT_FLOAT);
                    reqCommand.occur_end_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_END_AMT_FLOAT);
                    reqCommand.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    reqCommand.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncpdfutuL_2_60Models.Add(reqCommand);
                }
            }
            return FuncpdfutuL_2_60Models;
        }
 
        //逻辑_产品期货_资金_查询资产账户资金冻结解冻流水
        public static List<FuncpdfutuL_2_61Model> GetFuncpdfutuL_2_61Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpdfutuL_2_61Models = new List<FuncpdfutuL_2_61Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpdfutuL_2_61Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.update_date = packer.GetIntbyName("update_date", i);
                reqCommand.update_time = packer.GetIntbyName("update_time", i);
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
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.frozen_type = packer.GetIntbyName("frozen_type", i);
                reqCommand.occur_amt = packer.GetDoublebyName("occur_amt", i);
                reqCommand.expire_date = packer.GetIntbyName("expire_date", i);
                reqCommand.jour_status = packer.GetStrbyName("jour_status", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncpdfutuL_2_61Models.Add(reqCommand);
            }
            return FuncpdfutuL_2_61Models;
        }
 
        //逻辑_产品期货_资金_查询资产账户资金冻结解冻流水
        public static List<FuncpdfutuL_2_61Model> GetFuncpdfutuL_2_61Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpdfutuL_2_61Models = new List<FuncpdfutuL_2_61Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpdfutuL_2_61Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    reqCommand.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    reqCommand.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    reqCommand.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
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
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.frozen_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_TYPE_INT);
                    reqCommand.occur_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_AMT_FLOAT);
                    reqCommand.expire_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXPIRE_DATE_INT);
                    reqCommand.jour_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_STATUS_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncpdfutuL_2_61Models.Add(reqCommand);
                }
            }
            return FuncpdfutuL_2_61Models;
        }
 
        //逻辑_产品期货_资金_查询历史资产账户资金冻结解冻流水
        public static List<FuncpdfutuL_2_62Model> GetFuncpdfutuL_2_62Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpdfutuL_2_62Models = new List<FuncpdfutuL_2_62Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpdfutuL_2_62Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.update_date = packer.GetIntbyName("update_date", i);
                reqCommand.update_time = packer.GetIntbyName("update_time", i);
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
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.frozen_type = packer.GetIntbyName("frozen_type", i);
                reqCommand.occur_amt = packer.GetDoublebyName("occur_amt", i);
                reqCommand.expire_date = packer.GetIntbyName("expire_date", i);
                reqCommand.jour_status = packer.GetStrbyName("jour_status", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncpdfutuL_2_62Models.Add(reqCommand);
            }
            return FuncpdfutuL_2_62Models;
        }
 
        //逻辑_产品期货_资金_查询历史资产账户资金冻结解冻流水
        public static List<FuncpdfutuL_2_62Model> GetFuncpdfutuL_2_62Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpdfutuL_2_62Models = new List<FuncpdfutuL_2_62Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpdfutuL_2_62Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    reqCommand.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    reqCommand.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    reqCommand.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
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
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.frozen_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_TYPE_INT);
                    reqCommand.occur_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_AMT_FLOAT);
                    reqCommand.expire_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXPIRE_DATE_INT);
                    reqCommand.jour_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_STATUS_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncpdfutuL_2_62Models.Add(reqCommand);
                }
            }
            return FuncpdfutuL_2_62Models;
        }
 
        //逻辑_产品期货_资金_转入外部资金
        public static List<FuncpdfutuL_2_101Model> GetFuncpdfutuL_2_101Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpdfutuL_2_101Models = new List<FuncpdfutuL_2_101Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpdfutuL_2_101Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
 
                FuncpdfutuL_2_101Models.Add(reqCommand);
            }
            return FuncpdfutuL_2_101Models;
        }
 
        //逻辑_产品期货_资金_转入外部资金
        public static List<FuncpdfutuL_2_101Model> GetFuncpdfutuL_2_101Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpdfutuL_2_101Models = new List<FuncpdfutuL_2_101Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncpdfutuL_2_101Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                FuncpdfutuL_2_101Models.Add(reqCommand);
            }
            return FuncpdfutuL_2_101Models;
        }
 
    }
}
