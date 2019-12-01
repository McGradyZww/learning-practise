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
    public class pubL_11_1_Response : IResponse
    {
        #region 构造函数
        public pubL_11_1_Response()
        {
            this.pubL_11_1_InfoList = new ObservableCollection<pubL_11_1_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_11_1_Info> pubL_11_1_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_11_1_Info info = new pubL_11_1_Info();
            pubL_11_1_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_11_1_InfoList.Add((pubL_11_1_Info)info);
        }
        #endregion

        //逻辑_公共_消息_更新对象版本信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_11_1_Info();
                pubL_11_1_InfoList.Add(info);
            }
        }
    }

    public class pubL_11_2_Response : IResponse
    {
        #region 构造函数
        public pubL_11_2_Response()
        {
            this.pubL_11_2_InfoList = new ObservableCollection<pubL_11_2_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_11_2_Info> pubL_11_2_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_11_2_Info info = new pubL_11_2_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.opor_co_no = unpacker.GetInt("opor_co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.oper_mac = unpacker.GetStr("oper_mac");
            info.oper_ip_addr = unpacker.GetStr("oper_ip_addr");
            info.oper_info = unpacker.GetStr("oper_info");
            info.oper_way = unpacker.GetStr("oper_way");
            info.oper_func_code = unpacker.GetStr("oper_func_code");
            info.init_date = unpacker.GetInt("init_date");
            info.object_zh_name = unpacker.GetStr("object_zh_name");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_occur_info = unpacker.GetStr("jour_occur_info");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.remark_info = unpacker.GetStr("remark_info");
            pubL_11_2_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_11_2_InfoList.Add((pubL_11_2_Info)info);
        }
        #endregion

        //逻辑_公共_消息_查询对象版本信息流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_11_2_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    info.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    info.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    info.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    info.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.object_zh_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OBJECT_ZH_NAME_STR);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_INFO_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    pubL_11_2_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_11_3_Response : IResponse
    {
        #region 构造函数
        public pubL_11_3_Response()
        {
            this.pubL_11_3_InfoList = new ObservableCollection<pubL_11_3_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_11_3_Info> pubL_11_3_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_11_3_Info info = new pubL_11_3_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.opor_co_no = unpacker.GetInt("opor_co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.oper_mac = unpacker.GetStr("oper_mac");
            info.oper_ip_addr = unpacker.GetStr("oper_ip_addr");
            info.oper_info = unpacker.GetStr("oper_info");
            info.oper_way = unpacker.GetStr("oper_way");
            info.oper_func_code = unpacker.GetStr("oper_func_code");
            info.init_date = unpacker.GetInt("init_date");
            info.object_zh_name = unpacker.GetStr("object_zh_name");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_occur_info = unpacker.GetStr("jour_occur_info");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.remark_info = unpacker.GetStr("remark_info");
            pubL_11_3_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_11_3_InfoList.Add((pubL_11_3_Info)info);
        }
        #endregion

        //逻辑_公共_消息_查询历史对象版本信息流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_11_3_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    info.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    info.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    info.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    info.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.object_zh_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OBJECT_ZH_NAME_STR);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_INFO_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    pubL_11_3_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_11_6_Response : IResponse
    {
        #region 构造函数
        public pubL_11_6_Response()
        {
            this.pubL_11_6_InfoList = new ObservableCollection<pubL_11_6_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_11_6_Info> pubL_11_6_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_11_6_Info info = new pubL_11_6_Info();
            pubL_11_6_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_11_6_InfoList.Add((pubL_11_6_Info)info);
        }
        #endregion

        //逻辑_公共_消息_更新计划任务信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_11_6_Info();
                pubL_11_6_InfoList.Add(info);
            }
        }
    }

    public class pubL_11_7_Response : IResponse
    {
        #region 构造函数
        public pubL_11_7_Response()
        {
            this.pubL_11_7_InfoList = new ObservableCollection<pubL_11_7_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_11_7_Info> pubL_11_7_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_11_7_Info info = new pubL_11_7_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.task_no = unpacker.GetInt("task_no");
            info.task_name = unpacker.GetStr("task_name");
            info.depend_task_no = unpacker.GetInt("depend_task_no");
            info.task_order = unpacker.GetStr("task_order");
            info.task_strike_status = unpacker.GetStr("task_strike_status");
            info.task_strike_rule = unpacker.GetStr("task_strike_rule");
            info.exec_pro = unpacker.GetStr("exec_pro");
            info.busi_menu_no = unpacker.GetInt("busi_menu_no");
            info.busi_func_code = unpacker.GetStr("busi_func_code");
            info.exec_date = unpacker.GetInt("exec_date");
            info.exec_time = unpacker.GetInt("exec_time");
            info.comple_date = unpacker.GetInt("comple_date");
            info.comple_time = unpacker.GetInt("comple_time");
            info.exec_count = unpacker.GetInt("exec_count");
            info.task_status = unpacker.GetStr("task_status");
            info.remark_info = unpacker.GetStr("remark_info");
            pubL_11_7_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_11_7_InfoList.Add((pubL_11_7_Info)info);
        }
        #endregion

        //逻辑_公共_消息_查询计划任务信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_11_7_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.task_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TASK_NO_INT);
                    info.task_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_NAME_STR);
                    info.depend_task_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEPEND_TASK_NO_INT);
                    info.task_order = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_ORDER_STR);
                    info.task_strike_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STRIKE_STATUS_STR);
                    info.task_strike_rule = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STRIKE_RULE_STR);
                    info.exec_pro = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_PRO_STR);
                    info.busi_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_MENU_NO_INT);
                    info.busi_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FUNC_CODE_STR);
                    info.exec_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_DATE_INT);
                    info.exec_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_TIME_INT);
                    info.comple_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMPLE_DATE_INT);
                    info.comple_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMPLE_TIME_INT);
                    info.exec_count = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_COUNT_INT);
                    info.task_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STATUS_STR);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    pubL_11_7_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_11_11_Response : IResponse
    {
        #region 构造函数
        public pubL_11_11_Response()
        {
            this.pubL_11_11_InfoList = new ObservableCollection<pubL_11_11_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_11_11_Info> pubL_11_11_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_11_11_Info info = new pubL_11_11_Info();
            pubL_11_11_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_11_11_InfoList.Add((pubL_11_11_Info)info);
        }
        #endregion

        //逻辑_公共_消息_更新计划任务扩展信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_11_11_Info();
                pubL_11_11_InfoList.Add(info);
            }
        }
    }

    public class pubL_11_12_Response : IResponse
    {
        #region 构造函数
        public pubL_11_12_Response()
        {
            this.pubL_11_12_InfoList = new ObservableCollection<pubL_11_12_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_11_12_Info> pubL_11_12_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_11_12_Info info = new pubL_11_12_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.task_no = unpacker.GetInt("task_no");
            info.task_name = unpacker.GetStr("task_name");
            info.depend_task_no = unpacker.GetInt("depend_task_no");
            info.task_order = unpacker.GetStr("task_order");
            info.task_strike_status = unpacker.GetStr("task_strike_status");
            info.task_strike_rule = unpacker.GetStr("task_strike_rule");
            info.exec_pro = unpacker.GetStr("exec_pro");
            info.busi_menu_no = unpacker.GetInt("busi_menu_no");
            info.busi_func_code = unpacker.GetStr("busi_func_code");
            info.exec_date = unpacker.GetInt("exec_date");
            info.exec_time = unpacker.GetInt("exec_time");
            info.comple_date = unpacker.GetInt("comple_date");
            info.comple_time = unpacker.GetInt("comple_time");
            info.exec_count = unpacker.GetInt("exec_count");
            info.task_status = unpacker.GetStr("task_status");
            info.remark_info = unpacker.GetStr("remark_info");
            pubL_11_12_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_11_12_InfoList.Add((pubL_11_12_Info)info);
        }
        #endregion

        //逻辑_公共_消息_查询计划任务扩展信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_11_12_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.task_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TASK_NO_INT);
                    info.task_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_NAME_STR);
                    info.depend_task_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEPEND_TASK_NO_INT);
                    info.task_order = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_ORDER_STR);
                    info.task_strike_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STRIKE_STATUS_STR);
                    info.task_strike_rule = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STRIKE_RULE_STR);
                    info.exec_pro = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_PRO_STR);
                    info.busi_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_MENU_NO_INT);
                    info.busi_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FUNC_CODE_STR);
                    info.exec_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_DATE_INT);
                    info.exec_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_TIME_INT);
                    info.comple_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMPLE_DATE_INT);
                    info.comple_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMPLE_TIME_INT);
                    info.exec_count = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_COUNT_INT);
                    info.task_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STATUS_STR);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    pubL_11_12_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_11_21_Response : IResponse
    {
        #region 构造函数
        public pubL_11_21_Response()
        {
            this.pubL_11_21_InfoList = new ObservableCollection<pubL_11_21_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_11_21_Info> pubL_11_21_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_11_21_Info info = new pubL_11_21_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.opor_co_no = unpacker.GetInt("opor_co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.oper_way = unpacker.GetStr("oper_way");
            info.oper_ip_addr = unpacker.GetStr("oper_ip_addr");
            info.oper_mac = unpacker.GetStr("oper_mac");
            info.log_level = unpacker.GetInt("log_level");
            info.target_menu_no = unpacker.GetInt("target_menu_no");
            info.target_func_code = unpacker.GetStr("target_func_code");
            info.oper_mark = unpacker.GetStr("oper_mark");
            info.error_code = unpacker.GetStr("error_code");
            info.error_info = unpacker.GetStr("error_info");
            pubL_11_21_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_11_21_InfoList.Add((pubL_11_21_Info)info);
        }
        #endregion

        //逻辑_公共_消息_查询操作日志
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_11_21_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    info.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    info.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    info.log_level = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LOG_LEVEL_INT);
                    info.target_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_MENU_NO_INT);
                    info.target_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_FUNC_CODE_STR);
                    info.oper_mark = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MARK_STR);
                    info.error_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ERROR_CODE_STR);
                    info.error_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ERROR_INFO_STR);
                    pubL_11_21_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_11_22_Response : IResponse
    {
        #region 构造函数
        public pubL_11_22_Response()
        {
            this.pubL_11_22_InfoList = new ObservableCollection<pubL_11_22_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_11_22_Info> pubL_11_22_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_11_22_Info info = new pubL_11_22_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.opor_co_no = unpacker.GetInt("opor_co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.oper_way = unpacker.GetStr("oper_way");
            info.oper_ip_addr = unpacker.GetStr("oper_ip_addr");
            info.oper_mac = unpacker.GetStr("oper_mac");
            info.log_level = unpacker.GetInt("log_level");
            info.target_menu_no = unpacker.GetInt("target_menu_no");
            info.target_func_code = unpacker.GetStr("target_func_code");
            info.oper_mark = unpacker.GetStr("oper_mark");
            info.error_code = unpacker.GetStr("error_code");
            info.error_info = unpacker.GetStr("error_info");
            pubL_11_22_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_11_22_InfoList.Add((pubL_11_22_Info)info);
        }
        #endregion

        //逻辑_公共_消息_查询历史操作日志
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_11_22_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    info.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    info.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    info.log_level = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LOG_LEVEL_INT);
                    info.target_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_MENU_NO_INT);
                    info.target_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_FUNC_CODE_STR);
                    info.oper_mark = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MARK_STR);
                    info.error_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ERROR_CODE_STR);
                    info.error_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ERROR_INFO_STR);
                    pubL_11_22_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_11_30_Response : IResponse
    {
        #region 构造函数
        public pubL_11_30_Response()
        {
            this.pubL_11_30_InfoList = new ObservableCollection<pubL_11_30_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_11_30_Info> pubL_11_30_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_11_30_Info info = new pubL_11_30_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.opor_co_no = unpacker.GetInt("opor_co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.log_level = unpacker.GetInt("log_level");
            info.exec_date = unpacker.GetInt("exec_date");
            info.exec_time = unpacker.GetInt("exec_time");
            info.comple_date = unpacker.GetInt("comple_date");
            info.comple_time = unpacker.GetInt("comple_time");
            info.mark_info = unpacker.GetStr("mark_info");
            info.busi_menu_no = unpacker.GetInt("busi_menu_no");
            info.update_times = unpacker.GetInt("update_times");
            pubL_11_30_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_11_30_InfoList.Add((pubL_11_30_Info)info);
        }
        #endregion

        //逻辑_公共_消息_查询操作员任务提示信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_11_30_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.log_level = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LOG_LEVEL_INT);
                    info.exec_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_DATE_INT);
                    info.exec_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_TIME_INT);
                    info.comple_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMPLE_DATE_INT);
                    info.comple_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMPLE_TIME_INT);
                    info.mark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MARK_INFO_STR);
                    info.busi_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_MENU_NO_INT);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    pubL_11_30_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_11_31_Response : IResponse
    {
        #region 构造函数
        public pubL_11_31_Response()
        {
            this.pubL_11_31_InfoList = new ObservableCollection<pubL_11_31_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_11_31_Info> pubL_11_31_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_11_31_Info info = new pubL_11_31_Info();
            pubL_11_31_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_11_31_InfoList.Add((pubL_11_31_Info)info);
        }
        #endregion

        //逻辑_公共_消息_新增操作员任务提示信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_11_31_Info();
                pubL_11_31_InfoList.Add(info);
            }
        }
    }

    public class pubL_11_32_Response : IResponse
    {
        #region 构造函数
        public pubL_11_32_Response()
        {
            this.pubL_11_32_InfoList = new ObservableCollection<pubL_11_32_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_11_32_Info> pubL_11_32_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_11_32_Info info = new pubL_11_32_Info();
            pubL_11_32_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_11_32_InfoList.Add((pubL_11_32_Info)info);
        }
        #endregion

        //逻辑_公共_消息_修改操作员任务提示信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_11_32_Info();
                pubL_11_32_InfoList.Add(info);
            }
        }
    }

    public class pubL_11_33_Response : IResponse
    {
        #region 构造函数
        public pubL_11_33_Response()
        {
            this.pubL_11_33_InfoList = new ObservableCollection<pubL_11_33_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_11_33_Info> pubL_11_33_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_11_33_Info info = new pubL_11_33_Info();
            info.rsp_id = unpacker.GetInt64("rsp_id");
            pubL_11_33_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_11_33_InfoList.Add((pubL_11_33_Info)info);
        }
        #endregion

        //逻辑_公共_消息_删除操作员任务提示信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_11_33_Info();
                info.rsp_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_RSP_ID_INT64);
                pubL_11_33_InfoList.Add(info);
            }
        }
    }

    public class pubL_11_40_Response : IResponse
    {
        #region 构造函数
        public pubL_11_40_Response()
        {
            this.pubL_11_40_InfoList = new ObservableCollection<pubL_11_40_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_11_40_Info> pubL_11_40_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_11_40_Info info = new pubL_11_40_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.update_date = unpacker.GetInt("update_date");
            info.update_time = unpacker.GetInt("update_time");
            info.opor_no = unpacker.GetInt("opor_no");
            info.exception_level = unpacker.GetInt("exception_level");
            info.moni_server_type = unpacker.GetInt("moni_server_type");
            info.computer_name = unpacker.GetStr("computer_name");
            info.proc_no = unpacker.GetInt("proc_no");
            info.proc_path = unpacker.GetStr("proc_path");
            info.deal_flag = unpacker.GetInt("deal_flag");
            info.deal_info = unpacker.GetStr("deal_info");
            info.remark_info = unpacker.GetStr("remark_info");
            pubL_11_40_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_11_40_InfoList.Add((pubL_11_40_Info)info);
        }
        #endregion

        //逻辑_公共_消息_查询监控服务信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_11_40_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    info.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.exception_level = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCEPTION_LEVEL_INT);
                    info.moni_server_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MONI_SERVER_TYPE_INT);
                    info.computer_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMPUTER_NAME_STR);
                    info.proc_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PROC_NO_INT);
                    info.proc_path = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PROC_PATH_STR);
                    info.deal_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_FLAG_INT);
                    info.deal_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_INFO_STR);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    pubL_11_40_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_11_41_Response : IResponse
    {
        #region 构造函数
        public pubL_11_41_Response()
        {
            this.pubL_11_41_InfoList = new ObservableCollection<pubL_11_41_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_11_41_Info> pubL_11_41_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_11_41_Info info = new pubL_11_41_Info();
            pubL_11_41_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_11_41_InfoList.Add((pubL_11_41_Info)info);
        }
        #endregion

        //逻辑_公共_消息_新增监控服务信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_11_41_Info();
                pubL_11_41_InfoList.Add(info);
            }
        }
    }

    public class pubL_11_42_Response : IResponse
    {
        #region 构造函数
        public pubL_11_42_Response()
        {
            this.pubL_11_42_InfoList = new ObservableCollection<pubL_11_42_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_11_42_Info> pubL_11_42_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_11_42_Info info = new pubL_11_42_Info();
            pubL_11_42_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_11_42_InfoList.Add((pubL_11_42_Info)info);
        }
        #endregion

        //逻辑_公共_消息_修改监控服务信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_11_42_Info();
                pubL_11_42_InfoList.Add(info);
            }
        }
    }

    public class pubL_11_43_Response : IResponse
    {
        #region 构造函数
        public pubL_11_43_Response()
        {
            this.pubL_11_43_InfoList = new ObservableCollection<pubL_11_43_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_11_43_Info> pubL_11_43_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_11_43_Info info = new pubL_11_43_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.opor_co_no = unpacker.GetInt("opor_co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.oper_way = unpacker.GetStr("oper_way");
            info.oper_ip_addr = unpacker.GetStr("oper_ip_addr");
            info.oper_mac = unpacker.GetStr("oper_mac");
            info.log_level = unpacker.GetInt("log_level");
            info.target_menu_no = unpacker.GetInt("target_menu_no");
            info.target_func_code = unpacker.GetStr("target_func_code");
            info.oper_mark = unpacker.GetStr("oper_mark");
            info.error_code = unpacker.GetStr("error_code");
            info.error_info = unpacker.GetStr("error_info");
            pubL_11_43_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_11_43_InfoList.Add((pubL_11_43_Info)info);
        }
        #endregion

        //逻辑_公共_消息_查询操作日志历史
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_11_43_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    info.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    info.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    info.log_level = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LOG_LEVEL_INT);
                    info.target_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_MENU_NO_INT);
                    info.target_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_FUNC_CODE_STR);
                    info.oper_mark = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MARK_STR);
                    info.error_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ERROR_CODE_STR);
                    info.error_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ERROR_INFO_STR);
                    pubL_11_43_InfoList.Add(info);
                }
            }
        }
    }

}
