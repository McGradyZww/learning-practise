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
    public class evaL_1_1_Response : IResponse
    {
        #region 构造函数
        public evaL_1_1_Response()
        {
            this.evaL_1_1_InfoList = new ObservableCollection<evaL_1_1_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_1_1_Info> evaL_1_1_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_1_1_Info info = new evaL_1_1_Info();
            evaL_1_1_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_1_1_InfoList.Add((evaL_1_1_Info)info);
        }
        #endregion

        //逻辑_平台估值_基础参数_增加估值科目
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_1_1_Info();
                evaL_1_1_InfoList.Add(info);
            }
        }
    }

    public class evaL_1_2_Response : IResponse
    {
        #region 构造函数
        public evaL_1_2_Response()
        {
            this.evaL_1_2_InfoList = new ObservableCollection<evaL_1_2_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_1_2_Info> evaL_1_2_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_1_2_Info info = new evaL_1_2_Info();
            evaL_1_2_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_1_2_InfoList.Add((evaL_1_2_Info)info);
        }
        #endregion

        //逻辑_平台估值_基础参数_修改估值科目
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_1_2_Info();
                evaL_1_2_InfoList.Add(info);
            }
        }
    }

    public class evaL_1_3_Response : IResponse
    {
        #region 构造函数
        public evaL_1_3_Response()
        {
            this.evaL_1_3_InfoList = new ObservableCollection<evaL_1_3_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_1_3_Info> evaL_1_3_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_1_3_Info info = new evaL_1_3_Info();
            evaL_1_3_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_1_3_InfoList.Add((evaL_1_3_Info)info);
        }
        #endregion

        //逻辑_平台估值_基础参数_删除估值科目
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_1_3_Info();
                evaL_1_3_InfoList.Add(info);
            }
        }
    }

    public class evaL_1_4_Response : IResponse
    {
        #region 构造函数
        public evaL_1_4_Response()
        {
            this.evaL_1_4_InfoList = new ObservableCollection<evaL_1_4_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_1_4_Info> evaL_1_4_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_1_4_Info info = new evaL_1_4_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.fina_acco_code = unpacker.GetStr("fina_acco_code");
            info.fina_acco_name = unpacker.GetStr("fina_acco_name");
            info.fina_acco_level = unpacker.GetInt("fina_acco_level");
            info.exch_no_str = unpacker.GetStr("exch_no_str");
            info.pd_asset_type_str = unpacker.GetStr("pd_asset_type_str");
            info.pd_fee_type_str = unpacker.GetStr("pd_fee_type_str");
            evaL_1_4_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_1_4_InfoList.Add((evaL_1_4_Info)info);
        }
        #endregion

        //逻辑_平台估值_基础参数_查询估值科目
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new evaL_1_4_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.fina_acco_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FINA_ACCO_CODE_STR);
                    info.fina_acco_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FINA_ACCO_NAME_STR);
                    info.fina_acco_level = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FINA_ACCO_LEVEL_INT);
                    info.exch_no_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR);
                    info.pd_asset_type_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_ASSET_TYPE_STR_STR);
                    info.pd_fee_type_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_FEE_TYPE_STR_STR);
                    evaL_1_4_InfoList.Add(info);
                }
            }
        }
    }

    public class evaL_1_11_Response : IResponse
    {
        #region 构造函数
        public evaL_1_11_Response()
        {
            this.evaL_1_11_InfoList = new ObservableCollection<evaL_1_11_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_1_11_Info> evaL_1_11_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_1_11_Info info = new evaL_1_11_Info();
            evaL_1_11_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_1_11_InfoList.Add((evaL_1_11_Info)info);
        }
        #endregion

        //逻辑_平台估值_基础参数_增加估值产品信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_1_11_Info();
                evaL_1_11_InfoList.Add(info);
            }
        }
    }

    public class evaL_1_12_Response : IResponse
    {
        #region 构造函数
        public evaL_1_12_Response()
        {
            this.evaL_1_12_InfoList = new ObservableCollection<evaL_1_12_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_1_12_Info> evaL_1_12_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_1_12_Info info = new evaL_1_12_Info();
            evaL_1_12_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_1_12_InfoList.Add((evaL_1_12_Info)info);
        }
        #endregion

        //逻辑_平台估值_基础参数_修改估值产品信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_1_12_Info();
                evaL_1_12_InfoList.Add(info);
            }
        }
    }

    public class evaL_1_13_Response : IResponse
    {
        #region 构造函数
        public evaL_1_13_Response()
        {
            this.evaL_1_13_InfoList = new ObservableCollection<evaL_1_13_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_1_13_Info> evaL_1_13_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_1_13_Info info = new evaL_1_13_Info();
            evaL_1_13_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_1_13_InfoList.Add((evaL_1_13_Info)info);
        }
        #endregion

        //逻辑_平台估值_基础参数_删除估值产品信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_1_13_Info();
                evaL_1_13_InfoList.Add(info);
            }
        }
    }

    public class evaL_1_14_Response : IResponse
    {
        #region 构造函数
        public evaL_1_14_Response()
        {
            this.evaL_1_14_InfoList = new ObservableCollection<evaL_1_14_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_1_14_Info> evaL_1_14_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_1_14_Info info = new evaL_1_14_Info();
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.pd_begin_share = unpacker.GetDouble("pd_begin_share");
            info.pd_curr_share = unpacker.GetDouble("pd_curr_share");
            info.target_pd_code = unpacker.GetStr("target_pd_code");
            info.task_status = unpacker.GetStr("task_status");
            info.is_auto_push = unpacker.GetStr("is_auto_push");
            info.is_sync_netvalue = unpacker.GetInt("is_sync_netvalue");
            info.unit_evalu = unpacker.GetInt("unit_evalu");
            info.remark_info = unpacker.GetStr("remark_info");
            evaL_1_14_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_1_14_InfoList.Add((evaL_1_14_Info)info);
        }
        #endregion

        //逻辑_平台估值_基础参数_查询估值产品信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new evaL_1_14_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.pd_begin_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_BEGIN_SHARE_FLOAT);
                    info.pd_curr_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_CURR_SHARE_FLOAT);
                    info.target_pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_PD_CODE_STR);
                    info.task_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STATUS_STR);
                    info.is_auto_push = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_IS_AUTO_PUSH_STR);
                    info.is_sync_netvalue = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_SYNC_NETVALUE_INT);
                    info.unit_evalu = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_EVALU_INT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    evaL_1_14_InfoList.Add(info);
                }
            }
        }
    }

    public class evaL_1_15_Response : IResponse
    {
        #region 构造函数
        public evaL_1_15_Response()
        {
            this.evaL_1_15_InfoList = new ObservableCollection<evaL_1_15_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_1_15_Info> evaL_1_15_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_1_15_Info info = new evaL_1_15_Info();
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.mail_server = unpacker.GetStr("mail_server");
            info.server_type = unpacker.GetInt("server_type");
            info.mail_server_protocol = unpacker.GetStr("mail_server_protocol");
            info.mail_server_port = unpacker.GetInt("mail_server_port");
            info.mail_server_username = unpacker.GetStr("mail_server_username");
            info.mail_server_password = unpacker.GetStr("mail_server_password");
            info.ssl_type = unpacker.GetInt("ssl_type");
            info.send_from = unpacker.GetStr("send_from");
            info.mail_subject = unpacker.GetStr("mail_subject");
            info.netvalue_posi = unpacker.GetStr("netvalue_posi");
            info.netvalue_date_posi = unpacker.GetStr("netvalue_date_posi");
            info.dateformat_type = unpacker.GetInt("dateformat_type");
            evaL_1_15_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_1_15_InfoList.Add((evaL_1_15_Info)info);
        }
        #endregion

        //逻辑_平台估值_基础参数_查询估值产品邮箱配置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new evaL_1_15_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.mail_server = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MAIL_SERVER_STR);
                    info.server_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SERVER_TYPE_INT);
                    info.mail_server_protocol = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MAIL_SERVER_PROTOCOL_STR);
                    info.mail_server_port = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MAIL_SERVER_PORT_INT);
                    info.mail_server_username = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MAIL_SERVER_USERNAME_STR);
                    info.mail_server_password = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MAIL_SERVER_PASSWORD_STR);
                    info.ssl_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SSL_TYPE_INT);
                    info.send_from = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_SEND_FROM_STR);
                    info.mail_subject = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MAIL_SUBJECT_STR);
                    info.netvalue_posi = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_NETVALUE_POSI_STR);
                    info.netvalue_date_posi = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_NETVALUE_DATE_POSI_STR);
                    info.dateformat_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DATEFORMAT_TYPE_INT);
                    evaL_1_15_InfoList.Add(info);
                }
            }
        }
    }

    public class evaL_1_21_Response : IResponse
    {
        #region 构造函数
        public evaL_1_21_Response()
        {
            this.evaL_1_21_InfoList = new ObservableCollection<evaL_1_21_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_1_21_Info> evaL_1_21_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_1_21_Info info = new evaL_1_21_Info();
            evaL_1_21_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_1_21_InfoList.Add((evaL_1_21_Info)info);
        }
        #endregion

        //逻辑_平台估值_基础参数_增加估值产品费率
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_1_21_Info();
                evaL_1_21_InfoList.Add(info);
            }
        }
    }

    public class evaL_1_22_Response : IResponse
    {
        #region 构造函数
        public evaL_1_22_Response()
        {
            this.evaL_1_22_InfoList = new ObservableCollection<evaL_1_22_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_1_22_Info> evaL_1_22_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_1_22_Info info = new evaL_1_22_Info();
            evaL_1_22_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_1_22_InfoList.Add((evaL_1_22_Info)info);
        }
        #endregion

        //逻辑_平台估值_基础参数_修改估值产品费率
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_1_22_Info();
                evaL_1_22_InfoList.Add(info);
            }
        }
    }

    public class evaL_1_23_Response : IResponse
    {
        #region 构造函数
        public evaL_1_23_Response()
        {
            this.evaL_1_23_InfoList = new ObservableCollection<evaL_1_23_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_1_23_Info> evaL_1_23_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_1_23_Info info = new evaL_1_23_Info();
            evaL_1_23_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_1_23_InfoList.Add((evaL_1_23_Info)info);
        }
        #endregion

        //逻辑_平台估值_基础参数_删除估值产品费率
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_1_23_Info();
                evaL_1_23_InfoList.Add(info);
            }
        }
    }

    public class evaL_1_24_Response : IResponse
    {
        #region 构造函数
        public evaL_1_24_Response()
        {
            this.evaL_1_24_InfoList = new ObservableCollection<evaL_1_24_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_1_24_Info> evaL_1_24_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_1_24_Info info = new evaL_1_24_Info();
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.pd_fee_type = unpacker.GetInt("pd_fee_type");
            info.pd_fee_rate = unpacker.GetDouble("pd_fee_rate");
            info.pd_fee_circle = unpacker.GetInt("pd_fee_circle");
            info.min_fee = unpacker.GetDouble("min_fee");
            info.calc_fee_date_str = unpacker.GetStr("calc_fee_date_str");
            info.eva_calc_type = unpacker.GetInt("eva_calc_type");
            info.remark_info = unpacker.GetStr("remark_info");
            evaL_1_24_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_1_24_InfoList.Add((evaL_1_24_Info)info);
        }
        #endregion

        //逻辑_平台估值_基础参数_查询估值产品费率
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new evaL_1_24_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.pd_fee_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_FEE_TYPE_INT);
                    info.pd_fee_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_FEE_RATE_FLOAT);
                    info.pd_fee_circle = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_FEE_CIRCLE_INT);
                    info.min_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_FEE_FLOAT);
                    info.calc_fee_date_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CALC_FEE_DATE_STR_STR);
                    info.eva_calc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EVA_CALC_TYPE_INT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    evaL_1_24_InfoList.Add(info);
                }
            }
        }
    }

    public class evaL_1_31_Response : IResponse
    {
        #region 构造函数
        public evaL_1_31_Response()
        {
            this.evaL_1_31_InfoList = new ObservableCollection<evaL_1_31_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_1_31_Info> evaL_1_31_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_1_31_Info info = new evaL_1_31_Info();
            evaL_1_31_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_1_31_InfoList.Add((evaL_1_31_Info)info);
        }
        #endregion

        //逻辑_平台估值_基础参数_增加估值产品利率
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_1_31_Info();
                evaL_1_31_InfoList.Add(info);
            }
        }
    }

    public class evaL_1_32_Response : IResponse
    {
        #region 构造函数
        public evaL_1_32_Response()
        {
            this.evaL_1_32_InfoList = new ObservableCollection<evaL_1_32_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_1_32_Info> evaL_1_32_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_1_32_Info info = new evaL_1_32_Info();
            evaL_1_32_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_1_32_InfoList.Add((evaL_1_32_Info)info);
        }
        #endregion

        //逻辑_平台估值_基础参数_修改估值产品利率
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_1_32_Info();
                evaL_1_32_InfoList.Add(info);
            }
        }
    }

    public class evaL_1_33_Response : IResponse
    {
        #region 构造函数
        public evaL_1_33_Response()
        {
            this.evaL_1_33_InfoList = new ObservableCollection<evaL_1_33_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_1_33_Info> evaL_1_33_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_1_33_Info info = new evaL_1_33_Info();
            evaL_1_33_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_1_33_InfoList.Add((evaL_1_33_Info)info);
        }
        #endregion

        //逻辑_平台估值_基础参数_删除估值产品利率
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_1_33_Info();
                evaL_1_33_InfoList.Add(info);
            }
        }
    }

    public class evaL_1_34_Response : IResponse
    {
        #region 构造函数
        public evaL_1_34_Response()
        {
            this.evaL_1_34_InfoList = new ObservableCollection<evaL_1_34_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_1_34_Info> evaL_1_34_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_1_34_Info info = new evaL_1_34_Info();
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.pd_rate_type = unpacker.GetInt("pd_rate_type");
            info.asset_acco = unpacker.GetStr("asset_acco");
            info.intrst_rate = unpacker.GetDouble("intrst_rate");
            info.pd_fee_circle = unpacker.GetInt("pd_fee_circle");
            info.min_interest = unpacker.GetDouble("min_interest");
            info.remark_info = unpacker.GetStr("remark_info");
            evaL_1_34_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_1_34_InfoList.Add((evaL_1_34_Info)info);
        }
        #endregion

        //逻辑_平台估值_基础参数_查询估值产品利率
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new evaL_1_34_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.pd_rate_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_RATE_TYPE_INT);
                    info.asset_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STR);
                    info.intrst_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_RATE_FLOAT);
                    info.pd_fee_circle = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_FEE_CIRCLE_INT);
                    info.min_interest = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_INTEREST_FLOAT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    evaL_1_34_InfoList.Add(info);
                }
            }
        }
    }

    public class evaL_1_41_Response : IResponse
    {
        #region 构造函数
        public evaL_1_41_Response()
        {
            this.evaL_1_41_InfoList = new ObservableCollection<evaL_1_41_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_1_41_Info> evaL_1_41_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_1_41_Info info = new evaL_1_41_Info();
            evaL_1_41_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_1_41_InfoList.Add((evaL_1_41_Info)info);
        }
        #endregion

        //逻辑_平台估值_基础参数_一站式新增估值产品
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_1_41_Info();
                evaL_1_41_InfoList.Add(info);
            }
        }
    }

    public class evaL_1_42_Response : IResponse
    {
        #region 构造函数
        public evaL_1_42_Response()
        {
            this.evaL_1_42_InfoList = new ObservableCollection<evaL_1_42_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_1_42_Info> evaL_1_42_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_1_42_Info info = new evaL_1_42_Info();
            evaL_1_42_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_1_42_InfoList.Add((evaL_1_42_Info)info);
        }
        #endregion

        //逻辑_平台估值_基础参数_增加估值产品份额流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_1_42_Info();
                evaL_1_42_InfoList.Add(info);
            }
        }
    }

    public class evaL_1_43_Response : IResponse
    {
        #region 构造函数
        public evaL_1_43_Response()
        {
            this.evaL_1_43_InfoList = new ObservableCollection<evaL_1_43_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_1_43_Info> evaL_1_43_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_1_43_Info info = new evaL_1_43_Info();
            evaL_1_43_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_1_43_InfoList.Add((evaL_1_43_Info)info);
        }
        #endregion

        //逻辑_平台估值_基础参数_修改估值产品份额流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_1_43_Info();
                evaL_1_43_InfoList.Add(info);
            }
        }
    }

    public class evaL_1_44_Response : IResponse
    {
        #region 构造函数
        public evaL_1_44_Response()
        {
            this.evaL_1_44_InfoList = new ObservableCollection<evaL_1_44_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_1_44_Info> evaL_1_44_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_1_44_Info info = new evaL_1_44_Info();
            evaL_1_44_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_1_44_InfoList.Add((evaL_1_44_Info)info);
        }
        #endregion

        //逻辑_平台估值_基础参数_删除估值产品份额流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_1_44_Info();
                evaL_1_44_InfoList.Add(info);
            }
        }
    }

    public class evaL_1_45_Response : IResponse
    {
        #region 构造函数
        public evaL_1_45_Response()
        {
            this.evaL_1_45_InfoList = new ObservableCollection<evaL_1_45_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_1_45_Info> evaL_1_45_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_1_45_Info info = new evaL_1_45_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.occur_dir = unpacker.GetInt("occur_dir");
            info.share_oper = unpacker.GetInt("share_oper");
            info.occur_share = unpacker.GetDouble("occur_share");
            info.occur_amt = unpacker.GetDouble("occur_amt");
            info.arrive_date = unpacker.GetInt("arrive_date");
            info.remark_info = unpacker.GetStr("remark_info");
            evaL_1_45_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_1_45_InfoList.Add((evaL_1_45_Info)info);
        }
        #endregion

        //逻辑_平台估值_基础参数_查询估值产品份额流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new evaL_1_45_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.occur_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_DIR_INT);
                    info.share_oper = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SHARE_OPER_INT);
                    info.occur_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_SHARE_FLOAT);
                    info.occur_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_AMT_FLOAT);
                    info.arrive_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ARRIVE_DATE_INT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    evaL_1_45_InfoList.Add(info);
                }
            }
        }
    }

    public class evaL_1_51_Response : IResponse
    {
        #region 构造函数
        public evaL_1_51_Response()
        {
            this.evaL_1_51_InfoList = new ObservableCollection<evaL_1_51_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_1_51_Info> evaL_1_51_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_1_51_Info info = new evaL_1_51_Info();
            evaL_1_51_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_1_51_InfoList.Add((evaL_1_51_Info)info);
        }
        #endregion

        //逻辑_平台估值_基础参数_增加估值产品累计净值配置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_1_51_Info();
                evaL_1_51_InfoList.Add(info);
            }
        }
    }

    public class evaL_1_52_Response : IResponse
    {
        #region 构造函数
        public evaL_1_52_Response()
        {
            this.evaL_1_52_InfoList = new ObservableCollection<evaL_1_52_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_1_52_Info> evaL_1_52_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_1_52_Info info = new evaL_1_52_Info();
            evaL_1_52_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_1_52_InfoList.Add((evaL_1_52_Info)info);
        }
        #endregion

        //逻辑_平台估值_基础参数_修改估值产品累计净值配置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_1_52_Info();
                evaL_1_52_InfoList.Add(info);
            }
        }
    }

    public class evaL_1_53_Response : IResponse
    {
        #region 构造函数
        public evaL_1_53_Response()
        {
            this.evaL_1_53_InfoList = new ObservableCollection<evaL_1_53_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_1_53_Info> evaL_1_53_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_1_53_Info info = new evaL_1_53_Info();
            evaL_1_53_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_1_53_InfoList.Add((evaL_1_53_Info)info);
        }
        #endregion

        //逻辑_平台估值_基础参数_删除估值产品累计净值配置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_1_53_Info();
                evaL_1_53_InfoList.Add(info);
            }
        }
    }

    public class evaL_1_54_Response : IResponse
    {
        #region 构造函数
        public evaL_1_54_Response()
        {
            this.evaL_1_54_InfoList = new ObservableCollection<evaL_1_54_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_1_54_Info> evaL_1_54_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_1_54_Info info = new evaL_1_54_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.divide_type = unpacker.GetInt("divide_type");
            info.pd_curr_share = unpacker.GetDouble("pd_curr_share");
            info.divi_amt = unpacker.GetDouble("divi_amt");
            info.unit_divi_amt = unpacker.GetDouble("unit_divi_amt");
            info.remark_info = unpacker.GetStr("remark_info");
            evaL_1_54_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_1_54_InfoList.Add((evaL_1_54_Info)info);
        }
        #endregion

        //逻辑_平台估值_基础参数_查询估值产品累计净值配置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new evaL_1_54_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.divide_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DIVIDE_TYPE_INT);
                    info.pd_curr_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_CURR_SHARE_FLOAT);
                    info.divi_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DIVI_AMT_FLOAT);
                    info.unit_divi_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_DIVI_AMT_FLOAT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    evaL_1_54_InfoList.Add(info);
                }
            }
        }
    }

    public class evaL_1_55_Response : IResponse
    {
        #region 构造函数
        public evaL_1_55_Response()
        {
            this.evaL_1_55_InfoList = new ObservableCollection<evaL_1_55_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_1_55_Info> evaL_1_55_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_1_55_Info info = new evaL_1_55_Info();
            evaL_1_55_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_1_55_InfoList.Add((evaL_1_55_Info)info);
        }
        #endregion

        //逻辑_平台估值_基础参数_增加估值产品增值税率
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_1_55_Info();
                evaL_1_55_InfoList.Add(info);
            }
        }
    }

    public class evaL_1_56_Response : IResponse
    {
        #region 构造函数
        public evaL_1_56_Response()
        {
            this.evaL_1_56_InfoList = new ObservableCollection<evaL_1_56_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_1_56_Info> evaL_1_56_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_1_56_Info info = new evaL_1_56_Info();
            evaL_1_56_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_1_56_InfoList.Add((evaL_1_56_Info)info);
        }
        #endregion

        //逻辑_平台估值_基础参数_修改估值产品增值税率
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_1_56_Info();
                evaL_1_56_InfoList.Add(info);
            }
        }
    }

    public class evaL_1_57_Response : IResponse
    {
        #region 构造函数
        public evaL_1_57_Response()
        {
            this.evaL_1_57_InfoList = new ObservableCollection<evaL_1_57_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_1_57_Info> evaL_1_57_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_1_57_Info info = new evaL_1_57_Info();
            evaL_1_57_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_1_57_InfoList.Add((evaL_1_57_Info)info);
        }
        #endregion

        //逻辑_平台估值_基础参数_删除估值产品增值税率
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_1_57_Info();
                evaL_1_57_InfoList.Add(info);
            }
        }
    }

    public class evaL_1_58_Response : IResponse
    {
        #region 构造函数
        public evaL_1_58_Response()
        {
            this.evaL_1_58_InfoList = new ObservableCollection<evaL_1_58_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_1_58_Info> evaL_1_58_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_1_58_Info info = new evaL_1_58_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.vat_rate = unpacker.GetDouble("vat_rate");
            info.vat_add_rate = unpacker.GetDouble("vat_add_rate");
            info.remark_info = unpacker.GetStr("remark_info");
            evaL_1_58_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_1_58_InfoList.Add((evaL_1_58_Info)info);
        }
        #endregion

        //逻辑_平台估值_基础参数_查询估值产品增值税率
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new evaL_1_58_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.vat_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VAT_RATE_FLOAT);
                    info.vat_add_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VAT_ADD_RATE_FLOAT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    evaL_1_58_InfoList.Add(info);
                }
            }
        }
    }

}
