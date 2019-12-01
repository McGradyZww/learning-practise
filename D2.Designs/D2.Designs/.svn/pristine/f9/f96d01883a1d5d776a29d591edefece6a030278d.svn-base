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
    //逻辑_清算证券_清算_转入成交记录
    public class ReqFuncclsecuL_2_1DTO : ReqBaseDTO
    {
        public ReqFuncclsecuL_2_1DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "clsecuL.2.1";
            CommonDTO.func_code = CommonDTO.function_code;
            qry_no = 0;
        }
 
        /// <summary>
        /// 查询序号
        /// </summary>
        public int qry_no { get; set; }
 
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
 
            packer.AddField("qry_no", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(qry_no);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_NO_INT,qry_no);
 
            return fastMsg;
        }
    }

    //逻辑_清算证券_清算_转入基金交易记录
    public class ReqFuncclsecuL_2_2DTO : ReqBaseDTO
    {
        public ReqFuncclsecuL_2_2DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "clsecuL.2.2";
            CommonDTO.func_code = CommonDTO.function_code;
            qry_no = 0;
        }
 
        /// <summary>
        /// 查询序号
        /// </summary>
        public int qry_no { get; set; }
 
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
 
            packer.AddField("qry_no", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(qry_no);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_NO_INT,qry_no);
 
            return fastMsg;
        }
    }

    //逻辑_清算证券_清算_查询成交记录
    public class ReqFuncclsecuL_2_3DTO : ReqBaseDTO
    {
        public ReqFuncclsecuL_2_3DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "clsecuL.2.3";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            pd_no = 0;
            exch_group_no = 0;
            asset_acco_no = 0;
            exch_no_str = " ";
            stock_acco_no = 0;
            stock_code_no = 0;
            strike_date = 0;
            strike_no = " ";
            order_dir_str = " ";
            deal_flag = 0;
            row_id = 0;
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
        /// 市场编号串
        /// </summary>
        public String exch_no_str { get; set; }
 
        /// <summary>
        /// 股东代码编号
        /// </summary>
        public int stock_acco_no { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 成交日期
        /// </summary>
        public int strike_date { get; set; }
 
        /// <summary>
        /// 成交编号
        /// </summary>
        public String strike_no { get; set; }
 
        /// <summary>
        /// 订单方向串
        /// </summary>
        public String order_dir_str { get; set; }
 
        /// <summary>
        /// 处理标志
        /// </summary>
        public int deal_flag { get; set; }
 
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
 
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_group_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("asset_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_no_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("stock_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_code_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("strike_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("strike_no", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("order_dir_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("deal_flag", ELDDATATYPE.LD_DATATYPE_INT);
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
 
            packer.AddInt(co_no);
            packer.AddInt(pd_no);
            packer.AddInt(exch_group_no);
            packer.AddInt(asset_acco_no);
            packer.AddStr(exch_no_str);
            packer.AddInt(stock_acco_no);
            packer.AddInt(stock_code_no);
            packer.AddInt(strike_date);
            packer.AddStr(strike_no);
            packer.AddStr(order_dir_str);
            packer.AddInt(deal_flag);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT,stock_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT,strike_date);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR,strike_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR,order_dir_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_FLAG_INT,deal_flag);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
 
            return fastMsg;
        }
    }

    //逻辑_清算证券_清算_查询转入成交记录
    public class ReqFuncclsecuL_2_4DTO : ReqBaseDTO
    {
        public ReqFuncclsecuL_2_4DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "clsecuL.2.4";
            CommonDTO.func_code = CommonDTO.function_code;
            sett_flag = 0;
        }
 
        /// <summary>
        /// 清算结算标志
        /// </summary>
        public int sett_flag { get; set; }
 
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
 
            packer.AddField("sett_flag", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(sett_flag);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SETT_FLAG_INT,sett_flag);
 
            return fastMsg;
        }
    }

    //逻辑_清算证券_清算_清算处理
    public class ReqFuncclsecuL_2_11DTO : ReqBaseDTO
    {
        public ReqFuncclsecuL_2_11DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "clsecuL.2.11";
            CommonDTO.func_code = CommonDTO.function_code;
            qry_no = 0;
        }
 
        /// <summary>
        /// 查询序号
        /// </summary>
        public int qry_no { get; set; }
 
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
 
            packer.AddField("qry_no", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(qry_no);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_NO_INT,qry_no);
 
            return fastMsg;
        }
    }

    //逻辑_清算证券_清算_查询合并清算记录
    public class ReqFuncclsecuL_2_13DTO : ReqBaseDTO
    {
        public ReqFuncclsecuL_2_13DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "clsecuL.2.13";
            CommonDTO.func_code = CommonDTO.function_code;
            strike_date = 0;
            busi_flag = 0;
            deal_flag = 0;
            row_id = 0;
            row_count = -1;
        }
 
        /// <summary>
        /// 成交日期
        /// </summary>
        public int strike_date { get; set; }
 
        /// <summary>
        /// 业务标志
        /// </summary>
        public int busi_flag { get; set; }
 
        /// <summary>
        /// 处理标志
        /// </summary>
        public int deal_flag { get; set; }
 
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
            packer.AddField("busi_flag", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("deal_flag", ELDDATATYPE.LD_DATATYPE_INT);
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
            packer.AddInt(busi_flag);
            packer.AddInt(deal_flag);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT,busi_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_FLAG_INT,deal_flag);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
 
            return fastMsg;
        }
    }

    //逻辑_清算证券_清算_合并清算处理
    public class ReqFuncclsecuL_2_15DTO : ReqBaseDTO
    {
        public ReqFuncclsecuL_2_15DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "clsecuL.2.15";
            CommonDTO.func_code = CommonDTO.function_code;
            qry_no = 0;
        }
 
        /// <summary>
        /// 查询序号
        /// </summary>
        public int qry_no { get; set; }
 
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
 
            packer.AddField("qry_no", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(qry_no);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_NO_INT,qry_no);
 
            return fastMsg;
        }
    }

    //逻辑_清算证券_清算_查询待入账记录
    public class ReqFuncclsecuL_2_23DTO : ReqBaseDTO
    {
        public ReqFuncclsecuL_2_23DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "clsecuL.2.23";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            pd_no = 0;
            exch_group_no = 0;
            asset_acco_no = 0;
            exch_no_str = " ";
            stock_acco_no = 0;
            stock_code_no = 0;
            crncy_type_str = " ";
            entry_status = "0";
            undo_status = "0";
            row_id = 0;
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
        /// 市场编号串
        /// </summary>
        public String exch_no_str { get; set; }
 
        /// <summary>
        /// 股东代码编号
        /// </summary>
        public int stock_acco_no { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 本币币种串
        /// </summary>
        public String crncy_type_str { get; set; }
 
        /// <summary>
        /// 入账状态
        /// </summary>
        public String entry_status { get; set; }
 
        /// <summary>
        /// 回滚状态
        /// </summary>
        public String undo_status { get; set; }
 
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
 
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_group_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("asset_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_no_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("stock_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_code_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("crncy_type_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("entry_status", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("undo_status", ELDDATATYPE.LD_DATATYPE_STRING);
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
 
            packer.AddInt(co_no);
            packer.AddInt(pd_no);
            packer.AddInt(exch_group_no);
            packer.AddInt(asset_acco_no);
            packer.AddStr(exch_no_str);
            packer.AddInt(stock_acco_no);
            packer.AddInt(stock_code_no);
            packer.AddStr(crncy_type_str);
            packer.AddStr(entry_status);
            packer.AddStr(undo_status);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT,stock_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR_STR,crncy_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_STATUS_STR,entry_status);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_UNDO_STATUS_STR,undo_status);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
 
            return fastMsg;
        }
    }

    //逻辑_清算证券_清算_入账处理
    public class ReqFuncclsecuL_2_24DTO : ReqBaseDTO
    {
        public ReqFuncclsecuL_2_24DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "clsecuL.2.24";
            CommonDTO.func_code = CommonDTO.function_code;
            qry_no = 0;
        }
 
        /// <summary>
        /// 查询序号
        /// </summary>
        public int qry_no { get; set; }
 
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
 
            packer.AddField("qry_no", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(qry_no);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_NO_INT,qry_no);
 
            return fastMsg;
        }
    }

    //逻辑_清算证券_清算_入账回滚处理
    public class ReqFuncclsecuL_2_25DTO : ReqBaseDTO
    {
        public ReqFuncclsecuL_2_25DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "clsecuL.2.25";
            CommonDTO.func_code = CommonDTO.function_code;
            query_row_id = 0;
        }
 
        /// <summary>
        /// 查询记录序号
        /// </summary>
        public ulong query_row_id { get; set; }
 
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
 
            packer.AddField("query_row_id", ELDDATATYPE.LD_DATATYPE_LONG);
 
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
 
            packer.AddInt64(query_row_id);
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

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_ROW_ID_INT64,query_row_id);
 
            return fastMsg;
        }
    }

    //逻辑_清算证券_清算_成交转入定时任务
    public class ReqFuncclsecuL_2_151DTO : ReqBaseDTO
    {
        public ReqFuncclsecuL_2_151DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "clsecuL.2.151";
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

    //逻辑_清算证券_清算_清算处理定时任务
    public class ReqFuncclsecuL_2_153DTO : ReqBaseDTO
    {
        public ReqFuncclsecuL_2_153DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "clsecuL.2.153";
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

    //逻辑_清算证券_清算_入账处理定时任务
    public class ReqFuncclsecuL_2_154DTO : ReqBaseDTO
    {
        public ReqFuncclsecuL_2_154DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "clsecuL.2.154";
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

    //逻辑_清算证券_清算_数据统计
    public class ReqFuncclsecuL_2_201DTO : ReqBaseDTO
    {
        public ReqFuncclsecuL_2_201DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "clsecuL.2.201";
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

    //逻辑_清算证券_清算_查询统计数据
    public class ReqFuncclsecuL_2_202DTO : ReqBaseDTO
    {
        public ReqFuncclsecuL_2_202DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "clsecuL.2.202";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            pd_no = 0;
            exch_group_no = 0;
            asset_acco_no = 0;
            exch_no_str = " ";
            stock_acco_no = 0;
            stock_code_no = 0;
            row_id = 0;
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
        /// 市场编号串
        /// </summary>
        public String exch_no_str { get; set; }
 
        /// <summary>
        /// 股东代码编号
        /// </summary>
        public int stock_acco_no { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
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
 
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_group_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("asset_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_no_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("stock_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_code_no", ELDDATATYPE.LD_DATATYPE_INT);
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
 
            packer.AddInt(co_no);
            packer.AddInt(pd_no);
            packer.AddInt(exch_group_no);
            packer.AddInt(asset_acco_no);
            packer.AddStr(exch_no_str);
            packer.AddInt(stock_acco_no);
            packer.AddInt(stock_code_no);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT,stock_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
 
            return fastMsg;
        }
    }

    //逻辑_清算证券_清算_获取汇总统计值
    public class ReqFuncclsecuL_2_203DTO : ReqBaseDTO
    {
        public ReqFuncclsecuL_2_203DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "clsecuL.2.203";
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

    //逻辑_清算证券_清算_查询成交记录序号
    public class ReqFuncclsecuL_2_204DTO : ReqBaseDTO
    {
        public ReqFuncclsecuL_2_204DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "clsecuL.2.204";
            CommonDTO.func_code = CommonDTO.function_code;
            qry_no = 0;
            row_count = -1;
        }
 
        /// <summary>
        /// 查询序号
        /// </summary>
        public int qry_no { get; set; }
 
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
 
            packer.AddField("qry_no", ELDDATATYPE.LD_DATATYPE_INT);
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
 
            packer.AddInt(qry_no);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_NO_INT,qry_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
 
            return fastMsg;
        }
    }

    //逻辑_清算证券_清算_查询清算成交记录序号
    public class ReqFuncclsecuL_2_205DTO : ReqBaseDTO
    {
        public ReqFuncclsecuL_2_205DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "clsecuL.2.205";
            CommonDTO.func_code = CommonDTO.function_code;
            qry_no = 0;
            row_count = -1;
        }
 
        /// <summary>
        /// 查询序号
        /// </summary>
        public int qry_no { get; set; }
 
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
 
            packer.AddField("qry_no", ELDDATATYPE.LD_DATATYPE_INT);
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
 
            packer.AddInt(qry_no);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_NO_INT,qry_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
 
            return fastMsg;
        }
    }

    //逻辑_清算证券_清算_查询合并清算记录序号
    public class ReqFuncclsecuL_2_206DTO : ReqBaseDTO
    {
        public ReqFuncclsecuL_2_206DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "clsecuL.2.206";
            CommonDTO.func_code = CommonDTO.function_code;
            qry_no = 0;
            row_count = -1;
        }
 
        /// <summary>
        /// 查询序号
        /// </summary>
        public int qry_no { get; set; }
 
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
 
            packer.AddField("qry_no", ELDDATATYPE.LD_DATATYPE_INT);
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
 
            packer.AddInt(qry_no);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_NO_INT,qry_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
 
            return fastMsg;
        }
    }

    //逻辑_清算证券_清算_查询待入账记录序号
    public class ReqFuncclsecuL_2_207DTO : ReqBaseDTO
    {
        public ReqFuncclsecuL_2_207DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "clsecuL.2.207";
            CommonDTO.func_code = CommonDTO.function_code;
            qry_no = 0;
            row_count = -1;
        }
 
        /// <summary>
        /// 查询序号
        /// </summary>
        public int qry_no { get; set; }
 
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
 
            packer.AddField("qry_no", ELDDATATYPE.LD_DATATYPE_INT);
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
 
            packer.AddInt(qry_no);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_NO_INT,qry_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
 
            return fastMsg;
        }
    }

    //逻辑_清算证券_清算_A股入账前检查
    public class ReqFuncclsecuL_2_208DTO : ReqBaseDTO
    {
        public ReqFuncclsecuL_2_208DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "clsecuL.2.208";
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

    //逻辑_清算证券_清算_批量转入成交记录
    public class ReqFuncclsecuL_2_209DTO : ReqBaseDTO
    {
        public ReqFuncclsecuL_2_209DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "clsecuL.2.209";
            CommonDTO.func_code = CommonDTO.function_code;
            row_id_str = " ";
        }
 
        /// <summary>
        /// 记录序号串
        /// </summary>
        public String row_id_str { get; set; }
 
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
 
            packer.AddField("row_id_str", ELDDATATYPE.LD_DATATYPE_STRING);
 
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
 
            packer.AddStr(row_id_str);
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

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_STR_STR,row_id_str);
 
            return fastMsg;
        }
    }

}
