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
    public class pubL_5_1_Response : IResponse
    {
        #region 构造函数
        public pubL_5_1_Response()
        {
            this.pubL_5_1_InfoList = new ObservableCollection<pubL_5_1_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_5_1_Info> pubL_5_1_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_5_1_Info info = new pubL_5_1_Info();
            pubL_5_1_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_5_1_InfoList.Add((pubL_5_1_Info)info);
        }
        #endregion

        //逻辑_公共_用户_新增操作员信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_5_1_Info();
                pubL_5_1_InfoList.Add(info);
            }
        }
    }

    public class pubL_5_2_Response : IResponse
    {
        #region 构造函数
        public pubL_5_2_Response()
        {
            this.pubL_5_2_InfoList = new ObservableCollection<pubL_5_2_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_5_2_Info> pubL_5_2_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_5_2_Info info = new pubL_5_2_Info();
            pubL_5_2_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_5_2_InfoList.Add((pubL_5_2_Info)info);
        }
        #endregion

        //逻辑_公共_用户_修改操作员信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_5_2_Info();
                pubL_5_2_InfoList.Add(info);
            }
        }
    }

    public class pubL_5_4_Response : IResponse
    {
        #region 构造函数
        public pubL_5_4_Response()
        {
            this.pubL_5_4_InfoList = new ObservableCollection<pubL_5_4_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_5_4_Info> pubL_5_4_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_5_4_Info info = new pubL_5_4_Info();
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
            pubL_5_4_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_5_4_InfoList.Add((pubL_5_4_Info)info);
        }
        #endregion

        //逻辑_公共_用户_查询操作员信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_5_4_Info();
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
                    pubL_5_4_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_5_5_Response : IResponse
    {
        #region 构造函数
        public pubL_5_5_Response()
        {
            this.pubL_5_5_InfoList = new ObservableCollection<pubL_5_5_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_5_5_Info> pubL_5_5_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_5_5_Info info = new pubL_5_5_Info();
            pubL_5_5_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_5_5_InfoList.Add((pubL_5_5_Info)info);
        }
        #endregion

        //逻辑_公共_用户_冻结操作员
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_5_5_Info();
                pubL_5_5_InfoList.Add(info);
            }
        }
    }

    public class pubL_5_6_Response : IResponse
    {
        #region 构造函数
        public pubL_5_6_Response()
        {
            this.pubL_5_6_InfoList = new ObservableCollection<pubL_5_6_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_5_6_Info> pubL_5_6_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_5_6_Info info = new pubL_5_6_Info();
            pubL_5_6_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_5_6_InfoList.Add((pubL_5_6_Info)info);
        }
        #endregion

        //逻辑_公共_用户_解冻操作员
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_5_6_Info();
                pubL_5_6_InfoList.Add(info);
            }
        }
    }

    public class pubL_5_7_Response : IResponse
    {
        #region 构造函数
        public pubL_5_7_Response()
        {
            this.pubL_5_7_InfoList = new ObservableCollection<pubL_5_7_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_5_7_Info> pubL_5_7_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_5_7_Info info = new pubL_5_7_Info();
            pubL_5_7_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_5_7_InfoList.Add((pubL_5_7_Info)info);
        }
        #endregion

        //逻辑_公共_用户_注销操作员
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_5_7_Info();
                pubL_5_7_InfoList.Add(info);
            }
        }
    }

    public class pubL_5_9_Response : IResponse
    {
        #region 构造函数
        public pubL_5_9_Response()
        {
            this.pubL_5_9_InfoList = new ObservableCollection<pubL_5_9_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_5_9_Info> pubL_5_9_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_5_9_Info info = new pubL_5_9_Info();
            pubL_5_9_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_5_9_InfoList.Add((pubL_5_9_Info)info);
        }
        #endregion

        //逻辑_公共_用户_修改操作员密码
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_5_9_Info();
                pubL_5_9_InfoList.Add(info);
            }
        }
    }

    public class pubL_5_10_Response : IResponse
    {
        #region 构造函数
        public pubL_5_10_Response()
        {
            this.pubL_5_10_InfoList = new ObservableCollection<pubL_5_10_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_5_10_Info> pubL_5_10_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_5_10_Info info = new pubL_5_10_Info();
            pubL_5_10_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_5_10_InfoList.Add((pubL_5_10_Info)info);
        }
        #endregion

        //逻辑_公共_用户_重置操作员密码
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_5_10_Info();
                pubL_5_10_InfoList.Add(info);
            }
        }
    }

    public class pubL_5_11_Response : IResponse
    {
        #region 构造函数
        public pubL_5_11_Response()
        {
            this.pubL_5_11_InfoList = new ObservableCollection<pubL_5_11_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_5_11_Info> pubL_5_11_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_5_11_Info info = new pubL_5_11_Info();
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
            pubL_5_11_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_5_11_InfoList.Add((pubL_5_11_Info)info);
        }
        #endregion

        //逻辑_公共_用户_查询操作员信息流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_5_11_Info();
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
                    pubL_5_11_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_5_12_Response : IResponse
    {
        #region 构造函数
        public pubL_5_12_Response()
        {
            this.pubL_5_12_InfoList = new ObservableCollection<pubL_5_12_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_5_12_Info> pubL_5_12_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_5_12_Info info = new pubL_5_12_Info();
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
            pubL_5_12_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_5_12_InfoList.Add((pubL_5_12_Info)info);
        }
        #endregion

        //逻辑_公共_用户_查询历史操作员信息流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_5_12_Info();
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
                    pubL_5_12_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_5_13_Response : IResponse
    {
        #region 构造函数
        public pubL_5_13_Response()
        {
            this.pubL_5_13_InfoList = new ObservableCollection<pubL_5_13_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_5_13_Info> pubL_5_13_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_5_13_Info info = new pubL_5_13_Info();
            info.co_no = unpacker.GetInt("co_no");
            pubL_5_13_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_5_13_InfoList.Add((pubL_5_13_Info)info);
        }
        #endregion

        //逻辑_公共_用户_检查操作员存在
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_5_13_Info();
                info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                pubL_5_13_InfoList.Add(info);
            }
        }
    }

    public class pubL_5_14_Response : IResponse
    {
        #region 构造函数
        public pubL_5_14_Response()
        {
            this.pubL_5_14_InfoList = new ObservableCollection<pubL_5_14_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_5_14_Info> pubL_5_14_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_5_14_Info info = new pubL_5_14_Info();
            info.target_opor_no = unpacker.GetInt("target_opor_no");
            pubL_5_14_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_5_14_InfoList.Add((pubL_5_14_Info)info);
        }
        #endregion

        //逻辑_公共_用户_获取操作员编号
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_5_14_Info();
                info.target_opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_OPOR_NO_INT);
                pubL_5_14_InfoList.Add(info);
            }
        }
    }

    public class pubL_5_21_Response : IResponse
    {
        #region 构造函数
        public pubL_5_21_Response()
        {
            this.pubL_5_21_InfoList = new ObservableCollection<pubL_5_21_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_5_21_Info> pubL_5_21_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_5_21_Info info = new pubL_5_21_Info();
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
            info.co_type = unpacker.GetInt("co_type");
            pubL_5_21_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_5_21_InfoList.Add((pubL_5_21_Info)info);
        }
        #endregion

        //逻辑_公共_用户_操作员登录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_5_21_Info();
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
                info.co_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_TYPE_INT);
                pubL_5_21_InfoList.Add(info);
            }
        }
    }

    public class pubL_5_22_Response : IResponse
    {
        #region 构造函数
        public pubL_5_22_Response()
        {
            this.pubL_5_22_InfoList = new ObservableCollection<pubL_5_22_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_5_22_Info> pubL_5_22_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_5_22_Info info = new pubL_5_22_Info();
            pubL_5_22_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_5_22_InfoList.Add((pubL_5_22_Info)info);
        }
        #endregion

        //逻辑_公共_用户_操作员退出
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_5_22_Info();
                pubL_5_22_InfoList.Add(info);
            }
        }
    }

    public class pubL_5_41_Response : IResponse
    {
        #region 构造函数
        public pubL_5_41_Response()
        {
            this.pubL_5_41_InfoList = new ObservableCollection<pubL_5_41_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_5_41_Info> pubL_5_41_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_5_41_Info info = new pubL_5_41_Info();
            pubL_5_41_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_5_41_InfoList.Add((pubL_5_41_Info)info);
        }
        #endregion

        //逻辑_公共_用户_新增操作员可操作机构
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_5_41_Info();
                pubL_5_41_InfoList.Add(info);
            }
        }
    }

    public class pubL_5_42_Response : IResponse
    {
        #region 构造函数
        public pubL_5_42_Response()
        {
            this.pubL_5_42_InfoList = new ObservableCollection<pubL_5_42_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_5_42_Info> pubL_5_42_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_5_42_Info info = new pubL_5_42_Info();
            pubL_5_42_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_5_42_InfoList.Add((pubL_5_42_Info)info);
        }
        #endregion

        //逻辑_公共_用户_删除操作员可操作机构
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_5_42_Info();
                pubL_5_42_InfoList.Add(info);
            }
        }
    }

    public class pubL_5_44_Response : IResponse
    {
        #region 构造函数
        public pubL_5_44_Response()
        {
            this.pubL_5_44_InfoList = new ObservableCollection<pubL_5_44_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_5_44_Info> pubL_5_44_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_5_44_Info info = new pubL_5_44_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.update_date = unpacker.GetInt("update_date");
            info.update_time = unpacker.GetInt("update_time");
            info.opor_no = unpacker.GetInt("opor_no");
            info.co_no = unpacker.GetInt("co_no");
            info.oper_rights = unpacker.GetInt("oper_rights");
            pubL_5_44_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_5_44_InfoList.Add((pubL_5_44_Info)info);
        }
        #endregion

        //逻辑_公共_用户_查询操作员可操作机构
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_5_44_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    info.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.oper_rights = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_RIGHTS_INT);
                    pubL_5_44_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_5_65_Response : IResponse
    {
        #region 构造函数
        public pubL_5_65_Response()
        {
            this.pubL_5_65_InfoList = new ObservableCollection<pubL_5_65_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_5_65_Info> pubL_5_65_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_5_65_Info info = new pubL_5_65_Info();
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.co_no = unpacker.GetInt("co_no");
            info.exch_group_code = unpacker.GetStr("exch_group_code");
            info.exch_group_name = unpacker.GetStr("exch_group_name");
            info.exch_group_status = unpacker.GetStr("exch_group_status");
            info.default_group_flag = unpacker.GetInt("default_group_flag");
            info.pd_no = unpacker.GetInt("pd_no");
            pubL_5_65_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_5_65_InfoList.Add((pubL_5_65_Info)info);
        }
        #endregion

        //逻辑_公共_用户_查询全部交易组
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_5_65_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.exch_group_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_CODE_STR);
                    info.exch_group_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NAME_STR);
                    info.exch_group_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_STATUS_STR);
                    info.default_group_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEFAULT_GROUP_FLAG_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    pubL_5_65_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_5_201_Response : IResponse
    {
        #region 构造函数
        public pubL_5_201_Response()
        {
            this.pubL_5_201_InfoList = new ObservableCollection<pubL_5_201_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_5_201_Info> pubL_5_201_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_5_201_Info info = new pubL_5_201_Info();
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
            info.allow_oper_mac = unpacker.GetStr("allow_oper_mac");
            pubL_5_201_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_5_201_InfoList.Add((pubL_5_201_Info)info);
        }
        #endregion

        //逻辑_公共_用户_查询全部操作员信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_5_201_Info();
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
                    info.allow_oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_OPER_MAC_STR);
                    pubL_5_201_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_5_202_Response : IResponse
    {
        #region 构造函数
        public pubL_5_202_Response()
        {
            this.pubL_5_202_InfoList = new ObservableCollection<pubL_5_202_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_5_202_Info> pubL_5_202_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_5_202_Info info = new pubL_5_202_Info();
            info.opor_no = unpacker.GetInt("opor_no");
            info.exch_group_no_rights_str = unpacker.GetStr("exch_group_no_rights_str");
            pubL_5_202_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_5_202_InfoList.Add((pubL_5_202_Info)info);
        }
        #endregion

        //逻辑_公共_用户_获取操作员交易组权限串
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_5_202_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.exch_group_no_rights_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_RIGHTS_STR_STR);
                    pubL_5_202_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_5_203_Response : IResponse
    {
        #region 构造函数
        public pubL_5_203_Response()
        {
            this.pubL_5_203_InfoList = new ObservableCollection<pubL_5_203_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_5_203_Info> pubL_5_203_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_5_203_Info info = new pubL_5_203_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.opor_no = unpacker.GetInt("opor_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.abolish_status = unpacker.GetStr("abolish_status");
            pubL_5_203_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_5_203_InfoList.Add((pubL_5_203_Info)info);
        }
        #endregion

        //逻辑_公共_用户_获取操作员交易组权限
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_5_203_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.abolish_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ABOLISH_STATUS_STR);
                    pubL_5_203_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_5_204_Response : IResponse
    {
        #region 构造函数
        public pubL_5_204_Response()
        {
            this.pubL_5_204_InfoList = new ObservableCollection<pubL_5_204_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_5_204_Info> pubL_5_204_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_5_204_Info info = new pubL_5_204_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.update_date = unpacker.GetInt("update_date");
            info.update_time = unpacker.GetInt("update_time");
            info.opor_no = unpacker.GetInt("opor_no");
            info.allow_opor_no = unpacker.GetInt("allow_opor_no");
            pubL_5_204_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_5_204_InfoList.Add((pubL_5_204_Info)info);
        }
        #endregion

        //逻辑_公共_用户_查询操作员可设置操作员
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_5_204_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    info.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.allow_opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_OPOR_NO_INT);
                    pubL_5_204_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_5_205_Response : IResponse
    {
        #region 构造函数
        public pubL_5_205_Response()
        {
            this.pubL_5_205_InfoList = new ObservableCollection<pubL_5_205_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_5_205_Info> pubL_5_205_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_5_205_Info info = new pubL_5_205_Info();
            pubL_5_205_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_5_205_InfoList.Add((pubL_5_205_Info)info);
        }
        #endregion

        //逻辑_公共_用户_冻结交易组
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_5_205_Info();
                pubL_5_205_InfoList.Add(info);
            }
        }
    }

    public class pubL_5_206_Response : IResponse
    {
        #region 构造函数
        public pubL_5_206_Response()
        {
            this.pubL_5_206_InfoList = new ObservableCollection<pubL_5_206_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_5_206_Info> pubL_5_206_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_5_206_Info info = new pubL_5_206_Info();
            pubL_5_206_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_5_206_InfoList.Add((pubL_5_206_Info)info);
        }
        #endregion

        //逻辑_公共_用户_解冻交易组
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_5_206_Info();
                pubL_5_206_InfoList.Add(info);
            }
        }
    }

    public class pubL_5_207_Response : IResponse
    {
        #region 构造函数
        public pubL_5_207_Response()
        {
            this.pubL_5_207_InfoList = new ObservableCollection<pubL_5_207_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_5_207_Info> pubL_5_207_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_5_207_Info info = new pubL_5_207_Info();
            pubL_5_207_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_5_207_InfoList.Add((pubL_5_207_Info)info);
        }
        #endregion

        //逻辑_公共_用户_更新交易组禁止订单方向
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_5_207_Info();
                pubL_5_207_InfoList.Add(info);
            }
        }
    }

    public class pubL_5_208_Response : IResponse
    {
        #region 构造函数
        public pubL_5_208_Response()
        {
            this.pubL_5_208_InfoList = new ObservableCollection<pubL_5_208_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_5_208_Info> pubL_5_208_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_5_208_Info info = new pubL_5_208_Info();
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            pubL_5_208_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_5_208_InfoList.Add((pubL_5_208_Info)info);
        }
        #endregion

        //逻辑_公共_用户_新增交易组信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_5_208_Info();
                info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                pubL_5_208_InfoList.Add(info);
            }
        }
    }

    public class pubL_5_209_Response : IResponse
    {
        #region 构造函数
        public pubL_5_209_Response()
        {
            this.pubL_5_209_InfoList = new ObservableCollection<pubL_5_209_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_5_209_Info> pubL_5_209_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_5_209_Info info = new pubL_5_209_Info();
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
            pubL_5_209_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_5_209_InfoList.Add((pubL_5_209_Info)info);
        }
        #endregion

        //逻辑_公共_用户_查询交易组信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_5_209_Info();
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
                    pubL_5_209_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_5_210_Response : IResponse
    {
        #region 构造函数
        public pubL_5_210_Response()
        {
            this.pubL_5_210_InfoList = new ObservableCollection<pubL_5_210_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_5_210_Info> pubL_5_210_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_5_210_Info info = new pubL_5_210_Info();
            pubL_5_210_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_5_210_InfoList.Add((pubL_5_210_Info)info);
        }
        #endregion

        //逻辑_公共_用户_修改交易组信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_5_210_Info();
                pubL_5_210_InfoList.Add(info);
            }
        }
    }

    public class pubL_5_211_Response : IResponse
    {
        #region 构造函数
        public pubL_5_211_Response()
        {
            this.pubL_5_211_InfoList = new ObservableCollection<pubL_5_211_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_5_211_Info> pubL_5_211_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_5_211_Info info = new pubL_5_211_Info();
            pubL_5_211_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_5_211_InfoList.Add((pubL_5_211_Info)info);
        }
        #endregion

        //逻辑_公共_用户_注销交易组
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_5_211_Info();
                pubL_5_211_InfoList.Add(info);
            }
        }
    }

    public class pubL_5_212_Response : IResponse
    {
        #region 构造函数
        public pubL_5_212_Response()
        {
            this.pubL_5_212_InfoList = new ObservableCollection<pubL_5_212_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_5_212_Info> pubL_5_212_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_5_212_Info info = new pubL_5_212_Info();
            pubL_5_212_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_5_212_InfoList.Add((pubL_5_212_Info)info);
        }
        #endregion

        //逻辑_公共_用户_新增操作员可操作操作员
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_5_212_Info();
                pubL_5_212_InfoList.Add(info);
            }
        }
    }

    public class pubL_5_213_Response : IResponse
    {
        #region 构造函数
        public pubL_5_213_Response()
        {
            this.pubL_5_213_InfoList = new ObservableCollection<pubL_5_213_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_5_213_Info> pubL_5_213_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_5_213_Info info = new pubL_5_213_Info();
            pubL_5_213_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_5_213_InfoList.Add((pubL_5_213_Info)info);
        }
        #endregion

        //逻辑_公共_用户_删除操作员可操作操作员
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_5_213_Info();
                pubL_5_213_InfoList.Add(info);
            }
        }
    }

    public class pubL_5_214_Response : IResponse
    {
        #region 构造函数
        public pubL_5_214_Response()
        {
            this.pubL_5_214_InfoList = new ObservableCollection<pubL_5_214_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_5_214_Info> pubL_5_214_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_5_214_Info info = new pubL_5_214_Info();
            pubL_5_214_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_5_214_InfoList.Add((pubL_5_214_Info)info);
        }
        #endregion

        //逻辑_公共_用户_新增操作员可操作产品
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_5_214_Info();
                pubL_5_214_InfoList.Add(info);
            }
        }
    }

    public class pubL_5_215_Response : IResponse
    {
        #region 构造函数
        public pubL_5_215_Response()
        {
            this.pubL_5_215_InfoList = new ObservableCollection<pubL_5_215_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_5_215_Info> pubL_5_215_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_5_215_Info info = new pubL_5_215_Info();
            pubL_5_215_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_5_215_InfoList.Add((pubL_5_215_Info)info);
        }
        #endregion

        //逻辑_公共_用户_删除操作员可操作产品
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_5_215_Info();
                pubL_5_215_InfoList.Add(info);
            }
        }
    }

    public class pubL_5_216_Response : IResponse
    {
        #region 构造函数
        public pubL_5_216_Response()
        {
            this.pubL_5_216_InfoList = new ObservableCollection<pubL_5_216_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_5_216_Info> pubL_5_216_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_5_216_Info info = new pubL_5_216_Info();
            pubL_5_216_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_5_216_InfoList.Add((pubL_5_216_Info)info);
        }
        #endregion

        //逻辑_公共_用户_新增操作员所属交易组
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_5_216_Info();
                pubL_5_216_InfoList.Add(info);
            }
        }
    }

    public class pubL_5_217_Response : IResponse
    {
        #region 构造函数
        public pubL_5_217_Response()
        {
            this.pubL_5_217_InfoList = new ObservableCollection<pubL_5_217_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_5_217_Info> pubL_5_217_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_5_217_Info info = new pubL_5_217_Info();
            pubL_5_217_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_5_217_InfoList.Add((pubL_5_217_Info)info);
        }
        #endregion

        //逻辑_公共_用户_删除操作员所属交易组
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_5_217_Info();
                pubL_5_217_InfoList.Add(info);
            }
        }
    }

}
