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
    public class rksecuL_1_1_Response : IResponse
    {
        #region 构造函数
        public rksecuL_1_1_Response()
        {
            this.rksecuL_1_1_InfoList = new ObservableCollection<rksecuL_1_1_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_1_1_Info> rksecuL_1_1_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_1_1_Info info = new rksecuL_1_1_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.risk_rule_type = unpacker.GetInt("risk_rule_type");
            info.risk_rule_name = unpacker.GetStr("risk_rule_name");
            info.risk_rule_code = unpacker.GetStr("risk_rule_code");
            info.risk_param_str = unpacker.GetStr("risk_param_str");
            info.tim_deal_flag = unpacker.GetInt("tim_deal_flag");
            info.corrsp_plug = unpacker.GetStr("corrsp_plug");
            rksecuL_1_1_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_1_1_InfoList.Add((rksecuL_1_1_Info)info);
        }
        #endregion

        //逻辑_风控证券_公用_查询风险规则记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rksecuL_1_1_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.risk_rule_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_TYPE_INT);
                    info.risk_rule_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_NAME_STR);
                    info.risk_rule_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_CODE_STR);
                    info.risk_param_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_PARAM_STR_STR);
                    info.tim_deal_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIM_DEAL_FLAG_INT);
                    info.corrsp_plug = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CORRSP_PLUG_STR);
                    rksecuL_1_1_InfoList.Add(info);
                }
            }
        }
    }

    public class rksecuL_1_2_Response : IResponse
    {
        #region 构造函数
        public rksecuL_1_2_Response()
        {
            this.rksecuL_1_2_InfoList = new ObservableCollection<rksecuL_1_2_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_1_2_Info> rksecuL_1_2_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_1_2_Info info = new rksecuL_1_2_Info();
            info.row_id = unpacker.GetInt64("row_id");
            rksecuL_1_2_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_1_2_InfoList.Add((rksecuL_1_2_Info)info);
        }
        #endregion

        //逻辑_风控证券_公用_增加风险条目记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rksecuL_1_2_Info();
                info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                rksecuL_1_2_InfoList.Add(info);
            }
        }
    }

    public class rksecuL_1_3_Response : IResponse
    {
        #region 构造函数
        public rksecuL_1_3_Response()
        {
            this.rksecuL_1_3_InfoList = new ObservableCollection<rksecuL_1_3_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_1_3_Info> rksecuL_1_3_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_1_3_Info info = new rksecuL_1_3_Info();
            rksecuL_1_3_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_1_3_InfoList.Add((rksecuL_1_3_Info)info);
        }
        #endregion

        //逻辑_风控证券_公用_修改风险条目记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rksecuL_1_3_Info();
                rksecuL_1_3_InfoList.Add(info);
            }
        }
    }

    public class rksecuL_1_4_Response : IResponse
    {
        #region 构造函数
        public rksecuL_1_4_Response()
        {
            this.rksecuL_1_4_InfoList = new ObservableCollection<rksecuL_1_4_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_1_4_Info> rksecuL_1_4_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_1_4_Info info = new rksecuL_1_4_Info();
            rksecuL_1_4_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_1_4_InfoList.Add((rksecuL_1_4_Info)info);
        }
        #endregion

        //逻辑_风控证券_公用_删除风险条目记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rksecuL_1_4_Info();
                rksecuL_1_4_InfoList.Add(info);
            }
        }
    }

    public class rksecuL_1_5_Response : IResponse
    {
        #region 构造函数
        public rksecuL_1_5_Response()
        {
            this.rksecuL_1_5_InfoList = new ObservableCollection<rksecuL_1_5_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_1_5_Info> rksecuL_1_5_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_1_5_Info info = new rksecuL_1_5_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
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
            info.risk_item_tmplat_id = unpacker.GetInt64("risk_item_tmplat_id");
            info.rule_flag = unpacker.GetInt("rule_flag");
            rksecuL_1_5_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_1_5_InfoList.Add((rksecuL_1_5_Info)info);
        }
        #endregion

        //逻辑_风控证券_公用_查询风险条目记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rksecuL_1_5_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
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
                    info.risk_item_tmplat_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_RISK_ITEM_TMPLAT_ID_INT64);
                    info.rule_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RULE_FLAG_INT);
                    rksecuL_1_5_InfoList.Add(info);
                }
            }
        }
    }

    public class rksecuL_1_6_Response : IResponse
    {
        #region 构造函数
        public rksecuL_1_6_Response()
        {
            this.rksecuL_1_6_InfoList = new ObservableCollection<rksecuL_1_6_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_1_6_Info> rksecuL_1_6_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_1_6_Info info = new rksecuL_1_6_Info();
            rksecuL_1_6_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_1_6_InfoList.Add((rksecuL_1_6_Info)info);
        }
        #endregion

        //逻辑_风控证券_公用_增加风险模板记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rksecuL_1_6_Info();
                rksecuL_1_6_InfoList.Add(info);
            }
        }
    }

    public class rksecuL_1_7_Response : IResponse
    {
        #region 构造函数
        public rksecuL_1_7_Response()
        {
            this.rksecuL_1_7_InfoList = new ObservableCollection<rksecuL_1_7_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_1_7_Info> rksecuL_1_7_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_1_7_Info info = new rksecuL_1_7_Info();
            rksecuL_1_7_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_1_7_InfoList.Add((rksecuL_1_7_Info)info);
        }
        #endregion

        //逻辑_风控证券_公用_删除风险模板记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rksecuL_1_7_Info();
                rksecuL_1_7_InfoList.Add(info);
            }
        }
    }

    public class rksecuL_1_8_Response : IResponse
    {
        #region 构造函数
        public rksecuL_1_8_Response()
        {
            this.rksecuL_1_8_InfoList = new ObservableCollection<rksecuL_1_8_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_1_8_Info> rksecuL_1_8_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_1_8_Info info = new rksecuL_1_8_Info();
            rksecuL_1_8_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_1_8_InfoList.Add((rksecuL_1_8_Info)info);
        }
        #endregion

        //逻辑_风控证券_公用_修改风险模板记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rksecuL_1_8_Info();
                rksecuL_1_8_InfoList.Add(info);
            }
        }
    }

    public class rksecuL_1_9_Response : IResponse
    {
        #region 构造函数
        public rksecuL_1_9_Response()
        {
            this.rksecuL_1_9_InfoList = new ObservableCollection<rksecuL_1_9_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_1_9_Info> rksecuL_1_9_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_1_9_Info info = new rksecuL_1_9_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.model_name = unpacker.GetStr("model_name");
            info.remark_info = unpacker.GetStr("remark_info");
            rksecuL_1_9_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_1_9_InfoList.Add((rksecuL_1_9_Info)info);
        }
        #endregion

        //逻辑_风控证券_公用_查询风险模板记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rksecuL_1_9_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.model_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MODEL_NAME_STR);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    rksecuL_1_9_InfoList.Add(info);
                }
            }
        }
    }

    public class rksecuL_1_10_Response : IResponse
    {
        #region 构造函数
        public rksecuL_1_10_Response()
        {
            this.rksecuL_1_10_InfoList = new ObservableCollection<rksecuL_1_10_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_1_10_Info> rksecuL_1_10_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_1_10_Info info = new rksecuL_1_10_Info();
            rksecuL_1_10_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_1_10_InfoList.Add((rksecuL_1_10_Info)info);
        }
        #endregion

        //逻辑_风控证券_公用_增加风险模板条目记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rksecuL_1_10_Info();
                rksecuL_1_10_InfoList.Add(info);
            }
        }
    }

    public class rksecuL_1_11_Response : IResponse
    {
        #region 构造函数
        public rksecuL_1_11_Response()
        {
            this.rksecuL_1_11_InfoList = new ObservableCollection<rksecuL_1_11_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_1_11_Info> rksecuL_1_11_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_1_11_Info info = new rksecuL_1_11_Info();
            rksecuL_1_11_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_1_11_InfoList.Add((rksecuL_1_11_Info)info);
        }
        #endregion

        //逻辑_风控证券_公用_删除风险模板条目记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rksecuL_1_11_Info();
                rksecuL_1_11_InfoList.Add(info);
            }
        }
    }

    public class rksecuL_1_12_Response : IResponse
    {
        #region 构造函数
        public rksecuL_1_12_Response()
        {
            this.rksecuL_1_12_InfoList = new ObservableCollection<rksecuL_1_12_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_1_12_Info> rksecuL_1_12_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_1_12_Info info = new rksecuL_1_12_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.exch_no_str = unpacker.GetStr("exch_no_str");
            info.order_dir_str = unpacker.GetStr("order_dir_str");
            info.dime_id = unpacker.GetInt64("dime_id");
            info.risk_item_id = unpacker.GetInt("risk_item_id");
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
            rksecuL_1_12_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_1_12_InfoList.Add((rksecuL_1_12_Info)info);
        }
        #endregion

        //逻辑_风控证券_公用_查询风险模板条目记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rksecuL_1_12_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.exch_no_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR);
                    info.order_dir_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR);
                    info.dime_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_DIME_ID_INT64);
                    info.risk_item_id = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_ITEM_ID_INT);
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
                    rksecuL_1_12_InfoList.Add(info);
                }
            }
        }
    }

    public class rksecuL_1_13_Response : IResponse
    {
        #region 构造函数
        public rksecuL_1_13_Response()
        {
            this.rksecuL_1_13_InfoList = new ObservableCollection<rksecuL_1_13_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_1_13_Info> rksecuL_1_13_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_1_13_Info info = new rksecuL_1_13_Info();
            rksecuL_1_13_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_1_13_InfoList.Add((rksecuL_1_13_Info)info);
        }
        #endregion

        //逻辑_风控证券_公用_更新风险条目记录启用标志
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rksecuL_1_13_Info();
                rksecuL_1_13_InfoList.Add(info);
            }
        }
    }

    public class rksecuL_1_14_Response : IResponse
    {
        #region 构造函数
        public rksecuL_1_14_Response()
        {
            this.rksecuL_1_14_InfoList = new ObservableCollection<rksecuL_1_14_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_1_14_Info> rksecuL_1_14_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_1_14_Info info = new rksecuL_1_14_Info();
            rksecuL_1_14_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_1_14_InfoList.Add((rksecuL_1_14_Info)info);
        }
        #endregion

        //逻辑_风控证券_公用_证券数据归历史
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rksecuL_1_14_Info();
                rksecuL_1_14_InfoList.Add(info);
            }
        }
    }

    public class rksecuL_1_15_Response : IResponse
    {
        #region 构造函数
        public rksecuL_1_15_Response()
        {
            this.rksecuL_1_15_InfoList = new ObservableCollection<rksecuL_1_15_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_1_15_Info> rksecuL_1_15_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_1_15_Info info = new rksecuL_1_15_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.exch_no_str = unpacker.GetStr("exch_no_str");
            info.order_dir_str = unpacker.GetStr("order_dir_str");
            info.dime_type = unpacker.GetInt("dime_type");
            info.ctrl_cond_dim_code_str = unpacker.GetStr("ctrl_cond_dim_code_str");
            info.trig_stage_type_str = unpacker.GetStr("trig_stage_type_str");
            info.compli_calc_level = unpacker.GetInt("compli_calc_level");
            info.trig_type = unpacker.GetInt("trig_type");
            info.risk_item_tmplat_name = unpacker.GetStr("risk_item_tmplat_name");
            info.risk_rule_id = unpacker.GetInt("risk_rule_id");
            info.risk_rule_type = unpacker.GetInt("risk_rule_type");
            info.risk_rule_name = unpacker.GetStr("risk_rule_name");
            info.risk_rule_code = unpacker.GetStr("risk_rule_code");
            info.risk_param_str = unpacker.GetStr("risk_param_str");
            rksecuL_1_15_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_1_15_InfoList.Add((rksecuL_1_15_Info)info);
        }
        #endregion

        //逻辑_风控证券_公用_查询风险条目模板记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rksecuL_1_15_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.exch_no_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR);
                    info.order_dir_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR);
                    info.dime_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DIME_TYPE_INT);
                    info.ctrl_cond_dim_code_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CTRL_COND_DIM_CODE_STR_STR);
                    info.trig_stage_type_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_STAGE_TYPE_STR_STR);
                    info.compli_calc_level = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_CALC_LEVEL_INT);
                    info.trig_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_TYPE_INT);
                    info.risk_item_tmplat_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_ITEM_TMPLAT_NAME_STR);
                    info.risk_rule_id = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_ID_INT);
                    info.risk_rule_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_TYPE_INT);
                    info.risk_rule_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_NAME_STR);
                    info.risk_rule_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_CODE_STR);
                    info.risk_param_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_PARAM_STR_STR);
                    rksecuL_1_15_InfoList.Add(info);
                }
            }
        }
    }

}
