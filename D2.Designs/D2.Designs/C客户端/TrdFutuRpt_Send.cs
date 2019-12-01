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
    //逻辑_交易期货_报盘_处理订单回报
    public class ReqFunctdfutuL_5_1DTO : ReqBaseDTO
    {
        public ReqFunctdfutuL_5_1DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "tdfutuL.5.1";
            CommonDTO.func_code = CommonDTO.function_code;
            pd_no = 0;
            exch_group_no = 0;
            asset_acco_no = 0;
            pass_no = 0;
            exch_no = 0;
            out_acco = " ";
            futu_acco = " ";
            contrc_code = " ";
            contrc_type = 0;
            report_date = 0;
            report_time = 0;
            report_no = " ";
            order_id = 0;
            order_price = 0;
            order_qty = 0;
            order_dir = 0;
            contrc_dir = 0;
            hedge_type = 0;
            rsp_info = " ";
            rsp_status = "0";
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
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// 通道编号
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 外部账号
        /// </summary>
        public String out_acco { get; set; }
 
        /// <summary>
        /// 交易编码
        /// </summary>
        public String futu_acco { get; set; }
 
        /// <summary>
        /// 合约代码
        /// </summary>
        public String contrc_code { get; set; }
 
        /// <summary>
        /// 合约类型
        /// </summary>
        public int contrc_type { get; set; }
 
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
        /// 订单序号
        /// </summary>
        public ulong order_id { get; set; }
 
        /// <summary>
        /// 订单价格
        /// </summary>
        public double order_price { get; set; }
 
        /// <summary>
        /// 订单数量
        /// </summary>
        public double order_qty { get; set; }
 
        /// <summary>
        /// 订单方向
        /// </summary>
        public int order_dir { get; set; }
 
        /// <summary>
        /// 开平方向
        /// </summary>
        public int contrc_dir { get; set; }
 
        /// <summary>
        /// 套保标志
        /// </summary>
        public int hedge_type { get; set; }
 
        /// <summary>
        /// 回报信息
        /// </summary>
        public String rsp_info { get; set; }
 
        /// <summary>
        /// 回报状态
        /// </summary>
        public String rsp_status { get; set; }
 
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
            packer.AddField("asset_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pass_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("out_acco", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("futu_acco", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("contrc_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("contrc_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("report_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("report_time", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("report_no", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("order_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("order_price", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("order_qty", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("order_dir", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("contrc_dir", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("hedge_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("rsp_info", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("rsp_status", ELDDATATYPE.LD_DATATYPE_STRING);
 
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
            packer.AddInt(asset_acco_no);
            packer.AddInt(pass_no);
            packer.AddInt(exch_no);
            packer.AddStr(out_acco);
            packer.AddStr(futu_acco);
            packer.AddStr(contrc_code);
            packer.AddInt(contrc_type);
            packer.AddInt(report_date);
            packer.AddInt(report_time);
            packer.AddStr(report_no);
            packer.AddInt64(order_id);
            packer.AddDouble(order_price);
            packer.AddDouble(order_qty);
            packer.AddInt(order_dir);
            packer.AddInt(contrc_dir);
            packer.AddInt(hedge_type);
            packer.AddStr(rsp_info);
            packer.AddStr(rsp_status);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR,out_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_STR,futu_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR,contrc_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT,contrc_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT,report_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_TIME_INT,report_time);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR,report_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64,order_id);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT,order_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT,order_qty);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT,order_dir);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_DIR_INT,contrc_dir);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT,hedge_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RSP_INFO_STR,rsp_info);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RSP_STATUS_STR,rsp_status);
 
            return fastMsg;
        }
    }

    //逻辑_交易期货_报盘_处理撤单回报
    public class ReqFunctdfutuL_5_11DTO : ReqBaseDTO
    {
        public ReqFunctdfutuL_5_11DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "tdfutuL.5.11";
            CommonDTO.func_code = CommonDTO.function_code;
            exch_no = 0;
            pass_no = 0;
            out_acco = " ";
            order_id = 0;
            report_date = 0;
            report_time = 0;
            report_no = " ";
            wtdraw_qty = 0;
            rsp_status = "0";
            rsp_info = " ";
        }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 通道编号
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// 外部账号
        /// </summary>
        public String out_acco { get; set; }
 
        /// <summary>
        /// 订单序号
        /// </summary>
        public ulong order_id { get; set; }
 
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
        /// 撤单数量
        /// </summary>
        public double wtdraw_qty { get; set; }
 
        /// <summary>
        /// 回报状态
        /// </summary>
        public String rsp_status { get; set; }
 
        /// <summary>
        /// 回报信息
        /// </summary>
        public String rsp_info { get; set; }
 
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
            packer.AddField("pass_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("out_acco", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("order_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("report_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("report_time", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("report_no", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("wtdraw_qty", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("rsp_status", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("rsp_info", ELDDATATYPE.LD_DATATYPE_STRING);
 
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
            packer.AddInt(pass_no);
            packer.AddStr(out_acco);
            packer.AddInt64(order_id);
            packer.AddInt(report_date);
            packer.AddInt(report_time);
            packer.AddStr(report_no);
            packer.AddDouble(wtdraw_qty);
            packer.AddStr(rsp_status);
            packer.AddStr(rsp_info);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR,out_acco);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64,order_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT,report_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_TIME_INT,report_time);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR,report_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_QTY_FLOAT,wtdraw_qty);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RSP_STATUS_STR,rsp_status);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RSP_INFO_STR,rsp_info);
 
            return fastMsg;
        }
    }

    //逻辑_交易期货_报盘_处理成交回报
    public class ReqFunctdfutuL_5_21DTO : ReqBaseDTO
    {
        public ReqFunctdfutuL_5_21DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "tdfutuL.5.21";
            CommonDTO.func_code = CommonDTO.function_code;
            pass_no = 0;
            exch_no = 0;
            out_acco = " ";
            futu_acco = " ";
            contrc_code = " ";
            contrc_dir = 0;
            hedge_type = 0;
            report_date = 0;
            report_no = " ";
            strike_date = 0;
            strike_time = 0;
            strike_no = " ";
            order_dir = 0;
            strike_price = 0;
            strike_qty = 0;
            strike_amt = 0;
            rsp_info = " ";
        }
 
        /// <summary>
        /// 通道编号
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 外部账号
        /// </summary>
        public String out_acco { get; set; }
 
        /// <summary>
        /// 交易编码
        /// </summary>
        public String futu_acco { get; set; }
 
        /// <summary>
        /// 合约代码
        /// </summary>
        public String contrc_code { get; set; }
 
        /// <summary>
        /// 开平方向
        /// </summary>
        public int contrc_dir { get; set; }
 
        /// <summary>
        /// 套保标志
        /// </summary>
        public int hedge_type { get; set; }
 
        /// <summary>
        /// 申报日期
        /// </summary>
        public int report_date { get; set; }
 
        /// <summary>
        /// 申报编号
        /// </summary>
        public String report_no { get; set; }
 
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
        /// 回报信息
        /// </summary>
        public String rsp_info { get; set; }
 
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
            packer.AddField("exch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("out_acco", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("futu_acco", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("contrc_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("contrc_dir", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("hedge_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("report_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("report_no", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("strike_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("strike_time", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("strike_no", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("order_dir", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("strike_price", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("strike_qty", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("strike_amt", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("rsp_info", ELDDATATYPE.LD_DATATYPE_STRING);
 
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
            packer.AddInt(exch_no);
            packer.AddStr(out_acco);
            packer.AddStr(futu_acco);
            packer.AddStr(contrc_code);
            packer.AddInt(contrc_dir);
            packer.AddInt(hedge_type);
            packer.AddInt(report_date);
            packer.AddStr(report_no);
            packer.AddInt(strike_date);
            packer.AddInt(strike_time);
            packer.AddStr(strike_no);
            packer.AddInt(order_dir);
            packer.AddDouble(strike_price);
            packer.AddDouble(strike_qty);
            packer.AddDouble(strike_amt);
            packer.AddStr(rsp_info);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR,out_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_STR,futu_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR,contrc_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_DIR_INT,contrc_dir);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT,hedge_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT,report_date);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR,report_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT,strike_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_TIME_INT,strike_time);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR,strike_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT,order_dir);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_PRICE_FLOAT,strike_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT,strike_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT,strike_amt);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RSP_INFO_STR,rsp_info);
 
            return fastMsg;
        }
    }

    //逻辑_交易期货_报盘_处理订单补单回报
    public class ReqFunctdfutuL_5_31DTO : ReqBaseDTO
    {
        public ReqFunctdfutuL_5_31DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "tdfutuL.5.31";
            CommonDTO.func_code = CommonDTO.function_code;
            pass_no = 0;
            out_acco = " ";
            exch_no = 0;
            futu_acco = " ";
            contrc_code = " ";
            external_no = 0;
            contrc_dir = 0;
            hedge_type = 0;
            report_date = 0;
            report_time = 0;
            report_no = " ";
            order_dir = 0;
            order_price = 0;
            order_qty = 0;
            order_status = "0";
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
        /// 外部编号
        /// </summary>
        public ulong external_no { get; set; }
 
        /// <summary>
        /// 开平方向
        /// </summary>
        public int contrc_dir { get; set; }
 
        /// <summary>
        /// 套保标志
        /// </summary>
        public int hedge_type { get; set; }
 
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
        /// 订单状态
        /// </summary>
        public String order_status { get; set; }
 
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
            packer.AddField("exch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("futu_acco", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("contrc_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("external_no", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("contrc_dir", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("hedge_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("report_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("report_time", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("report_no", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("order_dir", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("order_price", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("order_qty", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("order_status", ELDDATATYPE.LD_DATATYPE_STRING);
 
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
            packer.AddInt(exch_no);
            packer.AddStr(futu_acco);
            packer.AddStr(contrc_code);
            packer.AddInt64(external_no);
            packer.AddInt(contrc_dir);
            packer.AddInt(hedge_type);
            packer.AddInt(report_date);
            packer.AddInt(report_time);
            packer.AddStr(report_no);
            packer.AddInt(order_dir);
            packer.AddDouble(order_price);
            packer.AddDouble(order_qty);
            packer.AddStr(order_status);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_STR,futu_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR,contrc_code);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64,external_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_DIR_INT,contrc_dir);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT,hedge_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT,report_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_TIME_INT,report_time);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR,report_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT,order_dir);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT,order_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT,order_qty);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR,order_status);
 
            return fastMsg;
        }
    }

    //逻辑_交易期货_报盘_查询订单回报
    public class ReqFunctdfutuL_5_101DTO : ReqBaseDTO
    {
        public ReqFunctdfutuL_5_101DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "tdfutuL.5.101";
            CommonDTO.func_code = CommonDTO.function_code;
            exch_no_str = " ";
            futu_acco = " ";
            contrc_code = " ";
            order_dir_str = " ";
            rsp_status_str = " ";
            deal_status_str = " ";
            row_id = 0;
            row_count = -1;
        }
 
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
        /// 回报状态串
        /// </summary>
        public String rsp_status_str { get; set; }
 
        /// <summary>
        /// 处理状态串
        /// </summary>
        public String deal_status_str { get; set; }
 
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
 
            packer.AddField("exch_no_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("futu_acco", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("contrc_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("order_dir_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("rsp_status_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("deal_status_str", ELDDATATYPE.LD_DATATYPE_STRING);
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
 
            packer.AddStr(exch_no_str);
            packer.AddStr(futu_acco);
            packer.AddStr(contrc_code);
            packer.AddStr(order_dir_str);
            packer.AddStr(rsp_status_str);
            packer.AddStr(deal_status_str);
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

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_STR,futu_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR,contrc_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR,order_dir_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RSP_STATUS_STR_STR,rsp_status_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_STATUS_STR_STR,deal_status_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
 
            return fastMsg;
        }
    }

    //逻辑_交易期货_报盘_查询成交回报
    public class ReqFunctdfutuL_5_121DTO : ReqBaseDTO
    {
        public ReqFunctdfutuL_5_121DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "tdfutuL.5.121";
            CommonDTO.func_code = CommonDTO.function_code;
            exch_no_str = " ";
            futu_acco = " ";
            contrc_code = " ";
            order_dir_str = " ";
            deal_status_str = " ";
            row_id = 0;
            row_count = -1;
        }
 
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
        /// 处理状态串
        /// </summary>
        public String deal_status_str { get; set; }
 
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
 
            packer.AddField("exch_no_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("futu_acco", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("contrc_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("order_dir_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("deal_status_str", ELDDATATYPE.LD_DATATYPE_STRING);
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
 
            packer.AddStr(exch_no_str);
            packer.AddStr(futu_acco);
            packer.AddStr(contrc_code);
            packer.AddStr(order_dir_str);
            packer.AddStr(deal_status_str);
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

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_STR,futu_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR,contrc_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR,order_dir_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_STATUS_STR_STR,deal_status_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
 
            return fastMsg;
        }
    }

    //逻辑_交易期货_报盘_查询成交明细
    public class ReqFunctdfutuL_5_122DTO : ReqBaseDTO
    {
        public ReqFunctdfutuL_5_122DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "tdfutuL.5.122";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            pd_no = 0;
            exch_group_no = 0;
            exch_no_str = " ";
            pass_no = 0;
            contrc_code_no = 0;
            order_dir_str = " ";
            external_no = 0;
            comm_id = 0;
            comm_batch_no = 0;
            row_id = 0;
            query_type = 0;
            sort_type = 1;
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
        /// 市场编号串
        /// </summary>
        public String exch_no_str { get; set; }
 
        /// <summary>
        /// 通道编号
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// 合约代码编号
        /// </summary>
        public int contrc_code_no { get; set; }
 
        /// <summary>
        /// 订单方向串
        /// </summary>
        public String order_dir_str { get; set; }
 
        /// <summary>
        /// 外部编号
        /// </summary>
        public ulong external_no { get; set; }
 
        /// <summary>
        /// 指令序号
        /// </summary>
        public ulong comm_id { get; set; }
 
        /// <summary>
        /// 指令批号
        /// </summary>
        public int comm_batch_no { get; set; }
 
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 查询方式
        /// </summary>
        public int query_type { get; set; }
 
        /// <summary>
        /// 排序方式
        /// </summary>
        public int sort_type { get; set; }
 
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
            packer.AddField("exch_no_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("pass_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("contrc_code_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("order_dir_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("external_no", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("comm_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("comm_batch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("row_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("query_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("sort_type", ELDDATATYPE.LD_DATATYPE_INT);
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
            packer.AddStr(exch_no_str);
            packer.AddInt(pass_no);
            packer.AddInt(contrc_code_no);
            packer.AddStr(order_dir_str);
            packer.AddInt64(external_no);
            packer.AddInt64(comm_id);
            packer.AddInt(comm_batch_no);
            packer.AddInt64(row_id);
            packer.AddInt(query_type);
            packer.AddInt(sort_type);
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
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR,order_dir_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64,external_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64,comm_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT,comm_batch_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_TYPE_INT,query_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SORT_TYPE_INT,sort_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
 
            return fastMsg;
        }
    }

    //逻辑_交易期货_报盘_查询成交明细历史
    public class ReqFunctdfutuL_5_123DTO : ReqBaseDTO
    {
        public ReqFunctdfutuL_5_123DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "tdfutuL.5.123";
            CommonDTO.func_code = CommonDTO.function_code;
            begin_date = 0;
            end_date = 0;
            co_no = 0;
            pd_no = 0;
            exch_group_no = 0;
            exch_no_str = " ";
            pass_no = 0;
            contrc_code_no = 0;
            order_dir_str = " ";
            external_no = 0;
            comm_id = 0;
            comm_batch_no = 0;
            row_id = 0;
            query_type = 0;
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
        /// 市场编号串
        /// </summary>
        public String exch_no_str { get; set; }
 
        /// <summary>
        /// 通道编号
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// 合约代码编号
        /// </summary>
        public int contrc_code_no { get; set; }
 
        /// <summary>
        /// 订单方向串
        /// </summary>
        public String order_dir_str { get; set; }
 
        /// <summary>
        /// 外部编号
        /// </summary>
        public ulong external_no { get; set; }
 
        /// <summary>
        /// 指令序号
        /// </summary>
        public ulong comm_id { get; set; }
 
        /// <summary>
        /// 指令批号
        /// </summary>
        public int comm_batch_no { get; set; }
 
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 查询方式
        /// </summary>
        public int query_type { get; set; }
 
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
            packer.AddField("exch_no_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("pass_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("contrc_code_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("order_dir_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("external_no", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("comm_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("comm_batch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("row_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("query_type", ELDDATATYPE.LD_DATATYPE_INT);
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
            packer.AddStr(exch_no_str);
            packer.AddInt(pass_no);
            packer.AddInt(contrc_code_no);
            packer.AddStr(order_dir_str);
            packer.AddInt64(external_no);
            packer.AddInt64(comm_id);
            packer.AddInt(comm_batch_no);
            packer.AddInt64(row_id);
            packer.AddInt(query_type);
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
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR,order_dir_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64,external_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64,comm_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT,comm_batch_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_TYPE_INT,query_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
 
            return fastMsg;
        }
    }

}
