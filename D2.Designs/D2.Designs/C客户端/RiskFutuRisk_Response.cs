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
    public class rkfutuL_3_1_Response : IResponse
    {
        #region 构造函数
        public rkfutuL_3_1_Response()
        {
            this.rkfutuL_3_1_InfoList = new ObservableCollection<rkfutuL_3_1_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rkfutuL_3_1_Info> rkfutuL_3_1_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rkfutuL_3_1_Info info = new rkfutuL_3_1_Info();
            rkfutuL_3_1_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rkfutuL_3_1_InfoList.Add((rkfutuL_3_1_Info)info);
        }
        #endregion

        //逻辑_风控期货_风控_增加客户风险规则记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rkfutuL_3_1_Info();
                rkfutuL_3_1_InfoList.Add(info);
            }
        }
    }

    public class rkfutuL_3_2_Response : IResponse
    {
        #region 构造函数
        public rkfutuL_3_2_Response()
        {
            this.rkfutuL_3_2_InfoList = new ObservableCollection<rkfutuL_3_2_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rkfutuL_3_2_Info> rkfutuL_3_2_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rkfutuL_3_2_Info info = new rkfutuL_3_2_Info();
            rkfutuL_3_2_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rkfutuL_3_2_InfoList.Add((rkfutuL_3_2_Info)info);
        }
        #endregion

        //逻辑_风控期货_风控_删除客户风险规则记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rkfutuL_3_2_Info();
                rkfutuL_3_2_InfoList.Add(info);
            }
        }
    }

    public class rkfutuL_3_3_Response : IResponse
    {
        #region 构造函数
        public rkfutuL_3_3_Response()
        {
            this.rkfutuL_3_3_InfoList = new ObservableCollection<rkfutuL_3_3_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rkfutuL_3_3_Info> rkfutuL_3_3_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rkfutuL_3_3_Info info = new rkfutuL_3_3_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.model_id = unpacker.GetInt64("model_id");
            info.model_name = unpacker.GetStr("model_name");
            info.risk_item_id = unpacker.GetInt("risk_item_id");
            info.risk_item_name = unpacker.GetStr("risk_item_name");
            info.exch_no = unpacker.GetInt("exch_no");
            info.order_dir_str = unpacker.GetStr("order_dir_str");
            info.contrc_type = unpacker.GetInt("contrc_type");
            info.trig_stage_type = unpacker.GetInt("trig_stage_type");
            info.compli_calc_level = unpacker.GetInt("compli_calc_level");
            info.unit_nav_flag = unpacker.GetInt("unit_nav_flag");
            info.trig_type = unpacker.GetInt("trig_type");
            info.risk_rule_id = unpacker.GetInt("risk_rule_id");
            info.risk_rule_type = unpacker.GetInt("risk_rule_type");
            info.risk_rule_name = unpacker.GetStr("risk_rule_name");
            info.risk_rule_code = unpacker.GetStr("risk_rule_code");
            info.risk_param_str = unpacker.GetStr("risk_param_str");
            info.risk_rule_value_str = unpacker.GetStr("risk_rule_value_str");
            info.corrsp_plug = unpacker.GetStr("corrsp_plug");
            info.risk_rule_action = unpacker.GetStr("risk_rule_action");
            info.begin_time = unpacker.GetInt("begin_time");
            info.end_time = unpacker.GetInt("end_time");
            info.rule_flag = unpacker.GetInt("rule_flag");
            rkfutuL_3_3_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rkfutuL_3_3_InfoList.Add((rkfutuL_3_3_Info)info);
        }
        #endregion

        //逻辑_风控期货_风控_查询客户风险规则记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rkfutuL_3_3_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.model_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_MODEL_ID_INT64);
                    info.model_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MODEL_NAME_STR);
                    info.risk_item_id = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_ITEM_ID_INT);
                    info.risk_item_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_ITEM_NAME_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.order_dir_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR);
                    info.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    info.trig_stage_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_STAGE_TYPE_INT);
                    info.compli_calc_level = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_CALC_LEVEL_INT);
                    info.unit_nav_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_NAV_FLAG_INT);
                    info.trig_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_TYPE_INT);
                    info.risk_rule_id = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_ID_INT);
                    info.risk_rule_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_TYPE_INT);
                    info.risk_rule_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_NAME_STR);
                    info.risk_rule_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_CODE_STR);
                    info.risk_param_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_PARAM_STR_STR);
                    info.risk_rule_value_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_VALUE_STR_STR);
                    info.corrsp_plug = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CORRSP_PLUG_STR);
                    info.risk_rule_action = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_ACTION_STR);
                    info.begin_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TIME_INT);
                    info.end_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_TIME_INT);
                    info.rule_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RULE_FLAG_INT);
                    rkfutuL_3_3_InfoList.Add(info);
                }
            }
        }
    }

    public class rkfutuL_3_4_Response : IResponse
    {
        #region 构造函数
        public rkfutuL_3_4_Response()
        {
            this.rkfutuL_3_4_InfoList = new ObservableCollection<rkfutuL_3_4_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rkfutuL_3_4_Info> rkfutuL_3_4_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rkfutuL_3_4_Info info = new rkfutuL_3_4_Info();
            info.risk_param_str = unpacker.GetStr("risk_param_str");
            rkfutuL_3_4_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rkfutuL_3_4_InfoList.Add((rkfutuL_3_4_Info)info);
        }
        #endregion

        //逻辑_风控期货_风控_获取客户风险要素
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rkfutuL_3_4_Info();
                info.risk_param_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_PARAM_STR_STR);
                rkfutuL_3_4_InfoList.Add(info);
            }
        }
    }

    public class rkfutuL_3_5_Response : IResponse
    {
        #region 构造函数
        public rkfutuL_3_5_Response()
        {
            this.rkfutuL_3_5_InfoList = new ObservableCollection<rkfutuL_3_5_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rkfutuL_3_5_Info> rkfutuL_3_5_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rkfutuL_3_5_Info info = new rkfutuL_3_5_Info();
            rkfutuL_3_5_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rkfutuL_3_5_InfoList.Add((rkfutuL_3_5_Info)info);
        }
        #endregion

        //逻辑_风控期货_风控_试算检查客户风险
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rkfutuL_3_5_Info();
                rkfutuL_3_5_InfoList.Add(info);
            }
        }
    }

    public class rkfutuL_3_6_Response : IResponse
    {
        #region 构造函数
        public rkfutuL_3_6_Response()
        {
            this.rkfutuL_3_6_InfoList = new ObservableCollection<rkfutuL_3_6_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rkfutuL_3_6_Info> rkfutuL_3_6_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rkfutuL_3_6_Info info = new rkfutuL_3_6_Info();
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.client_risk_rule_id = unpacker.GetInt("client_risk_rule_id");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.order_dir_str = unpacker.GetStr("order_dir_str");
            info.exch_no = unpacker.GetInt("exch_no");
            info.contrc_type = unpacker.GetInt("contrc_type");
            info.trig_stage_type = unpacker.GetInt("trig_stage_type");
            info.compli_calc_level = unpacker.GetInt("compli_calc_level");
            info.unit_nav_flag = unpacker.GetInt("unit_nav_flag");
            info.trig_type = unpacker.GetInt("trig_type");
            info.compli_rules_remark = unpacker.GetStr("compli_rules_remark");
            info.risk_rule_action = unpacker.GetStr("risk_rule_action");
            info.risk_rule_type = unpacker.GetInt("risk_rule_type");
            info.risk_rule_value_str = unpacker.GetStr("risk_rule_value_str");
            info.risk_trig_value = unpacker.GetDouble("risk_trig_value");
            info.remark_info = unpacker.GetStr("remark_info");
            rkfutuL_3_6_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rkfutuL_3_6_InfoList.Add((rkfutuL_3_6_Info)info);
        }
        #endregion

        //逻辑_风控期货_风控_客户风险触警流水查询
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rkfutuL_3_6_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.client_risk_rule_id = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLIENT_RISK_RULE_ID_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.order_dir_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    info.trig_stage_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_STAGE_TYPE_INT);
                    info.compli_calc_level = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_CALC_LEVEL_INT);
                    info.unit_nav_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_NAV_FLAG_INT);
                    info.trig_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_TYPE_INT);
                    info.compli_rules_remark = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_RULES_REMARK_STR);
                    info.risk_rule_action = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_ACTION_STR);
                    info.risk_rule_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_TYPE_INT);
                    info.risk_rule_value_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_VALUE_STR_STR);
                    info.risk_trig_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RISK_TRIG_VALUE_FLOAT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    rkfutuL_3_6_InfoList.Add(info);
                }
            }
        }
    }

    public class rkfutuL_3_7_Response : IResponse
    {
        #region 构造函数
        public rkfutuL_3_7_Response()
        {
            this.rkfutuL_3_7_InfoList = new ObservableCollection<rkfutuL_3_7_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rkfutuL_3_7_Info> rkfutuL_3_7_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rkfutuL_3_7_Info info = new rkfutuL_3_7_Info();
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            rkfutuL_3_7_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rkfutuL_3_7_InfoList.Add((rkfutuL_3_7_Info)info);
        }
        #endregion

        //逻辑_风控期货_风控_模板查询客户产品交易组
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rkfutuL_3_7_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    rkfutuL_3_7_InfoList.Add(info);
                }
            }
        }
    }

    public class rkfutuL_3_8_Response : IResponse
    {
        #region 构造函数
        public rkfutuL_3_8_Response()
        {
            this.rkfutuL_3_8_InfoList = new ObservableCollection<rkfutuL_3_8_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rkfutuL_3_8_Info> rkfutuL_3_8_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rkfutuL_3_8_Info info = new rkfutuL_3_8_Info();
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.client_risk_rule_id = unpacker.GetInt("client_risk_rule_id");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.order_dir_str = unpacker.GetStr("order_dir_str");
            info.exch_no = unpacker.GetInt("exch_no");
            info.contrc_type = unpacker.GetInt("contrc_type");
            info.trig_stage_type = unpacker.GetInt("trig_stage_type");
            info.compli_calc_level = unpacker.GetInt("compli_calc_level");
            info.unit_nav_flag = unpacker.GetInt("unit_nav_flag");
            info.trig_type = unpacker.GetInt("trig_type");
            info.compli_rules_remark = unpacker.GetStr("compli_rules_remark");
            info.risk_rule_action = unpacker.GetStr("risk_rule_action");
            info.risk_rule_type = unpacker.GetInt("risk_rule_type");
            info.risk_rule_value_str = unpacker.GetStr("risk_rule_value_str");
            info.risk_trig_value = unpacker.GetDouble("risk_trig_value");
            info.remark_info = unpacker.GetStr("remark_info");
            rkfutuL_3_8_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rkfutuL_3_8_InfoList.Add((rkfutuL_3_8_Info)info);
        }
        #endregion

        //逻辑_风控期货_风控_客户风险触警历史流水查询
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rkfutuL_3_8_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.client_risk_rule_id = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLIENT_RISK_RULE_ID_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.order_dir_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    info.trig_stage_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_STAGE_TYPE_INT);
                    info.compli_calc_level = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_CALC_LEVEL_INT);
                    info.unit_nav_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_NAV_FLAG_INT);
                    info.trig_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_TYPE_INT);
                    info.compli_rules_remark = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_RULES_REMARK_STR);
                    info.risk_rule_action = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_ACTION_STR);
                    info.risk_rule_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_TYPE_INT);
                    info.risk_rule_value_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_VALUE_STR_STR);
                    info.risk_trig_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RISK_TRIG_VALUE_FLOAT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    rkfutuL_3_8_InfoList.Add(info);
                }
            }
        }
    }

    public class rkfutuL_3_9_Response : IResponse
    {
        #region 构造函数
        public rkfutuL_3_9_Response()
        {
            this.rkfutuL_3_9_InfoList = new ObservableCollection<rkfutuL_3_9_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rkfutuL_3_9_Info> rkfutuL_3_9_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rkfutuL_3_9_Info info = new rkfutuL_3_9_Info();
            info.client_risk_rule_id = unpacker.GetInt("client_risk_rule_id");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.compli_rules_remark = unpacker.GetStr("compli_rules_remark");
            info.risk_rule_action = unpacker.GetStr("risk_rule_action");
            info.risk_rule_value_str = unpacker.GetStr("risk_rule_value_str");
            info.risk_rule_calc_str = unpacker.GetStr("risk_rule_calc_str");
            info.remark_info = unpacker.GetStr("remark_info");
            rkfutuL_3_9_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rkfutuL_3_9_InfoList.Add((rkfutuL_3_9_Info)info);
        }
        #endregion

        //逻辑_风控期货_风控_批量试算检查客户风险
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rkfutuL_3_9_Info();
                info.client_risk_rule_id = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLIENT_RISK_RULE_ID_INT);
                info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                info.compli_rules_remark = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_RULES_REMARK_STR);
                info.risk_rule_action = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_ACTION_STR);
                info.risk_rule_value_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_VALUE_STR_STR);
                info.risk_rule_calc_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_CALC_STR_STR);
                info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                rkfutuL_3_9_InfoList.Add(info);
            }
        }
    }

}
