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
    //逻辑_报表_报表数据_更新报表产品信息
    public class ReqFuncrptL_2_1DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_1DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.1";
            CommonDTO.func_code = CommonDTO.function_code;
            input_date = 0;
        }
 
        /// <summary>
        /// 传入日期
        /// </summary>
        public int input_date { get; set; }
 
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
 
            packer.AddField("input_date", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(input_date);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INPUT_DATE_INT,input_date);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_查询报表产品信息
    public class ReqFuncrptL_2_2DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_2DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.2";
            CommonDTO.func_code = CommonDTO.function_code;
            pd_no = 0;
            pd_type = 0;
            pd_status_str = " ";
            borker_no = 0;
            broker_my_type = 0;
        }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 产品类型
        /// </summary>
        public int pd_type { get; set; }
 
        /// <summary>
        /// 产品状态串
        /// </summary>
        public String pd_status_str { get; set; }
 
        /// <summary>
        /// 券商编号
        /// </summary>
        public int borker_no { get; set; }
 
        /// <summary>
        /// 券商自主类型
        /// </summary>
        public int broker_my_type { get; set; }
 
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
 
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_status_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("borker_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("broker_my_type", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(pd_no);
            packer.AddInt(pd_type);
            packer.AddStr(pd_status_str);
            packer.AddInt(borker_no);
            packer.AddInt(broker_my_type);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_TYPE_INT,pd_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_STATUS_STR_STR,pd_status_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BORKER_NO_INT,borker_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BROKER_MY_TYPE_INT,broker_my_type);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_修改报表产品信息
    public class ReqFuncrptL_2_3DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_3DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.3";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            pd_code = " ";
            risk_free_interest_rate = 0;
            follow_share = 0;
            warn_value = 0;
            stop_value = 0;
        }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编码
        /// </summary>
        public String pd_code { get; set; }
 
        /// <summary>
        /// 无风险利率
        /// </summary>
        public double risk_free_interest_rate { get; set; }
 
        /// <summary>
        /// 跟投份额
        /// </summary>
        public double follow_share { get; set; }
 
        /// <summary>
        /// 预警值
        /// </summary>
        public double warn_value { get; set; }
 
        /// <summary>
        /// 止损值
        /// </summary>
        public double stop_value { get; set; }
 
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
            packer.AddField("pd_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("risk_free_interest_rate", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("follow_share", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("warn_value", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("stop_value", ELDDATATYPE.LD_DATATYPE_DOUBLE);
 
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
            packer.AddStr(pd_code);
            packer.AddDouble(risk_free_interest_rate);
            packer.AddDouble(follow_share);
            packer.AddDouble(warn_value);
            packer.AddDouble(stop_value);
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
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR,pd_code);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RISK_FREE_INTEREST_RATE_FLOAT,risk_free_interest_rate);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FOLLOW_SHARE_FLOAT,follow_share);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WARN_VALUE_FLOAT,warn_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOP_VALUE_FLOAT,stop_value);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_更新报表产品资产
    public class ReqFuncrptL_2_4DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_4DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.4";
            CommonDTO.func_code = CommonDTO.function_code;
            input_date = 0;
            co_no = 0;
            pd_code = " ";
        }
 
        /// <summary>
        /// 传入日期
        /// </summary>
        public int input_date { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编码
        /// </summary>
        public String pd_code { get; set; }
 
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
 
            packer.AddField("input_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_code", ELDDATATYPE.LD_DATATYPE_STRING);
 
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
 
            packer.AddInt(input_date);
            packer.AddInt(co_no);
            packer.AddStr(pd_code);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INPUT_DATE_INT,input_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR,pd_code);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_更新报表产品持仓
    public class ReqFuncrptL_2_5DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_5DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.5";
            CommonDTO.func_code = CommonDTO.function_code;
            input_date = 0;
            co_no = 0;
            pd_code = " ";
        }
 
        /// <summary>
        /// 传入日期
        /// </summary>
        public int input_date { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编码
        /// </summary>
        public String pd_code { get; set; }
 
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
 
            packer.AddField("input_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_code", ELDDATATYPE.LD_DATATYPE_STRING);
 
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
 
            packer.AddInt(input_date);
            packer.AddInt(co_no);
            packer.AddStr(pd_code);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INPUT_DATE_INT,input_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR,pd_code);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_计算单产品收益率
    public class ReqFuncrptL_2_6DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_6DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.6";
            CommonDTO.func_code = CommonDTO.function_code;
            input_date = 0;
            co_no = 0;
            pd_code = " ";
        }
 
        /// <summary>
        /// 传入日期
        /// </summary>
        public int input_date { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编码
        /// </summary>
        public String pd_code { get; set; }
 
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
 
            packer.AddField("input_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_code", ELDDATATYPE.LD_DATATYPE_STRING);
 
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
 
            packer.AddInt(input_date);
            packer.AddInt(co_no);
            packer.AddStr(pd_code);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INPUT_DATE_INT,input_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR,pd_code);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_计算产品收益率分析
    public class ReqFuncrptL_2_7DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_7DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.7";
            CommonDTO.func_code = CommonDTO.function_code;
            input_date = 0;
            co_no = 0;
            pd_code = " ";
        }
 
        /// <summary>
        /// 传入日期
        /// </summary>
        public int input_date { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编码
        /// </summary>
        public String pd_code { get; set; }
 
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
 
            packer.AddField("input_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_code", ELDDATATYPE.LD_DATATYPE_STRING);
 
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
 
            packer.AddInt(input_date);
            packer.AddInt(co_no);
            packer.AddStr(pd_code);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INPUT_DATE_INT,input_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR,pd_code);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_增加交易周信息
    public class ReqFuncrptL_2_8DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_8DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.8";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            pd_code = " ";
            begin_date = 0;
        }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编码
        /// </summary>
        public String pd_code { get; set; }
 
        /// <summary>
        /// 开始日期
        /// </summary>
        public int begin_date { get; set; }
 
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
            packer.AddField("pd_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("begin_date", ELDDATATYPE.LD_DATATYPE_INT);
 
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
            packer.AddStr(pd_code);
            packer.AddInt(begin_date);
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
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR,pd_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_同步资管产品账户表
    public class ReqFuncrptL_2_9DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_9DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.9";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            pd_code = " ";
            begin_date = 0;
        }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编码
        /// </summary>
        public String pd_code { get; set; }
 
        /// <summary>
        /// 开始日期
        /// </summary>
        public int begin_date { get; set; }
 
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
            packer.AddField("pd_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("begin_date", ELDDATATYPE.LD_DATATYPE_INT);
 
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
            packer.AddStr(pd_code);
            packer.AddInt(begin_date);
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
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR,pd_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_同步资管历史产品账户表
    public class ReqFuncrptL_2_10DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_10DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.10";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            pd_code = " ";
            begin_date = 0;
        }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编码
        /// </summary>
        public String pd_code { get; set; }
 
        /// <summary>
        /// 开始日期
        /// </summary>
        public int begin_date { get; set; }
 
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
            packer.AddField("pd_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("begin_date", ELDDATATYPE.LD_DATATYPE_INT);
 
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
            packer.AddStr(pd_code);
            packer.AddInt(begin_date);
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
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR,pd_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_同步资管产品持仓表
    public class ReqFuncrptL_2_11DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_11DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.11";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            pd_no = 0;
            begin_date = 0;
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
        /// 开始日期
        /// </summary>
        public int begin_date { get; set; }
 
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
            packer.AddField("begin_date", ELDDATATYPE.LD_DATATYPE_INT);
 
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
            packer.AddInt(begin_date);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_同步资管历史产品持仓表
    public class ReqFuncrptL_2_12DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_12DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.12";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            pd_code = " ";
            begin_date = 0;
        }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编码
        /// </summary>
        public String pd_code { get; set; }
 
        /// <summary>
        /// 开始日期
        /// </summary>
        public int begin_date { get; set; }
 
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
            packer.AddField("pd_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("begin_date", ELDDATATYPE.LD_DATATYPE_INT);
 
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
            packer.AddStr(pd_code);
            packer.AddInt(begin_date);
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
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR,pd_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_同步资管产品单元资金表
    public class ReqFuncrptL_2_13DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_13DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.13";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            pd_no = 0;
            begin_date = 0;
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
        /// 开始日期
        /// </summary>
        public int begin_date { get; set; }
 
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
            packer.AddField("begin_date", ELDDATATYPE.LD_DATATYPE_INT);
 
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
            packer.AddInt(begin_date);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_同步资管历史产品单元资金表
    public class ReqFuncrptL_2_14DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_14DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.14";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            pd_code = " ";
            begin_date = 0;
        }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编码
        /// </summary>
        public String pd_code { get; set; }
 
        /// <summary>
        /// 开始日期
        /// </summary>
        public int begin_date { get; set; }
 
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
            packer.AddField("pd_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("begin_date", ELDDATATYPE.LD_DATATYPE_INT);
 
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
            packer.AddStr(pd_code);
            packer.AddInt(begin_date);
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
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR,pd_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_同步资管证券行情表
    public class ReqFuncrptL_2_15DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_15DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.15";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            pd_code = " ";
            begin_date = 0;
        }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编码
        /// </summary>
        public String pd_code { get; set; }
 
        /// <summary>
        /// 开始日期
        /// </summary>
        public int begin_date { get; set; }
 
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
            packer.AddField("pd_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("begin_date", ELDDATATYPE.LD_DATATYPE_INT);
 
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
            packer.AddStr(pd_code);
            packer.AddInt(begin_date);
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
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR,pd_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_同步资管历史证券行情表
    public class ReqFuncrptL_2_16DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_16DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.16";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            pd_code = " ";
            begin_date = 0;
        }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编码
        /// </summary>
        public String pd_code { get; set; }
 
        /// <summary>
        /// 开始日期
        /// </summary>
        public int begin_date { get; set; }
 
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
            packer.AddField("pd_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("begin_date", ELDDATATYPE.LD_DATATYPE_INT);
 
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
            packer.AddStr(pd_code);
            packer.AddInt(begin_date);
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
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR,pd_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_同步资管证券订单表
    public class ReqFuncrptL_2_17DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_17DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.17";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            pd_no = 0;
            begin_date = 0;
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
        /// 开始日期
        /// </summary>
        public int begin_date { get; set; }
 
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
            packer.AddField("begin_date", ELDDATATYPE.LD_DATATYPE_INT);
 
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
            packer.AddInt(begin_date);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_同步资管证券成交表
    public class ReqFuncrptL_2_18DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_18DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.18";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            pd_no = 0;
            begin_date = 0;
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
        /// 开始日期
        /// </summary>
        public int begin_date { get; set; }
 
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
            packer.AddField("begin_date", ELDDATATYPE.LD_DATATYPE_INT);
 
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
            packer.AddInt(begin_date);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_新增报表产品信息
    public class ReqFuncrptL_2_19DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_19DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.19";
            CommonDTO.func_code = CommonDTO.function_code;
            init_date = 0;
            pd_no = 0;
            co_no = 0;
            pd_code = " ";
            pd_name = " ";
            pd_flname = " ";
            pd_manager = " ";
            found_date = 0;
            pd_type = 0;
            apply_currency = "CNY";
            crncy_type = "CNY";
            first_asset = 0;
            first_amt = 0;
            pd_all_share = 0;
            curr_share = 0;
            pre_share = 0;
            his_max_per_nav = 0;
            pre_nav = 0;
            coust_full_name = " ";
            coust_acco = " ";
            coust_acco_name = " ";
            pd_status = "0";
            remark_info = " ";
            cost_calc_type = 0;
            risk_free_interest_rate = 0;
            allow_exch = " ";
            sys_no = 0;
        }
 
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编码
        /// </summary>
        public String pd_code { get; set; }
 
        /// <summary>
        /// 产品名称
        /// </summary>
        public String pd_name { get; set; }
 
        /// <summary>
        /// 产品全称
        /// </summary>
        public String pd_flname { get; set; }
 
        /// <summary>
        /// 产品管理人
        /// </summary>
        public String pd_manager { get; set; }
 
        /// <summary>
        /// 成立日期
        /// </summary>
        public int found_date { get; set; }
 
        /// <summary>
        /// 产品类型
        /// </summary>
        public int pd_type { get; set; }
 
        /// <summary>
        /// 募集币种
        /// </summary>
        public String apply_currency { get; set; }
 
        /// <summary>
        /// 本币币种
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// 原始资产
        /// </summary>
        public double first_asset { get; set; }
 
        /// <summary>
        /// 原始金额
        /// </summary>
        public double first_amt { get; set; }
 
        /// <summary>
        /// 产品总份额
        /// </summary>
        public double pd_all_share { get; set; }
 
        /// <summary>
        /// 当前份额
        /// </summary>
        public double curr_share { get; set; }
 
        /// <summary>
        /// 昨日份额
        /// </summary>
        public double pre_share { get; set; }
 
        /// <summary>
        /// 历史最高单位净值
        /// </summary>
        public double his_max_per_nav { get; set; }
 
        /// <summary>
        /// 昨日净值
        /// </summary>
        public double pre_nav { get; set; }
 
        /// <summary>
        /// 境内托管人全名
        /// </summary>
        public String coust_full_name { get; set; }
 
        /// <summary>
        /// 境内托管账户
        /// </summary>
        public String coust_acco { get; set; }
 
        /// <summary>
        /// 境内托管账户名
        /// </summary>
        public String coust_acco_name { get; set; }
 
        /// <summary>
        /// 产品状态
        /// </summary>
        public String pd_status { get; set; }
 
        /// <summary>
        /// 备注信息
        /// </summary>
        public String remark_info { get; set; }
 
        /// <summary>
        /// 成本计算方式
        /// </summary>
        public int cost_calc_type { get; set; }
 
        /// <summary>
        /// 无风险利率
        /// </summary>
        public double risk_free_interest_rate { get; set; }
 
        /// <summary>
        /// 允许投资市场
        /// </summary>
        public String allow_exch { get; set; }
 
        /// <summary>
        /// 系统编号
        /// </summary>
        public int sys_no { get; set; }
 
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
 
            packer.AddField("init_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("pd_name", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("pd_flname", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("pd_manager", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("found_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("apply_currency", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("crncy_type", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("first_asset", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("first_amt", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("pd_all_share", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("curr_share", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("pre_share", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("his_max_per_nav", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("pre_nav", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("coust_full_name", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("coust_acco", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("coust_acco_name", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("pd_status", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("remark_info", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("cost_calc_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("risk_free_interest_rate", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("allow_exch", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("sys_no", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(init_date);
            packer.AddInt(pd_no);
            packer.AddInt(co_no);
            packer.AddStr(pd_code);
            packer.AddStr(pd_name);
            packer.AddStr(pd_flname);
            packer.AddStr(pd_manager);
            packer.AddInt(found_date);
            packer.AddInt(pd_type);
            packer.AddStr(apply_currency);
            packer.AddStr(crncy_type);
            packer.AddDouble(first_asset);
            packer.AddDouble(first_amt);
            packer.AddDouble(pd_all_share);
            packer.AddDouble(curr_share);
            packer.AddDouble(pre_share);
            packer.AddDouble(his_max_per_nav);
            packer.AddDouble(pre_nav);
            packer.AddStr(coust_full_name);
            packer.AddStr(coust_acco);
            packer.AddStr(coust_acco_name);
            packer.AddStr(pd_status);
            packer.AddStr(remark_info);
            packer.AddInt(cost_calc_type);
            packer.AddDouble(risk_free_interest_rate);
            packer.AddStr(allow_exch);
            packer.AddInt(sys_no);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR,pd_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR,pd_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_FLNAME_STR,pd_flname);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_MANAGER_STR,pd_manager);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FOUND_DATE_INT,found_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_TYPE_INT,pd_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_APPLY_CURRENCY_STR,apply_currency);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FIRST_ASSET_FLOAT,first_asset);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FIRST_AMT_FLOAT,first_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_ALL_SHARE_FLOAT,pd_all_share);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_SHARE_FLOAT,curr_share);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SHARE_FLOAT,pre_share);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HIS_MAX_PER_NAV_FLOAT,his_max_per_nav);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_NAV_FLOAT,pre_nav);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COUST_FULL_NAME_STR,coust_full_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COUST_ACCO_STR,coust_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COUST_ACCO_NAME_STR,coust_acco_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_STATUS_STR,pd_status);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COST_CALC_TYPE_INT,cost_calc_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RISK_FREE_INTEREST_RATE_FLOAT,risk_free_interest_rate);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_EXCH_STR,allow_exch);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SYS_NO_INT,sys_no);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_查询行业类别表
    public class ReqFuncrptL_2_21DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_21DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.21";
            CommonDTO.func_code = CommonDTO.function_code;
            industry_std = 0;
            industry_classification = 0;
            industry_id = 0;
        }
 
        /// <summary>
        /// 行业标准
        /// </summary>
        public int industry_std { get; set; }
 
        /// <summary>
        /// 行业级别
        /// </summary>
        public int industry_classification { get; set; }
 
        /// <summary>
        /// 行业编号
        /// </summary>
        public int industry_id { get; set; }
 
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
 
            packer.AddField("industry_std", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("industry_classification", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("industry_id", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(industry_std);
            packer.AddInt(industry_classification);
            packer.AddInt(industry_id);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDUSTRY_STD_INT,industry_std);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDUSTRY_CLASSIFICATION_INT,industry_classification);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDUSTRY_ID_INT,industry_id);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_查询行业证券表
    public class ReqFuncrptL_2_22DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_22DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.22";
            CommonDTO.func_code = CommonDTO.function_code;
            exch_no = 0;
            stock_code_no = 0;
            stock_type = 0;
            asset_type = 0;
            industry_std = 0;
            industry_classification = 0;
            industry_id = 0;
        }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 证券类型
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// 资产类型
        /// </summary>
        public int asset_type { get; set; }
 
        /// <summary>
        /// 行业标准
        /// </summary>
        public int industry_std { get; set; }
 
        /// <summary>
        /// 行业级别
        /// </summary>
        public int industry_classification { get; set; }
 
        /// <summary>
        /// 行业编号
        /// </summary>
        public int industry_id { get; set; }
 
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
 
            packer.AddField("exch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_code_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("asset_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("industry_std", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("industry_classification", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("industry_id", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(exch_no);
            packer.AddInt(stock_code_no);
            packer.AddInt(stock_type);
            packer.AddInt(asset_type);
            packer.AddInt(industry_std);
            packer.AddInt(industry_classification);
            packer.AddInt(industry_id);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT,stock_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT,asset_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDUSTRY_STD_INT,industry_std);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDUSTRY_CLASSIFICATION_INT,industry_classification);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDUSTRY_ID_INT,industry_id);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_初始化产品初始化定时任务
    public class ReqFuncrptL_2_50DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_50DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.50";
            CommonDTO.func_code = CommonDTO.function_code;
            task_no = 0;
            exec_count = 0;
            exec_date = 0;
            exec_time = 0;
        }
 
        /// <summary>
        /// 任务编号
        /// </summary>
        public int task_no { get; set; }
 
        /// <summary>
        /// 执行次数
        /// </summary>
        public int exec_count { get; set; }
 
        /// <summary>
        /// 执行日期
        /// </summary>
        public int exec_date { get; set; }
 
        /// <summary>
        /// 执行时间
        /// </summary>
        public int exec_time { get; set; }
 
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
 
            packer.AddField("task_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exec_count", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exec_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exec_time", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(task_no);
            packer.AddInt(exec_count);
            packer.AddInt(exec_date);
            packer.AddInt(exec_time);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TASK_NO_INT,task_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_COUNT_INT,exec_count);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_DATE_INT,exec_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_TIME_INT,exec_time);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_备份数据产品资产表
    public class ReqFuncrptL_2_51DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_51DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.51";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            pd_no = 0;
        }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
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
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_备份数据产品持仓表
    public class ReqFuncrptL_2_52DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_52DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.52";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            pd_no = 0;
        }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
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
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_每日计算产品持仓市值
    public class ReqFuncrptL_2_53DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_53DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.53";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            pd_no = 0;
        }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
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
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_备份数据产品订单表
    public class ReqFuncrptL_2_54DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_54DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.54";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            pd_no = 0;
        }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
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
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_备份数据产品成交表
    public class ReqFuncrptL_2_55DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_55DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.55";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            pd_no = 0;
        }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
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
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_备份数据产品自定义资产
    public class ReqFuncrptL_2_56DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_56DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.56";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            pd_no = 0;
        }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
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
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_查询机构自定义资产类型
    public class ReqFuncrptL_2_61DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_61DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.61";
            CommonDTO.func_code = CommonDTO.function_code;
            def_type = 0;
        }
 
        /// <summary>
        /// 定义类型
        /// </summary>
        public int def_type { get; set; }
 
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
 
            packer.AddField("def_type", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(def_type);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEF_TYPE_INT,def_type);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_修改产品自定义资产
    public class ReqFuncrptL_2_62DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_62DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.62";
            CommonDTO.func_code = CommonDTO.function_code;
            input_date = 0;
            pd_no = 0;
            def_asset_type = 0;
            def_type = 0;
            def_asset_field = 0;
            asset_value = 0;
        }
 
        /// <summary>
        /// 传入日期
        /// </summary>
        public int input_date { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 资产定义类型
        /// </summary>
        public int def_asset_type { get; set; }
 
        /// <summary>
        /// 定义类型
        /// </summary>
        public int def_type { get; set; }
 
        /// <summary>
        /// 资产定义字段
        /// </summary>
        public int def_asset_field { get; set; }
 
        /// <summary>
        /// 资产值
        /// </summary>
        public double asset_value { get; set; }
 
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
 
            packer.AddField("input_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("def_asset_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("def_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("def_asset_field", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("asset_value", ELDDATATYPE.LD_DATATYPE_DOUBLE);
 
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
 
            packer.AddInt(input_date);
            packer.AddInt(pd_no);
            packer.AddInt(def_asset_type);
            packer.AddInt(def_type);
            packer.AddInt(def_asset_field);
            packer.AddDouble(asset_value);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INPUT_DATE_INT,input_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEF_ASSET_TYPE_INT,def_asset_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEF_TYPE_INT,def_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEF_ASSET_FIELD_INT,def_asset_field);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_VALUE_FLOAT,asset_value);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_查询产品自定义资产
    public class ReqFuncrptL_2_63DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_63DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.63";
            CommonDTO.func_code = CommonDTO.function_code;
            input_date = 0;
            pd_no = 0;
            def_asset_type = 0;
            def_type = 0;
        }
 
        /// <summary>
        /// 传入日期
        /// </summary>
        public int input_date { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 资产定义类型
        /// </summary>
        public int def_asset_type { get; set; }
 
        /// <summary>
        /// 定义类型
        /// </summary>
        public int def_type { get; set; }
 
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
 
            packer.AddField("input_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("def_asset_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("def_type", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(input_date);
            packer.AddInt(pd_no);
            packer.AddInt(def_asset_type);
            packer.AddInt(def_type);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INPUT_DATE_INT,input_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEF_ASSET_TYPE_INT,def_asset_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEF_TYPE_INT,def_type);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_计算产品自定义资产
    public class ReqFuncrptL_2_64DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_64DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.64";
            CommonDTO.func_code = CommonDTO.function_code;
            input_date = 0;
            pd_no = 0;
            def_asset_type = 0;
            def_type = 0;
        }
 
        /// <summary>
        /// 传入日期
        /// </summary>
        public int input_date { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 资产定义类型
        /// </summary>
        public int def_asset_type { get; set; }
 
        /// <summary>
        /// 定义类型
        /// </summary>
        public int def_type { get; set; }
 
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
 
            packer.AddField("input_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("def_asset_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("def_type", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(input_date);
            packer.AddInt(pd_no);
            packer.AddInt(def_asset_type);
            packer.AddInt(def_type);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INPUT_DATE_INT,input_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEF_ASSET_TYPE_INT,def_asset_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEF_TYPE_INT,def_type);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_定时任务计算产品自定义资产
    public class ReqFuncrptL_2_65DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_65DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.65";
            CommonDTO.func_code = CommonDTO.function_code;
            input_date = 0;
            pd_no = 0;
            def_asset_type = 0;
            def_type = 0;
        }
 
        /// <summary>
        /// 传入日期
        /// </summary>
        public int input_date { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 资产定义类型
        /// </summary>
        public int def_asset_type { get; set; }
 
        /// <summary>
        /// 定义类型
        /// </summary>
        public int def_type { get; set; }
 
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
 
            packer.AddField("input_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("def_asset_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("def_type", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(input_date);
            packer.AddInt(pd_no);
            packer.AddInt(def_asset_type);
            packer.AddInt(def_type);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INPUT_DATE_INT,input_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEF_ASSET_TYPE_INT,def_asset_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEF_TYPE_INT,def_type);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_查询机构自定义资产字段列表
    public class ReqFuncrptL_2_66DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_66DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.66";
            CommonDTO.func_code = CommonDTO.function_code;
            def_type = 0;
        }
 
        /// <summary>
        /// 定义类型
        /// </summary>
        public int def_type { get; set; }
 
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
 
            packer.AddField("def_type", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(def_type);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEF_TYPE_INT,def_type);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_产品执行SQL
    public class ReqFuncrptL_2_67DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_67DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.67";
            CommonDTO.func_code = CommonDTO.function_code;
            input_date = 0;
            pd_no = 0;
            sql_grp_no_str = " ";
        }
 
        /// <summary>
        /// 传入日期
        /// </summary>
        public int input_date { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 组号字符串
        /// </summary>
        public String sql_grp_no_str { get; set; }
 
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
 
            packer.AddField("input_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("sql_grp_no_str", ELDDATATYPE.LD_DATATYPE_STRING);
 
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
 
            packer.AddInt(input_date);
            packer.AddInt(pd_no);
            packer.AddStr(sql_grp_no_str);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INPUT_DATE_INT,input_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_SQL_GRP_NO_STR_STR,sql_grp_no_str);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_查询调用命令表
    public class ReqFuncrptL_2_68DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_68DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.68";
            CommonDTO.func_code = CommonDTO.function_code;
            cmd_id = 0;
        }
 
        /// <summary>
        /// 命令编号
        /// </summary>
        public int cmd_id { get; set; }
 
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
 
            packer.AddField("cmd_id", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(cmd_id);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CMD_ID_INT,cmd_id);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_查询同步状态表
    public class ReqFuncrptL_2_69DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_69DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.69";
            CommonDTO.func_code = CommonDTO.function_code;
            sync_no = 0;
            sync_name = " ";
            target_db_name = " ";
            target_table_name = " ";
            source_db_name =  " ";
            source_table_name =  " ";
            sync_type = 0;
            sync_status = 0;
        }
 
        /// <summary>
        /// 同步编号
        /// </summary>
        public int sync_no { get; set; }
 
        /// <summary>
        /// 同步名称
        /// </summary>
        public String sync_name { get; set; }
 
        /// <summary>
        /// 目标数据库名称
        /// </summary>
        public String target_db_name { get; set; }
 
        /// <summary>
        /// 目标数据表名称
        /// </summary>
        public String target_table_name { get; set; }
 
        /// <summary>
        /// 源数据库名称
        /// </summary>
        public String source_db_name { get; set; }
 
        /// <summary>
        /// 源数据表名称
        /// </summary>
        public String source_table_name { get; set; }
 
        /// <summary>
        /// 同步类型
        /// </summary>
        public int sync_type { get; set; }
 
        /// <summary>
        /// 同步状态
        /// </summary>
        public int sync_status { get; set; }
 
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
 
            packer.AddField("sync_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("sync_name", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("target_db_name", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("target_table_name", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("source_db_name", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("source_table_name", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("sync_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("sync_status", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(sync_no);
            packer.AddStr(sync_name);
            packer.AddStr(target_db_name);
            packer.AddStr(target_table_name);
            packer.AddStr(source_db_name);
            packer.AddStr(source_table_name);
            packer.AddInt(sync_type);
            packer.AddInt(sync_status);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SYNC_NO_INT,sync_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_SYNC_NAME_STR,sync_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_DB_NAME_STR,target_db_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_TABLE_NAME_STR,target_table_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_SOURCE_DB_NAME_STR,source_db_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_SOURCE_TABLE_NAME_STR,source_table_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SYNC_TYPE_INT,sync_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SYNC_STATUS_INT,sync_status);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_同步并计算产品所有信息
    public class ReqFuncrptL_2_100DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_100DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.100";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            pd_no = 0;
            last_init_date = 0;
            init_date = 0;
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
        /// 上日初始化日期
        /// </summary>
        public int last_init_date { get; set; }
 
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date { get; set; }
 
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
            packer.AddField("last_init_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("init_date", ELDDATATYPE.LD_DATATYPE_INT);
 
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
            packer.AddInt(last_init_date);
            packer.AddInt(init_date);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LAST_INIT_DATE_INT,last_init_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_修改交易组附加属性
    public class ReqFuncrptL_2_101DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_101DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.101";
            CommonDTO.func_code = CommonDTO.function_code;
            pd_no = 0;
            exch_group_no = 0;
            first_asset = 0;
            first_amt = 0;
            curr_share = 0;
            strategy_type = 0;
            total_pre_fee = 0;
            remark_info = " ";
        }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// 原始资产
        /// </summary>
        public double first_asset { get; set; }
 
        /// <summary>
        /// 原始金额
        /// </summary>
        public double first_amt { get; set; }
 
        /// <summary>
        /// 当前份额
        /// </summary>
        public double curr_share { get; set; }
 
        /// <summary>
        /// 策略类型
        /// </summary>
        public int strategy_type { get; set; }
 
        /// <summary>
        /// 累计计提费用
        /// </summary>
        public double total_pre_fee { get; set; }
 
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
 
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_group_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("first_asset", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("first_amt", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("curr_share", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("strategy_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("total_pre_fee", ELDDATATYPE.LD_DATATYPE_DOUBLE);
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
 
            packer.AddInt(pd_no);
            packer.AddInt(exch_group_no);
            packer.AddDouble(first_asset);
            packer.AddDouble(first_amt);
            packer.AddDouble(curr_share);
            packer.AddInt(strategy_type);
            packer.AddDouble(total_pre_fee);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FIRST_ASSET_FLOAT,first_asset);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FIRST_AMT_FLOAT,first_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_SHARE_FLOAT,curr_share);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_TYPE_INT,strategy_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_PRE_FEE_FLOAT,total_pre_fee);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_查询产品区间统计
    public class ReqFuncrptL_2_151DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_151DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.151";
            CommonDTO.func_code = CommonDTO.function_code;
            pd_no = 0;
            curr_month = 0;
            region_type = 0;
        }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 当前月份
        /// </summary>
        public int curr_month { get; set; }
 
        /// <summary>
        /// 区间类型
        /// </summary>
        public int region_type { get; set; }
 
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
 
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("curr_month", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("region_type", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(pd_no);
            packer.AddInt(curr_month);
            packer.AddInt(region_type);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONTH_INT,curr_month);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REGION_TYPE_INT,region_type);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_查询指数区间统计
    public class ReqFuncrptL_2_152DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_152DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.152";
            CommonDTO.func_code = CommonDTO.function_code;
            indicator_id = 0;
            curr_month = 0;
            region_type = 0;
        }
 
        /// <summary>
        /// 指标编号
        /// </summary>
        public int indicator_id { get; set; }
 
        /// <summary>
        /// 当前月份
        /// </summary>
        public int curr_month { get; set; }
 
        /// <summary>
        /// 区间类型
        /// </summary>
        public int region_type { get; set; }
 
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
 
            packer.AddField("indicator_id", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("curr_month", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("region_type", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(indicator_id);
            packer.AddInt(curr_month);
            packer.AddInt(region_type);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDICATOR_ID_INT,indicator_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONTH_INT,curr_month);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REGION_TYPE_INT,region_type);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_查询产品指数区间统计
    public class ReqFuncrptL_2_153DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_153DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.153";
            CommonDTO.func_code = CommonDTO.function_code;
            pd_no = 0;
            curr_month = 0;
            region_type = 0;
        }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 当前月份
        /// </summary>
        public int curr_month { get; set; }
 
        /// <summary>
        /// 区间类型
        /// </summary>
        public int region_type { get; set; }
 
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
 
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("curr_month", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("region_type", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(pd_no);
            packer.AddInt(curr_month);
            packer.AddInt(region_type);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONTH_INT,curr_month);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REGION_TYPE_INT,region_type);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_查询产品区间指标
    public class ReqFuncrptL_2_154DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_154DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.154";
            CommonDTO.func_code = CommonDTO.function_code;
            pd_no = 0;
            curr_month = 0;
            region_type = 0;
            indicator_id = 0;
        }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 当前月份
        /// </summary>
        public int curr_month { get; set; }
 
        /// <summary>
        /// 区间类型
        /// </summary>
        public int region_type { get; set; }
 
        /// <summary>
        /// 指标编号
        /// </summary>
        public int indicator_id { get; set; }
 
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
 
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("curr_month", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("region_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("indicator_id", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(pd_no);
            packer.AddInt(curr_month);
            packer.AddInt(region_type);
            packer.AddInt(indicator_id);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONTH_INT,curr_month);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REGION_TYPE_INT,region_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDICATOR_ID_INT,indicator_id);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_查询指数区间指标
    public class ReqFuncrptL_2_155DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_155DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.155";
            CommonDTO.func_code = CommonDTO.function_code;
            stock_code = " ";
            exch_no = 0;
            curr_month = 0;
            region_type = 0;
            indicator_id = 0;
        }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 当前月份
        /// </summary>
        public int curr_month { get; set; }
 
        /// <summary>
        /// 区间类型
        /// </summary>
        public int region_type { get; set; }
 
        /// <summary>
        /// 指标编号
        /// </summary>
        public int indicator_id { get; set; }
 
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
 
            packer.AddField("stock_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("exch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("curr_month", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("region_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("indicator_id", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddStr(stock_code);
            packer.AddInt(exch_no);
            packer.AddInt(curr_month);
            packer.AddInt(region_type);
            packer.AddInt(indicator_id);
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

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONTH_INT,curr_month);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REGION_TYPE_INT,region_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDICATOR_ID_INT,indicator_id);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_查询产品业绩基准区间指标
    public class ReqFuncrptL_2_156DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_156DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.156";
            CommonDTO.func_code = CommonDTO.function_code;
            pd_no = 0;
            curr_month = 0;
            region_type = 0;
            indicator_id = 0;
        }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 当前月份
        /// </summary>
        public int curr_month { get; set; }
 
        /// <summary>
        /// 区间类型
        /// </summary>
        public int region_type { get; set; }
 
        /// <summary>
        /// 指标编号
        /// </summary>
        public int indicator_id { get; set; }
 
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
 
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("curr_month", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("region_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("indicator_id", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(pd_no);
            packer.AddInt(curr_month);
            packer.AddInt(region_type);
            packer.AddInt(indicator_id);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONTH_INT,curr_month);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REGION_TYPE_INT,region_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDICATOR_ID_INT,indicator_id);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_新增产品日净值
    public class ReqFuncrptL_2_157DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_157DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.157";
            CommonDTO.func_code = CommonDTO.function_code;
            init_date = 0;
            co_no = 0;
            pd_no = 0;
            share_net = 0;
            last_share_net = 0;
            share_net_total = 0;
            pre_share_net_total = 0;
            net_change = 0;
            grp_row = 0;
            nav_asset = 0;
            asset_market_value = 0;
            fund_share_total = 0;
            fund_asset_net = 0;
            pre_fee_share_net_total = 0;
            post_fee_share_net_total = 0;
            achieve_performance = 0;
            recover_param = 0;
            last_init_date = 0;
        }
 
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 份额净值
        /// </summary>
        public double share_net { get; set; }
 
        /// <summary>
        /// 上一份额净值
        /// </summary>
        public double last_share_net { get; set; }
 
        /// <summary>
        /// 份额累计净值
        /// </summary>
        public double share_net_total { get; set; }
 
        /// <summary>
        /// 昨日份额累计净值
        /// </summary>
        public double pre_share_net_total { get; set; }
 
        /// <summary>
        /// 净值变化
        /// </summary>
        public double net_change { get; set; }
 
        /// <summary>
        /// 分组序号
        /// </summary>
        public ulong grp_row { get; set; }
 
        /// <summary>
        /// 净资产
        /// </summary>
        public double nav_asset { get; set; }
 
        /// <summary>
        /// 资产市值
        /// </summary>
        public double asset_market_value { get; set; }
 
        /// <summary>
        /// 基金份额总额
        /// </summary>
        public double fund_share_total { get; set; }
 
        /// <summary>
        /// 基金资产净值
        /// </summary>
        public double fund_asset_net { get; set; }
 
        /// <summary>
        /// 费前累计净值
        /// </summary>
        public double pre_fee_share_net_total { get; set; }
 
        /// <summary>
        /// 费后累计净值
        /// </summary>
        public double post_fee_share_net_total { get; set; }
 
        /// <summary>
        /// 业绩报酬
        /// </summary>
        public double achieve_performance { get; set; }
 
        /// <summary>
        /// 复权系数
        /// </summary>
        public double recover_param { get; set; }
 
        /// <summary>
        /// 上日初始化日期
        /// </summary>
        public int last_init_date { get; set; }
 
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
 
            packer.AddField("init_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("share_net", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("last_share_net", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("share_net_total", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("pre_share_net_total", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("net_change", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("grp_row", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("nav_asset", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("asset_market_value", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("fund_share_total", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("fund_asset_net", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("pre_fee_share_net_total", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("post_fee_share_net_total", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("achieve_performance", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("recover_param", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("last_init_date", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(init_date);
            packer.AddInt(co_no);
            packer.AddInt(pd_no);
            packer.AddDouble(share_net);
            packer.AddDouble(last_share_net);
            packer.AddDouble(share_net_total);
            packer.AddDouble(pre_share_net_total);
            packer.AddDouble(net_change);
            packer.AddInt64(grp_row);
            packer.AddDouble(nav_asset);
            packer.AddDouble(asset_market_value);
            packer.AddDouble(fund_share_total);
            packer.AddDouble(fund_asset_net);
            packer.AddDouble(pre_fee_share_net_total);
            packer.AddDouble(post_fee_share_net_total);
            packer.AddDouble(achieve_performance);
            packer.AddDouble(recover_param);
            packer.AddInt(last_init_date);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SHARE_NET_FLOAT,share_net);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_SHARE_NET_FLOAT,last_share_net);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SHARE_NET_TOTAL_FLOAT,share_net_total);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SHARE_NET_TOTAL_FLOAT,pre_share_net_total);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NET_CHANGE_FLOAT,net_change);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_GRP_ROW_INT64,grp_row);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT,nav_asset);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_MARKET_VALUE_FLOAT,asset_market_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_SHARE_TOTAL_FLOAT,fund_share_total);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_ASSET_NET_FLOAT,fund_asset_net);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_FEE_SHARE_NET_TOTAL_FLOAT,pre_fee_share_net_total);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POST_FEE_SHARE_NET_TOTAL_FLOAT,post_fee_share_net_total);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACHIEVE_PERFORMANCE_FLOAT,achieve_performance);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RECOVER_PARAM_FLOAT,recover_param);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LAST_INIT_DATE_INT,last_init_date);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_删除产品日净值
    public class ReqFuncrptL_2_158DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_158DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.158";
            CommonDTO.func_code = CommonDTO.function_code;
            init_date = 0;
            co_no = 0;
            pd_no = 0;
        }
 
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
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
 
            packer.AddField("init_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(init_date);
            packer.AddInt(co_no);
            packer.AddInt(pd_no);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_修改产品日净值
    public class ReqFuncrptL_2_159DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_159DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.159";
            CommonDTO.func_code = CommonDTO.function_code;
            init_date = 0;
            co_no = 0;
            pd_no = 0;
            share_net = 0;
            last_share_net = 0;
            share_net_total = 0;
            pre_share_net_total = 0;
            net_change = 0;
            grp_row = 0;
            nav_asset = 0;
            asset_market_value = 0;
            fund_share_total = 0;
            fund_asset_net = 0;
            pre_fee_share_net_total = 0;
            post_fee_share_net_total = 0;
            achieve_performance = 0;
            recover_param = 0;
            last_init_date = 0;
        }
 
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 份额净值
        /// </summary>
        public double share_net { get; set; }
 
        /// <summary>
        /// 上一份额净值
        /// </summary>
        public double last_share_net { get; set; }
 
        /// <summary>
        /// 份额累计净值
        /// </summary>
        public double share_net_total { get; set; }
 
        /// <summary>
        /// 昨日份额累计净值
        /// </summary>
        public double pre_share_net_total { get; set; }
 
        /// <summary>
        /// 净值变化
        /// </summary>
        public double net_change { get; set; }
 
        /// <summary>
        /// 分组序号
        /// </summary>
        public ulong grp_row { get; set; }
 
        /// <summary>
        /// 净资产
        /// </summary>
        public double nav_asset { get; set; }
 
        /// <summary>
        /// 资产市值
        /// </summary>
        public double asset_market_value { get; set; }
 
        /// <summary>
        /// 基金份额总额
        /// </summary>
        public double fund_share_total { get; set; }
 
        /// <summary>
        /// 基金资产净值
        /// </summary>
        public double fund_asset_net { get; set; }
 
        /// <summary>
        /// 费前累计净值
        /// </summary>
        public double pre_fee_share_net_total { get; set; }
 
        /// <summary>
        /// 费后累计净值
        /// </summary>
        public double post_fee_share_net_total { get; set; }
 
        /// <summary>
        /// 业绩报酬
        /// </summary>
        public double achieve_performance { get; set; }
 
        /// <summary>
        /// 复权系数
        /// </summary>
        public double recover_param { get; set; }
 
        /// <summary>
        /// 上日初始化日期
        /// </summary>
        public int last_init_date { get; set; }
 
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
 
            packer.AddField("init_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("share_net", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("last_share_net", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("share_net_total", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("pre_share_net_total", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("net_change", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("grp_row", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("nav_asset", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("asset_market_value", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("fund_share_total", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("fund_asset_net", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("pre_fee_share_net_total", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("post_fee_share_net_total", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("achieve_performance", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("recover_param", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("last_init_date", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(init_date);
            packer.AddInt(co_no);
            packer.AddInt(pd_no);
            packer.AddDouble(share_net);
            packer.AddDouble(last_share_net);
            packer.AddDouble(share_net_total);
            packer.AddDouble(pre_share_net_total);
            packer.AddDouble(net_change);
            packer.AddInt64(grp_row);
            packer.AddDouble(nav_asset);
            packer.AddDouble(asset_market_value);
            packer.AddDouble(fund_share_total);
            packer.AddDouble(fund_asset_net);
            packer.AddDouble(pre_fee_share_net_total);
            packer.AddDouble(post_fee_share_net_total);
            packer.AddDouble(achieve_performance);
            packer.AddDouble(recover_param);
            packer.AddInt(last_init_date);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SHARE_NET_FLOAT,share_net);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_SHARE_NET_FLOAT,last_share_net);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SHARE_NET_TOTAL_FLOAT,share_net_total);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SHARE_NET_TOTAL_FLOAT,pre_share_net_total);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NET_CHANGE_FLOAT,net_change);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_GRP_ROW_INT64,grp_row);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT,nav_asset);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_MARKET_VALUE_FLOAT,asset_market_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_SHARE_TOTAL_FLOAT,fund_share_total);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_ASSET_NET_FLOAT,fund_asset_net);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_FEE_SHARE_NET_TOTAL_FLOAT,pre_fee_share_net_total);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POST_FEE_SHARE_NET_TOTAL_FLOAT,post_fee_share_net_total);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACHIEVE_PERFORMANCE_FLOAT,achieve_performance);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RECOVER_PARAM_FLOAT,recover_param);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LAST_INIT_DATE_INT,last_init_date);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_查询产品日净值
    public class ReqFuncrptL_2_160DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_160DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.160";
            CommonDTO.func_code = CommonDTO.function_code;
            qry_begin_date = 0;
            qry_end_date = 0;
            query_region_type = 0;
            pd_no = 0;
        }
 
        /// <summary>
        /// 查询开始日期
        /// </summary>
        public int qry_begin_date { get; set; }
 
        /// <summary>
        /// 查询结束日期
        /// </summary>
        public int qry_end_date { get; set; }
 
        /// <summary>
        /// 查询区间方式
        /// </summary>
        public int query_region_type { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
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
 
            packer.AddField("qry_begin_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("qry_end_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("query_region_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(qry_begin_date);
            packer.AddInt(qry_end_date);
            packer.AddInt(query_region_type);
            packer.AddInt(pd_no);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_BEGIN_DATE_INT,qry_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_END_DATE_INT,qry_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_REGION_TYPE_INT,query_region_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_初始化产品日收益率
    public class ReqFuncrptL_2_161DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_161DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.161";
            CommonDTO.func_code = CommonDTO.function_code;
            init_date = 0;
            co_no = 0;
            pd_no = 0;
        }
 
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
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
 
            packer.AddField("init_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(init_date);
            packer.AddInt(co_no);
            packer.AddInt(pd_no);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_初始化指数日收益率
    public class ReqFuncrptL_2_162DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_162DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.162";
            CommonDTO.func_code = CommonDTO.function_code;
            init_date = 0;
            stock_code_no = 0;
        }
 
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
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
 
            packer.AddField("init_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_code_no", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(init_date);
            packer.AddInt(stock_code_no);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_初始化产品周收益率
    public class ReqFuncrptL_2_163DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_163DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.163";
            CommonDTO.func_code = CommonDTO.function_code;
            init_date = 0;
            co_no = 0;
            pd_no = 0;
        }
 
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
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
 
            packer.AddField("init_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(init_date);
            packer.AddInt(co_no);
            packer.AddInt(pd_no);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_初始化指数周收益率
    public class ReqFuncrptL_2_164DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_164DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.164";
            CommonDTO.func_code = CommonDTO.function_code;
            init_date = 0;
            stock_code_no = 0;
        }
 
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
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
 
            packer.AddField("init_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_code_no", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(init_date);
            packer.AddInt(stock_code_no);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_初始化产品月收益率
    public class ReqFuncrptL_2_165DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_165DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.165";
            CommonDTO.func_code = CommonDTO.function_code;
            init_date = 0;
            co_no = 0;
            pd_no = 0;
        }
 
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
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
 
            packer.AddField("init_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(init_date);
            packer.AddInt(co_no);
            packer.AddInt(pd_no);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_初始化指数月收益率
    public class ReqFuncrptL_2_166DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_166DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.166";
            CommonDTO.func_code = CommonDTO.function_code;
            init_date = 0;
            stock_code_no = 0;
        }
 
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
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
 
            packer.AddField("init_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_code_no", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(init_date);
            packer.AddInt(stock_code_no);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_查询产品日收益率
    public class ReqFuncrptL_2_181DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_181DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.181";
            CommonDTO.func_code = CommonDTO.function_code;
            qry_begin_date = 0;
            qry_end_date = 0;
            co_no = 0;
            pd_no = 0;
        }
 
        /// <summary>
        /// 查询开始日期
        /// </summary>
        public int qry_begin_date { get; set; }
 
        /// <summary>
        /// 查询结束日期
        /// </summary>
        public int qry_end_date { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
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
 
            packer.AddField("qry_begin_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("qry_end_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(qry_begin_date);
            packer.AddInt(qry_end_date);
            packer.AddInt(co_no);
            packer.AddInt(pd_no);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_BEGIN_DATE_INT,qry_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_END_DATE_INT,qry_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_查询指数日收益率
    public class ReqFuncrptL_2_182DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_182DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.182";
            CommonDTO.func_code = CommonDTO.function_code;
            qry_begin_date = 0;
            qry_end_date = 0;
            stock_code_no = 0;
            stock_code = " ";
            exch_no = 0;
        }
 
        /// <summary>
        /// 查询开始日期
        /// </summary>
        public int qry_begin_date { get; set; }
 
        /// <summary>
        /// 查询结束日期
        /// </summary>
        public int qry_end_date { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
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
 
            packer.AddField("qry_begin_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("qry_end_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_code_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("exch_no", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(qry_begin_date);
            packer.AddInt(qry_end_date);
            packer.AddInt(stock_code_no);
            packer.AddStr(stock_code);
            packer.AddInt(exch_no);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_BEGIN_DATE_INT,qry_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_END_DATE_INT,qry_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_查询产品周收益率
    public class ReqFuncrptL_2_183DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_183DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.183";
            CommonDTO.func_code = CommonDTO.function_code;
            qry_begin_date = 0;
            qry_end_date = 0;
            co_no = 0;
            pd_no = 0;
        }
 
        /// <summary>
        /// 查询开始日期
        /// </summary>
        public int qry_begin_date { get; set; }
 
        /// <summary>
        /// 查询结束日期
        /// </summary>
        public int qry_end_date { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
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
 
            packer.AddField("qry_begin_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("qry_end_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(qry_begin_date);
            packer.AddInt(qry_end_date);
            packer.AddInt(co_no);
            packer.AddInt(pd_no);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_BEGIN_DATE_INT,qry_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_END_DATE_INT,qry_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_查询指数周收益率
    public class ReqFuncrptL_2_184DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_184DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.184";
            CommonDTO.func_code = CommonDTO.function_code;
            qry_begin_date = 0;
            qry_end_date = 0;
            stock_code_no = 0;
            stock_code = " ";
            exch_no = 0;
        }
 
        /// <summary>
        /// 查询开始日期
        /// </summary>
        public int qry_begin_date { get; set; }
 
        /// <summary>
        /// 查询结束日期
        /// </summary>
        public int qry_end_date { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
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
 
            packer.AddField("qry_begin_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("qry_end_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_code_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("exch_no", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(qry_begin_date);
            packer.AddInt(qry_end_date);
            packer.AddInt(stock_code_no);
            packer.AddStr(stock_code);
            packer.AddInt(exch_no);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_BEGIN_DATE_INT,qry_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_END_DATE_INT,qry_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_查询产品月收益率
    public class ReqFuncrptL_2_185DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_185DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.185";
            CommonDTO.func_code = CommonDTO.function_code;
            qry_begin_date = 0;
            qry_end_date = 0;
            co_no = 0;
            pd_no = 0;
        }
 
        /// <summary>
        /// 查询开始日期
        /// </summary>
        public int qry_begin_date { get; set; }
 
        /// <summary>
        /// 查询结束日期
        /// </summary>
        public int qry_end_date { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
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
 
            packer.AddField("qry_begin_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("qry_end_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(qry_begin_date);
            packer.AddInt(qry_end_date);
            packer.AddInt(co_no);
            packer.AddInt(pd_no);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_BEGIN_DATE_INT,qry_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_END_DATE_INT,qry_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_查询指数月收益率
    public class ReqFuncrptL_2_186DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_186DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.186";
            CommonDTO.func_code = CommonDTO.function_code;
            qry_begin_date = 0;
            qry_end_date = 0;
            stock_code_no = 0;
            stock_code = " ";
            exch_no = 0;
        }
 
        /// <summary>
        /// 查询开始日期
        /// </summary>
        public int qry_begin_date { get; set; }
 
        /// <summary>
        /// 查询结束日期
        /// </summary>
        public int qry_end_date { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
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
 
            packer.AddField("qry_begin_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("qry_end_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_code_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("exch_no", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(qry_begin_date);
            packer.AddInt(qry_end_date);
            packer.AddInt(stock_code_no);
            packer.AddStr(stock_code);
            packer.AddInt(exch_no);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_BEGIN_DATE_INT,qry_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_END_DATE_INT,qry_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_月报处理产品收益率
    public class ReqFuncrptL_2_201DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_201DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.201";
            CommonDTO.func_code = CommonDTO.function_code;
            curr_month = 0;
            indicator_id = 0;
            co_no = 0;
            pd_no = 0;
        }
 
        /// <summary>
        /// 当前月份
        /// </summary>
        public int curr_month { get; set; }
 
        /// <summary>
        /// 指标编号
        /// </summary>
        public int indicator_id { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
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
 
            packer.AddField("curr_month", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("indicator_id", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(curr_month);
            packer.AddInt(indicator_id);
            packer.AddInt(co_no);
            packer.AddInt(pd_no);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONTH_INT,curr_month);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDICATOR_ID_INT,indicator_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_月报处理指数收益率
    public class ReqFuncrptL_2_202DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_202DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.202";
            CommonDTO.func_code = CommonDTO.function_code;
            curr_month = 0;
            indicator_id = 0;
            co_no = 0;
            pd_no = 0;
        }
 
        /// <summary>
        /// 当前月份
        /// </summary>
        public int curr_month { get; set; }
 
        /// <summary>
        /// 指标编号
        /// </summary>
        public int indicator_id { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
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
 
            packer.AddField("curr_month", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("indicator_id", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(curr_month);
            packer.AddInt(indicator_id);
            packer.AddInt(co_no);
            packer.AddInt(pd_no);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONTH_INT,curr_month);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDICATOR_ID_INT,indicator_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_月报处理产品最大回撤
    public class ReqFuncrptL_2_203DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_203DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.203";
            CommonDTO.func_code = CommonDTO.function_code;
            curr_month = 0;
            indicator_id = 0;
            co_no = 0;
            pd_no = 0;
        }
 
        /// <summary>
        /// 当前月份
        /// </summary>
        public int curr_month { get; set; }
 
        /// <summary>
        /// 指标编号
        /// </summary>
        public int indicator_id { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
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
 
            packer.AddField("curr_month", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("indicator_id", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(curr_month);
            packer.AddInt(indicator_id);
            packer.AddInt(co_no);
            packer.AddInt(pd_no);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONTH_INT,curr_month);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDICATOR_ID_INT,indicator_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_月报处理指数最大回撤
    public class ReqFuncrptL_2_204DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_204DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.204";
            CommonDTO.func_code = CommonDTO.function_code;
            curr_month = 0;
            indicator_id = 0;
            co_no = 0;
            pd_no = 0;
        }
 
        /// <summary>
        /// 当前月份
        /// </summary>
        public int curr_month { get; set; }
 
        /// <summary>
        /// 指标编号
        /// </summary>
        public int indicator_id { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
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
 
            packer.AddField("curr_month", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("indicator_id", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(curr_month);
            packer.AddInt(indicator_id);
            packer.AddInt(co_no);
            packer.AddInt(pd_no);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONTH_INT,curr_month);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDICATOR_ID_INT,indicator_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_月报处理产品夏普比率
    public class ReqFuncrptL_2_205DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_205DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.205";
            CommonDTO.func_code = CommonDTO.function_code;
            curr_month = 0;
            indicator_id = 0;
            co_no = 0;
            pd_no = 0;
        }
 
        /// <summary>
        /// 当前月份
        /// </summary>
        public int curr_month { get; set; }
 
        /// <summary>
        /// 指标编号
        /// </summary>
        public int indicator_id { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
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
 
            packer.AddField("curr_month", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("indicator_id", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(curr_month);
            packer.AddInt(indicator_id);
            packer.AddInt(co_no);
            packer.AddInt(pd_no);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONTH_INT,curr_month);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDICATOR_ID_INT,indicator_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_月报处理指数夏普比率
    public class ReqFuncrptL_2_206DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_206DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.206";
            CommonDTO.func_code = CommonDTO.function_code;
            curr_month = 0;
            indicator_id = 0;
            co_no = 0;
            pd_no = 0;
        }
 
        /// <summary>
        /// 当前月份
        /// </summary>
        public int curr_month { get; set; }
 
        /// <summary>
        /// 指标编号
        /// </summary>
        public int indicator_id { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
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
 
            packer.AddField("curr_month", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("indicator_id", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(curr_month);
            packer.AddInt(indicator_id);
            packer.AddInt(co_no);
            packer.AddInt(pd_no);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONTH_INT,curr_month);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDICATOR_ID_INT,indicator_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_月报处理产品日胜率
    public class ReqFuncrptL_2_207DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_207DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.207";
            CommonDTO.func_code = CommonDTO.function_code;
            curr_month = 0;
            indicator_id = 0;
            co_no = 0;
            pd_no = 0;
        }
 
        /// <summary>
        /// 当前月份
        /// </summary>
        public int curr_month { get; set; }
 
        /// <summary>
        /// 指标编号
        /// </summary>
        public int indicator_id { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
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
 
            packer.AddField("curr_month", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("indicator_id", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(curr_month);
            packer.AddInt(indicator_id);
            packer.AddInt(co_no);
            packer.AddInt(pd_no);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONTH_INT,curr_month);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDICATOR_ID_INT,indicator_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_月报处理指数日胜率
    public class ReqFuncrptL_2_208DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_208DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.208";
            CommonDTO.func_code = CommonDTO.function_code;
            curr_month = 0;
            indicator_id = 0;
            co_no = 0;
            pd_no = 0;
        }
 
        /// <summary>
        /// 当前月份
        /// </summary>
        public int curr_month { get; set; }
 
        /// <summary>
        /// 指标编号
        /// </summary>
        public int indicator_id { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
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
 
            packer.AddField("curr_month", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("indicator_id", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(curr_month);
            packer.AddInt(indicator_id);
            packer.AddInt(co_no);
            packer.AddInt(pd_no);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONTH_INT,curr_month);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDICATOR_ID_INT,indicator_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_月报处理产品周胜率
    public class ReqFuncrptL_2_209DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_209DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.209";
            CommonDTO.func_code = CommonDTO.function_code;
            curr_month = 0;
            indicator_id = 0;
            co_no = 0;
            pd_no = 0;
        }
 
        /// <summary>
        /// 当前月份
        /// </summary>
        public int curr_month { get; set; }
 
        /// <summary>
        /// 指标编号
        /// </summary>
        public int indicator_id { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
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
 
            packer.AddField("curr_month", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("indicator_id", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(curr_month);
            packer.AddInt(indicator_id);
            packer.AddInt(co_no);
            packer.AddInt(pd_no);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONTH_INT,curr_month);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDICATOR_ID_INT,indicator_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_月报处理指数周胜率
    public class ReqFuncrptL_2_210DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_210DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.210";
            CommonDTO.func_code = CommonDTO.function_code;
            curr_month = 0;
            indicator_id = 0;
            co_no = 0;
            pd_no = 0;
        }
 
        /// <summary>
        /// 当前月份
        /// </summary>
        public int curr_month { get; set; }
 
        /// <summary>
        /// 指标编号
        /// </summary>
        public int indicator_id { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
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
 
            packer.AddField("curr_month", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("indicator_id", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(curr_month);
            packer.AddInt(indicator_id);
            packer.AddInt(co_no);
            packer.AddInt(pd_no);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONTH_INT,curr_month);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDICATOR_ID_INT,indicator_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_查询基金经理与交易员关系
    public class ReqFuncrptL_2_211DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_211DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.211";
            CommonDTO.func_code = CommonDTO.function_code;
            pd_no = 0;
            fund_manager_no = 0;
            trader_no = 0;
        }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 基金经理编号
        /// </summary>
        public int fund_manager_no { get; set; }
 
        /// <summary>
        /// 交易员编号
        /// </summary>
        public int trader_no { get; set; }
 
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
 
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("fund_manager_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("trader_no", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(pd_no);
            packer.AddInt(fund_manager_no);
            packer.AddInt(trader_no);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_NO_INT,fund_manager_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRADER_NO_INT,trader_no);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_查询产品资产
    public class ReqFuncrptL_2_301DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_301DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.301";
            CommonDTO.func_code = CommonDTO.function_code;
            qry_begin_date = 0;
            qry_end_date = 0;
            query_region_type = 0;
            pd_no = 0;
        }
 
        /// <summary>
        /// 查询开始日期
        /// </summary>
        public int qry_begin_date { get; set; }
 
        /// <summary>
        /// 查询结束日期
        /// </summary>
        public int qry_end_date { get; set; }
 
        /// <summary>
        /// 查询区间方式
        /// </summary>
        public int query_region_type { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
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
 
            packer.AddField("qry_begin_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("qry_end_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("query_region_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(qry_begin_date);
            packer.AddInt(qry_end_date);
            packer.AddInt(query_region_type);
            packer.AddInt(pd_no);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_BEGIN_DATE_INT,qry_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_END_DATE_INT,qry_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_REGION_TYPE_INT,query_region_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_查询产品持仓
    public class ReqFuncrptL_2_302DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_302DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.302";
            CommonDTO.func_code = CommonDTO.function_code;
            qry_begin_date = 0;
            qry_end_date = 0;
            query_region_type = 0;
            pd_no = 0;
            stock_code = " ";
            exch_no = 0;
            stock_code_no = 0;
            stock_type = 0;
            asset_type = 0;
        }
 
        /// <summary>
        /// 查询开始日期
        /// </summary>
        public int qry_begin_date { get; set; }
 
        /// <summary>
        /// 查询结束日期
        /// </summary>
        public int qry_end_date { get; set; }
 
        /// <summary>
        /// 查询区间方式
        /// </summary>
        public int query_region_type { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 证券类型
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// 资产类型
        /// </summary>
        public int asset_type { get; set; }
 
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
 
            packer.AddField("qry_begin_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("qry_end_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("query_region_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("exch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_code_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("asset_type", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(qry_begin_date);
            packer.AddInt(qry_end_date);
            packer.AddInt(query_region_type);
            packer.AddInt(pd_no);
            packer.AddStr(stock_code);
            packer.AddInt(exch_no);
            packer.AddInt(stock_code_no);
            packer.AddInt(stock_type);
            packer.AddInt(asset_type);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_BEGIN_DATE_INT,qry_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_END_DATE_INT,qry_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_REGION_TYPE_INT,query_region_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT,stock_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT,asset_type);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_查询产品行业
    public class ReqFuncrptL_2_303DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_303DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.303";
            CommonDTO.func_code = CommonDTO.function_code;
            qry_begin_date = 0;
            qry_end_date = 0;
            pd_no = 0;
            industry_std = 0;
            industry_classification = 0;
            industry_id = 0;
        }
 
        /// <summary>
        /// 查询开始日期
        /// </summary>
        public int qry_begin_date { get; set; }
 
        /// <summary>
        /// 查询结束日期
        /// </summary>
        public int qry_end_date { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 行业标准
        /// </summary>
        public int industry_std { get; set; }
 
        /// <summary>
        /// 行业级别
        /// </summary>
        public int industry_classification { get; set; }
 
        /// <summary>
        /// 行业编号
        /// </summary>
        public int industry_id { get; set; }
 
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
 
            packer.AddField("qry_begin_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("qry_end_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("industry_std", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("industry_classification", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("industry_id", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(qry_begin_date);
            packer.AddInt(qry_end_date);
            packer.AddInt(pd_no);
            packer.AddInt(industry_std);
            packer.AddInt(industry_classification);
            packer.AddInt(industry_id);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_BEGIN_DATE_INT,qry_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_END_DATE_INT,qry_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDUSTRY_STD_INT,industry_std);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDUSTRY_CLASSIFICATION_INT,industry_classification);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDUSTRY_ID_INT,industry_id);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_查询产品行业区间盈亏
    public class ReqFuncrptL_2_304DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_304DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.304";
            CommonDTO.func_code = CommonDTO.function_code;
            qry_begin_date = 0;
            qry_end_date = 0;
            pd_no = 0;
            industry_std = 0;
            industry_classification = 0;
            industry_id = 0;
        }
 
        /// <summary>
        /// 查询开始日期
        /// </summary>
        public int qry_begin_date { get; set; }
 
        /// <summary>
        /// 查询结束日期
        /// </summary>
        public int qry_end_date { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 行业标准
        /// </summary>
        public int industry_std { get; set; }
 
        /// <summary>
        /// 行业级别
        /// </summary>
        public int industry_classification { get; set; }
 
        /// <summary>
        /// 行业编号
        /// </summary>
        public int industry_id { get; set; }
 
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
 
            packer.AddField("qry_begin_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("qry_end_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("industry_std", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("industry_classification", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("industry_id", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(qry_begin_date);
            packer.AddInt(qry_end_date);
            packer.AddInt(pd_no);
            packer.AddInt(industry_std);
            packer.AddInt(industry_classification);
            packer.AddInt(industry_id);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_BEGIN_DATE_INT,qry_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_END_DATE_INT,qry_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDUSTRY_STD_INT,industry_std);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDUSTRY_CLASSIFICATION_INT,industry_classification);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDUSTRY_ID_INT,industry_id);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_查询汇总机构证券买卖成交
    public class ReqFuncrptL_2_305DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_305DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.305";
            CommonDTO.func_code = CommonDTO.function_code;
            qry_begin_date = 0;
            qry_end_date = 0;
            pd_no = 0;
            exch_no = 0;
            stock_code_no = 0;
            stock_type = 0;
            asset_type = 0;
        }
 
        /// <summary>
        /// 查询开始日期
        /// </summary>
        public int qry_begin_date { get; set; }
 
        /// <summary>
        /// 查询结束日期
        /// </summary>
        public int qry_end_date { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 证券类型
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// 资产类型
        /// </summary>
        public int asset_type { get; set; }
 
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
 
            packer.AddField("qry_begin_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("qry_end_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_code_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("asset_type", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(qry_begin_date);
            packer.AddInt(qry_end_date);
            packer.AddInt(pd_no);
            packer.AddInt(exch_no);
            packer.AddInt(stock_code_no);
            packer.AddInt(stock_type);
            packer.AddInt(asset_type);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_BEGIN_DATE_INT,qry_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_END_DATE_INT,qry_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT,stock_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT,asset_type);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_查询汇总产品证券买卖成交
    public class ReqFuncrptL_2_306DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_306DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.306";
            CommonDTO.func_code = CommonDTO.function_code;
            qry_begin_date = 0;
            qry_end_date = 0;
            pd_no = 0;
            exch_no = 0;
            stock_code_no = 0;
            stock_type = 0;
            asset_type = 0;
        }
 
        /// <summary>
        /// 查询开始日期
        /// </summary>
        public int qry_begin_date { get; set; }
 
        /// <summary>
        /// 查询结束日期
        /// </summary>
        public int qry_end_date { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 证券类型
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// 资产类型
        /// </summary>
        public int asset_type { get; set; }
 
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
 
            packer.AddField("qry_begin_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("qry_end_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_code_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("asset_type", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(qry_begin_date);
            packer.AddInt(qry_end_date);
            packer.AddInt(pd_no);
            packer.AddInt(exch_no);
            packer.AddInt(stock_code_no);
            packer.AddInt(stock_type);
            packer.AddInt(asset_type);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_BEGIN_DATE_INT,qry_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_END_DATE_INT,qry_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT,stock_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT,asset_type);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_查询汇总产品证券成交
    public class ReqFuncrptL_2_307DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_307DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.307";
            CommonDTO.func_code = CommonDTO.function_code;
            qry_begin_date = 0;
            qry_end_date = 0;
            pd_no = 0;
            stock_code = " ";
            exch_no = 0;
            stock_code_no = 0;
            stock_type = 0;
            asset_type = 0;
            order_dir = 0;
        }
 
        /// <summary>
        /// 查询开始日期
        /// </summary>
        public int qry_begin_date { get; set; }
 
        /// <summary>
        /// 查询结束日期
        /// </summary>
        public int qry_end_date { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 证券类型
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// 资产类型
        /// </summary>
        public int asset_type { get; set; }
 
        /// <summary>
        /// 订单方向
        /// </summary>
        public int order_dir { get; set; }
 
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
 
            packer.AddField("qry_begin_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("qry_end_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("exch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_code_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("asset_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("order_dir", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(qry_begin_date);
            packer.AddInt(qry_end_date);
            packer.AddInt(pd_no);
            packer.AddStr(stock_code);
            packer.AddInt(exch_no);
            packer.AddInt(stock_code_no);
            packer.AddInt(stock_type);
            packer.AddInt(asset_type);
            packer.AddInt(order_dir);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_BEGIN_DATE_INT,qry_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_END_DATE_INT,qry_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT,stock_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT,asset_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT,order_dir);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_查询区间汇总产品证券成交
    public class ReqFuncrptL_2_308DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_308DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.308";
            CommonDTO.func_code = CommonDTO.function_code;
            qry_begin_date = 0;
            qry_end_date = 0;
            query_region_type = 0;
            pd_no = 0;
            exch_no = 0;
            stock_code_no = 0;
            stock_type = 0;
            asset_type = 0;
            order_dir = 0;
        }
 
        /// <summary>
        /// 查询开始日期
        /// </summary>
        public int qry_begin_date { get; set; }
 
        /// <summary>
        /// 查询结束日期
        /// </summary>
        public int qry_end_date { get; set; }
 
        /// <summary>
        /// 查询区间方式
        /// </summary>
        public int query_region_type { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 证券类型
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// 资产类型
        /// </summary>
        public int asset_type { get; set; }
 
        /// <summary>
        /// 订单方向
        /// </summary>
        public int order_dir { get; set; }
 
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
 
            packer.AddField("qry_begin_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("qry_end_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("query_region_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_code_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("asset_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("order_dir", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(qry_begin_date);
            packer.AddInt(qry_end_date);
            packer.AddInt(query_region_type);
            packer.AddInt(pd_no);
            packer.AddInt(exch_no);
            packer.AddInt(stock_code_no);
            packer.AddInt(stock_type);
            packer.AddInt(asset_type);
            packer.AddInt(order_dir);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_BEGIN_DATE_INT,qry_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_END_DATE_INT,qry_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_REGION_TYPE_INT,query_region_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT,stock_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT,asset_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT,order_dir);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_查询汇总产品资金流水
    public class ReqFuncrptL_2_309DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_309DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.309";
            CommonDTO.func_code = CommonDTO.function_code;
            qry_begin_date = 0;
            qry_end_date = 0;
            pd_no = 0;
            busi_flag = 0;
        }
 
        /// <summary>
        /// 查询开始日期
        /// </summary>
        public int qry_begin_date { get; set; }
 
        /// <summary>
        /// 查询结束日期
        /// </summary>
        public int qry_end_date { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 业务标志
        /// </summary>
        public int busi_flag { get; set; }
 
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
 
            packer.AddField("qry_begin_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("qry_end_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("busi_flag", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(qry_begin_date);
            packer.AddInt(qry_end_date);
            packer.AddInt(pd_no);
            packer.AddInt(busi_flag);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_BEGIN_DATE_INT,qry_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_END_DATE_INT,qry_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT,busi_flag);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_查询区间汇总产品资金流水
    public class ReqFuncrptL_2_310DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_310DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.310";
            CommonDTO.func_code = CommonDTO.function_code;
            qry_begin_date = 0;
            qry_end_date = 0;
            pd_no = 0;
            busi_flag = 0;
        }
 
        /// <summary>
        /// 查询开始日期
        /// </summary>
        public int qry_begin_date { get; set; }
 
        /// <summary>
        /// 查询结束日期
        /// </summary>
        public int qry_end_date { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 业务标志
        /// </summary>
        public int busi_flag { get; set; }
 
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
 
            packer.AddField("qry_begin_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("qry_end_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("busi_flag", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(qry_begin_date);
            packer.AddInt(qry_end_date);
            packer.AddInt(pd_no);
            packer.AddInt(busi_flag);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_BEGIN_DATE_INT,qry_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_END_DATE_INT,qry_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT,busi_flag);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_查询月汇总产品持仓成交
    public class ReqFuncrptL_2_311DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_311DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.311";
            CommonDTO.func_code = CommonDTO.function_code;
            qry_begin_date = 0;
            qry_end_date = 0;
            pd_no = 0;
        }
 
        /// <summary>
        /// 查询开始日期
        /// </summary>
        public int qry_begin_date { get; set; }
 
        /// <summary>
        /// 查询结束日期
        /// </summary>
        public int qry_end_date { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
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
 
            packer.AddField("qry_begin_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("qry_end_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(qry_begin_date);
            packer.AddInt(qry_end_date);
            packer.AddInt(pd_no);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_BEGIN_DATE_INT,qry_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_END_DATE_INT,qry_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_查询结算提前待入账记录表
    public class ReqFuncrptL_2_312DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_312DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.312";
            CommonDTO.func_code = CommonDTO.function_code;
            qry_begin_date = 0;
            qry_end_date = 0;
            pd_no = 0;
            exch_group_no = 0;
            stock_code_no = 0;
            stock_type = 0;
            asset_type = 0;
            busi_flag = 0;
            act_record_flag = 0;
            acco_entry_flag = 0;
            entry_status = "0";
        }
 
        /// <summary>
        /// 查询开始日期
        /// </summary>
        public int qry_begin_date { get; set; }
 
        /// <summary>
        /// 查询结束日期
        /// </summary>
        public int qry_end_date { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 证券类型
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// 资产类型
        /// </summary>
        public int asset_type { get; set; }
 
        /// <summary>
        /// 业务标志
        /// </summary>
        public int busi_flag { get; set; }
 
        /// <summary>
        /// 账户登记标志
        /// </summary>
        public int act_record_flag { get; set; }
 
        /// <summary>
        /// 账户入账标志
        /// </summary>
        public int acco_entry_flag { get; set; }
 
        /// <summary>
        /// 入账状态
        /// </summary>
        public String entry_status { get; set; }
 
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
 
            packer.AddField("qry_begin_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("qry_end_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_group_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_code_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("asset_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("busi_flag", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("act_record_flag", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("acco_entry_flag", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("entry_status", ELDDATATYPE.LD_DATATYPE_STRING);
 
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
 
            packer.AddInt(qry_begin_date);
            packer.AddInt(qry_end_date);
            packer.AddInt(pd_no);
            packer.AddInt(exch_group_no);
            packer.AddInt(stock_code_no);
            packer.AddInt(stock_type);
            packer.AddInt(asset_type);
            packer.AddInt(busi_flag);
            packer.AddInt(act_record_flag);
            packer.AddInt(acco_entry_flag);
            packer.AddStr(entry_status);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_BEGIN_DATE_INT,qry_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_END_DATE_INT,qry_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT,stock_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT,asset_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT,busi_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ACT_RECORD_FLAG_INT,act_record_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_ENTRY_FLAG_INT,acco_entry_flag);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_STATUS_STR,entry_status);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_修改统计基金经理资产
    public class ReqFuncrptL_2_313DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_313DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.313";
            CommonDTO.func_code = CommonDTO.function_code;
            init_date = 0;
            co_no = 0;
            fund_manager_no = 0;
            remark_info = " ";
        }
 
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 基金经理编号
        /// </summary>
        public int fund_manager_no { get; set; }
 
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
 
            packer.AddField("init_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("fund_manager_no", ELDDATATYPE.LD_DATATYPE_INT);
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
 
            packer.AddInt(init_date);
            packer.AddInt(co_no);
            packer.AddInt(fund_manager_no);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_NO_INT,fund_manager_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_查询统计基金经理资产
    public class ReqFuncrptL_2_314DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_314DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.314";
            CommonDTO.func_code = CommonDTO.function_code;
            qry_begin_date = 0;
            qry_end_date = 0;
            query_region_type = 0;
            fund_manager_no = 0;
        }
 
        /// <summary>
        /// 查询开始日期
        /// </summary>
        public int qry_begin_date { get; set; }
 
        /// <summary>
        /// 查询结束日期
        /// </summary>
        public int qry_end_date { get; set; }
 
        /// <summary>
        /// 查询区间方式
        /// </summary>
        public int query_region_type { get; set; }
 
        /// <summary>
        /// 基金经理编号
        /// </summary>
        public int fund_manager_no { get; set; }
 
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
 
            packer.AddField("qry_begin_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("qry_end_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("query_region_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("fund_manager_no", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(qry_begin_date);
            packer.AddInt(qry_end_date);
            packer.AddInt(query_region_type);
            packer.AddInt(fund_manager_no);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_BEGIN_DATE_INT,qry_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_END_DATE_INT,qry_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_REGION_TYPE_INT,query_region_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_NO_INT,fund_manager_no);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_修改统计基金经理持仓
    public class ReqFuncrptL_2_315DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_315DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.315";
            CommonDTO.func_code = CommonDTO.function_code;
            init_date = 0;
            fund_manager_no = 0;
            stock_code_no = 0;
            remark_info = " ";
        }
 
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// 基金经理编号
        /// </summary>
        public int fund_manager_no { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
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
 
            packer.AddField("init_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("fund_manager_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_code_no", ELDDATATYPE.LD_DATATYPE_INT);
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
 
            packer.AddInt(init_date);
            packer.AddInt(fund_manager_no);
            packer.AddInt(stock_code_no);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_NO_INT,fund_manager_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_查询统计基金经理持仓
    public class ReqFuncrptL_2_316DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_316DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.316";
            CommonDTO.func_code = CommonDTO.function_code;
            qry_begin_date = 0;
            qry_end_date = 0;
            query_region_type = 0;
            fund_manager_no = 0;
            exch_no = 0;
            stock_code_no = 0;
            stock_type = 0;
            asset_type = 0;
        }
 
        /// <summary>
        /// 查询开始日期
        /// </summary>
        public int qry_begin_date { get; set; }
 
        /// <summary>
        /// 查询结束日期
        /// </summary>
        public int qry_end_date { get; set; }
 
        /// <summary>
        /// 查询区间方式
        /// </summary>
        public int query_region_type { get; set; }
 
        /// <summary>
        /// 基金经理编号
        /// </summary>
        public int fund_manager_no { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 证券类型
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// 资产类型
        /// </summary>
        public int asset_type { get; set; }
 
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
 
            packer.AddField("qry_begin_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("qry_end_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("query_region_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("fund_manager_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_code_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("asset_type", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(qry_begin_date);
            packer.AddInt(qry_end_date);
            packer.AddInt(query_region_type);
            packer.AddInt(fund_manager_no);
            packer.AddInt(exch_no);
            packer.AddInt(stock_code_no);
            packer.AddInt(stock_type);
            packer.AddInt(asset_type);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_BEGIN_DATE_INT,qry_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_END_DATE_INT,qry_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_REGION_TYPE_INT,query_region_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_NO_INT,fund_manager_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT,stock_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT,asset_type);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_新增机构业绩报告配置
    public class ReqFuncrptL_2_401DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_401DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.401";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            pd_no = 0;
            config_no = 0;
            config_name = " ";
            show_order = 0;
            remark_info = " ";
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
        /// 配置编号
        /// </summary>
        public ulong config_no { get; set; }
 
        /// <summary>
        /// 配置名称
        /// </summary>
        public String config_name { get; set; }
 
        /// <summary>
        /// 显示顺序
        /// </summary>
        public int show_order { get; set; }
 
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
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("config_no", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("config_name", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("show_order", ELDDATATYPE.LD_DATATYPE_INT);
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
            packer.AddInt(pd_no);
            packer.AddInt64(config_no);
            packer.AddStr(config_name);
            packer.AddInt(show_order);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_NO_INT64,config_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_NAME_STR,config_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SHOW_ORDER_INT,show_order);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_删除机构业绩报告配置
    public class ReqFuncrptL_2_402DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_402DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.402";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            pd_no = 0;
            config_no = 0;
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
        /// 配置编号
        /// </summary>
        public ulong config_no { get; set; }
 
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
            packer.AddField("config_no", ELDDATATYPE.LD_DATATYPE_LONG);
 
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
            packer.AddInt64(config_no);
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
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_NO_INT64,config_no);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_修改机构业绩报告配置
    public class ReqFuncrptL_2_403DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_403DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.403";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            pd_no = 0;
            config_no = 0;
            config_name = " ";
            show_order = 0;
            remark_info = " ";
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
        /// 配置编号
        /// </summary>
        public ulong config_no { get; set; }
 
        /// <summary>
        /// 配置名称
        /// </summary>
        public String config_name { get; set; }
 
        /// <summary>
        /// 显示顺序
        /// </summary>
        public int show_order { get; set; }
 
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
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("config_no", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("config_name", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("show_order", ELDDATATYPE.LD_DATATYPE_INT);
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
            packer.AddInt(pd_no);
            packer.AddInt64(config_no);
            packer.AddStr(config_name);
            packer.AddInt(show_order);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_NO_INT64,config_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_NAME_STR,config_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SHOW_ORDER_INT,show_order);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_查询机构业绩报告配置
    public class ReqFuncrptL_2_404DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_404DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.404";
            CommonDTO.func_code = CommonDTO.function_code;
            pd_no = 0;
            config_no = 0;
        }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 配置编号
        /// </summary>
        public ulong config_no { get; set; }
 
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
 
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("config_no", ELDDATATYPE.LD_DATATYPE_LONG);
 
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
 
            packer.AddInt(pd_no);
            packer.AddInt64(config_no);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_NO_INT64,config_no);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_新增产品业绩报告附加信息
    public class ReqFuncrptL_2_406DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_406DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.406";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            pd_no = 0;
            rpt_add_info = " ";
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
        /// 报告附加信息
        /// </summary>
        public String rpt_add_info { get; set; }
 
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
            packer.AddField("rpt_add_info", ELDDATATYPE.LD_DATATYPE_STRING);
 
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
            packer.AddStr(rpt_add_info);
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
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RPT_ADD_INFO_STR,rpt_add_info);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_删除产品业绩报告附加信息
    public class ReqFuncrptL_2_407DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_407DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.407";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            pd_no = 0;
        }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
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
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_修改产品业绩报告附加信息
    public class ReqFuncrptL_2_408DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_408DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.408";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            pd_no = 0;
            rpt_add_info = " ";
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
        /// 报告附加信息
        /// </summary>
        public String rpt_add_info { get; set; }
 
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
            packer.AddField("rpt_add_info", ELDDATATYPE.LD_DATATYPE_STRING);
 
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
            packer.AddStr(rpt_add_info);
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
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RPT_ADD_INFO_STR,rpt_add_info);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_查询产品业绩报告附加信息
    public class ReqFuncrptL_2_409DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_409DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.409";
            CommonDTO.func_code = CommonDTO.function_code;
            pd_no = 0;
        }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
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
 
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(pd_no);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_新增基金经理信息
    public class ReqFuncrptL_2_411DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_411DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.411";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            fund_manager_no = 0;
            fund_manager_name = " ";
            remark_info = " ";
        }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 基金经理编号
        /// </summary>
        public int fund_manager_no { get; set; }
 
        /// <summary>
        /// 基金经理名称
        /// </summary>
        public String fund_manager_name { get; set; }
 
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
            packer.AddField("fund_manager_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("fund_manager_name", ELDDATATYPE.LD_DATATYPE_STRING);
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
            packer.AddInt(fund_manager_no);
            packer.AddStr(fund_manager_name);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_NO_INT,fund_manager_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_NAME_STR,fund_manager_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_删除基金经理信息
    public class ReqFuncrptL_2_412DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_412DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.412";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            fund_manager_no = 0;
        }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 基金经理编号
        /// </summary>
        public int fund_manager_no { get; set; }
 
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
            packer.AddField("fund_manager_no", ELDDATATYPE.LD_DATATYPE_INT);
 
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
            packer.AddInt(fund_manager_no);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_NO_INT,fund_manager_no);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_修改基金经理信息
    public class ReqFuncrptL_2_413DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_413DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.413";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            fund_manager_no = 0;
            fund_manager_name = " ";
            remark_info = " ";
        }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 基金经理编号
        /// </summary>
        public int fund_manager_no { get; set; }
 
        /// <summary>
        /// 基金经理名称
        /// </summary>
        public String fund_manager_name { get; set; }
 
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
            packer.AddField("fund_manager_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("fund_manager_name", ELDDATATYPE.LD_DATATYPE_STRING);
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
            packer.AddInt(fund_manager_no);
            packer.AddStr(fund_manager_name);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_NO_INT,fund_manager_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_NAME_STR,fund_manager_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_查询基金经理信息
    public class ReqFuncrptL_2_414DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_414DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.414";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            fund_manager_no = 0;
        }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 基金经理编号
        /// </summary>
        public int fund_manager_no { get; set; }
 
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
            packer.AddField("fund_manager_no", ELDDATATYPE.LD_DATATYPE_INT);
 
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
            packer.AddInt(fund_manager_no);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_NO_INT,fund_manager_no);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_新增交易员信息
    public class ReqFuncrptL_2_416DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_416DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.416";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            fund_manager_no = 0;
            fund_manager_name = " ";
            remark_info = " ";
        }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 基金经理编号
        /// </summary>
        public int fund_manager_no { get; set; }
 
        /// <summary>
        /// 基金经理名称
        /// </summary>
        public String fund_manager_name { get; set; }
 
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
            packer.AddField("fund_manager_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("fund_manager_name", ELDDATATYPE.LD_DATATYPE_STRING);
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
            packer.AddInt(fund_manager_no);
            packer.AddStr(fund_manager_name);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_NO_INT,fund_manager_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_NAME_STR,fund_manager_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_删除交易员信息
    public class ReqFuncrptL_2_417DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_417DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.417";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            fund_manager_no = 0;
        }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 基金经理编号
        /// </summary>
        public int fund_manager_no { get; set; }
 
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
            packer.AddField("fund_manager_no", ELDDATATYPE.LD_DATATYPE_INT);
 
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
            packer.AddInt(fund_manager_no);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_NO_INT,fund_manager_no);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_修改交易员信息
    public class ReqFuncrptL_2_418DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_418DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.418";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            fund_manager_no = 0;
            fund_manager_name = " ";
            remark_info = " ";
        }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 基金经理编号
        /// </summary>
        public int fund_manager_no { get; set; }
 
        /// <summary>
        /// 基金经理名称
        /// </summary>
        public String fund_manager_name { get; set; }
 
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
            packer.AddField("fund_manager_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("fund_manager_name", ELDDATATYPE.LD_DATATYPE_STRING);
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
            packer.AddInt(fund_manager_no);
            packer.AddStr(fund_manager_name);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_NO_INT,fund_manager_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_NAME_STR,fund_manager_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_查询交易员信息
    public class ReqFuncrptL_2_419DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_419DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.419";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            fund_manager_no = 0;
        }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 基金经理编号
        /// </summary>
        public int fund_manager_no { get; set; }
 
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
            packer.AddField("fund_manager_no", ELDDATATYPE.LD_DATATYPE_INT);
 
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
            packer.AddInt(fund_manager_no);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_NO_INT,fund_manager_no);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_新增产品基金经理与交易员
    public class ReqFuncrptL_2_421DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_421DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.421";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            pd_no = 0;
            fund_manager_no = 0;
            fund_manager_name = " ";
            trader_no = 0;
            trader_name = " ";
            show_order = 0;
            remark_info = " ";
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
        /// 基金经理编号
        /// </summary>
        public int fund_manager_no { get; set; }
 
        /// <summary>
        /// 基金经理名称
        /// </summary>
        public String fund_manager_name { get; set; }
 
        /// <summary>
        /// 交易员编号
        /// </summary>
        public int trader_no { get; set; }
 
        /// <summary>
        /// 交易员名称
        /// </summary>
        public String trader_name { get; set; }
 
        /// <summary>
        /// 显示顺序
        /// </summary>
        public int show_order { get; set; }
 
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
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("fund_manager_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("fund_manager_name", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("trader_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("trader_name", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("show_order", ELDDATATYPE.LD_DATATYPE_INT);
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
            packer.AddInt(pd_no);
            packer.AddInt(fund_manager_no);
            packer.AddStr(fund_manager_name);
            packer.AddInt(trader_no);
            packer.AddStr(trader_name);
            packer.AddInt(show_order);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_NO_INT,fund_manager_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_NAME_STR,fund_manager_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRADER_NO_INT,trader_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TRADER_NAME_STR,trader_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SHOW_ORDER_INT,show_order);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_删除产品基金经理与交易员
    public class ReqFuncrptL_2_422DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_422DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.422";
            CommonDTO.func_code = CommonDTO.function_code;
            row_id = 0;
            co_no = 0;
            pd_no = 0;
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
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
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
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
 
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
            packer.AddInt(pd_no);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_修改产品基金经理与交易员
    public class ReqFuncrptL_2_423DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_423DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.423";
            CommonDTO.func_code = CommonDTO.function_code;
            row_id = 0;
            co_no = 0;
            pd_no = 0;
            fund_manager_no = 0;
            fund_manager_name = " ";
            trader_no = 0;
            trader_name = " ";
            show_order = 0;
            remark_info = " ";
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
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 基金经理编号
        /// </summary>
        public int fund_manager_no { get; set; }
 
        /// <summary>
        /// 基金经理名称
        /// </summary>
        public String fund_manager_name { get; set; }
 
        /// <summary>
        /// 交易员编号
        /// </summary>
        public int trader_no { get; set; }
 
        /// <summary>
        /// 交易员名称
        /// </summary>
        public String trader_name { get; set; }
 
        /// <summary>
        /// 显示顺序
        /// </summary>
        public int show_order { get; set; }
 
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
 
            packer.AddField("row_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("fund_manager_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("fund_manager_name", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("trader_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("trader_name", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("show_order", ELDDATATYPE.LD_DATATYPE_INT);
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
 
            packer.AddInt64(row_id);
            packer.AddInt(co_no);
            packer.AddInt(pd_no);
            packer.AddInt(fund_manager_no);
            packer.AddStr(fund_manager_name);
            packer.AddInt(trader_no);
            packer.AddStr(trader_name);
            packer.AddInt(show_order);
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

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_NO_INT,fund_manager_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_NAME_STR,fund_manager_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRADER_NO_INT,trader_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TRADER_NAME_STR,trader_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SHOW_ORDER_INT,show_order);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_查询产品基金经理与交易员
    public class ReqFuncrptL_2_424DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_424DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.424";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            fund_manager_no = 0;
        }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 基金经理编号
        /// </summary>
        public int fund_manager_no { get; set; }
 
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
            packer.AddField("fund_manager_no", ELDDATATYPE.LD_DATATYPE_INT);
 
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
            packer.AddInt(fund_manager_no);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_NO_INT,fund_manager_no);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_新增产品持仓导入外部交割流水
    public class ReqFuncrptL_2_425DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_425DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.425";
            CommonDTO.func_code = CommonDTO.function_code;
            init_date = 0;
            co_no = 0;
            pd_no = 0;
            exch_group_no = 0;
            asset_acco_no = 0;
            pass_no = 0;
            out_acco = " ";
            pass_deli_jour_no = 0;
            strike_date = 0;
            strike_time = 0;
            strike_no = " ";
            report_date = 0;
            report_time = 0;
            report_no = " ";
            crncy_type = "CNY";
            exch_no = 0;
            stock_acco = " ";
            stock_code = " ";
            order_dir = 0;
            order_price = 0;
            order_qty = 0;
            strike_price = 0;
            strike_qty = 0;
            strike_amt = 0;
            strike_num = 0;
            entry_end_qty = 0;
            entry_end_amt = 0;
            out_all_fee = 0;
            out_stamp_tax = 0;
            out_trans_fee = 0;
            out_brkage = 0;
            out_SEC_charges = 0;
            out_other_fee = 0;
            out_brkage_commis = 0;
            out_chann_commis = 0;
            out_divi_commis = 0;
            out_other_commis = 0;
            busi_flag = 0;
            remark_info = " ";
        }
 
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date { get; set; }
 
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
        /// 通道编号
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// 外部账号
        /// </summary>
        public String out_acco { get; set; }
 
        /// <summary>
        /// 通道交割流水号
        /// </summary>
        public ulong pass_deli_jour_no { get; set; }
 
        /// <summary>
        /// 成交日期
        /// </summary>
        public int strike_date { get; set; }
 
        /// <summary>
        /// 成交时间
        /// </summary>
        public int strike_time { get; set; }
 
        /// <summary>
        /// 成交编号
        /// </summary>
        public String strike_no { get; set; }
 
        /// <summary>
        /// 申报日期
        /// </summary>
        public int report_date { get; set; }
 
        /// <summary>
        /// 申报时间
        /// </summary>
        public int report_time { get; set; }
 
        /// <summary>
        /// 申报编号
        /// </summary>
        public String report_no { get; set; }
 
        /// <summary>
        /// 本币币种
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 股东代码
        /// </summary>
        public String stock_acco { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 订单方向
        /// </summary>
        public int order_dir { get; set; }
 
        /// <summary>
        /// 订单价格
        /// </summary>
        public double order_price { get; set; }
 
        /// <summary>
        /// 订单数量
        /// </summary>
        public double order_qty { get; set; }
 
        /// <summary>
        /// 成交价格
        /// </summary>
        public double strike_price { get; set; }
 
        /// <summary>
        /// 成交数量
        /// </summary>
        public double strike_qty { get; set; }
 
        /// <summary>
        /// 成交金额
        /// </summary>
        public double strike_amt { get; set; }
 
        /// <summary>
        /// 成交笔数
        /// </summary>
        public int strike_num { get; set; }
 
        /// <summary>
        /// 入账后数量
        /// </summary>
        public double entry_end_qty { get; set; }
 
        /// <summary>
        /// 入账后金额
        /// </summary>
        public double entry_end_amt { get; set; }
 
        /// <summary>
        /// 外部全部费用
        /// </summary>
        public double out_all_fee { get; set; }
 
        /// <summary>
        /// 外部印花税
        /// </summary>
        public double out_stamp_tax { get; set; }
 
        /// <summary>
        /// 外部过户费
        /// </summary>
        public double out_trans_fee { get; set; }
 
        /// <summary>
        /// 外部经手费
        /// </summary>
        public double out_brkage { get; set; }
 
        /// <summary>
        /// 外部证管费
        /// </summary>
        public double out_SEC_charges { get; set; }
 
        /// <summary>
        /// 外部其他费用
        /// </summary>
        public double out_other_fee { get; set; }
 
        /// <summary>
        /// 外部交易佣金
        /// </summary>
        public double out_brkage_commis { get; set; }
 
        /// <summary>
        /// 外部渠道佣金
        /// </summary>
        public double out_chann_commis { get; set; }
 
        /// <summary>
        /// 外部分成佣金
        /// </summary>
        public double out_divi_commis { get; set; }
 
        /// <summary>
        /// 外部其他佣金
        /// </summary>
        public double out_other_commis { get; set; }
 
        /// <summary>
        /// 业务标志
        /// </summary>
        public int busi_flag { get; set; }
 
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
 
            packer.AddField("init_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_group_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("asset_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pass_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("out_acco", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("pass_deli_jour_no", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("strike_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("strike_time", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("strike_no", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("report_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("report_time", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("report_no", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("crncy_type", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("exch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_acco", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("stock_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("order_dir", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("order_price", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("order_qty", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("strike_price", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("strike_qty", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("strike_amt", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("strike_num", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("entry_end_qty", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("entry_end_amt", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("out_all_fee", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("out_stamp_tax", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("out_trans_fee", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("out_brkage", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("out_SEC_charges", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("out_other_fee", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("out_brkage_commis", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("out_chann_commis", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("out_divi_commis", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("out_other_commis", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("busi_flag", ELDDATATYPE.LD_DATATYPE_INT);
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
 
            packer.AddInt(init_date);
            packer.AddInt(co_no);
            packer.AddInt(pd_no);
            packer.AddInt(exch_group_no);
            packer.AddInt(asset_acco_no);
            packer.AddInt(pass_no);
            packer.AddStr(out_acco);
            packer.AddInt64(pass_deli_jour_no);
            packer.AddInt(strike_date);
            packer.AddInt(strike_time);
            packer.AddStr(strike_no);
            packer.AddInt(report_date);
            packer.AddInt(report_time);
            packer.AddStr(report_no);
            packer.AddStr(crncy_type);
            packer.AddInt(exch_no);
            packer.AddStr(stock_acco);
            packer.AddStr(stock_code);
            packer.AddInt(order_dir);
            packer.AddDouble(order_price);
            packer.AddDouble(order_qty);
            packer.AddDouble(strike_price);
            packer.AddDouble(strike_qty);
            packer.AddDouble(strike_amt);
            packer.AddInt(strike_num);
            packer.AddDouble(entry_end_qty);
            packer.AddDouble(entry_end_amt);
            packer.AddDouble(out_all_fee);
            packer.AddDouble(out_stamp_tax);
            packer.AddDouble(out_trans_fee);
            packer.AddDouble(out_brkage);
            packer.AddDouble(out_SEC_charges);
            packer.AddDouble(out_other_fee);
            packer.AddDouble(out_brkage_commis);
            packer.AddDouble(out_chann_commis);
            packer.AddDouble(out_divi_commis);
            packer.AddDouble(out_other_commis);
            packer.AddInt(busi_flag);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR,out_acco);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_PASS_DELI_JOUR_NO_INT64,pass_deli_jour_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT,strike_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_TIME_INT,strike_time);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR,strike_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT,report_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_TIME_INT,report_time);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR,report_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR,stock_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT,order_dir);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT,order_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT,order_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_PRICE_FLOAT,strike_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT,strike_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT,strike_amt);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NUM_INT,strike_num);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_END_QTY_FLOAT,entry_end_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_END_AMT_FLOAT,entry_end_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ALL_FEE_FLOAT,out_all_fee);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_STAMP_TAX_FLOAT,out_stamp_tax);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_TRANS_FEE_FLOAT,out_trans_fee);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_BRKAGE_FLOAT,out_brkage);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_SEC_CHARGES_FLOAT,out_SEC_charges);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_OTHER_FEE_FLOAT,out_other_fee);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_BRKAGE_COMMIS_FLOAT,out_brkage_commis);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_CHANN_COMMIS_FLOAT,out_chann_commis);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_DIVI_COMMIS_FLOAT,out_divi_commis);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_OTHER_COMMIS_FLOAT,out_other_commis);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT,busi_flag);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_删除产品持仓导入外部交割流水
    public class ReqFuncrptL_2_426DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_426DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.426";
            CommonDTO.func_code = CommonDTO.function_code;
            qry_begin_date = 0;
            qry_end_date = 0;
            query_region_type = 0;
            pd_no = 0;
            exch_group_no = 0;
            asset_acco_no = 0;
            pass_no = 0;
            out_acco = " ";
        }
 
        /// <summary>
        /// 查询开始日期
        /// </summary>
        public int qry_begin_date { get; set; }
 
        /// <summary>
        /// 查询结束日期
        /// </summary>
        public int qry_end_date { get; set; }
 
        /// <summary>
        /// 查询区间方式
        /// </summary>
        public int query_region_type { get; set; }
 
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
        /// 通道编号
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// 外部账号
        /// </summary>
        public String out_acco { get; set; }
 
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
 
            packer.AddField("qry_begin_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("qry_end_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("query_region_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_group_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("asset_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pass_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("out_acco", ELDDATATYPE.LD_DATATYPE_STRING);
 
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
 
            packer.AddInt(qry_begin_date);
            packer.AddInt(qry_end_date);
            packer.AddInt(query_region_type);
            packer.AddInt(pd_no);
            packer.AddInt(exch_group_no);
            packer.AddInt(asset_acco_no);
            packer.AddInt(pass_no);
            packer.AddStr(out_acco);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_BEGIN_DATE_INT,qry_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_END_DATE_INT,qry_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_REGION_TYPE_INT,query_region_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR,out_acco);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_查询产品持仓导入外部交割流水
    public class ReqFuncrptL_2_428DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_428DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.428";
            CommonDTO.func_code = CommonDTO.function_code;
            qry_begin_date = 0;
            qry_end_date = 0;
            query_region_type = 0;
            pd_no = 0;
            exch_group_no = 0;
            asset_acco_no = 0;
            pass_no = 0;
            out_acco = " ";
        }
 
        /// <summary>
        /// 查询开始日期
        /// </summary>
        public int qry_begin_date { get; set; }
 
        /// <summary>
        /// 查询结束日期
        /// </summary>
        public int qry_end_date { get; set; }
 
        /// <summary>
        /// 查询区间方式
        /// </summary>
        public int query_region_type { get; set; }
 
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
        /// 通道编号
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// 外部账号
        /// </summary>
        public String out_acco { get; set; }
 
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
 
            packer.AddField("qry_begin_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("qry_end_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("query_region_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_group_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("asset_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pass_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("out_acco", ELDDATATYPE.LD_DATATYPE_STRING);
 
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
 
            packer.AddInt(qry_begin_date);
            packer.AddInt(qry_end_date);
            packer.AddInt(query_region_type);
            packer.AddInt(pd_no);
            packer.AddInt(exch_group_no);
            packer.AddInt(asset_acco_no);
            packer.AddInt(pass_no);
            packer.AddStr(out_acco);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_BEGIN_DATE_INT,qry_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_END_DATE_INT,qry_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_REGION_TYPE_INT,query_region_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR,out_acco);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_处理产品持仓导入外部交割流水
    public class ReqFuncrptL_2_429DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_429DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.429";
            CommonDTO.func_code = CommonDTO.function_code;
            qry_begin_date = 0;
            qry_end_date = 0;
            query_region_type = 0;
            co_no = 0;
            pd_no = 0;
            exch_group_no = 0;
            asset_acco_no = 0;
            pass_no = 0;
            out_acco = " ";
        }
 
        /// <summary>
        /// 查询开始日期
        /// </summary>
        public int qry_begin_date { get; set; }
 
        /// <summary>
        /// 查询结束日期
        /// </summary>
        public int qry_end_date { get; set; }
 
        /// <summary>
        /// 查询区间方式
        /// </summary>
        public int query_region_type { get; set; }
 
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
        /// 通道编号
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// 外部账号
        /// </summary>
        public String out_acco { get; set; }
 
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
 
            packer.AddField("qry_begin_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("qry_end_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("query_region_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_group_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("asset_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pass_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("out_acco", ELDDATATYPE.LD_DATATYPE_STRING);
 
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
 
            packer.AddInt(qry_begin_date);
            packer.AddInt(qry_end_date);
            packer.AddInt(query_region_type);
            packer.AddInt(co_no);
            packer.AddInt(pd_no);
            packer.AddInt(exch_group_no);
            packer.AddInt(asset_acco_no);
            packer.AddInt(pass_no);
            packer.AddStr(out_acco);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_BEGIN_DATE_INT,qry_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_END_DATE_INT,qry_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_REGION_TYPE_INT,query_region_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR,out_acco);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_修改月汇总产品持仓成交
    public class ReqFuncrptL_2_431DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_431DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.431";
            CommonDTO.func_code = CommonDTO.function_code;
            curr_month = 0;
            co_no = 0;
            pd_no = 0;
            month_apply_amt = 0;
            trade_deduct_amt = 0;
            remark_info = " ";
        }
 
        /// <summary>
        /// 当前月份
        /// </summary>
        public int curr_month { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 月净申购金额
        /// </summary>
        public double month_apply_amt { get; set; }
 
        /// <summary>
        /// 买卖扣除金额
        /// </summary>
        public double trade_deduct_amt { get; set; }
 
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
 
            packer.AddField("curr_month", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("month_apply_amt", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("trade_deduct_amt", ELDDATATYPE.LD_DATATYPE_DOUBLE);
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
 
            packer.AddInt(curr_month);
            packer.AddInt(co_no);
            packer.AddInt(pd_no);
            packer.AddDouble(month_apply_amt);
            packer.AddDouble(trade_deduct_amt);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONTH_INT,curr_month);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MONTH_APPLY_AMT_FLOAT,month_apply_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_DEDUCT_AMT_FLOAT,trade_deduct_amt);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_新增汇总产品证券成交
    public class ReqFuncrptL_2_436DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_436DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.436";
            CommonDTO.func_code = CommonDTO.function_code;
            init_date = 0;
            co_no = 0;
            pd_no = 0;
            stock_code_no = 0;
            asset_acco = " ";
            stock_acco = " ";
            exch_no = 0;
            invest_type = 0;
            stock_type = 0;
            stock_code = " ";
            stock_name = " ";
            crncy_type = "CNY";
            strike_aver_price = 0;
            order_dir = 0;
            order_price = 0;
            order_qty = 0;
            strike_qty = 0;
            strike_amt = 0;
            all_fee = 0;
            stamp_tax = 0;
            trans_fee = 0;
            brkage_fee = 0;
            SEC_charges = 0;
            other_fee = 0;
            trade_commis = 0;
            other_commis = 0;
            bond_accr_intrst = 0;
            net_price_flag = 0;
            bank_ib_member = " ";
            last_price = 0;
            quot_strike_qty = 0;
            quot_strike_amt = 0;
            sum_grp_cnt = 0;
            sum_grp_str = 0;
            busi_flag = 0;
            valid_flag = 0;
            remark_info = " ";
            src_data_type = 0;
        }
 
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 资产账户
        /// </summary>
        public String asset_acco { get; set; }
 
        /// <summary>
        /// 股东代码
        /// </summary>
        public String stock_acco { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 投资类型
        /// </summary>
        public int invest_type { get; set; }
 
        /// <summary>
        /// 证券类型
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 证券名称
        /// </summary>
        public String stock_name { get; set; }
 
        /// <summary>
        /// 本币币种
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// 成交均价
        /// </summary>
        public double strike_aver_price { get; set; }
 
        /// <summary>
        /// 订单方向
        /// </summary>
        public int order_dir { get; set; }
 
        /// <summary>
        /// 订单价格
        /// </summary>
        public double order_price { get; set; }
 
        /// <summary>
        /// 订单数量
        /// </summary>
        public double order_qty { get; set; }
 
        /// <summary>
        /// 成交数量
        /// </summary>
        public double strike_qty { get; set; }
 
        /// <summary>
        /// 成交金额
        /// </summary>
        public double strike_amt { get; set; }
 
        /// <summary>
        /// 全部费用
        /// </summary>
        public double all_fee { get; set; }
 
        /// <summary>
        /// 印花税
        /// </summary>
        public double stamp_tax { get; set; }
 
        /// <summary>
        /// 过户费
        /// </summary>
        public double trans_fee { get; set; }
 
        /// <summary>
        /// 经手费
        /// </summary>
        public double brkage_fee { get; set; }
 
        /// <summary>
        /// 证管费
        /// </summary>
        public double SEC_charges { get; set; }
 
        /// <summary>
        /// 其他费用
        /// </summary>
        public double other_fee { get; set; }
 
        /// <summary>
        /// 交易佣金
        /// </summary>
        public double trade_commis { get; set; }
 
        /// <summary>
        /// 其他佣金
        /// </summary>
        public double other_commis { get; set; }
 
        /// <summary>
        /// 债券计提利息
        /// </summary>
        public double bond_accr_intrst { get; set; }
 
        /// <summary>
        /// 净价标志
        /// </summary>
        public int net_price_flag { get; set; }
 
        /// <summary>
        /// 交易对手
        /// </summary>
        public String bank_ib_member { get; set; }
 
        /// <summary>
        /// 最新价
        /// </summary>
        public double last_price { get; set; }
 
        /// <summary>
        /// 行情成交数量
        /// </summary>
        public double quot_strike_qty { get; set; }
 
        /// <summary>
        /// 行情成交金额
        /// </summary>
        public double quot_strike_amt { get; set; }
 
        /// <summary>
        /// 汇总分组行数
        /// </summary>
        public int sum_grp_cnt { get; set; }
 
        /// <summary>
        /// 汇总分组内容
        /// </summary>
        public String sum_grp_str { get; set; }
 
        /// <summary>
        /// 业务标志
        /// </summary>
        public int busi_flag { get; set; }
 
        /// <summary>
        /// 有效标志
        /// </summary>
        public int valid_flag { get; set; }
 
        /// <summary>
        /// 备注信息
        /// </summary>
        public String remark_info { get; set; }
 
        /// <summary>
        /// 数据来源类型
        /// </summary>
        public int src_data_type { get; set; }
 
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
 
            packer.AddField("init_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_code_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("asset_acco", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("stock_acco", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("exch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("invest_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("stock_name", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("crncy_type", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("strike_aver_price", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("order_dir", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("order_price", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("order_qty", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("strike_qty", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("strike_amt", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("all_fee", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("stamp_tax", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("trans_fee", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("brkage_fee", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("SEC_charges", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("other_fee", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("trade_commis", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("other_commis", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("bond_accr_intrst", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("net_price_flag", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("bank_ib_member", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("last_price", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("quot_strike_qty", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("quot_strike_amt", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("sum_grp_cnt", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("sum_grp_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("busi_flag", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("valid_flag", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("remark_info", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("src_data_type", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(init_date);
            packer.AddInt(co_no);
            packer.AddInt(pd_no);
            packer.AddInt(stock_code_no);
            packer.AddStr(asset_acco);
            packer.AddStr(stock_acco);
            packer.AddInt(exch_no);
            packer.AddInt(invest_type);
            packer.AddInt(stock_type);
            packer.AddStr(stock_code);
            packer.AddStr(stock_name);
            packer.AddStr(crncy_type);
            packer.AddDouble(strike_aver_price);
            packer.AddInt(order_dir);
            packer.AddDouble(order_price);
            packer.AddDouble(order_qty);
            packer.AddDouble(strike_qty);
            packer.AddDouble(strike_amt);
            packer.AddDouble(all_fee);
            packer.AddDouble(stamp_tax);
            packer.AddDouble(trans_fee);
            packer.AddDouble(brkage_fee);
            packer.AddDouble(SEC_charges);
            packer.AddDouble(other_fee);
            packer.AddDouble(trade_commis);
            packer.AddDouble(other_commis);
            packer.AddDouble(bond_accr_intrst);
            packer.AddInt(net_price_flag);
            packer.AddStr(bank_ib_member);
            packer.AddDouble(last_price);
            packer.AddDouble(quot_strike_qty);
            packer.AddDouble(quot_strike_amt);
            packer.AddInt(sum_grp_cnt);
            packer.AddStr(sum_grp_str);
            packer.AddInt(busi_flag);
            packer.AddInt(valid_flag);
            packer.AddStr(remark_info);
            packer.AddInt(src_data_type);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STR,asset_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR,stock_acco);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INVEST_TYPE_INT,invest_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT,stock_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR,stock_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AVER_PRICE_FLOAT,strike_aver_price);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT,order_dir);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT,order_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT,order_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT,strike_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT,strike_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT,all_fee);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STAMP_TAX_FLOAT,stamp_tax);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_FEE_FLOAT,trans_fee);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BRKAGE_FEE_FLOAT,brkage_fee);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SEC_CHARGES_FLOAT,SEC_charges);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_FEE_FLOAT,other_fee);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_COMMIS_FLOAT,trade_commis);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_COMMIS_FLOAT,other_commis);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT,bond_accr_intrst);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLAG_INT,net_price_flag);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_BANK_IB_MEMBER_STR,bank_ib_member);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT,last_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_QUOT_STRIKE_QTY_FLOAT,quot_strike_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_QUOT_STRIKE_AMT_FLOAT,quot_strike_amt);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SUM_GRP_CNT_INT,sum_grp_cnt);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_SUM_GRP_STR_STR,sum_grp_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT,busi_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_VALID_FLAG_INT,valid_flag);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SRC_DATA_TYPE_INT,src_data_type);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_删除汇总产品证券成交
    public class ReqFuncrptL_2_437DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_437DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.437";
            CommonDTO.func_code = CommonDTO.function_code;
            row_id = 0;
            init_date = 0;
            co_no = 0;
            pd_no = 0;
            exch_group_no = 0;
            exch_no = 0;
            stock_acco_no = 0;
            stock_code_no = 0;
            stock_code = " ";
            stock_type = 0;
            asset_type = 0;
            busi_flag = 0;
            valid_flag = 0;
            src_data_type = 0;
        }
 
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date { get; set; }
 
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
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 股东代码编号
        /// </summary>
        public int stock_acco_no { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 证券类型
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// 资产类型
        /// </summary>
        public int asset_type { get; set; }
 
        /// <summary>
        /// 业务标志
        /// </summary>
        public int busi_flag { get; set; }
 
        /// <summary>
        /// 有效标志
        /// </summary>
        public int valid_flag { get; set; }
 
        /// <summary>
        /// 数据来源类型
        /// </summary>
        public int src_data_type { get; set; }
 
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
            packer.AddField("init_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_group_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_code_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("stock_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("asset_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("busi_flag", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("valid_flag", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("src_data_type", ELDDATATYPE.LD_DATATYPE_INT);
 
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
            packer.AddInt(init_date);
            packer.AddInt(co_no);
            packer.AddInt(pd_no);
            packer.AddInt(exch_group_no);
            packer.AddInt(exch_no);
            packer.AddInt(stock_acco_no);
            packer.AddInt(stock_code_no);
            packer.AddStr(stock_code);
            packer.AddInt(stock_type);
            packer.AddInt(asset_type);
            packer.AddInt(busi_flag);
            packer.AddInt(valid_flag);
            packer.AddInt(src_data_type);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT,stock_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT,stock_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT,asset_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT,busi_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_VALID_FLAG_INT,valid_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SRC_DATA_TYPE_INT,src_data_type);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_修改汇总产品证券成交
    public class ReqFuncrptL_2_438DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_438DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.438";
            CommonDTO.func_code = CommonDTO.function_code;
            row_id = 0;
            init_date = 0;
            co_no = 0;
            pd_no = 0;
            stock_code_no = 0;
            asset_acco = " ";
            stock_acco = " ";
            exch_no = 0;
            invest_type = 0;
            stock_type = 0;
            stock_code = " ";
            stock_name = " ";
            crncy_type = "CNY";
            strike_aver_price = 0;
            order_dir = 0;
            order_price = 0;
            order_qty = 0;
            strike_qty = 0;
            strike_amt = 0;
            all_fee = 0;
            stamp_tax = 0;
            trans_fee = 0;
            brkage_fee = 0;
            SEC_charges = 0;
            other_fee = 0;
            trade_commis = 0;
            other_commis = 0;
            bond_accr_intrst = 0;
            net_price_flag = 0;
            bank_ib_member = " ";
            last_price = 0;
            quot_strike_qty = 0;
            quot_strike_amt = 0;
            sum_grp_cnt = 0;
            sum_grp_str = 0;
            busi_flag = 0;
            valid_flag = 0;
            remark_info = " ";
            src_data_type = 0;
        }
 
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 资产账户
        /// </summary>
        public String asset_acco { get; set; }
 
        /// <summary>
        /// 股东代码
        /// </summary>
        public String stock_acco { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 投资类型
        /// </summary>
        public int invest_type { get; set; }
 
        /// <summary>
        /// 证券类型
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 证券名称
        /// </summary>
        public String stock_name { get; set; }
 
        /// <summary>
        /// 本币币种
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// 成交均价
        /// </summary>
        public double strike_aver_price { get; set; }
 
        /// <summary>
        /// 订单方向
        /// </summary>
        public int order_dir { get; set; }
 
        /// <summary>
        /// 订单价格
        /// </summary>
        public double order_price { get; set; }
 
        /// <summary>
        /// 订单数量
        /// </summary>
        public double order_qty { get; set; }
 
        /// <summary>
        /// 成交数量
        /// </summary>
        public double strike_qty { get; set; }
 
        /// <summary>
        /// 成交金额
        /// </summary>
        public double strike_amt { get; set; }
 
        /// <summary>
        /// 全部费用
        /// </summary>
        public double all_fee { get; set; }
 
        /// <summary>
        /// 印花税
        /// </summary>
        public double stamp_tax { get; set; }
 
        /// <summary>
        /// 过户费
        /// </summary>
        public double trans_fee { get; set; }
 
        /// <summary>
        /// 经手费
        /// </summary>
        public double brkage_fee { get; set; }
 
        /// <summary>
        /// 证管费
        /// </summary>
        public double SEC_charges { get; set; }
 
        /// <summary>
        /// 其他费用
        /// </summary>
        public double other_fee { get; set; }
 
        /// <summary>
        /// 交易佣金
        /// </summary>
        public double trade_commis { get; set; }
 
        /// <summary>
        /// 其他佣金
        /// </summary>
        public double other_commis { get; set; }
 
        /// <summary>
        /// 债券计提利息
        /// </summary>
        public double bond_accr_intrst { get; set; }
 
        /// <summary>
        /// 净价标志
        /// </summary>
        public int net_price_flag { get; set; }
 
        /// <summary>
        /// 交易对手
        /// </summary>
        public String bank_ib_member { get; set; }
 
        /// <summary>
        /// 最新价
        /// </summary>
        public double last_price { get; set; }
 
        /// <summary>
        /// 行情成交数量
        /// </summary>
        public double quot_strike_qty { get; set; }
 
        /// <summary>
        /// 行情成交金额
        /// </summary>
        public double quot_strike_amt { get; set; }
 
        /// <summary>
        /// 汇总分组行数
        /// </summary>
        public int sum_grp_cnt { get; set; }
 
        /// <summary>
        /// 汇总分组内容
        /// </summary>
        public String sum_grp_str { get; set; }
 
        /// <summary>
        /// 业务标志
        /// </summary>
        public int busi_flag { get; set; }
 
        /// <summary>
        /// 有效标志
        /// </summary>
        public int valid_flag { get; set; }
 
        /// <summary>
        /// 备注信息
        /// </summary>
        public String remark_info { get; set; }
 
        /// <summary>
        /// 数据来源类型
        /// </summary>
        public int src_data_type { get; set; }
 
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
            packer.AddField("init_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_code_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("asset_acco", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("stock_acco", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("exch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("invest_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("stock_name", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("crncy_type", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("strike_aver_price", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("order_dir", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("order_price", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("order_qty", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("strike_qty", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("strike_amt", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("all_fee", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("stamp_tax", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("trans_fee", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("brkage_fee", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("SEC_charges", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("other_fee", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("trade_commis", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("other_commis", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("bond_accr_intrst", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("net_price_flag", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("bank_ib_member", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("last_price", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("quot_strike_qty", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("quot_strike_amt", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("sum_grp_cnt", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("sum_grp_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("busi_flag", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("valid_flag", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("remark_info", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("src_data_type", ELDDATATYPE.LD_DATATYPE_INT);
 
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
            packer.AddInt(init_date);
            packer.AddInt(co_no);
            packer.AddInt(pd_no);
            packer.AddInt(stock_code_no);
            packer.AddStr(asset_acco);
            packer.AddStr(stock_acco);
            packer.AddInt(exch_no);
            packer.AddInt(invest_type);
            packer.AddInt(stock_type);
            packer.AddStr(stock_code);
            packer.AddStr(stock_name);
            packer.AddStr(crncy_type);
            packer.AddDouble(strike_aver_price);
            packer.AddInt(order_dir);
            packer.AddDouble(order_price);
            packer.AddDouble(order_qty);
            packer.AddDouble(strike_qty);
            packer.AddDouble(strike_amt);
            packer.AddDouble(all_fee);
            packer.AddDouble(stamp_tax);
            packer.AddDouble(trans_fee);
            packer.AddDouble(brkage_fee);
            packer.AddDouble(SEC_charges);
            packer.AddDouble(other_fee);
            packer.AddDouble(trade_commis);
            packer.AddDouble(other_commis);
            packer.AddDouble(bond_accr_intrst);
            packer.AddInt(net_price_flag);
            packer.AddStr(bank_ib_member);
            packer.AddDouble(last_price);
            packer.AddDouble(quot_strike_qty);
            packer.AddDouble(quot_strike_amt);
            packer.AddInt(sum_grp_cnt);
            packer.AddStr(sum_grp_str);
            packer.AddInt(busi_flag);
            packer.AddInt(valid_flag);
            packer.AddStr(remark_info);
            packer.AddInt(src_data_type);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STR,asset_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR,stock_acco);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INVEST_TYPE_INT,invest_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT,stock_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR,stock_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AVER_PRICE_FLOAT,strike_aver_price);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT,order_dir);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT,order_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT,order_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT,strike_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT,strike_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT,all_fee);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STAMP_TAX_FLOAT,stamp_tax);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_FEE_FLOAT,trans_fee);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BRKAGE_FEE_FLOAT,brkage_fee);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SEC_CHARGES_FLOAT,SEC_charges);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_FEE_FLOAT,other_fee);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_COMMIS_FLOAT,trade_commis);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_COMMIS_FLOAT,other_commis);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT,bond_accr_intrst);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLAG_INT,net_price_flag);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_BANK_IB_MEMBER_STR,bank_ib_member);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT,last_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_QUOT_STRIKE_QTY_FLOAT,quot_strike_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_QUOT_STRIKE_AMT_FLOAT,quot_strike_amt);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SUM_GRP_CNT_INT,sum_grp_cnt);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_SUM_GRP_STR_STR,sum_grp_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT,busi_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_VALID_FLAG_INT,valid_flag);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SRC_DATA_TYPE_INT,src_data_type);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_新增结算提前待入账记录表
    public class ReqFuncrptL_2_441DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_441DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.441";
            CommonDTO.func_code = CommonDTO.function_code;
            init_date = 0;
            co_no = 0;
            pd_no = 0;
            pd_name = " ";
            exch_group_no = 0;
            exch_no = 0;
            stock_acco_no = 0;
            stock_code_no = 0;
            stock_code = " ";
            stock_name = " ";
            asset_acco_no = 0;
            crncy_type = "CNY";
            exch_crncy_type = "CNY";
            exch_rate = 0;
            trade_code_no = 0;
            target_code_no = 0;
            stock_type = 0;
            asset_type = 0;
            pre_entry_qty = 0;
            pre_entry_amt = 0;
            impawn_ratio = 0;
            bond_accr_intrst = 0;
            busi_flag = 0;
            act_record_flag = 0;
            acco_entry_flag = 0;
            entry_money_jour_no = 0;
            entry_status = "0";
            reg_date = 0;
            arrive_date = 0;
            begin_trade_date = 0;
            remark_info = " ";
            src_data_type = 0;
        }
 
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 产品名称
        /// </summary>
        public String pd_name { get; set; }
 
        /// <summary>
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 股东代码编号
        /// </summary>
        public int stock_acco_no { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 证券名称
        /// </summary>
        public String stock_name { get; set; }
 
        /// <summary>
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// 本币币种
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// 交易币种
        /// </summary>
        public String exch_crncy_type { get; set; }
 
        /// <summary>
        /// 汇率
        /// </summary>
        public double exch_rate { get; set; }
 
        /// <summary>
        /// 交易代码编号
        /// </summary>
        public int trade_code_no { get; set; }
 
        /// <summary>
        /// 标的代码编号
        /// </summary>
        public int target_code_no { get; set; }
 
        /// <summary>
        /// 证券类型
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// 资产类型
        /// </summary>
        public int asset_type { get; set; }
 
        /// <summary>
        /// 待入账数量
        /// </summary>
        public double pre_entry_qty { get; set; }
 
        /// <summary>
        /// 待入账金额
        /// </summary>
        public double pre_entry_amt { get; set; }
 
        /// <summary>
        /// 质押比例
        /// </summary>
        public double impawn_ratio { get; set; }
 
        /// <summary>
        /// 债券计提利息
        /// </summary>
        public double bond_accr_intrst { get; set; }
 
        /// <summary>
        /// 业务标志
        /// </summary>
        public int busi_flag { get; set; }
 
        /// <summary>
        /// 账户登记标志
        /// </summary>
        public int act_record_flag { get; set; }
 
        /// <summary>
        /// 账户入账标志
        /// </summary>
        public int acco_entry_flag { get; set; }
 
        /// <summary>
        /// 入账资金流水号
        /// </summary>
        public ulong entry_money_jour_no { get; set; }
 
        /// <summary>
        /// 入账状态
        /// </summary>
        public String entry_status { get; set; }
 
        /// <summary>
        /// 登记日期
        /// </summary>
        public int reg_date { get; set; }
 
        /// <summary>
        /// 到账日期
        /// </summary>
        public int arrive_date { get; set; }
 
        /// <summary>
        /// 上市日期
        /// </summary>
        public int begin_trade_date { get; set; }
 
        /// <summary>
        /// 备注信息
        /// </summary>
        public String remark_info { get; set; }
 
        /// <summary>
        /// 数据来源类型
        /// </summary>
        public int src_data_type { get; set; }
 
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
 
            packer.AddField("init_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_name", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("exch_group_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_code_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("stock_name", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("asset_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("crncy_type", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("exch_crncy_type", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("exch_rate", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("trade_code_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("target_code_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("asset_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pre_entry_qty", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("pre_entry_amt", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("impawn_ratio", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("bond_accr_intrst", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("busi_flag", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("act_record_flag", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("acco_entry_flag", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("entry_money_jour_no", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("entry_status", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("reg_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("arrive_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("begin_trade_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("remark_info", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("src_data_type", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(init_date);
            packer.AddInt(co_no);
            packer.AddInt(pd_no);
            packer.AddStr(pd_name);
            packer.AddInt(exch_group_no);
            packer.AddInt(exch_no);
            packer.AddInt(stock_acco_no);
            packer.AddInt(stock_code_no);
            packer.AddStr(stock_code);
            packer.AddStr(stock_name);
            packer.AddInt(asset_acco_no);
            packer.AddStr(crncy_type);
            packer.AddStr(exch_crncy_type);
            packer.AddDouble(exch_rate);
            packer.AddInt(trade_code_no);
            packer.AddInt(target_code_no);
            packer.AddInt(stock_type);
            packer.AddInt(asset_type);
            packer.AddDouble(pre_entry_qty);
            packer.AddDouble(pre_entry_amt);
            packer.AddDouble(impawn_ratio);
            packer.AddDouble(bond_accr_intrst);
            packer.AddInt(busi_flag);
            packer.AddInt(act_record_flag);
            packer.AddInt(acco_entry_flag);
            packer.AddInt64(entry_money_jour_no);
            packer.AddStr(entry_status);
            packer.AddInt(reg_date);
            packer.AddInt(arrive_date);
            packer.AddInt(begin_trade_date);
            packer.AddStr(remark_info);
            packer.AddInt(src_data_type);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR,pd_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT,stock_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR,stock_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR,exch_crncy_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_RATE_FLOAT,exch_rate);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_NO_INT,trade_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_NO_INT,target_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT,stock_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT,asset_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ENTRY_QTY_FLOAT,pre_entry_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ENTRY_AMT_FLOAT,pre_entry_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_IMPAWN_RATIO_FLOAT,impawn_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT,bond_accr_intrst);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT,busi_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ACT_RECORD_FLAG_INT,act_record_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_ENTRY_FLAG_INT,acco_entry_flag);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_MONEY_JOUR_NO_INT64,entry_money_jour_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_STATUS_STR,entry_status);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REG_DATE_INT,reg_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ARRIVE_DATE_INT,arrive_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TRADE_DATE_INT,begin_trade_date);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SRC_DATA_TYPE_INT,src_data_type);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_删除结算提前待入账记录表
    public class ReqFuncrptL_2_442DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_442DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.442";
            CommonDTO.func_code = CommonDTO.function_code;
            row_id = 0;
            init_date = 0;
            co_no = 0;
            pd_no = 0;
            exch_group_no = 0;
            exch_no = 0;
            stock_acco_no = 0;
            stock_code_no = 0;
            stock_code = " ";
            stock_type = 0;
            asset_type = 0;
            busi_flag = 0;
            act_record_flag = 0;
            src_data_type = 0;
        }
 
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date { get; set; }
 
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
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 股东代码编号
        /// </summary>
        public int stock_acco_no { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 证券类型
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// 资产类型
        /// </summary>
        public int asset_type { get; set; }
 
        /// <summary>
        /// 业务标志
        /// </summary>
        public int busi_flag { get; set; }
 
        /// <summary>
        /// 账户登记标志
        /// </summary>
        public int act_record_flag { get; set; }
 
        /// <summary>
        /// 数据来源类型
        /// </summary>
        public int src_data_type { get; set; }
 
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
            packer.AddField("init_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_group_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_code_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("stock_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("asset_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("busi_flag", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("act_record_flag", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("src_data_type", ELDDATATYPE.LD_DATATYPE_INT);
 
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
            packer.AddInt(init_date);
            packer.AddInt(co_no);
            packer.AddInt(pd_no);
            packer.AddInt(exch_group_no);
            packer.AddInt(exch_no);
            packer.AddInt(stock_acco_no);
            packer.AddInt(stock_code_no);
            packer.AddStr(stock_code);
            packer.AddInt(stock_type);
            packer.AddInt(asset_type);
            packer.AddInt(busi_flag);
            packer.AddInt(act_record_flag);
            packer.AddInt(src_data_type);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT,stock_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT,stock_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT,asset_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT,busi_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ACT_RECORD_FLAG_INT,act_record_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SRC_DATA_TYPE_INT,src_data_type);
 
            return fastMsg;
        }
    }

    //逻辑_报表_报表数据_修改结算提前待入账记录表
    public class ReqFuncrptL_2_443DTO : ReqBaseDTO
    {
        public ReqFuncrptL_2_443DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rptL.2.443";
            CommonDTO.func_code = CommonDTO.function_code;
            row_id = 0;
            init_date = 0;
            co_no = 0;
            pd_no = 0;
            pd_name = " ";
            exch_group_no = 0;
            exch_no = 0;
            stock_acco_no = 0;
            stock_code_no = 0;
            stock_code = " ";
            stock_name = " ";
            asset_acco_no = 0;
            crncy_type = "CNY";
            exch_crncy_type = "CNY";
            exch_rate = 0;
            trade_code_no = 0;
            target_code_no = 0;
            stock_type = 0;
            asset_type = 0;
            pre_entry_qty = 0;
            pre_entry_amt = 0;
            impawn_ratio = 0;
            bond_accr_intrst = 0;
            busi_flag = 0;
            act_record_flag = 0;
            acco_entry_flag = 0;
            entry_money_jour_no = 0;
            entry_status = "0";
            reg_date = 0;
            arrive_date = 0;
            begin_trade_date = 0;
            remark_info = " ";
            src_data_type = 0;
        }
 
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 产品名称
        /// </summary>
        public String pd_name { get; set; }
 
        /// <summary>
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 股东代码编号
        /// </summary>
        public int stock_acco_no { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 证券名称
        /// </summary>
        public String stock_name { get; set; }
 
        /// <summary>
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// 本币币种
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// 交易币种
        /// </summary>
        public String exch_crncy_type { get; set; }
 
        /// <summary>
        /// 汇率
        /// </summary>
        public double exch_rate { get; set; }
 
        /// <summary>
        /// 交易代码编号
        /// </summary>
        public int trade_code_no { get; set; }
 
        /// <summary>
        /// 标的代码编号
        /// </summary>
        public int target_code_no { get; set; }
 
        /// <summary>
        /// 证券类型
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// 资产类型
        /// </summary>
        public int asset_type { get; set; }
 
        /// <summary>
        /// 待入账数量
        /// </summary>
        public double pre_entry_qty { get; set; }
 
        /// <summary>
        /// 待入账金额
        /// </summary>
        public double pre_entry_amt { get; set; }
 
        /// <summary>
        /// 质押比例
        /// </summary>
        public double impawn_ratio { get; set; }
 
        /// <summary>
        /// 债券计提利息
        /// </summary>
        public double bond_accr_intrst { get; set; }
 
        /// <summary>
        /// 业务标志
        /// </summary>
        public int busi_flag { get; set; }
 
        /// <summary>
        /// 账户登记标志
        /// </summary>
        public int act_record_flag { get; set; }
 
        /// <summary>
        /// 账户入账标志
        /// </summary>
        public int acco_entry_flag { get; set; }
 
        /// <summary>
        /// 入账资金流水号
        /// </summary>
        public ulong entry_money_jour_no { get; set; }
 
        /// <summary>
        /// 入账状态
        /// </summary>
        public String entry_status { get; set; }
 
        /// <summary>
        /// 登记日期
        /// </summary>
        public int reg_date { get; set; }
 
        /// <summary>
        /// 到账日期
        /// </summary>
        public int arrive_date { get; set; }
 
        /// <summary>
        /// 上市日期
        /// </summary>
        public int begin_trade_date { get; set; }
 
        /// <summary>
        /// 备注信息
        /// </summary>
        public String remark_info { get; set; }
 
        /// <summary>
        /// 数据来源类型
        /// </summary>
        public int src_data_type { get; set; }
 
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
            packer.AddField("init_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_name", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("exch_group_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_code_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("stock_name", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("asset_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("crncy_type", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("exch_crncy_type", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("exch_rate", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("trade_code_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("target_code_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("asset_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pre_entry_qty", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("pre_entry_amt", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("impawn_ratio", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("bond_accr_intrst", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("busi_flag", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("act_record_flag", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("acco_entry_flag", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("entry_money_jour_no", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("entry_status", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("reg_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("arrive_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("begin_trade_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("remark_info", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("src_data_type", ELDDATATYPE.LD_DATATYPE_INT);
 
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
            packer.AddInt(init_date);
            packer.AddInt(co_no);
            packer.AddInt(pd_no);
            packer.AddStr(pd_name);
            packer.AddInt(exch_group_no);
            packer.AddInt(exch_no);
            packer.AddInt(stock_acco_no);
            packer.AddInt(stock_code_no);
            packer.AddStr(stock_code);
            packer.AddStr(stock_name);
            packer.AddInt(asset_acco_no);
            packer.AddStr(crncy_type);
            packer.AddStr(exch_crncy_type);
            packer.AddDouble(exch_rate);
            packer.AddInt(trade_code_no);
            packer.AddInt(target_code_no);
            packer.AddInt(stock_type);
            packer.AddInt(asset_type);
            packer.AddDouble(pre_entry_qty);
            packer.AddDouble(pre_entry_amt);
            packer.AddDouble(impawn_ratio);
            packer.AddDouble(bond_accr_intrst);
            packer.AddInt(busi_flag);
            packer.AddInt(act_record_flag);
            packer.AddInt(acco_entry_flag);
            packer.AddInt64(entry_money_jour_no);
            packer.AddStr(entry_status);
            packer.AddInt(reg_date);
            packer.AddInt(arrive_date);
            packer.AddInt(begin_trade_date);
            packer.AddStr(remark_info);
            packer.AddInt(src_data_type);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR,pd_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT,stock_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR,stock_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR,exch_crncy_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_RATE_FLOAT,exch_rate);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_NO_INT,trade_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_NO_INT,target_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT,stock_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT,asset_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ENTRY_QTY_FLOAT,pre_entry_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ENTRY_AMT_FLOAT,pre_entry_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_IMPAWN_RATIO_FLOAT,impawn_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT,bond_accr_intrst);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT,busi_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ACT_RECORD_FLAG_INT,act_record_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_ENTRY_FLAG_INT,acco_entry_flag);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_MONEY_JOUR_NO_INT64,entry_money_jour_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_STATUS_STR,entry_status);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REG_DATE_INT,reg_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ARRIVE_DATE_INT,arrive_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TRADE_DATE_INT,begin_trade_date);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SRC_DATA_TYPE_INT,src_data_type);
 
            return fastMsg;
        }
    }

}
