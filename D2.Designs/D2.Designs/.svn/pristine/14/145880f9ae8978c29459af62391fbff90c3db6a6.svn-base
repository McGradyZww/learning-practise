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

    public static class EvaBasic
    {
        //逻辑_平台估值_基础参数_查询估值科目
        public static List<FuncevaL_1_4Model> GetFuncevaL_1_4Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncevaL_1_4Models = new List<FuncevaL_1_4Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncevaL_1_4Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.fina_acco_code = packer.GetStrbyName("fina_acco_code", i);
                reqCommand.fina_acco_name = packer.GetStrbyName("fina_acco_name", i);
                reqCommand.fina_acco_level = packer.GetIntbyName("fina_acco_level", i);
                reqCommand.exch_no_str = packer.GetStrbyName("exch_no_str", i);
                reqCommand.pd_asset_type_str = packer.GetStrbyName("pd_asset_type_str", i);
                reqCommand.pd_fee_type_str = packer.GetStrbyName("pd_fee_type_str", i);
 
                FuncevaL_1_4Models.Add(reqCommand);
            }
            return FuncevaL_1_4Models;
        }
 
        //逻辑_平台估值_基础参数_查询估值科目
        public static List<FuncevaL_1_4Model> GetFuncevaL_1_4Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncevaL_1_4Models = new List<FuncevaL_1_4Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncevaL_1_4Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.fina_acco_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FINA_ACCO_CODE_STR);
                    reqCommand.fina_acco_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FINA_ACCO_NAME_STR);
                    reqCommand.fina_acco_level = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FINA_ACCO_LEVEL_INT);
                    reqCommand.exch_no_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR);
                    reqCommand.pd_asset_type_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_ASSET_TYPE_STR_STR);
                    reqCommand.pd_fee_type_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_FEE_TYPE_STR_STR);
                    FuncevaL_1_4Models.Add(reqCommand);
                }
            }
            return FuncevaL_1_4Models;
        }
 
        //逻辑_平台估值_基础参数_查询估值产品信息
        public static List<FuncevaL_1_14Model> GetFuncevaL_1_14Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncevaL_1_14Models = new List<FuncevaL_1_14Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncevaL_1_14Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.pd_begin_share = packer.GetDoublebyName("pd_begin_share", i);
                reqCommand.pd_curr_share = packer.GetDoublebyName("pd_curr_share", i);
                reqCommand.target_pd_code = packer.GetStrbyName("target_pd_code", i);
                reqCommand.task_status = packer.GetStrbyName("task_status", i);
                reqCommand.is_auto_push = packer.GetStrbyName("is_auto_push", i);
                reqCommand.is_sync_netvalue = packer.GetIntbyName("is_sync_netvalue", i);
                reqCommand.unit_evalu = packer.GetIntbyName("unit_evalu", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncevaL_1_14Models.Add(reqCommand);
            }
            return FuncevaL_1_14Models;
        }
 
        //逻辑_平台估值_基础参数_查询估值产品信息
        public static List<FuncevaL_1_14Model> GetFuncevaL_1_14Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncevaL_1_14Models = new List<FuncevaL_1_14Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncevaL_1_14Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.pd_begin_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_BEGIN_SHARE_FLOAT);
                    reqCommand.pd_curr_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_CURR_SHARE_FLOAT);
                    reqCommand.target_pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_PD_CODE_STR);
                    reqCommand.task_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STATUS_STR);
                    reqCommand.is_auto_push = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_IS_AUTO_PUSH_STR);
                    reqCommand.is_sync_netvalue = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_SYNC_NETVALUE_INT);
                    reqCommand.unit_evalu = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_EVALU_INT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncevaL_1_14Models.Add(reqCommand);
                }
            }
            return FuncevaL_1_14Models;
        }
 
        //逻辑_平台估值_基础参数_查询估值产品邮箱配置
        public static List<FuncevaL_1_15Model> GetFuncevaL_1_15Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncevaL_1_15Models = new List<FuncevaL_1_15Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncevaL_1_15Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.mail_server = packer.GetStrbyName("mail_server", i);
                reqCommand.server_type = packer.GetIntbyName("server_type", i);
                reqCommand.mail_server_protocol = packer.GetStrbyName("mail_server_protocol", i);
                reqCommand.mail_server_port = packer.GetIntbyName("mail_server_port", i);
                reqCommand.mail_server_username = packer.GetStrbyName("mail_server_username", i);
                reqCommand.mail_server_password = packer.GetStrbyName("mail_server_password", i);
                reqCommand.ssl_type = packer.GetIntbyName("ssl_type", i);
                reqCommand.send_from = packer.GetStrbyName("send_from", i);
                reqCommand.mail_subject = packer.GetStrbyName("mail_subject", i);
                reqCommand.netvalue_posi = packer.GetStrbyName("netvalue_posi", i);
                reqCommand.netvalue_date_posi = packer.GetStrbyName("netvalue_date_posi", i);
                reqCommand.dateformat_type = packer.GetIntbyName("dateformat_type", i);
 
                FuncevaL_1_15Models.Add(reqCommand);
            }
            return FuncevaL_1_15Models;
        }
 
        //逻辑_平台估值_基础参数_查询估值产品邮箱配置
        public static List<FuncevaL_1_15Model> GetFuncevaL_1_15Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncevaL_1_15Models = new List<FuncevaL_1_15Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncevaL_1_15Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.mail_server = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MAIL_SERVER_STR);
                    reqCommand.server_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SERVER_TYPE_INT);
                    reqCommand.mail_server_protocol = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MAIL_SERVER_PROTOCOL_STR);
                    reqCommand.mail_server_port = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MAIL_SERVER_PORT_INT);
                    reqCommand.mail_server_username = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MAIL_SERVER_USERNAME_STR);
                    reqCommand.mail_server_password = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MAIL_SERVER_PASSWORD_STR);
                    reqCommand.ssl_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SSL_TYPE_INT);
                    reqCommand.send_from = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_SEND_FROM_STR);
                    reqCommand.mail_subject = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MAIL_SUBJECT_STR);
                    reqCommand.netvalue_posi = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_NETVALUE_POSI_STR);
                    reqCommand.netvalue_date_posi = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_NETVALUE_DATE_POSI_STR);
                    reqCommand.dateformat_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DATEFORMAT_TYPE_INT);
                    FuncevaL_1_15Models.Add(reqCommand);
                }
            }
            return FuncevaL_1_15Models;
        }
 
        //逻辑_平台估值_基础参数_查询估值产品费率
        public static List<FuncevaL_1_24Model> GetFuncevaL_1_24Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncevaL_1_24Models = new List<FuncevaL_1_24Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncevaL_1_24Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.pd_fee_type = packer.GetIntbyName("pd_fee_type", i);
                reqCommand.pd_fee_rate = packer.GetDoublebyName("pd_fee_rate", i);
                reqCommand.pd_fee_circle = packer.GetIntbyName("pd_fee_circle", i);
                reqCommand.min_fee = packer.GetDoublebyName("min_fee", i);
                reqCommand.calc_fee_date_str = packer.GetStrbyName("calc_fee_date_str", i);
                reqCommand.eva_calc_type = packer.GetIntbyName("eva_calc_type", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncevaL_1_24Models.Add(reqCommand);
            }
            return FuncevaL_1_24Models;
        }
 
        //逻辑_平台估值_基础参数_查询估值产品费率
        public static List<FuncevaL_1_24Model> GetFuncevaL_1_24Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncevaL_1_24Models = new List<FuncevaL_1_24Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncevaL_1_24Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.pd_fee_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_FEE_TYPE_INT);
                    reqCommand.pd_fee_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_FEE_RATE_FLOAT);
                    reqCommand.pd_fee_circle = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_FEE_CIRCLE_INT);
                    reqCommand.min_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_FEE_FLOAT);
                    reqCommand.calc_fee_date_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CALC_FEE_DATE_STR_STR);
                    reqCommand.eva_calc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EVA_CALC_TYPE_INT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncevaL_1_24Models.Add(reqCommand);
                }
            }
            return FuncevaL_1_24Models;
        }
 
        //逻辑_平台估值_基础参数_查询估值产品利率
        public static List<FuncevaL_1_34Model> GetFuncevaL_1_34Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncevaL_1_34Models = new List<FuncevaL_1_34Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncevaL_1_34Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.pd_rate_type = packer.GetIntbyName("pd_rate_type", i);
                reqCommand.asset_acco = packer.GetStrbyName("asset_acco", i);
                reqCommand.intrst_rate = packer.GetDoublebyName("intrst_rate", i);
                reqCommand.pd_fee_circle = packer.GetIntbyName("pd_fee_circle", i);
                reqCommand.min_interest = packer.GetDoublebyName("min_interest", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncevaL_1_34Models.Add(reqCommand);
            }
            return FuncevaL_1_34Models;
        }
 
        //逻辑_平台估值_基础参数_查询估值产品利率
        public static List<FuncevaL_1_34Model> GetFuncevaL_1_34Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncevaL_1_34Models = new List<FuncevaL_1_34Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncevaL_1_34Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.pd_rate_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_RATE_TYPE_INT);
                    reqCommand.asset_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STR);
                    reqCommand.intrst_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_RATE_FLOAT);
                    reqCommand.pd_fee_circle = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_FEE_CIRCLE_INT);
                    reqCommand.min_interest = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_INTEREST_FLOAT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncevaL_1_34Models.Add(reqCommand);
                }
            }
            return FuncevaL_1_34Models;
        }
 
        //逻辑_平台估值_基础参数_查询估值产品份额流水
        public static List<FuncevaL_1_45Model> GetFuncevaL_1_45Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncevaL_1_45Models = new List<FuncevaL_1_45Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncevaL_1_45Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.occur_dir = packer.GetIntbyName("occur_dir", i);
                reqCommand.share_oper = packer.GetIntbyName("share_oper", i);
                reqCommand.occur_share = packer.GetDoublebyName("occur_share", i);
                reqCommand.occur_amt = packer.GetDoublebyName("occur_amt", i);
                reqCommand.arrive_date = packer.GetIntbyName("arrive_date", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncevaL_1_45Models.Add(reqCommand);
            }
            return FuncevaL_1_45Models;
        }
 
        //逻辑_平台估值_基础参数_查询估值产品份额流水
        public static List<FuncevaL_1_45Model> GetFuncevaL_1_45Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncevaL_1_45Models = new List<FuncevaL_1_45Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncevaL_1_45Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.occur_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_DIR_INT);
                    reqCommand.share_oper = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SHARE_OPER_INT);
                    reqCommand.occur_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_SHARE_FLOAT);
                    reqCommand.occur_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_AMT_FLOAT);
                    reqCommand.arrive_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ARRIVE_DATE_INT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncevaL_1_45Models.Add(reqCommand);
                }
            }
            return FuncevaL_1_45Models;
        }
 
        //逻辑_平台估值_基础参数_查询估值产品累计净值配置
        public static List<FuncevaL_1_54Model> GetFuncevaL_1_54Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncevaL_1_54Models = new List<FuncevaL_1_54Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncevaL_1_54Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.divide_type = packer.GetIntbyName("divide_type", i);
                reqCommand.pd_curr_share = packer.GetDoublebyName("pd_curr_share", i);
                reqCommand.divi_amt = packer.GetDoublebyName("divi_amt", i);
                reqCommand.unit_divi_amt = packer.GetDoublebyName("unit_divi_amt", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncevaL_1_54Models.Add(reqCommand);
            }
            return FuncevaL_1_54Models;
        }
 
        //逻辑_平台估值_基础参数_查询估值产品累计净值配置
        public static List<FuncevaL_1_54Model> GetFuncevaL_1_54Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncevaL_1_54Models = new List<FuncevaL_1_54Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncevaL_1_54Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.divide_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DIVIDE_TYPE_INT);
                    reqCommand.pd_curr_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_CURR_SHARE_FLOAT);
                    reqCommand.divi_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DIVI_AMT_FLOAT);
                    reqCommand.unit_divi_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_DIVI_AMT_FLOAT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncevaL_1_54Models.Add(reqCommand);
                }
            }
            return FuncevaL_1_54Models;
        }
 
        //逻辑_平台估值_基础参数_查询估值产品增值税率
        public static List<FuncevaL_1_58Model> GetFuncevaL_1_58Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncevaL_1_58Models = new List<FuncevaL_1_58Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncevaL_1_58Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.vat_rate = packer.GetDoublebyName("vat_rate", i);
                reqCommand.vat_add_rate = packer.GetDoublebyName("vat_add_rate", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncevaL_1_58Models.Add(reqCommand);
            }
            return FuncevaL_1_58Models;
        }
 
        //逻辑_平台估值_基础参数_查询估值产品增值税率
        public static List<FuncevaL_1_58Model> GetFuncevaL_1_58Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncevaL_1_58Models = new List<FuncevaL_1_58Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncevaL_1_58Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.vat_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VAT_RATE_FLOAT);
                    reqCommand.vat_add_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VAT_ADD_RATE_FLOAT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncevaL_1_58Models.Add(reqCommand);
                }
            }
            return FuncevaL_1_58Models;
        }
 
    }
}
