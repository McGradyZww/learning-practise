using LdNet.ClientSdk.Model;
using LdNet.ClientCore.Sdk;
using LdNet.Communication;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using LDsdkDefineEx;

namespace LdNet.ClientSdk.Response
{
    public class valL_4_1_Response : IResponse
    {
        #region 构造函数
        public valL_4_1_Response()
        {
            this.valL_4_1_InfoList = new ObservableCollection<valL_4_1_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<valL_4_1_Info> valL_4_1_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            valL_4_1_Info info = new valL_4_1_Info();
            valL_4_1_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            valL_4_1_InfoList.Add((valL_4_1_Info)info);
        }
        #endregion

        //逻辑_独立估值_查询核对_新增估值表邮箱配置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new valL_4_1_Info();
                valL_4_1_InfoList.Add(info);
            }
        }
    }

    public class valL_4_2_Response : IResponse
    {
        #region 构造函数
        public valL_4_2_Response()
        {
            this.valL_4_2_InfoList = new ObservableCollection<valL_4_2_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<valL_4_2_Info> valL_4_2_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            valL_4_2_Info info = new valL_4_2_Info();
            valL_4_2_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            valL_4_2_InfoList.Add((valL_4_2_Info)info);
        }
        #endregion

        //逻辑_独立估值_查询核对_修改估值表邮箱配置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new valL_4_2_Info();
                valL_4_2_InfoList.Add(info);
            }
        }
    }

    public class valL_4_3_Response : IResponse
    {
        #region 构造函数
        public valL_4_3_Response()
        {
            this.valL_4_3_InfoList = new ObservableCollection<valL_4_3_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<valL_4_3_Info> valL_4_3_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            valL_4_3_Info info = new valL_4_3_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.mail_server = unpacker.GetStr("mail_server");
            info.server_type = unpacker.GetInt("server_type");
            info.mail_server_protocol = unpacker.GetStr("mail_server_protocol");
            info.mail_server_port = unpacker.GetInt("mail_server_port");
            info.mail_server_username = unpacker.GetStr("mail_server_username");
            info.mail_server_password = unpacker.GetStr("mail_server_password");
            info.ssl_type = unpacker.GetInt("ssl_type");
            info.rule_flag = unpacker.GetInt("rule_flag");
            valL_4_3_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            valL_4_3_InfoList.Add((valL_4_3_Info)info);
        }
        #endregion

        //逻辑_独立估值_查询核对_查询估值表邮箱配置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new valL_4_3_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.mail_server = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MAIL_SERVER_STR);
                    info.server_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SERVER_TYPE_INT);
                    info.mail_server_protocol = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MAIL_SERVER_PROTOCOL_STR);
                    info.mail_server_port = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MAIL_SERVER_PORT_INT);
                    info.mail_server_username = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MAIL_SERVER_USERNAME_STR);
                    info.mail_server_password = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MAIL_SERVER_PASSWORD_STR);
                    info.ssl_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SSL_TYPE_INT);
                    info.rule_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RULE_FLAG_INT);
                    valL_4_3_InfoList.Add(info);
                }
            }
        }
    }

    public class valL_4_11_Response : IResponse
    {
        #region 构造函数
        public valL_4_11_Response()
        {
            this.valL_4_11_InfoList = new ObservableCollection<valL_4_11_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<valL_4_11_Info> valL_4_11_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            valL_4_11_Info info = new valL_4_11_Info();
            valL_4_11_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            valL_4_11_InfoList.Add((valL_4_11_Info)info);
        }
        #endregion

        //逻辑_独立估值_查询核对_新增托管估值表配置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new valL_4_11_Info();
                valL_4_11_InfoList.Add(info);
            }
        }
    }

    public class valL_4_12_Response : IResponse
    {
        #region 构造函数
        public valL_4_12_Response()
        {
            this.valL_4_12_InfoList = new ObservableCollection<valL_4_12_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<valL_4_12_Info> valL_4_12_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            valL_4_12_Info info = new valL_4_12_Info();
            valL_4_12_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            valL_4_12_InfoList.Add((valL_4_12_Info)info);
        }
        #endregion

        //逻辑_独立估值_查询核对_修改托管估值表配置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new valL_4_12_Info();
                valL_4_12_InfoList.Add(info);
            }
        }
    }

    public class valL_4_13_Response : IResponse
    {
        #region 构造函数
        public valL_4_13_Response()
        {
            this.valL_4_13_InfoList = new ObservableCollection<valL_4_13_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<valL_4_13_Info> valL_4_13_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            valL_4_13_Info info = new valL_4_13_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.file_name = unpacker.GetStr("file_name");
            info.netvalue_date_posi = unpacker.GetStr("netvalue_date_posi");
            info.valtable_begin_row = unpacker.GetInt("valtable_begin_row");
            info.fina_acco_code = unpacker.GetStr("fina_acco_code");
            info.fina_acco_name = unpacker.GetStr("fina_acco_name");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.amount = unpacker.GetStr("amount");
            info.unit_cost = unpacker.GetStr("unit_cost");
            info.prime_cost_original = unpacker.GetStr("prime_cost_original");
            info.prime_cost_crncy = unpacker.GetStr("prime_cost_crncy");
            info.cost_net_ratio = unpacker.GetStr("cost_net_ratio");
            info.market_price = unpacker.GetStr("market_price");
            info.market_value_original = unpacker.GetStr("market_value_original");
            info.market_value_crncy = unpacker.GetStr("market_value_crncy");
            info.market_net_ratio = unpacker.GetStr("market_net_ratio");
            info.evalu_add_original = unpacker.GetStr("evalu_add_original");
            info.evalu_add_crncy = unpacker.GetStr("evalu_add_crncy");
            info.stop_info = unpacker.GetStr("stop_info");
            info.rights_info = unpacker.GetStr("rights_info");
            valL_4_13_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            valL_4_13_InfoList.Add((valL_4_13_Info)info);
        }
        #endregion

        //逻辑_独立估值_查询核对_查询托管估值表配置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new valL_4_13_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.file_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FILE_NAME_STR);
                    info.netvalue_date_posi = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_NETVALUE_DATE_POSI_STR);
                    info.valtable_begin_row = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_VALTABLE_BEGIN_ROW_INT);
                    info.fina_acco_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FINA_ACCO_CODE_STR);
                    info.fina_acco_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FINA_ACCO_NAME_STR);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.amount = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_AMOUNT_STR);
                    info.unit_cost = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_COST_STR);
                    info.prime_cost_original = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PRIME_COST_ORIGINAL_STR);
                    info.prime_cost_crncy = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PRIME_COST_CRNCY_STR);
                    info.cost_net_ratio = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COST_NET_RATIO_STR);
                    info.market_price = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_PRICE_STR);
                    info.market_value_original = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_VALUE_ORIGINAL_STR);
                    info.market_value_crncy = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_VALUE_CRNCY_STR);
                    info.market_net_ratio = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_NET_RATIO_STR);
                    info.evalu_add_original = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EVALU_ADD_ORIGINAL_STR);
                    info.evalu_add_crncy = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EVALU_ADD_CRNCY_STR);
                    info.stop_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOP_INFO_STR);
                    info.rights_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RIGHTS_INFO_STR);
                    valL_4_13_InfoList.Add(info);
                }
            }
        }
    }

    public class valL_4_21_Response : IResponse
    {
        #region 构造函数
        public valL_4_21_Response()
        {
            this.valL_4_21_InfoList = new ObservableCollection<valL_4_21_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<valL_4_21_Info> valL_4_21_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            valL_4_21_Info info = new valL_4_21_Info();
            valL_4_21_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            valL_4_21_InfoList.Add((valL_4_21_Info)info);
        }
        #endregion

        //逻辑_独立估值_查询核对_新增托管估值表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new valL_4_21_Info();
                valL_4_21_InfoList.Add(info);
            }
        }
    }

    public class valL_4_22_Response : IResponse
    {
        #region 构造函数
        public valL_4_22_Response()
        {
            this.valL_4_22_InfoList = new ObservableCollection<valL_4_22_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<valL_4_22_Info> valL_4_22_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            valL_4_22_Info info = new valL_4_22_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.evalu_date = unpacker.GetInt("evalu_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.valtable_no = unpacker.GetInt("valtable_no");
            info.fina_acco_code = unpacker.GetStr("fina_acco_code");
            info.fina_acco_name = unpacker.GetStr("fina_acco_name");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.amount = unpacker.GetStr("amount");
            info.unit_cost = unpacker.GetStr("unit_cost");
            info.prime_cost_original = unpacker.GetStr("prime_cost_original");
            info.prime_cost_crncy = unpacker.GetStr("prime_cost_crncy");
            info.cost_net_ratio = unpacker.GetStr("cost_net_ratio");
            info.market_price = unpacker.GetStr("market_price");
            info.market_value_original = unpacker.GetStr("market_value_original");
            info.market_value_crncy = unpacker.GetStr("market_value_crncy");
            info.market_net_ratio = unpacker.GetStr("market_net_ratio");
            info.evalu_add_original = unpacker.GetStr("evalu_add_original");
            info.evalu_add_crncy = unpacker.GetStr("evalu_add_crncy");
            info.stop_info = unpacker.GetStr("stop_info");
            info.rights_info = unpacker.GetStr("rights_info");
            valL_4_22_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            valL_4_22_InfoList.Add((valL_4_22_Info)info);
        }
        #endregion

        //逻辑_独立估值_查询核对_查询托管估值表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new valL_4_22_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.evalu_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EVALU_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.valtable_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_VALTABLE_NO_INT);
                    info.fina_acco_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FINA_ACCO_CODE_STR);
                    info.fina_acco_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FINA_ACCO_NAME_STR);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.amount = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_AMOUNT_STR);
                    info.unit_cost = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_COST_STR);
                    info.prime_cost_original = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PRIME_COST_ORIGINAL_STR);
                    info.prime_cost_crncy = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PRIME_COST_CRNCY_STR);
                    info.cost_net_ratio = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COST_NET_RATIO_STR);
                    info.market_price = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_PRICE_STR);
                    info.market_value_original = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_VALUE_ORIGINAL_STR);
                    info.market_value_crncy = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_VALUE_CRNCY_STR);
                    info.market_net_ratio = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_NET_RATIO_STR);
                    info.evalu_add_original = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EVALU_ADD_ORIGINAL_STR);
                    info.evalu_add_crncy = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EVALU_ADD_CRNCY_STR);
                    info.stop_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOP_INFO_STR);
                    info.rights_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RIGHTS_INFO_STR);
                    valL_4_22_InfoList.Add(info);
                }
            }
        }
    }

}
