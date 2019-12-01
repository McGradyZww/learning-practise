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
    //逻辑_风控期货_风控_增加客户风险规则记录
    public class ReqFuncrkfutuL_3_1DTO : ReqBaseDTO
    {
        public ReqFuncrkfutuL_3_1DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rkfutuL.3.1";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            pd_no = 0;
            exch_group_no = 0;
            asset_acco_no = 0;
            model_id = 0;
            risk_item_id = 0;
        }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// 模板序号
        /// </summary>
        public ulong model_id { get; set; }
 
        /// <summary>
        /// 风险条目序号
        /// </summary>
        public int risk_item_id { get; set; }
 
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
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_group_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("asset_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("model_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("risk_item_id", ELDDATATYPE.LD_DATATYPE_INT);
 
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
            packer.AddInt(pd_no);
            packer.AddInt(exch_group_no);
            packer.AddInt(asset_acco_no);
            packer.AddInt64(model_id);
            packer.AddInt(risk_item_id);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_MODEL_ID_INT64,model_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_ITEM_ID_INT,risk_item_id);
 
            return fastMsg;
        }
    }

    //逻辑_风控期货_风控_删除客户风险规则记录
    public class ReqFuncrkfutuL_3_2DTO : ReqBaseDTO
    {
        public ReqFuncrkfutuL_3_2DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rkfutuL.3.2";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            pd_no = 0;
            exch_group_no = 0;
            asset_acco_no = 0;
            model_id = 0;
            risk_item_id_str = " ";
        }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no { get; set; }
 
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
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_group_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("asset_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
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
            packer.AddInt(pd_no);
            packer.AddInt(exch_group_no);
            packer.AddInt(asset_acco_no);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_MODEL_ID_INT64,model_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_ITEM_ID_STR_STR,risk_item_id_str);
 
            return fastMsg;
        }
    }

    //逻辑_风控期货_风控_查询客户风险规则记录
    public class ReqFuncrkfutuL_3_3DTO : ReqBaseDTO
    {
        public ReqFuncrkfutuL_3_3DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rkfutuL.3.3";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            pd_no = 0;
            exch_group_no = 0;
            asset_acco_no = 0;
            model_id = 0;
            risk_item_id_str = " ";
            exch_no = 0;
            contrc_type = 0;
            order_dir_str = " ";
            risk_rule_id = 0;
            risk_rule_type_str = " ";
            risk_rule_name = " ";
            corrsp_plug = " ";
            rule_flag = 0;
            row_count = -1;
        }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// 模板序号
        /// </summary>
        public ulong model_id { get; set; }
 
        /// <summary>
        /// 风险条目序号串
        /// </summary>
        public String risk_item_id_str { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 合约类型
        /// </summary>
        public int contrc_type { get; set; }
 
        /// <summary>
        /// 订单方向串
        /// </summary>
        public String order_dir_str { get; set; }
 
        /// <summary>
        /// 风险规则序号
        /// </summary>
        public int risk_rule_id { get; set; }
 
        /// <summary>
        /// 风险规则类别串
        /// </summary>
        public String risk_rule_type_str { get; set; }
 
        /// <summary>
        /// 风险规则名称
        /// </summary>
        public String risk_rule_name { get; set; }
 
        /// <summary>
        /// 对应插件
        /// </summary>
        public String corrsp_plug { get; set; }
 
        /// <summary>
        /// 启用标志
        /// </summary>
        public int rule_flag { get; set; }
 
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
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_group_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("asset_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("model_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("risk_item_id_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("exch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("contrc_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("order_dir_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("risk_rule_id", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("risk_rule_type_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("risk_rule_name", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("corrsp_plug", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("rule_flag", ELDDATATYPE.LD_DATATYPE_INT);
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
            packer.AddInt(pd_no);
            packer.AddInt(exch_group_no);
            packer.AddInt(asset_acco_no);
            packer.AddInt64(model_id);
            packer.AddStr(risk_item_id_str);
            packer.AddInt(exch_no);
            packer.AddInt(contrc_type);
            packer.AddStr(order_dir_str);
            packer.AddInt(risk_rule_id);
            packer.AddStr(risk_rule_type_str);
            packer.AddStr(risk_rule_name);
            packer.AddStr(corrsp_plug);
            packer.AddInt(rule_flag);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_MODEL_ID_INT64,model_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_ITEM_ID_STR_STR,risk_item_id_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT,contrc_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR,order_dir_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_ID_INT,risk_rule_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_TYPE_STR_STR,risk_rule_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_NAME_STR,risk_rule_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CORRSP_PLUG_STR,corrsp_plug);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RULE_FLAG_INT,rule_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
 
            return fastMsg;
        }
    }

    //逻辑_风控期货_风控_获取客户风险要素
    public class ReqFuncrkfutuL_3_4DTO : ReqBaseDTO
    {
        public ReqFuncrkfutuL_3_4DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rkfutuL.3.4";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            pd_no = 0;
            exch_group_no = 0;
            asset_acco_no = 0;
            exch_no = 0;
            contrc_type = 0;
            order_dir_str = " ";
        }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 合约类型
        /// </summary>
        public int contrc_type { get; set; }
 
        /// <summary>
        /// 订单方向串
        /// </summary>
        public String order_dir_str { get; set; }
 
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
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_group_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("asset_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("contrc_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("order_dir_str", ELDDATATYPE.LD_DATATYPE_STRING);
 
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
            packer.AddInt(pd_no);
            packer.AddInt(exch_group_no);
            packer.AddInt(asset_acco_no);
            packer.AddInt(exch_no);
            packer.AddInt(contrc_type);
            packer.AddStr(order_dir_str);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT,contrc_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR,order_dir_str);
 
            return fastMsg;
        }
    }

    //逻辑_风控期货_风控_试算检查客户风险
    public class ReqFuncrkfutuL_3_5DTO : ReqBaseDTO
    {
        public ReqFuncrkfutuL_3_5DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rkfutuL.3.5";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            pd_no = 0;
            exch_group_no = 0;
            asset_acco_no = 0;
            exch_no = 0;
            hedge_type = 0;
            comb_code = " ";
            lngsht_type = 0;
            contrc_type = 0;
            contrc_code = " ";
            order_dir = 0;
            contrc_dir = 0;
            all_fee = 0;
            rece_margin = 0;
            order_qty = 0;
            contrc_unit = 0;
            order_price = 0;
            trig_stage_type = 0;
        }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 套保标志
        /// </summary>
        public int hedge_type { get; set; }
 
        /// <summary>
        /// 组合编码
        /// </summary>
        public String comb_code { get; set; }
 
        /// <summary>
        /// 多空类型
        /// </summary>
        public int lngsht_type { get; set; }
 
        /// <summary>
        /// 合约类型
        /// </summary>
        public int contrc_type { get; set; }
 
        /// <summary>
        /// 合约代码
        /// </summary>
        public String contrc_code { get; set; }
 
        /// <summary>
        /// 订单方向
        /// </summary>
        public int order_dir { get; set; }
 
        /// <summary>
        /// 开平方向
        /// </summary>
        public int contrc_dir { get; set; }
 
        /// <summary>
        /// 全部费用
        /// </summary>
        public double all_fee { get; set; }
 
        /// <summary>
        /// 应收保证金
        /// </summary>
        public double rece_margin { get; set; }
 
        /// <summary>
        /// 订单数量
        /// </summary>
        public double order_qty { get; set; }
 
        /// <summary>
        /// 合约乘数
        /// </summary>
        public int contrc_unit { get; set; }
 
        /// <summary>
        /// 订单价格
        /// </summary>
        public double order_price { get; set; }
 
        /// <summary>
        /// 触发阶段类型
        /// </summary>
        public int trig_stage_type { get; set; }
 
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
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_group_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("asset_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("hedge_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comb_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("lngsht_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("contrc_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("contrc_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("order_dir", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("contrc_dir", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("all_fee", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("rece_margin", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("order_qty", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("contrc_unit", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("order_price", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("trig_stage_type", ELDDATATYPE.LD_DATATYPE_INT);
 
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
            packer.AddInt(pd_no);
            packer.AddInt(exch_group_no);
            packer.AddInt(asset_acco_no);
            packer.AddInt(exch_no);
            packer.AddInt(hedge_type);
            packer.AddStr(comb_code);
            packer.AddInt(lngsht_type);
            packer.AddInt(contrc_type);
            packer.AddStr(contrc_code);
            packer.AddInt(order_dir);
            packer.AddInt(contrc_dir);
            packer.AddDouble(all_fee);
            packer.AddDouble(rece_margin);
            packer.AddDouble(order_qty);
            packer.AddInt(contrc_unit);
            packer.AddDouble(order_price);
            packer.AddInt(trig_stage_type);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT,hedge_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMB_CODE_STR,comb_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT,lngsht_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT,contrc_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR,contrc_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT,order_dir);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_DIR_INT,contrc_dir);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT,all_fee);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RECE_MARGIN_FLOAT,rece_margin);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT,order_qty);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_UNIT_INT,contrc_unit);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT,order_price);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_STAGE_TYPE_INT,trig_stage_type);
 
            return fastMsg;
        }
    }

    //逻辑_风控期货_风控_客户风险触警流水查询
    public class ReqFuncrkfutuL_3_6DTO : ReqBaseDTO
    {
        public ReqFuncrkfutuL_3_6DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rkfutuL.3.6";
            CommonDTO.func_code = CommonDTO.function_code;
            create_date = 0;
            co_no = 0;
            pd_no = 0;
            exch_group_no = 0;
            risk_rule_action = " ";
            risk_rule_type = 0;
            row_count = -1;
        }
 
        /// <summary>
        /// 创建日期
        /// </summary>
        public int create_date { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// 风险采取行为
        /// </summary>
        public String risk_rule_action { get; set; }
 
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
 
            packer.AddField("create_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_group_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("risk_rule_action", ELDDATATYPE.LD_DATATYPE_STRING);
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
 
            packer.AddInt(create_date);
            packer.AddInt(co_no);
            packer.AddInt(pd_no);
            packer.AddInt(exch_group_no);
            packer.AddStr(risk_rule_action);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT,create_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_ACTION_STR,risk_rule_action);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_TYPE_INT,risk_rule_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
 
            return fastMsg;
        }
    }

    //逻辑_风控期货_风控_模板查询客户产品交易组
    public class ReqFuncrkfutuL_3_7DTO : ReqBaseDTO
    {
        public ReqFuncrkfutuL_3_7DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rkfutuL.3.7";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            model_id = 0;
            risk_rule_type_str = " ";
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
        /// 风险规则类别串
        /// </summary>
        public String risk_rule_type_str { get; set; }
 
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
            packer.AddField("risk_rule_type_str", ELDDATATYPE.LD_DATATYPE_STRING);
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
            packer.AddStr(risk_rule_type_str);
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
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_TYPE_STR_STR,risk_rule_type_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
 
            return fastMsg;
        }
    }

    //逻辑_风控期货_风控_客户风险触警历史流水查询
    public class ReqFuncrkfutuL_3_8DTO : ReqBaseDTO
    {
        public ReqFuncrkfutuL_3_8DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rkfutuL.3.8";
            CommonDTO.func_code = CommonDTO.function_code;
            begin_date = 0;
            end_date = 0;
            co_no = 0;
            pd_no = 0;
            exch_group_no = 0;
            risk_rule_action = " ";
            risk_rule_type = 0;
            row_count = -1;
        }
 
        /// <summary>
        /// 开始日期
        /// </summary>
        public int begin_date { get; set; }
 
        /// <summary>
        /// 结束日期
        /// </summary>
        public int end_date { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// 风险采取行为
        /// </summary>
        public String risk_rule_action { get; set; }
 
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
 
            packer.AddField("begin_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("end_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_group_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("risk_rule_action", ELDDATATYPE.LD_DATATYPE_STRING);
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
 
            packer.AddInt(begin_date);
            packer.AddInt(end_date);
            packer.AddInt(co_no);
            packer.AddInt(pd_no);
            packer.AddInt(exch_group_no);
            packer.AddStr(risk_rule_action);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT,end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_ACTION_STR,risk_rule_action);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_TYPE_INT,risk_rule_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
 
            return fastMsg;
        }
    }

    //逻辑_风控期货_风控_批量试算检查客户风险
    public class ReqFuncrkfutuL_3_9DTO : ReqBaseDTO
    {
        public ReqFuncrkfutuL_3_9DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rkfutuL.3.9";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            pd_no_str = " ";
            exch_group_no_str = " ";
            asset_acco_no_str = " ";
            exch_no_str = " ";
            hedge_type_str = " ";
            comb_code_str = " ";
            lngsht_type_str = " ";
            contrc_type_str = " ";
            contrc_code_str = " ";
            order_dir_str = " ";
            contrc_dir_str = " ";
            all_fee_str = " ";
            rece_margin_str = " ";
            order_qty_str = " ";
            contrc_unit_str = " ";
            order_price_str = " ";
            trig_stage_type = 0;
        }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编号串
        /// </summary>
        public String pd_no_str { get; set; }
 
        /// <summary>
        /// 交易组编号串
        /// </summary>
        public String exch_group_no_str { get; set; }
 
        /// <summary>
        /// 资产账户编号串
        /// </summary>
        public String asset_acco_no_str { get; set; }
 
        /// <summary>
        /// 市场编号串
        /// </summary>
        public String exch_no_str { get; set; }
 
        /// <summary>
        /// 套保标志串
        /// </summary>
        public String hedge_type_str { get; set; }
 
        /// <summary>
        /// 组合编码串
        /// </summary>
        public String comb_code_str { get; set; }
 
        /// <summary>
        /// 多空类型串
        /// </summary>
        public String lngsht_type_str { get; set; }
 
        /// <summary>
        /// 合约类型串
        /// </summary>
        public String contrc_type_str { get; set; }
 
        /// <summary>
        /// 合约代码串
        /// </summary>
        public String contrc_code_str { get; set; }
 
        /// <summary>
        /// 订单方向串
        /// </summary>
        public String order_dir_str { get; set; }
 
        /// <summary>
        /// 开平方向串
        /// </summary>
        public String contrc_dir_str { get; set; }
 
        /// <summary>
        /// 全部费用串
        /// </summary>
        public String all_fee_str { get; set; }
 
        /// <summary>
        /// 应收保证金串
        /// </summary>
        public String rece_margin_str { get; set; }
 
        /// <summary>
        /// 订单数量串
        /// </summary>
        public String order_qty_str { get; set; }
 
        /// <summary>
        /// 合约乘数串
        /// </summary>
        public String contrc_unit_str { get; set; }
 
        /// <summary>
        /// 订单价格串
        /// </summary>
        public String order_price_str { get; set; }
 
        /// <summary>
        /// 触发阶段类型
        /// </summary>
        public int trig_stage_type { get; set; }
 
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
            packer.AddField("pd_no_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("exch_group_no_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("asset_acco_no_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("exch_no_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("hedge_type_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("comb_code_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("lngsht_type_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("contrc_type_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("contrc_code_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("order_dir_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("contrc_dir_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("all_fee_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("rece_margin_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("order_qty_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("contrc_unit_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("order_price_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("trig_stage_type", ELDDATATYPE.LD_DATATYPE_INT);
 
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
            packer.AddStr(pd_no_str);
            packer.AddStr(exch_group_no_str);
            packer.AddStr(asset_acco_no_str);
            packer.AddStr(exch_no_str);
            packer.AddStr(hedge_type_str);
            packer.AddStr(comb_code_str);
            packer.AddStr(lngsht_type_str);
            packer.AddStr(contrc_type_str);
            packer.AddStr(contrc_code_str);
            packer.AddStr(order_dir_str);
            packer.AddStr(contrc_dir_str);
            packer.AddStr(all_fee_str);
            packer.AddStr(rece_margin_str);
            packer.AddStr(order_qty_str);
            packer.AddStr(contrc_unit_str);
            packer.AddStr(order_price_str);
            packer.AddInt(trig_stage_type);
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
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_STR_STR,pd_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_STR_STR,exch_group_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_STR_STR,asset_acco_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_STR_STR,hedge_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMB_CODE_STR_STR,comb_code_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_STR_STR,lngsht_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_STR_STR,contrc_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR_STR,contrc_code_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR,order_dir_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_DIR_STR_STR,contrc_dir_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_STR_STR,all_fee_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RECE_MARGIN_STR_STR,rece_margin_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_STR_STR,order_qty_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_UNIT_STR_STR,contrc_unit_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_STR_STR,order_price_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_STAGE_TYPE_INT,trig_stage_type);
 
            return fastMsg;
        }
    }

}
