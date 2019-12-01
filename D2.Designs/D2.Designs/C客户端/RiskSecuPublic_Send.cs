using LD.Client.Commom;
using LD.Client.Commom.Enums;
using LD.Client.Commom.Utility;
using LDsdkDefine;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LD.Client.Contract
{
    //逻辑_风控证券_公用_查询风险规则记录
    public class ReqFuncrksecuL_1_1DTO : ReqBaseDTO
    {
        public ReqFuncrksecuL_1_1DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rksecuL.1.1";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            risk_rule_type = 0;
            risk_calc_type = 0;
            row_count = -1;
        }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 风险规则类别
        /// </summary>
        public int risk_rule_type { get; set; }
 
        /// <summary>
        /// 风控计算类型
        /// </summary>
        public int risk_calc_type { get; set; }
 
        /// <summary>
        /// 指定行数
        /// </summary>
        public int row_count { get; set; }
 
        public override LDsdkDefine.LDPackerAdapter CreatePacker()
        {
            var packer = new LDPackerAdapter();
 
            packer.BeginPack();
            #region CommonDTOFiled
            packer.AddField("opor_co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("opor_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("opor_pwd", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_mac", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_ip_addr", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_info", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_way", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("menu_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("func_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("token", ELDDATATYPE.LD_DATATYPE_STRING);
            #endregion
 
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("risk_rule_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("risk_calc_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("row_count", ELDDATATYPE.LD_DATATYPE_INT);
 
            #region CommonDTOValue
            packer.AddInt(CommonDTO.opor_co_no);
            packer.AddInt(CommonDTO.opor_no);
            packer.AddStr(CommonDTO.opor_pwd);
            packer.AddStr(CommonDTO.oper_mac);
            packer.AddStr(CommonDTO.oper_ip_addr);
            packer.AddStr(CommonDTO.oper_info);
            packer.AddStr(CommonDTO.oper_way);
            packer.AddInt(CommonDTO.menu_no);
            packer.AddStr(CommonDTO.func_code);
            packer.AddStr(CommonDTO.SessionID);
            #endregion
 
            packer.AddInt(co_no);
            packer.AddInt(risk_rule_type);
            packer.AddInt(risk_calc_type);
            packer.AddInt(row_count);
            packer.EndPack();
 
            return packer;
        }
        public override LDsdkDefineEx.LDFastMessageAdapter CreateFastMessage()
        {
            var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(CommonDTO.func_code, 0);

            #region CommonDTOFiled 默认参数，固定格式
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT, CommonDTO.opor_co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT,  CommonDTO.opor_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_PWD_STR, CommonDTO.opor_pwd);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR, CommonDTO.oper_mac);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR, CommonDTO.oper_ip_addr);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR, CommonDTO.oper_info);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR, CommonDTO.oper_way);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MENU_NO_INT, CommonDTO.menu_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUNC_CODE_STR, CommonDTO.func_code);
            #endregion

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_TYPE_INT,risk_rule_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_CALC_TYPE_INT,risk_calc_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
 
            return fastMsg;
        }
    }

    //逻辑_风控证券_公用_增加风险条目记录
    public class ReqFuncrksecuL_1_2DTO : ReqBaseDTO
    {
        public ReqFuncrksecuL_1_2DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rksecuL.1.2";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            exch_no_str = " ";
            order_dir_str = " ";
            dime_id = 0;
            risk_item_tmplat_id = 0;
            trig_stage_type_str = " ";
            compli_calc_level = 0;
            unit_nav_flag = 0;
            trig_type = 0;
            compli_rules_remark = " ";
            risk_rule_id = 0;
            risk_rule_type = 0;
            risk_rule_name = " ";
            risk_rule_code = " ";
            risk_param_str = " ";
            risk_rule_value_str1 = " ";
            risk_rule_action1 = " ";
            risk_rule_value_str2 = " ";
            risk_rule_action2 = " ";
            risk_rule_value_str3 = " ";
            risk_rule_action3 = " ";
            risk_rule_value_str4 = " ";
            risk_rule_action4 = " ";
            corrsp_plug = " ";
            begin_time = 0;
            end_time = 0;
            rule_flag = 0;
        }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 市场编号串
        /// </summary>
        public String exch_no_str { get; set; }
 
        /// <summary>
        /// 订单方向串
        /// </summary>
        public String order_dir_str { get; set; }
 
        /// <summary>
        /// 维度序号
        /// </summary>
        public ulong dime_id { get; set; }
 
        /// <summary>
        /// 条目模板序号
        /// </summary>
        public ulong risk_item_tmplat_id { get; set; }
 
        /// <summary>
        /// 触发阶段类型串
        /// </summary>
        public String trig_stage_type_str { get; set; }
 
        /// <summary>
        /// 合规计算层级
        /// </summary>
        public int compli_calc_level { get; set; }
 
        /// <summary>
        /// 单位净值标志
        /// </summary>
        public int unit_nav_flag { get; set; }
 
        /// <summary>
        /// 触发方向
        /// </summary>
        public int trig_type { get; set; }
 
        /// <summary>
        /// 合规规则说明
        /// </summary>
        public String compli_rules_remark { get; set; }
 
        /// <summary>
        /// 风险规则序号
        /// </summary>
        public int risk_rule_id { get; set; }
 
        /// <summary>
        /// 风险规则类别
        /// </summary>
        public int risk_rule_type { get; set; }
 
        /// <summary>
        /// 风险规则名称
        /// </summary>
        public String risk_rule_name { get; set; }
 
        /// <summary>
        /// 风险规则代码
        /// </summary>
        public String risk_rule_code { get; set; }
 
        /// <summary>
        /// 风险要素串
        /// </summary>
        public String risk_param_str { get; set; }
 
        /// <summary>
        /// 风险规则值串1
        /// </summary>
        public String risk_rule_value_str1 { get; set; }
 
        /// <summary>
        /// 风险采取行为1
        /// </summary>
        public String risk_rule_action1 { get; set; }
 
        /// <summary>
        /// 风险规则值串2
        /// </summary>
        public String risk_rule_value_str2 { get; set; }
 
        /// <summary>
        /// 风险采取行为2
        /// </summary>
        public String risk_rule_action2 { get; set; }
 
        /// <summary>
        /// 风险规则值串3
        /// </summary>
        public String risk_rule_value_str3 { get; set; }
 
        /// <summary>
        /// 风险采取行为3
        /// </summary>
        public String risk_rule_action3 { get; set; }
 
        /// <summary>
        /// 风险规则值串4
        /// </summary>
        public String risk_rule_value_str4 { get; set; }
 
        /// <summary>
        /// 风险采取行为4
        /// </summary>
        public String risk_rule_action4 { get; set; }
 
        /// <summary>
        /// 对应插件
        /// </summary>
        public String corrsp_plug { get; set; }
 
        /// <summary>
        /// 开始时间
        /// </summary>
        public int begin_time { get; set; }
 
        /// <summary>
        /// 结束时间
        /// </summary>
        public int end_time { get; set; }
 
        /// <summary>
        /// 启用标志
        /// </summary>
        public int rule_flag { get; set; }
 
        public override LDsdkDefine.LDPackerAdapter CreatePacker()
        {
            var packer = new LDPackerAdapter();
 
            packer.BeginPack();
            #region CommonDTOFiled
            packer.AddField("opor_co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("opor_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("opor_pwd", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_mac", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_ip_addr", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_info", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_way", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("menu_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("func_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("token", ELDDATATYPE.LD_DATATYPE_STRING);
            #endregion
 
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_no_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("order_dir_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("dime_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("risk_item_tmplat_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("trig_stage_type_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("compli_calc_level", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("unit_nav_flag", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("trig_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("compli_rules_remark", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("risk_rule_id", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("risk_rule_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("risk_rule_name", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("risk_rule_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("risk_param_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("risk_rule_value_str1", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("risk_rule_action1", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("risk_rule_value_str2", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("risk_rule_action2", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("risk_rule_value_str3", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("risk_rule_action3", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("risk_rule_value_str4", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("risk_rule_action4", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("corrsp_plug", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("begin_time", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("end_time", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("rule_flag", ELDDATATYPE.LD_DATATYPE_INT);
 
            #region CommonDTOValue
            packer.AddInt(CommonDTO.opor_co_no);
            packer.AddInt(CommonDTO.opor_no);
            packer.AddStr(CommonDTO.opor_pwd);
            packer.AddStr(CommonDTO.oper_mac);
            packer.AddStr(CommonDTO.oper_ip_addr);
            packer.AddStr(CommonDTO.oper_info);
            packer.AddStr(CommonDTO.oper_way);
            packer.AddInt(CommonDTO.menu_no);
            packer.AddStr(CommonDTO.func_code);
            packer.AddStr(CommonDTO.SessionID);
            #endregion
 
            packer.AddInt(co_no);
            packer.AddStr(exch_no_str);
            packer.AddStr(order_dir_str);
            packer.AddInt64(dime_id);
            packer.AddInt64(risk_item_tmplat_id);
            packer.AddStr(trig_stage_type_str);
            packer.AddInt(compli_calc_level);
            packer.AddInt(unit_nav_flag);
            packer.AddInt(trig_type);
            packer.AddStr(compli_rules_remark);
            packer.AddInt(risk_rule_id);
            packer.AddInt(risk_rule_type);
            packer.AddStr(risk_rule_name);
            packer.AddStr(risk_rule_code);
            packer.AddStr(risk_param_str);
            packer.AddStr(risk_rule_value_str1);
            packer.AddStr(risk_rule_action1);
            packer.AddStr(risk_rule_value_str2);
            packer.AddStr(risk_rule_action2);
            packer.AddStr(risk_rule_value_str3);
            packer.AddStr(risk_rule_action3);
            packer.AddStr(risk_rule_value_str4);
            packer.AddStr(risk_rule_action4);
            packer.AddStr(corrsp_plug);
            packer.AddInt(begin_time);
            packer.AddInt(end_time);
            packer.AddInt(rule_flag);
            packer.EndPack();
 
            return packer;
        }
        public override LDsdkDefineEx.LDFastMessageAdapter CreateFastMessage()
        {
            var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(CommonDTO.func_code, 0);

            #region CommonDTOFiled 默认参数，固定格式
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT, CommonDTO.opor_co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT,  CommonDTO.opor_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_PWD_STR, CommonDTO.opor_pwd);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR, CommonDTO.oper_mac);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR, CommonDTO.oper_ip_addr);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR, CommonDTO.oper_info);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR, CommonDTO.oper_way);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MENU_NO_INT, CommonDTO.menu_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUNC_CODE_STR, CommonDTO.func_code);
            #endregion

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR,order_dir_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_DIME_ID_INT64,dime_id);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_RISK_ITEM_TMPLAT_ID_INT64,risk_item_tmplat_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_STAGE_TYPE_STR_STR,trig_stage_type_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_CALC_LEVEL_INT,compli_calc_level);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_NAV_FLAG_INT,unit_nav_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_TYPE_INT,trig_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_RULES_REMARK_STR,compli_rules_remark);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_ID_INT,risk_rule_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_TYPE_INT,risk_rule_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_NAME_STR,risk_rule_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_CODE_STR,risk_rule_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_PARAM_STR_STR,risk_param_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_VALUE_STR1_STR,risk_rule_value_str1);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_ACTION1_STR,risk_rule_action1);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_VALUE_STR2_STR,risk_rule_value_str2);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_ACTION2_STR,risk_rule_action2);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_VALUE_STR3_STR,risk_rule_value_str3);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_ACTION3_STR,risk_rule_action3);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_VALUE_STR4_STR,risk_rule_value_str4);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_ACTION4_STR,risk_rule_action4);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CORRSP_PLUG_STR,corrsp_plug);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TIME_INT,begin_time);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_TIME_INT,end_time);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RULE_FLAG_INT,rule_flag);
 
            return fastMsg;
        }
    }

    //逻辑_风控证券_公用_修改风险条目记录
    public class ReqFuncrksecuL_1_3DTO : ReqBaseDTO
    {
        public ReqFuncrksecuL_1_3DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rksecuL.1.3";
            CommonDTO.func_code = CommonDTO.function_code;
            row_id = 0;
            co_no = 0;
            exch_no_str = " ";
            order_dir_str = " ";
            dime_id = 0;
            risk_item_tmplat_id = 0;
            trig_stage_type_str = " ";
            compli_calc_level = 0;
            unit_nav_flag = 0;
            trig_type = 0;
            compli_rules_remark = " ";
            risk_rule_id = 0;
            risk_rule_type = 0;
            risk_rule_name = " ";
            risk_rule_code = " ";
            risk_param_str = " ";
            risk_rule_value_str1 = " ";
            risk_rule_action1 = " ";
            risk_rule_value_str2 = " ";
            risk_rule_action2 = " ";
            risk_rule_value_str3 = " ";
            risk_rule_action3 = " ";
            risk_rule_value_str4 = " ";
            risk_rule_action4 = " ";
            corrsp_plug = " ";
            begin_time = 0;
            end_time = 0;
            rule_flag = 0;
        }
 
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 市场编号串
        /// </summary>
        public String exch_no_str { get; set; }
 
        /// <summary>
        /// 订单方向串
        /// </summary>
        public String order_dir_str { get; set; }
 
        /// <summary>
        /// 维度序号
        /// </summary>
        public ulong dime_id { get; set; }
 
        /// <summary>
        /// 条目模板序号
        /// </summary>
        public ulong risk_item_tmplat_id { get; set; }
 
        /// <summary>
        /// 触发阶段类型串
        /// </summary>
        public String trig_stage_type_str { get; set; }
 
        /// <summary>
        /// 合规计算层级
        /// </summary>
        public int compli_calc_level { get; set; }
 
        /// <summary>
        /// 单位净值标志
        /// </summary>
        public int unit_nav_flag { get; set; }
 
        /// <summary>
        /// 触发方向
        /// </summary>
        public int trig_type { get; set; }
 
        /// <summary>
        /// 合规规则说明
        /// </summary>
        public String compli_rules_remark { get; set; }
 
        /// <summary>
        /// 风险规则序号
        /// </summary>
        public int risk_rule_id { get; set; }
 
        /// <summary>
        /// 风险规则类别
        /// </summary>
        public int risk_rule_type { get; set; }
 
        /// <summary>
        /// 风险规则名称
        /// </summary>
        public String risk_rule_name { get; set; }
 
        /// <summary>
        /// 风险规则代码
        /// </summary>
        public String risk_rule_code { get; set; }
 
        /// <summary>
        /// 风险要素串
        /// </summary>
        public String risk_param_str { get; set; }
 
        /// <summary>
        /// 风险规则值串1
        /// </summary>
        public String risk_rule_value_str1 { get; set; }
 
        /// <summary>
        /// 风险采取行为1
        /// </summary>
        public String risk_rule_action1 { get; set; }
 
        /// <summary>
        /// 风险规则值串2
        /// </summary>
        public String risk_rule_value_str2 { get; set; }
 
        /// <summary>
        /// 风险采取行为2
        /// </summary>
        public String risk_rule_action2 { get; set; }
 
        /// <summary>
        /// 风险规则值串3
        /// </summary>
        public String risk_rule_value_str3 { get; set; }
 
        /// <summary>
        /// 风险采取行为3
        /// </summary>
        public String risk_rule_action3 { get; set; }
 
        /// <summary>
        /// 风险规则值串4
        /// </summary>
        public String risk_rule_value_str4 { get; set; }
 
        /// <summary>
        /// 风险采取行为4
        /// </summary>
        public String risk_rule_action4 { get; set; }
 
        /// <summary>
        /// 对应插件
        /// </summary>
        public String corrsp_plug { get; set; }
 
        /// <summary>
        /// 开始时间
        /// </summary>
        public int begin_time { get; set; }
 
        /// <summary>
        /// 结束时间
        /// </summary>
        public int end_time { get; set; }
 
        /// <summary>
        /// 启用标志
        /// </summary>
        public int rule_flag { get; set; }
 
        public override LDsdkDefine.LDPackerAdapter CreatePacker()
        {
            var packer = new LDPackerAdapter();
 
            packer.BeginPack();
            #region CommonDTOFiled
            packer.AddField("opor_co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("opor_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("opor_pwd", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_mac", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_ip_addr", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_info", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_way", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("menu_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("func_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("token", ELDDATATYPE.LD_DATATYPE_STRING);
            #endregion
 
            packer.AddField("row_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_no_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("order_dir_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("dime_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("risk_item_tmplat_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("trig_stage_type_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("compli_calc_level", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("unit_nav_flag", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("trig_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("compli_rules_remark", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("risk_rule_id", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("risk_rule_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("risk_rule_name", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("risk_rule_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("risk_param_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("risk_rule_value_str1", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("risk_rule_action1", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("risk_rule_value_str2", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("risk_rule_action2", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("risk_rule_value_str3", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("risk_rule_action3", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("risk_rule_value_str4", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("risk_rule_action4", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("corrsp_plug", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("begin_time", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("end_time", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("rule_flag", ELDDATATYPE.LD_DATATYPE_INT);
 
            #region CommonDTOValue
            packer.AddInt(CommonDTO.opor_co_no);
            packer.AddInt(CommonDTO.opor_no);
            packer.AddStr(CommonDTO.opor_pwd);
            packer.AddStr(CommonDTO.oper_mac);
            packer.AddStr(CommonDTO.oper_ip_addr);
            packer.AddStr(CommonDTO.oper_info);
            packer.AddStr(CommonDTO.oper_way);
            packer.AddInt(CommonDTO.menu_no);
            packer.AddStr(CommonDTO.func_code);
            packer.AddStr(CommonDTO.SessionID);
            #endregion
 
            packer.AddInt64(row_id);
            packer.AddInt(co_no);
            packer.AddStr(exch_no_str);
            packer.AddStr(order_dir_str);
            packer.AddInt64(dime_id);
            packer.AddInt64(risk_item_tmplat_id);
            packer.AddStr(trig_stage_type_str);
            packer.AddInt(compli_calc_level);
            packer.AddInt(unit_nav_flag);
            packer.AddInt(trig_type);
            packer.AddStr(compli_rules_remark);
            packer.AddInt(risk_rule_id);
            packer.AddInt(risk_rule_type);
            packer.AddStr(risk_rule_name);
            packer.AddStr(risk_rule_code);
            packer.AddStr(risk_param_str);
            packer.AddStr(risk_rule_value_str1);
            packer.AddStr(risk_rule_action1);
            packer.AddStr(risk_rule_value_str2);
            packer.AddStr(risk_rule_action2);
            packer.AddStr(risk_rule_value_str3);
            packer.AddStr(risk_rule_action3);
            packer.AddStr(risk_rule_value_str4);
            packer.AddStr(risk_rule_action4);
            packer.AddStr(corrsp_plug);
            packer.AddInt(begin_time);
            packer.AddInt(end_time);
            packer.AddInt(rule_flag);
            packer.EndPack();
 
            return packer;
        }
        public override LDsdkDefineEx.LDFastMessageAdapter CreateFastMessage()
        {
            var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(CommonDTO.func_code, 0);

            #region CommonDTOFiled 默认参数，固定格式
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT, CommonDTO.opor_co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT,  CommonDTO.opor_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_PWD_STR, CommonDTO.opor_pwd);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR, CommonDTO.oper_mac);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR, CommonDTO.oper_ip_addr);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR, CommonDTO.oper_info);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR, CommonDTO.oper_way);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MENU_NO_INT, CommonDTO.menu_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUNC_CODE_STR, CommonDTO.func_code);
            #endregion

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR,order_dir_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_DIME_ID_INT64,dime_id);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_RISK_ITEM_TMPLAT_ID_INT64,risk_item_tmplat_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_STAGE_TYPE_STR_STR,trig_stage_type_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_CALC_LEVEL_INT,compli_calc_level);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_NAV_FLAG_INT,unit_nav_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_TYPE_INT,trig_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_RULES_REMARK_STR,compli_rules_remark);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_ID_INT,risk_rule_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_TYPE_INT,risk_rule_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_NAME_STR,risk_rule_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_CODE_STR,risk_rule_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_PARAM_STR_STR,risk_param_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_VALUE_STR1_STR,risk_rule_value_str1);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_ACTION1_STR,risk_rule_action1);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_VALUE_STR2_STR,risk_rule_value_str2);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_ACTION2_STR,risk_rule_action2);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_VALUE_STR3_STR,risk_rule_value_str3);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_ACTION3_STR,risk_rule_action3);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_VALUE_STR4_STR,risk_rule_value_str4);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_ACTION4_STR,risk_rule_action4);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CORRSP_PLUG_STR,corrsp_plug);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TIME_INT,begin_time);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_TIME_INT,end_time);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RULE_FLAG_INT,rule_flag);
 
            return fastMsg;
        }
    }

    //逻辑_风控证券_公用_删除风险条目记录
    public class ReqFuncrksecuL_1_4DTO : ReqBaseDTO
    {
        public ReqFuncrksecuL_1_4DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rksecuL.1.4";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            risk_item_id_str = " ";
            compli_rules_remark = " ";
        }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 风险条目序号串
        /// </summary>
        public String risk_item_id_str { get; set; }
 
        /// <summary>
        /// 合规规则说明
        /// </summary>
        public String compli_rules_remark { get; set; }
 
        public override LDsdkDefine.LDPackerAdapter CreatePacker()
        {
            var packer = new LDPackerAdapter();
 
            packer.BeginPack();
            #region CommonDTOFiled
            packer.AddField("opor_co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("opor_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("opor_pwd", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_mac", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_ip_addr", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_info", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_way", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("menu_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("func_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("token", ELDDATATYPE.LD_DATATYPE_STRING);
            #endregion
 
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("risk_item_id_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("compli_rules_remark", ELDDATATYPE.LD_DATATYPE_STRING);
 
            #region CommonDTOValue
            packer.AddInt(CommonDTO.opor_co_no);
            packer.AddInt(CommonDTO.opor_no);
            packer.AddStr(CommonDTO.opor_pwd);
            packer.AddStr(CommonDTO.oper_mac);
            packer.AddStr(CommonDTO.oper_ip_addr);
            packer.AddStr(CommonDTO.oper_info);
            packer.AddStr(CommonDTO.oper_way);
            packer.AddInt(CommonDTO.menu_no);
            packer.AddStr(CommonDTO.func_code);
            packer.AddStr(CommonDTO.SessionID);
            #endregion
 
            packer.AddInt(co_no);
            packer.AddStr(risk_item_id_str);
            packer.AddStr(compli_rules_remark);
            packer.EndPack();
 
            return packer;
        }
        public override LDsdkDefineEx.LDFastMessageAdapter CreateFastMessage()
        {
            var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(CommonDTO.func_code, 0);

            #region CommonDTOFiled 默认参数，固定格式
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT, CommonDTO.opor_co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT,  CommonDTO.opor_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_PWD_STR, CommonDTO.opor_pwd);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR, CommonDTO.oper_mac);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR, CommonDTO.oper_ip_addr);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR, CommonDTO.oper_info);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR, CommonDTO.oper_way);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MENU_NO_INT, CommonDTO.menu_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUNC_CODE_STR, CommonDTO.func_code);
            #endregion

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_ITEM_ID_STR_STR,risk_item_id_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_RULES_REMARK_STR,compli_rules_remark);
 
            return fastMsg;
        }
    }

    //逻辑_风控证券_公用_查询风险条目记录
    public class ReqFuncrksecuL_1_5DTO : ReqBaseDTO
    {
        public ReqFuncrksecuL_1_5DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rksecuL.1.5";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            risk_item_id_str = " ";
            compli_rules_remark = " ";
            risk_rule_id = 0;
            risk_rule_type = 0;
            risk_rule_name = " ";
            corrsp_plug = " ";
            risk_item_tmplat_id = 0;
            row_count = -1;
        }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 风险条目序号串
        /// </summary>
        public String risk_item_id_str { get; set; }
 
        /// <summary>
        /// 合规规则说明
        /// </summary>
        public String compli_rules_remark { get; set; }
 
        /// <summary>
        /// 风险规则序号
        /// </summary>
        public int risk_rule_id { get; set; }
 
        /// <summary>
        /// 风险规则类别
        /// </summary>
        public int risk_rule_type { get; set; }
 
        /// <summary>
        /// 风险规则名称
        /// </summary>
        public String risk_rule_name { get; set; }
 
        /// <summary>
        /// 对应插件
        /// </summary>
        public String corrsp_plug { get; set; }
 
        /// <summary>
        /// 条目模板序号
        /// </summary>
        public ulong risk_item_tmplat_id { get; set; }
 
        /// <summary>
        /// 指定行数
        /// </summary>
        public int row_count { get; set; }
 
        public override LDsdkDefine.LDPackerAdapter CreatePacker()
        {
            var packer = new LDPackerAdapter();
 
            packer.BeginPack();
            #region CommonDTOFiled
            packer.AddField("opor_co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("opor_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("opor_pwd", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_mac", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_ip_addr", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_info", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_way", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("menu_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("func_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("token", ELDDATATYPE.LD_DATATYPE_STRING);
            #endregion
 
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("risk_item_id_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("compli_rules_remark", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("risk_rule_id", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("risk_rule_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("risk_rule_name", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("corrsp_plug", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("risk_item_tmplat_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("row_count", ELDDATATYPE.LD_DATATYPE_INT);
 
            #region CommonDTOValue
            packer.AddInt(CommonDTO.opor_co_no);
            packer.AddInt(CommonDTO.opor_no);
            packer.AddStr(CommonDTO.opor_pwd);
            packer.AddStr(CommonDTO.oper_mac);
            packer.AddStr(CommonDTO.oper_ip_addr);
            packer.AddStr(CommonDTO.oper_info);
            packer.AddStr(CommonDTO.oper_way);
            packer.AddInt(CommonDTO.menu_no);
            packer.AddStr(CommonDTO.func_code);
            packer.AddStr(CommonDTO.SessionID);
            #endregion
 
            packer.AddInt(co_no);
            packer.AddStr(risk_item_id_str);
            packer.AddStr(compli_rules_remark);
            packer.AddInt(risk_rule_id);
            packer.AddInt(risk_rule_type);
            packer.AddStr(risk_rule_name);
            packer.AddStr(corrsp_plug);
            packer.AddInt64(risk_item_tmplat_id);
            packer.AddInt(row_count);
            packer.EndPack();
 
            return packer;
        }
        public override LDsdkDefineEx.LDFastMessageAdapter CreateFastMessage()
        {
            var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(CommonDTO.func_code, 0);

            #region CommonDTOFiled 默认参数，固定格式
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT, CommonDTO.opor_co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT,  CommonDTO.opor_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_PWD_STR, CommonDTO.opor_pwd);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR, CommonDTO.oper_mac);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR, CommonDTO.oper_ip_addr);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR, CommonDTO.oper_info);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR, CommonDTO.oper_way);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MENU_NO_INT, CommonDTO.menu_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUNC_CODE_STR, CommonDTO.func_code);
            #endregion

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_ITEM_ID_STR_STR,risk_item_id_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_RULES_REMARK_STR,compli_rules_remark);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_ID_INT,risk_rule_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_TYPE_INT,risk_rule_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_NAME_STR,risk_rule_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CORRSP_PLUG_STR,corrsp_plug);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_RISK_ITEM_TMPLAT_ID_INT64,risk_item_tmplat_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
 
            return fastMsg;
        }
    }

    //逻辑_风控证券_公用_增加风险模板记录
    public class ReqFuncrksecuL_1_6DTO : ReqBaseDTO
    {
        public ReqFuncrksecuL_1_6DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rksecuL.1.6";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            model_name = " ";
            remark_info = " ";
        }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 模板名称
        /// </summary>
        public String model_name { get; set; }
 
        /// <summary>
        /// 备注信息
        /// </summary>
        public String remark_info { get; set; }
 
        public override LDsdkDefine.LDPackerAdapter CreatePacker()
        {
            var packer = new LDPackerAdapter();
 
            packer.BeginPack();
            #region CommonDTOFiled
            packer.AddField("opor_co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("opor_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("opor_pwd", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_mac", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_ip_addr", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_info", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_way", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("menu_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("func_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("token", ELDDATATYPE.LD_DATATYPE_STRING);
            #endregion
 
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("model_name", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("remark_info", ELDDATATYPE.LD_DATATYPE_STRING);
 
            #region CommonDTOValue
            packer.AddInt(CommonDTO.opor_co_no);
            packer.AddInt(CommonDTO.opor_no);
            packer.AddStr(CommonDTO.opor_pwd);
            packer.AddStr(CommonDTO.oper_mac);
            packer.AddStr(CommonDTO.oper_ip_addr);
            packer.AddStr(CommonDTO.oper_info);
            packer.AddStr(CommonDTO.oper_way);
            packer.AddInt(CommonDTO.menu_no);
            packer.AddStr(CommonDTO.func_code);
            packer.AddStr(CommonDTO.SessionID);
            #endregion
 
            packer.AddInt(co_no);
            packer.AddStr(model_name);
            packer.AddStr(remark_info);
            packer.EndPack();
 
            return packer;
        }
        public override LDsdkDefineEx.LDFastMessageAdapter CreateFastMessage()
        {
            var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(CommonDTO.func_code, 0);

            #region CommonDTOFiled 默认参数，固定格式
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT, CommonDTO.opor_co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT,  CommonDTO.opor_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_PWD_STR, CommonDTO.opor_pwd);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR, CommonDTO.oper_mac);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR, CommonDTO.oper_ip_addr);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR, CommonDTO.oper_info);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR, CommonDTO.oper_way);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MENU_NO_INT, CommonDTO.menu_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUNC_CODE_STR, CommonDTO.func_code);
            #endregion

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MODEL_NAME_STR,model_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
 
            return fastMsg;
        }
    }

    //逻辑_风控证券_公用_删除风险模板记录
    public class ReqFuncrksecuL_1_7DTO : ReqBaseDTO
    {
        public ReqFuncrksecuL_1_7DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rksecuL.1.7";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            model_id = 0;
        }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 模板序号
        /// </summary>
        public ulong model_id { get; set; }
 
        public override LDsdkDefine.LDPackerAdapter CreatePacker()
        {
            var packer = new LDPackerAdapter();
 
            packer.BeginPack();
            #region CommonDTOFiled
            packer.AddField("opor_co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("opor_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("opor_pwd", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_mac", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_ip_addr", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_info", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_way", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("menu_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("func_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("token", ELDDATATYPE.LD_DATATYPE_STRING);
            #endregion
 
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("model_id", ELDDATATYPE.LD_DATATYPE_LONG);
 
            #region CommonDTOValue
            packer.AddInt(CommonDTO.opor_co_no);
            packer.AddInt(CommonDTO.opor_no);
            packer.AddStr(CommonDTO.opor_pwd);
            packer.AddStr(CommonDTO.oper_mac);
            packer.AddStr(CommonDTO.oper_ip_addr);
            packer.AddStr(CommonDTO.oper_info);
            packer.AddStr(CommonDTO.oper_way);
            packer.AddInt(CommonDTO.menu_no);
            packer.AddStr(CommonDTO.func_code);
            packer.AddStr(CommonDTO.SessionID);
            #endregion
 
            packer.AddInt(co_no);
            packer.AddInt64(model_id);
            packer.EndPack();
 
            return packer;
        }
        public override LDsdkDefineEx.LDFastMessageAdapter CreateFastMessage()
        {
            var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(CommonDTO.func_code, 0);

            #region CommonDTOFiled 默认参数，固定格式
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT, CommonDTO.opor_co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT,  CommonDTO.opor_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_PWD_STR, CommonDTO.opor_pwd);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR, CommonDTO.oper_mac);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR, CommonDTO.oper_ip_addr);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR, CommonDTO.oper_info);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR, CommonDTO.oper_way);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MENU_NO_INT, CommonDTO.menu_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUNC_CODE_STR, CommonDTO.func_code);
            #endregion

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_MODEL_ID_INT64,model_id);
 
            return fastMsg;
        }
    }

    //逻辑_风控证券_公用_修改风险模板记录
    public class ReqFuncrksecuL_1_8DTO : ReqBaseDTO
    {
        public ReqFuncrksecuL_1_8DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rksecuL.1.8";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            model_id = 0;
            model_name = " ";
            remark_info = " ";
        }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 模板序号
        /// </summary>
        public ulong model_id { get; set; }
 
        /// <summary>
        /// 模板名称
        /// </summary>
        public String model_name { get; set; }
 
        /// <summary>
        /// 备注信息
        /// </summary>
        public String remark_info { get; set; }
 
        public override LDsdkDefine.LDPackerAdapter CreatePacker()
        {
            var packer = new LDPackerAdapter();
 
            packer.BeginPack();
            #region CommonDTOFiled
            packer.AddField("opor_co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("opor_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("opor_pwd", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_mac", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_ip_addr", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_info", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_way", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("menu_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("func_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("token", ELDDATATYPE.LD_DATATYPE_STRING);
            #endregion
 
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("model_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("model_name", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("remark_info", ELDDATATYPE.LD_DATATYPE_STRING);
 
            #region CommonDTOValue
            packer.AddInt(CommonDTO.opor_co_no);
            packer.AddInt(CommonDTO.opor_no);
            packer.AddStr(CommonDTO.opor_pwd);
            packer.AddStr(CommonDTO.oper_mac);
            packer.AddStr(CommonDTO.oper_ip_addr);
            packer.AddStr(CommonDTO.oper_info);
            packer.AddStr(CommonDTO.oper_way);
            packer.AddInt(CommonDTO.menu_no);
            packer.AddStr(CommonDTO.func_code);
            packer.AddStr(CommonDTO.SessionID);
            #endregion
 
            packer.AddInt(co_no);
            packer.AddInt64(model_id);
            packer.AddStr(model_name);
            packer.AddStr(remark_info);
            packer.EndPack();
 
            return packer;
        }
        public override LDsdkDefineEx.LDFastMessageAdapter CreateFastMessage()
        {
            var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(CommonDTO.func_code, 0);

            #region CommonDTOFiled 默认参数，固定格式
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT, CommonDTO.opor_co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT,  CommonDTO.opor_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_PWD_STR, CommonDTO.opor_pwd);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR, CommonDTO.oper_mac);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR, CommonDTO.oper_ip_addr);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR, CommonDTO.oper_info);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR, CommonDTO.oper_way);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MENU_NO_INT, CommonDTO.menu_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUNC_CODE_STR, CommonDTO.func_code);
            #endregion

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_MODEL_ID_INT64,model_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MODEL_NAME_STR,model_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
 
            return fastMsg;
        }
    }

    //逻辑_风控证券_公用_查询风险模板记录
    public class ReqFuncrksecuL_1_9DTO : ReqBaseDTO
    {
        public ReqFuncrksecuL_1_9DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rksecuL.1.9";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            model_id = 0;
            row_count = -1;
        }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 模板序号
        /// </summary>
        public ulong model_id { get; set; }
 
        /// <summary>
        /// 指定行数
        /// </summary>
        public int row_count { get; set; }
 
        public override LDsdkDefine.LDPackerAdapter CreatePacker()
        {
            var packer = new LDPackerAdapter();
 
            packer.BeginPack();
            #region CommonDTOFiled
            packer.AddField("opor_co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("opor_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("opor_pwd", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_mac", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_ip_addr", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_info", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_way", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("menu_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("func_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("token", ELDDATATYPE.LD_DATATYPE_STRING);
            #endregion
 
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("model_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("row_count", ELDDATATYPE.LD_DATATYPE_INT);
 
            #region CommonDTOValue
            packer.AddInt(CommonDTO.opor_co_no);
            packer.AddInt(CommonDTO.opor_no);
            packer.AddStr(CommonDTO.opor_pwd);
            packer.AddStr(CommonDTO.oper_mac);
            packer.AddStr(CommonDTO.oper_ip_addr);
            packer.AddStr(CommonDTO.oper_info);
            packer.AddStr(CommonDTO.oper_way);
            packer.AddInt(CommonDTO.menu_no);
            packer.AddStr(CommonDTO.func_code);
            packer.AddStr(CommonDTO.SessionID);
            #endregion
 
            packer.AddInt(co_no);
            packer.AddInt64(model_id);
            packer.AddInt(row_count);
            packer.EndPack();
 
            return packer;
        }
        public override LDsdkDefineEx.LDFastMessageAdapter CreateFastMessage()
        {
            var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(CommonDTO.func_code, 0);

            #region CommonDTOFiled 默认参数，固定格式
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT, CommonDTO.opor_co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT,  CommonDTO.opor_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_PWD_STR, CommonDTO.opor_pwd);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR, CommonDTO.oper_mac);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR, CommonDTO.oper_ip_addr);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR, CommonDTO.oper_info);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR, CommonDTO.oper_way);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MENU_NO_INT, CommonDTO.menu_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUNC_CODE_STR, CommonDTO.func_code);
            #endregion

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_MODEL_ID_INT64,model_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
 
            return fastMsg;
        }
    }

    //逻辑_风控证券_公用_增加风险模板条目记录
    public class ReqFuncrksecuL_1_10DTO : ReqBaseDTO
    {
        public ReqFuncrksecuL_1_10DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rksecuL.1.10";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            model_id = 0;
            risk_item_id_str = " ";
        }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 模板序号
        /// </summary>
        public ulong model_id { get; set; }
 
        /// <summary>
        /// 风险条目序号串
        /// </summary>
        public String risk_item_id_str { get; set; }
 
        public override LDsdkDefine.LDPackerAdapter CreatePacker()
        {
            var packer = new LDPackerAdapter();
 
            packer.BeginPack();
            #region CommonDTOFiled
            packer.AddField("opor_co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("opor_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("opor_pwd", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_mac", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_ip_addr", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_info", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_way", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("menu_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("func_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("token", ELDDATATYPE.LD_DATATYPE_STRING);
            #endregion
 
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("model_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("risk_item_id_str", ELDDATATYPE.LD_DATATYPE_STRING);
 
            #region CommonDTOValue
            packer.AddInt(CommonDTO.opor_co_no);
            packer.AddInt(CommonDTO.opor_no);
            packer.AddStr(CommonDTO.opor_pwd);
            packer.AddStr(CommonDTO.oper_mac);
            packer.AddStr(CommonDTO.oper_ip_addr);
            packer.AddStr(CommonDTO.oper_info);
            packer.AddStr(CommonDTO.oper_way);
            packer.AddInt(CommonDTO.menu_no);
            packer.AddStr(CommonDTO.func_code);
            packer.AddStr(CommonDTO.SessionID);
            #endregion
 
            packer.AddInt(co_no);
            packer.AddInt64(model_id);
            packer.AddStr(risk_item_id_str);
            packer.EndPack();
 
            return packer;
        }
        public override LDsdkDefineEx.LDFastMessageAdapter CreateFastMessage()
        {
            var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(CommonDTO.func_code, 0);

            #region CommonDTOFiled 默认参数，固定格式
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT, CommonDTO.opor_co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT,  CommonDTO.opor_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_PWD_STR, CommonDTO.opor_pwd);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR, CommonDTO.oper_mac);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR, CommonDTO.oper_ip_addr);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR, CommonDTO.oper_info);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR, CommonDTO.oper_way);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MENU_NO_INT, CommonDTO.menu_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUNC_CODE_STR, CommonDTO.func_code);
            #endregion

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_MODEL_ID_INT64,model_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_ITEM_ID_STR_STR,risk_item_id_str);
 
            return fastMsg;
        }
    }

    //逻辑_风控证券_公用_删除风险模板条目记录
    public class ReqFuncrksecuL_1_11DTO : ReqBaseDTO
    {
        public ReqFuncrksecuL_1_11DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rksecuL.1.11";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            model_id = 0;
            risk_item_id_str = " ";
        }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 模板序号
        /// </summary>
        public ulong model_id { get; set; }
 
        /// <summary>
        /// 风险条目序号串
        /// </summary>
        public String risk_item_id_str { get; set; }
 
        public override LDsdkDefine.LDPackerAdapter CreatePacker()
        {
            var packer = new LDPackerAdapter();
 
            packer.BeginPack();
            #region CommonDTOFiled
            packer.AddField("opor_co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("opor_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("opor_pwd", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_mac", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_ip_addr", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_info", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_way", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("menu_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("func_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("token", ELDDATATYPE.LD_DATATYPE_STRING);
            #endregion
 
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("model_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("risk_item_id_str", ELDDATATYPE.LD_DATATYPE_STRING);
 
            #region CommonDTOValue
            packer.AddInt(CommonDTO.opor_co_no);
            packer.AddInt(CommonDTO.opor_no);
            packer.AddStr(CommonDTO.opor_pwd);
            packer.AddStr(CommonDTO.oper_mac);
            packer.AddStr(CommonDTO.oper_ip_addr);
            packer.AddStr(CommonDTO.oper_info);
            packer.AddStr(CommonDTO.oper_way);
            packer.AddInt(CommonDTO.menu_no);
            packer.AddStr(CommonDTO.func_code);
            packer.AddStr(CommonDTO.SessionID);
            #endregion
 
            packer.AddInt(co_no);
            packer.AddInt64(model_id);
            packer.AddStr(risk_item_id_str);
            packer.EndPack();
 
            return packer;
        }
        public override LDsdkDefineEx.LDFastMessageAdapter CreateFastMessage()
        {
            var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(CommonDTO.func_code, 0);

            #region CommonDTOFiled 默认参数，固定格式
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT, CommonDTO.opor_co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT,  CommonDTO.opor_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_PWD_STR, CommonDTO.opor_pwd);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR, CommonDTO.oper_mac);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR, CommonDTO.oper_ip_addr);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR, CommonDTO.oper_info);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR, CommonDTO.oper_way);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MENU_NO_INT, CommonDTO.menu_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUNC_CODE_STR, CommonDTO.func_code);
            #endregion

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_MODEL_ID_INT64,model_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_ITEM_ID_STR_STR,risk_item_id_str);
 
            return fastMsg;
        }
    }

    //逻辑_风控证券_公用_查询风险模板条目记录
    public class ReqFuncrksecuL_1_12DTO : ReqBaseDTO
    {
        public ReqFuncrksecuL_1_12DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rksecuL.1.12";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            model_id = 0;
            risk_item_id_str = " ";
            compli_rules_remark = " ";
            risk_rule_type = 0;
            row_count = -1;
        }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 模板序号
        /// </summary>
        public ulong model_id { get; set; }
 
        /// <summary>
        /// 风险条目序号串
        /// </summary>
        public String risk_item_id_str { get; set; }
 
        /// <summary>
        /// 合规规则说明
        /// </summary>
        public String compli_rules_remark { get; set; }
 
        /// <summary>
        /// 风险规则类别
        /// </summary>
        public int risk_rule_type { get; set; }
 
        /// <summary>
        /// 指定行数
        /// </summary>
        public int row_count { get; set; }
 
        public override LDsdkDefine.LDPackerAdapter CreatePacker()
        {
            var packer = new LDPackerAdapter();
 
            packer.BeginPack();
            #region CommonDTOFiled
            packer.AddField("opor_co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("opor_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("opor_pwd", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_mac", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_ip_addr", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_info", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_way", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("menu_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("func_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("token", ELDDATATYPE.LD_DATATYPE_STRING);
            #endregion
 
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("model_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("risk_item_id_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("compli_rules_remark", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("risk_rule_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("row_count", ELDDATATYPE.LD_DATATYPE_INT);
 
            #region CommonDTOValue
            packer.AddInt(CommonDTO.opor_co_no);
            packer.AddInt(CommonDTO.opor_no);
            packer.AddStr(CommonDTO.opor_pwd);
            packer.AddStr(CommonDTO.oper_mac);
            packer.AddStr(CommonDTO.oper_ip_addr);
            packer.AddStr(CommonDTO.oper_info);
            packer.AddStr(CommonDTO.oper_way);
            packer.AddInt(CommonDTO.menu_no);
            packer.AddStr(CommonDTO.func_code);
            packer.AddStr(CommonDTO.SessionID);
            #endregion
 
            packer.AddInt(co_no);
            packer.AddInt64(model_id);
            packer.AddStr(risk_item_id_str);
            packer.AddStr(compli_rules_remark);
            packer.AddInt(risk_rule_type);
            packer.AddInt(row_count);
            packer.EndPack();
 
            return packer;
        }
        public override LDsdkDefineEx.LDFastMessageAdapter CreateFastMessage()
        {
            var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(CommonDTO.func_code, 0);

            #region CommonDTOFiled 默认参数，固定格式
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT, CommonDTO.opor_co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT,  CommonDTO.opor_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_PWD_STR, CommonDTO.opor_pwd);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR, CommonDTO.oper_mac);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR, CommonDTO.oper_ip_addr);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR, CommonDTO.oper_info);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR, CommonDTO.oper_way);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MENU_NO_INT, CommonDTO.menu_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUNC_CODE_STR, CommonDTO.func_code);
            #endregion

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_MODEL_ID_INT64,model_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_ITEM_ID_STR_STR,risk_item_id_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_RULES_REMARK_STR,compli_rules_remark);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_TYPE_INT,risk_rule_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
 
            return fastMsg;
        }
    }

    //逻辑_风控证券_公用_更新风险条目记录启用标志
    public class ReqFuncrksecuL_1_13DTO : ReqBaseDTO
    {
        public ReqFuncrksecuL_1_13DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rksecuL.1.13";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            risk_item_id_str = " ";
            risk_rule_type = 0;
            rule_flag = 0;
        }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 风险条目序号串
        /// </summary>
        public String risk_item_id_str { get; set; }
 
        /// <summary>
        /// 风险规则类别
        /// </summary>
        public int risk_rule_type { get; set; }
 
        /// <summary>
        /// 启用标志
        /// </summary>
        public int rule_flag { get; set; }
 
        public override LDsdkDefine.LDPackerAdapter CreatePacker()
        {
            var packer = new LDPackerAdapter();
 
            packer.BeginPack();
            #region CommonDTOFiled
            packer.AddField("opor_co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("opor_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("opor_pwd", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_mac", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_ip_addr", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_info", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_way", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("menu_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("func_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("token", ELDDATATYPE.LD_DATATYPE_STRING);
            #endregion
 
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("risk_item_id_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("risk_rule_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("rule_flag", ELDDATATYPE.LD_DATATYPE_INT);
 
            #region CommonDTOValue
            packer.AddInt(CommonDTO.opor_co_no);
            packer.AddInt(CommonDTO.opor_no);
            packer.AddStr(CommonDTO.opor_pwd);
            packer.AddStr(CommonDTO.oper_mac);
            packer.AddStr(CommonDTO.oper_ip_addr);
            packer.AddStr(CommonDTO.oper_info);
            packer.AddStr(CommonDTO.oper_way);
            packer.AddInt(CommonDTO.menu_no);
            packer.AddStr(CommonDTO.func_code);
            packer.AddStr(CommonDTO.SessionID);
            #endregion
 
            packer.AddInt(co_no);
            packer.AddStr(risk_item_id_str);
            packer.AddInt(risk_rule_type);
            packer.AddInt(rule_flag);
            packer.EndPack();
 
            return packer;
        }
        public override LDsdkDefineEx.LDFastMessageAdapter CreateFastMessage()
        {
            var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(CommonDTO.func_code, 0);

            #region CommonDTOFiled 默认参数，固定格式
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT, CommonDTO.opor_co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT,  CommonDTO.opor_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_PWD_STR, CommonDTO.opor_pwd);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR, CommonDTO.oper_mac);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR, CommonDTO.oper_ip_addr);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR, CommonDTO.oper_info);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR, CommonDTO.oper_way);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MENU_NO_INT, CommonDTO.menu_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUNC_CODE_STR, CommonDTO.func_code);
            #endregion

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_ITEM_ID_STR_STR,risk_item_id_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_TYPE_INT,risk_rule_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RULE_FLAG_INT,rule_flag);
 
            return fastMsg;
        }
    }

    //逻辑_风控证券_公用_证券数据归历史
    public class ReqFuncrksecuL_1_14DTO : ReqBaseDTO
    {
        public ReqFuncrksecuL_1_14DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rksecuL.1.14";
            CommonDTO.func_code = CommonDTO.function_code;
        }
 
        public override LDsdkDefine.LDPackerAdapter CreatePacker()
        {
            var packer = new LDPackerAdapter();
 
            packer.BeginPack();
            #region CommonDTOFiled
            packer.AddField("opor_co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("opor_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("opor_pwd", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_mac", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_ip_addr", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_info", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_way", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("menu_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("func_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("token", ELDDATATYPE.LD_DATATYPE_STRING);
            #endregion
 
 
            #region CommonDTOValue
            packer.AddInt(CommonDTO.opor_co_no);
            packer.AddInt(CommonDTO.opor_no);
            packer.AddStr(CommonDTO.opor_pwd);
            packer.AddStr(CommonDTO.oper_mac);
            packer.AddStr(CommonDTO.oper_ip_addr);
            packer.AddStr(CommonDTO.oper_info);
            packer.AddStr(CommonDTO.oper_way);
            packer.AddInt(CommonDTO.menu_no);
            packer.AddStr(CommonDTO.func_code);
            packer.AddStr(CommonDTO.SessionID);
            #endregion
 
            packer.EndPack();
 
            return packer;
        }
        public override LDsdkDefineEx.LDFastMessageAdapter CreateFastMessage()
        {
            var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(CommonDTO.func_code, 0);

            #region CommonDTOFiled 默认参数，固定格式
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT, CommonDTO.opor_co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT,  CommonDTO.opor_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_PWD_STR, CommonDTO.opor_pwd);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR, CommonDTO.oper_mac);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR, CommonDTO.oper_ip_addr);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR, CommonDTO.oper_info);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR, CommonDTO.oper_way);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MENU_NO_INT, CommonDTO.menu_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUNC_CODE_STR, CommonDTO.func_code);
            #endregion

 
            return fastMsg;
        }
    }

    //逻辑_风控证券_公用_查询风险条目模板记录
    public class ReqFuncrksecuL_1_15DTO : ReqBaseDTO
    {
        public ReqFuncrksecuL_1_15DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rksecuL.1.15";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            risk_rule_type = 0;
        }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 风险规则类别
        /// </summary>
        public int risk_rule_type { get; set; }
 
        public override LDsdkDefine.LDPackerAdapter CreatePacker()
        {
            var packer = new LDPackerAdapter();
 
            packer.BeginPack();
            #region CommonDTOFiled
            packer.AddField("opor_co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("opor_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("opor_pwd", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_mac", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_ip_addr", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_info", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_way", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("menu_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("func_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("token", ELDDATATYPE.LD_DATATYPE_STRING);
            #endregion
 
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("risk_rule_type", ELDDATATYPE.LD_DATATYPE_INT);
 
            #region CommonDTOValue
            packer.AddInt(CommonDTO.opor_co_no);
            packer.AddInt(CommonDTO.opor_no);
            packer.AddStr(CommonDTO.opor_pwd);
            packer.AddStr(CommonDTO.oper_mac);
            packer.AddStr(CommonDTO.oper_ip_addr);
            packer.AddStr(CommonDTO.oper_info);
            packer.AddStr(CommonDTO.oper_way);
            packer.AddInt(CommonDTO.menu_no);
            packer.AddStr(CommonDTO.func_code);
            packer.AddStr(CommonDTO.SessionID);
            #endregion
 
            packer.AddInt(co_no);
            packer.AddInt(risk_rule_type);
            packer.EndPack();
 
            return packer;
        }
        public override LDsdkDefineEx.LDFastMessageAdapter CreateFastMessage()
        {
            var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(CommonDTO.func_code, 0);

            #region CommonDTOFiled 默认参数，固定格式
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT, CommonDTO.opor_co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT,  CommonDTO.opor_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_PWD_STR, CommonDTO.opor_pwd);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR, CommonDTO.oper_mac);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR, CommonDTO.oper_ip_addr);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR, CommonDTO.oper_info);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR, CommonDTO.oper_way);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MENU_NO_INT, CommonDTO.menu_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUNC_CODE_STR, CommonDTO.func_code);
            #endregion

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_TYPE_INT,risk_rule_type);
 
            return fastMsg;
        }
    }

}
