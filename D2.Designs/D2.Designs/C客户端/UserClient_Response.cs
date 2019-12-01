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
    public class pubL_19_1_Response : IResponse
    {
        #region 构造函数
        public pubL_19_1_Response()
        {
            this.pubL_19_1_InfoList = new ObservableCollection<pubL_19_1_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_1_Info> pubL_19_1_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_1_Info info = new pubL_19_1_Info();
            pubL_19_1_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_1_InfoList.Add((pubL_19_1_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_新增操作员信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_19_1_Info();
                pubL_19_1_InfoList.Add(info);
            }
        }
    }

    public class pubL_19_2_Response : IResponse
    {
        #region 构造函数
        public pubL_19_2_Response()
        {
            this.pubL_19_2_InfoList = new ObservableCollection<pubL_19_2_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_2_Info> pubL_19_2_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_2_Info info = new pubL_19_2_Info();
            pubL_19_2_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_2_InfoList.Add((pubL_19_2_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_修改操作员信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_19_2_Info();
                pubL_19_2_InfoList.Add(info);
            }
        }
    }

    public class pubL_19_4_Response : IResponse
    {
        #region 构造函数
        public pubL_19_4_Response()
        {
            this.pubL_19_4_InfoList = new ObservableCollection<pubL_19_4_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_4_Info> pubL_19_4_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_4_Info info = new pubL_19_4_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.update_date = unpacker.GetInt("update_date");
            info.update_time = unpacker.GetInt("update_time");
            info.co_no = unpacker.GetInt("co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.opor_name = unpacker.GetStr("opor_name");
            info.opor_type = unpacker.GetInt("opor_type");
            info.opor_pwd = unpacker.GetStr("opor_pwd");
            info.opor_status = unpacker.GetStr("opor_status");
            info.create_opor = unpacker.GetInt("create_opor");
            info.conta_addr = unpacker.GetStr("conta_addr");
            info.oper_rights = unpacker.GetInt("oper_rights");
            info.phone_number = unpacker.GetStr("phone_number");
            info.email = unpacker.GetStr("email");
            info.is_trader = unpacker.GetInt("is_trader");
            info.trader_no = unpacker.GetInt("trader_no");
            info.allow_login_type = unpacker.GetStr("allow_login_type");
            info.allow_oper_ip_addr = unpacker.GetStr("allow_oper_ip_addr");
            info.allow_login_mac = unpacker.GetStr("allow_login_mac");
            info.allow_oper_mac = unpacker.GetStr("allow_oper_mac");
            info.opor_rights_str = unpacker.GetStr("opor_rights_str");
            info.index_value = unpacker.GetInt("index_value");
            info.manage_nolgn_opor_orders = unpacker.GetInt("manage_nolgn_opor_orders");
            pubL_19_4_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_4_InfoList.Add((pubL_19_4_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_查询操作员信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_19_4_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    info.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.opor_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NAME_STR);
                    info.opor_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_TYPE_INT);
                    info.opor_pwd = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_PWD_STR);
                    info.opor_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_STATUS_STR);
                    info.create_opor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_OPOR_INT);
                    info.conta_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTA_ADDR_STR);
                    info.oper_rights = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_RIGHTS_INT);
                    info.phone_number = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PHONE_NUMBER_STR);
                    info.email = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EMAIL_STR);
                    info.is_trader = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_TRADER_INT);
                    info.trader_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRADER_NO_INT);
                    info.allow_login_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_LOGIN_TYPE_STR);
                    info.allow_oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_OPER_IP_ADDR_STR);
                    info.allow_login_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_LOGIN_MAC_STR);
                    info.allow_oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_OPER_MAC_STR);
                    info.opor_rights_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_RIGHTS_STR_STR);
                    info.index_value = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDEX_VALUE_INT);
                    info.manage_nolgn_opor_orders = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MANAGE_NOLGN_OPOR_ORDERS_INT);
                    pubL_19_4_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_19_5_Response : IResponse
    {
        #region 构造函数
        public pubL_19_5_Response()
        {
            this.pubL_19_5_InfoList = new ObservableCollection<pubL_19_5_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_5_Info> pubL_19_5_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_5_Info info = new pubL_19_5_Info();
            pubL_19_5_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_5_InfoList.Add((pubL_19_5_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_冻结操作员
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_19_5_Info();
                pubL_19_5_InfoList.Add(info);
            }
        }
    }

    public class pubL_19_6_Response : IResponse
    {
        #region 构造函数
        public pubL_19_6_Response()
        {
            this.pubL_19_6_InfoList = new ObservableCollection<pubL_19_6_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_6_Info> pubL_19_6_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_6_Info info = new pubL_19_6_Info();
            pubL_19_6_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_6_InfoList.Add((pubL_19_6_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_解冻操作员
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_19_6_Info();
                pubL_19_6_InfoList.Add(info);
            }
        }
    }

    public class pubL_19_7_Response : IResponse
    {
        #region 构造函数
        public pubL_19_7_Response()
        {
            this.pubL_19_7_InfoList = new ObservableCollection<pubL_19_7_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_7_Info> pubL_19_7_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_7_Info info = new pubL_19_7_Info();
            pubL_19_7_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_7_InfoList.Add((pubL_19_7_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_注销操作员
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_19_7_Info();
                pubL_19_7_InfoList.Add(info);
            }
        }
    }

    public class pubL_19_9_Response : IResponse
    {
        #region 构造函数
        public pubL_19_9_Response()
        {
            this.pubL_19_9_InfoList = new ObservableCollection<pubL_19_9_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_9_Info> pubL_19_9_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_9_Info info = new pubL_19_9_Info();
            pubL_19_9_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_9_InfoList.Add((pubL_19_9_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_修改操作员密码
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_19_9_Info();
                pubL_19_9_InfoList.Add(info);
            }
        }
    }

    public class pubL_19_10_Response : IResponse
    {
        #region 构造函数
        public pubL_19_10_Response()
        {
            this.pubL_19_10_InfoList = new ObservableCollection<pubL_19_10_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_10_Info> pubL_19_10_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_10_Info info = new pubL_19_10_Info();
            pubL_19_10_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_10_InfoList.Add((pubL_19_10_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_重置操作员密码
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_19_10_Info();
                pubL_19_10_InfoList.Add(info);
            }
        }
    }

    public class pubL_19_11_Response : IResponse
    {
        #region 构造函数
        public pubL_19_11_Response()
        {
            this.pubL_19_11_InfoList = new ObservableCollection<pubL_19_11_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_11_Info> pubL_19_11_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_11_Info info = new pubL_19_11_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.update_date = unpacker.GetInt("update_date");
            info.update_time = unpacker.GetInt("update_time");
            info.opor_co_no = unpacker.GetInt("opor_co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.oper_mac = unpacker.GetStr("oper_mac");
            info.oper_ip_addr = unpacker.GetStr("oper_ip_addr");
            info.oper_info = unpacker.GetStr("oper_info");
            info.oper_way = unpacker.GetStr("oper_way");
            info.oper_menu_no = unpacker.GetInt("oper_menu_no");
            info.oper_func_code = unpacker.GetStr("oper_func_code");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.target_opor_no = unpacker.GetInt("target_opor_no");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pubL_19_11_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_11_InfoList.Add((pubL_19_11_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_查询操作员信息流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_19_11_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    info.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    info.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    info.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    info.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    info.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    info.oper_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MENU_NO_INT);
                    info.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.target_opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_OPOR_NO_INT);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pubL_19_11_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_19_12_Response : IResponse
    {
        #region 构造函数
        public pubL_19_12_Response()
        {
            this.pubL_19_12_InfoList = new ObservableCollection<pubL_19_12_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_12_Info> pubL_19_12_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_12_Info info = new pubL_19_12_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.update_date = unpacker.GetInt("update_date");
            info.update_time = unpacker.GetInt("update_time");
            info.opor_co_no = unpacker.GetInt("opor_co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.oper_mac = unpacker.GetStr("oper_mac");
            info.oper_ip_addr = unpacker.GetStr("oper_ip_addr");
            info.oper_info = unpacker.GetStr("oper_info");
            info.oper_way = unpacker.GetStr("oper_way");
            info.oper_menu_no = unpacker.GetInt("oper_menu_no");
            info.oper_func_code = unpacker.GetStr("oper_func_code");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.target_opor_no = unpacker.GetInt("target_opor_no");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pubL_19_12_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_12_InfoList.Add((pubL_19_12_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_查询历史操作员信息流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_19_12_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    info.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    info.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    info.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    info.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    info.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    info.oper_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MENU_NO_INT);
                    info.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.target_opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_OPOR_NO_INT);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pubL_19_12_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_19_14_Response : IResponse
    {
        #region 构造函数
        public pubL_19_14_Response()
        {
            this.pubL_19_14_InfoList = new ObservableCollection<pubL_19_14_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_14_Info> pubL_19_14_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_14_Info info = new pubL_19_14_Info();
            info.target_opor_no = unpacker.GetInt("target_opor_no");
            pubL_19_14_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_14_InfoList.Add((pubL_19_14_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_获取操作员编号
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_19_14_Info();
                info.target_opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_OPOR_NO_INT);
                pubL_19_14_InfoList.Add(info);
            }
        }
    }

    public class pubL_19_15_Response : IResponse
    {
        #region 构造函数
        public pubL_19_15_Response()
        {
            this.pubL_19_15_InfoList = new ObservableCollection<pubL_19_15_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_15_Info> pubL_19_15_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_15_Info info = new pubL_19_15_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.opor_name = unpacker.GetStr("opor_name");
            info.opor_status = unpacker.GetStr("opor_status");
            info.is_trader = unpacker.GetInt("is_trader");
            pubL_19_15_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_15_InfoList.Add((pubL_19_15_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_查询操作员列表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_19_15_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.opor_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NAME_STR);
                    info.opor_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_STATUS_STR);
                    info.is_trader = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_TRADER_INT);
                    pubL_19_15_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_19_16_Response : IResponse
    {
        #region 构造函数
        public pubL_19_16_Response()
        {
            this.pubL_19_16_InfoList = new ObservableCollection<pubL_19_16_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_16_Info> pubL_19_16_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_16_Info info = new pubL_19_16_Info();
            pubL_19_16_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_16_InfoList.Add((pubL_19_16_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_新增操作员权限信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_19_16_Info();
                pubL_19_16_InfoList.Add(info);
            }
        }
    }

    public class pubL_19_17_Response : IResponse
    {
        #region 构造函数
        public pubL_19_17_Response()
        {
            this.pubL_19_17_InfoList = new ObservableCollection<pubL_19_17_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_17_Info> pubL_19_17_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_17_Info info = new pubL_19_17_Info();
            pubL_19_17_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_17_InfoList.Add((pubL_19_17_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_修改操作员权限信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_19_17_Info();
                pubL_19_17_InfoList.Add(info);
            }
        }
    }

    public class pubL_19_18_Response : IResponse
    {
        #region 构造函数
        public pubL_19_18_Response()
        {
            this.pubL_19_18_InfoList = new ObservableCollection<pubL_19_18_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_18_Info> pubL_19_18_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_18_Info info = new pubL_19_18_Info();
            info.allow_oper_mac = unpacker.GetStr("allow_oper_mac");
            info.opor_rights_str = unpacker.GetStr("opor_rights_str");
            pubL_19_18_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_18_InfoList.Add((pubL_19_18_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_查询操作员权限信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_19_18_Info();
                info.allow_oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_OPER_MAC_STR);
                info.opor_rights_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_RIGHTS_STR_STR);
                pubL_19_18_InfoList.Add(info);
            }
        }
    }

    public class pubL_19_19_Response : IResponse
    {
        #region 构造函数
        public pubL_19_19_Response()
        {
            this.pubL_19_19_InfoList = new ObservableCollection<pubL_19_19_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_19_Info> pubL_19_19_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_19_Info info = new pubL_19_19_Info();
            info.oper_mac = unpacker.GetStr("oper_mac");
            info.oper_ip_addr = unpacker.GetStr("oper_ip_addr");
            pubL_19_19_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_19_InfoList.Add((pubL_19_19_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_查询操作员登录地址信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_19_19_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    info.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    pubL_19_19_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_19_21_Response : IResponse
    {
        #region 构造函数
        public pubL_19_21_Response()
        {
            this.pubL_19_21_InfoList = new ObservableCollection<pubL_19_21_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_21_Info> pubL_19_21_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_21_Info info = new pubL_19_21_Info();
            info.co_no = unpacker.GetInt("co_no");
            info.opor_name = unpacker.GetStr("opor_name");
            info.opor_type = unpacker.GetInt("opor_type");
            info.oper_rights = unpacker.GetInt("oper_rights");
            info.is_trader = unpacker.GetInt("is_trader");
            info.trader_no = unpacker.GetInt("trader_no");
            info.online_status = unpacker.GetInt("online_status");
            info.login_count = unpacker.GetInt("login_count");
            info.login_error_count = unpacker.GetInt("login_error_count");
            info.init_date = unpacker.GetInt("init_date");
            info.last_login_ip = unpacker.GetStr("last_login_ip");
            info.last_login_mac = unpacker.GetStr("last_login_mac");
            info.last_login_date = unpacker.GetInt("last_login_date");
            info.last_login_time = unpacker.GetInt("last_login_time");
            info.last_oper_info = unpacker.GetStr("last_oper_info");
            info.co_type = unpacker.GetInt("co_type");
            info.co_busi_config_str = unpacker.GetStr("co_busi_config_str");
            info.change_pwd_flag = unpacker.GetInt("change_pwd_flag");
            info.sys_type = unpacker.GetInt("sys_type");
            pubL_19_21_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_21_InfoList.Add((pubL_19_21_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_操作员登录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_19_21_Info();
                info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                info.opor_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NAME_STR);
                info.opor_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_TYPE_INT);
                info.oper_rights = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_RIGHTS_INT);
                info.is_trader = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_TRADER_INT);
                info.trader_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRADER_NO_INT);
                info.online_status = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ONLINE_STATUS_INT);
                info.login_count = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LOGIN_COUNT_INT);
                info.login_error_count = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LOGIN_ERROR_COUNT_INT);
                info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                info.last_login_ip = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_LAST_LOGIN_IP_STR);
                info.last_login_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_LAST_LOGIN_MAC_STR);
                info.last_login_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LAST_LOGIN_DATE_INT);
                info.last_login_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LAST_LOGIN_TIME_INT);
                info.last_oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_LAST_OPER_INFO_STR);
                info.co_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_TYPE_INT);
                info.co_busi_config_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CO_BUSI_CONFIG_STR_STR);
                info.change_pwd_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CHANGE_PWD_FLAG_INT);
                info.sys_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SYS_TYPE_INT);
                pubL_19_21_InfoList.Add(info);
            }
        }
    }

    public class pubL_19_22_Response : IResponse
    {
        #region 构造函数
        public pubL_19_22_Response()
        {
            this.pubL_19_22_InfoList = new ObservableCollection<pubL_19_22_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_22_Info> pubL_19_22_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_22_Info info = new pubL_19_22_Info();
            pubL_19_22_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_22_InfoList.Add((pubL_19_22_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_操作员退出
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_19_22_Info();
                pubL_19_22_InfoList.Add(info);
            }
        }
    }

    public class pubL_19_31_Response : IResponse
    {
        #region 构造函数
        public pubL_19_31_Response()
        {
            this.pubL_19_31_InfoList = new ObservableCollection<pubL_19_31_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_31_Info> pubL_19_31_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_31_Info info = new pubL_19_31_Info();
            pubL_19_31_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_31_InfoList.Add((pubL_19_31_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_设置操作员配置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_19_31_Info();
                pubL_19_31_InfoList.Add(info);
            }
        }
    }

    public class pubL_19_32_Response : IResponse
    {
        #region 构造函数
        public pubL_19_32_Response()
        {
            this.pubL_19_32_InfoList = new ObservableCollection<pubL_19_32_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_32_Info> pubL_19_32_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_32_Info info = new pubL_19_32_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.update_date = unpacker.GetInt("update_date");
            info.update_time = unpacker.GetInt("update_time");
            info.config_no = unpacker.GetInt64("config_no");
            info.config_name = unpacker.GetStr("config_name");
            info.config_value = unpacker.GetStr("config_value");
            pubL_19_32_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_32_InfoList.Add((pubL_19_32_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_查询操作员配置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_19_32_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    info.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    info.config_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_NO_INT64);
                    info.config_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_NAME_STR);
                    info.config_value = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_VALUE_STR);
                    pubL_19_32_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_19_33_Response : IResponse
    {
        #region 构造函数
        public pubL_19_33_Response()
        {
            this.pubL_19_33_InfoList = new ObservableCollection<pubL_19_33_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_33_Info> pubL_19_33_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_33_Info info = new pubL_19_33_Info();
            pubL_19_33_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_33_InfoList.Add((pubL_19_33_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_保存操作员表格显示
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_19_33_Info();
                pubL_19_33_InfoList.Add(info);
            }
        }
    }

    public class pubL_19_34_Response : IResponse
    {
        #region 构造函数
        public pubL_19_34_Response()
        {
            this.pubL_19_34_InfoList = new ObservableCollection<pubL_19_34_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_34_Info> pubL_19_34_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_34_Info info = new pubL_19_34_Info();
            info.co_no = unpacker.GetInt("co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.parent_panel = unpacker.GetStr("parent_panel");
            info.dbgrid_name = unpacker.GetStr("dbgrid_name");
            info.dbgrid_key = unpacker.GetStr("dbgrid_key");
            info.dbgrid_field = unpacker.GetStr("dbgrid_field");
            info.field_width = unpacker.GetInt("field_width");
            info.field_order = unpacker.GetInt("field_order");
            info.client_type = unpacker.GetInt("client_type");
            pubL_19_34_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_34_InfoList.Add((pubL_19_34_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_查询操作员表格显示
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_19_34_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.parent_panel = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PARENT_PANEL_STR);
                    info.dbgrid_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DBGRID_NAME_STR);
                    info.dbgrid_key = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DBGRID_KEY_STR);
                    info.dbgrid_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DBGRID_FIELD_STR);
                    info.field_width = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FIELD_WIDTH_INT);
                    info.field_order = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FIELD_ORDER_INT);
                    info.client_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLIENT_TYPE_INT);
                    pubL_19_34_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_19_45_Response : IResponse
    {
        #region 构造函数
        public pubL_19_45_Response()
        {
            this.pubL_19_45_InfoList = new ObservableCollection<pubL_19_45_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_45_Info> pubL_19_45_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_45_Info info = new pubL_19_45_Info();
            pubL_19_45_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_45_InfoList.Add((pubL_19_45_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_新增操作员可操作产品
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_19_45_Info();
                pubL_19_45_InfoList.Add(info);
            }
        }
    }

    public class pubL_19_46_Response : IResponse
    {
        #region 构造函数
        public pubL_19_46_Response()
        {
            this.pubL_19_46_InfoList = new ObservableCollection<pubL_19_46_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_46_Info> pubL_19_46_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_46_Info info = new pubL_19_46_Info();
            pubL_19_46_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_46_InfoList.Add((pubL_19_46_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_删除操作员可操作产品
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_19_46_Info();
                pubL_19_46_InfoList.Add(info);
            }
        }
    }

    public class pubL_19_48_Response : IResponse
    {
        #region 构造函数
        public pubL_19_48_Response()
        {
            this.pubL_19_48_InfoList = new ObservableCollection<pubL_19_48_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_48_Info> pubL_19_48_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_48_Info info = new pubL_19_48_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.update_date = unpacker.GetInt("update_date");
            info.update_time = unpacker.GetInt("update_time");
            info.opor_no = unpacker.GetInt("opor_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.oper_rights = unpacker.GetInt("oper_rights");
            pubL_19_48_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_48_InfoList.Add((pubL_19_48_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_查询操作员可操作产品
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_19_48_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    info.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.oper_rights = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_RIGHTS_INT);
                    pubL_19_48_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_19_51_Response : IResponse
    {
        #region 构造函数
        public pubL_19_51_Response()
        {
            this.pubL_19_51_InfoList = new ObservableCollection<pubL_19_51_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_51_Info> pubL_19_51_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_51_Info info = new pubL_19_51_Info();
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            pubL_19_51_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_51_InfoList.Add((pubL_19_51_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_新增交易组信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_19_51_Info();
                info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                pubL_19_51_InfoList.Add(info);
            }
        }
    }

    public class pubL_19_52_Response : IResponse
    {
        #region 构造函数
        public pubL_19_52_Response()
        {
            this.pubL_19_52_InfoList = new ObservableCollection<pubL_19_52_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_52_Info> pubL_19_52_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_52_Info info = new pubL_19_52_Info();
            pubL_19_52_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_52_InfoList.Add((pubL_19_52_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_修改交易组信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_19_52_Info();
                pubL_19_52_InfoList.Add(info);
            }
        }
    }

    public class pubL_19_54_Response : IResponse
    {
        #region 构造函数
        public pubL_19_54_Response()
        {
            this.pubL_19_54_InfoList = new ObservableCollection<pubL_19_54_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_54_Info> pubL_19_54_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_54_Info info = new pubL_19_54_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.update_date = unpacker.GetInt("update_date");
            info.update_time = unpacker.GetInt("update_time");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.co_no = unpacker.GetInt("co_no");
            info.exch_group_code = unpacker.GetStr("exch_group_code");
            info.exch_group_name = unpacker.GetStr("exch_group_name");
            info.exch_group_status = unpacker.GetStr("exch_group_status");
            info.default_group_flag = unpacker.GetInt("default_group_flag");
            info.pd_no = unpacker.GetInt("pd_no");
            info.first_asset = unpacker.GetDouble("first_asset");
            info.pre_nav = unpacker.GetDouble("pre_nav");
            info.exch_group_dist_pd_amt = unpacker.GetDouble("exch_group_dist_pd_amt");
            info.exch_group_pd_share = unpacker.GetDouble("exch_group_pd_share");
            info.allow_exch = unpacker.GetStr("allow_exch");
            info.allow_stock_type = unpacker.GetStr("allow_stock_type");
            info.busi_config_str = unpacker.GetStr("busi_config_str");
            info.market_price_ratio = unpacker.GetDouble("market_price_ratio");
            info.forbid_order_dir = unpacker.GetStr("forbid_order_dir");
            info.trade_acco = unpacker.GetStr("trade_acco");
            info.weight_value = unpacker.GetDouble("weight_value");
            info.remark_info = unpacker.GetStr("remark_info");
            info.futu_default_group_flag = unpacker.GetInt("futu_default_group_flag");
            info.fina_loan_default_group_flag = unpacker.GetInt("fina_loan_default_group_flag");
            pubL_19_54_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_54_InfoList.Add((pubL_19_54_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_查询交易组信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_19_54_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    info.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.exch_group_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_CODE_STR);
                    info.exch_group_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NAME_STR);
                    info.exch_group_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_STATUS_STR);
                    info.default_group_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEFAULT_GROUP_FLAG_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.first_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FIRST_ASSET_FLOAT);
                    info.pre_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_NAV_FLOAT);
                    info.exch_group_dist_pd_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_DIST_PD_AMT_FLOAT);
                    info.exch_group_pd_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_PD_SHARE_FLOAT);
                    info.allow_exch = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_EXCH_STR);
                    info.allow_stock_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_STOCK_TYPE_STR);
                    info.busi_config_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_CONFIG_STR_STR);
                    info.market_price_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_PRICE_RATIO_FLOAT);
                    info.forbid_order_dir = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FORBID_ORDER_DIR_STR);
                    info.trade_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_ACCO_STR);
                    info.weight_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WEIGHT_VALUE_FLOAT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    info.futu_default_group_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_DEFAULT_GROUP_FLAG_INT);
                    info.fina_loan_default_group_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FINA_LOAN_DEFAULT_GROUP_FLAG_INT);
                    pubL_19_54_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_19_55_Response : IResponse
    {
        #region 构造函数
        public pubL_19_55_Response()
        {
            this.pubL_19_55_InfoList = new ObservableCollection<pubL_19_55_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_55_Info> pubL_19_55_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_55_Info info = new pubL_19_55_Info();
            pubL_19_55_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_55_InfoList.Add((pubL_19_55_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_冻结交易组
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_19_55_Info();
                pubL_19_55_InfoList.Add(info);
            }
        }
    }

    public class pubL_19_56_Response : IResponse
    {
        #region 构造函数
        public pubL_19_56_Response()
        {
            this.pubL_19_56_InfoList = new ObservableCollection<pubL_19_56_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_56_Info> pubL_19_56_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_56_Info info = new pubL_19_56_Info();
            pubL_19_56_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_56_InfoList.Add((pubL_19_56_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_解冻交易组
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_19_56_Info();
                pubL_19_56_InfoList.Add(info);
            }
        }
    }

    public class pubL_19_57_Response : IResponse
    {
        #region 构造函数
        public pubL_19_57_Response()
        {
            this.pubL_19_57_InfoList = new ObservableCollection<pubL_19_57_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_57_Info> pubL_19_57_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_57_Info info = new pubL_19_57_Info();
            pubL_19_57_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_57_InfoList.Add((pubL_19_57_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_注销交易组
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_19_57_Info();
                pubL_19_57_InfoList.Add(info);
            }
        }
    }

    public class pubL_19_58_Response : IResponse
    {
        #region 构造函数
        public pubL_19_58_Response()
        {
            this.pubL_19_58_InfoList = new ObservableCollection<pubL_19_58_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_58_Info> pubL_19_58_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_58_Info info = new pubL_19_58_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.update_date = unpacker.GetInt("update_date");
            info.update_time = unpacker.GetInt("update_time");
            info.opor_co_no = unpacker.GetInt("opor_co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.oper_mac = unpacker.GetStr("oper_mac");
            info.oper_ip_addr = unpacker.GetStr("oper_ip_addr");
            info.oper_info = unpacker.GetStr("oper_info");
            info.oper_way = unpacker.GetStr("oper_way");
            info.oper_menu_no = unpacker.GetInt("oper_menu_no");
            info.oper_func_code = unpacker.GetStr("oper_func_code");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pubL_19_58_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_58_InfoList.Add((pubL_19_58_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_查询交易组信息流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_19_58_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    info.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    info.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    info.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    info.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    info.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    info.oper_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MENU_NO_INT);
                    info.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pubL_19_58_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_19_59_Response : IResponse
    {
        #region 构造函数
        public pubL_19_59_Response()
        {
            this.pubL_19_59_InfoList = new ObservableCollection<pubL_19_59_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_59_Info> pubL_19_59_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_59_Info info = new pubL_19_59_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.update_date = unpacker.GetInt("update_date");
            info.update_time = unpacker.GetInt("update_time");
            info.opor_co_no = unpacker.GetInt("opor_co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.oper_mac = unpacker.GetStr("oper_mac");
            info.oper_ip_addr = unpacker.GetStr("oper_ip_addr");
            info.oper_info = unpacker.GetStr("oper_info");
            info.oper_way = unpacker.GetStr("oper_way");
            info.oper_menu_no = unpacker.GetInt("oper_menu_no");
            info.oper_func_code = unpacker.GetStr("oper_func_code");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pubL_19_59_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_59_InfoList.Add((pubL_19_59_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_查询历史交易组信息流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_19_59_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    info.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    info.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    info.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    info.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    info.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    info.oper_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MENU_NO_INT);
                    info.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pubL_19_59_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_19_60_Response : IResponse
    {
        #region 构造函数
        public pubL_19_60_Response()
        {
            this.pubL_19_60_InfoList = new ObservableCollection<pubL_19_60_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_60_Info> pubL_19_60_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_60_Info info = new pubL_19_60_Info();
            pubL_19_60_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_60_InfoList.Add((pubL_19_60_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_设置默认交易组
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_19_60_Info();
                pubL_19_60_InfoList.Add(info);
            }
        }
    }

    public class pubL_19_73_Response : IResponse
    {
        #region 构造函数
        public pubL_19_73_Response()
        {
            this.pubL_19_73_InfoList = new ObservableCollection<pubL_19_73_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_73_Info> pubL_19_73_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_73_Info info = new pubL_19_73_Info();
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.exch_group_code = unpacker.GetStr("exch_group_code");
            info.exch_group_name = unpacker.GetStr("exch_group_name");
            info.exch_group_status = unpacker.GetStr("exch_group_status");
            info.default_group_flag = unpacker.GetInt("default_group_flag");
            pubL_19_73_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_73_InfoList.Add((pubL_19_73_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_查询可见交易组
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_19_73_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.exch_group_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_CODE_STR);
                    info.exch_group_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NAME_STR);
                    info.exch_group_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_STATUS_STR);
                    info.default_group_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEFAULT_GROUP_FLAG_INT);
                    pubL_19_73_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_19_61_Response : IResponse
    {
        #region 构造函数
        public pubL_19_61_Response()
        {
            this.pubL_19_61_InfoList = new ObservableCollection<pubL_19_61_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_61_Info> pubL_19_61_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_61_Info info = new pubL_19_61_Info();
            pubL_19_61_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_61_InfoList.Add((pubL_19_61_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_新增操作员所属交易组
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_19_61_Info();
                pubL_19_61_InfoList.Add(info);
            }
        }
    }

    public class pubL_19_62_Response : IResponse
    {
        #region 构造函数
        public pubL_19_62_Response()
        {
            this.pubL_19_62_InfoList = new ObservableCollection<pubL_19_62_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_62_Info> pubL_19_62_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_62_Info info = new pubL_19_62_Info();
            pubL_19_62_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_62_InfoList.Add((pubL_19_62_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_删除操作员所属交易组
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_19_62_Info();
                pubL_19_62_InfoList.Add(info);
            }
        }
    }

    public class pubL_19_64_Response : IResponse
    {
        #region 构造函数
        public pubL_19_64_Response()
        {
            this.pubL_19_64_InfoList = new ObservableCollection<pubL_19_64_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_64_Info> pubL_19_64_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_64_Info info = new pubL_19_64_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.update_date = unpacker.GetInt("update_date");
            info.update_time = unpacker.GetInt("update_time");
            info.opor_no = unpacker.GetInt("opor_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.oper_rights = unpacker.GetInt("oper_rights");
            pubL_19_64_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_64_InfoList.Add((pubL_19_64_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_查询操作员所属交易组
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_19_64_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    info.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.oper_rights = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_RIGHTS_INT);
                    pubL_19_64_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_19_65_Response : IResponse
    {
        #region 构造函数
        public pubL_19_65_Response()
        {
            this.pubL_19_65_InfoList = new ObservableCollection<pubL_19_65_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_65_Info> pubL_19_65_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_65_Info info = new pubL_19_65_Info();
            info.group_no = unpacker.GetInt("group_no");
            pubL_19_65_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_65_InfoList.Add((pubL_19_65_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_新增产品账户交易组组别
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_19_65_Info();
                info.group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_GROUP_NO_INT);
                pubL_19_65_InfoList.Add(info);
            }
        }
    }

    public class pubL_19_66_Response : IResponse
    {
        #region 构造函数
        public pubL_19_66_Response()
        {
            this.pubL_19_66_InfoList = new ObservableCollection<pubL_19_66_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_66_Info> pubL_19_66_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_66_Info info = new pubL_19_66_Info();
            pubL_19_66_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_66_InfoList.Add((pubL_19_66_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_修改产品账户交易组组别
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_19_66_Info();
                pubL_19_66_InfoList.Add(info);
            }
        }
    }

    public class pubL_19_67_Response : IResponse
    {
        #region 构造函数
        public pubL_19_67_Response()
        {
            this.pubL_19_67_InfoList = new ObservableCollection<pubL_19_67_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_67_Info> pubL_19_67_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_67_Info info = new pubL_19_67_Info();
            pubL_19_67_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_67_InfoList.Add((pubL_19_67_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_删除产品账户交易组组别
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_19_67_Info();
                pubL_19_67_InfoList.Add(info);
            }
        }
    }

    public class pubL_19_68_Response : IResponse
    {
        #region 构造函数
        public pubL_19_68_Response()
        {
            this.pubL_19_68_InfoList = new ObservableCollection<pubL_19_68_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_68_Info> pubL_19_68_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_68_Info info = new pubL_19_68_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.group_no = unpacker.GetInt("group_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.co_no = unpacker.GetInt("co_no");
            info.group_name = unpacker.GetStr("group_name");
            info.remark_info = unpacker.GetStr("remark_info");
            info.pd_account_group_type = unpacker.GetInt("pd_account_group_type");
            pubL_19_68_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_68_InfoList.Add((pubL_19_68_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_查询产品账户交易组组别
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_19_68_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_GROUP_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.group_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_GROUP_NAME_STR);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    info.pd_account_group_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_ACCOUNT_GROUP_TYPE_INT);
                    pubL_19_68_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_19_69_Response : IResponse
    {
        #region 构造函数
        public pubL_19_69_Response()
        {
            this.pubL_19_69_InfoList = new ObservableCollection<pubL_19_69_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_69_Info> pubL_19_69_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_69_Info info = new pubL_19_69_Info();
            pubL_19_69_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_69_InfoList.Add((pubL_19_69_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_新增产品账户交易组组别明细
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_19_69_Info();
                pubL_19_69_InfoList.Add(info);
            }
        }
    }

    public class pubL_19_70_Response : IResponse
    {
        #region 构造函数
        public pubL_19_70_Response()
        {
            this.pubL_19_70_InfoList = new ObservableCollection<pubL_19_70_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_70_Info> pubL_19_70_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_70_Info info = new pubL_19_70_Info();
            pubL_19_70_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_70_InfoList.Add((pubL_19_70_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_修改产品账户交易组组别明细
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_19_70_Info();
                pubL_19_70_InfoList.Add(info);
            }
        }
    }

    public class pubL_19_71_Response : IResponse
    {
        #region 构造函数
        public pubL_19_71_Response()
        {
            this.pubL_19_71_InfoList = new ObservableCollection<pubL_19_71_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_71_Info> pubL_19_71_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_71_Info info = new pubL_19_71_Info();
            pubL_19_71_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_71_InfoList.Add((pubL_19_71_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_删除产品账户交易组组别明细
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_19_71_Info();
                pubL_19_71_InfoList.Add(info);
            }
        }
    }

    public class pubL_19_72_Response : IResponse
    {
        #region 构造函数
        public pubL_19_72_Response()
        {
            this.pubL_19_72_InfoList = new ObservableCollection<pubL_19_72_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_72_Info> pubL_19_72_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_72_Info info = new pubL_19_72_Info();
            info.group_no = unpacker.GetInt("group_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.weight_ratio = unpacker.GetDouble("weight_ratio");
            info.remark_info = unpacker.GetStr("remark_info");
            pubL_19_72_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_72_InfoList.Add((pubL_19_72_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_查询产品账户交易组组别明细
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_19_72_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_GROUP_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.weight_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WEIGHT_RATIO_FLOAT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    pubL_19_72_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_19_77_Response : IResponse
    {
        #region 构造函数
        public pubL_19_77_Response()
        {
            this.pubL_19_77_InfoList = new ObservableCollection<pubL_19_77_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_77_Info> pubL_19_77_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_77_Info info = new pubL_19_77_Info();
            pubL_19_77_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_77_InfoList.Add((pubL_19_77_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_批量新增操作员可操作操作员
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_19_77_Info();
                pubL_19_77_InfoList.Add(info);
            }
        }
    }

    public class pubL_19_74_Response : IResponse
    {
        #region 构造函数
        public pubL_19_74_Response()
        {
            this.pubL_19_74_InfoList = new ObservableCollection<pubL_19_74_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_74_Info> pubL_19_74_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_74_Info info = new pubL_19_74_Info();
            pubL_19_74_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_74_InfoList.Add((pubL_19_74_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_新增操作员可操作操作员
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_19_74_Info();
                pubL_19_74_InfoList.Add(info);
            }
        }
    }

    public class pubL_19_75_Response : IResponse
    {
        #region 构造函数
        public pubL_19_75_Response()
        {
            this.pubL_19_75_InfoList = new ObservableCollection<pubL_19_75_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_75_Info> pubL_19_75_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_75_Info info = new pubL_19_75_Info();
            pubL_19_75_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_75_InfoList.Add((pubL_19_75_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_删除操作员可操作操作员
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_19_75_Info();
                pubL_19_75_InfoList.Add(info);
            }
        }
    }

    public class pubL_19_78_Response : IResponse
    {
        #region 构造函数
        public pubL_19_78_Response()
        {
            this.pubL_19_78_InfoList = new ObservableCollection<pubL_19_78_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_78_Info> pubL_19_78_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_78_Info info = new pubL_19_78_Info();
            pubL_19_78_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_78_InfoList.Add((pubL_19_78_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_批量删除操作员可操作操作员
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_19_78_Info();
                pubL_19_78_InfoList.Add(info);
            }
        }
    }

    public class pubL_19_76_Response : IResponse
    {
        #region 构造函数
        public pubL_19_76_Response()
        {
            this.pubL_19_76_InfoList = new ObservableCollection<pubL_19_76_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_76_Info> pubL_19_76_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_76_Info info = new pubL_19_76_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.update_date = unpacker.GetInt("update_date");
            info.update_time = unpacker.GetInt("update_time");
            info.opor_no = unpacker.GetInt("opor_no");
            info.allow_opor_no = unpacker.GetInt("allow_opor_no");
            info.oper_rights = unpacker.GetInt("oper_rights");
            pubL_19_76_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_76_InfoList.Add((pubL_19_76_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_查询操作员可操作操作员
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_19_76_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    info.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.allow_opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_OPOR_NO_INT);
                    info.oper_rights = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_RIGHTS_INT);
                    pubL_19_76_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_19_89_Response : IResponse
    {
        #region 构造函数
        public pubL_19_89_Response()
        {
            this.pubL_19_89_InfoList = new ObservableCollection<pubL_19_89_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_89_Info> pubL_19_89_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_89_Info info = new pubL_19_89_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.begin_NAV = unpacker.GetDouble("begin_NAV");
            info.nav_asset = unpacker.GetDouble("nav_asset");
            info.total_cash_asset = unpacker.GetDouble("total_cash_asset");
            info.stock_asset = unpacker.GetDouble("stock_asset");
            info.fund_asset = unpacker.GetDouble("fund_asset");
            info.money_fund_asset = unpacker.GetDouble("money_fund_asset");
            info.not_money_fund_asset = unpacker.GetDouble("not_money_fund_asset");
            info.bond_asset = unpacker.GetDouble("bond_asset");
            info.futu_asset = unpacker.GetDouble("futu_asset");
            info.repo_asset = unpacker.GetDouble("repo_asset");
            info.other_asset = unpacker.GetDouble("other_asset");
            info.hk_thrgh_stock_asset = unpacker.GetDouble("hk_thrgh_stock_asset");
            info.stock_cash_asset = unpacker.GetDouble("stock_cash_asset");
            info.futu_cash_asset = unpacker.GetDouble("futu_cash_asset");
            pubL_19_89_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_89_InfoList.Add((pubL_19_89_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_查询交易组历史资产
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_19_89_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.begin_NAV = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_NAV_FLOAT);
                    info.nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT);
                    info.total_cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_CASH_ASSET_FLOAT);
                    info.stock_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_FLOAT);
                    info.fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_ASSET_FLOAT);
                    info.money_fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MONEY_FUND_ASSET_FLOAT);
                    info.not_money_fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NOT_MONEY_FUND_ASSET_FLOAT);
                    info.bond_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ASSET_FLOAT);
                    info.futu_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ASSET_FLOAT);
                    info.repo_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPO_ASSET_FLOAT);
                    info.other_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_ASSET_FLOAT);
                    info.hk_thrgh_stock_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HK_THRGH_STOCK_ASSET_FLOAT);
                    info.stock_cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CASH_ASSET_FLOAT);
                    info.futu_cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_CASH_ASSET_FLOAT);
                    pubL_19_89_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_19_91_Response : IResponse
    {
        #region 构造函数
        public pubL_19_91_Response()
        {
            this.pubL_19_91_InfoList = new ObservableCollection<pubL_19_91_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_91_Info> pubL_19_91_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_91_Info info = new pubL_19_91_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.begin_NAV = unpacker.GetDouble("begin_NAV");
            info.nav_asset = unpacker.GetDouble("nav_asset");
            info.total_cash_asset = unpacker.GetDouble("total_cash_asset");
            info.stock_asset = unpacker.GetDouble("stock_asset");
            info.fund_asset = unpacker.GetDouble("fund_asset");
            info.money_fund_asset = unpacker.GetDouble("money_fund_asset");
            info.not_money_fund_asset = unpacker.GetDouble("not_money_fund_asset");
            info.bond_asset = unpacker.GetDouble("bond_asset");
            info.futu_asset = unpacker.GetDouble("futu_asset");
            info.repo_asset = unpacker.GetDouble("repo_asset");
            info.other_asset = unpacker.GetDouble("other_asset");
            info.hk_thrgh_stock_asset = unpacker.GetDouble("hk_thrgh_stock_asset");
            info.begin_evalu_nav_asset = unpacker.GetDouble("begin_evalu_nav_asset");
            info.evalu_nav_asset = unpacker.GetDouble("evalu_nav_asset");
            info.futu_long_market_value = unpacker.GetDouble("futu_long_market_value");
            info.futu_short_market_value = unpacker.GetDouble("futu_short_market_value");
            info.stock_cash_asset = unpacker.GetDouble("stock_cash_asset");
            info.futu_cash_asset = unpacker.GetDouble("futu_cash_asset");
            pubL_19_91_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_91_InfoList.Add((pubL_19_91_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_查询交易组资产
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_19_91_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.begin_NAV = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_NAV_FLOAT);
                    info.nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT);
                    info.total_cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_CASH_ASSET_FLOAT);
                    info.stock_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_FLOAT);
                    info.fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_ASSET_FLOAT);
                    info.money_fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MONEY_FUND_ASSET_FLOAT);
                    info.not_money_fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NOT_MONEY_FUND_ASSET_FLOAT);
                    info.bond_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ASSET_FLOAT);
                    info.futu_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ASSET_FLOAT);
                    info.repo_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPO_ASSET_FLOAT);
                    info.other_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_ASSET_FLOAT);
                    info.hk_thrgh_stock_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HK_THRGH_STOCK_ASSET_FLOAT);
                    info.begin_evalu_nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_EVALU_NAV_ASSET_FLOAT);
                    info.evalu_nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_EVALU_NAV_ASSET_FLOAT);
                    info.futu_long_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_LONG_MARKET_VALUE_FLOAT);
                    info.futu_short_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_SHORT_MARKET_VALUE_FLOAT);
                    info.stock_cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CASH_ASSET_FLOAT);
                    info.futu_cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_CASH_ASSET_FLOAT);
                    pubL_19_91_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_19_90_Response : IResponse
    {
        #region 构造函数
        public pubL_19_90_Response()
        {
            this.pubL_19_90_InfoList = new ObservableCollection<pubL_19_90_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_90_Info> pubL_19_90_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_90_Info info = new pubL_19_90_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.begin_NAV = unpacker.GetDouble("begin_NAV");
            info.nav_asset = unpacker.GetDouble("nav_asset");
            info.total_cash_asset = unpacker.GetDouble("total_cash_asset");
            info.money_fund_asset = unpacker.GetDouble("money_fund_asset");
            info.not_money_fund_asset = unpacker.GetDouble("not_money_fund_asset");
            info.stock_asset = unpacker.GetDouble("stock_asset");
            info.fund_asset = unpacker.GetDouble("fund_asset");
            info.bond_asset = unpacker.GetDouble("bond_asset");
            info.futu_asset = unpacker.GetDouble("futu_asset");
            info.repo_asset = unpacker.GetDouble("repo_asset");
            info.other_asset = unpacker.GetDouble("other_asset");
            info.hk_thrgh_stock_asset = unpacker.GetDouble("hk_thrgh_stock_asset");
            info.futu_long_market_value = unpacker.GetDouble("futu_long_market_value");
            info.futu_short_market_value = unpacker.GetDouble("futu_short_market_value");
            info.stock_cash_asset = unpacker.GetDouble("stock_cash_asset");
            info.futu_cash_asset = unpacker.GetDouble("futu_cash_asset");
            pubL_19_90_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_90_InfoList.Add((pubL_19_90_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_查询交易组资产历史
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_19_90_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.begin_NAV = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_NAV_FLOAT);
                    info.nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT);
                    info.total_cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_CASH_ASSET_FLOAT);
                    info.money_fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MONEY_FUND_ASSET_FLOAT);
                    info.not_money_fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NOT_MONEY_FUND_ASSET_FLOAT);
                    info.stock_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_FLOAT);
                    info.fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_ASSET_FLOAT);
                    info.bond_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ASSET_FLOAT);
                    info.futu_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ASSET_FLOAT);
                    info.repo_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPO_ASSET_FLOAT);
                    info.other_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_ASSET_FLOAT);
                    info.hk_thrgh_stock_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HK_THRGH_STOCK_ASSET_FLOAT);
                    info.futu_long_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_LONG_MARKET_VALUE_FLOAT);
                    info.futu_short_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_SHORT_MARKET_VALUE_FLOAT);
                    info.stock_cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CASH_ASSET_FLOAT);
                    info.futu_cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_CASH_ASSET_FLOAT);
                    pubL_19_90_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_19_92_Response : IResponse
    {
        #region 构造函数
        public pubL_19_92_Response()
        {
            this.pubL_19_92_InfoList = new ObservableCollection<pubL_19_92_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_92_Info> pubL_19_92_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_92_Info info = new pubL_19_92_Info();
            info.nav_asset = unpacker.GetDouble("nav_asset");
            pubL_19_92_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_92_InfoList.Add((pubL_19_92_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_获取交易组最大净值
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_19_92_Info();
                info.nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT);
                pubL_19_92_InfoList.Add(info);
            }
        }
    }

    public class pubL_19_93_Response : IResponse
    {
        #region 构造函数
        public pubL_19_93_Response()
        {
            this.pubL_19_93_InfoList = new ObservableCollection<pubL_19_93_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_93_Info> pubL_19_93_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_93_Info info = new pubL_19_93_Info();
            info.unit_nav = unpacker.GetDouble("unit_nav");
            pubL_19_93_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_93_InfoList.Add((pubL_19_93_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_获取交易组最大单位净值
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_19_93_Info();
                info.unit_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_NAV_FLOAT);
                pubL_19_93_InfoList.Add(info);
            }
        }
    }

    public class pubL_19_94_Response : IResponse
    {
        #region 构造函数
        public pubL_19_94_Response()
        {
            this.pubL_19_94_InfoList = new ObservableCollection<pubL_19_94_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_94_Info> pubL_19_94_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_94_Info info = new pubL_19_94_Info();
            info.init_date = unpacker.GetInt("init_date");
            info.create_time = unpacker.GetInt("create_time");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            pubL_19_94_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_94_InfoList.Add((pubL_19_94_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_查询交易组份额变动流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_19_94_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    pubL_19_94_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_19_95_Response : IResponse
    {
        #region 构造函数
        public pubL_19_95_Response()
        {
            this.pubL_19_95_InfoList = new ObservableCollection<pubL_19_95_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_95_Info> pubL_19_95_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_95_Info info = new pubL_19_95_Info();
            info.init_date = unpacker.GetInt("init_date");
            info.create_time = unpacker.GetInt("create_time");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            pubL_19_95_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_95_InfoList.Add((pubL_19_95_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_查询交易组份额变动流水历史
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_19_95_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    pubL_19_95_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_19_202_Response : IResponse
    {
        #region 构造函数
        public pubL_19_202_Response()
        {
            this.pubL_19_202_InfoList = new ObservableCollection<pubL_19_202_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_202_Info> pubL_19_202_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_202_Info info = new pubL_19_202_Info();
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.opor_name = unpacker.GetStr("opor_name");
            pubL_19_202_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_202_InfoList.Add((pubL_19_202_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_查询可见交易员列表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_19_202_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.opor_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NAME_STR);
                    pubL_19_202_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_19_203_Response : IResponse
    {
        #region 构造函数
        public pubL_19_203_Response()
        {
            this.pubL_19_203_InfoList = new ObservableCollection<pubL_19_203_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_203_Info> pubL_19_203_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_203_Info info = new pubL_19_203_Info();
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.exch_group_code = unpacker.GetStr("exch_group_code");
            info.exch_group_name = unpacker.GetStr("exch_group_name");
            pubL_19_203_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_203_InfoList.Add((pubL_19_203_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_查询自动打新交易组列表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_19_203_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.exch_group_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_CODE_STR);
                    info.exch_group_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NAME_STR);
                    pubL_19_203_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_19_900_Response : IResponse
    {
        #region 构造函数
        public pubL_19_900_Response()
        {
            this.pubL_19_900_InfoList = new ObservableCollection<pubL_19_900_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_900_Info> pubL_19_900_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_900_Info info = new pubL_19_900_Info();
            pubL_19_900_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_900_InfoList.Add((pubL_19_900_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_更新交易组证券资产
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_19_900_Info();
                pubL_19_900_InfoList.Add(info);
            }
        }
    }

    public class pubL_19_901_Response : IResponse
    {
        #region 构造函数
        public pubL_19_901_Response()
        {
            this.pubL_19_901_InfoList = new ObservableCollection<pubL_19_901_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_901_Info> pubL_19_901_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_901_Info info = new pubL_19_901_Info();
            pubL_19_901_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_901_InfoList.Add((pubL_19_901_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_更新交易组期货资产
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_19_901_Info();
                pubL_19_901_InfoList.Add(info);
            }
        }
    }

    public class pubL_19_902_Response : IResponse
    {
        #region 构造函数
        public pubL_19_902_Response()
        {
            this.pubL_19_902_InfoList = new ObservableCollection<pubL_19_902_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_902_Info> pubL_19_902_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_902_Info info = new pubL_19_902_Info();
            info.allow_opor_no_str = unpacker.GetStr("allow_opor_no_str");
            pubL_19_902_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_902_InfoList.Add((pubL_19_902_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_获取可操作该产品操作员编号串
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_19_902_Info();
                info.allow_opor_no_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_OPOR_NO_STR_STR);
                pubL_19_902_InfoList.Add(info);
            }
        }
    }

    public class pubL_19_301_Response : IResponse
    {
        #region 构造函数
        public pubL_19_301_Response()
        {
            this.pubL_19_301_InfoList = new ObservableCollection<pubL_19_301_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_301_Info> pubL_19_301_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_301_Info info = new pubL_19_301_Info();
            pubL_19_301_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_301_InfoList.Add((pubL_19_301_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_新增期现对冲组合
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_19_301_Info();
                pubL_19_301_InfoList.Add(info);
            }
        }
    }

    public class pubL_19_303_Response : IResponse
    {
        #region 构造函数
        public pubL_19_303_Response()
        {
            this.pubL_19_303_InfoList = new ObservableCollection<pubL_19_303_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_303_Info> pubL_19_303_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_303_Info info = new pubL_19_303_Info();
            pubL_19_303_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_303_InfoList.Add((pubL_19_303_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_删除期现对冲组合
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_19_303_Info();
                pubL_19_303_InfoList.Add(info);
            }
        }
    }

    public class pubL_19_304_Response : IResponse
    {
        #region 构造函数
        public pubL_19_304_Response()
        {
            this.pubL_19_304_InfoList = new ObservableCollection<pubL_19_304_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_304_Info> pubL_19_304_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_304_Info info = new pubL_19_304_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.comm_trd_type = unpacker.GetInt("comm_trd_type");
            info.co_no = unpacker.GetInt("co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.hedg_name = unpacker.GetStr("hedg_name");
            info.futu_exch_group_no = unpacker.GetInt("futu_exch_group_no");
            info.futu_asset_acco_no = unpacker.GetInt("futu_asset_acco_no");
            info.futu_order_pd_no = unpacker.GetInt("futu_order_pd_no");
            info.secu_exch_group_no = unpacker.GetInt("secu_exch_group_no");
            info.secu_asset_acco_no = unpacker.GetInt("secu_asset_acco_no");
            info.secu_order_pd_no = unpacker.GetInt("secu_order_pd_no");
            info.remark_info = unpacker.GetStr("remark_info");
            pubL_19_304_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_304_InfoList.Add((pubL_19_304_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_查询期现对冲组合
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_19_304_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.comm_trd_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_TRD_TYPE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.hedg_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_HEDG_NAME_STR);
                    info.futu_exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_EXCH_GROUP_NO_INT);
                    info.futu_asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ASSET_ACCO_NO_INT);
                    info.futu_order_pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ORDER_PD_NO_INT);
                    info.secu_exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SECU_EXCH_GROUP_NO_INT);
                    info.secu_asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SECU_ASSET_ACCO_NO_INT);
                    info.secu_order_pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SECU_ORDER_PD_NO_INT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    pubL_19_304_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_19_401_Response : IResponse
    {
        #region 构造函数
        public pubL_19_401_Response()
        {
            this.pubL_19_401_InfoList = new ObservableCollection<pubL_19_401_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_401_Info> pubL_19_401_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_401_Info info = new pubL_19_401_Info();
            pubL_19_401_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_401_InfoList.Add((pubL_19_401_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_新增期现对冲方案信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_19_401_Info();
                pubL_19_401_InfoList.Add(info);
            }
        }
    }

    public class pubL_19_402_Response : IResponse
    {
        #region 构造函数
        public pubL_19_402_Response()
        {
            this.pubL_19_402_InfoList = new ObservableCollection<pubL_19_402_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_402_Info> pubL_19_402_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_402_Info info = new pubL_19_402_Info();
            pubL_19_402_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_402_InfoList.Add((pubL_19_402_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_修改期现对冲方案信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_19_402_Info();
                pubL_19_402_InfoList.Add(info);
            }
        }
    }

    public class pubL_19_403_Response : IResponse
    {
        #region 构造函数
        public pubL_19_403_Response()
        {
            this.pubL_19_403_InfoList = new ObservableCollection<pubL_19_403_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_403_Info> pubL_19_403_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_403_Info info = new pubL_19_403_Info();
            pubL_19_403_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_403_InfoList.Add((pubL_19_403_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_删除期现对冲方案信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_19_403_Info();
                pubL_19_403_InfoList.Add(info);
            }
        }
    }

    public class pubL_19_404_Response : IResponse
    {
        #region 构造函数
        public pubL_19_404_Response()
        {
            this.pubL_19_404_InfoList = new ObservableCollection<pubL_19_404_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_404_Info> pubL_19_404_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_404_Info info = new pubL_19_404_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.comm_trd_type = unpacker.GetInt("comm_trd_type");
            info.hedg_plan_name = unpacker.GetStr("hedg_plan_name");
            info.opor_no = unpacker.GetInt("opor_no");
            info.co_no = unpacker.GetInt("co_no");
            info.contrc_code_no = unpacker.GetInt("contrc_code_no");
            info.futu_qty = unpacker.GetDouble("futu_qty");
            info.basket_qty = unpacker.GetDouble("basket_qty");
            info.basket_id = unpacker.GetInt64("basket_id");
            info.plan_type = unpacker.GetInt("plan_type");
            info.hedg_no = unpacker.GetInt64("hedg_no");
            info.hedging_pankou = unpacker.GetDouble("hedging_pankou");
            info.futu_price_offset = unpacker.GetDouble("futu_price_offset");
            info.price_offset = unpacker.GetDouble("price_offset");
            info.target_base_diff = unpacker.GetDouble("target_base_diff");
            info.template_base_diff = unpacker.GetDouble("template_base_diff");
            info.up_value_ratio = unpacker.GetDouble("up_value_ratio");
            info.down_value_ratio = unpacker.GetDouble("down_value_ratio");
            info.stop_value_ratio = unpacker.GetDouble("stop_value_ratio");
            info.cash_replace_amt = unpacker.GetDouble("cash_replace_amt");
            info.remark_info = unpacker.GetStr("remark_info");
            pubL_19_404_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_404_InfoList.Add((pubL_19_404_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_查询期现对冲方案信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_19_404_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.comm_trd_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_TRD_TYPE_INT);
                    info.hedg_plan_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_HEDG_PLAN_NAME_STR);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    info.futu_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_QTY_FLOAT);
                    info.basket_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_QTY_FLOAT);
                    info.basket_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_ID_INT64);
                    info.plan_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PLAN_TYPE_INT);
                    info.hedg_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_HEDG_NO_INT64);
                    info.hedging_pankou = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HEDGING_PANKOU_FLOAT);
                    info.futu_price_offset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_PRICE_OFFSET_FLOAT);
                    info.price_offset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_OFFSET_FLOAT);
                    info.target_base_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_BASE_DIFF_FLOAT);
                    info.template_base_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TEMPLATE_BASE_DIFF_FLOAT);
                    info.up_value_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UP_VALUE_RATIO_FLOAT);
                    info.down_value_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DOWN_VALUE_RATIO_FLOAT);
                    info.stop_value_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOP_VALUE_RATIO_FLOAT);
                    info.cash_replace_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_REPLACE_AMT_FLOAT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    pubL_19_404_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_19_501_Response : IResponse
    {
        #region 构造函数
        public pubL_19_501_Response()
        {
            this.pubL_19_501_InfoList = new ObservableCollection<pubL_19_501_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_501_Info> pubL_19_501_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_501_Info info = new pubL_19_501_Info();
            pubL_19_501_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_501_InfoList.Add((pubL_19_501_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_新增操作员可设置操作员
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_19_501_Info();
                pubL_19_501_InfoList.Add(info);
            }
        }
    }

    public class pubL_19_502_Response : IResponse
    {
        #region 构造函数
        public pubL_19_502_Response()
        {
            this.pubL_19_502_InfoList = new ObservableCollection<pubL_19_502_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_502_Info> pubL_19_502_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_502_Info info = new pubL_19_502_Info();
            pubL_19_502_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_502_InfoList.Add((pubL_19_502_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_删除操作员可设置操作员
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_19_502_Info();
                pubL_19_502_InfoList.Add(info);
            }
        }
    }

    public class pubL_19_503_Response : IResponse
    {
        #region 构造函数
        public pubL_19_503_Response()
        {
            this.pubL_19_503_InfoList = new ObservableCollection<pubL_19_503_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_503_Info> pubL_19_503_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_503_Info info = new pubL_19_503_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.update_date = unpacker.GetInt("update_date");
            info.update_time = unpacker.GetInt("update_time");
            info.opor_no = unpacker.GetInt("opor_no");
            info.allow_opor_no = unpacker.GetInt("allow_opor_no");
            pubL_19_503_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_503_InfoList.Add((pubL_19_503_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_查询操作员可设置操作员
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_19_503_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    info.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.allow_opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_OPOR_NO_INT);
                    pubL_19_503_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_19_504_Response : IResponse
    {
        #region 构造函数
        public pubL_19_504_Response()
        {
            this.pubL_19_504_InfoList = new ObservableCollection<pubL_19_504_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_504_Info> pubL_19_504_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_504_Info info = new pubL_19_504_Info();
            info.exch_group_no_str = unpacker.GetStr("exch_group_no_str");
            pubL_19_504_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_504_InfoList.Add((pubL_19_504_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_获取注销交易组串
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_19_504_Info();
                info.exch_group_no_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_STR_STR);
                pubL_19_504_InfoList.Add(info);
            }
        }
    }

    public class pubL_19_505_Response : IResponse
    {
        #region 构造函数
        public pubL_19_505_Response()
        {
            this.pubL_19_505_InfoList = new ObservableCollection<pubL_19_505_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_505_Info> pubL_19_505_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_505_Info info = new pubL_19_505_Info();
            pubL_19_505_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_505_InfoList.Add((pubL_19_505_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_更新基金产品行情
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_19_505_Info();
                pubL_19_505_InfoList.Add(info);
            }
        }
    }

    public class pubL_19_506_Response : IResponse
    {
        #region 构造函数
        public pubL_19_506_Response()
        {
            this.pubL_19_506_InfoList = new ObservableCollection<pubL_19_506_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_506_Info> pubL_19_506_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_506_Info info = new pubL_19_506_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_name = unpacker.GetStr("stock_name");
            info.pd_no = unpacker.GetInt("pd_no");
            info.last_price = unpacker.GetDouble("last_price");
            pubL_19_506_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_506_InfoList.Add((pubL_19_506_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_查询基金产品行情
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_19_506_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    pubL_19_506_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_19_507_Response : IResponse
    {
        #region 构造函数
        public pubL_19_507_Response()
        {
            this.pubL_19_507_InfoList = new ObservableCollection<pubL_19_507_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_507_Info> pubL_19_507_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_507_Info info = new pubL_19_507_Info();
            pubL_19_507_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_507_InfoList.Add((pubL_19_507_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_修改操作员索引值
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_19_507_Info();
                pubL_19_507_InfoList.Add(info);
            }
        }
    }

    public class pubL_19_508_Response : IResponse
    {
        #region 构造函数
        public pubL_19_508_Response()
        {
            this.pubL_19_508_InfoList = new ObservableCollection<pubL_19_508_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_508_Info> pubL_19_508_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_508_Info info = new pubL_19_508_Info();
            pubL_19_508_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_508_InfoList.Add((pubL_19_508_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_重置操作员登录错误次数
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_19_508_Info();
                pubL_19_508_InfoList.Add(info);
            }
        }
    }

    public class pubL_19_96_Response : IResponse
    {
        #region 构造函数
        public pubL_19_96_Response()
        {
            this.pubL_19_96_InfoList = new ObservableCollection<pubL_19_96_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_19_96_Info> pubL_19_96_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_19_96_Info info = new pubL_19_96_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.update_date = unpacker.GetInt("update_date");
            info.update_time = unpacker.GetInt("update_time");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.co_no = unpacker.GetInt("co_no");
            info.exch_group_code = unpacker.GetStr("exch_group_code");
            info.exch_group_name = unpacker.GetStr("exch_group_name");
            info.exch_group_status = unpacker.GetStr("exch_group_status");
            info.default_group_flag = unpacker.GetInt("default_group_flag");
            info.pd_no = unpacker.GetInt("pd_no");
            info.first_asset = unpacker.GetDouble("first_asset");
            info.pre_nav = unpacker.GetDouble("pre_nav");
            info.exch_group_dist_pd_amt = unpacker.GetDouble("exch_group_dist_pd_amt");
            info.exch_group_pd_share = unpacker.GetDouble("exch_group_pd_share");
            info.allow_exch = unpacker.GetStr("allow_exch");
            info.allow_stock_type = unpacker.GetStr("allow_stock_type");
            info.busi_config_str = unpacker.GetStr("busi_config_str");
            info.market_price_ratio = unpacker.GetDouble("market_price_ratio");
            info.forbid_order_dir = unpacker.GetStr("forbid_order_dir");
            info.trade_acco = unpacker.GetStr("trade_acco");
            info.weight_value = unpacker.GetDouble("weight_value");
            info.remark_info = unpacker.GetStr("remark_info");
            info.futu_default_group_flag = unpacker.GetInt("futu_default_group_flag");
            info.fina_loan_default_group_flag = unpacker.GetInt("fina_loan_default_group_flag");
            pubL_19_96_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_19_96_InfoList.Add((pubL_19_96_Info)info);
        }
        #endregion

        //逻辑_公共_用户客户端_运维端查询交易组信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_19_96_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    info.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.exch_group_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_CODE_STR);
                    info.exch_group_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NAME_STR);
                    info.exch_group_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_STATUS_STR);
                    info.default_group_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEFAULT_GROUP_FLAG_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.first_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FIRST_ASSET_FLOAT);
                    info.pre_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_NAV_FLOAT);
                    info.exch_group_dist_pd_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_DIST_PD_AMT_FLOAT);
                    info.exch_group_pd_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_PD_SHARE_FLOAT);
                    info.allow_exch = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_EXCH_STR);
                    info.allow_stock_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_STOCK_TYPE_STR);
                    info.busi_config_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_CONFIG_STR_STR);
                    info.market_price_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_PRICE_RATIO_FLOAT);
                    info.forbid_order_dir = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FORBID_ORDER_DIR_STR);
                    info.trade_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_ACCO_STR);
                    info.weight_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WEIGHT_VALUE_FLOAT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    info.futu_default_group_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_DEFAULT_GROUP_FLAG_INT);
                    info.fina_loan_default_group_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FINA_LOAN_DEFAULT_GROUP_FLAG_INT);
                    pubL_19_96_InfoList.Add(info);
                }
            }
        }
    }

}
