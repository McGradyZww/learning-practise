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
    //逻辑_产品外盘期货_持仓_红冲蓝补交易组持仓
    public class ReqFuncpdfofuL_3_1DTO : ReqBaseDTO
    {
        public ReqFuncpdfofuL_3_1DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "pdfofuL.3.1";
            CommonDTO.func_code = CommonDTO.function_code;
            pd_no = 0;
            asset_acco_no = 0;
            exch_group_no = 0;
            exch_no = 0;
            futu_acco_no = 0;
            contrc_code_no = 0;
            occur_qty = 0;
            oper_remark_info = " ";
        }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 交易编码编号
        /// </summary>
        public int futu_acco_no { get; set; }
 
        /// <summary>
        /// 合约代码编号
        /// </summary>
        public int contrc_code_no { get; set; }
 
        /// <summary>
        /// 变动数量
        /// </summary>
        public double occur_qty { get; set; }
 
        /// <summary>
        /// 操作备注
        /// </summary>
        public String oper_remark_info { get; set; }
 
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
            packer.AddField("asset_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_group_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("futu_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("contrc_code_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("occur_qty", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("oper_remark_info", ELDDATATYPE.LD_DATATYPE_STRING);
 
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
            packer.AddInt(asset_acco_no);
            packer.AddInt(exch_group_no);
            packer.AddInt(exch_no);
            packer.AddInt(futu_acco_no);
            packer.AddInt(contrc_code_no);
            packer.AddDouble(occur_qty);
            packer.AddStr(oper_remark_info);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT,futu_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_QTY_FLOAT,occur_qty);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
 
            return fastMsg;
        }
    }

    //逻辑_产品外盘期货_持仓_冻结交易组持仓
    public class ReqFuncpdfofuL_3_2DTO : ReqBaseDTO
    {
        public ReqFuncpdfofuL_3_2DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "pdfofuL.3.2";
            CommonDTO.func_code = CommonDTO.function_code;
            pd_no = 0;
            asset_acco_no = 0;
            exch_group_no = 0;
            exch_no = 0;
            futu_acco_no = 0;
            contrc_code_no = 0;
            occur_qty = 0;
            expire_date = 0;
            oper_remark_info = " ";
        }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 交易编码编号
        /// </summary>
        public int futu_acco_no { get; set; }
 
        /// <summary>
        /// 合约代码编号
        /// </summary>
        public int contrc_code_no { get; set; }
 
        /// <summary>
        /// 变动数量
        /// </summary>
        public double occur_qty { get; set; }
 
        /// <summary>
        /// 到期日期
        /// </summary>
        public int expire_date { get; set; }
 
        /// <summary>
        /// 操作备注
        /// </summary>
        public String oper_remark_info { get; set; }
 
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
            packer.AddField("asset_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_group_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("futu_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("contrc_code_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("occur_qty", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("expire_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("oper_remark_info", ELDDATATYPE.LD_DATATYPE_STRING);
 
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
            packer.AddInt(asset_acco_no);
            packer.AddInt(exch_group_no);
            packer.AddInt(exch_no);
            packer.AddInt(futu_acco_no);
            packer.AddInt(contrc_code_no);
            packer.AddDouble(occur_qty);
            packer.AddInt(expire_date);
            packer.AddStr(oper_remark_info);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT,futu_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_QTY_FLOAT,occur_qty);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXPIRE_DATE_INT,expire_date);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
 
            return fastMsg;
        }
    }

    //逻辑_产品外盘期货_持仓_取消冻结交易组持仓
    public class ReqFuncpdfofuL_3_3DTO : ReqBaseDTO
    {
        public ReqFuncpdfofuL_3_3DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "pdfofuL.3.3";
            CommonDTO.func_code = CommonDTO.function_code;
            row_id = 0;
            oper_remark_info = " ";
        }
 
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 操作备注
        /// </summary>
        public String oper_remark_info { get; set; }
 
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
            packer.AddField("oper_remark_info", ELDDATATYPE.LD_DATATYPE_STRING);
 
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
            packer.AddStr(oper_remark_info);
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
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
 
            return fastMsg;
        }
    }

    //逻辑_产品外盘期货_持仓_解冻交易组持仓
    public class ReqFuncpdfofuL_3_4DTO : ReqBaseDTO
    {
        public ReqFuncpdfofuL_3_4DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "pdfofuL.3.4";
            CommonDTO.func_code = CommonDTO.function_code;
            pd_no = 0;
            asset_acco_no = 0;
            exch_group_no = 0;
            exch_no = 0;
            futu_acco_no = 0;
            contrc_code_no = 0;
            occur_qty = 0;
            expire_date = 0;
            oper_remark_info = " ";
        }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 交易编码编号
        /// </summary>
        public int futu_acco_no { get; set; }
 
        /// <summary>
        /// 合约代码编号
        /// </summary>
        public int contrc_code_no { get; set; }
 
        /// <summary>
        /// 变动数量
        /// </summary>
        public double occur_qty { get; set; }
 
        /// <summary>
        /// 到期日期
        /// </summary>
        public int expire_date { get; set; }
 
        /// <summary>
        /// 操作备注
        /// </summary>
        public String oper_remark_info { get; set; }
 
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
            packer.AddField("asset_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_group_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("futu_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("contrc_code_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("occur_qty", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("expire_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("oper_remark_info", ELDDATATYPE.LD_DATATYPE_STRING);
 
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
            packer.AddInt(asset_acco_no);
            packer.AddInt(exch_group_no);
            packer.AddInt(exch_no);
            packer.AddInt(futu_acco_no);
            packer.AddInt(contrc_code_no);
            packer.AddDouble(occur_qty);
            packer.AddInt(expire_date);
            packer.AddStr(oper_remark_info);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT,futu_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_QTY_FLOAT,occur_qty);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXPIRE_DATE_INT,expire_date);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
 
            return fastMsg;
        }
    }

    //逻辑_产品外盘期货_持仓_取消解冻交易组持仓
    public class ReqFuncpdfofuL_3_5DTO : ReqBaseDTO
    {
        public ReqFuncpdfofuL_3_5DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "pdfofuL.3.5";
            CommonDTO.func_code = CommonDTO.function_code;
            row_id = 0;
            oper_remark_info = " ";
        }
 
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 操作备注
        /// </summary>
        public String oper_remark_info { get; set; }
 
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
            packer.AddField("oper_remark_info", ELDDATATYPE.LD_DATATYPE_STRING);
 
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
            packer.AddStr(oper_remark_info);
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
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
 
            return fastMsg;
        }
    }

    //逻辑_产品外盘期货_持仓_查询交易组持仓
    public class ReqFuncpdfofuL_3_21DTO : ReqBaseDTO
    {
        public ReqFuncpdfofuL_3_21DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "pdfofuL.3.21";
            CommonDTO.func_code = CommonDTO.function_code;
            pd_no = 0;
            exch_group_no = 0;
            exch_no_str = " ";
            futu_acco_no = 0;
            contrc_code_no = 0;
            row_id = 0;
            row_count = -1;
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
        /// 市场编号串
        /// </summary>
        public String exch_no_str { get; set; }
 
        /// <summary>
        /// 交易编码编号
        /// </summary>
        public int futu_acco_no { get; set; }
 
        /// <summary>
        /// 合约代码编号
        /// </summary>
        public int contrc_code_no { get; set; }
 
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
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
 
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_group_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_no_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("futu_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("contrc_code_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("row_id", ELDDATATYPE.LD_DATATYPE_LONG);
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
 
            packer.AddInt(pd_no);
            packer.AddInt(exch_group_no);
            packer.AddStr(exch_no_str);
            packer.AddInt(futu_acco_no);
            packer.AddInt(contrc_code_no);
            packer.AddInt64(row_id);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT,futu_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
 
            return fastMsg;
        }
    }

    //逻辑_产品外盘期货_持仓_查询历史交易组持仓
    public class ReqFuncpdfofuL_3_22DTO : ReqBaseDTO
    {
        public ReqFuncpdfofuL_3_22DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "pdfofuL.3.22";
            CommonDTO.func_code = CommonDTO.function_code;
            begin_date = 0;
            end_date = 0;
            pd_no = 0;
            exch_group_no = 0;
            exch_no_str = " ";
            futu_acco_no = 0;
            contrc_code_no = 0;
            row_id = 0;
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
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// 市场编号串
        /// </summary>
        public String exch_no_str { get; set; }
 
        /// <summary>
        /// 交易编码编号
        /// </summary>
        public int futu_acco_no { get; set; }
 
        /// <summary>
        /// 合约代码编号
        /// </summary>
        public int contrc_code_no { get; set; }
 
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
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
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_group_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_no_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("futu_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("contrc_code_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("row_id", ELDDATATYPE.LD_DATATYPE_LONG);
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
            packer.AddInt(pd_no);
            packer.AddInt(exch_group_no);
            packer.AddStr(exch_no_str);
            packer.AddInt(futu_acco_no);
            packer.AddInt(contrc_code_no);
            packer.AddInt64(row_id);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT,futu_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
 
            return fastMsg;
        }
    }

    //逻辑_产品外盘期货_持仓_查询交易组持仓流水
    public class ReqFuncpdfofuL_3_31DTO : ReqBaseDTO
    {
        public ReqFuncpdfofuL_3_31DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "pdfofuL.3.31";
            CommonDTO.func_code = CommonDTO.function_code;
            pd_no = 0;
            exch_group_no = 0;
            exch_no_str = " ";
            futu_acco_no = 0;
            contrc_code_no = 0;
            row_id = 0;
            row_count = -1;
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
        /// 市场编号串
        /// </summary>
        public String exch_no_str { get; set; }
 
        /// <summary>
        /// 交易编码编号
        /// </summary>
        public int futu_acco_no { get; set; }
 
        /// <summary>
        /// 合约代码编号
        /// </summary>
        public int contrc_code_no { get; set; }
 
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
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
 
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_group_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_no_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("futu_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("contrc_code_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("row_id", ELDDATATYPE.LD_DATATYPE_LONG);
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
 
            packer.AddInt(pd_no);
            packer.AddInt(exch_group_no);
            packer.AddStr(exch_no_str);
            packer.AddInt(futu_acco_no);
            packer.AddInt(contrc_code_no);
            packer.AddInt64(row_id);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT,futu_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
 
            return fastMsg;
        }
    }

    //逻辑_产品外盘期货_持仓_查询历史交易组持仓流水
    public class ReqFuncpdfofuL_3_32DTO : ReqBaseDTO
    {
        public ReqFuncpdfofuL_3_32DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "pdfofuL.3.32";
            CommonDTO.func_code = CommonDTO.function_code;
            begin_date = 0;
            end_date = 0;
            pd_no = 0;
            exch_group_no = 0;
            exch_no_str = " ";
            futu_acco_no = 0;
            contrc_code_no = 0;
            row_id = 0;
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
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// 市场编号串
        /// </summary>
        public String exch_no_str { get; set; }
 
        /// <summary>
        /// 交易编码编号
        /// </summary>
        public int futu_acco_no { get; set; }
 
        /// <summary>
        /// 合约代码编号
        /// </summary>
        public int contrc_code_no { get; set; }
 
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
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
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_group_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_no_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("futu_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("contrc_code_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("row_id", ELDDATATYPE.LD_DATATYPE_LONG);
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
            packer.AddInt(pd_no);
            packer.AddInt(exch_group_no);
            packer.AddStr(exch_no_str);
            packer.AddInt(futu_acco_no);
            packer.AddInt(contrc_code_no);
            packer.AddInt64(row_id);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT,futu_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
 
            return fastMsg;
        }
    }

    //逻辑_产品外盘期货_持仓_查询交易组持仓冻结解冻流水
    public class ReqFuncpdfofuL_3_34DTO : ReqBaseDTO
    {
        public ReqFuncpdfofuL_3_34DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "pdfofuL.3.34";
            CommonDTO.func_code = CommonDTO.function_code;
            pd_no = 0;
            exch_group_no = 0;
            exch_no_str = " ";
            futu_acco_no = 0;
            contrc_code_no = 0;
            frozen_type = 0;
            jour_status = "0";
            row_id = 0;
            row_count = -1;
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
        /// 市场编号串
        /// </summary>
        public String exch_no_str { get; set; }
 
        /// <summary>
        /// 交易编码编号
        /// </summary>
        public int futu_acco_no { get; set; }
 
        /// <summary>
        /// 合约代码编号
        /// </summary>
        public int contrc_code_no { get; set; }
 
        /// <summary>
        /// 冻结解冻类型
        /// </summary>
        public int frozen_type { get; set; }
 
        /// <summary>
        /// 流水状态
        /// </summary>
        public String jour_status { get; set; }
 
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
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
 
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_group_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_no_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("futu_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("contrc_code_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("frozen_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("jour_status", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("row_id", ELDDATATYPE.LD_DATATYPE_LONG);
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
 
            packer.AddInt(pd_no);
            packer.AddInt(exch_group_no);
            packer.AddStr(exch_no_str);
            packer.AddInt(futu_acco_no);
            packer.AddInt(contrc_code_no);
            packer.AddInt(frozen_type);
            packer.AddStr(jour_status);
            packer.AddInt64(row_id);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT,futu_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_TYPE_INT,frozen_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_STATUS_STR,jour_status);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
 
            return fastMsg;
        }
    }

    //逻辑_产品外盘期货_持仓_查询历史交易组持仓冻结解冻流水
    public class ReqFuncpdfofuL_3_35DTO : ReqBaseDTO
    {
        public ReqFuncpdfofuL_3_35DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "pdfofuL.3.35";
            CommonDTO.func_code = CommonDTO.function_code;
            begin_date = 0;
            end_date = 0;
            pd_no = 0;
            exch_group_no = 0;
            exch_no_str = " ";
            futu_acco_no = 0;
            contrc_code_no = 0;
            frozen_type = 0;
            row_id = 0;
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
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// 市场编号串
        /// </summary>
        public String exch_no_str { get; set; }
 
        /// <summary>
        /// 交易编码编号
        /// </summary>
        public int futu_acco_no { get; set; }
 
        /// <summary>
        /// 合约代码编号
        /// </summary>
        public int contrc_code_no { get; set; }
 
        /// <summary>
        /// 冻结解冻类型
        /// </summary>
        public int frozen_type { get; set; }
 
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
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
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_group_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_no_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("futu_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("contrc_code_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("frozen_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("row_id", ELDDATATYPE.LD_DATATYPE_LONG);
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
            packer.AddInt(pd_no);
            packer.AddInt(exch_group_no);
            packer.AddStr(exch_no_str);
            packer.AddInt(futu_acco_no);
            packer.AddInt(contrc_code_no);
            packer.AddInt(frozen_type);
            packer.AddInt64(row_id);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT,futu_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_TYPE_INT,frozen_type);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
 
            return fastMsg;
        }
    }

    //逻辑_产品外盘期货_持仓_红冲蓝补资产账户持仓
    public class ReqFuncpdfofuL_3_51DTO : ReqBaseDTO
    {
        public ReqFuncpdfofuL_3_51DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "pdfofuL.3.51";
            CommonDTO.func_code = CommonDTO.function_code;
            pd_no = 0;
            asset_acco_no = 0;
            exch_no = 0;
            futu_acco_no = 0;
            contrc_code_no = 0;
            occur_qty = 0;
            oper_remark_info = " ";
        }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 交易编码编号
        /// </summary>
        public int futu_acco_no { get; set; }
 
        /// <summary>
        /// 合约代码编号
        /// </summary>
        public int contrc_code_no { get; set; }
 
        /// <summary>
        /// 变动数量
        /// </summary>
        public double occur_qty { get; set; }
 
        /// <summary>
        /// 操作备注
        /// </summary>
        public String oper_remark_info { get; set; }
 
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
            packer.AddField("asset_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("futu_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("contrc_code_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("occur_qty", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("oper_remark_info", ELDDATATYPE.LD_DATATYPE_STRING);
 
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
            packer.AddInt(asset_acco_no);
            packer.AddInt(exch_no);
            packer.AddInt(futu_acco_no);
            packer.AddInt(contrc_code_no);
            packer.AddDouble(occur_qty);
            packer.AddStr(oper_remark_info);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT,futu_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_QTY_FLOAT,occur_qty);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
 
            return fastMsg;
        }
    }

    //逻辑_产品外盘期货_持仓_冻结资产账户持仓
    public class ReqFuncpdfofuL_3_52DTO : ReqBaseDTO
    {
        public ReqFuncpdfofuL_3_52DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "pdfofuL.3.52";
            CommonDTO.func_code = CommonDTO.function_code;
            pd_no = 0;
            asset_acco_no = 0;
            exch_no = 0;
            futu_acco_no = 0;
            contrc_code_no = 0;
            occur_qty = 0;
            expire_date = 0;
            oper_remark_info = " ";
        }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 交易编码编号
        /// </summary>
        public int futu_acco_no { get; set; }
 
        /// <summary>
        /// 合约代码编号
        /// </summary>
        public int contrc_code_no { get; set; }
 
        /// <summary>
        /// 变动数量
        /// </summary>
        public double occur_qty { get; set; }
 
        /// <summary>
        /// 到期日期
        /// </summary>
        public int expire_date { get; set; }
 
        /// <summary>
        /// 操作备注
        /// </summary>
        public String oper_remark_info { get; set; }
 
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
            packer.AddField("asset_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("futu_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("contrc_code_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("occur_qty", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("expire_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("oper_remark_info", ELDDATATYPE.LD_DATATYPE_STRING);
 
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
            packer.AddInt(asset_acco_no);
            packer.AddInt(exch_no);
            packer.AddInt(futu_acco_no);
            packer.AddInt(contrc_code_no);
            packer.AddDouble(occur_qty);
            packer.AddInt(expire_date);
            packer.AddStr(oper_remark_info);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT,futu_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_QTY_FLOAT,occur_qty);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXPIRE_DATE_INT,expire_date);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
 
            return fastMsg;
        }
    }

    //逻辑_产品外盘期货_持仓_取消冻结资产账户持仓
    public class ReqFuncpdfofuL_3_53DTO : ReqBaseDTO
    {
        public ReqFuncpdfofuL_3_53DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "pdfofuL.3.53";
            CommonDTO.func_code = CommonDTO.function_code;
            row_id = 0;
            oper_remark_info = " ";
        }
 
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 操作备注
        /// </summary>
        public String oper_remark_info { get; set; }
 
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
            packer.AddField("oper_remark_info", ELDDATATYPE.LD_DATATYPE_STRING);
 
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
            packer.AddStr(oper_remark_info);
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
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
 
            return fastMsg;
        }
    }

    //逻辑_产品外盘期货_持仓_解冻资产账户持仓
    public class ReqFuncpdfofuL_3_54DTO : ReqBaseDTO
    {
        public ReqFuncpdfofuL_3_54DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "pdfofuL.3.54";
            CommonDTO.func_code = CommonDTO.function_code;
            pd_no = 0;
            asset_acco_no = 0;
            exch_no = 0;
            futu_acco_no = 0;
            contrc_code_no = 0;
            occur_qty = 0;
            expire_date = 0;
            oper_remark_info = " ";
        }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 交易编码编号
        /// </summary>
        public int futu_acco_no { get; set; }
 
        /// <summary>
        /// 合约代码编号
        /// </summary>
        public int contrc_code_no { get; set; }
 
        /// <summary>
        /// 变动数量
        /// </summary>
        public double occur_qty { get; set; }
 
        /// <summary>
        /// 到期日期
        /// </summary>
        public int expire_date { get; set; }
 
        /// <summary>
        /// 操作备注
        /// </summary>
        public String oper_remark_info { get; set; }
 
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
            packer.AddField("asset_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("futu_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("contrc_code_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("occur_qty", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("expire_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("oper_remark_info", ELDDATATYPE.LD_DATATYPE_STRING);
 
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
            packer.AddInt(asset_acco_no);
            packer.AddInt(exch_no);
            packer.AddInt(futu_acco_no);
            packer.AddInt(contrc_code_no);
            packer.AddDouble(occur_qty);
            packer.AddInt(expire_date);
            packer.AddStr(oper_remark_info);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT,futu_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_QTY_FLOAT,occur_qty);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXPIRE_DATE_INT,expire_date);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
 
            return fastMsg;
        }
    }

    //逻辑_产品外盘期货_持仓_取消解冻资产账户持仓
    public class ReqFuncpdfofuL_3_55DTO : ReqBaseDTO
    {
        public ReqFuncpdfofuL_3_55DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "pdfofuL.3.55";
            CommonDTO.func_code = CommonDTO.function_code;
            row_id = 0;
            oper_remark_info = " ";
        }
 
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 操作备注
        /// </summary>
        public String oper_remark_info { get; set; }
 
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
            packer.AddField("oper_remark_info", ELDDATATYPE.LD_DATATYPE_STRING);
 
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
            packer.AddStr(oper_remark_info);
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
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
 
            return fastMsg;
        }
    }

    //逻辑_产品外盘期货_持仓_查询资产账户持仓
    public class ReqFuncpdfofuL_3_71DTO : ReqBaseDTO
    {
        public ReqFuncpdfofuL_3_71DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "pdfofuL.3.71";
            CommonDTO.func_code = CommonDTO.function_code;
            pd_no = 0;
            asset_acco_no = 0;
            exch_no_str = " ";
            futu_acco_no = 0;
            contrc_code_no = 0;
            row_id = 0;
            row_count = -1;
        }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// 市场编号串
        /// </summary>
        public String exch_no_str { get; set; }
 
        /// <summary>
        /// 交易编码编号
        /// </summary>
        public int futu_acco_no { get; set; }
 
        /// <summary>
        /// 合约代码编号
        /// </summary>
        public int contrc_code_no { get; set; }
 
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
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
 
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("asset_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_no_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("futu_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("contrc_code_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("row_id", ELDDATATYPE.LD_DATATYPE_LONG);
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
 
            packer.AddInt(pd_no);
            packer.AddInt(asset_acco_no);
            packer.AddStr(exch_no_str);
            packer.AddInt(futu_acco_no);
            packer.AddInt(contrc_code_no);
            packer.AddInt64(row_id);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT,futu_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
 
            return fastMsg;
        }
    }

    //逻辑_产品外盘期货_持仓_查询历史资产账户持仓
    public class ReqFuncpdfofuL_3_72DTO : ReqBaseDTO
    {
        public ReqFuncpdfofuL_3_72DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "pdfofuL.3.72";
            CommonDTO.func_code = CommonDTO.function_code;
            begin_date = 0;
            end_date = 0;
            co_no = 0;
            pd_no = 0;
            asset_acco_no = 0;
            exch_no_str = " ";
            futu_acco_no = 0;
            contrc_code_no = 0;
            row_id = 0;
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
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// 市场编号串
        /// </summary>
        public String exch_no_str { get; set; }
 
        /// <summary>
        /// 交易编码编号
        /// </summary>
        public int futu_acco_no { get; set; }
 
        /// <summary>
        /// 合约代码编号
        /// </summary>
        public int contrc_code_no { get; set; }
 
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
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
            packer.AddField("asset_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_no_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("futu_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("contrc_code_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("row_id", ELDDATATYPE.LD_DATATYPE_LONG);
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
            packer.AddInt(asset_acco_no);
            packer.AddStr(exch_no_str);
            packer.AddInt(futu_acco_no);
            packer.AddInt(contrc_code_no);
            packer.AddInt64(row_id);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT,futu_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
 
            return fastMsg;
        }
    }

    //逻辑_产品外盘期货_持仓_查询资产账户持仓流水
    public class ReqFuncpdfofuL_3_81DTO : ReqBaseDTO
    {
        public ReqFuncpdfofuL_3_81DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "pdfofuL.3.81";
            CommonDTO.func_code = CommonDTO.function_code;
            pd_no = 0;
            asset_acco_no = 0;
            exch_no_str = " ";
            futu_acco_no = 0;
            contrc_code_no = 0;
            row_id = 0;
            row_count = -1;
        }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// 市场编号串
        /// </summary>
        public String exch_no_str { get; set; }
 
        /// <summary>
        /// 交易编码编号
        /// </summary>
        public int futu_acco_no { get; set; }
 
        /// <summary>
        /// 合约代码编号
        /// </summary>
        public int contrc_code_no { get; set; }
 
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
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
 
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("asset_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_no_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("futu_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("contrc_code_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("row_id", ELDDATATYPE.LD_DATATYPE_LONG);
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
 
            packer.AddInt(pd_no);
            packer.AddInt(asset_acco_no);
            packer.AddStr(exch_no_str);
            packer.AddInt(futu_acco_no);
            packer.AddInt(contrc_code_no);
            packer.AddInt64(row_id);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT,futu_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
 
            return fastMsg;
        }
    }

    //逻辑_产品外盘期货_持仓_查询历史资产账户持仓流水
    public class ReqFuncpdfofuL_3_82DTO : ReqBaseDTO
    {
        public ReqFuncpdfofuL_3_82DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "pdfofuL.3.82";
            CommonDTO.func_code = CommonDTO.function_code;
            begin_date = 0;
            end_date = 0;
            pd_no = 0;
            asset_acco_no = 0;
            exch_no_str = " ";
            futu_acco_no = 0;
            contrc_code_no = 0;
            row_id = 0;
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
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// 市场编号串
        /// </summary>
        public String exch_no_str { get; set; }
 
        /// <summary>
        /// 交易编码编号
        /// </summary>
        public int futu_acco_no { get; set; }
 
        /// <summary>
        /// 合约代码编号
        /// </summary>
        public int contrc_code_no { get; set; }
 
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
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
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("asset_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_no_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("futu_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("contrc_code_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("row_id", ELDDATATYPE.LD_DATATYPE_LONG);
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
            packer.AddInt(pd_no);
            packer.AddInt(asset_acco_no);
            packer.AddStr(exch_no_str);
            packer.AddInt(futu_acco_no);
            packer.AddInt(contrc_code_no);
            packer.AddInt64(row_id);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT,futu_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
 
            return fastMsg;
        }
    }

    //逻辑_产品外盘期货_持仓_查询资产账户持仓冻结解冻流水
    public class ReqFuncpdfofuL_3_84DTO : ReqBaseDTO
    {
        public ReqFuncpdfofuL_3_84DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "pdfofuL.3.84";
            CommonDTO.func_code = CommonDTO.function_code;
            pd_no = 0;
            asset_acco_no = 0;
            exch_no_str = " ";
            futu_acco_no = 0;
            contrc_code_no = 0;
            frozen_type = 0;
            jour_status = "0";
            row_id = 0;
            row_count = -1;
        }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// 市场编号串
        /// </summary>
        public String exch_no_str { get; set; }
 
        /// <summary>
        /// 交易编码编号
        /// </summary>
        public int futu_acco_no { get; set; }
 
        /// <summary>
        /// 合约代码编号
        /// </summary>
        public int contrc_code_no { get; set; }
 
        /// <summary>
        /// 冻结解冻类型
        /// </summary>
        public int frozen_type { get; set; }
 
        /// <summary>
        /// 流水状态
        /// </summary>
        public String jour_status { get; set; }
 
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
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
 
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("asset_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_no_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("futu_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("contrc_code_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("frozen_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("jour_status", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("row_id", ELDDATATYPE.LD_DATATYPE_LONG);
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
 
            packer.AddInt(pd_no);
            packer.AddInt(asset_acco_no);
            packer.AddStr(exch_no_str);
            packer.AddInt(futu_acco_no);
            packer.AddInt(contrc_code_no);
            packer.AddInt(frozen_type);
            packer.AddStr(jour_status);
            packer.AddInt64(row_id);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT,futu_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_TYPE_INT,frozen_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_STATUS_STR,jour_status);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
 
            return fastMsg;
        }
    }

    //逻辑_产品外盘期货_持仓_查询历史资产账户持仓冻结解冻流水
    public class ReqFuncpdfofuL_3_85DTO : ReqBaseDTO
    {
        public ReqFuncpdfofuL_3_85DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "pdfofuL.3.85";
            CommonDTO.func_code = CommonDTO.function_code;
            begin_date = 0;
            end_date = 0;
            pd_no = 0;
            asset_acco_no = 0;
            exch_no_str = " ";
            futu_acco_no = 0;
            contrc_code_no = 0;
            frozen_type = 0;
            row_id = 0;
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
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// 市场编号串
        /// </summary>
        public String exch_no_str { get; set; }
 
        /// <summary>
        /// 交易编码编号
        /// </summary>
        public int futu_acco_no { get; set; }
 
        /// <summary>
        /// 合约代码编号
        /// </summary>
        public int contrc_code_no { get; set; }
 
        /// <summary>
        /// 冻结解冻类型
        /// </summary>
        public int frozen_type { get; set; }
 
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
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
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("asset_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_no_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("futu_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("contrc_code_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("frozen_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("row_id", ELDDATATYPE.LD_DATATYPE_LONG);
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
            packer.AddInt(pd_no);
            packer.AddInt(asset_acco_no);
            packer.AddStr(exch_no_str);
            packer.AddInt(futu_acco_no);
            packer.AddInt(contrc_code_no);
            packer.AddInt(frozen_type);
            packer.AddInt64(row_id);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT,futu_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_TYPE_INT,frozen_type);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
 
            return fastMsg;
        }
    }

    //逻辑_产品外盘期货_持仓_转入外部持仓流水记录
    public class ReqFuncpdfofuL_3_101DTO : ReqBaseDTO
    {
        public ReqFuncpdfofuL_3_101DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "pdfofuL.3.101";
            CommonDTO.func_code = CommonDTO.function_code;
            init_date = 0;
            pass_stock_jour_no = 0;
            pass_no = 0;
            out_acco = " ";
            exch_no = 0;
            futu_acco = " ";
            contrc_code = " ";
            busi_flag = 0;
            sett_price = 0;
            entry_qty = 0;
            entry_end_qty = 0;
            remark_info = " ";
        }
 
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// 通道持仓流水号
        /// </summary>
        public int pass_stock_jour_no { get; set; }
 
        /// <summary>
        /// 通道编号
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// 外部账号
        /// </summary>
        public String out_acco { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 交易编码
        /// </summary>
        public String futu_acco { get; set; }
 
        /// <summary>
        /// 合约代码
        /// </summary>
        public String contrc_code { get; set; }
 
        /// <summary>
        /// 业务标志
        /// </summary>
        public int busi_flag { get; set; }
 
        /// <summary>
        /// 结算价
        /// </summary>
        public double sett_price { get; set; }
 
        /// <summary>
        /// 入账数量
        /// </summary>
        public double entry_qty { get; set; }
 
        /// <summary>
        /// 入账后数量
        /// </summary>
        public double entry_end_qty { get; set; }
 
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
            packer.AddField("pass_stock_jour_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pass_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("out_acco", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("exch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("futu_acco", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("contrc_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("busi_flag", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("sett_price", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("entry_qty", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("entry_end_qty", ELDDATATYPE.LD_DATATYPE_DOUBLE);
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
            packer.AddInt(pass_stock_jour_no);
            packer.AddInt(pass_no);
            packer.AddStr(out_acco);
            packer.AddInt(exch_no);
            packer.AddStr(futu_acco);
            packer.AddStr(contrc_code);
            packer.AddInt(busi_flag);
            packer.AddDouble(sett_price);
            packer.AddDouble(entry_qty);
            packer.AddDouble(entry_end_qty);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_STOCK_JOUR_NO_INT,pass_stock_jour_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR,out_acco);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_STR,futu_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR,contrc_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT,busi_flag);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SETT_PRICE_FLOAT,sett_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_QTY_FLOAT,entry_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_END_QTY_FLOAT,entry_end_qty);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
 
            return fastMsg;
        }
    }

    //逻辑_产品外盘期货_持仓_查询外部持仓流水记录
    public class ReqFuncpdfofuL_3_105DTO : ReqBaseDTO
    {
        public ReqFuncpdfofuL_3_105DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "pdfofuL.3.105";
            CommonDTO.func_code = CommonDTO.function_code;
            pass_no = 0;
            out_acco = " ";
            exch_no_str = " ";
            futu_acco = " ";
            contrc_code = " ";
            row_id = 0;
            row_count = -1;
        }
 
        /// <summary>
        /// 通道编号
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// 外部账号
        /// </summary>
        public String out_acco { get; set; }
 
        /// <summary>
        /// 市场编号串
        /// </summary>
        public String exch_no_str { get; set; }
 
        /// <summary>
        /// 交易编码
        /// </summary>
        public String futu_acco { get; set; }
 
        /// <summary>
        /// 合约代码
        /// </summary>
        public String contrc_code { get; set; }
 
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
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
 
            packer.AddField("pass_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("out_acco", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("exch_no_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("futu_acco", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("contrc_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("row_id", ELDDATATYPE.LD_DATATYPE_LONG);
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
 
            packer.AddInt(pass_no);
            packer.AddStr(out_acco);
            packer.AddStr(exch_no_str);
            packer.AddStr(futu_acco);
            packer.AddStr(contrc_code);
            packer.AddInt64(row_id);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR,out_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_STR,futu_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR,contrc_code);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
 
            return fastMsg;
        }
    }

    //逻辑_产品外盘期货_持仓_转入外部订单记录
    public class ReqFuncpdfofuL_3_111DTO : ReqBaseDTO
    {
        public ReqFuncpdfofuL_3_111DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "pdfofuL.3.111";
            CommonDTO.func_code = CommonDTO.function_code;
            report_date = 0;
            report_time = 0;
            report_no = " ";
            pass_no = 0;
            out_acco = " ";
            exch_no = 0;
            futu_acco = " ";
            contrc_code = " ";
            order_dir = 0;
            order_price = 0;
            order_qty = 0;
            strike_price = 0;
            strike_qty = 0;
            strike_amt = 0;
            remark_info = " ";
        }
 
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
        /// 通道编号
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// 外部账号
        /// </summary>
        public String out_acco { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 交易编码
        /// </summary>
        public String futu_acco { get; set; }
 
        /// <summary>
        /// 合约代码
        /// </summary>
        public String contrc_code { get; set; }
 
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
 
            packer.AddField("report_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("report_time", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("report_no", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("pass_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("out_acco", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("exch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("futu_acco", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("contrc_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("order_dir", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("order_price", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("order_qty", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("strike_price", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("strike_qty", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("strike_amt", ELDDATATYPE.LD_DATATYPE_DOUBLE);
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
 
            packer.AddInt(report_date);
            packer.AddInt(report_time);
            packer.AddStr(report_no);
            packer.AddInt(pass_no);
            packer.AddStr(out_acco);
            packer.AddInt(exch_no);
            packer.AddStr(futu_acco);
            packer.AddStr(contrc_code);
            packer.AddInt(order_dir);
            packer.AddDouble(order_price);
            packer.AddDouble(order_qty);
            packer.AddDouble(strike_price);
            packer.AddDouble(strike_qty);
            packer.AddDouble(strike_amt);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT,report_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_TIME_INT,report_time);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR,report_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR,out_acco);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_STR,futu_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR,contrc_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT,order_dir);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT,order_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT,order_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_PRICE_FLOAT,strike_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT,strike_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT,strike_amt);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
 
            return fastMsg;
        }
    }

    //逻辑_产品外盘期货_持仓_查询外部订单记录
    public class ReqFuncpdfofuL_3_115DTO : ReqBaseDTO
    {
        public ReqFuncpdfofuL_3_115DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "pdfofuL.3.115";
            CommonDTO.func_code = CommonDTO.function_code;
            report_date = 0;
            report_no = " ";
            pass_no = 0;
            out_acco = " ";
            exch_no_str = " ";
            futu_acco = " ";
            contrc_code = " ";
            order_dir_str = " ";
            row_id = 0;
            row_count = -1;
        }
 
        /// <summary>
        /// 申报日期
        /// </summary>
        public int report_date { get; set; }
 
        /// <summary>
        /// 申报编号
        /// </summary>
        public String report_no { get; set; }
 
        /// <summary>
        /// 通道编号
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// 外部账号
        /// </summary>
        public String out_acco { get; set; }
 
        /// <summary>
        /// 市场编号串
        /// </summary>
        public String exch_no_str { get; set; }
 
        /// <summary>
        /// 交易编码
        /// </summary>
        public String futu_acco { get; set; }
 
        /// <summary>
        /// 合约代码
        /// </summary>
        public String contrc_code { get; set; }
 
        /// <summary>
        /// 订单方向串
        /// </summary>
        public String order_dir_str { get; set; }
 
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
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
 
            packer.AddField("report_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("report_no", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("pass_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("out_acco", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("exch_no_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("futu_acco", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("contrc_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("order_dir_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("row_id", ELDDATATYPE.LD_DATATYPE_LONG);
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
 
            packer.AddInt(report_date);
            packer.AddStr(report_no);
            packer.AddInt(pass_no);
            packer.AddStr(out_acco);
            packer.AddStr(exch_no_str);
            packer.AddStr(futu_acco);
            packer.AddStr(contrc_code);
            packer.AddStr(order_dir_str);
            packer.AddInt64(row_id);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT,report_date);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR,report_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR,out_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_STR,futu_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR,contrc_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR,order_dir_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
 
            return fastMsg;
        }
    }

    //逻辑_产品外盘期货_持仓_转入外部成交记录
    public class ReqFuncpdfofuL_3_121DTO : ReqBaseDTO
    {
        public ReqFuncpdfofuL_3_121DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "pdfofuL.3.121";
            CommonDTO.func_code = CommonDTO.function_code;
            strike_date = 0;
            strike_time = 0;
            strike_no = " ";
            report_date = 0;
            report_time = 0;
            report_no = " ";
            pass_no = 0;
            out_acco = " ";
            exch_no = 0;
            futu_acco = " ";
            contrc_code = " ";
            order_dir = 0;
            strike_price = 0;
            strike_qty = 0;
            strike_amt = 0;
            remark_info = " ";
        }
 
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
        /// 通道编号
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// 外部账号
        /// </summary>
        public String out_acco { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 交易编码
        /// </summary>
        public String futu_acco { get; set; }
 
        /// <summary>
        /// 合约代码
        /// </summary>
        public String contrc_code { get; set; }
 
        /// <summary>
        /// 订单方向
        /// </summary>
        public int order_dir { get; set; }
 
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
 
            packer.AddField("strike_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("strike_time", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("strike_no", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("report_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("report_time", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("report_no", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("pass_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("out_acco", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("exch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("futu_acco", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("contrc_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("order_dir", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("strike_price", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("strike_qty", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("strike_amt", ELDDATATYPE.LD_DATATYPE_DOUBLE);
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
 
            packer.AddInt(strike_date);
            packer.AddInt(strike_time);
            packer.AddStr(strike_no);
            packer.AddInt(report_date);
            packer.AddInt(report_time);
            packer.AddStr(report_no);
            packer.AddInt(pass_no);
            packer.AddStr(out_acco);
            packer.AddInt(exch_no);
            packer.AddStr(futu_acco);
            packer.AddStr(contrc_code);
            packer.AddInt(order_dir);
            packer.AddDouble(strike_price);
            packer.AddDouble(strike_qty);
            packer.AddDouble(strike_amt);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT,strike_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_TIME_INT,strike_time);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR,strike_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT,report_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_TIME_INT,report_time);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR,report_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR,out_acco);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_STR,futu_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR,contrc_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT,order_dir);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_PRICE_FLOAT,strike_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT,strike_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT,strike_amt);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
 
            return fastMsg;
        }
    }

    //逻辑_产品外盘期货_持仓_查询外部成交记录
    public class ReqFuncpdfofuL_3_125DTO : ReqBaseDTO
    {
        public ReqFuncpdfofuL_3_125DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "pdfofuL.3.125";
            CommonDTO.func_code = CommonDTO.function_code;
            strike_date = 0;
            strike_no = " ";
            pass_no = 0;
            out_acco = " ";
            exch_no_str = " ";
            futu_acco = " ";
            contrc_code = " ";
            order_dir_str = " ";
            match_status = "0";
            row_id = 0;
            row_count = -1;
        }
 
        /// <summary>
        /// 成交日期
        /// </summary>
        public int strike_date { get; set; }
 
        /// <summary>
        /// 成交编号
        /// </summary>
        public String strike_no { get; set; }
 
        /// <summary>
        /// 通道编号
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// 外部账号
        /// </summary>
        public String out_acco { get; set; }
 
        /// <summary>
        /// 市场编号串
        /// </summary>
        public String exch_no_str { get; set; }
 
        /// <summary>
        /// 交易编码
        /// </summary>
        public String futu_acco { get; set; }
 
        /// <summary>
        /// 合约代码
        /// </summary>
        public String contrc_code { get; set; }
 
        /// <summary>
        /// 订单方向串
        /// </summary>
        public String order_dir_str { get; set; }
 
        /// <summary>
        /// 配对状态
        /// </summary>
        public String match_status { get; set; }
 
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
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
 
            packer.AddField("strike_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("strike_no", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("pass_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("out_acco", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("exch_no_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("futu_acco", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("contrc_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("order_dir_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("match_status", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("row_id", ELDDATATYPE.LD_DATATYPE_LONG);
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
 
            packer.AddInt(strike_date);
            packer.AddStr(strike_no);
            packer.AddInt(pass_no);
            packer.AddStr(out_acco);
            packer.AddStr(exch_no_str);
            packer.AddStr(futu_acco);
            packer.AddStr(contrc_code);
            packer.AddStr(order_dir_str);
            packer.AddStr(match_status);
            packer.AddInt64(row_id);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT,strike_date);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR,strike_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR,out_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_STR,futu_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR,contrc_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR,order_dir_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MATCH_STATUS_STR,match_status);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
 
            return fastMsg;
        }
    }

    //逻辑_产品外盘期货_持仓_转入外部交割流水记录
    public class ReqFuncpdfofuL_3_131DTO : ReqBaseDTO
    {
        public ReqFuncpdfofuL_3_131DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "pdfofuL.3.131";
            CommonDTO.func_code = CommonDTO.function_code;
            init_date = 0;
            pass_deli_jour_no = 0;
            strike_date = 0;
            strike_time = 0;
            strike_no = " ";
            report_date = 0;
            report_time = 0;
            report_no = " ";
            pass_no = 0;
            out_acco = " ";
            crncy_type = "CNY";
            exch_no = 0;
            futu_acco = " ";
            contrc_code = " ";
            order_dir = 0;
            order_price = 0;
            order_qty = 0;
            sett_price = 0;
            strike_price = 0;
            strike_qty = 0;
            strike_amt = 0;
            strike_num = 0;
            entry_end_qty = 0;
            entry_end_amt = 0;
            rece_margin = 0;
            out_all_fee = 0;
            out_report_fee = 0;
            out_cancel_fee = 0;
            out_deli_fee = 0;
            out_other_fee = 0;
            out_brkage_commis = 0;
            out_other_commis = 0;
            busi_flag = 0;
            remark_info = " ";
        }
 
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date { get; set; }
 
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
        /// 通道编号
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// 外部账号
        /// </summary>
        public String out_acco { get; set; }
 
        /// <summary>
        /// 本币币种
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 交易编码
        /// </summary>
        public String futu_acco { get; set; }
 
        /// <summary>
        /// 合约代码
        /// </summary>
        public String contrc_code { get; set; }
 
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
        /// 结算价
        /// </summary>
        public double sett_price { get; set; }
 
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
        /// 应收保证金
        /// </summary>
        public double rece_margin { get; set; }
 
        /// <summary>
        /// 外部全部费用
        /// </summary>
        public double out_all_fee { get; set; }
 
        /// <summary>
        /// 外部申报费用
        /// </summary>
        public double out_report_fee { get; set; }
 
        /// <summary>
        /// 外部撤单费用
        /// </summary>
        public double out_cancel_fee { get; set; }
 
        /// <summary>
        /// 外部交割费用
        /// </summary>
        public double out_deli_fee { get; set; }
 
        /// <summary>
        /// 外部其他费用
        /// </summary>
        public double out_other_fee { get; set; }
 
        /// <summary>
        /// 外部交易佣金
        /// </summary>
        public double out_brkage_commis { get; set; }
 
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
            packer.AddField("pass_deli_jour_no", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("strike_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("strike_time", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("strike_no", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("report_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("report_time", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("report_no", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("pass_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("out_acco", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("crncy_type", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("exch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("futu_acco", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("contrc_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("order_dir", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("order_price", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("order_qty", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("sett_price", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("strike_price", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("strike_qty", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("strike_amt", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("strike_num", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("entry_end_qty", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("entry_end_amt", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("rece_margin", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("out_all_fee", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("out_report_fee", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("out_cancel_fee", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("out_deli_fee", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("out_other_fee", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("out_brkage_commis", ELDDATATYPE.LD_DATATYPE_DOUBLE);
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
            packer.AddInt64(pass_deli_jour_no);
            packer.AddInt(strike_date);
            packer.AddInt(strike_time);
            packer.AddStr(strike_no);
            packer.AddInt(report_date);
            packer.AddInt(report_time);
            packer.AddStr(report_no);
            packer.AddInt(pass_no);
            packer.AddStr(out_acco);
            packer.AddStr(crncy_type);
            packer.AddInt(exch_no);
            packer.AddStr(futu_acco);
            packer.AddStr(contrc_code);
            packer.AddInt(order_dir);
            packer.AddDouble(order_price);
            packer.AddDouble(order_qty);
            packer.AddDouble(sett_price);
            packer.AddDouble(strike_price);
            packer.AddDouble(strike_qty);
            packer.AddDouble(strike_amt);
            packer.AddInt(strike_num);
            packer.AddDouble(entry_end_qty);
            packer.AddDouble(entry_end_amt);
            packer.AddDouble(rece_margin);
            packer.AddDouble(out_all_fee);
            packer.AddDouble(out_report_fee);
            packer.AddDouble(out_cancel_fee);
            packer.AddDouble(out_deli_fee);
            packer.AddDouble(out_other_fee);
            packer.AddDouble(out_brkage_commis);
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
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_PASS_DELI_JOUR_NO_INT64,pass_deli_jour_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT,strike_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_TIME_INT,strike_time);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR,strike_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT,report_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_TIME_INT,report_time);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR,report_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR,out_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_STR,futu_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR,contrc_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT,order_dir);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT,order_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT,order_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SETT_PRICE_FLOAT,sett_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_PRICE_FLOAT,strike_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT,strike_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT,strike_amt);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NUM_INT,strike_num);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_END_QTY_FLOAT,entry_end_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_END_AMT_FLOAT,entry_end_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RECE_MARGIN_FLOAT,rece_margin);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ALL_FEE_FLOAT,out_all_fee);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_REPORT_FEE_FLOAT,out_report_fee);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_CANCEL_FEE_FLOAT,out_cancel_fee);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_DELI_FEE_FLOAT,out_deli_fee);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_OTHER_FEE_FLOAT,out_other_fee);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_BRKAGE_COMMIS_FLOAT,out_brkage_commis);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_OTHER_COMMIS_FLOAT,out_other_commis);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT,busi_flag);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
 
            return fastMsg;
        }
    }

    //逻辑_产品外盘期货_持仓_查询外部交割流水记录
    public class ReqFuncpdfofuL_3_135DTO : ReqBaseDTO
    {
        public ReqFuncpdfofuL_3_135DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "pdfofuL.3.135";
            CommonDTO.func_code = CommonDTO.function_code;
            pass_no = 0;
            init_date = 0;
            out_acco = " ";
            exch_no_str = " ";
            futu_acco = " ";
            contrc_code = " ";
            row_id = 0;
            row_count = -1;
        }
 
        /// <summary>
        /// 通道编号
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// 外部账号
        /// </summary>
        public String out_acco { get; set; }
 
        /// <summary>
        /// 市场编号串
        /// </summary>
        public String exch_no_str { get; set; }
 
        /// <summary>
        /// 交易编码
        /// </summary>
        public String futu_acco { get; set; }
 
        /// <summary>
        /// 合约代码
        /// </summary>
        public String contrc_code { get; set; }
 
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
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
 
            packer.AddField("pass_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("init_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("out_acco", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("exch_no_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("futu_acco", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("contrc_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("row_id", ELDDATATYPE.LD_DATATYPE_LONG);
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
 
            packer.AddInt(pass_no);
            packer.AddInt(init_date);
            packer.AddStr(out_acco);
            packer.AddStr(exch_no_str);
            packer.AddStr(futu_acco);
            packer.AddStr(contrc_code);
            packer.AddInt64(row_id);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR,out_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_STR,futu_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR,contrc_code);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
 
            return fastMsg;
        }
    }

    //逻辑_产品外盘期货_持仓_查询对账记录
    public class ReqFuncpdfofuL_3_145DTO : ReqBaseDTO
    {
        public ReqFuncpdfofuL_3_145DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "pdfofuL.3.145";
            CommonDTO.func_code = CommonDTO.function_code;
            init_date = 0;
            co_no = 0;
            pd_no = 0;
            exch_group_no = 0;
            asset_acco_no = 0;
            exch_no_str = " ";
            futu_acco_no = 0;
            contrc_code_no = 0;
            crncy_type_str = " ";
            row_id = 0;
            row_count = -1;
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
        /// 市场编号串
        /// </summary>
        public String exch_no_str { get; set; }
 
        /// <summary>
        /// 交易编码编号
        /// </summary>
        public int futu_acco_no { get; set; }
 
        /// <summary>
        /// 合约代码编号
        /// </summary>
        public int contrc_code_no { get; set; }
 
        /// <summary>
        /// 本币币种串
        /// </summary>
        public String crncy_type_str { get; set; }
 
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
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
 
            packer.AddField("init_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_group_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("asset_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_no_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("futu_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("contrc_code_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("crncy_type_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("row_id", ELDDATATYPE.LD_DATATYPE_LONG);
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
 
            packer.AddInt(init_date);
            packer.AddInt(co_no);
            packer.AddInt(pd_no);
            packer.AddInt(exch_group_no);
            packer.AddInt(asset_acco_no);
            packer.AddStr(exch_no_str);
            packer.AddInt(futu_acco_no);
            packer.AddInt(contrc_code_no);
            packer.AddStr(crncy_type_str);
            packer.AddInt64(row_id);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT,futu_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR_STR,crncy_type_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
 
            return fastMsg;
        }
    }

    //逻辑_产品外盘期货_持仓_查询历史对账记录
    public class ReqFuncpdfofuL_3_146DTO : ReqBaseDTO
    {
        public ReqFuncpdfofuL_3_146DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "pdfofuL.3.146";
            CommonDTO.func_code = CommonDTO.function_code;
            begin_date = 0;
            end_date = 0;
            co_no = 0;
            pd_no = 0;
            exch_group_no = 0;
            asset_acco_no = 0;
            exch_no_str = " ";
            futu_acco_no = 0;
            contrc_code_no = 0;
            crncy_type_str = " ";
            row_id = 0;
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
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// 市场编号串
        /// </summary>
        public String exch_no_str { get; set; }
 
        /// <summary>
        /// 交易编码编号
        /// </summary>
        public int futu_acco_no { get; set; }
 
        /// <summary>
        /// 合约代码编号
        /// </summary>
        public int contrc_code_no { get; set; }
 
        /// <summary>
        /// 本币币种串
        /// </summary>
        public String crncy_type_str { get; set; }
 
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
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
            packer.AddField("asset_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_no_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("futu_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("contrc_code_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("crncy_type_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("row_id", ELDDATATYPE.LD_DATATYPE_LONG);
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
            packer.AddInt(asset_acco_no);
            packer.AddStr(exch_no_str);
            packer.AddInt(futu_acco_no);
            packer.AddInt(contrc_code_no);
            packer.AddStr(crncy_type_str);
            packer.AddInt64(row_id);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT,futu_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR_STR,crncy_type_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
 
            return fastMsg;
        }
    }

}
