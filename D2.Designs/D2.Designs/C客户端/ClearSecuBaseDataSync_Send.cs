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
    //逻辑_清算证券_基础数据同步_查询公司行为表
    public class ReqFuncclsecuL_4_101DTO : ReqBaseDTO
    {
        public ReqFuncclsecuL_4_101DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "clsecuL.4.101";
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

    //逻辑_清算证券_基础数据同步_更新公司行为表
    public class ReqFuncclsecuL_4_102DTO : ReqBaseDTO
    {
        public ReqFuncclsecuL_4_102DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "clsecuL.4.102";
            CommonDTO.func_code = CommonDTO.function_code;
            exch_no = 0;
            stock_code = " ";
            stock_code_no = 0;
            stock_type = 0;
            asset_type = 0;
            crncy_type = "CNY";
            par_value = 0;
            divi_cacl_num = 0;
            divi_amt = 0;
            divi_qty = 0;
            equity_trans_qty = 0;
            rights_issue_qty = 0;
            placement_price = 0;
            notice_date = 0;
            reg_date = 0;
            ex_date = 0;
            arrive_date = 0;
            begin_trade_date = 0;
            deal_flag = 0;
            busi_flag = 0;
        }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
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
        /// 本币币种
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// 票面面值
        /// </summary>
        public double par_value { get; set; }
 
        /// <summary>
        /// 行为单位
        /// </summary>
        public int divi_cacl_num { get; set; }
 
        /// <summary>
        /// 分红金额
        /// </summary>
        public double divi_amt { get; set; }
 
        /// <summary>
        /// 红股数量
        /// </summary>
        public double divi_qty { get; set; }
 
        /// <summary>
        /// 转赠数量
        /// </summary>
        public double equity_trans_qty { get; set; }
 
        /// <summary>
        /// 配股数量
        /// </summary>
        public double rights_issue_qty { get; set; }
 
        /// <summary>
        /// 配股价格
        /// </summary>
        public double placement_price { get; set; }
 
        /// <summary>
        /// 公告日期
        /// </summary>
        public int notice_date { get; set; }
 
        /// <summary>
        /// 登记日期
        /// </summary>
        public int reg_date { get; set; }
 
        /// <summary>
        /// 除权日期
        /// </summary>
        public int ex_date { get; set; }
 
        /// <summary>
        /// 到账日期
        /// </summary>
        public int arrive_date { get; set; }
 
        /// <summary>
        /// 上市日期
        /// </summary>
        public int begin_trade_date { get; set; }
 
        /// <summary>
        /// 处理标志
        /// </summary>
        public int deal_flag { get; set; }
 
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
 
            packer.AddField("exch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("stock_code_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("asset_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("crncy_type", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("par_value", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("divi_cacl_num", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("divi_amt", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("divi_qty", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("equity_trans_qty", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("rights_issue_qty", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("placement_price", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("notice_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("reg_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("ex_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("arrive_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("begin_trade_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("deal_flag", ELDDATATYPE.LD_DATATYPE_INT);
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
 
            packer.AddInt(exch_no);
            packer.AddStr(stock_code);
            packer.AddInt(stock_code_no);
            packer.AddInt(stock_type);
            packer.AddInt(asset_type);
            packer.AddStr(crncy_type);
            packer.AddDouble(par_value);
            packer.AddInt(divi_cacl_num);
            packer.AddDouble(divi_amt);
            packer.AddDouble(divi_qty);
            packer.AddDouble(equity_trans_qty);
            packer.AddDouble(rights_issue_qty);
            packer.AddDouble(placement_price);
            packer.AddInt(notice_date);
            packer.AddInt(reg_date);
            packer.AddInt(ex_date);
            packer.AddInt(arrive_date);
            packer.AddInt(begin_trade_date);
            packer.AddInt(deal_flag);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT,stock_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT,asset_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_FLOAT,par_value);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DIVI_CACL_NUM_INT,divi_cacl_num);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DIVI_AMT_FLOAT,divi_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DIVI_QTY_FLOAT,divi_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_EQUITY_TRANS_QTY_FLOAT,equity_trans_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RIGHTS_ISSUE_QTY_FLOAT,rights_issue_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PLACEMENT_PRICE_FLOAT,placement_price);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NOTICE_DATE_INT,notice_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REG_DATE_INT,reg_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EX_DATE_INT,ex_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ARRIVE_DATE_INT,arrive_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TRADE_DATE_INT,begin_trade_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_FLAG_INT,deal_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT,busi_flag);
 
            return fastMsg;
        }
    }

    //逻辑_清算证券_基础数据同步_更新公司行为信息
    public class ReqFuncclsecuL_4_103DTO : ReqBaseDTO
    {
        public ReqFuncclsecuL_4_103DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "clsecuL.4.103";
            CommonDTO.func_code = CommonDTO.function_code;
            exch_no_str = " ";
            stock_code_str = " ";
            stock_name_str = " ";
            divi_amt_str = " ";
            divi_qty_str = " ";
            equity_trans_qty_str = " ";
            notice_date_str = " ";
            reg_date_str = " ";
            ex_date_str = " ";
            arrive_date_str = " ";
            begin_trade_date_str = " ";
        }
 
        /// <summary>
        /// 市场编号串
        /// </summary>
        public String exch_no_str { get; set; }
 
        /// <summary>
        /// 证券代码串
        /// </summary>
        public String stock_code_str { get; set; }
 
        /// <summary>
        /// 证券名称串
        /// </summary>
        public String stock_name_str { get; set; }
 
        /// <summary>
        /// 分红金额串
        /// </summary>
        public String divi_amt_str { get; set; }
 
        /// <summary>
        /// 红股数量串
        /// </summary>
        public String divi_qty_str { get; set; }
 
        /// <summary>
        /// 转赠数量串
        /// </summary>
        public String equity_trans_qty_str { get; set; }
 
        /// <summary>
        /// 公告日期串
        /// </summary>
        public String notice_date_str { get; set; }
 
        /// <summary>
        /// 登记日期串
        /// </summary>
        public String reg_date_str { get; set; }
 
        /// <summary>
        /// 除权日期串
        /// </summary>
        public String ex_date_str { get; set; }
 
        /// <summary>
        /// 到账日期串
        /// </summary>
        public String arrive_date_str { get; set; }
 
        /// <summary>
        /// 上市日期串
        /// </summary>
        public String begin_trade_date_str { get; set; }
 
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
 
            packer.AddField("exch_no_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("stock_code_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("stock_name_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("divi_amt_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("divi_qty_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("equity_trans_qty_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("notice_date_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("reg_date_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("ex_date_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("arrive_date_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("begin_trade_date_str", ELDDATATYPE.LD_DATATYPE_STRING);
 
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
 
            packer.AddStr(exch_no_str);
            packer.AddStr(stock_code_str);
            packer.AddStr(stock_name_str);
            packer.AddStr(divi_amt_str);
            packer.AddStr(divi_qty_str);
            packer.AddStr(equity_trans_qty_str);
            packer.AddStr(notice_date_str);
            packer.AddStr(reg_date_str);
            packer.AddStr(ex_date_str);
            packer.AddStr(arrive_date_str);
            packer.AddStr(begin_trade_date_str);
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

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR_STR,stock_code_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR_STR,stock_name_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_DIVI_AMT_STR_STR,divi_amt_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_DIVI_QTY_STR_STR,divi_qty_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EQUITY_TRANS_QTY_STR_STR,equity_trans_qty_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_NOTICE_DATE_STR_STR,notice_date_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REG_DATE_STR_STR,reg_date_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EX_DATE_STR_STR,ex_date_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ARRIVE_DATE_STR_STR,arrive_date_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TRADE_DATE_STR_STR,begin_trade_date_str);
 
            return fastMsg;
        }
    }

    //逻辑_清算证券_基础数据同步_更新债券兑付信息
    public class ReqFuncclsecuL_4_104DTO : ReqBaseDTO
    {
        public ReqFuncclsecuL_4_104DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "clsecuL.4.104";
            CommonDTO.func_code = CommonDTO.function_code;
            exch_no_str = " ";
            stock_code_str = " ";
            stock_name_str = " ";
            redem_start_date_str = " ";
            redem_pay_price_str = " ";
        }
 
        /// <summary>
        /// 市场编号串
        /// </summary>
        public String exch_no_str { get; set; }
 
        /// <summary>
        /// 证券代码串
        /// </summary>
        public String stock_code_str { get; set; }
 
        /// <summary>
        /// 证券名称串
        /// </summary>
        public String stock_name_str { get; set; }
 
        /// <summary>
        /// 兑付起始日期串
        /// </summary>
        public String redem_start_date_str { get; set; }
 
        /// <summary>
        /// 兑付本息和串
        /// </summary>
        public String redem_pay_price_str { get; set; }
 
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
 
            packer.AddField("exch_no_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("stock_code_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("stock_name_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("redem_start_date_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("redem_pay_price_str", ELDDATATYPE.LD_DATATYPE_STRING);
 
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
 
            packer.AddStr(exch_no_str);
            packer.AddStr(stock_code_str);
            packer.AddStr(stock_name_str);
            packer.AddStr(redem_start_date_str);
            packer.AddStr(redem_pay_price_str);
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

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR_STR,stock_code_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR_STR,stock_name_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REDEM_START_DATE_STR_STR,redem_start_date_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REDEM_PAY_PRICE_STR_STR,redem_pay_price_str);
 
            return fastMsg;
        }
    }

    //逻辑_清算证券_基础数据同步_更新债券兑息信息
    public class ReqFuncclsecuL_4_105DTO : ReqBaseDTO
    {
        public ReqFuncclsecuL_4_105DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "clsecuL.4.105";
            CommonDTO.func_code = CommonDTO.function_code;
            exch_no_str = " ";
            stock_code_str = " ";
            stock_name_str = " ";
            intere_start_date_str = " ";
            interest_str = " ";
            interest_taxed_str = " ";
        }
 
        /// <summary>
        /// 市场编号串
        /// </summary>
        public String exch_no_str { get; set; }
 
        /// <summary>
        /// 证券代码串
        /// </summary>
        public String stock_code_str { get; set; }
 
        /// <summary>
        /// 证券名称串
        /// </summary>
        public String stock_name_str { get; set; }
 
        /// <summary>
        /// 付息起始日期串
        /// </summary>
        public String intere_start_date_str { get; set; }
 
        /// <summary>
        /// 含税利息额串
        /// </summary>
        public String interest_str { get; set; }
 
        /// <summary>
        /// 扣税利息额串
        /// </summary>
        public String interest_taxed_str { get; set; }
 
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
 
            packer.AddField("exch_no_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("stock_code_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("stock_name_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("intere_start_date_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("interest_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("interest_taxed_str", ELDDATATYPE.LD_DATATYPE_STRING);
 
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
 
            packer.AddStr(exch_no_str);
            packer.AddStr(stock_code_str);
            packer.AddStr(stock_name_str);
            packer.AddStr(intere_start_date_str);
            packer.AddStr(interest_str);
            packer.AddStr(interest_taxed_str);
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

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR_STR,stock_code_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR_STR,stock_name_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_INTERE_START_DATE_STR_STR,intere_start_date_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_INTEREST_STR_STR,interest_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_INTEREST_TAXED_STR_STR,interest_taxed_str);
 
            return fastMsg;
        }
    }

}
