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

    public static class ValCheck
    {
        //逻辑_独立估值_查询核对_查询估值表邮箱配置
        public static List<FuncvalL_4_3Model> GetFuncvalL_4_3Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncvalL_4_3Models = new List<FuncvalL_4_3Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncvalL_4_3Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.mail_server = packer.GetStrbyName("mail_server", i);
                reqCommand.server_type = packer.GetIntbyName("server_type", i);
                reqCommand.mail_server_protocol = packer.GetStrbyName("mail_server_protocol", i);
                reqCommand.mail_server_port = packer.GetIntbyName("mail_server_port", i);
                reqCommand.mail_server_username = packer.GetStrbyName("mail_server_username", i);
                reqCommand.mail_server_password = packer.GetStrbyName("mail_server_password", i);
                reqCommand.ssl_type = packer.GetIntbyName("ssl_type", i);
                reqCommand.rule_flag = packer.GetIntbyName("rule_flag", i);
 
                FuncvalL_4_3Models.Add(reqCommand);
            }
            return FuncvalL_4_3Models;
        }
 
        //逻辑_独立估值_查询核对_查询估值表邮箱配置
        public static List<FuncvalL_4_3Model> GetFuncvalL_4_3Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncvalL_4_3Models = new List<FuncvalL_4_3Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncvalL_4_3Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.mail_server = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MAIL_SERVER_STR);
                    reqCommand.server_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SERVER_TYPE_INT);
                    reqCommand.mail_server_protocol = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MAIL_SERVER_PROTOCOL_STR);
                    reqCommand.mail_server_port = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MAIL_SERVER_PORT_INT);
                    reqCommand.mail_server_username = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MAIL_SERVER_USERNAME_STR);
                    reqCommand.mail_server_password = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MAIL_SERVER_PASSWORD_STR);
                    reqCommand.ssl_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SSL_TYPE_INT);
                    reqCommand.rule_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RULE_FLAG_INT);
                    FuncvalL_4_3Models.Add(reqCommand);
                }
            }
            return FuncvalL_4_3Models;
        }
 
        //逻辑_独立估值_查询核对_查询托管估值表配置
        public static List<FuncvalL_4_13Model> GetFuncvalL_4_13Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncvalL_4_13Models = new List<FuncvalL_4_13Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncvalL_4_13Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.file_name = packer.GetStrbyName("file_name", i);
                reqCommand.netvalue_date_posi = packer.GetStrbyName("netvalue_date_posi", i);
                reqCommand.valtable_begin_row = packer.GetIntbyName("valtable_begin_row", i);
                reqCommand.fina_acco_code = packer.GetStrbyName("fina_acco_code", i);
                reqCommand.fina_acco_name = packer.GetStrbyName("fina_acco_name", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.amount = packer.GetStrbyName("amount", i);
                reqCommand.unit_cost = packer.GetStrbyName("unit_cost", i);
                reqCommand.prime_cost_original = packer.GetStrbyName("prime_cost_original", i);
                reqCommand.prime_cost_crncy = packer.GetStrbyName("prime_cost_crncy", i);
                reqCommand.cost_net_ratio = packer.GetStrbyName("cost_net_ratio", i);
                reqCommand.market_price = packer.GetStrbyName("market_price", i);
                reqCommand.market_value_original = packer.GetStrbyName("market_value_original", i);
                reqCommand.market_value_crncy = packer.GetStrbyName("market_value_crncy", i);
                reqCommand.market_net_ratio = packer.GetStrbyName("market_net_ratio", i);
                reqCommand.evalu_add_original = packer.GetStrbyName("evalu_add_original", i);
                reqCommand.evalu_add_crncy = packer.GetStrbyName("evalu_add_crncy", i);
                reqCommand.stop_info = packer.GetStrbyName("stop_info", i);
                reqCommand.rights_info = packer.GetStrbyName("rights_info", i);
 
                FuncvalL_4_13Models.Add(reqCommand);
            }
            return FuncvalL_4_13Models;
        }
 
        //逻辑_独立估值_查询核对_查询托管估值表配置
        public static List<FuncvalL_4_13Model> GetFuncvalL_4_13Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncvalL_4_13Models = new List<FuncvalL_4_13Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncvalL_4_13Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.file_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FILE_NAME_STR);
                    reqCommand.netvalue_date_posi = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_NETVALUE_DATE_POSI_STR);
                    reqCommand.valtable_begin_row = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_VALTABLE_BEGIN_ROW_INT);
                    reqCommand.fina_acco_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FINA_ACCO_CODE_STR);
                    reqCommand.fina_acco_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FINA_ACCO_NAME_STR);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.amount = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_AMOUNT_STR);
                    reqCommand.unit_cost = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_COST_STR);
                    reqCommand.prime_cost_original = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PRIME_COST_ORIGINAL_STR);
                    reqCommand.prime_cost_crncy = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PRIME_COST_CRNCY_STR);
                    reqCommand.cost_net_ratio = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COST_NET_RATIO_STR);
                    reqCommand.market_price = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_PRICE_STR);
                    reqCommand.market_value_original = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_VALUE_ORIGINAL_STR);
                    reqCommand.market_value_crncy = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_VALUE_CRNCY_STR);
                    reqCommand.market_net_ratio = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_NET_RATIO_STR);
                    reqCommand.evalu_add_original = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EVALU_ADD_ORIGINAL_STR);
                    reqCommand.evalu_add_crncy = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EVALU_ADD_CRNCY_STR);
                    reqCommand.stop_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOP_INFO_STR);
                    reqCommand.rights_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RIGHTS_INFO_STR);
                    FuncvalL_4_13Models.Add(reqCommand);
                }
            }
            return FuncvalL_4_13Models;
        }
 
        //逻辑_独立估值_查询核对_查询托管估值表
        public static List<FuncvalL_4_22Model> GetFuncvalL_4_22Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncvalL_4_22Models = new List<FuncvalL_4_22Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncvalL_4_22Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.evalu_date = packer.GetIntbyName("evalu_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.valtable_no = packer.GetIntbyName("valtable_no", i);
                reqCommand.fina_acco_code = packer.GetStrbyName("fina_acco_code", i);
                reqCommand.fina_acco_name = packer.GetStrbyName("fina_acco_name", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.amount = packer.GetStrbyName("amount", i);
                reqCommand.unit_cost = packer.GetStrbyName("unit_cost", i);
                reqCommand.prime_cost_original = packer.GetStrbyName("prime_cost_original", i);
                reqCommand.prime_cost_crncy = packer.GetStrbyName("prime_cost_crncy", i);
                reqCommand.cost_net_ratio = packer.GetStrbyName("cost_net_ratio", i);
                reqCommand.market_price = packer.GetStrbyName("market_price", i);
                reqCommand.market_value_original = packer.GetStrbyName("market_value_original", i);
                reqCommand.market_value_crncy = packer.GetStrbyName("market_value_crncy", i);
                reqCommand.market_net_ratio = packer.GetStrbyName("market_net_ratio", i);
                reqCommand.evalu_add_original = packer.GetStrbyName("evalu_add_original", i);
                reqCommand.evalu_add_crncy = packer.GetStrbyName("evalu_add_crncy", i);
                reqCommand.stop_info = packer.GetStrbyName("stop_info", i);
                reqCommand.rights_info = packer.GetStrbyName("rights_info", i);
 
                FuncvalL_4_22Models.Add(reqCommand);
            }
            return FuncvalL_4_22Models;
        }
 
        //逻辑_独立估值_查询核对_查询托管估值表
        public static List<FuncvalL_4_22Model> GetFuncvalL_4_22Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncvalL_4_22Models = new List<FuncvalL_4_22Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncvalL_4_22Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.evalu_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EVALU_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.valtable_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_VALTABLE_NO_INT);
                    reqCommand.fina_acco_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FINA_ACCO_CODE_STR);
                    reqCommand.fina_acco_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FINA_ACCO_NAME_STR);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.amount = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_AMOUNT_STR);
                    reqCommand.unit_cost = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_COST_STR);
                    reqCommand.prime_cost_original = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PRIME_COST_ORIGINAL_STR);
                    reqCommand.prime_cost_crncy = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PRIME_COST_CRNCY_STR);
                    reqCommand.cost_net_ratio = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COST_NET_RATIO_STR);
                    reqCommand.market_price = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_PRICE_STR);
                    reqCommand.market_value_original = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_VALUE_ORIGINAL_STR);
                    reqCommand.market_value_crncy = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_VALUE_CRNCY_STR);
                    reqCommand.market_net_ratio = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_NET_RATIO_STR);
                    reqCommand.evalu_add_original = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EVALU_ADD_ORIGINAL_STR);
                    reqCommand.evalu_add_crncy = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EVALU_ADD_CRNCY_STR);
                    reqCommand.stop_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOP_INFO_STR);
                    reqCommand.rights_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RIGHTS_INFO_STR);
                    FuncvalL_4_22Models.Add(reqCommand);
                }
            }
            return FuncvalL_4_22Models;
        }
 
    }
}
