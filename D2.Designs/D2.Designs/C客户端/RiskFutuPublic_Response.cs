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
    public class rkfutuL_1_4_Response : IResponse
    {
        #region 构造函数
        public rkfutuL_1_4_Response()
        {
            this.rkfutuL_1_4_InfoList = new ObservableCollection<rkfutuL_1_4_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rkfutuL_1_4_Info> rkfutuL_1_4_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rkfutuL_1_4_Info info = new rkfutuL_1_4_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.risk_rule_type = unpacker.GetInt("risk_rule_type");
            info.risk_rule_name = unpacker.GetStr("risk_rule_name");
            info.risk_rule_code = unpacker.GetStr("risk_rule_code");
            info.risk_param_str = unpacker.GetStr("risk_param_str");
            info.corrsp_plug = unpacker.GetStr("corrsp_plug");
            rkfutuL_1_4_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rkfutuL_1_4_InfoList.Add((rkfutuL_1_4_Info)info);
        }
        #endregion

        //逻辑_风控期货_公用_查询风险规则记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rkfutuL_1_4_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.risk_rule_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_TYPE_INT);
                    info.risk_rule_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_NAME_STR);
                    info.risk_rule_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_CODE_STR);
                    info.risk_param_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_PARAM_STR_STR);
                    info.corrsp_plug = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CORRSP_PLUG_STR);
                    rkfutuL_1_4_InfoList.Add(info);
                }
            }
        }
    }

    public class rkfutuL_1_5_Response : IResponse
    {
        #region 构造函数
        public rkfutuL_1_5_Response()
        {
            this.rkfutuL_1_5_InfoList = new ObservableCollection<rkfutuL_1_5_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rkfutuL_1_5_Info> rkfutuL_1_5_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rkfutuL_1_5_Info info = new rkfutuL_1_5_Info();
            info.row_id = unpacker.GetInt64("row_id");
            rkfutuL_1_5_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rkfutuL_1_5_InfoList.Add((rkfutuL_1_5_Info)info);
        }
        #endregion

        //逻辑_风控期货_公用_增加风险条目记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rkfutuL_1_5_Info();
                info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                rkfutuL_1_5_InfoList.Add(info);
            }
        }
    }

    public class rkfutuL_1_6_Response : IResponse
    {
        #region 构造函数
        public rkfutuL_1_6_Response()
        {
            this.rkfutuL_1_6_InfoList = new ObservableCollection<rkfutuL_1_6_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rkfutuL_1_6_Info> rkfutuL_1_6_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rkfutuL_1_6_Info info = new rkfutuL_1_6_Info();
            rkfutuL_1_6_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rkfutuL_1_6_InfoList.Add((rkfutuL_1_6_Info)info);
        }
        #endregion

        //逻辑_风控期货_公用_修改风险条目记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rkfutuL_1_6_Info();
                rkfutuL_1_6_InfoList.Add(info);
            }
        }
    }

    public class rkfutuL_1_7_Response : IResponse
    {
        #region 构造函数
        public rkfutuL_1_7_Response()
        {
            this.rkfutuL_1_7_InfoList = new ObservableCollection<rkfutuL_1_7_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rkfutuL_1_7_Info> rkfutuL_1_7_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rkfutuL_1_7_Info info = new rkfutuL_1_7_Info();
            rkfutuL_1_7_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rkfutuL_1_7_InfoList.Add((rkfutuL_1_7_Info)info);
        }
        #endregion

        //逻辑_风控期货_公用_更新风险条目记录启用标志
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rkfutuL_1_7_Info();
                rkfutuL_1_7_InfoList.Add(info);
            }
        }
    }

    public class rkfutuL_1_8_Response : IResponse
    {
        #region 构造函数
        public rkfutuL_1_8_Response()
        {
            this.rkfutuL_1_8_InfoList = new ObservableCollection<rkfutuL_1_8_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rkfutuL_1_8_Info> rkfutuL_1_8_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rkfutuL_1_8_Info info = new rkfutuL_1_8_Info();
            rkfutuL_1_8_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rkfutuL_1_8_InfoList.Add((rkfutuL_1_8_Info)info);
        }
        #endregion

        //逻辑_风控期货_公用_删除风险条目记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rkfutuL_1_8_Info();
                rkfutuL_1_8_InfoList.Add(info);
            }
        }
    }

    public class rkfutuL_1_9_Response : IResponse
    {
        #region 构造函数
        public rkfutuL_1_9_Response()
        {
            this.rkfutuL_1_9_InfoList = new ObservableCollection<rkfutuL_1_9_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rkfutuL_1_9_Info> rkfutuL_1_9_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rkfutuL_1_9_Info info = new rkfutuL_1_9_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.risk_item_name = unpacker.GetStr("risk_item_name");
            info.exch_no = unpacker.GetInt("exch_no");
            info.contrc_type = unpacker.GetInt("contrc_type");
            info.order_dir_str = unpacker.GetStr("order_dir_str");
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
            rkfutuL_1_9_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rkfutuL_1_9_InfoList.Add((rkfutuL_1_9_Info)info);
        }
        #endregion

        //逻辑_风控期货_公用_查询风险条目记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rkfutuL_1_9_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.risk_item_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_ITEM_NAME_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    info.order_dir_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR);
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
                    rkfutuL_1_9_InfoList.Add(info);
                }
            }
        }
    }

    public class rkfutuL_1_10_Response : IResponse
    {
        #region 构造函数
        public rkfutuL_1_10_Response()
        {
            this.rkfutuL_1_10_InfoList = new ObservableCollection<rkfutuL_1_10_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rkfutuL_1_10_Info> rkfutuL_1_10_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rkfutuL_1_10_Info info = new rkfutuL_1_10_Info();
            rkfutuL_1_10_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rkfutuL_1_10_InfoList.Add((rkfutuL_1_10_Info)info);
        }
        #endregion

        //逻辑_风控期货_公用_增加风险模板记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rkfutuL_1_10_Info();
                rkfutuL_1_10_InfoList.Add(info);
            }
        }
    }

    public class rkfutuL_1_11_Response : IResponse
    {
        #region 构造函数
        public rkfutuL_1_11_Response()
        {
            this.rkfutuL_1_11_InfoList = new ObservableCollection<rkfutuL_1_11_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rkfutuL_1_11_Info> rkfutuL_1_11_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rkfutuL_1_11_Info info = new rkfutuL_1_11_Info();
            rkfutuL_1_11_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rkfutuL_1_11_InfoList.Add((rkfutuL_1_11_Info)info);
        }
        #endregion

        //逻辑_风控期货_公用_删除风险模板记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rkfutuL_1_11_Info();
                rkfutuL_1_11_InfoList.Add(info);
            }
        }
    }

    public class rkfutuL_1_12_Response : IResponse
    {
        #region 构造函数
        public rkfutuL_1_12_Response()
        {
            this.rkfutuL_1_12_InfoList = new ObservableCollection<rkfutuL_1_12_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rkfutuL_1_12_Info> rkfutuL_1_12_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rkfutuL_1_12_Info info = new rkfutuL_1_12_Info();
            rkfutuL_1_12_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rkfutuL_1_12_InfoList.Add((rkfutuL_1_12_Info)info);
        }
        #endregion

        //逻辑_风控期货_公用_修改风险模板记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rkfutuL_1_12_Info();
                rkfutuL_1_12_InfoList.Add(info);
            }
        }
    }

    public class rkfutuL_1_13_Response : IResponse
    {
        #region 构造函数
        public rkfutuL_1_13_Response()
        {
            this.rkfutuL_1_13_InfoList = new ObservableCollection<rkfutuL_1_13_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rkfutuL_1_13_Info> rkfutuL_1_13_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rkfutuL_1_13_Info info = new rkfutuL_1_13_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.model_name = unpacker.GetStr("model_name");
            info.remark_info = unpacker.GetStr("remark_info");
            rkfutuL_1_13_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rkfutuL_1_13_InfoList.Add((rkfutuL_1_13_Info)info);
        }
        #endregion

        //逻辑_风控期货_公用_查询风险模板记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rkfutuL_1_13_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.model_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MODEL_NAME_STR);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    rkfutuL_1_13_InfoList.Add(info);
                }
            }
        }
    }

    public class rkfutuL_1_14_Response : IResponse
    {
        #region 构造函数
        public rkfutuL_1_14_Response()
        {
            this.rkfutuL_1_14_InfoList = new ObservableCollection<rkfutuL_1_14_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rkfutuL_1_14_Info> rkfutuL_1_14_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rkfutuL_1_14_Info info = new rkfutuL_1_14_Info();
            rkfutuL_1_14_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rkfutuL_1_14_InfoList.Add((rkfutuL_1_14_Info)info);
        }
        #endregion

        //逻辑_风控期货_公用_增加风险模板条目记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rkfutuL_1_14_Info();
                rkfutuL_1_14_InfoList.Add(info);
            }
        }
    }

    public class rkfutuL_1_15_Response : IResponse
    {
        #region 构造函数
        public rkfutuL_1_15_Response()
        {
            this.rkfutuL_1_15_InfoList = new ObservableCollection<rkfutuL_1_15_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rkfutuL_1_15_Info> rkfutuL_1_15_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rkfutuL_1_15_Info info = new rkfutuL_1_15_Info();
            rkfutuL_1_15_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rkfutuL_1_15_InfoList.Add((rkfutuL_1_15_Info)info);
        }
        #endregion

        //逻辑_风控期货_公用_删除风险模板条目记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rkfutuL_1_15_Info();
                rkfutuL_1_15_InfoList.Add(info);
            }
        }
    }

    public class rkfutuL_1_16_Response : IResponse
    {
        #region 构造函数
        public rkfutuL_1_16_Response()
        {
            this.rkfutuL_1_16_InfoList = new ObservableCollection<rkfutuL_1_16_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rkfutuL_1_16_Info> rkfutuL_1_16_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rkfutuL_1_16_Info info = new rkfutuL_1_16_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.model_id = unpacker.GetInt64("model_id");
            info.risk_item_id = unpacker.GetInt("risk_item_id");
            info.risk_rule_type = unpacker.GetInt("risk_rule_type");
            info.risk_item_name = unpacker.GetStr("risk_item_name");
            info.exch_no = unpacker.GetInt("exch_no");
            info.contrc_type = unpacker.GetInt("contrc_type");
            info.order_dir_str = unpacker.GetStr("order_dir_str");
            info.trig_stage_type = unpacker.GetInt("trig_stage_type");
            info.compli_calc_level = unpacker.GetInt("compli_calc_level");
            info.unit_nav_flag = unpacker.GetInt("unit_nav_flag");
            info.trig_type = unpacker.GetInt("trig_type");
            info.risk_rule_value_str = unpacker.GetStr("risk_rule_value_str");
            info.risk_param_str = unpacker.GetStr("risk_param_str");
            info.risk_rule_action = unpacker.GetStr("risk_rule_action");
            info.begin_time = unpacker.GetInt("begin_time");
            info.end_time = unpacker.GetInt("end_time");
            info.rule_flag = unpacker.GetInt("rule_flag");
            rkfutuL_1_16_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rkfutuL_1_16_InfoList.Add((rkfutuL_1_16_Info)info);
        }
        #endregion

        //逻辑_风控期货_公用_查询风险模板条目记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rkfutuL_1_16_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.model_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_MODEL_ID_INT64);
                    info.risk_item_id = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_ITEM_ID_INT);
                    info.risk_rule_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_TYPE_INT);
                    info.risk_item_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_ITEM_NAME_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    info.order_dir_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR);
                    info.trig_stage_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_STAGE_TYPE_INT);
                    info.compli_calc_level = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_CALC_LEVEL_INT);
                    info.unit_nav_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_NAV_FLAG_INT);
                    info.trig_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_TYPE_INT);
                    info.risk_rule_value_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_VALUE_STR_STR);
                    info.risk_param_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_PARAM_STR_STR);
                    info.risk_rule_action = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_ACTION_STR);
                    info.begin_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TIME_INT);
                    info.end_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_TIME_INT);
                    info.rule_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RULE_FLAG_INT);
                    rkfutuL_1_16_InfoList.Add(info);
                }
            }
        }
    }

    public class rkfutuL_1_17_Response : IResponse
    {
        #region 构造函数
        public rkfutuL_1_17_Response()
        {
            this.rkfutuL_1_17_InfoList = new ObservableCollection<rkfutuL_1_17_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rkfutuL_1_17_Info> rkfutuL_1_17_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rkfutuL_1_17_Info info = new rkfutuL_1_17_Info();
            info.task_strike_status = unpacker.GetStr("task_strike_status");
            rkfutuL_1_17_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rkfutuL_1_17_InfoList.Add((rkfutuL_1_17_Info)info);
        }
        #endregion

        //逻辑_风控期货_公用_期货数据归历史
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rkfutuL_1_17_Info();
                info.task_strike_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STRIKE_STATUS_STR);
                rkfutuL_1_17_InfoList.Add(info);
            }
        }
    }

}
