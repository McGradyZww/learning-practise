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
    public class rksecuL_4_1_Response : IResponse
    {
        #region 构造函数
        public rksecuL_4_1_Response()
        {
            this.rksecuL_4_1_InfoList = new ObservableCollection<rksecuL_4_1_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_4_1_Info> rksecuL_4_1_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_4_1_Info info = new rksecuL_4_1_Info();
            info.exch_no_str = unpacker.GetStr("exch_no_str");
            info.order_dir_str = unpacker.GetStr("order_dir_str");
            info.dime_id = unpacker.GetInt64("dime_id");
            info.trig_stage_type_str = unpacker.GetStr("trig_stage_type_str");
            info.compli_calc_level = unpacker.GetInt("compli_calc_level");
            info.unit_nav_flag = unpacker.GetInt("unit_nav_flag");
            info.trig_type = unpacker.GetInt("trig_type");
            info.compli_rules_remark = unpacker.GetStr("compli_rules_remark");
            info.risk_rule_id = unpacker.GetInt("risk_rule_id");
            info.risk_rule_type = unpacker.GetInt("risk_rule_type");
            info.risk_rule_name = unpacker.GetStr("risk_rule_name");
            info.risk_rule_code = unpacker.GetStr("risk_rule_code");
            info.risk_param_str = unpacker.GetStr("risk_param_str");
            info.risk_rule_value_str1 = unpacker.GetStr("risk_rule_value_str1");
            info.risk_rule_action1 = unpacker.GetStr("risk_rule_action1");
            info.risk_rule_value_str2 = unpacker.GetStr("risk_rule_value_str2");
            info.risk_rule_action2 = unpacker.GetStr("risk_rule_action2");
            info.risk_rule_value_str3 = unpacker.GetStr("risk_rule_value_str3");
            info.risk_rule_action3 = unpacker.GetStr("risk_rule_action3");
            info.risk_rule_value_str4 = unpacker.GetStr("risk_rule_value_str4");
            info.risk_rule_action4 = unpacker.GetStr("risk_rule_action4");
            info.corrsp_plug = unpacker.GetStr("corrsp_plug");
            info.begin_time = unpacker.GetInt("begin_time");
            info.end_time = unpacker.GetInt("end_time");
            info.rule_flag = unpacker.GetInt("rule_flag");
            info.update_times = unpacker.GetInt("update_times");
            rksecuL_4_1_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_4_1_InfoList.Add((rksecuL_4_1_Info)info);
        }
        #endregion

        //逻辑_风控证券_风控_增加客户风险规则记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rksecuL_4_1_Info();
                info.exch_no_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR);
                info.order_dir_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR);
                info.dime_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_DIME_ID_INT64);
                info.trig_stage_type_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_STAGE_TYPE_STR_STR);
                info.compli_calc_level = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_CALC_LEVEL_INT);
                info.unit_nav_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_NAV_FLAG_INT);
                info.trig_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_TYPE_INT);
                info.compli_rules_remark = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_RULES_REMARK_STR);
                info.risk_rule_id = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_ID_INT);
                info.risk_rule_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_TYPE_INT);
                info.risk_rule_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_NAME_STR);
                info.risk_rule_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_CODE_STR);
                info.risk_param_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_PARAM_STR_STR);
                info.risk_rule_value_str1 = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_VALUE_STR1_STR);
                info.risk_rule_action1 = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_ACTION1_STR);
                info.risk_rule_value_str2 = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_VALUE_STR2_STR);
                info.risk_rule_action2 = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_ACTION2_STR);
                info.risk_rule_value_str3 = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_VALUE_STR3_STR);
                info.risk_rule_action3 = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_ACTION3_STR);
                info.risk_rule_value_str4 = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_VALUE_STR4_STR);
                info.risk_rule_action4 = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_ACTION4_STR);
                info.corrsp_plug = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CORRSP_PLUG_STR);
                info.begin_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TIME_INT);
                info.end_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_TIME_INT);
                info.rule_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RULE_FLAG_INT);
                info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                rksecuL_4_1_InfoList.Add(info);
            }
        }
    }

    public class rksecuL_4_2_Response : IResponse
    {
        #region 构造函数
        public rksecuL_4_2_Response()
        {
            this.rksecuL_4_2_InfoList = new ObservableCollection<rksecuL_4_2_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_4_2_Info> rksecuL_4_2_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_4_2_Info info = new rksecuL_4_2_Info();
            rksecuL_4_2_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_4_2_InfoList.Add((rksecuL_4_2_Info)info);
        }
        #endregion

        //逻辑_风控证券_风控_删除客户风险规则记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rksecuL_4_2_Info();
                rksecuL_4_2_InfoList.Add(info);
            }
        }
    }

    public class rksecuL_4_3_Response : IResponse
    {
        #region 构造函数
        public rksecuL_4_3_Response()
        {
            this.rksecuL_4_3_InfoList = new ObservableCollection<rksecuL_4_3_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_4_3_Info> rksecuL_4_3_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_4_3_Info info = new rksecuL_4_3_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no_str = unpacker.GetStr("pd_no_str");
            info.exch_group_no_str = unpacker.GetStr("exch_group_no_str");
            info.exch_no_str = unpacker.GetStr("exch_no_str");
            info.order_dir_str = unpacker.GetStr("order_dir_str");
            info.dime_id = unpacker.GetInt64("dime_id");
            info.trig_stage_type_str = unpacker.GetStr("trig_stage_type_str");
            info.compli_calc_level = unpacker.GetInt("compli_calc_level");
            info.unit_nav_flag = unpacker.GetInt("unit_nav_flag");
            info.trig_type = unpacker.GetInt("trig_type");
            info.model_id = unpacker.GetInt64("model_id");
            info.risk_item_id = unpacker.GetInt("risk_item_id");
            info.compli_rules_remark = unpacker.GetStr("compli_rules_remark");
            info.risk_rule_id = unpacker.GetInt("risk_rule_id");
            info.risk_rule_type = unpacker.GetInt("risk_rule_type");
            info.risk_rule_name = unpacker.GetStr("risk_rule_name");
            info.risk_rule_code = unpacker.GetStr("risk_rule_code");
            info.risk_param_str = unpacker.GetStr("risk_param_str");
            info.risk_rule_value_str1 = unpacker.GetStr("risk_rule_value_str1");
            info.risk_rule_action1 = unpacker.GetStr("risk_rule_action1");
            info.risk_rule_value_str2 = unpacker.GetStr("risk_rule_value_str2");
            info.risk_rule_action2 = unpacker.GetStr("risk_rule_action2");
            info.risk_rule_value_str3 = unpacker.GetStr("risk_rule_value_str3");
            info.risk_rule_action3 = unpacker.GetStr("risk_rule_action3");
            info.risk_rule_value_str4 = unpacker.GetStr("risk_rule_value_str4");
            info.risk_rule_action4 = unpacker.GetStr("risk_rule_action4");
            info.templ_flag = unpacker.GetInt("templ_flag");
            info.corrsp_plug = unpacker.GetStr("corrsp_plug");
            info.begin_time = unpacker.GetInt("begin_time");
            info.end_time = unpacker.GetInt("end_time");
            info.rule_flag = unpacker.GetInt("rule_flag");
            info.union_flag = unpacker.GetInt("union_flag");
            rksecuL_4_3_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_4_3_InfoList.Add((rksecuL_4_3_Info)info);
        }
        #endregion

        //逻辑_风控证券_风控_查询客户风险规则记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rksecuL_4_3_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_STR_STR);
                    info.exch_group_no_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_STR_STR);
                    info.exch_no_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR);
                    info.order_dir_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR);
                    info.dime_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_DIME_ID_INT64);
                    info.trig_stage_type_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_STAGE_TYPE_STR_STR);
                    info.compli_calc_level = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_CALC_LEVEL_INT);
                    info.unit_nav_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_NAV_FLAG_INT);
                    info.trig_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_TYPE_INT);
                    info.model_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_MODEL_ID_INT64);
                    info.risk_item_id = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_ITEM_ID_INT);
                    info.compli_rules_remark = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_RULES_REMARK_STR);
                    info.risk_rule_id = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_ID_INT);
                    info.risk_rule_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_TYPE_INT);
                    info.risk_rule_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_NAME_STR);
                    info.risk_rule_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_CODE_STR);
                    info.risk_param_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_PARAM_STR_STR);
                    info.risk_rule_value_str1 = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_VALUE_STR1_STR);
                    info.risk_rule_action1 = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_ACTION1_STR);
                    info.risk_rule_value_str2 = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_VALUE_STR2_STR);
                    info.risk_rule_action2 = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_ACTION2_STR);
                    info.risk_rule_value_str3 = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_VALUE_STR3_STR);
                    info.risk_rule_action3 = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_ACTION3_STR);
                    info.risk_rule_value_str4 = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_VALUE_STR4_STR);
                    info.risk_rule_action4 = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_ACTION4_STR);
                    info.templ_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TEMPL_FLAG_INT);
                    info.corrsp_plug = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CORRSP_PLUG_STR);
                    info.begin_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TIME_INT);
                    info.end_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_TIME_INT);
                    info.rule_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RULE_FLAG_INT);
                    info.union_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UNION_FLAG_INT);
                    rksecuL_4_3_InfoList.Add(info);
                }
            }
        }
    }

    public class rksecuL_4_4_Response : IResponse
    {
        #region 构造函数
        public rksecuL_4_4_Response()
        {
            this.rksecuL_4_4_InfoList = new ObservableCollection<rksecuL_4_4_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_4_4_Info> rksecuL_4_4_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_4_4_Info info = new rksecuL_4_4_Info();
            info.client_risk_rule_id = unpacker.GetInt("client_risk_rule_id");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.compli_rules_remark = unpacker.GetStr("compli_rules_remark");
            info.risk_rule_action = unpacker.GetStr("risk_rule_action");
            info.risk_rule_value_str = unpacker.GetStr("risk_rule_value_str");
            info.risk_rule_calc_str = unpacker.GetStr("risk_rule_calc_str");
            info.remark_info = unpacker.GetStr("remark_info");
            info.opor_no = unpacker.GetInt("opor_no");
            info.pd_no_str = unpacker.GetStr("pd_no_str");
            info.dime_id = unpacker.GetInt64("dime_id");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.risk_rule_type = unpacker.GetInt("risk_rule_type");
            rksecuL_4_4_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_4_4_InfoList.Add((rksecuL_4_4_Info)info);
        }
        #endregion

        //逻辑_风控证券_风控_静态风险合规判断
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rksecuL_4_4_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.client_risk_rule_id = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLIENT_RISK_RULE_ID_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.compli_rules_remark = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_RULES_REMARK_STR);
                    info.risk_rule_action = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_ACTION_STR);
                    info.risk_rule_value_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_VALUE_STR_STR);
                    info.risk_rule_calc_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_CALC_STR_STR);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.pd_no_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_STR_STR);
                    info.dime_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_DIME_ID_INT64);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.risk_rule_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_TYPE_INT);
                    rksecuL_4_4_InfoList.Add(info);
                }
            }
        }
    }

    public class rksecuL_4_5_Response : IResponse
    {
        #region 构造函数
        public rksecuL_4_5_Response()
        {
            this.rksecuL_4_5_InfoList = new ObservableCollection<rksecuL_4_5_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_4_5_Info> rksecuL_4_5_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_4_5_Info info = new rksecuL_4_5_Info();
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.risk_item_id = unpacker.GetInt("risk_item_id");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.order_dir = unpacker.GetInt("order_dir");
            info.dime_id = unpacker.GetInt64("dime_id");
            info.trig_stage_type = unpacker.GetInt("trig_stage_type");
            info.compli_calc_level = unpacker.GetInt("compli_calc_level");
            info.unit_nav_flag = unpacker.GetInt("unit_nav_flag");
            info.trig_type = unpacker.GetInt("trig_type");
            info.compli_rules_remark = unpacker.GetStr("compli_rules_remark");
            info.risk_rule_action = unpacker.GetStr("risk_rule_action");
            info.risk_rule_type = unpacker.GetInt("risk_rule_type");
            info.risk_rule_value_str = unpacker.GetStr("risk_rule_value_str");
            info.risk_rule_calc_str = unpacker.GetStr("risk_rule_calc_str");
            info.remark_info = unpacker.GetStr("remark_info");
            info.opor_no = unpacker.GetInt("opor_no");
            info.pd_no_str = unpacker.GetStr("pd_no_str");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            rksecuL_4_5_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_4_5_InfoList.Add((rksecuL_4_5_Info)info);
        }
        #endregion

        //逻辑_风控证券_风控_客户风险触警流水查询
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rksecuL_4_5_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.risk_item_id = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_ITEM_ID_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.dime_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_DIME_ID_INT64);
                    info.trig_stage_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_STAGE_TYPE_INT);
                    info.compli_calc_level = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_CALC_LEVEL_INT);
                    info.unit_nav_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_NAV_FLAG_INT);
                    info.trig_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_TYPE_INT);
                    info.compli_rules_remark = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_RULES_REMARK_STR);
                    info.risk_rule_action = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_ACTION_STR);
                    info.risk_rule_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_TYPE_INT);
                    info.risk_rule_value_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_VALUE_STR_STR);
                    info.risk_rule_calc_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_CALC_STR_STR);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.pd_no_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_STR_STR);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    rksecuL_4_5_InfoList.Add(info);
                }
            }
        }
    }

    public class rksecuL_4_6_Response : IResponse
    {
        #region 构造函数
        public rksecuL_4_6_Response()
        {
            this.rksecuL_4_6_InfoList = new ObservableCollection<rksecuL_4_6_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_4_6_Info> rksecuL_4_6_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_4_6_Info info = new rksecuL_4_6_Info();
            info.pd_no_str = unpacker.GetStr("pd_no_str");
            info.exch_group_no_str = unpacker.GetStr("exch_group_no_str");
            rksecuL_4_6_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_4_6_InfoList.Add((rksecuL_4_6_Info)info);
        }
        #endregion

        //逻辑_风控证券_风控_模板查询客户产品交易组
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rksecuL_4_6_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.pd_no_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_STR_STR);
                    info.exch_group_no_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_STR_STR);
                    rksecuL_4_6_InfoList.Add(info);
                }
            }
        }
    }

    public class rksecuL_4_7_Response : IResponse
    {
        #region 构造函数
        public rksecuL_4_7_Response()
        {
            this.rksecuL_4_7_InfoList = new ObservableCollection<rksecuL_4_7_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_4_7_Info> rksecuL_4_7_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_4_7_Info info = new rksecuL_4_7_Info();
            info.client_risk_rule_id = unpacker.GetInt("client_risk_rule_id");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.compli_rules_remark = unpacker.GetStr("compli_rules_remark");
            info.risk_rule_action = unpacker.GetStr("risk_rule_action");
            info.risk_rule_value_str = unpacker.GetStr("risk_rule_value_str");
            info.risk_rule_calc_str = unpacker.GetStr("risk_rule_calc_str");
            info.remark_info = unpacker.GetStr("remark_info");
            rksecuL_4_7_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_4_7_InfoList.Add((rksecuL_4_7_Info)info);
        }
        #endregion

        //逻辑_风控证券_风控_试算检查客户风险
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rksecuL_4_7_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.client_risk_rule_id = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLIENT_RISK_RULE_ID_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.compli_rules_remark = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_RULES_REMARK_STR);
                    info.risk_rule_action = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_ACTION_STR);
                    info.risk_rule_value_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_VALUE_STR_STR);
                    info.risk_rule_calc_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_CALC_STR_STR);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    rksecuL_4_7_InfoList.Add(info);
                }
            }
        }
    }

    public class rksecuL_4_8_Response : IResponse
    {
        #region 构造函数
        public rksecuL_4_8_Response()
        {
            this.rksecuL_4_8_InfoList = new ObservableCollection<rksecuL_4_8_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_4_8_Info> rksecuL_4_8_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_4_8_Info info = new rksecuL_4_8_Info();
            rksecuL_4_8_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_4_8_InfoList.Add((rksecuL_4_8_Info)info);
        }
        #endregion

        //逻辑_风控证券_风控_新增账户风险监控设置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rksecuL_4_8_Info();
                rksecuL_4_8_InfoList.Add(info);
            }
        }
    }

    public class rksecuL_4_9_Response : IResponse
    {
        #region 构造函数
        public rksecuL_4_9_Response()
        {
            this.rksecuL_4_9_InfoList = new ObservableCollection<rksecuL_4_9_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_4_9_Info> rksecuL_4_9_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_4_9_Info info = new rksecuL_4_9_Info();
            rksecuL_4_9_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_4_9_InfoList.Add((rksecuL_4_9_Info)info);
        }
        #endregion

        //逻辑_风控证券_风控_修改账户风险监控设置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rksecuL_4_9_Info();
                rksecuL_4_9_InfoList.Add(info);
            }
        }
    }

    public class rksecuL_4_10_Response : IResponse
    {
        #region 构造函数
        public rksecuL_4_10_Response()
        {
            this.rksecuL_4_10_InfoList = new ObservableCollection<rksecuL_4_10_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_4_10_Info> rksecuL_4_10_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_4_10_Info info = new rksecuL_4_10_Info();
            rksecuL_4_10_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_4_10_InfoList.Add((rksecuL_4_10_Info)info);
        }
        #endregion

        //逻辑_风控证券_风控_删除账户风险监控设置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rksecuL_4_10_Info();
                rksecuL_4_10_InfoList.Add(info);
            }
        }
    }

    public class rksecuL_4_11_Response : IResponse
    {
        #region 构造函数
        public rksecuL_4_11_Response()
        {
            this.rksecuL_4_11_InfoList = new ObservableCollection<rksecuL_4_11_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_4_11_Info> rksecuL_4_11_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_4_11_Info info = new rksecuL_4_11_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no_str = unpacker.GetStr("pd_no_str");
            info.exch_group_no_str = unpacker.GetStr("exch_group_no_str");
            info.moni_role_type = unpacker.GetInt("moni_role_type");
            info.moni_value_flag = unpacker.GetInt("moni_value_flag");
            info.moni_value_type = unpacker.GetInt("moni_value_type");
            info.warn_posi_value = unpacker.GetDouble("warn_posi_value");
            info.warn_trig_oper_type = unpacker.GetInt("warn_trig_oper_type");
            info.close_posi_value = unpacker.GetDouble("close_posi_value");
            info.close_trig_oper_type = unpacker.GetInt("close_trig_oper_type");
            info.appd_value = unpacker.GetDouble("appd_value");
            info.appd_trig_oper_type = unpacker.GetInt("appd_trig_oper_type");
            info.begin_moni_date = unpacker.GetInt("begin_moni_date");
            info.begin_moni_value = unpacker.GetDouble("begin_moni_value");
            info.max_moni_value = unpacker.GetDouble("max_moni_value");
            info.curr_moni_value = unpacker.GetDouble("curr_moni_value");
            info.curr_result_moni_value = unpacker.GetDouble("curr_result_moni_value");
            info.contrs_stock_code = unpacker.GetStr("contrs_stock_code");
            info.contrs_exch_no = unpacker.GetInt("contrs_exch_no");
            info.contrs_max_moni_value = unpacker.GetDouble("contrs_max_moni_value");
            info.contrs_curr_moni_value = unpacker.GetDouble("contrs_curr_moni_value");
            info.contrs_result_moni_value = unpacker.GetDouble("contrs_result_moni_value");
            info.moni_result_value = unpacker.GetDouble("moni_result_value");
            info.moni_result_status = unpacker.GetStr("moni_result_status");
            info.moni_set_status = unpacker.GetStr("moni_set_status");
            info.cash_asset = unpacker.GetDouble("cash_asset");
            info.fund_asset = unpacker.GetDouble("fund_asset");
            info.bond_asset = unpacker.GetDouble("bond_asset");
            info.stock_asset = unpacker.GetDouble("stock_asset");
            info.repo_asset = unpacker.GetDouble("repo_asset");
            info.nav_asset = unpacker.GetDouble("nav_asset");
            info.stock_asset_ratio = unpacker.GetDouble("stock_asset_ratio");
            info.close_posi_flag = unpacker.GetInt("close_posi_flag");
            info.close_ratio_level_one = unpacker.GetDouble("close_ratio_level_one");
            info.close_ratio_level_two = unpacker.GetDouble("close_ratio_level_two");
            info.close_ratio_level_three = unpacker.GetDouble("close_ratio_level_three");
            info.remark_info = unpacker.GetStr("remark_info");
            info.pd_share = unpacker.GetDouble("pd_share");
            info.begin_asset_value = unpacker.GetDouble("begin_asset_value");
            info.hk_thrgh_stock_asset = unpacker.GetDouble("hk_thrgh_stock_asset");
            rksecuL_4_11_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_4_11_InfoList.Add((rksecuL_4_11_Info)info);
        }
        #endregion

        //逻辑_风控证券_风控_查询账户风险监控设置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rksecuL_4_11_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_STR_STR);
                    info.exch_group_no_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_STR_STR);
                    info.moni_role_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MONI_ROLE_TYPE_INT);
                    info.moni_value_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MONI_VALUE_FLAG_INT);
                    info.moni_value_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MONI_VALUE_TYPE_INT);
                    info.warn_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WARN_POSI_VALUE_FLOAT);
                    info.warn_trig_oper_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WARN_TRIG_OPER_TYPE_INT);
                    info.close_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_VALUE_FLOAT);
                    info.close_trig_oper_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_TRIG_OPER_TYPE_INT);
                    info.appd_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_APPD_VALUE_FLOAT);
                    info.appd_trig_oper_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_APPD_TRIG_OPER_TYPE_INT);
                    info.begin_moni_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_MONI_DATE_INT);
                    info.begin_moni_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_MONI_VALUE_FLOAT);
                    info.max_moni_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_MONI_VALUE_FLOAT);
                    info.curr_moni_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONI_VALUE_FLOAT);
                    info.curr_result_moni_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_RESULT_MONI_VALUE_FLOAT);
                    info.contrs_stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRS_STOCK_CODE_STR);
                    info.contrs_exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRS_EXCH_NO_INT);
                    info.contrs_max_moni_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CONTRS_MAX_MONI_VALUE_FLOAT);
                    info.contrs_curr_moni_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CONTRS_CURR_MONI_VALUE_FLOAT);
                    info.contrs_result_moni_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CONTRS_RESULT_MONI_VALUE_FLOAT);
                    info.moni_result_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MONI_RESULT_VALUE_FLOAT);
                    info.moni_result_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MONI_RESULT_STATUS_STR);
                    info.moni_set_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MONI_SET_STATUS_STR);
                    info.cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_ASSET_FLOAT);
                    info.fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_ASSET_FLOAT);
                    info.bond_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ASSET_FLOAT);
                    info.stock_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_FLOAT);
                    info.repo_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPO_ASSET_FLOAT);
                    info.nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT);
                    info.stock_asset_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_RATIO_FLOAT);
                    info.close_posi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_FLAG_INT);
                    info.close_ratio_level_one = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_RATIO_LEVEL_ONE_FLOAT);
                    info.close_ratio_level_two = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_RATIO_LEVEL_TWO_FLOAT);
                    info.close_ratio_level_three = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_RATIO_LEVEL_THREE_FLOAT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    info.pd_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_SHARE_FLOAT);
                    info.begin_asset_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_ASSET_VALUE_FLOAT);
                    info.hk_thrgh_stock_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HK_THRGH_STOCK_ASSET_FLOAT);
                    rksecuL_4_11_InfoList.Add(info);
                }
            }
        }
    }

    public class rksecuL_4_12_Response : IResponse
    {
        #region 构造函数
        public rksecuL_4_12_Response()
        {
            this.rksecuL_4_12_InfoList = new ObservableCollection<rksecuL_4_12_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_4_12_Info> rksecuL_4_12_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_4_12_Info info = new rksecuL_4_12_Info();
            rksecuL_4_12_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_4_12_InfoList.Add((rksecuL_4_12_Info)info);
        }
        #endregion

        //逻辑_风控证券_风控_启用账户风险监控设置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rksecuL_4_12_Info();
                rksecuL_4_12_InfoList.Add(info);
            }
        }
    }

    public class rksecuL_4_13_Response : IResponse
    {
        #region 构造函数
        public rksecuL_4_13_Response()
        {
            this.rksecuL_4_13_InfoList = new ObservableCollection<rksecuL_4_13_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_4_13_Info> rksecuL_4_13_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_4_13_Info info = new rksecuL_4_13_Info();
            rksecuL_4_13_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_4_13_InfoList.Add((rksecuL_4_13_Info)info);
        }
        #endregion

        //逻辑_风控证券_风控_暂停账户风险监控设置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rksecuL_4_13_Info();
                rksecuL_4_13_InfoList.Add(info);
            }
        }
    }

    public class rksecuL_4_14_Response : IResponse
    {
        #region 构造函数
        public rksecuL_4_14_Response()
        {
            this.rksecuL_4_14_InfoList = new ObservableCollection<rksecuL_4_14_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_4_14_Info> rksecuL_4_14_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_4_14_Info info = new rksecuL_4_14_Info();
            rksecuL_4_14_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_4_14_InfoList.Add((rksecuL_4_14_Info)info);
        }
        #endregion

        //逻辑_风控证券_风控_停止账户风险监控设置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rksecuL_4_14_Info();
                rksecuL_4_14_InfoList.Add(info);
            }
        }
    }

    public class rksecuL_4_15_Response : IResponse
    {
        #region 构造函数
        public rksecuL_4_15_Response()
        {
            this.rksecuL_4_15_InfoList = new ObservableCollection<rksecuL_4_15_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_4_15_Info> rksecuL_4_15_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_4_15_Info info = new rksecuL_4_15_Info();
            rksecuL_4_15_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_4_15_InfoList.Add((rksecuL_4_15_Info)info);
        }
        #endregion

        //逻辑_风控证券_风控_启用所有账户风险监控设置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rksecuL_4_15_Info();
                rksecuL_4_15_InfoList.Add(info);
            }
        }
    }

    public class rksecuL_4_16_Response : IResponse
    {
        #region 构造函数
        public rksecuL_4_16_Response()
        {
            this.rksecuL_4_16_InfoList = new ObservableCollection<rksecuL_4_16_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_4_16_Info> rksecuL_4_16_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_4_16_Info info = new rksecuL_4_16_Info();
            rksecuL_4_16_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_4_16_InfoList.Add((rksecuL_4_16_Info)info);
        }
        #endregion

        //逻辑_风控证券_风控_暂停所有账户风险监控设置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rksecuL_4_16_Info();
                rksecuL_4_16_InfoList.Add(info);
            }
        }
    }

    public class rksecuL_4_17_Response : IResponse
    {
        #region 构造函数
        public rksecuL_4_17_Response()
        {
            this.rksecuL_4_17_InfoList = new ObservableCollection<rksecuL_4_17_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_4_17_Info> rksecuL_4_17_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_4_17_Info info = new rksecuL_4_17_Info();
            rksecuL_4_17_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_4_17_InfoList.Add((rksecuL_4_17_Info)info);
        }
        #endregion

        //逻辑_风控证券_风控_停止所有账户风险监控设置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rksecuL_4_17_Info();
                rksecuL_4_17_InfoList.Add(info);
            }
        }
    }

    public class rksecuL_4_18_Response : IResponse
    {
        #region 构造函数
        public rksecuL_4_18_Response()
        {
            this.rksecuL_4_18_InfoList = new ObservableCollection<rksecuL_4_18_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_4_18_Info> rksecuL_4_18_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_4_18_Info info = new rksecuL_4_18_Info();
            info.moni_set_id = unpacker.GetInt64("moni_set_id");
            rksecuL_4_18_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_4_18_InfoList.Add((rksecuL_4_18_Info)info);
        }
        #endregion

        //逻辑_风控证券_风控_新增证券风险监控设置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rksecuL_4_18_Info();
                info.moni_set_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_MONI_SET_ID_INT64);
                rksecuL_4_18_InfoList.Add(info);
            }
        }
    }

    public class rksecuL_4_19_Response : IResponse
    {
        #region 构造函数
        public rksecuL_4_19_Response()
        {
            this.rksecuL_4_19_InfoList = new ObservableCollection<rksecuL_4_19_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_4_19_Info> rksecuL_4_19_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_4_19_Info info = new rksecuL_4_19_Info();
            rksecuL_4_19_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_4_19_InfoList.Add((rksecuL_4_19_Info)info);
        }
        #endregion

        //逻辑_风控证券_风控_修改证券风险监控设置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rksecuL_4_19_Info();
                rksecuL_4_19_InfoList.Add(info);
            }
        }
    }

    public class rksecuL_4_20_Response : IResponse
    {
        #region 构造函数
        public rksecuL_4_20_Response()
        {
            this.rksecuL_4_20_InfoList = new ObservableCollection<rksecuL_4_20_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_4_20_Info> rksecuL_4_20_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_4_20_Info info = new rksecuL_4_20_Info();
            rksecuL_4_20_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_4_20_InfoList.Add((rksecuL_4_20_Info)info);
        }
        #endregion

        //逻辑_风控证券_风控_删除证券风险监控设置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rksecuL_4_20_Info();
                rksecuL_4_20_InfoList.Add(info);
            }
        }
    }

    public class rksecuL_4_21_Response : IResponse
    {
        #region 构造函数
        public rksecuL_4_21_Response()
        {
            this.rksecuL_4_21_InfoList = new ObservableCollection<rksecuL_4_21_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_4_21_Info> rksecuL_4_21_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_4_21_Info info = new rksecuL_4_21_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.pd_no_str = unpacker.GetStr("pd_no_str");
            info.exch_group_no_str = unpacker.GetStr("exch_group_no_str");
            info.monitor_ctrl_type = unpacker.GetInt("monitor_ctrl_type");
            info.moni_value_type = unpacker.GetInt("moni_value_type");
            info.monitor_param_value = unpacker.GetInt("monitor_param_value");
            info.moni_value_flag = unpacker.GetInt("moni_value_flag");
            info.warn_posi_value = unpacker.GetDouble("warn_posi_value");
            info.appd_value = unpacker.GetDouble("appd_value");
            info.close_posi_value = unpacker.GetDouble("close_posi_value");
            info.max_moni_value = unpacker.GetDouble("max_moni_value");
            info.curr_moni_value = unpacker.GetDouble("curr_moni_value");
            info.curr_result_moni_value = unpacker.GetDouble("curr_result_moni_value");
            info.contrs_stock_code = unpacker.GetStr("contrs_stock_code");
            info.contrs_exch_no = unpacker.GetInt("contrs_exch_no");
            info.contrs_max_moni_value = unpacker.GetDouble("contrs_max_moni_value");
            info.contrs_curr_moni_value = unpacker.GetDouble("contrs_curr_moni_value");
            info.contrs_result_moni_value = unpacker.GetDouble("contrs_result_moni_value");
            info.moni_result_value = unpacker.GetDouble("moni_result_value");
            info.moni_result_status = unpacker.GetStr("moni_result_status");
            info.moni_set_status = unpacker.GetStr("moni_set_status");
            info.close_posi_flag = unpacker.GetInt("close_posi_flag");
            info.close_ratio_level_one = unpacker.GetDouble("close_ratio_level_one");
            info.close_ratio_level_two = unpacker.GetDouble("close_ratio_level_two");
            info.close_ratio_level_three = unpacker.GetDouble("close_ratio_level_three");
            info.remark_info = unpacker.GetStr("remark_info");
            rksecuL_4_21_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_4_21_InfoList.Add((rksecuL_4_21_Info)info);
        }
        #endregion

        //逻辑_风控证券_风控_查询证券风险监控设置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rksecuL_4_21_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.pd_no_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_STR_STR);
                    info.exch_group_no_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_STR_STR);
                    info.monitor_ctrl_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MONITOR_CTRL_TYPE_INT);
                    info.moni_value_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MONI_VALUE_TYPE_INT);
                    info.monitor_param_value = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MONITOR_PARAM_VALUE_INT);
                    info.moni_value_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MONI_VALUE_FLAG_INT);
                    info.warn_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WARN_POSI_VALUE_FLOAT);
                    info.appd_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_APPD_VALUE_FLOAT);
                    info.close_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_VALUE_FLOAT);
                    info.max_moni_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_MONI_VALUE_FLOAT);
                    info.curr_moni_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONI_VALUE_FLOAT);
                    info.curr_result_moni_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_RESULT_MONI_VALUE_FLOAT);
                    info.contrs_stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRS_STOCK_CODE_STR);
                    info.contrs_exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRS_EXCH_NO_INT);
                    info.contrs_max_moni_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CONTRS_MAX_MONI_VALUE_FLOAT);
                    info.contrs_curr_moni_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CONTRS_CURR_MONI_VALUE_FLOAT);
                    info.contrs_result_moni_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CONTRS_RESULT_MONI_VALUE_FLOAT);
                    info.moni_result_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MONI_RESULT_VALUE_FLOAT);
                    info.moni_result_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MONI_RESULT_STATUS_STR);
                    info.moni_set_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MONI_SET_STATUS_STR);
                    info.close_posi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_FLAG_INT);
                    info.close_ratio_level_one = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_RATIO_LEVEL_ONE_FLOAT);
                    info.close_ratio_level_two = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_RATIO_LEVEL_TWO_FLOAT);
                    info.close_ratio_level_three = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_RATIO_LEVEL_THREE_FLOAT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    rksecuL_4_21_InfoList.Add(info);
                }
            }
        }
    }

    public class rksecuL_4_22_Response : IResponse
    {
        #region 构造函数
        public rksecuL_4_22_Response()
        {
            this.rksecuL_4_22_InfoList = new ObservableCollection<rksecuL_4_22_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_4_22_Info> rksecuL_4_22_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_4_22_Info info = new rksecuL_4_22_Info();
            rksecuL_4_22_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_4_22_InfoList.Add((rksecuL_4_22_Info)info);
        }
        #endregion

        //逻辑_风控证券_风控_启用证券风险监控设置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rksecuL_4_22_Info();
                rksecuL_4_22_InfoList.Add(info);
            }
        }
    }

    public class rksecuL_4_23_Response : IResponse
    {
        #region 构造函数
        public rksecuL_4_23_Response()
        {
            this.rksecuL_4_23_InfoList = new ObservableCollection<rksecuL_4_23_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_4_23_Info> rksecuL_4_23_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_4_23_Info info = new rksecuL_4_23_Info();
            rksecuL_4_23_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_4_23_InfoList.Add((rksecuL_4_23_Info)info);
        }
        #endregion

        //逻辑_风控证券_风控_暂停证券风险监控设置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rksecuL_4_23_Info();
                rksecuL_4_23_InfoList.Add(info);
            }
        }
    }

    public class rksecuL_4_24_Response : IResponse
    {
        #region 构造函数
        public rksecuL_4_24_Response()
        {
            this.rksecuL_4_24_InfoList = new ObservableCollection<rksecuL_4_24_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_4_24_Info> rksecuL_4_24_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_4_24_Info info = new rksecuL_4_24_Info();
            rksecuL_4_24_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_4_24_InfoList.Add((rksecuL_4_24_Info)info);
        }
        #endregion

        //逻辑_风控证券_风控_停止证券风险监控设置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rksecuL_4_24_Info();
                rksecuL_4_24_InfoList.Add(info);
            }
        }
    }

    public class rksecuL_4_25_Response : IResponse
    {
        #region 构造函数
        public rksecuL_4_25_Response()
        {
            this.rksecuL_4_25_InfoList = new ObservableCollection<rksecuL_4_25_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_4_25_Info> rksecuL_4_25_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_4_25_Info info = new rksecuL_4_25_Info();
            rksecuL_4_25_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_4_25_InfoList.Add((rksecuL_4_25_Info)info);
        }
        #endregion

        //逻辑_风控证券_风控_启用所有证券风险监控设置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rksecuL_4_25_Info();
                rksecuL_4_25_InfoList.Add(info);
            }
        }
    }

    public class rksecuL_4_26_Response : IResponse
    {
        #region 构造函数
        public rksecuL_4_26_Response()
        {
            this.rksecuL_4_26_InfoList = new ObservableCollection<rksecuL_4_26_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_4_26_Info> rksecuL_4_26_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_4_26_Info info = new rksecuL_4_26_Info();
            rksecuL_4_26_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_4_26_InfoList.Add((rksecuL_4_26_Info)info);
        }
        #endregion

        //逻辑_风控证券_风控_暂停所有证券风险监控设置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rksecuL_4_26_Info();
                rksecuL_4_26_InfoList.Add(info);
            }
        }
    }

    public class rksecuL_4_27_Response : IResponse
    {
        #region 构造函数
        public rksecuL_4_27_Response()
        {
            this.rksecuL_4_27_InfoList = new ObservableCollection<rksecuL_4_27_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_4_27_Info> rksecuL_4_27_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_4_27_Info info = new rksecuL_4_27_Info();
            rksecuL_4_27_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_4_27_InfoList.Add((rksecuL_4_27_Info)info);
        }
        #endregion

        //逻辑_风控证券_风控_停止所有证券风险监控设置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rksecuL_4_27_Info();
                rksecuL_4_27_InfoList.Add(info);
            }
        }
    }

    public class rksecuL_4_28_Response : IResponse
    {
        #region 构造函数
        public rksecuL_4_28_Response()
        {
            this.rksecuL_4_28_InfoList = new ObservableCollection<rksecuL_4_28_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_4_28_Info> rksecuL_4_28_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_4_28_Info info = new rksecuL_4_28_Info();
            info.task_strike_status = unpacker.GetStr("task_strike_status");
            rksecuL_4_28_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_4_28_InfoList.Add((rksecuL_4_28_Info)info);
        }
        #endregion

        //逻辑_风控证券_风控_计算账户风险监控设置数据
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rksecuL_4_28_Info();
                info.task_strike_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STRIKE_STATUS_STR);
                rksecuL_4_28_InfoList.Add(info);
            }
        }
    }

    public class rksecuL_4_29_Response : IResponse
    {
        #region 构造函数
        public rksecuL_4_29_Response()
        {
            this.rksecuL_4_29_InfoList = new ObservableCollection<rksecuL_4_29_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_4_29_Info> rksecuL_4_29_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_4_29_Info info = new rksecuL_4_29_Info();
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.risk_item_id = unpacker.GetInt("risk_item_id");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.order_dir = unpacker.GetInt("order_dir");
            info.dime_id = unpacker.GetInt64("dime_id");
            info.trig_stage_type = unpacker.GetInt("trig_stage_type");
            info.compli_calc_level = unpacker.GetInt("compli_calc_level");
            info.unit_nav_flag = unpacker.GetInt("unit_nav_flag");
            info.trig_type = unpacker.GetInt("trig_type");
            info.compli_rules_remark = unpacker.GetStr("compli_rules_remark");
            info.risk_rule_action = unpacker.GetStr("risk_rule_action");
            info.risk_rule_type = unpacker.GetInt("risk_rule_type");
            info.risk_rule_value_str = unpacker.GetStr("risk_rule_value_str");
            info.risk_rule_calc_str = unpacker.GetStr("risk_rule_calc_str");
            info.remark_info = unpacker.GetStr("remark_info");
            info.opor_no = unpacker.GetInt("opor_no");
            info.pd_no_str = unpacker.GetStr("pd_no_str");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            rksecuL_4_29_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_4_29_InfoList.Add((rksecuL_4_29_Info)info);
        }
        #endregion

        //逻辑_风控证券_风控_客户风险触警历史流水查询
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rksecuL_4_29_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.risk_item_id = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_ITEM_ID_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.dime_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_DIME_ID_INT64);
                    info.trig_stage_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_STAGE_TYPE_INT);
                    info.compli_calc_level = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_CALC_LEVEL_INT);
                    info.unit_nav_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_NAV_FLAG_INT);
                    info.trig_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_TYPE_INT);
                    info.compli_rules_remark = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_RULES_REMARK_STR);
                    info.risk_rule_action = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_ACTION_STR);
                    info.risk_rule_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_TYPE_INT);
                    info.risk_rule_value_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_VALUE_STR_STR);
                    info.risk_rule_calc_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_CALC_STR_STR);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.pd_no_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_STR_STR);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    rksecuL_4_29_InfoList.Add(info);
                }
            }
        }
    }

    public class rksecuL_4_30_Response : IResponse
    {
        #region 构造函数
        public rksecuL_4_30_Response()
        {
            this.rksecuL_4_30_InfoList = new ObservableCollection<rksecuL_4_30_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_4_30_Info> rksecuL_4_30_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_4_30_Info info = new rksecuL_4_30_Info();
            info.pd_no_str = unpacker.GetStr("pd_no_str");
            info.exch_group_no_str = unpacker.GetStr("exch_group_no_str");
            info.union_flag = unpacker.GetInt("union_flag");
            rksecuL_4_30_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_4_30_InfoList.Add((rksecuL_4_30_Info)info);
        }
        #endregion

        //逻辑_风控证券_风控_条目查询客户产品交易组
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rksecuL_4_30_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.pd_no_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_STR_STR);
                    info.exch_group_no_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_STR_STR);
                    info.union_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UNION_FLAG_INT);
                    rksecuL_4_30_InfoList.Add(info);
                }
            }
        }
    }

    public class rksecuL_4_31_Response : IResponse
    {
        #region 构造函数
        public rksecuL_4_31_Response()
        {
            this.rksecuL_4_31_InfoList = new ObservableCollection<rksecuL_4_31_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_4_31_Info> rksecuL_4_31_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_4_31_Info info = new rksecuL_4_31_Info();
            rksecuL_4_31_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_4_31_InfoList.Add((rksecuL_4_31_Info)info);
        }
        #endregion

        //逻辑_风控证券_风控_更新客户风险规则启用标志
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rksecuL_4_31_Info();
                rksecuL_4_31_InfoList.Add(info);
            }
        }
    }

    public class rksecuL_4_32_Response : IResponse
    {
        #region 构造函数
        public rksecuL_4_32_Response()
        {
            this.rksecuL_4_32_InfoList = new ObservableCollection<rksecuL_4_32_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_4_32_Info> rksecuL_4_32_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_4_32_Info info = new rksecuL_4_32_Info();
            info.client_risk_rule_id = unpacker.GetInt("client_risk_rule_id");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.compli_rules_remark = unpacker.GetStr("compli_rules_remark");
            info.risk_rule_action = unpacker.GetStr("risk_rule_action");
            info.risk_rule_value_str = unpacker.GetStr("risk_rule_value_str");
            info.risk_rule_calc_str = unpacker.GetStr("risk_rule_calc_str");
            info.remark_info = unpacker.GetStr("remark_info");
            rksecuL_4_32_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_4_32_InfoList.Add((rksecuL_4_32_Info)info);
        }
        #endregion

        //逻辑_风控证券_风控_批量试算检查客户风险
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rksecuL_4_32_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.client_risk_rule_id = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLIENT_RISK_RULE_ID_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.compli_rules_remark = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_RULES_REMARK_STR);
                    info.risk_rule_action = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_ACTION_STR);
                    info.risk_rule_value_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_VALUE_STR_STR);
                    info.risk_rule_calc_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_CALC_STR_STR);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    rksecuL_4_32_InfoList.Add(info);
                }
            }
        }
    }

    public class rksecuL_4_33_Response : IResponse
    {
        #region 构造函数
        public rksecuL_4_33_Response()
        {
            this.rksecuL_4_33_InfoList = new ObservableCollection<rksecuL_4_33_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_4_33_Info> rksecuL_4_33_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_4_33_Info info = new rksecuL_4_33_Info();
            info.opor_no = unpacker.GetInt("opor_no");
            info.detail_posi_id = unpacker.GetInt64("detail_posi_id");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.lngsht_type = unpacker.GetInt("lngsht_type");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.open_posi_date = unpacker.GetInt("open_posi_date");
            info.open_posi_time = unpacker.GetInt("open_posi_time");
            info.open_posi_price = unpacker.GetDouble("open_posi_price");
            info.open_posi_value = unpacker.GetDouble("open_posi_value");
            info.open_posi_fee = unpacker.GetDouble("open_posi_fee");
            info.close_posi_qty = unpacker.GetDouble("close_posi_qty");
            info.close_posi_market_value = unpacker.GetDouble("close_posi_market_value");
            info.close_posi_fee = unpacker.GetDouble("close_posi_fee");
            info.realize_pandl = unpacker.GetDouble("realize_pandl");
            info.pandl_ratio = unpacker.GetDouble("pandl_ratio");
            info.un_close_posi_qty = unpacker.GetDouble("un_close_posi_qty");
            info.un_close_marke_value = unpacker.GetDouble("un_close_marke_value");
            info.last_price = unpacker.GetDouble("last_price");
            info.up_limit_price = unpacker.GetDouble("up_limit_price");
            info.down_limit_price = unpacker.GetDouble("down_limit_price");
            info.cost_price = unpacker.GetDouble("cost_price");
            info.last_tshold_value = unpacker.GetDouble("last_tshold_value");
            info.float_pandl = unpacker.GetDouble("float_pandl");
            info.posi_status = unpacker.GetStr("posi_status");
            info.moni_result_status = unpacker.GetStr("moni_result_status");
            info.posi_limit_status = unpacker.GetStr("posi_limit_status");
            info.opor_warn_tshold = unpacker.GetDouble("opor_warn_tshold");
            info.opor_stop_tshold = unpacker.GetDouble("opor_stop_tshold");
            info.stock_warn_ratio = unpacker.GetDouble("stock_warn_ratio");
            info.stock_stop_ratio = unpacker.GetDouble("stock_stop_ratio");
            info.stock_warn_amt = unpacker.GetDouble("stock_warn_amt");
            info.stock_stop_amt = unpacker.GetDouble("stock_stop_amt");
            info.open_close_permission = unpacker.GetInt("open_close_permission");
            info.posi_limit_time = unpacker.GetInt("posi_limit_time");
            rksecuL_4_33_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_4_33_InfoList.Add((rksecuL_4_33_Info)info);
        }
        #endregion

        //逻辑_风控证券_风控_T0操作员阈值信息查询
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rksecuL_4_33_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.detail_posi_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_DETAIL_POSI_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.lngsht_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.open_posi_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_DATE_INT);
                    info.open_posi_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_TIME_INT);
                    info.open_posi_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_PRICE_FLOAT);
                    info.open_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_VALUE_FLOAT);
                    info.open_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_FEE_FLOAT);
                    info.close_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_QTY_FLOAT);
                    info.close_posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_MARKET_VALUE_FLOAT);
                    info.close_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_FEE_FLOAT);
                    info.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    info.pandl_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PANDL_RATIO_FLOAT);
                    info.un_close_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UN_CLOSE_POSI_QTY_FLOAT);
                    info.un_close_marke_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UN_CLOSE_MARKE_VALUE_FLOAT);
                    info.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    info.up_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UP_LIMIT_PRICE_FLOAT);
                    info.down_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DOWN_LIMIT_PRICE_FLOAT);
                    info.cost_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_PRICE_FLOAT);
                    info.last_tshold_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_TSHOLD_VALUE_FLOAT);
                    info.float_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FLOAT_PANDL_FLOAT);
                    info.posi_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_POSI_STATUS_STR);
                    info.moni_result_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MONI_RESULT_STATUS_STR);
                    info.posi_limit_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_POSI_LIMIT_STATUS_STR);
                    info.opor_warn_tshold = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_WARN_TSHOLD_FLOAT);
                    info.opor_stop_tshold = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_STOP_TSHOLD_FLOAT);
                    info.stock_warn_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_WARN_RATIO_FLOAT);
                    info.stock_stop_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_STOP_RATIO_FLOAT);
                    info.stock_warn_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_WARN_AMT_FLOAT);
                    info.stock_stop_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_STOP_AMT_FLOAT);
                    info.open_close_permission = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_CLOSE_PERMISSION_INT);
                    info.posi_limit_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_POSI_LIMIT_TIME_INT);
                    rksecuL_4_33_InfoList.Add(info);
                }
            }
        }
    }

    public class rksecuL_4_34_Response : IResponse
    {
        #region 构造函数
        public rksecuL_4_34_Response()
        {
            this.rksecuL_4_34_InfoList = new ObservableCollection<rksecuL_4_34_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_4_34_Info> rksecuL_4_34_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_4_34_Info info = new rksecuL_4_34_Info();
            info.opor_no = unpacker.GetInt("opor_no");
            info.detail_posi_id = unpacker.GetInt64("detail_posi_id");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.lngsht_type = unpacker.GetInt("lngsht_type");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.open_posi_date = unpacker.GetInt("open_posi_date");
            info.open_posi_time = unpacker.GetInt("open_posi_time");
            info.open_posi_price = unpacker.GetDouble("open_posi_price");
            info.open_posi_value = unpacker.GetDouble("open_posi_value");
            info.open_posi_fee = unpacker.GetDouble("open_posi_fee");
            info.close_posi_qty = unpacker.GetDouble("close_posi_qty");
            info.close_posi_market_value = unpacker.GetDouble("close_posi_market_value");
            info.close_posi_fee = unpacker.GetDouble("close_posi_fee");
            info.realize_pandl = unpacker.GetDouble("realize_pandl");
            info.pandl_ratio = unpacker.GetDouble("pandl_ratio");
            info.un_close_posi_qty = unpacker.GetDouble("un_close_posi_qty");
            info.un_close_marke_value = unpacker.GetDouble("un_close_marke_value");
            info.last_price = unpacker.GetDouble("last_price");
            info.up_limit_price = unpacker.GetDouble("up_limit_price");
            info.down_limit_price = unpacker.GetDouble("down_limit_price");
            info.last_tshold_value = unpacker.GetDouble("last_tshold_value");
            info.float_pandl = unpacker.GetDouble("float_pandl");
            info.posi_status = unpacker.GetStr("posi_status");
            info.moni_result_status = unpacker.GetStr("moni_result_status");
            info.posi_limit_status = unpacker.GetStr("posi_limit_status");
            info.opor_warn_tshold = unpacker.GetDouble("opor_warn_tshold");
            info.opor_stop_tshold = unpacker.GetDouble("opor_stop_tshold");
            info.stock_warn_ratio = unpacker.GetDouble("stock_warn_ratio");
            info.stock_stop_ratio = unpacker.GetDouble("stock_stop_ratio");
            info.stock_warn_amt = unpacker.GetDouble("stock_warn_amt");
            info.stock_stop_amt = unpacker.GetDouble("stock_stop_amt");
            info.open_close_permission = unpacker.GetInt("open_close_permission");
            info.posi_limit_time = unpacker.GetInt("posi_limit_time");
            rksecuL_4_34_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_4_34_InfoList.Add((rksecuL_4_34_Info)info);
        }
        #endregion

        //逻辑_风控证券_风控_T0操作员阈值信息汇总查询
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rksecuL_4_34_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.detail_posi_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_DETAIL_POSI_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.lngsht_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.open_posi_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_DATE_INT);
                    info.open_posi_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_TIME_INT);
                    info.open_posi_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_PRICE_FLOAT);
                    info.open_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_VALUE_FLOAT);
                    info.open_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_FEE_FLOAT);
                    info.close_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_QTY_FLOAT);
                    info.close_posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_MARKET_VALUE_FLOAT);
                    info.close_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_FEE_FLOAT);
                    info.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    info.pandl_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PANDL_RATIO_FLOAT);
                    info.un_close_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UN_CLOSE_POSI_QTY_FLOAT);
                    info.un_close_marke_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UN_CLOSE_MARKE_VALUE_FLOAT);
                    info.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    info.up_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UP_LIMIT_PRICE_FLOAT);
                    info.down_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DOWN_LIMIT_PRICE_FLOAT);
                    info.last_tshold_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_TSHOLD_VALUE_FLOAT);
                    info.float_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FLOAT_PANDL_FLOAT);
                    info.posi_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_POSI_STATUS_STR);
                    info.moni_result_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MONI_RESULT_STATUS_STR);
                    info.posi_limit_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_POSI_LIMIT_STATUS_STR);
                    info.opor_warn_tshold = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_WARN_TSHOLD_FLOAT);
                    info.opor_stop_tshold = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_STOP_TSHOLD_FLOAT);
                    info.stock_warn_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_WARN_RATIO_FLOAT);
                    info.stock_stop_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_STOP_RATIO_FLOAT);
                    info.stock_warn_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_WARN_AMT_FLOAT);
                    info.stock_stop_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_STOP_AMT_FLOAT);
                    info.open_close_permission = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_CLOSE_PERMISSION_INT);
                    info.posi_limit_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_POSI_LIMIT_TIME_INT);
                    rksecuL_4_34_InfoList.Add(info);
                }
            }
        }
    }

    public class rksecuL_4_35_Response : IResponse
    {
        #region 构造函数
        public rksecuL_4_35_Response()
        {
            this.rksecuL_4_35_InfoList = new ObservableCollection<rksecuL_4_35_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_4_35_Info> rksecuL_4_35_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_4_35_Info info = new rksecuL_4_35_Info();
            rksecuL_4_35_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_4_35_InfoList.Add((rksecuL_4_35_Info)info);
        }
        #endregion

        //逻辑_风控证券_风控_新增操作员风险监控设置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rksecuL_4_35_Info();
                rksecuL_4_35_InfoList.Add(info);
            }
        }
    }

    public class rksecuL_4_36_Response : IResponse
    {
        #region 构造函数
        public rksecuL_4_36_Response()
        {
            this.rksecuL_4_36_InfoList = new ObservableCollection<rksecuL_4_36_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_4_36_Info> rksecuL_4_36_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_4_36_Info info = new rksecuL_4_36_Info();
            rksecuL_4_36_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_4_36_InfoList.Add((rksecuL_4_36_Info)info);
        }
        #endregion

        //逻辑_风控证券_风控_修改操作员风险监控设置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rksecuL_4_36_Info();
                rksecuL_4_36_InfoList.Add(info);
            }
        }
    }

    public class rksecuL_4_37_Response : IResponse
    {
        #region 构造函数
        public rksecuL_4_37_Response()
        {
            this.rksecuL_4_37_InfoList = new ObservableCollection<rksecuL_4_37_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_4_37_Info> rksecuL_4_37_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_4_37_Info info = new rksecuL_4_37_Info();
            rksecuL_4_37_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_4_37_InfoList.Add((rksecuL_4_37_Info)info);
        }
        #endregion

        //逻辑_风控证券_风控_删除操作员风险监控设置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rksecuL_4_37_Info();
                rksecuL_4_37_InfoList.Add(info);
            }
        }
    }

    public class rksecuL_4_38_Response : IResponse
    {
        #region 构造函数
        public rksecuL_4_38_Response()
        {
            this.rksecuL_4_38_InfoList = new ObservableCollection<rksecuL_4_38_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_4_38_Info> rksecuL_4_38_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_4_38_Info info = new rksecuL_4_38_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.moni_role_type = unpacker.GetInt("moni_role_type");
            info.moni_value_flag = unpacker.GetInt("moni_value_flag");
            info.moni_value_type = unpacker.GetInt("moni_value_type");
            info.warn_posi_value = unpacker.GetDouble("warn_posi_value");
            info.warn_trig_oper_type = unpacker.GetInt("warn_trig_oper_type");
            info.close_posi_value = unpacker.GetDouble("close_posi_value");
            info.close_trig_oper_type = unpacker.GetInt("close_trig_oper_type");
            info.appd_value = unpacker.GetDouble("appd_value");
            info.appd_trig_oper_type = unpacker.GetInt("appd_trig_oper_type");
            info.begin_moni_date = unpacker.GetInt("begin_moni_date");
            info.begin_moni_value = unpacker.GetDouble("begin_moni_value");
            info.max_moni_value = unpacker.GetDouble("max_moni_value");
            info.curr_moni_value = unpacker.GetDouble("curr_moni_value");
            info.curr_result_moni_value = unpacker.GetDouble("curr_result_moni_value");
            info.contrs_stock_code = unpacker.GetStr("contrs_stock_code");
            info.contrs_exch_no = unpacker.GetInt("contrs_exch_no");
            info.contrs_max_moni_value = unpacker.GetDouble("contrs_max_moni_value");
            info.contrs_curr_moni_value = unpacker.GetDouble("contrs_curr_moni_value");
            info.contrs_result_moni_value = unpacker.GetDouble("contrs_result_moni_value");
            info.moni_result_value = unpacker.GetDouble("moni_result_value");
            info.moni_result_status = unpacker.GetStr("moni_result_status");
            info.moni_set_status = unpacker.GetStr("moni_set_status");
            info.cash_asset = unpacker.GetDouble("cash_asset");
            info.fund_asset = unpacker.GetDouble("fund_asset");
            info.bond_asset = unpacker.GetDouble("bond_asset");
            info.stock_asset = unpacker.GetDouble("stock_asset");
            info.repo_asset = unpacker.GetDouble("repo_asset");
            info.nav_asset = unpacker.GetDouble("nav_asset");
            info.stock_asset_ratio = unpacker.GetDouble("stock_asset_ratio");
            info.close_posi_flag = unpacker.GetInt("close_posi_flag");
            info.close_ratio_level_one = unpacker.GetDouble("close_ratio_level_one");
            info.close_ratio_level_two = unpacker.GetDouble("close_ratio_level_two");
            info.close_ratio_level_three = unpacker.GetDouble("close_ratio_level_three");
            info.remark_info = unpacker.GetStr("remark_info");
            rksecuL_4_38_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_4_38_InfoList.Add((rksecuL_4_38_Info)info);
        }
        #endregion

        //逻辑_风控证券_风控_查询操作员风险监控设置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rksecuL_4_38_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.moni_role_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MONI_ROLE_TYPE_INT);
                    info.moni_value_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MONI_VALUE_FLAG_INT);
                    info.moni_value_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MONI_VALUE_TYPE_INT);
                    info.warn_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WARN_POSI_VALUE_FLOAT);
                    info.warn_trig_oper_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WARN_TRIG_OPER_TYPE_INT);
                    info.close_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_VALUE_FLOAT);
                    info.close_trig_oper_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_TRIG_OPER_TYPE_INT);
                    info.appd_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_APPD_VALUE_FLOAT);
                    info.appd_trig_oper_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_APPD_TRIG_OPER_TYPE_INT);
                    info.begin_moni_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_MONI_DATE_INT);
                    info.begin_moni_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_MONI_VALUE_FLOAT);
                    info.max_moni_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_MONI_VALUE_FLOAT);
                    info.curr_moni_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONI_VALUE_FLOAT);
                    info.curr_result_moni_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_RESULT_MONI_VALUE_FLOAT);
                    info.contrs_stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRS_STOCK_CODE_STR);
                    info.contrs_exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRS_EXCH_NO_INT);
                    info.contrs_max_moni_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CONTRS_MAX_MONI_VALUE_FLOAT);
                    info.contrs_curr_moni_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CONTRS_CURR_MONI_VALUE_FLOAT);
                    info.contrs_result_moni_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CONTRS_RESULT_MONI_VALUE_FLOAT);
                    info.moni_result_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MONI_RESULT_VALUE_FLOAT);
                    info.moni_result_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MONI_RESULT_STATUS_STR);
                    info.moni_set_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MONI_SET_STATUS_STR);
                    info.cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_ASSET_FLOAT);
                    info.fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_ASSET_FLOAT);
                    info.bond_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ASSET_FLOAT);
                    info.stock_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_FLOAT);
                    info.repo_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPO_ASSET_FLOAT);
                    info.nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT);
                    info.stock_asset_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_RATIO_FLOAT);
                    info.close_posi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_FLAG_INT);
                    info.close_ratio_level_one = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_RATIO_LEVEL_ONE_FLOAT);
                    info.close_ratio_level_two = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_RATIO_LEVEL_TWO_FLOAT);
                    info.close_ratio_level_three = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_RATIO_LEVEL_THREE_FLOAT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    rksecuL_4_38_InfoList.Add(info);
                }
            }
        }
    }

    public class rksecuL_4_39_Response : IResponse
    {
        #region 构造函数
        public rksecuL_4_39_Response()
        {
            this.rksecuL_4_39_InfoList = new ObservableCollection<rksecuL_4_39_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_4_39_Info> rksecuL_4_39_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_4_39_Info info = new rksecuL_4_39_Info();
            rksecuL_4_39_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_4_39_InfoList.Add((rksecuL_4_39_Info)info);
        }
        #endregion

        //逻辑_风控证券_风控_启停操作员风险监控设置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rksecuL_4_39_Info();
                rksecuL_4_39_InfoList.Add(info);
            }
        }
    }

    public class rksecuL_4_40_Response : IResponse
    {
        #region 构造函数
        public rksecuL_4_40_Response()
        {
            this.rksecuL_4_40_InfoList = new ObservableCollection<rksecuL_4_40_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_4_40_Info> rksecuL_4_40_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_4_40_Info info = new rksecuL_4_40_Info();
            rksecuL_4_40_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_4_40_InfoList.Add((rksecuL_4_40_Info)info);
        }
        #endregion

        //逻辑_风控证券_风控_启停所有操作员风险监控设置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rksecuL_4_40_Info();
                rksecuL_4_40_InfoList.Add(info);
            }
        }
    }

    public class rksecuL_4_41_Response : IResponse
    {
        #region 构造函数
        public rksecuL_4_41_Response()
        {
            this.rksecuL_4_41_InfoList = new ObservableCollection<rksecuL_4_41_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_4_41_Info> rksecuL_4_41_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_4_41_Info info = new rksecuL_4_41_Info();
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.co_no = unpacker.GetInt("co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.lngsht_type = unpacker.GetInt("lngsht_type");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.open_posi_price = unpacker.GetDouble("open_posi_price");
            info.open_posi_value = unpacker.GetDouble("open_posi_value");
            info.open_posi_fee = unpacker.GetDouble("open_posi_fee");
            info.close_posi_qty = unpacker.GetDouble("close_posi_qty");
            info.close_posi_market_value = unpacker.GetDouble("close_posi_market_value");
            info.close_posi_fee = unpacker.GetDouble("close_posi_fee");
            info.realize_pandl = unpacker.GetDouble("realize_pandl");
            info.pandl_ratio = unpacker.GetDouble("pandl_ratio");
            info.un_close_posi_qty = unpacker.GetDouble("un_close_posi_qty");
            info.un_close_marke_value = unpacker.GetDouble("un_close_marke_value");
            info.last_price = unpacker.GetDouble("last_price");
            info.cost_price = unpacker.GetDouble("cost_price");
            info.last_tshold_value = unpacker.GetDouble("last_tshold_value");
            info.float_pandl = unpacker.GetDouble("float_pandl");
            info.moni_result_status = unpacker.GetStr("moni_result_status");
            info.opor_warn_tshold = unpacker.GetDouble("opor_warn_tshold");
            info.opor_stop_tshold = unpacker.GetDouble("opor_stop_tshold");
            info.stock_warn_ratio = unpacker.GetDouble("stock_warn_ratio");
            info.stock_stop_ratio = unpacker.GetDouble("stock_stop_ratio");
            info.stock_warn_amt = unpacker.GetDouble("stock_warn_amt");
            info.stock_stop_amt = unpacker.GetDouble("stock_stop_amt");
            info.open_close_permission = unpacker.GetInt("open_close_permission");
            rksecuL_4_41_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_4_41_InfoList.Add((rksecuL_4_41_Info)info);
        }
        #endregion

        //逻辑_风控证券_风控_查询T0操作员触警流水信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rksecuL_4_41_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.lngsht_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.open_posi_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_PRICE_FLOAT);
                    info.open_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_VALUE_FLOAT);
                    info.open_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_FEE_FLOAT);
                    info.close_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_QTY_FLOAT);
                    info.close_posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_MARKET_VALUE_FLOAT);
                    info.close_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_FEE_FLOAT);
                    info.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    info.pandl_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PANDL_RATIO_FLOAT);
                    info.un_close_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UN_CLOSE_POSI_QTY_FLOAT);
                    info.un_close_marke_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UN_CLOSE_MARKE_VALUE_FLOAT);
                    info.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    info.cost_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_PRICE_FLOAT);
                    info.last_tshold_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_TSHOLD_VALUE_FLOAT);
                    info.float_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FLOAT_PANDL_FLOAT);
                    info.moni_result_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MONI_RESULT_STATUS_STR);
                    info.opor_warn_tshold = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_WARN_TSHOLD_FLOAT);
                    info.opor_stop_tshold = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_STOP_TSHOLD_FLOAT);
                    info.stock_warn_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_WARN_RATIO_FLOAT);
                    info.stock_stop_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_STOP_RATIO_FLOAT);
                    info.stock_warn_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_WARN_AMT_FLOAT);
                    info.stock_stop_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_STOP_AMT_FLOAT);
                    info.open_close_permission = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_CLOSE_PERMISSION_INT);
                    rksecuL_4_41_InfoList.Add(info);
                }
            }
        }
    }

    public class rksecuL_4_42_Response : IResponse
    {
        #region 构造函数
        public rksecuL_4_42_Response()
        {
            this.rksecuL_4_42_InfoList = new ObservableCollection<rksecuL_4_42_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_4_42_Info> rksecuL_4_42_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_4_42_Info info = new rksecuL_4_42_Info();
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.co_no = unpacker.GetInt("co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.open_posi_value = unpacker.GetDouble("open_posi_value");
            info.open_posi_fee = unpacker.GetDouble("open_posi_fee");
            info.close_posi_qty = unpacker.GetDouble("close_posi_qty");
            info.close_posi_market_value = unpacker.GetDouble("close_posi_market_value");
            info.close_posi_fee = unpacker.GetDouble("close_posi_fee");
            info.realize_pandl = unpacker.GetDouble("realize_pandl");
            info.float_pandl = unpacker.GetDouble("float_pandl");
            info.pandl_ratio = unpacker.GetDouble("pandl_ratio");
            info.un_close_posi_qty = unpacker.GetDouble("un_close_posi_qty");
            info.un_close_marke_value = unpacker.GetDouble("un_close_marke_value");
            info.last_tshold_value = unpacker.GetDouble("last_tshold_value");
            info.moni_result_status = unpacker.GetStr("moni_result_status");
            info.opor_warn_tshold = unpacker.GetDouble("opor_warn_tshold");
            info.opor_stop_tshold = unpacker.GetDouble("opor_stop_tshold");
            info.open_close_permission = unpacker.GetInt("open_close_permission");
            rksecuL_4_42_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_4_42_InfoList.Add((rksecuL_4_42_Info)info);
        }
        #endregion

        //逻辑_风控证券_风控_查询T0操作员汇总触警流水信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rksecuL_4_42_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.open_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_VALUE_FLOAT);
                    info.open_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_FEE_FLOAT);
                    info.close_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_QTY_FLOAT);
                    info.close_posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_MARKET_VALUE_FLOAT);
                    info.close_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_FEE_FLOAT);
                    info.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    info.float_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FLOAT_PANDL_FLOAT);
                    info.pandl_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PANDL_RATIO_FLOAT);
                    info.un_close_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UN_CLOSE_POSI_QTY_FLOAT);
                    info.un_close_marke_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UN_CLOSE_MARKE_VALUE_FLOAT);
                    info.last_tshold_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_TSHOLD_VALUE_FLOAT);
                    info.moni_result_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MONI_RESULT_STATUS_STR);
                    info.opor_warn_tshold = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_WARN_TSHOLD_FLOAT);
                    info.opor_stop_tshold = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_STOP_TSHOLD_FLOAT);
                    info.open_close_permission = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_CLOSE_PERMISSION_INT);
                    rksecuL_4_42_InfoList.Add(info);
                }
            }
        }
    }

    public class rksecuL_4_43_Response : IResponse
    {
        #region 构造函数
        public rksecuL_4_43_Response()
        {
            this.rksecuL_4_43_InfoList = new ObservableCollection<rksecuL_4_43_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_4_43_Info> rksecuL_4_43_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_4_43_Info info = new rksecuL_4_43_Info();
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.co_no = unpacker.GetInt("co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.lngsht_type = unpacker.GetInt("lngsht_type");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.open_posi_price = unpacker.GetDouble("open_posi_price");
            info.open_posi_value = unpacker.GetDouble("open_posi_value");
            info.open_posi_fee = unpacker.GetDouble("open_posi_fee");
            info.close_posi_qty = unpacker.GetDouble("close_posi_qty");
            info.close_posi_market_value = unpacker.GetDouble("close_posi_market_value");
            info.close_posi_fee = unpacker.GetDouble("close_posi_fee");
            info.realize_pandl = unpacker.GetDouble("realize_pandl");
            info.pandl_ratio = unpacker.GetDouble("pandl_ratio");
            info.un_close_posi_qty = unpacker.GetDouble("un_close_posi_qty");
            info.un_close_marke_value = unpacker.GetDouble("un_close_marke_value");
            info.last_price = unpacker.GetDouble("last_price");
            info.cost_price = unpacker.GetDouble("cost_price");
            info.last_tshold_value = unpacker.GetDouble("last_tshold_value");
            info.float_pandl = unpacker.GetDouble("float_pandl");
            info.moni_result_status = unpacker.GetStr("moni_result_status");
            info.opor_warn_tshold = unpacker.GetDouble("opor_warn_tshold");
            info.opor_stop_tshold = unpacker.GetDouble("opor_stop_tshold");
            info.stock_warn_ratio = unpacker.GetDouble("stock_warn_ratio");
            info.stock_stop_ratio = unpacker.GetDouble("stock_stop_ratio");
            info.stock_warn_amt = unpacker.GetDouble("stock_warn_amt");
            info.stock_stop_amt = unpacker.GetDouble("stock_stop_amt");
            info.open_close_permission = unpacker.GetInt("open_close_permission");
            rksecuL_4_43_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_4_43_InfoList.Add((rksecuL_4_43_Info)info);
        }
        #endregion

        //逻辑_风控证券_风控_查询T0操作员历史触警流水信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rksecuL_4_43_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.lngsht_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.open_posi_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_PRICE_FLOAT);
                    info.open_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_VALUE_FLOAT);
                    info.open_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_FEE_FLOAT);
                    info.close_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_QTY_FLOAT);
                    info.close_posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_MARKET_VALUE_FLOAT);
                    info.close_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_FEE_FLOAT);
                    info.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    info.pandl_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PANDL_RATIO_FLOAT);
                    info.un_close_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UN_CLOSE_POSI_QTY_FLOAT);
                    info.un_close_marke_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UN_CLOSE_MARKE_VALUE_FLOAT);
                    info.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    info.cost_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_PRICE_FLOAT);
                    info.last_tshold_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_TSHOLD_VALUE_FLOAT);
                    info.float_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FLOAT_PANDL_FLOAT);
                    info.moni_result_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MONI_RESULT_STATUS_STR);
                    info.opor_warn_tshold = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_WARN_TSHOLD_FLOAT);
                    info.opor_stop_tshold = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_STOP_TSHOLD_FLOAT);
                    info.stock_warn_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_WARN_RATIO_FLOAT);
                    info.stock_stop_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_STOP_RATIO_FLOAT);
                    info.stock_warn_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_WARN_AMT_FLOAT);
                    info.stock_stop_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_STOP_AMT_FLOAT);
                    info.open_close_permission = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_CLOSE_PERMISSION_INT);
                    rksecuL_4_43_InfoList.Add(info);
                }
            }
        }
    }

    public class rksecuL_4_44_Response : IResponse
    {
        #region 构造函数
        public rksecuL_4_44_Response()
        {
            this.rksecuL_4_44_InfoList = new ObservableCollection<rksecuL_4_44_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_4_44_Info> rksecuL_4_44_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_4_44_Info info = new rksecuL_4_44_Info();
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.co_no = unpacker.GetInt("co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.open_posi_value = unpacker.GetDouble("open_posi_value");
            info.open_posi_fee = unpacker.GetDouble("open_posi_fee");
            info.close_posi_qty = unpacker.GetDouble("close_posi_qty");
            info.close_posi_market_value = unpacker.GetDouble("close_posi_market_value");
            info.close_posi_fee = unpacker.GetDouble("close_posi_fee");
            info.realize_pandl = unpacker.GetDouble("realize_pandl");
            info.float_pandl = unpacker.GetDouble("float_pandl");
            info.pandl_ratio = unpacker.GetDouble("pandl_ratio");
            info.un_close_posi_qty = unpacker.GetDouble("un_close_posi_qty");
            info.un_close_marke_value = unpacker.GetDouble("un_close_marke_value");
            info.last_tshold_value = unpacker.GetDouble("last_tshold_value");
            info.moni_result_status = unpacker.GetStr("moni_result_status");
            info.opor_warn_tshold = unpacker.GetDouble("opor_warn_tshold");
            info.opor_stop_tshold = unpacker.GetDouble("opor_stop_tshold");
            info.open_close_permission = unpacker.GetInt("open_close_permission");
            rksecuL_4_44_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_4_44_InfoList.Add((rksecuL_4_44_Info)info);
        }
        #endregion

        //逻辑_风控证券_风控_查询T0操作员历史汇总触警流水信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rksecuL_4_44_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.open_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_VALUE_FLOAT);
                    info.open_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_FEE_FLOAT);
                    info.close_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_QTY_FLOAT);
                    info.close_posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_MARKET_VALUE_FLOAT);
                    info.close_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_FEE_FLOAT);
                    info.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    info.float_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FLOAT_PANDL_FLOAT);
                    info.pandl_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PANDL_RATIO_FLOAT);
                    info.un_close_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UN_CLOSE_POSI_QTY_FLOAT);
                    info.un_close_marke_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UN_CLOSE_MARKE_VALUE_FLOAT);
                    info.last_tshold_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_TSHOLD_VALUE_FLOAT);
                    info.moni_result_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MONI_RESULT_STATUS_STR);
                    info.opor_warn_tshold = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_WARN_TSHOLD_FLOAT);
                    info.opor_stop_tshold = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_STOP_TSHOLD_FLOAT);
                    info.open_close_permission = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_CLOSE_PERMISSION_INT);
                    rksecuL_4_44_InfoList.Add(info);
                }
            }
        }
    }

    public class rksecuL_4_45_Response : IResponse
    {
        #region 构造函数
        public rksecuL_4_45_Response()
        {
            this.rksecuL_4_45_InfoList = new ObservableCollection<rksecuL_4_45_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_4_45_Info> rksecuL_4_45_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_4_45_Info info = new rksecuL_4_45_Info();
            rksecuL_4_45_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_4_45_InfoList.Add((rksecuL_4_45_Info)info);
        }
        #endregion

        //逻辑_风控证券_风控_删除客户风险触警流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rksecuL_4_45_Info();
                rksecuL_4_45_InfoList.Add(info);
            }
        }
    }

    public class rksecuL_4_51_Response : IResponse
    {
        #region 构造函数
        public rksecuL_4_51_Response()
        {
            this.rksecuL_4_51_InfoList = new ObservableCollection<rksecuL_4_51_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_4_51_Info> rksecuL_4_51_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_4_51_Info info = new rksecuL_4_51_Info();
            rksecuL_4_51_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_4_51_InfoList.Add((rksecuL_4_51_Info)info);
        }
        #endregion

        //逻辑_风控证券_风控_更新资产账户融资融券保证金计算结果集
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rksecuL_4_51_Info();
                rksecuL_4_51_InfoList.Add(info);
            }
        }
    }

    public class rksecuL_4_54_Response : IResponse
    {
        #region 构造函数
        public rksecuL_4_54_Response()
        {
            this.rksecuL_4_54_InfoList = new ObservableCollection<rksecuL_4_54_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_4_54_Info> rksecuL_4_54_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_4_54_Info info = new rksecuL_4_54_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.curr_converted_margin = unpacker.GetDouble("curr_converted_margin");
            info.cmmd_converted_margin = unpacker.GetDouble("cmmd_converted_margin");
            info.order_converted_margin = unpacker.GetDouble("order_converted_margin");
            info.fina_market_value = unpacker.GetDouble("fina_market_value");
            info.fina_profit = unpacker.GetDouble("fina_profit");
            info.fina_converted_pandl = unpacker.GetDouble("fina_converted_pandl");
            info.loan_market_value = unpacker.GetDouble("loan_market_value");
            info.loan_profit = unpacker.GetDouble("loan_profit");
            info.loan_converted_pandl = unpacker.GetDouble("loan_converted_pandl");
            info.fina_capt_margin = unpacker.GetDouble("fina_capt_margin");
            info.loan_capt_margin = unpacker.GetDouble("loan_capt_margin");
            info.keep_guarantee_ratio = unpacker.GetDouble("keep_guarantee_ratio");
            info.loan_sell_amt = unpacker.GetDouble("loan_sell_amt");
            info.margin_ratio_market_value = unpacker.GetDouble("margin_ratio_market_value");
            info.fina_interest = unpacker.GetDouble("fina_interest");
            info.loan_interest = unpacker.GetDouble("loan_interest");
            info.update_times = unpacker.GetInt("update_times");
            rksecuL_4_54_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_4_54_InfoList.Add((rksecuL_4_54_Info)info);
        }
        #endregion

        //逻辑_风控证券_风控_查询资产账户融资融券保证金计算结果集
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rksecuL_4_54_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.curr_converted_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_CONVERTED_MARGIN_FLOAT);
                    info.cmmd_converted_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CMMD_CONVERTED_MARGIN_FLOAT);
                    info.order_converted_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_CONVERTED_MARGIN_FLOAT);
                    info.fina_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_MARKET_VALUE_FLOAT);
                    info.fina_profit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_PROFIT_FLOAT);
                    info.fina_converted_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_CONVERTED_PANDL_FLOAT);
                    info.loan_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_MARKET_VALUE_FLOAT);
                    info.loan_profit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_PROFIT_FLOAT);
                    info.loan_converted_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_CONVERTED_PANDL_FLOAT);
                    info.fina_capt_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_CAPT_MARGIN_FLOAT);
                    info.loan_capt_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_CAPT_MARGIN_FLOAT);
                    info.keep_guarantee_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_KEEP_GUARANTEE_RATIO_FLOAT);
                    info.loan_sell_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_SELL_AMT_FLOAT);
                    info.margin_ratio_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARGIN_RATIO_MARKET_VALUE_FLOAT);
                    info.fina_interest = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_INTEREST_FLOAT);
                    info.loan_interest = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_INTEREST_FLOAT);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    rksecuL_4_54_InfoList.Add(info);
                }
            }
        }
    }

    public class rksecuL_4_61_Response : IResponse
    {
        #region 构造函数
        public rksecuL_4_61_Response()
        {
            this.rksecuL_4_61_InfoList = new ObservableCollection<rksecuL_4_61_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_4_61_Info> rksecuL_4_61_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_4_61_Info info = new rksecuL_4_61_Info();
            rksecuL_4_61_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_4_61_InfoList.Add((rksecuL_4_61_Info)info);
        }
        #endregion

        //逻辑_风控证券_风控_更新交易组融资融券保证金计算结果集
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rksecuL_4_61_Info();
                rksecuL_4_61_InfoList.Add(info);
            }
        }
    }

    public class rksecuL_4_64_Response : IResponse
    {
        #region 构造函数
        public rksecuL_4_64_Response()
        {
            this.rksecuL_4_64_InfoList = new ObservableCollection<rksecuL_4_64_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_4_64_Info> rksecuL_4_64_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_4_64_Info info = new rksecuL_4_64_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.curr_converted_margin = unpacker.GetDouble("curr_converted_margin");
            info.cmmd_converted_margin = unpacker.GetDouble("cmmd_converted_margin");
            info.order_converted_margin = unpacker.GetDouble("order_converted_margin");
            info.fina_market_value = unpacker.GetDouble("fina_market_value");
            info.fina_profit = unpacker.GetDouble("fina_profit");
            info.fina_converted_pandl = unpacker.GetDouble("fina_converted_pandl");
            info.loan_market_value = unpacker.GetDouble("loan_market_value");
            info.loan_profit = unpacker.GetDouble("loan_profit");
            info.loan_converted_pandl = unpacker.GetDouble("loan_converted_pandl");
            info.fina_capt_margin = unpacker.GetDouble("fina_capt_margin");
            info.loan_capt_margin = unpacker.GetDouble("loan_capt_margin");
            info.keep_guarantee_ratio = unpacker.GetDouble("keep_guarantee_ratio");
            info.loan_sell_amt = unpacker.GetDouble("loan_sell_amt");
            info.margin_ratio_market_value = unpacker.GetDouble("margin_ratio_market_value");
            info.fina_interest = unpacker.GetDouble("fina_interest");
            info.loan_interest = unpacker.GetDouble("loan_interest");
            info.update_times = unpacker.GetInt("update_times");
            rksecuL_4_64_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_4_64_InfoList.Add((rksecuL_4_64_Info)info);
        }
        #endregion

        //逻辑_风控证券_风控_查询交易组融资融券保证金计算结果集
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rksecuL_4_64_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.curr_converted_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_CONVERTED_MARGIN_FLOAT);
                    info.cmmd_converted_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CMMD_CONVERTED_MARGIN_FLOAT);
                    info.order_converted_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_CONVERTED_MARGIN_FLOAT);
                    info.fina_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_MARKET_VALUE_FLOAT);
                    info.fina_profit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_PROFIT_FLOAT);
                    info.fina_converted_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_CONVERTED_PANDL_FLOAT);
                    info.loan_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_MARKET_VALUE_FLOAT);
                    info.loan_profit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_PROFIT_FLOAT);
                    info.loan_converted_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_CONVERTED_PANDL_FLOAT);
                    info.fina_capt_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_CAPT_MARGIN_FLOAT);
                    info.loan_capt_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_CAPT_MARGIN_FLOAT);
                    info.keep_guarantee_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_KEEP_GUARANTEE_RATIO_FLOAT);
                    info.loan_sell_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_SELL_AMT_FLOAT);
                    info.margin_ratio_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARGIN_RATIO_MARKET_VALUE_FLOAT);
                    info.fina_interest = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_INTEREST_FLOAT);
                    info.loan_interest = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_INTEREST_FLOAT);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    rksecuL_4_64_InfoList.Add(info);
                }
            }
        }
    }

    public class rksecuL_4_65_Response : IResponse
    {
        #region 构造函数
        public rksecuL_4_65_Response()
        {
            this.rksecuL_4_65_InfoList = new ObservableCollection<rksecuL_4_65_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_4_65_Info> rksecuL_4_65_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_4_65_Info info = new rksecuL_4_65_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no_str = unpacker.GetStr("pd_no_str");
            info.exch_group_no_str = unpacker.GetStr("exch_group_no_str");
            info.moni_role_type = unpacker.GetInt("moni_role_type");
            info.moni_value_flag = unpacker.GetInt("moni_value_flag");
            info.moni_value_type = unpacker.GetInt("moni_value_type");
            info.warn_posi_value = unpacker.GetDouble("warn_posi_value");
            info.warn_trig_oper_type = unpacker.GetInt("warn_trig_oper_type");
            info.close_posi_value = unpacker.GetDouble("close_posi_value");
            info.close_trig_oper_type = unpacker.GetInt("close_trig_oper_type");
            info.appd_value = unpacker.GetDouble("appd_value");
            info.appd_trig_oper_type = unpacker.GetInt("appd_trig_oper_type");
            info.begin_moni_date = unpacker.GetInt("begin_moni_date");
            info.begin_moni_value = unpacker.GetDouble("begin_moni_value");
            info.max_moni_value = unpacker.GetDouble("max_moni_value");
            info.curr_moni_value = unpacker.GetDouble("curr_moni_value");
            info.curr_result_moni_value = unpacker.GetDouble("curr_result_moni_value");
            info.contrs_stock_code = unpacker.GetStr("contrs_stock_code");
            info.contrs_exch_no = unpacker.GetInt("contrs_exch_no");
            info.contrs_max_moni_value = unpacker.GetDouble("contrs_max_moni_value");
            info.contrs_curr_moni_value = unpacker.GetDouble("contrs_curr_moni_value");
            info.contrs_result_moni_value = unpacker.GetDouble("contrs_result_moni_value");
            info.moni_result_value = unpacker.GetDouble("moni_result_value");
            info.moni_result_status = unpacker.GetStr("moni_result_status");
            info.moni_set_status = unpacker.GetStr("moni_set_status");
            info.cash_asset = unpacker.GetDouble("cash_asset");
            info.fund_asset = unpacker.GetDouble("fund_asset");
            info.bond_asset = unpacker.GetDouble("bond_asset");
            info.stock_asset = unpacker.GetDouble("stock_asset");
            info.repo_asset = unpacker.GetDouble("repo_asset");
            info.nav_asset = unpacker.GetDouble("nav_asset");
            info.stock_asset_ratio = unpacker.GetDouble("stock_asset_ratio");
            info.close_posi_flag = unpacker.GetInt("close_posi_flag");
            info.close_ratio_level_one = unpacker.GetDouble("close_ratio_level_one");
            info.close_ratio_level_two = unpacker.GetDouble("close_ratio_level_two");
            info.close_ratio_level_three = unpacker.GetDouble("close_ratio_level_three");
            info.remark_info = unpacker.GetStr("remark_info");
            info.pd_share = unpacker.GetDouble("pd_share");
            info.begin_asset_value = unpacker.GetDouble("begin_asset_value");
            info.hk_thrgh_stock_asset = unpacker.GetDouble("hk_thrgh_stock_asset");
            rksecuL_4_65_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_4_65_InfoList.Add((rksecuL_4_65_Info)info);
        }
        #endregion

        //逻辑_风控证券_风控_查询所有账户风险监控设置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rksecuL_4_65_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_STR_STR);
                    info.exch_group_no_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_STR_STR);
                    info.moni_role_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MONI_ROLE_TYPE_INT);
                    info.moni_value_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MONI_VALUE_FLAG_INT);
                    info.moni_value_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MONI_VALUE_TYPE_INT);
                    info.warn_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WARN_POSI_VALUE_FLOAT);
                    info.warn_trig_oper_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WARN_TRIG_OPER_TYPE_INT);
                    info.close_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_VALUE_FLOAT);
                    info.close_trig_oper_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_TRIG_OPER_TYPE_INT);
                    info.appd_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_APPD_VALUE_FLOAT);
                    info.appd_trig_oper_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_APPD_TRIG_OPER_TYPE_INT);
                    info.begin_moni_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_MONI_DATE_INT);
                    info.begin_moni_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_MONI_VALUE_FLOAT);
                    info.max_moni_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_MONI_VALUE_FLOAT);
                    info.curr_moni_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONI_VALUE_FLOAT);
                    info.curr_result_moni_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_RESULT_MONI_VALUE_FLOAT);
                    info.contrs_stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRS_STOCK_CODE_STR);
                    info.contrs_exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRS_EXCH_NO_INT);
                    info.contrs_max_moni_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CONTRS_MAX_MONI_VALUE_FLOAT);
                    info.contrs_curr_moni_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CONTRS_CURR_MONI_VALUE_FLOAT);
                    info.contrs_result_moni_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CONTRS_RESULT_MONI_VALUE_FLOAT);
                    info.moni_result_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MONI_RESULT_VALUE_FLOAT);
                    info.moni_result_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MONI_RESULT_STATUS_STR);
                    info.moni_set_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MONI_SET_STATUS_STR);
                    info.cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_ASSET_FLOAT);
                    info.fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_ASSET_FLOAT);
                    info.bond_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ASSET_FLOAT);
                    info.stock_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_FLOAT);
                    info.repo_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPO_ASSET_FLOAT);
                    info.nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT);
                    info.stock_asset_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_RATIO_FLOAT);
                    info.close_posi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_FLAG_INT);
                    info.close_ratio_level_one = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_RATIO_LEVEL_ONE_FLOAT);
                    info.close_ratio_level_two = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_RATIO_LEVEL_TWO_FLOAT);
                    info.close_ratio_level_three = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_RATIO_LEVEL_THREE_FLOAT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    info.pd_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_SHARE_FLOAT);
                    info.begin_asset_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_ASSET_VALUE_FLOAT);
                    info.hk_thrgh_stock_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HK_THRGH_STOCK_ASSET_FLOAT);
                    rksecuL_4_65_InfoList.Add(info);
                }
            }
        }
    }

    public class rksecuL_4_66_Response : IResponse
    {
        #region 构造函数
        public rksecuL_4_66_Response()
        {
            this.rksecuL_4_66_InfoList = new ObservableCollection<rksecuL_4_66_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_4_66_Info> rksecuL_4_66_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_4_66_Info info = new rksecuL_4_66_Info();
            rksecuL_4_66_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_4_66_InfoList.Add((rksecuL_4_66_Info)info);
        }
        #endregion

        //逻辑_风控证券_风控_新增预订单信息表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rksecuL_4_66_Info();
                rksecuL_4_66_InfoList.Add(info);
            }
        }
    }

    public class rksecuL_4_67_Response : IResponse
    {
        #region 构造函数
        public rksecuL_4_67_Response()
        {
            this.rksecuL_4_67_InfoList = new ObservableCollection<rksecuL_4_67_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_4_67_Info> rksecuL_4_67_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_4_67_Info info = new rksecuL_4_67_Info();
            rksecuL_4_67_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_4_67_InfoList.Add((rksecuL_4_67_Info)info);
        }
        #endregion

        //逻辑_风控证券_风控_删除预订单信息表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rksecuL_4_67_Info();
                rksecuL_4_67_InfoList.Add(info);
            }
        }
    }

    public class rksecuL_4_68_Response : IResponse
    {
        #region 构造函数
        public rksecuL_4_68_Response()
        {
            this.rksecuL_4_68_InfoList = new ObservableCollection<rksecuL_4_68_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_4_68_Info> rksecuL_4_68_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_4_68_Info info = new rksecuL_4_68_Info();
            info.compli_trig_id = unpacker.GetInt64("compli_trig_id");
            rksecuL_4_68_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_4_68_InfoList.Add((rksecuL_4_68_Info)info);
        }
        #endregion

        //逻辑_风控证券_风控_联合汇总检查客户风险
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rksecuL_4_68_Info();
                info.compli_trig_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_TRIG_ID_INT64);
                rksecuL_4_68_InfoList.Add(info);
            }
        }
    }

    public class rksecuL_4_69_Response : IResponse
    {
        #region 构造函数
        public rksecuL_4_69_Response()
        {
            this.rksecuL_4_69_InfoList = new ObservableCollection<rksecuL_4_69_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_4_69_Info> rksecuL_4_69_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_4_69_Info info = new rksecuL_4_69_Info();
            rksecuL_4_69_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_4_69_InfoList.Add((rksecuL_4_69_Info)info);
        }
        #endregion

        //逻辑_风控证券_风控_新增预指令信息表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rksecuL_4_69_Info();
                rksecuL_4_69_InfoList.Add(info);
            }
        }
    }

}
