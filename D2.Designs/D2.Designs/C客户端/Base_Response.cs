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
    public class pubL_3_1_Response : IResponse
    {
        #region 构造函数
        public pubL_3_1_Response()
        {
            this.pubL_3_1_InfoList = new ObservableCollection<pubL_3_1_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_3_1_Info> pubL_3_1_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_3_1_Info info = new pubL_3_1_Info();
            pubL_3_1_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_3_1_InfoList.Add((pubL_3_1_Info)info);
        }
        #endregion

        //逻辑_公共_基础_设置系统信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_3_1_Info();
                pubL_3_1_InfoList.Add(info);
            }
        }
    }

    public class pubL_3_2_Response : IResponse
    {
        #region 构造函数
        public pubL_3_2_Response()
        {
            this.pubL_3_2_InfoList = new ObservableCollection<pubL_3_2_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_3_2_Info> pubL_3_2_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_3_2_Info info = new pubL_3_2_Info();
            pubL_3_2_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_3_2_InfoList.Add((pubL_3_2_Info)info);
        }
        #endregion

        //逻辑_公共_基础_设置系统非交易日期
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_3_2_Info();
                pubL_3_2_InfoList.Add(info);
            }
        }
    }

    public class pubL_3_3_Response : IResponse
    {
        #region 构造函数
        public pubL_3_3_Response()
        {
            this.pubL_3_3_InfoList = new ObservableCollection<pubL_3_3_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_3_3_Info> pubL_3_3_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_3_3_Info info = new pubL_3_3_Info();
            pubL_3_3_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_3_3_InfoList.Add((pubL_3_3_Info)info);
        }
        #endregion

        //逻辑_公共_基础_更新系统状态
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_3_3_Info();
                pubL_3_3_InfoList.Add(info);
            }
        }
    }

    public class pubL_3_4_Response : IResponse
    {
        #region 构造函数
        public pubL_3_4_Response()
        {
            this.pubL_3_4_InfoList = new ObservableCollection<pubL_3_4_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_3_4_Info> pubL_3_4_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_3_4_Info info = new pubL_3_4_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.sys_name = unpacker.GetStr("sys_name");
            info.sys_status = unpacker.GetStr("sys_status");
            info.init_date = unpacker.GetInt("init_date");
            info.no_exch_date_str = unpacker.GetStr("no_exch_date_str");
            info.allow_next_init_time = unpacker.GetInt("allow_next_init_time");
            info.sys_config_str = unpacker.GetStr("sys_config_str");
            info.client_version = unpacker.GetStr("client_version");
            info.manage_ver = unpacker.GetStr("manage_ver");
            info.admin_ver = unpacker.GetStr("admin_ver");
            info.update_addr = unpacker.GetStr("update_addr");
            info.dnload_addr = unpacker.GetStr("dnload_addr");
            pubL_3_4_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_3_4_InfoList.Add((pubL_3_4_Info)info);
        }
        #endregion

        //逻辑_公共_基础_获取系统信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_3_4_Info();
                info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                info.sys_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_SYS_NAME_STR);
                info.sys_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_SYS_STATUS_STR);
                info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                info.no_exch_date_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_NO_EXCH_DATE_STR_STR);
                info.allow_next_init_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_NEXT_INIT_TIME_INT);
                info.sys_config_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_SYS_CONFIG_STR_STR);
                info.client_version = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CLIENT_VERSION_STR);
                info.manage_ver = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MANAGE_VER_STR);
                info.admin_ver = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ADMIN_VER_STR);
                info.update_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_ADDR_STR);
                info.dnload_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DNLOAD_ADDR_STR);
                pubL_3_4_InfoList.Add(info);
            }
        }
    }

    public class pubL_3_5_Response : IResponse
    {
        #region 构造函数
        public pubL_3_5_Response()
        {
            this.pubL_3_5_InfoList = new ObservableCollection<pubL_3_5_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_3_5_Info> pubL_3_5_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_3_5_Info info = new pubL_3_5_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.opor_co_no = unpacker.GetInt("opor_co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.oper_mac = unpacker.GetStr("oper_mac");
            info.oper_ip_addr = unpacker.GetStr("oper_ip_addr");
            info.oper_info = unpacker.GetStr("oper_info");
            info.oper_way = unpacker.GetStr("oper_way");
            info.oper_menu_no = unpacker.GetInt("oper_menu_no");
            info.oper_func_code = unpacker.GetStr("oper_func_code");
            info.init_date = unpacker.GetInt("init_date");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_occur_info = unpacker.GetStr("jour_occur_info");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pubL_3_5_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_3_5_InfoList.Add((pubL_3_5_Info)info);
        }
        #endregion

        //逻辑_公共_基础_查询系统信息流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_3_5_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    info.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    info.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    info.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    info.oper_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MENU_NO_INT);
                    info.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_INFO_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pubL_3_5_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_3_6_Response : IResponse
    {
        #region 构造函数
        public pubL_3_6_Response()
        {
            this.pubL_3_6_InfoList = new ObservableCollection<pubL_3_6_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_3_6_Info> pubL_3_6_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_3_6_Info info = new pubL_3_6_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.opor_co_no = unpacker.GetInt("opor_co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.oper_mac = unpacker.GetStr("oper_mac");
            info.oper_ip_addr = unpacker.GetStr("oper_ip_addr");
            info.oper_info = unpacker.GetStr("oper_info");
            info.oper_way = unpacker.GetStr("oper_way");
            info.oper_menu_no = unpacker.GetInt("oper_menu_no");
            info.oper_func_code = unpacker.GetStr("oper_func_code");
            info.init_date = unpacker.GetInt("init_date");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_occur_info = unpacker.GetStr("jour_occur_info");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pubL_3_6_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_3_6_InfoList.Add((pubL_3_6_Info)info);
        }
        #endregion

        //逻辑_公共_基础_查询历史系统信息流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_3_6_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    info.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    info.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    info.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    info.oper_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MENU_NO_INT);
                    info.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_INFO_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pubL_3_6_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_3_7_Response : IResponse
    {
        #region 构造函数
        public pubL_3_7_Response()
        {
            this.pubL_3_7_InfoList = new ObservableCollection<pubL_3_7_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_3_7_Info> pubL_3_7_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_3_7_Info info = new pubL_3_7_Info();
            pubL_3_7_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_3_7_InfoList.Add((pubL_3_7_Info)info);
        }
        #endregion

        //逻辑_公共_基础_修改系统控制配置串
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_3_7_Info();
                pubL_3_7_InfoList.Add(info);
            }
        }
    }

    public class pubL_3_8_Response : IResponse
    {
        #region 构造函数
        public pubL_3_8_Response()
        {
            this.pubL_3_8_InfoList = new ObservableCollection<pubL_3_8_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_3_8_Info> pubL_3_8_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_3_8_Info info = new pubL_3_8_Info();
            info.mach_date = unpacker.GetInt("mach_date");
            info.mach_time = unpacker.GetInt("mach_time");
            pubL_3_8_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_3_8_InfoList.Add((pubL_3_8_Info)info);
        }
        #endregion

        //逻辑_公共_基础_获取机器日期时间
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_3_8_Info();
                info.mach_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MACH_DATE_INT);
                info.mach_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MACH_TIME_INT);
                pubL_3_8_InfoList.Add(info);
            }
        }
    }

    public class pubL_3_11_Response : IResponse
    {
        #region 构造函数
        public pubL_3_11_Response()
        {
            this.pubL_3_11_InfoList = new ObservableCollection<pubL_3_11_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_3_11_Info> pubL_3_11_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_3_11_Info info = new pubL_3_11_Info();
            pubL_3_11_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_3_11_InfoList.Add((pubL_3_11_Info)info);
        }
        #endregion

        //逻辑_公共_基础_新增机构信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_3_11_Info();
                pubL_3_11_InfoList.Add(info);
            }
        }
    }

    public class pubL_3_12_Response : IResponse
    {
        #region 构造函数
        public pubL_3_12_Response()
        {
            this.pubL_3_12_InfoList = new ObservableCollection<pubL_3_12_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_3_12_Info> pubL_3_12_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_3_12_Info info = new pubL_3_12_Info();
            pubL_3_12_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_3_12_InfoList.Add((pubL_3_12_Info)info);
        }
        #endregion

        //逻辑_公共_基础_修改机构信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_3_12_Info();
                pubL_3_12_InfoList.Add(info);
            }
        }
    }

    public class pubL_3_14_Response : IResponse
    {
        #region 构造函数
        public pubL_3_14_Response()
        {
            this.pubL_3_14_InfoList = new ObservableCollection<pubL_3_14_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_3_14_Info> pubL_3_14_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_3_14_Info info = new pubL_3_14_Info();
            pubL_3_14_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_3_14_InfoList.Add((pubL_3_14_Info)info);
        }
        #endregion

        //逻辑_公共_基础_冻结机构
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_3_14_Info();
                pubL_3_14_InfoList.Add(info);
            }
        }
    }

    public class pubL_3_15_Response : IResponse
    {
        #region 构造函数
        public pubL_3_15_Response()
        {
            this.pubL_3_15_InfoList = new ObservableCollection<pubL_3_15_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_3_15_Info> pubL_3_15_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_3_15_Info info = new pubL_3_15_Info();
            pubL_3_15_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_3_15_InfoList.Add((pubL_3_15_Info)info);
        }
        #endregion

        //逻辑_公共_基础_解冻机构
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_3_15_Info();
                pubL_3_15_InfoList.Add(info);
            }
        }
    }

    public class pubL_3_16_Response : IResponse
    {
        #region 构造函数
        public pubL_3_16_Response()
        {
            this.pubL_3_16_InfoList = new ObservableCollection<pubL_3_16_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_3_16_Info> pubL_3_16_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_3_16_Info info = new pubL_3_16_Info();
            pubL_3_16_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_3_16_InfoList.Add((pubL_3_16_Info)info);
        }
        #endregion

        //逻辑_公共_基础_注销机构
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_3_16_Info();
                pubL_3_16_InfoList.Add(info);
            }
        }
    }

    public class pubL_3_18_Response : IResponse
    {
        #region 构造函数
        public pubL_3_18_Response()
        {
            this.pubL_3_18_InfoList = new ObservableCollection<pubL_3_18_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_3_18_Info> pubL_3_18_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_3_18_Info info = new pubL_3_18_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.co_name = unpacker.GetStr("co_name");
            info.co_flname = unpacker.GetStr("co_flname");
            info.reg_code = unpacker.GetStr("reg_code");
            info.reg_addr = unpacker.GetStr("reg_addr");
            info.found_date = unpacker.GetInt("found_date");
            info.reg_date = unpacker.GetInt("reg_date");
            info.conta_addr = unpacker.GetStr("conta_addr");
            info.conta_name = unpacker.GetStr("conta_name");
            info.phone_number = unpacker.GetStr("phone_number");
            info.email = unpacker.GetStr("email");
            info.pd_qty_max = unpacker.GetInt("pd_qty_max");
            info.max_acco_count = unpacker.GetInt("max_acco_count");
            info.opor_qty_max = unpacker.GetInt("opor_qty_max");
            info.co_status = unpacker.GetStr("co_status");
            info.allow_exch = unpacker.GetStr("allow_exch");
            info.allow_stock_type = unpacker.GetStr("allow_stock_type");
            info.busi_config_str = unpacker.GetStr("busi_config_str");
            info.comm_appr_oper = unpacker.GetInt("comm_appr_oper");
            info.market_price_ratio = unpacker.GetDouble("market_price_ratio");
            info.mul_acco_trd_assign_set = unpacker.GetStr("mul_acco_trd_assign_set");
            info.mul_acco_trd_choice = unpacker.GetInt("mul_acco_trd_choice");
            info.mul_acco_trd_qty_set = unpacker.GetStr("mul_acco_trd_qty_set");
            info.genus_algo_strategy_set = unpacker.GetStr("genus_algo_strategy_set");
            info.base_crncy_type = unpacker.GetStr("base_crncy_type");
            pubL_3_18_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_3_18_InfoList.Add((pubL_3_18_Info)info);
        }
        #endregion

        //逻辑_公共_基础_查询机构信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_3_18_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.co_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CO_NAME_STR);
                    info.co_flname = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CO_FLNAME_STR);
                    info.reg_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REG_CODE_STR);
                    info.reg_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REG_ADDR_STR);
                    info.found_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FOUND_DATE_INT);
                    info.reg_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REG_DATE_INT);
                    info.conta_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTA_ADDR_STR);
                    info.conta_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTA_NAME_STR);
                    info.phone_number = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PHONE_NUMBER_STR);
                    info.email = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EMAIL_STR);
                    info.pd_qty_max = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_QTY_MAX_INT);
                    info.max_acco_count = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MAX_ACCO_COUNT_INT);
                    info.opor_qty_max = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_QTY_MAX_INT);
                    info.co_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CO_STATUS_STR);
                    info.allow_exch = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_EXCH_STR);
                    info.allow_stock_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_STOCK_TYPE_STR);
                    info.busi_config_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_CONFIG_STR_STR);
                    info.comm_appr_oper = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_OPER_INT);
                    info.market_price_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_PRICE_RATIO_FLOAT);
                    info.mul_acco_trd_assign_set = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MUL_ACCO_TRD_ASSIGN_SET_STR);
                    info.mul_acco_trd_choice = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MUL_ACCO_TRD_CHOICE_INT);
                    info.mul_acco_trd_qty_set = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MUL_ACCO_TRD_QTY_SET_STR);
                    info.genus_algo_strategy_set = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_GENUS_ALGO_STRATEGY_SET_STR);
                    info.base_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BASE_CRNCY_TYPE_STR);
                    pubL_3_18_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_3_19_Response : IResponse
    {
        #region 构造函数
        public pubL_3_19_Response()
        {
            this.pubL_3_19_InfoList = new ObservableCollection<pubL_3_19_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_3_19_Info> pubL_3_19_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_3_19_Info info = new pubL_3_19_Info();
            info.row_id = unpacker.GetInt64("row_id");
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
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pubL_3_19_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_3_19_InfoList.Add((pubL_3_19_Info)info);
        }
        #endregion

        //逻辑_公共_基础_查询机构信息流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_3_19_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
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
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pubL_3_19_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_3_20_Response : IResponse
    {
        #region 构造函数
        public pubL_3_20_Response()
        {
            this.pubL_3_20_InfoList = new ObservableCollection<pubL_3_20_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_3_20_Info> pubL_3_20_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_3_20_Info info = new pubL_3_20_Info();
            info.row_id = unpacker.GetInt64("row_id");
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
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pubL_3_20_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_3_20_InfoList.Add((pubL_3_20_Info)info);
        }
        #endregion

        //逻辑_公共_基础_查询历史机构信息流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_3_20_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
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
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pubL_3_20_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_3_21_Response : IResponse
    {
        #region 构造函数
        public pubL_3_21_Response()
        {
            this.pubL_3_21_InfoList = new ObservableCollection<pubL_3_21_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_3_21_Info> pubL_3_21_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_3_21_Info info = new pubL_3_21_Info();
            info.record_count = unpacker.GetInt("record_count");
            pubL_3_21_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_3_21_InfoList.Add((pubL_3_21_Info)info);
        }
        #endregion

        //逻辑_公共_基础_检查机构编号存在
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_3_21_Info();
                info.record_count = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RECORD_COUNT_INT);
                pubL_3_21_InfoList.Add(info);
            }
        }
    }

    public class pubL_3_22_Response : IResponse
    {
        #region 构造函数
        public pubL_3_22_Response()
        {
            this.pubL_3_22_InfoList = new ObservableCollection<pubL_3_22_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_3_22_Info> pubL_3_22_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_3_22_Info info = new pubL_3_22_Info();
            info.co_no = unpacker.GetInt("co_no");
            pubL_3_22_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_3_22_InfoList.Add((pubL_3_22_Info)info);
        }
        #endregion

        //逻辑_公共_基础_获取机构编号
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_3_22_Info();
                info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                pubL_3_22_InfoList.Add(info);
            }
        }
    }

    public class pubL_3_17_Response : IResponse
    {
        #region 构造函数
        public pubL_3_17_Response()
        {
            this.pubL_3_17_InfoList = new ObservableCollection<pubL_3_17_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_3_17_Info> pubL_3_17_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_3_17_Info info = new pubL_3_17_Info();
            pubL_3_17_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_3_17_InfoList.Add((pubL_3_17_Info)info);
        }
        #endregion

        //逻辑_公共_基础_修改机构业务范围
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_3_17_Info();
                pubL_3_17_InfoList.Add(info);
            }
        }
    }

    public class pubL_3_23_Response : IResponse
    {
        #region 构造函数
        public pubL_3_23_Response()
        {
            this.pubL_3_23_InfoList = new ObservableCollection<pubL_3_23_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_3_23_Info> pubL_3_23_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_3_23_Info info = new pubL_3_23_Info();
            pubL_3_23_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_3_23_InfoList.Add((pubL_3_23_Info)info);
        }
        #endregion

        //逻辑_公共_基础_修改机构业务控制配置串
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_3_23_Info();
                pubL_3_23_InfoList.Add(info);
            }
        }
    }

    public class pubL_3_24_Response : IResponse
    {
        #region 构造函数
        public pubL_3_24_Response()
        {
            this.pubL_3_24_InfoList = new ObservableCollection<pubL_3_24_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_3_24_Info> pubL_3_24_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_3_24_Info info = new pubL_3_24_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.co_name = unpacker.GetStr("co_name");
            info.co_type = unpacker.GetInt("co_type");
            info.co_status = unpacker.GetStr("co_status");
            pubL_3_24_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_3_24_InfoList.Add((pubL_3_24_Info)info);
        }
        #endregion

        //逻辑_公共_基础_查询机构列表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_3_24_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.co_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CO_NAME_STR);
                    info.co_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_TYPE_INT);
                    info.co_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CO_STATUS_STR);
                    pubL_3_24_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_3_31_Response : IResponse
    {
        #region 构造函数
        public pubL_3_31_Response()
        {
            this.pubL_3_31_InfoList = new ObservableCollection<pubL_3_31_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_3_31_Info> pubL_3_31_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_3_31_Info info = new pubL_3_31_Info();
            pubL_3_31_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_3_31_InfoList.Add((pubL_3_31_Info)info);
        }
        #endregion

        //逻辑_公共_基础_设置系统配置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_3_31_Info();
                pubL_3_31_InfoList.Add(info);
            }
        }
    }

    public class pubL_3_32_Response : IResponse
    {
        #region 构造函数
        public pubL_3_32_Response()
        {
            this.pubL_3_32_InfoList = new ObservableCollection<pubL_3_32_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_3_32_Info> pubL_3_32_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_3_32_Info info = new pubL_3_32_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.config_no = unpacker.GetInt64("config_no");
            info.config_name = unpacker.GetStr("config_name");
            info.config_choice_type = unpacker.GetInt("config_choice_type");
            info.config_value = unpacker.GetStr("config_value");
            info.dict_field_name = unpacker.GetStr("dict_field_name");
            info.config_memo = unpacker.GetStr("config_memo");
            pubL_3_32_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_3_32_InfoList.Add((pubL_3_32_Info)info);
        }
        #endregion

        //逻辑_公共_基础_查询系统配置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_3_32_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.config_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_NO_INT64);
                    info.config_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_NAME_STR);
                    info.config_choice_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_CHOICE_TYPE_INT);
                    info.config_value = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_VALUE_STR);
                    info.dict_field_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DICT_FIELD_NAME_STR);
                    info.config_memo = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_MEMO_STR);
                    pubL_3_32_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_3_33_Response : IResponse
    {
        #region 构造函数
        public pubL_3_33_Response()
        {
            this.pubL_3_33_InfoList = new ObservableCollection<pubL_3_33_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_3_33_Info> pubL_3_33_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_3_33_Info info = new pubL_3_33_Info();
            info.row_id = unpacker.GetInt64("row_id");
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
            info.config_no = unpacker.GetInt64("config_no");
            info.config_name = unpacker.GetStr("config_name");
            info.config_choice_type = unpacker.GetInt("config_choice_type");
            info.config_value = unpacker.GetStr("config_value");
            info.dict_field_name = unpacker.GetStr("dict_field_name");
            info.config_memo = unpacker.GetStr("config_memo");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pubL_3_33_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_3_33_InfoList.Add((pubL_3_33_Info)info);
        }
        #endregion

        //逻辑_公共_基础_查询系统配置流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_3_33_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
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
                    info.config_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_NO_INT64);
                    info.config_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_NAME_STR);
                    info.config_choice_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_CHOICE_TYPE_INT);
                    info.config_value = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_VALUE_STR);
                    info.dict_field_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DICT_FIELD_NAME_STR);
                    info.config_memo = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_MEMO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pubL_3_33_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_3_34_Response : IResponse
    {
        #region 构造函数
        public pubL_3_34_Response()
        {
            this.pubL_3_34_InfoList = new ObservableCollection<pubL_3_34_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_3_34_Info> pubL_3_34_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_3_34_Info info = new pubL_3_34_Info();
            info.row_id = unpacker.GetInt64("row_id");
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
            info.config_no = unpacker.GetInt64("config_no");
            info.config_name = unpacker.GetStr("config_name");
            info.config_choice_type = unpacker.GetInt("config_choice_type");
            info.config_value = unpacker.GetStr("config_value");
            info.dict_field_name = unpacker.GetStr("dict_field_name");
            info.config_memo = unpacker.GetStr("config_memo");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pubL_3_34_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_3_34_InfoList.Add((pubL_3_34_Info)info);
        }
        #endregion

        //逻辑_公共_基础_查询历史系统配置流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_3_34_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
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
                    info.config_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_NO_INT64);
                    info.config_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_NAME_STR);
                    info.config_choice_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_CHOICE_TYPE_INT);
                    info.config_value = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_VALUE_STR);
                    info.dict_field_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DICT_FIELD_NAME_STR);
                    info.config_memo = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_MEMO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pubL_3_34_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_3_35_Response : IResponse
    {
        #region 构造函数
        public pubL_3_35_Response()
        {
            this.pubL_3_35_InfoList = new ObservableCollection<pubL_3_35_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_3_35_Info> pubL_3_35_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_3_35_Info info = new pubL_3_35_Info();
            pubL_3_35_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_3_35_InfoList.Add((pubL_3_35_Info)info);
        }
        #endregion

        //逻辑_公共_基础_新增机构汇率
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_3_35_Info();
                pubL_3_35_InfoList.Add(info);
            }
        }
    }

    public class pubL_3_36_Response : IResponse
    {
        #region 构造函数
        public pubL_3_36_Response()
        {
            this.pubL_3_36_InfoList = new ObservableCollection<pubL_3_36_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_3_36_Info> pubL_3_36_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_3_36_Info info = new pubL_3_36_Info();
            pubL_3_36_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_3_36_InfoList.Add((pubL_3_36_Info)info);
        }
        #endregion

        //逻辑_公共_基础_修改机构汇率
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_3_36_Info();
                pubL_3_36_InfoList.Add(info);
            }
        }
    }

    public class pubL_3_37_Response : IResponse
    {
        #region 构造函数
        public pubL_3_37_Response()
        {
            this.pubL_3_37_InfoList = new ObservableCollection<pubL_3_37_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_3_37_Info> pubL_3_37_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_3_37_Info info = new pubL_3_37_Info();
            pubL_3_37_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_3_37_InfoList.Add((pubL_3_37_Info)info);
        }
        #endregion

        //逻辑_公共_基础_删除机构汇率
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_3_37_Info();
                pubL_3_37_InfoList.Add(info);
            }
        }
    }

    public class pubL_3_38_Response : IResponse
    {
        #region 构造函数
        public pubL_3_38_Response()
        {
            this.pubL_3_38_InfoList = new ObservableCollection<pubL_3_38_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_3_38_Info> pubL_3_38_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_3_38_Info info = new pubL_3_38_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.for_crncy_type = unpacker.GetStr("for_crncy_type");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.buy_exch_rate = unpacker.GetDouble("buy_exch_rate");
            info.sale_exch_rate = unpacker.GetDouble("sale_exch_rate");
            pubL_3_38_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_3_38_InfoList.Add((pubL_3_38_Info)info);
        }
        #endregion

        //逻辑_公共_基础_查询机构汇率
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_3_38_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.for_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FOR_CRNCY_TYPE_STR);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.buy_exch_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_EXCH_RATE_FLOAT);
                    info.sale_exch_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SALE_EXCH_RATE_FLOAT);
                    pubL_3_38_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_3_39_Response : IResponse
    {
        #region 构造函数
        public pubL_3_39_Response()
        {
            this.pubL_3_39_InfoList = new ObservableCollection<pubL_3_39_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_3_39_Info> pubL_3_39_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_3_39_Info info = new pubL_3_39_Info();
            info.row_id = unpacker.GetInt64("row_id");
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
            info.for_crncy_type = unpacker.GetStr("for_crncy_type");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.buy_exch_rate = unpacker.GetDouble("buy_exch_rate");
            info.sale_exch_rate = unpacker.GetDouble("sale_exch_rate");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pubL_3_39_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_3_39_InfoList.Add((pubL_3_39_Info)info);
        }
        #endregion

        //逻辑_公共_基础_查询机构汇率流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_3_39_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
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
                    info.for_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FOR_CRNCY_TYPE_STR);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.buy_exch_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_EXCH_RATE_FLOAT);
                    info.sale_exch_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SALE_EXCH_RATE_FLOAT);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pubL_3_39_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_3_40_Response : IResponse
    {
        #region 构造函数
        public pubL_3_40_Response()
        {
            this.pubL_3_40_InfoList = new ObservableCollection<pubL_3_40_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_3_40_Info> pubL_3_40_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_3_40_Info info = new pubL_3_40_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.opor_co_no = unpacker.GetInt("opor_co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.oper_mac = unpacker.GetStr("oper_mac");
            info.oper_ip_addr = unpacker.GetStr("oper_ip_addr");
            info.oper_info = unpacker.GetStr("oper_info");
            info.oper_menu_no = unpacker.GetInt("oper_menu_no");
            info.oper_func_code = unpacker.GetStr("oper_func_code");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.for_crncy_type = unpacker.GetStr("for_crncy_type");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.buy_exch_rate = unpacker.GetDouble("buy_exch_rate");
            info.sale_exch_rate = unpacker.GetDouble("sale_exch_rate");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pubL_3_40_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_3_40_InfoList.Add((pubL_3_40_Info)info);
        }
        #endregion

        //逻辑_公共_基础_查询历史机构汇率流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_3_40_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    info.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    info.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    info.oper_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MENU_NO_INT);
                    info.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.for_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FOR_CRNCY_TYPE_STR);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.buy_exch_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_EXCH_RATE_FLOAT);
                    info.sale_exch_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SALE_EXCH_RATE_FLOAT);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pubL_3_40_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_3_41_Response : IResponse
    {
        #region 构造函数
        public pubL_3_41_Response()
        {
            this.pubL_3_41_InfoList = new ObservableCollection<pubL_3_41_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_3_41_Info> pubL_3_41_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_3_41_Info info = new pubL_3_41_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.exch_no = unpacker.GetInt("exch_no");
            info.for_crncy_type = unpacker.GetStr("for_crncy_type");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.buy_ref_rate = unpacker.GetDouble("buy_ref_rate");
            info.sell_ref_rate = unpacker.GetDouble("sell_ref_rate");
            info.settle_buy_rate = unpacker.GetDouble("settle_buy_rate");
            info.settle_sell_rate = unpacker.GetDouble("settle_sell_rate");
            info.pboc_rate = unpacker.GetDouble("pboc_rate");
            pubL_3_41_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_3_41_InfoList.Add((pubL_3_41_Info)info);
        }
        #endregion

        //逻辑_公共_基础_查询港股通汇率信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_3_41_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.for_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FOR_CRNCY_TYPE_STR);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.buy_ref_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_REF_RATE_FLOAT);
                    info.sell_ref_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_REF_RATE_FLOAT);
                    info.settle_buy_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SETTLE_BUY_RATE_FLOAT);
                    info.settle_sell_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SETTLE_SELL_RATE_FLOAT);
                    info.pboc_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PBOC_RATE_FLOAT);
                    pubL_3_41_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_3_42_Response : IResponse
    {
        #region 构造函数
        public pubL_3_42_Response()
        {
            this.pubL_3_42_InfoList = new ObservableCollection<pubL_3_42_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_3_42_Info> pubL_3_42_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_3_42_Info info = new pubL_3_42_Info();
            pubL_3_42_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_3_42_InfoList.Add((pubL_3_42_Info)info);
        }
        #endregion

        //逻辑_公共_基础_新增港股通汇率信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_3_42_Info();
                pubL_3_42_InfoList.Add(info);
            }
        }
    }

    public class pubL_3_43_Response : IResponse
    {
        #region 构造函数
        public pubL_3_43_Response()
        {
            this.pubL_3_43_InfoList = new ObservableCollection<pubL_3_43_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_3_43_Info> pubL_3_43_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_3_43_Info info = new pubL_3_43_Info();
            pubL_3_43_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_3_43_InfoList.Add((pubL_3_43_Info)info);
        }
        #endregion

        //逻辑_公共_基础_删除港股通汇率信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_3_43_Info();
                pubL_3_43_InfoList.Add(info);
            }
        }
    }

    public class pubL_3_44_Response : IResponse
    {
        #region 构造函数
        public pubL_3_44_Response()
        {
            this.pubL_3_44_InfoList = new ObservableCollection<pubL_3_44_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_3_44_Info> pubL_3_44_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_3_44_Info info = new pubL_3_44_Info();
            pubL_3_44_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_3_44_InfoList.Add((pubL_3_44_Info)info);
        }
        #endregion

        //逻辑_公共_基础_更新港股通结算汇率
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_3_44_Info();
                pubL_3_44_InfoList.Add(info);
            }
        }
    }

    public class pubL_3_104_Response : IResponse
    {
        #region 构造函数
        public pubL_3_104_Response()
        {
            this.pubL_3_104_InfoList = new ObservableCollection<pubL_3_104_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_3_104_Info> pubL_3_104_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_3_104_Info info = new pubL_3_104_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.exch_no = unpacker.GetInt("exch_no");
            info.exch_name = unpacker.GetStr("exch_name");
            info.exch_code = unpacker.GetStr("exch_code");
            info.exch_type = unpacker.GetInt("exch_type");
            info.distric = unpacker.GetStr("distric");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.exch_crncy_type = unpacker.GetStr("exch_crncy_type");
            info.exch_status = unpacker.GetInt("exch_status");
            info.init_date = unpacker.GetInt("init_date");
            info.time_lag = unpacker.GetInt("time_lag");
            info.no_exch_date_str = unpacker.GetStr("no_exch_date_str");
            info.allow_next_init_time = unpacker.GetInt("allow_next_init_time");
            info.no_settle_date_str = unpacker.GetStr("no_settle_date_str");
            pubL_3_104_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_3_104_InfoList.Add((pubL_3_104_Info)info);
        }
        #endregion

        //逻辑_公共_基础_查询市场信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_3_104_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.exch_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NAME_STR);
                    info.exch_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CODE_STR);
                    info.exch_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_TYPE_INT);
                    info.distric = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DISTRIC_STR);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.exch_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR);
                    info.exch_status = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_STATUS_INT);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.time_lag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_LAG_INT);
                    info.no_exch_date_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_NO_EXCH_DATE_STR_STR);
                    info.allow_next_init_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_NEXT_INIT_TIME_INT);
                    info.no_settle_date_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_NO_SETTLE_DATE_STR_STR);
                    pubL_3_104_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_3_105_Response : IResponse
    {
        #region 构造函数
        public pubL_3_105_Response()
        {
            this.pubL_3_105_InfoList = new ObservableCollection<pubL_3_105_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_3_105_Info> pubL_3_105_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_3_105_Info info = new pubL_3_105_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.opor_co_no = unpacker.GetInt("opor_co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.oper_mac = unpacker.GetStr("oper_mac");
            info.oper_ip_addr = unpacker.GetStr("oper_ip_addr");
            info.oper_info = unpacker.GetStr("oper_info");
            info.oper_way = unpacker.GetStr("oper_way");
            info.oper_menu_no = unpacker.GetInt("oper_menu_no");
            info.oper_func_code = unpacker.GetStr("oper_func_code");
            info.init_date = unpacker.GetInt("init_date");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_occur_info = unpacker.GetStr("jour_occur_info");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pubL_3_105_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_3_105_InfoList.Add((pubL_3_105_Info)info);
        }
        #endregion

        //逻辑_公共_基础_查询市场信息流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_3_105_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    info.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    info.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    info.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    info.oper_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MENU_NO_INT);
                    info.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_INFO_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pubL_3_105_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_3_106_Response : IResponse
    {
        #region 构造函数
        public pubL_3_106_Response()
        {
            this.pubL_3_106_InfoList = new ObservableCollection<pubL_3_106_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_3_106_Info> pubL_3_106_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_3_106_Info info = new pubL_3_106_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.opor_co_no = unpacker.GetInt("opor_co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.oper_mac = unpacker.GetStr("oper_mac");
            info.oper_ip_addr = unpacker.GetStr("oper_ip_addr");
            info.oper_info = unpacker.GetStr("oper_info");
            info.oper_way = unpacker.GetStr("oper_way");
            info.oper_menu_no = unpacker.GetInt("oper_menu_no");
            info.oper_func_code = unpacker.GetStr("oper_func_code");
            info.init_date = unpacker.GetInt("init_date");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_occur_info = unpacker.GetStr("jour_occur_info");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pubL_3_106_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_3_106_InfoList.Add((pubL_3_106_Info)info);
        }
        #endregion

        //逻辑_公共_基础_查询历史市场信息流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_3_106_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    info.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    info.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    info.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    info.oper_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MENU_NO_INT);
                    info.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_INFO_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pubL_3_106_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_3_107_Response : IResponse
    {
        #region 构造函数
        public pubL_3_107_Response()
        {
            this.pubL_3_107_InfoList = new ObservableCollection<pubL_3_107_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_3_107_Info> pubL_3_107_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_3_107_Info info = new pubL_3_107_Info();
            pubL_3_107_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_3_107_InfoList.Add((pubL_3_107_Info)info);
        }
        #endregion

        //逻辑_公共_基础_设置市场非交易日期
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_3_107_Info();
                pubL_3_107_InfoList.Add(info);
            }
        }
    }

    public class pubL_3_108_Response : IResponse
    {
        #region 构造函数
        public pubL_3_108_Response()
        {
            this.pubL_3_108_InfoList = new ObservableCollection<pubL_3_108_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_3_108_Info> pubL_3_108_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_3_108_Info info = new pubL_3_108_Info();
            pubL_3_108_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_3_108_InfoList.Add((pubL_3_108_Info)info);
        }
        #endregion

        //逻辑_公共_基础_设置港股通非交收日期
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_3_108_Info();
                pubL_3_108_InfoList.Add(info);
            }
        }
    }

    public class pubL_3_111_Response : IResponse
    {
        #region 构造函数
        public pubL_3_111_Response()
        {
            this.pubL_3_111_InfoList = new ObservableCollection<pubL_3_111_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_3_111_Info> pubL_3_111_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_3_111_Info info = new pubL_3_111_Info();
            pubL_3_111_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_3_111_InfoList.Add((pubL_3_111_Info)info);
        }
        #endregion

        //逻辑_公共_基础_新增交易时间
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_3_111_Info();
                pubL_3_111_InfoList.Add(info);
            }
        }
    }

    public class pubL_3_113_Response : IResponse
    {
        #region 构造函数
        public pubL_3_113_Response()
        {
            this.pubL_3_113_InfoList = new ObservableCollection<pubL_3_113_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_3_113_Info> pubL_3_113_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_3_113_Info info = new pubL_3_113_Info();
            pubL_3_113_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_3_113_InfoList.Add((pubL_3_113_Info)info);
        }
        #endregion

        //逻辑_公共_基础_删除交易时间
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_3_113_Info();
                pubL_3_113_InfoList.Add(info);
            }
        }
    }

    public class pubL_3_114_Response : IResponse
    {
        #region 构造函数
        public pubL_3_114_Response()
        {
            this.pubL_3_114_InfoList = new ObservableCollection<pubL_3_114_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_3_114_Info> pubL_3_114_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_3_114_Info info = new pubL_3_114_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.exch_no = unpacker.GetInt("exch_no");
            info.begin_time = unpacker.GetInt("begin_time");
            info.end_time = unpacker.GetInt("end_time");
            info.allow_wtdraw_flag = unpacker.GetInt("allow_wtdraw_flag");
            info.remark_info = unpacker.GetStr("remark_info");
            pubL_3_114_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_3_114_InfoList.Add((pubL_3_114_Info)info);
        }
        #endregion

        //逻辑_公共_基础_查询交易时间
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_3_114_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.begin_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TIME_INT);
                    info.end_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_TIME_INT);
                    info.allow_wtdraw_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_WTDRAW_FLAG_INT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    pubL_3_114_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_3_115_Response : IResponse
    {
        #region 构造函数
        public pubL_3_115_Response()
        {
            this.pubL_3_115_InfoList = new ObservableCollection<pubL_3_115_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_3_115_Info> pubL_3_115_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_3_115_Info info = new pubL_3_115_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.opor_co_no = unpacker.GetInt("opor_co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.oper_mac = unpacker.GetStr("oper_mac");
            info.oper_ip_addr = unpacker.GetStr("oper_ip_addr");
            info.oper_info = unpacker.GetStr("oper_info");
            info.oper_way = unpacker.GetStr("oper_way");
            info.oper_menu_no = unpacker.GetInt("oper_menu_no");
            info.oper_func_code = unpacker.GetStr("oper_func_code");
            info.init_date = unpacker.GetInt("init_date");
            info.exch_no = unpacker.GetInt("exch_no");
            info.begin_time = unpacker.GetInt("begin_time");
            info.end_time = unpacker.GetInt("end_time");
            info.allow_wtdraw_flag = unpacker.GetInt("allow_wtdraw_flag");
            info.remark_info = unpacker.GetStr("remark_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pubL_3_115_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_3_115_InfoList.Add((pubL_3_115_Info)info);
        }
        #endregion

        //逻辑_公共_基础_查询交易时间流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_3_115_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    info.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    info.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    info.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    info.oper_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MENU_NO_INT);
                    info.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.begin_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TIME_INT);
                    info.end_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_TIME_INT);
                    info.allow_wtdraw_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_WTDRAW_FLAG_INT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pubL_3_115_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_3_116_Response : IResponse
    {
        #region 构造函数
        public pubL_3_116_Response()
        {
            this.pubL_3_116_InfoList = new ObservableCollection<pubL_3_116_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_3_116_Info> pubL_3_116_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_3_116_Info info = new pubL_3_116_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.opor_co_no = unpacker.GetInt("opor_co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.oper_mac = unpacker.GetStr("oper_mac");
            info.oper_ip_addr = unpacker.GetStr("oper_ip_addr");
            info.oper_info = unpacker.GetStr("oper_info");
            info.oper_way = unpacker.GetStr("oper_way");
            info.oper_menu_no = unpacker.GetInt("oper_menu_no");
            info.oper_func_code = unpacker.GetStr("oper_func_code");
            info.init_date = unpacker.GetInt("init_date");
            info.exch_no = unpacker.GetInt("exch_no");
            info.begin_time = unpacker.GetInt("begin_time");
            info.end_time = unpacker.GetInt("end_time");
            info.allow_wtdraw_flag = unpacker.GetInt("allow_wtdraw_flag");
            info.remark_info = unpacker.GetStr("remark_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pubL_3_116_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_3_116_InfoList.Add((pubL_3_116_Info)info);
        }
        #endregion

        //逻辑_公共_基础_查询历史交易时间流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_3_116_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    info.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    info.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    info.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    info.oper_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MENU_NO_INT);
                    info.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.begin_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TIME_INT);
                    info.end_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_TIME_INT);
                    info.allow_wtdraw_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_WTDRAW_FLAG_INT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pubL_3_116_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_3_117_Response : IResponse
    {
        #region 构造函数
        public pubL_3_117_Response()
        {
            this.pubL_3_117_InfoList = new ObservableCollection<pubL_3_117_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_3_117_Info> pubL_3_117_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_3_117_Info info = new pubL_3_117_Info();
            info.sh_hk_buy_ref_rate = unpacker.GetDouble("sh_hk_buy_ref_rate");
            info.sh_hk_sell_ref_rate = unpacker.GetDouble("sh_hk_sell_ref_rate");
            info.sh_hk_settle_buy_rate = unpacker.GetDouble("sh_hk_settle_buy_rate");
            info.sh_hk_settle_sell_rate = unpacker.GetDouble("sh_hk_settle_sell_rate");
            info.sz_hk_buy_ref_rate = unpacker.GetDouble("sz_hk_buy_ref_rate");
            info.sz_hk_sell_ref_rate = unpacker.GetDouble("sz_hk_sell_ref_rate");
            info.sz_hk_settle_buy_rate = unpacker.GetDouble("sz_hk_settle_buy_rate");
            info.sz_hksettle_sell_rate = unpacker.GetDouble("sz_hksettle_sell_rate");
            pubL_3_117_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_3_117_InfoList.Add((pubL_3_117_Info)info);
        }
        #endregion

        //逻辑_公共_基础_获取港股通汇率信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_3_117_Info();
                info.sh_hk_buy_ref_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SH_HK_BUY_REF_RATE_FLOAT);
                info.sh_hk_sell_ref_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SH_HK_SELL_REF_RATE_FLOAT);
                info.sh_hk_settle_buy_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SH_HK_SETTLE_BUY_RATE_FLOAT);
                info.sh_hk_settle_sell_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SH_HK_SETTLE_SELL_RATE_FLOAT);
                info.sz_hk_buy_ref_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SZ_HK_BUY_REF_RATE_FLOAT);
                info.sz_hk_sell_ref_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SZ_HK_SELL_REF_RATE_FLOAT);
                info.sz_hk_settle_buy_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SZ_HK_SETTLE_BUY_RATE_FLOAT);
                info.sz_hksettle_sell_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SZ_HKSETTLE_SELL_RATE_FLOAT);
                pubL_3_117_InfoList.Add(info);
            }
        }
    }

    public class pubL_3_118_Response : IResponse
    {
        #region 构造函数
        public pubL_3_118_Response()
        {
            this.pubL_3_118_InfoList = new ObservableCollection<pubL_3_118_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_3_118_Info> pubL_3_118_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_3_118_Info info = new pubL_3_118_Info();
            info.sh_hk_buy_ref_rate = unpacker.GetDouble("sh_hk_buy_ref_rate");
            info.sh_hk_sell_ref_rate = unpacker.GetDouble("sh_hk_sell_ref_rate");
            info.sh_hk_settle_buy_rate = unpacker.GetDouble("sh_hk_settle_buy_rate");
            info.sh_hk_settle_sell_rate = unpacker.GetDouble("sh_hk_settle_sell_rate");
            info.sz_hk_buy_ref_rate = unpacker.GetDouble("sz_hk_buy_ref_rate");
            info.sz_hk_sell_ref_rate = unpacker.GetDouble("sz_hk_sell_ref_rate");
            info.sz_hk_settle_buy_rate = unpacker.GetDouble("sz_hk_settle_buy_rate");
            info.sz_hksettle_sell_rate = unpacker.GetDouble("sz_hksettle_sell_rate");
            info.busin_date = unpacker.GetInt("busin_date");
            pubL_3_118_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_3_118_InfoList.Add((pubL_3_118_Info)info);
        }
        #endregion

        //逻辑_公共_基础_获取所需港股通汇率信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_3_118_Info();
                info.sh_hk_buy_ref_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SH_HK_BUY_REF_RATE_FLOAT);
                info.sh_hk_sell_ref_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SH_HK_SELL_REF_RATE_FLOAT);
                info.sh_hk_settle_buy_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SH_HK_SETTLE_BUY_RATE_FLOAT);
                info.sh_hk_settle_sell_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SH_HK_SETTLE_SELL_RATE_FLOAT);
                info.sz_hk_buy_ref_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SZ_HK_BUY_REF_RATE_FLOAT);
                info.sz_hk_sell_ref_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SZ_HK_SELL_REF_RATE_FLOAT);
                info.sz_hk_settle_buy_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SZ_HK_SETTLE_BUY_RATE_FLOAT);
                info.sz_hksettle_sell_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SZ_HKSETTLE_SELL_RATE_FLOAT);
                info.busin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSIN_DATE_INT);
                pubL_3_118_InfoList.Add(info);
            }
        }
    }

    public class pubL_3_150_Response : IResponse
    {
        #region 构造函数
        public pubL_3_150_Response()
        {
            this.pubL_3_150_InfoList = new ObservableCollection<pubL_3_150_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_3_150_Info> pubL_3_150_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_3_150_Info info = new pubL_3_150_Info();
            pubL_3_150_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_3_150_InfoList.Add((pubL_3_150_Info)info);
        }
        #endregion

        //逻辑_公共_基础_新增通道信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_3_150_Info();
                pubL_3_150_InfoList.Add(info);
            }
        }
    }

    public class pubL_3_151_Response : IResponse
    {
        #region 构造函数
        public pubL_3_151_Response()
        {
            this.pubL_3_151_InfoList = new ObservableCollection<pubL_3_151_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_3_151_Info> pubL_3_151_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_3_151_Info info = new pubL_3_151_Info();
            pubL_3_151_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_3_151_InfoList.Add((pubL_3_151_Info)info);
        }
        #endregion

        //逻辑_公共_基础_修改通道信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_3_151_Info();
                pubL_3_151_InfoList.Add(info);
            }
        }
    }

    public class pubL_3_152_Response : IResponse
    {
        #region 构造函数
        public pubL_3_152_Response()
        {
            this.pubL_3_152_InfoList = new ObservableCollection<pubL_3_152_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_3_152_Info> pubL_3_152_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_3_152_Info info = new pubL_3_152_Info();
            pubL_3_152_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_3_152_InfoList.Add((pubL_3_152_Info)info);
        }
        #endregion

        //逻辑_公共_基础_删除通道信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_3_152_Info();
                pubL_3_152_InfoList.Add(info);
            }
        }
    }

    public class pubL_3_153_Response : IResponse
    {
        #region 构造函数
        public pubL_3_153_Response()
        {
            this.pubL_3_153_InfoList = new ObservableCollection<pubL_3_153_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_3_153_Info> pubL_3_153_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_3_153_Info info = new pubL_3_153_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.pass_no = unpacker.GetInt("pass_no");
            info.pass_name = unpacker.GetStr("pass_name");
            info.config_file = unpacker.GetStr("config_file");
            info.pass_status = unpacker.GetStr("pass_status");
            info.pass_type = unpacker.GetInt("pass_type");
            info.bond_qty_unit_set = unpacker.GetInt("bond_qty_unit_set");
            info.hk_cash_avail_date_type = unpacker.GetInt("hk_cash_avail_date_type");
            info.online_status = unpacker.GetInt("online_status");
            info.remark_info = unpacker.GetStr("remark_info");
            pubL_3_153_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_3_153_InfoList.Add((pubL_3_153_Info)info);
        }
        #endregion

        //逻辑_公共_基础_查询通道信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_3_153_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.pass_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NAME_STR);
                    info.config_file = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_FILE_STR);
                    info.pass_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PASS_STATUS_STR);
                    info.pass_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_TYPE_INT);
                    info.bond_qty_unit_set = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BOND_QTY_UNIT_SET_INT);
                    info.hk_cash_avail_date_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HK_CASH_AVAIL_DATE_TYPE_INT);
                    info.online_status = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ONLINE_STATUS_INT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    pubL_3_153_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_3_154_Response : IResponse
    {
        #region 构造函数
        public pubL_3_154_Response()
        {
            this.pubL_3_154_InfoList = new ObservableCollection<pubL_3_154_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_3_154_Info> pubL_3_154_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_3_154_Info info = new pubL_3_154_Info();
            pubL_3_154_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_3_154_InfoList.Add((pubL_3_154_Info)info);
        }
        #endregion

        //逻辑_公共_基础_上线通道
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_3_154_Info();
                pubL_3_154_InfoList.Add(info);
            }
        }
    }

    public class pubL_3_155_Response : IResponse
    {
        #region 构造函数
        public pubL_3_155_Response()
        {
            this.pubL_3_155_InfoList = new ObservableCollection<pubL_3_155_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_3_155_Info> pubL_3_155_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_3_155_Info info = new pubL_3_155_Info();
            pubL_3_155_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_3_155_InfoList.Add((pubL_3_155_Info)info);
        }
        #endregion

        //逻辑_公共_基础_下线通道
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_3_155_Info();
                pubL_3_155_InfoList.Add(info);
            }
        }
    }

    public class pubL_3_180_Response : IResponse
    {
        #region 构造函数
        public pubL_3_180_Response()
        {
            this.pubL_3_180_InfoList = new ObservableCollection<pubL_3_180_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_3_180_Info> pubL_3_180_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_3_180_Info info = new pubL_3_180_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.dict_no = unpacker.GetInt("dict_no");
            info.dict_name = unpacker.GetStr("dict_name");
            info.dict_field_name = unpacker.GetStr("dict_field_name");
            info.dict_item_name = unpacker.GetStr("dict_item_name");
            info.dict_item_value = unpacker.GetStr("dict_item_value");
            info.time_stamp = unpacker.GetInt("time_stamp");
            pubL_3_180_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_3_180_InfoList.Add((pubL_3_180_Info)info);
        }
        #endregion

        //逻辑_公共_基础_查询数据字典
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_3_180_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.dict_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DICT_NO_INT);
                    info.dict_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DICT_NAME_STR);
                    info.dict_field_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DICT_FIELD_NAME_STR);
                    info.dict_item_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DICT_ITEM_NAME_STR);
                    info.dict_item_value = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DICT_ITEM_VALUE_STR);
                    info.time_stamp = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT);
                    pubL_3_180_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_3_181_Response : IResponse
    {
        #region 构造函数
        public pubL_3_181_Response()
        {
            this.pubL_3_181_InfoList = new ObservableCollection<pubL_3_181_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_3_181_Info> pubL_3_181_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_3_181_Info info = new pubL_3_181_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.busi_type = unpacker.GetInt("busi_type");
            info.busi_sub_type = unpacker.GetInt("busi_sub_type");
            info.busi_flag = unpacker.GetInt("busi_flag");
            info.busi_name = unpacker.GetStr("busi_name");
            info.time_stamp = unpacker.GetInt("time_stamp");
            pubL_3_181_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_3_181_InfoList.Add((pubL_3_181_Info)info);
        }
        #endregion

        //逻辑_公共_基础_查询业务标志
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_3_181_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.busi_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_TYPE_INT);
                    info.busi_sub_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_SUB_TYPE_INT);
                    info.busi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT);
                    info.busi_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_NAME_STR);
                    info.time_stamp = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT);
                    pubL_3_181_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_3_201_Response : IResponse
    {
        #region 构造函数
        public pubL_3_201_Response()
        {
            this.pubL_3_201_InfoList = new ObservableCollection<pubL_3_201_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_3_201_Info> pubL_3_201_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_3_201_Info info = new pubL_3_201_Info();
            info.task_strike_status = unpacker.GetStr("task_strike_status");
            pubL_3_201_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_3_201_InfoList.Add((pubL_3_201_Info)info);
        }
        #endregion

        //逻辑_公共_基础_公共数据归档
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_3_201_Info();
                info.task_strike_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STRIKE_STATUS_STR);
                pubL_3_201_InfoList.Add(info);
            }
        }
    }

    public class pubL_3_202_Response : IResponse
    {
        #region 构造函数
        public pubL_3_202_Response()
        {
            this.pubL_3_202_InfoList = new ObservableCollection<pubL_3_202_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_3_202_Info> pubL_3_202_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_3_202_Info info = new pubL_3_202_Info();
            pubL_3_202_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_3_202_InfoList.Add((pubL_3_202_Info)info);
        }
        #endregion

        //逻辑_公共_基础_初始化系统
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_3_202_Info();
                pubL_3_202_InfoList.Add(info);
            }
        }
    }

    public class pubL_3_203_Response : IResponse
    {
        #region 构造函数
        public pubL_3_203_Response()
        {
            this.pubL_3_203_InfoList = new ObservableCollection<pubL_3_203_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_3_203_Info> pubL_3_203_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_3_203_Info info = new pubL_3_203_Info();
            pubL_3_203_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_3_203_InfoList.Add((pubL_3_203_Info)info);
        }
        #endregion

        //逻辑_公共_基础_初始化市场信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_3_203_Info();
                pubL_3_203_InfoList.Add(info);
            }
        }
    }

    public class pubL_3_210_Response : IResponse
    {
        #region 构造函数
        public pubL_3_210_Response()
        {
            this.pubL_3_210_InfoList = new ObservableCollection<pubL_3_210_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_3_210_Info> pubL_3_210_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_3_210_Info info = new pubL_3_210_Info();
            pubL_3_210_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_3_210_InfoList.Add((pubL_3_210_Info)info);
        }
        #endregion

        //逻辑_公共_基础_新增监控服务信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_3_210_Info();
                pubL_3_210_InfoList.Add(info);
            }
        }
    }

    public class pubL_3_204_Response : IResponse
    {
        #region 构造函数
        public pubL_3_204_Response()
        {
            this.pubL_3_204_InfoList = new ObservableCollection<pubL_3_204_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_3_204_Info> pubL_3_204_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_3_204_Info info = new pubL_3_204_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.pass_no = unpacker.GetInt("pass_no");
            info.pass_name = unpacker.GetStr("pass_name");
            info.pass_type = unpacker.GetInt("pass_type");
            info.pass_status = unpacker.GetStr("pass_status");
            info.trans_name = unpacker.GetStr("trans_name");
            info.trans_node_name = unpacker.GetStr("trans_node_name");
            info.trans_create_date = unpacker.GetInt("trans_create_date");
            info.trans_server_name = unpacker.GetStr("trans_server_name");
            info.trans_server_ip = unpacker.GetStr("trans_server_ip");
            info.trans_server_port = unpacker.GetInt("trans_server_port");
            info.remark_info = unpacker.GetStr("remark_info");
            pubL_3_204_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_3_204_InfoList.Add((pubL_3_204_Info)info);
        }
        #endregion

        //逻辑_公共_基础_查询通道报盘信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_3_204_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.pass_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NAME_STR);
                    info.pass_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_TYPE_INT);
                    info.pass_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PASS_STATUS_STR);
                    info.trans_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_NAME_STR);
                    info.trans_node_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_NODE_NAME_STR);
                    info.trans_create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_CREATE_DATE_INT);
                    info.trans_server_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_SERVER_NAME_STR);
                    info.trans_server_ip = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_SERVER_IP_STR);
                    info.trans_server_port = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_SERVER_PORT_INT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    pubL_3_204_InfoList.Add(info);
                }
            }
        }
    }

}
