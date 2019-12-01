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
    //逻辑_公共_基础数据同步_查询新股信息表
    public class ReqFuncpubL_28_101DTO : ReqBaseDTO
    {
        public ReqFuncpubL_28_101DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "pubL.28.101";
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

    //逻辑_公共_基础数据同步_更新新股信息表
    public class ReqFuncpubL_28_102DTO : ReqBaseDTO
    {
        public ReqFuncpubL_28_102DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "pubL.28.102";
            CommonDTO.func_code = CommonDTO.function_code;
            exch_no = 0;
            stock_code = " ";
            stock_name = " ";
            trade_code = " ";
            target_code = " ";
            stock_code_no = 0;
            trade_code_no = 0;
            target_code_no = 0;
            apply_date = 0;
            apply_limit = 0;
            begin_trade_date = 0;
            issue_price = 0;
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
        /// 证券名称
        /// </summary>
        public String stock_name { get; set; }
 
        /// <summary>
        /// 交易代码
        /// </summary>
        public String trade_code { get; set; }
 
        /// <summary>
        /// 标的代码
        /// </summary>
        public String target_code { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 交易代码编号
        /// </summary>
        public int trade_code_no { get; set; }
 
        /// <summary>
        /// 标的代码编号
        /// </summary>
        public int target_code_no { get; set; }
 
        /// <summary>
        /// 申购日期
        /// </summary>
        public int apply_date { get; set; }
 
        /// <summary>
        /// 申购上限
        /// </summary>
        public double apply_limit { get; set; }
 
        /// <summary>
        /// 上市日期
        /// </summary>
        public int begin_trade_date { get; set; }
 
        /// <summary>
        /// 发行价
        /// </summary>
        public double issue_price { get; set; }
 
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
            packer.AddField("stock_name", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("trade_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("target_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("stock_code_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("trade_code_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("target_code_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("apply_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("apply_limit", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("begin_trade_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("issue_price", ELDDATATYPE.LD_DATATYPE_DOUBLE);
 
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
            packer.AddStr(stock_name);
            packer.AddStr(trade_code);
            packer.AddStr(target_code);
            packer.AddInt(stock_code_no);
            packer.AddInt(trade_code_no);
            packer.AddInt(target_code_no);
            packer.AddInt(apply_date);
            packer.AddDouble(apply_limit);
            packer.AddInt(begin_trade_date);
            packer.AddDouble(issue_price);
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
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR,stock_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_STR,trade_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_STR,target_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_NO_INT,trade_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_NO_INT,target_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_APPLY_DATE_INT,apply_date);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_APPLY_LIMIT_FLOAT,apply_limit);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TRADE_DATE_INT,begin_trade_date);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ISSUE_PRICE_FLOAT,issue_price);
 
            return fastMsg;
        }
    }

    //逻辑_公共_基础数据同步_查询证券代码信息表
    public class ReqFuncpubL_28_111DTO : ReqBaseDTO
    {
        public ReqFuncpubL_28_111DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "pubL.28.111";
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

    //逻辑_公共_基础数据同步_更新证券代码信息表
    public class ReqFuncpubL_28_112DTO : ReqBaseDTO
    {
        public ReqFuncpubL_28_112DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "pubL.28.112";
            CommonDTO.func_code = CommonDTO.function_code;
            stock_code_no = 0;
            exch_no = 0;
            stock_code = " ";
            stock_name = " ";
            pinyin_short = " ";
            stock_type = 0;
            asset_type = 0;
            par_value = 0;
            crncy_type = "CNY";
            exch_crncy_type = "CNY";
            total_stock_issue = 0;
            circl_stock_capit = 0;
            capit_reback_days = 0;
            posi_reback_days = 0;
            type_unit = 0;
            report_unit = 0;
            min_unit = 0;
            max_qty = 0;
            min_qty = 0;
            is_order_dir_flag = 0;
            price_up = 0;
            price_down = 0;
            step_price = 0;
            fair_price = 0;
            stop_status = "0";
            hk_stock_flag = 0;
            time_stamp = 0;
        }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 证券名称
        /// </summary>
        public String stock_name { get; set; }
 
        /// <summary>
        /// 拼音简称
        /// </summary>
        public String pinyin_short { get; set; }
 
        /// <summary>
        /// 证券类型
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// 资产类型
        /// </summary>
        public int asset_type { get; set; }
 
        /// <summary>
        /// 票面面值
        /// </summary>
        public double par_value { get; set; }
 
        /// <summary>
        /// 本币币种
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// 交易币种
        /// </summary>
        public String exch_crncy_type { get; set; }
 
        /// <summary>
        /// 总股本
        /// </summary>
        public double total_stock_issue { get; set; }
 
        /// <summary>
        /// 流通股本
        /// </summary>
        public double circl_stock_capit { get; set; }
 
        /// <summary>
        /// 资金回转天数
        /// </summary>
        public int capit_reback_days { get; set; }
 
        /// <summary>
        /// 持仓回转天数
        /// </summary>
        public int posi_reback_days { get; set; }
 
        /// <summary>
        /// 类型单位
        /// </summary>
        public int type_unit { get; set; }
 
        /// <summary>
        /// 申报单位
        /// </summary>
        public int report_unit { get; set; }
 
        /// <summary>
        /// 最小单位
        /// </summary>
        public int min_unit { get; set; }
 
        /// <summary>
        /// 最大数量
        /// </summary>
        public double max_qty { get; set; }
 
        /// <summary>
        /// 最小数量
        /// </summary>
        public double min_qty { get; set; }
 
        /// <summary>
        /// 区分订单方向标志
        /// </summary>
        public int is_order_dir_flag { get; set; }
 
        /// <summary>
        /// 价格上限
        /// </summary>
        public double price_up { get; set; }
 
        /// <summary>
        /// 价格下限
        /// </summary>
        public double price_down { get; set; }
 
        /// <summary>
        /// 最小价差
        /// </summary>
        public double step_price { get; set; }
 
        /// <summary>
        /// 公允价格
        /// </summary>
        public double fair_price { get; set; }
 
        /// <summary>
        /// 停牌标志
        /// </summary>
        public String stop_status { get; set; }
 
        /// <summary>
        /// 港股通标的
        /// </summary>
        public int hk_stock_flag { get; set; }
 
        /// <summary>
        /// 时间戳
        /// </summary>
        public int time_stamp { get; set; }
 
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
 
            packer.AddField("stock_code_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("stock_name", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("pinyin_short", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("stock_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("asset_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("par_value", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("crncy_type", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("exch_crncy_type", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("total_stock_issue", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("circl_stock_capit", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("capit_reback_days", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("posi_reback_days", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("type_unit", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("report_unit", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("min_unit", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("max_qty", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("min_qty", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("is_order_dir_flag", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("price_up", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("price_down", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("step_price", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("fair_price", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("stop_status", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("hk_stock_flag", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("time_stamp", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(stock_code_no);
            packer.AddInt(exch_no);
            packer.AddStr(stock_code);
            packer.AddStr(stock_name);
            packer.AddStr(pinyin_short);
            packer.AddInt(stock_type);
            packer.AddInt(asset_type);
            packer.AddDouble(par_value);
            packer.AddStr(crncy_type);
            packer.AddStr(exch_crncy_type);
            packer.AddDouble(total_stock_issue);
            packer.AddDouble(circl_stock_capit);
            packer.AddInt(capit_reback_days);
            packer.AddInt(posi_reback_days);
            packer.AddInt(type_unit);
            packer.AddInt(report_unit);
            packer.AddInt(min_unit);
            packer.AddDouble(max_qty);
            packer.AddDouble(min_qty);
            packer.AddInt(is_order_dir_flag);
            packer.AddDouble(price_up);
            packer.AddDouble(price_down);
            packer.AddDouble(step_price);
            packer.AddDouble(fair_price);
            packer.AddStr(stop_status);
            packer.AddInt(hk_stock_flag);
            packer.AddInt(time_stamp);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR,stock_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PINYIN_SHORT_STR,pinyin_short);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT,stock_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT,asset_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_FLOAT,par_value);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR,exch_crncy_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_STOCK_ISSUE_FLOAT,total_stock_issue);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CIRCL_STOCK_CAPIT_FLOAT,circl_stock_capit);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CAPIT_REBACK_DAYS_INT,capit_reback_days);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_POSI_REBACK_DAYS_INT,posi_reback_days);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TYPE_UNIT_INT,type_unit);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_UNIT_INT,report_unit);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MIN_UNIT_INT,min_unit);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_QTY_FLOAT,max_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_QTY_FLOAT,min_qty);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_ORDER_DIR_FLAG_INT,is_order_dir_flag);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_UP_FLOAT,price_up);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_DOWN_FLOAT,price_down);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STEP_PRICE_FLOAT,step_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FAIR_PRICE_FLOAT,fair_price);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOP_STATUS_STR,stop_status);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HK_STOCK_FLAG_INT,hk_stock_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT,time_stamp);
 
            return fastMsg;
        }
    }

    //逻辑_公共_基础数据同步_查询债券属性信息表
    public class ReqFuncpubL_28_121DTO : ReqBaseDTO
    {
        public ReqFuncpubL_28_121DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "pubL.28.121";
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

    //逻辑_公共_基础数据同步_更新债券属性信息表
    public class ReqFuncpubL_28_122DTO : ReqBaseDTO
    {
        public ReqFuncpubL_28_122DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "pubL.28.122";
            CommonDTO.func_code = CommonDTO.function_code;
            exch_no = 0;
            stock_code = " ";
            trade_code = " ";
            target_code = " ";
            stock_code_no = 0;
            trade_code_no = 0;
            target_code_no = 0;
            stock_name = " ";
            issue_date = 0;
            end_date = 0;
            value_date = 0;
            next_value_date = 0;
            begin_trade_date = 0;
            bond_limit = 0;
            issue_price = 0;
            par_value = 0;
            intrst_ratio = 0;
            intrst_days = 0;
            pay_inteval = 0;
            bond_accr_intrst = 0;
            bond_rate_type = 0;
            inteval_days = 0;
            net_price_flag = 0;
            last_trade_date = 0;
            rights_type = 0;
            trans_begin_date = 0;
            trans_end_date = 0;
            exec_begin_date = 0;
            exec_end_date = 0;
            impawn_ratio = 0;
            pay_intrst_flag = 0;
            time_stamp = 0;
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
        /// 交易代码
        /// </summary>
        public String trade_code { get; set; }
 
        /// <summary>
        /// 标的代码
        /// </summary>
        public String target_code { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 交易代码编号
        /// </summary>
        public int trade_code_no { get; set; }
 
        /// <summary>
        /// 标的代码编号
        /// </summary>
        public int target_code_no { get; set; }
 
        /// <summary>
        /// 证券名称
        /// </summary>
        public String stock_name { get; set; }
 
        /// <summary>
        /// 发行日期
        /// </summary>
        public int issue_date { get; set; }
 
        /// <summary>
        /// 结束日期
        /// </summary>
        public int end_date { get; set; }
 
        /// <summary>
        /// 起息日期
        /// </summary>
        public int value_date { get; set; }
 
        /// <summary>
        /// 下一起息日期
        /// </summary>
        public int next_value_date { get; set; }
 
        /// <summary>
        /// 上市日期
        /// </summary>
        public int begin_trade_date { get; set; }
 
        /// <summary>
        /// 债券期限
        /// </summary>
        public double bond_limit { get; set; }
 
        /// <summary>
        /// 发行价
        /// </summary>
        public double issue_price { get; set; }
 
        /// <summary>
        /// 票面面值
        /// </summary>
        public double par_value { get; set; }
 
        /// <summary>
        /// 年利率
        /// </summary>
        public double intrst_ratio { get; set; }
 
        /// <summary>
        /// 计息天数
        /// </summary>
        public int intrst_days { get; set; }
 
        /// <summary>
        /// 付息间隔
        /// </summary>
        public int pay_inteval { get; set; }
 
        /// <summary>
        /// 债券计提利息
        /// </summary>
        public double bond_accr_intrst { get; set; }
 
        /// <summary>
        /// 债券利率类型
        /// </summary>
        public int bond_rate_type { get; set; }
 
        /// <summary>
        /// 间隔天数
        /// </summary>
        public int inteval_days { get; set; }
 
        /// <summary>
        /// 净价标志
        /// </summary>
        public int net_price_flag { get; set; }
 
        /// <summary>
        /// 最后交易日
        /// </summary>
        public int last_trade_date { get; set; }
 
        /// <summary>
        /// 权益类型
        /// </summary>
        public int rights_type { get; set; }
 
        /// <summary>
        /// 转股开始日期
        /// </summary>
        public int trans_begin_date { get; set; }
 
        /// <summary>
        /// 转股结束日期
        /// </summary>
        public int trans_end_date { get; set; }
 
        /// <summary>
        /// 行权开始日期
        /// </summary>
        public int exec_begin_date { get; set; }
 
        /// <summary>
        /// 行权结束日期
        /// </summary>
        public int exec_end_date { get; set; }
 
        /// <summary>
        /// 质押比例
        /// </summary>
        public double impawn_ratio { get; set; }
 
        /// <summary>
        /// 付息标志
        /// </summary>
        public int pay_intrst_flag { get; set; }
 
        /// <summary>
        /// 时间戳
        /// </summary>
        public int time_stamp { get; set; }
 
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
            packer.AddField("trade_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("target_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("stock_code_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("trade_code_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("target_code_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_name", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("issue_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("end_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("value_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("next_value_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("begin_trade_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("bond_limit", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("issue_price", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("par_value", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("intrst_ratio", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("intrst_days", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pay_inteval", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("bond_accr_intrst", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("bond_rate_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("inteval_days", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("net_price_flag", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("last_trade_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("rights_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("trans_begin_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("trans_end_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exec_begin_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exec_end_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("impawn_ratio", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("pay_intrst_flag", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("time_stamp", ELDDATATYPE.LD_DATATYPE_INT);
 
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
            packer.AddStr(trade_code);
            packer.AddStr(target_code);
            packer.AddInt(stock_code_no);
            packer.AddInt(trade_code_no);
            packer.AddInt(target_code_no);
            packer.AddStr(stock_name);
            packer.AddInt(issue_date);
            packer.AddInt(end_date);
            packer.AddInt(value_date);
            packer.AddInt(next_value_date);
            packer.AddInt(begin_trade_date);
            packer.AddDouble(bond_limit);
            packer.AddDouble(issue_price);
            packer.AddDouble(par_value);
            packer.AddDouble(intrst_ratio);
            packer.AddInt(intrst_days);
            packer.AddInt(pay_inteval);
            packer.AddDouble(bond_accr_intrst);
            packer.AddInt(bond_rate_type);
            packer.AddInt(inteval_days);
            packer.AddInt(net_price_flag);
            packer.AddInt(last_trade_date);
            packer.AddInt(rights_type);
            packer.AddInt(trans_begin_date);
            packer.AddInt(trans_end_date);
            packer.AddInt(exec_begin_date);
            packer.AddInt(exec_end_date);
            packer.AddDouble(impawn_ratio);
            packer.AddInt(pay_intrst_flag);
            packer.AddInt(time_stamp);
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
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_STR,trade_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_STR,target_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_NO_INT,trade_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_NO_INT,target_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR,stock_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ISSUE_DATE_INT,issue_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT,end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_VALUE_DATE_INT,value_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NEXT_VALUE_DATE_INT,next_value_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TRADE_DATE_INT,begin_trade_date);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_LIMIT_FLOAT,bond_limit);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ISSUE_PRICE_FLOAT,issue_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_FLOAT,par_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_RATIO_FLOAT,intrst_ratio);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_DAYS_INT,intrst_days);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PAY_INTEVAL_INT,pay_inteval);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT,bond_accr_intrst);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BOND_RATE_TYPE_INT,bond_rate_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INTEVAL_DAYS_INT,inteval_days);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLAG_INT,net_price_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LAST_TRADE_DATE_INT,last_trade_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RIGHTS_TYPE_INT,rights_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_BEGIN_DATE_INT,trans_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_END_DATE_INT,trans_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_BEGIN_DATE_INT,exec_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_END_DATE_INT,exec_end_date);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_IMPAWN_RATIO_FLOAT,impawn_ratio);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PAY_INTRST_FLAG_INT,pay_intrst_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT,time_stamp);
 
            return fastMsg;
        }
    }

    //逻辑_公共_基础数据同步_查询证券行情表
    public class ReqFuncpubL_28_131DTO : ReqBaseDTO
    {
        public ReqFuncpubL_28_131DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "pubL.28.131";
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

    //逻辑_公共_基础数据同步_更新证券行情表
    public class ReqFuncpubL_28_132DTO : ReqBaseDTO
    {
        public ReqFuncpubL_28_132DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "pubL.28.132";
            CommonDTO.func_code = CommonDTO.function_code;
            stock_code_no = 0;
            exch_no = 0;
            stock_code = " ";
            stock_name = " ";
            up_limit_price = 0;
            down_limit_price = 0;
            last_price = 0;
            pre_close_price = 0;
            today_open_price = 0;
            today_close_price = 0;
            today_max_price = 0;
            today_min_price = 0;
            buy_price_1 = 0;
            buy_qty_1 = 0;
            buy_price_2 = 0;
            buy_qty_2 = 0;
            buy_price_3 = 0;
            buy_qty_3 = 0;
            buy_price_4 = 0;
            buy_qty_4 = 0;
            buy_price_5 = 0;
            buy_qty_5 = 0;
            sell_price_1 = 0;
            sell_qty_1 = 0;
            sell_price_2 = 0;
            sell_qty_2 = 0;
            sell_price_3 = 0;
            sell_qty_3 = 0;
            sell_price_4 = 0;
            sell_qty_4 = 0;
            sell_price_5 = 0;
            sell_qty_5 = 0;
            strike_qty = 0;
            strike_amt = 0;
            pe_ratio = 0;
            time_stamp = 0;
        }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 证券名称
        /// </summary>
        public String stock_name { get; set; }
 
        /// <summary>
        /// 涨停价
        /// </summary>
        public double up_limit_price { get; set; }
 
        /// <summary>
        /// 跌停价
        /// </summary>
        public double down_limit_price { get; set; }
 
        /// <summary>
        /// 最新价
        /// </summary>
        public double last_price { get; set; }
 
        /// <summary>
        /// 昨收盘价
        /// </summary>
        public double pre_close_price { get; set; }
 
        /// <summary>
        /// 今开盘价
        /// </summary>
        public double today_open_price { get; set; }
 
        /// <summary>
        /// 今收盘价
        /// </summary>
        public double today_close_price { get; set; }
 
        /// <summary>
        /// 今最高价
        /// </summary>
        public double today_max_price { get; set; }
 
        /// <summary>
        /// 今最低价
        /// </summary>
        public double today_min_price { get; set; }
 
        /// <summary>
        /// 买一价
        /// </summary>
        public double buy_price_1 { get; set; }
 
        /// <summary>
        /// 买一量
        /// </summary>
        public double buy_qty_1 { get; set; }
 
        /// <summary>
        /// 买二价
        /// </summary>
        public double buy_price_2 { get; set; }
 
        /// <summary>
        /// 买二量
        /// </summary>
        public double buy_qty_2 { get; set; }
 
        /// <summary>
        /// 买三价
        /// </summary>
        public double buy_price_3 { get; set; }
 
        /// <summary>
        /// 买三量
        /// </summary>
        public double buy_qty_3 { get; set; }
 
        /// <summary>
        /// 买四价
        /// </summary>
        public double buy_price_4 { get; set; }
 
        /// <summary>
        /// 买四量
        /// </summary>
        public double buy_qty_4 { get; set; }
 
        /// <summary>
        /// 买五价
        /// </summary>
        public double buy_price_5 { get; set; }
 
        /// <summary>
        /// 买五量
        /// </summary>
        public double buy_qty_5 { get; set; }
 
        /// <summary>
        /// 卖一价
        /// </summary>
        public double sell_price_1 { get; set; }
 
        /// <summary>
        /// 卖一量
        /// </summary>
        public double sell_qty_1 { get; set; }
 
        /// <summary>
        /// 卖二价
        /// </summary>
        public double sell_price_2 { get; set; }
 
        /// <summary>
        /// 卖二量
        /// </summary>
        public double sell_qty_2 { get; set; }
 
        /// <summary>
        /// 卖三价
        /// </summary>
        public double sell_price_3 { get; set; }
 
        /// <summary>
        /// 卖三量
        /// </summary>
        public double sell_qty_3 { get; set; }
 
        /// <summary>
        /// 卖四价
        /// </summary>
        public double sell_price_4 { get; set; }
 
        /// <summary>
        /// 卖四量
        /// </summary>
        public double sell_qty_4 { get; set; }
 
        /// <summary>
        /// 卖五价
        /// </summary>
        public double sell_price_5 { get; set; }
 
        /// <summary>
        /// 卖五量
        /// </summary>
        public double sell_qty_5 { get; set; }
 
        /// <summary>
        /// 成交数量
        /// </summary>
        public double strike_qty { get; set; }
 
        /// <summary>
        /// 成交金额
        /// </summary>
        public double strike_amt { get; set; }
 
        /// <summary>
        /// 市盈率
        /// </summary>
        public double pe_ratio { get; set; }
 
        /// <summary>
        /// 时间戳
        /// </summary>
        public int time_stamp { get; set; }
 
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
 
            packer.AddField("stock_code_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("stock_name", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("up_limit_price", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("down_limit_price", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("last_price", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("pre_close_price", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("today_open_price", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("today_close_price", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("today_max_price", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("today_min_price", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("buy_price_1", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("buy_qty_1", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("buy_price_2", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("buy_qty_2", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("buy_price_3", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("buy_qty_3", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("buy_price_4", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("buy_qty_4", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("buy_price_5", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("buy_qty_5", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("sell_price_1", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("sell_qty_1", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("sell_price_2", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("sell_qty_2", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("sell_price_3", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("sell_qty_3", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("sell_price_4", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("sell_qty_4", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("sell_price_5", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("sell_qty_5", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("strike_qty", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("strike_amt", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("pe_ratio", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("time_stamp", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(stock_code_no);
            packer.AddInt(exch_no);
            packer.AddStr(stock_code);
            packer.AddStr(stock_name);
            packer.AddDouble(up_limit_price);
            packer.AddDouble(down_limit_price);
            packer.AddDouble(last_price);
            packer.AddDouble(pre_close_price);
            packer.AddDouble(today_open_price);
            packer.AddDouble(today_close_price);
            packer.AddDouble(today_max_price);
            packer.AddDouble(today_min_price);
            packer.AddDouble(buy_price_1);
            packer.AddDouble(buy_qty_1);
            packer.AddDouble(buy_price_2);
            packer.AddDouble(buy_qty_2);
            packer.AddDouble(buy_price_3);
            packer.AddDouble(buy_qty_3);
            packer.AddDouble(buy_price_4);
            packer.AddDouble(buy_qty_4);
            packer.AddDouble(buy_price_5);
            packer.AddDouble(buy_qty_5);
            packer.AddDouble(sell_price_1);
            packer.AddDouble(sell_qty_1);
            packer.AddDouble(sell_price_2);
            packer.AddDouble(sell_qty_2);
            packer.AddDouble(sell_price_3);
            packer.AddDouble(sell_qty_3);
            packer.AddDouble(sell_price_4);
            packer.AddDouble(sell_qty_4);
            packer.AddDouble(sell_price_5);
            packer.AddDouble(sell_qty_5);
            packer.AddDouble(strike_qty);
            packer.AddDouble(strike_amt);
            packer.AddDouble(pe_ratio);
            packer.AddInt(time_stamp);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR,stock_name);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UP_LIMIT_PRICE_FLOAT,up_limit_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DOWN_LIMIT_PRICE_FLOAT,down_limit_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT,last_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_CLOSE_PRICE_FLOAT,pre_close_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_OPEN_PRICE_FLOAT,today_open_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_CLOSE_PRICE_FLOAT,today_close_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_MAX_PRICE_FLOAT,today_max_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_MIN_PRICE_FLOAT,today_min_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_PRICE_1_FLOAT,buy_price_1);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_QTY_1_FLOAT,buy_qty_1);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_PRICE_2_FLOAT,buy_price_2);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_QTY_2_FLOAT,buy_qty_2);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_PRICE_3_FLOAT,buy_price_3);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_QTY_3_FLOAT,buy_qty_3);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_PRICE_4_FLOAT,buy_price_4);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_QTY_4_FLOAT,buy_qty_4);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_PRICE_5_FLOAT,buy_price_5);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_QTY_5_FLOAT,buy_qty_5);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_PRICE_1_FLOAT,sell_price_1);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_QTY_1_FLOAT,sell_qty_1);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_PRICE_2_FLOAT,sell_price_2);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_QTY_2_FLOAT,sell_qty_2);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_PRICE_3_FLOAT,sell_price_3);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_QTY_3_FLOAT,sell_qty_3);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_PRICE_4_FLOAT,sell_price_4);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_QTY_4_FLOAT,sell_qty_4);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_PRICE_5_FLOAT,sell_price_5);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_QTY_5_FLOAT,sell_qty_5);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT,strike_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT,strike_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PE_RATIO_FLOAT,pe_ratio);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT,time_stamp);
 
            return fastMsg;
        }
    }

    //逻辑_公共_基础数据同步_查询代码映射表
    public class ReqFuncpubL_28_141DTO : ReqBaseDTO
    {
        public ReqFuncpubL_28_141DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "pubL.28.141";
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

    //逻辑_公共_基础数据同步_更新代码映射表
    public class ReqFuncpubL_28_142DTO : ReqBaseDTO
    {
        public ReqFuncpubL_28_142DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "pubL.28.142";
            CommonDTO.func_code = CommonDTO.function_code;
            stock_code_no = 0;
            stock_code = " ";
            exch_no = 0;
            trade_code = " ";
            target_code = " ";
            time_stamp = 0;
        }
 
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
 
        /// <summary>
        /// 交易代码
        /// </summary>
        public String trade_code { get; set; }
 
        /// <summary>
        /// 标的代码
        /// </summary>
        public String target_code { get; set; }
 
        /// <summary>
        /// 时间戳
        /// </summary>
        public int time_stamp { get; set; }
 
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
 
            packer.AddField("stock_code_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("exch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("trade_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("target_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("time_stamp", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(stock_code_no);
            packer.AddStr(stock_code);
            packer.AddInt(exch_no);
            packer.AddStr(trade_code);
            packer.AddStr(target_code);
            packer.AddInt(time_stamp);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_STR,trade_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_STR,target_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT,time_stamp);
 
            return fastMsg;
        }
    }

    //逻辑_公共_基础数据同步_查询证券代码订单方向表
    public class ReqFuncpubL_28_151DTO : ReqBaseDTO
    {
        public ReqFuncpubL_28_151DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "pubL.28.151";
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

    //逻辑_公共_基础数据同步_更新证券代码订单方向表
    public class ReqFuncpubL_28_152DTO : ReqBaseDTO
    {
        public ReqFuncpubL_28_152DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "pubL.28.152";
            CommonDTO.func_code = CommonDTO.function_code;
            stock_code_no = 0;
            exch_no = 0;
            stock_code = " ";
            order_dir = 0;
            cash_frozen_type = 0;
            order_split_flag = 0;
            min_unit = 0;
            max_qty = 0;
            min_qty = 0;
            time_stamp = 0;
        }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 订单方向
        /// </summary>
        public int order_dir { get; set; }
 
        /// <summary>
        /// 资金冻结方式
        /// </summary>
        public int cash_frozen_type { get; set; }
 
        /// <summary>
        /// 订单数量拆分标志
        /// </summary>
        public int order_split_flag { get; set; }
 
        /// <summary>
        /// 最小单位
        /// </summary>
        public int min_unit { get; set; }
 
        /// <summary>
        /// 最大数量
        /// </summary>
        public double max_qty { get; set; }
 
        /// <summary>
        /// 最小数量
        /// </summary>
        public double min_qty { get; set; }
 
        /// <summary>
        /// 时间戳
        /// </summary>
        public int time_stamp { get; set; }
 
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
 
            packer.AddField("stock_code_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("order_dir", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("cash_frozen_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("order_split_flag", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("min_unit", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("max_qty", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("min_qty", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("time_stamp", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(stock_code_no);
            packer.AddInt(exch_no);
            packer.AddStr(stock_code);
            packer.AddInt(order_dir);
            packer.AddInt(cash_frozen_type);
            packer.AddInt(order_split_flag);
            packer.AddInt(min_unit);
            packer.AddDouble(max_qty);
            packer.AddDouble(min_qty);
            packer.AddInt(time_stamp);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT,order_dir);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CASH_FROZEN_TYPE_INT,cash_frozen_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_SPLIT_FLAG_INT,order_split_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MIN_UNIT_INT,min_unit);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_QTY_FLOAT,max_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_QTY_FLOAT,min_qty);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT,time_stamp);
 
            return fastMsg;
        }
    }

    //逻辑_公共_基础数据同步_查询港股通汇率表
    public class ReqFuncpubL_28_161DTO : ReqBaseDTO
    {
        public ReqFuncpubL_28_161DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "pubL.28.161";
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

    //逻辑_公共_基础数据同步_更新港股通汇率表
    public class ReqFuncpubL_28_162DTO : ReqBaseDTO
    {
        public ReqFuncpubL_28_162DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "pubL.28.162";
            CommonDTO.func_code = CommonDTO.function_code;
            init_date = 0;
            exch_no = 0;
            for_crncy_type = "CNY";
            crncy_type = "CNY";
            buy_ref_rate = 0;
            sell_ref_rate = 0;
            settle_buy_rate = 0;
            settle_sell_rate = 0;
            pboc_rate = 0;
        }
 
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 外币币种
        /// </summary>
        public String for_crncy_type { get; set; }
 
        /// <summary>
        /// 本币币种
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// 买入参考汇率
        /// </summary>
        public double buy_ref_rate { get; set; }
 
        /// <summary>
        /// 卖出参考汇率
        /// </summary>
        public double sell_ref_rate { get; set; }
 
        /// <summary>
        /// 买入结算汇率
        /// </summary>
        public double settle_buy_rate { get; set; }
 
        /// <summary>
        /// 卖出结算汇率
        /// </summary>
        public double settle_sell_rate { get; set; }
 
        /// <summary>
        /// 中国人行汇率
        /// </summary>
        public double pboc_rate { get; set; }
 
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
            packer.AddField("exch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("for_crncy_type", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("crncy_type", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("buy_ref_rate", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("sell_ref_rate", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("settle_buy_rate", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("settle_sell_rate", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("pboc_rate", ELDDATATYPE.LD_DATATYPE_DOUBLE);
 
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
            packer.AddInt(exch_no);
            packer.AddStr(for_crncy_type);
            packer.AddStr(crncy_type);
            packer.AddDouble(buy_ref_rate);
            packer.AddDouble(sell_ref_rate);
            packer.AddDouble(settle_buy_rate);
            packer.AddDouble(settle_sell_rate);
            packer.AddDouble(pboc_rate);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FOR_CRNCY_TYPE_STR,for_crncy_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_REF_RATE_FLOAT,buy_ref_rate);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_REF_RATE_FLOAT,sell_ref_rate);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SETTLE_BUY_RATE_FLOAT,settle_buy_rate);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SETTLE_SELL_RATE_FLOAT,settle_sell_rate);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PBOC_RATE_FLOAT,pboc_rate);
 
            return fastMsg;
        }
    }

    //逻辑_公共_基础数据同步_更新A股股本信息
    public class ReqFuncpubL_28_171DTO : ReqBaseDTO
    {
        public ReqFuncpubL_28_171DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "pubL.28.171";
            CommonDTO.func_code = CommonDTO.function_code;
            exch_no_str = " ";
            stock_code_str = " ";
            stock_name_str = " ";
            total_stock_issue_str = " ";
            circl_stock_capit_str = " ";
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
        /// 总股本串
        /// </summary>
        public String total_stock_issue_str { get; set; }
 
        /// <summary>
        /// 流通股本串
        /// </summary>
        public String circl_stock_capit_str { get; set; }
 
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
            packer.AddField("total_stock_issue_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("circl_stock_capit_str", ELDDATATYPE.LD_DATATYPE_STRING);
 
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
            packer.AddStr(total_stock_issue_str);
            packer.AddStr(circl_stock_capit_str);
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
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_STOCK_ISSUE_STR_STR,total_stock_issue_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CIRCL_STOCK_CAPIT_STR_STR,circl_stock_capit_str);
 
            return fastMsg;
        }
    }

    //逻辑_公共_基础数据同步_更新新股信息
    public class ReqFuncpubL_28_172DTO : ReqBaseDTO
    {
        public ReqFuncpubL_28_172DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "pubL.28.172";
            CommonDTO.func_code = CommonDTO.function_code;
            exch_no_str = " ";
            stock_code_str = " ";
            stock_name_str = " ";
            pinyin_short_str = " ";
            apply_code_str = " ";
            apply_date_str = " ";
            apply_limit_str = " ";
            begin_trade_date_str = " ";
            issue_price_str = " ";
            total_stock_issue_str = " ";
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
        /// 拼音简称串
        /// </summary>
        public String pinyin_short_str { get; set; }
 
        /// <summary>
        /// 申购代码串
        /// </summary>
        public String apply_code_str { get; set; }
 
        /// <summary>
        /// 申购日期串
        /// </summary>
        public String apply_date_str { get; set; }
 
        /// <summary>
        /// 申购上限串
        /// </summary>
        public String apply_limit_str { get; set; }
 
        /// <summary>
        /// 上市日期串
        /// </summary>
        public String begin_trade_date_str { get; set; }
 
        /// <summary>
        /// 发行价串
        /// </summary>
        public String issue_price_str { get; set; }
 
        /// <summary>
        /// 总股本串
        /// </summary>
        public String total_stock_issue_str { get; set; }
 
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
            packer.AddField("pinyin_short_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("apply_code_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("apply_date_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("apply_limit_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("begin_trade_date_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("issue_price_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("total_stock_issue_str", ELDDATATYPE.LD_DATATYPE_STRING);
 
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
            packer.AddStr(pinyin_short_str);
            packer.AddStr(apply_code_str);
            packer.AddStr(apply_date_str);
            packer.AddStr(apply_limit_str);
            packer.AddStr(begin_trade_date_str);
            packer.AddStr(issue_price_str);
            packer.AddStr(total_stock_issue_str);
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
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PINYIN_SHORT_STR_STR,pinyin_short_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_APPLY_CODE_STR_STR,apply_code_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_APPLY_DATE_STR_STR,apply_date_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_APPLY_LIMIT_STR_STR,apply_limit_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TRADE_DATE_STR_STR,begin_trade_date_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ISSUE_PRICE_STR_STR,issue_price_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_STOCK_ISSUE_STR_STR,total_stock_issue_str);
 
            return fastMsg;
        }
    }

    //逻辑_公共_基础数据同步_更新可转债发行信息
    public class ReqFuncpubL_28_173DTO : ReqBaseDTO
    {
        public ReqFuncpubL_28_173DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "pubL.28.173";
            CommonDTO.func_code = CommonDTO.function_code;
            exch_no_str = " ";
            stock_code_str = " ";
            stock_name_str = " ";
            pinyin_short_str = " ";
            bond_type_str = " ";
            apply_code_str = " ";
            apply_limit_str = " ";
            apply_date_str = " ";
            issue_price_str = " ";
            par_value_str = " ";
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
        /// 拼音简称串
        /// </summary>
        public String pinyin_short_str { get; set; }
 
        /// <summary>
        /// 债券类型串
        /// </summary>
        public String bond_type_str { get; set; }
 
        /// <summary>
        /// 申购代码串
        /// </summary>
        public String apply_code_str { get; set; }
 
        /// <summary>
        /// 申购上限串
        /// </summary>
        public String apply_limit_str { get; set; }
 
        /// <summary>
        /// 申购日期串
        /// </summary>
        public String apply_date_str { get; set; }
 
        /// <summary>
        /// 发行价串
        /// </summary>
        public String issue_price_str { get; set; }
 
        /// <summary>
        /// 票面面值串
        /// </summary>
        public String par_value_str { get; set; }
 
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
            packer.AddField("pinyin_short_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("bond_type_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("apply_code_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("apply_limit_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("apply_date_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("issue_price_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("par_value_str", ELDDATATYPE.LD_DATATYPE_STRING);
 
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
            packer.AddStr(pinyin_short_str);
            packer.AddStr(bond_type_str);
            packer.AddStr(apply_code_str);
            packer.AddStr(apply_limit_str);
            packer.AddStr(apply_date_str);
            packer.AddStr(issue_price_str);
            packer.AddStr(par_value_str);
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
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PINYIN_SHORT_STR_STR,pinyin_short_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_BOND_TYPE_STR_STR,bond_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_APPLY_CODE_STR_STR,apply_code_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_APPLY_LIMIT_STR_STR,apply_limit_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_APPLY_DATE_STR_STR,apply_date_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ISSUE_PRICE_STR_STR,issue_price_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_STR_STR,par_value_str);
 
            return fastMsg;
        }
    }

    //逻辑_公共_基础数据同步_更新基金信息
    public class ReqFuncpubL_28_174DTO : ReqBaseDTO
    {
        public ReqFuncpubL_28_174DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "pubL.28.174";
            CommonDTO.func_code = CommonDTO.function_code;
            exch_no_str = " ";
            stock_code_str = " ";
            stock_name_str = " ";
            pinyin_short_str = " ";
            stock_type_str = " ";
            asset_type_str = " ";
            fund_invest_type_str = " ";
            fund_type_str = " ";
            fund_share_str = " ";
            market_share_str = " ";
            circl_stock_capit_str = " ";
            total_stock_issue_str = " ";
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
        /// 拼音简称串
        /// </summary>
        public String pinyin_short_str { get; set; }
 
        /// <summary>
        /// 证券类型串
        /// </summary>
        public String stock_type_str { get; set; }
 
        /// <summary>
        /// 资产类型串
        /// </summary>
        public String asset_type_str { get; set; }
 
        /// <summary>
        /// 基金投资类型串
        /// </summary>
        public String fund_invest_type_str { get; set; }
 
        /// <summary>
        /// 基金份额串
        /// </summary>
        public String fund_type_str { get; set; }
 
        /// <summary>
        /// 基金份额总额串
        /// </summary>
        public String fund_share_str { get; set; }
 
        /// <summary>
        /// 场内份额串
        /// </summary>
        public String market_share_str { get; set; }
 
        /// <summary>
        /// 流通股本串
        /// </summary>
        public String circl_stock_capit_str { get; set; }
 
        /// <summary>
        /// 总股本串
        /// </summary>
        public String total_stock_issue_str { get; set; }
 
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
            packer.AddField("pinyin_short_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("stock_type_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("asset_type_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("fund_invest_type_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("fund_type_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("fund_share_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("market_share_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("circl_stock_capit_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("total_stock_issue_str", ELDDATATYPE.LD_DATATYPE_STRING);
 
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
            packer.AddStr(pinyin_short_str);
            packer.AddStr(stock_type_str);
            packer.AddStr(asset_type_str);
            packer.AddStr(fund_invest_type_str);
            packer.AddStr(fund_type_str);
            packer.AddStr(fund_share_str);
            packer.AddStr(market_share_str);
            packer.AddStr(circl_stock_capit_str);
            packer.AddStr(total_stock_issue_str);
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
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PINYIN_SHORT_STR_STR,pinyin_short_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_STR_STR,stock_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_STR_STR,asset_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUND_INVEST_TYPE_STR_STR,fund_invest_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUND_TYPE_STR_STR,fund_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUND_SHARE_STR_STR,fund_share_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_SHARE_STR_STR,market_share_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CIRCL_STOCK_CAPIT_STR_STR,circl_stock_capit_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_STOCK_ISSUE_STR_STR,total_stock_issue_str);
 
            return fastMsg;
        }
    }

    //逻辑_公共_基础数据同步_更新债券信息
    public class ReqFuncpubL_28_175DTO : ReqBaseDTO
    {
        public ReqFuncpubL_28_175DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "pubL.28.175";
            CommonDTO.func_code = CommonDTO.function_code;
            exch_no_str = " ";
            stock_code_str = " ";
            stock_name_str = " ";
            pinyin_short_str = " ";
            bond_type_str = " ";
            bond_class_str = " ";
            begin_trade_date_str = " ";
            total_scale_str = " ";
            impawn_code_str = " ";
            issue_date_str = " ";
            end_date_str = " ";
            value_date_str = " ";
            bond_limit_str = " ";
            issue_price_str = " ";
            intrst_ratio_str = " ";
            early_expire_date = " ";
            intrst_type_str = " ";
            pay_intrst_type_str = " ";
            bond_accr_intrst_str = " ";
            std_stock_discount_str = " ";
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
        /// 拼音简称串
        /// </summary>
        public String pinyin_short_str { get; set; }
 
        /// <summary>
        /// 债券类型串
        /// </summary>
        public String bond_type_str { get; set; }
 
        /// <summary>
        /// 债券分类串
        /// </summary>
        public String bond_class_str { get; set; }
 
        /// <summary>
        /// 上市日期串
        /// </summary>
        public String begin_trade_date_str { get; set; }
 
        /// <summary>
        /// 总规模串
        /// </summary>
        public String total_scale_str { get; set; }
 
        /// <summary>
        /// 质押代码串
        /// </summary>
        public String impawn_code_str { get; set; }
 
        /// <summary>
        /// 发行日期串
        /// </summary>
        public String issue_date_str { get; set; }
 
        /// <summary>
        /// 结束日期串
        /// </summary>
        public String end_date_str { get; set; }
 
        /// <summary>
        /// 起息日期串
        /// </summary>
        public String value_date_str { get; set; }
 
        /// <summary>
        /// 债券期限串
        /// </summary>
        public String bond_limit_str { get; set; }
 
        /// <summary>
        /// 发行价串
        /// </summary>
        public String issue_price_str { get; set; }
 
        /// <summary>
        /// 年利率串
        /// </summary>
        public String intrst_ratio_str { get; set; }
 
        /// <summary>
        /// 提前到期日串
        /// </summary>
        public String early_expire_date { get; set; }
 
        /// <summary>
        /// 计息方式串
        /// </summary>
        public String intrst_type_str { get; set; }
 
        /// <summary>
        /// 付息方式串
        /// </summary>
        public String pay_intrst_type_str { get; set; }
 
        /// <summary>
        /// 债券计提利息串
        /// </summary>
        public String bond_accr_intrst_str { get; set; }
 
        /// <summary>
        /// 标准券折算率串
        /// </summary>
        public String std_stock_discount_str { get; set; }
 
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
            packer.AddField("pinyin_short_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("bond_type_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("bond_class_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("begin_trade_date_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("total_scale_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("impawn_code_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("issue_date_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("end_date_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("value_date_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("bond_limit_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("issue_price_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("intrst_ratio_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("early_expire_date", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("intrst_type_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("pay_intrst_type_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("bond_accr_intrst_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("std_stock_discount_str", ELDDATATYPE.LD_DATATYPE_STRING);
 
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
            packer.AddStr(pinyin_short_str);
            packer.AddStr(bond_type_str);
            packer.AddStr(bond_class_str);
            packer.AddStr(begin_trade_date_str);
            packer.AddStr(total_scale_str);
            packer.AddStr(impawn_code_str);
            packer.AddStr(issue_date_str);
            packer.AddStr(end_date_str);
            packer.AddStr(value_date_str);
            packer.AddStr(bond_limit_str);
            packer.AddStr(issue_price_str);
            packer.AddStr(intrst_ratio_str);
            packer.AddStr(early_expire_date);
            packer.AddStr(intrst_type_str);
            packer.AddStr(pay_intrst_type_str);
            packer.AddStr(bond_accr_intrst_str);
            packer.AddStr(std_stock_discount_str);
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
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PINYIN_SHORT_STR_STR,pinyin_short_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_BOND_TYPE_STR_STR,bond_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_BOND_CLASS_STR_STR,bond_class_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TRADE_DATE_STR_STR,begin_trade_date_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_SCALE_STR_STR,total_scale_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_IMPAWN_CODE_STR_STR,impawn_code_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ISSUE_DATE_STR_STR,issue_date_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_STR_STR,end_date_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_VALUE_DATE_STR_STR,value_date_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_BOND_LIMIT_STR_STR,bond_limit_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ISSUE_PRICE_STR_STR,issue_price_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_RATIO_STR_STR,intrst_ratio_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EARLY_EXPIRE_DATE_STR,early_expire_date);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_TYPE_STR_STR,intrst_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PAY_INTRST_TYPE_STR_STR,pay_intrst_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_STR_STR,bond_accr_intrst_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STD_STOCK_DISCOUNT_STR_STR,std_stock_discount_str);
 
            return fastMsg;
        }
    }

    //逻辑_公共_基础数据同步_查询自动同步设置表
    public class ReqFuncpubL_28_201DTO : ReqBaseDTO
    {
        public ReqFuncpubL_28_201DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "pubL.28.201";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            auto_sync_type = 0;
            sync_req_type = 0;
        }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 运维端自动同步类型
        /// </summary>
        public int auto_sync_type { get; set; }
 
        /// <summary>
        /// 同步请求类型
        /// </summary>
        public int sync_req_type { get; set; }
 
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
            packer.AddField("auto_sync_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("sync_req_type", ELDDATATYPE.LD_DATATYPE_INT);
 
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
            packer.AddInt(auto_sync_type);
            packer.AddInt(sync_req_type);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_AUTO_SYNC_TYPE_INT,auto_sync_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SYNC_REQ_TYPE_INT,sync_req_type);
 
            return fastMsg;
        }
    }

    //逻辑_公共_基础数据同步_新增自动同步设置
    public class ReqFuncpubL_28_202DTO : ReqBaseDTO
    {
        public ReqFuncpubL_28_202DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "pubL.28.202";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            auto_sync_type = 0;
            capital_batch_deal_range = 0;
            posi_batch_deal_range = 0;
            begin_time = 0;
            end_time = 0;
            is_batch_deal = 0;
            is_inner_check = 0;
            remark_info = " ";
        }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 运维端自动同步类型
        /// </summary>
        public int auto_sync_type { get; set; }
 
        /// <summary>
        /// 资金批量处理范围
        /// </summary>
        public int capital_batch_deal_range { get; set; }
 
        /// <summary>
        /// 持仓批量处理范围
        /// </summary>
        public int posi_batch_deal_range { get; set; }
 
        /// <summary>
        /// 开始时间
        /// </summary>
        public int begin_time { get; set; }
 
        /// <summary>
        /// 结束时间
        /// </summary>
        public int end_time { get; set; }
 
        /// <summary>
        /// 是否批量处理
        /// </summary>
        public int is_batch_deal { get; set; }
 
        /// <summary>
        /// 早盘自动同步是否内部核对
        /// </summary>
        public int is_inner_check { get; set; }
 
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
            packer.AddField("auto_sync_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("capital_batch_deal_range", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("posi_batch_deal_range", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("begin_time", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("end_time", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("is_batch_deal", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("is_inner_check", ELDDATATYPE.LD_DATATYPE_INT);
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
            packer.AddInt(auto_sync_type);
            packer.AddInt(capital_batch_deal_range);
            packer.AddInt(posi_batch_deal_range);
            packer.AddInt(begin_time);
            packer.AddInt(end_time);
            packer.AddInt(is_batch_deal);
            packer.AddInt(is_inner_check);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_AUTO_SYNC_TYPE_INT,auto_sync_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CAPITAL_BATCH_DEAL_RANGE_INT,capital_batch_deal_range);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_POSI_BATCH_DEAL_RANGE_INT,posi_batch_deal_range);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TIME_INT,begin_time);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_TIME_INT,end_time);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_BATCH_DEAL_INT,is_batch_deal);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_INNER_CHECK_INT,is_inner_check);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
 
            return fastMsg;
        }
    }

    //逻辑_公共_基础数据同步_修改自动同步设置
    public class ReqFuncpubL_28_203DTO : ReqBaseDTO
    {
        public ReqFuncpubL_28_203DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "pubL.28.203";
            CommonDTO.func_code = CommonDTO.function_code;
            row_id = 0;
            capital_batch_deal_range = 0;
            posi_batch_deal_range = 0;
            begin_time = 0;
            end_time = 0;
            is_batch_deal = 0;
            is_inner_check = 0;
            remark_info = " ";
        }
 
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 资金批量处理范围
        /// </summary>
        public int capital_batch_deal_range { get; set; }
 
        /// <summary>
        /// 持仓批量处理范围
        /// </summary>
        public int posi_batch_deal_range { get; set; }
 
        /// <summary>
        /// 开始时间
        /// </summary>
        public int begin_time { get; set; }
 
        /// <summary>
        /// 结束时间
        /// </summary>
        public int end_time { get; set; }
 
        /// <summary>
        /// 是否批量处理
        /// </summary>
        public int is_batch_deal { get; set; }
 
        /// <summary>
        /// 早盘自动同步是否内部核对
        /// </summary>
        public int is_inner_check { get; set; }
 
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
            packer.AddField("capital_batch_deal_range", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("posi_batch_deal_range", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("begin_time", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("end_time", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("is_batch_deal", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("is_inner_check", ELDDATATYPE.LD_DATATYPE_INT);
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
            packer.AddInt(capital_batch_deal_range);
            packer.AddInt(posi_batch_deal_range);
            packer.AddInt(begin_time);
            packer.AddInt(end_time);
            packer.AddInt(is_batch_deal);
            packer.AddInt(is_inner_check);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CAPITAL_BATCH_DEAL_RANGE_INT,capital_batch_deal_range);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_POSI_BATCH_DEAL_RANGE_INT,posi_batch_deal_range);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TIME_INT,begin_time);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_TIME_INT,end_time);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_BATCH_DEAL_INT,is_batch_deal);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_INNER_CHECK_INT,is_inner_check);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
 
            return fastMsg;
        }
    }

    //逻辑_公共_基础数据同步_删除自动同步设置
    public class ReqFuncpubL_28_204DTO : ReqBaseDTO
    {
        public ReqFuncpubL_28_204DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "pubL.28.204";
            CommonDTO.func_code = CommonDTO.function_code;
            row_id = 0;
        }
 
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
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
 
            return fastMsg;
        }
    }

    //逻辑_公共_基础数据同步_更新自动同步处理标志
    public class ReqFuncpubL_28_205DTO : ReqBaseDTO
    {
        public ReqFuncpubL_28_205DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "pubL.28.205";
            CommonDTO.func_code = CommonDTO.function_code;
            row_id = 0;
            auto_sync_deal_flag = 0;
        }
 
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 自动同步处理标志
        /// </summary>
        public int auto_sync_deal_flag { get; set; }
 
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
            packer.AddField("auto_sync_deal_flag", ELDDATATYPE.LD_DATATYPE_INT);
 
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
            packer.AddInt(auto_sync_deal_flag);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_AUTO_SYNC_DEAL_FLAG_INT,auto_sync_deal_flag);
 
            return fastMsg;
        }
    }

    //逻辑_公共_基础数据同步_查询自动同步日志表
    public class ReqFuncpubL_28_106DTO : ReqBaseDTO
    {
        public ReqFuncpubL_28_106DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "pubL.28.106";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            process_type_name = " ";
        }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 流程类型名
        /// </summary>
        public String process_type_name { get; set; }
 
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
            packer.AddField("process_type_name", ELDDATATYPE.LD_DATATYPE_STRING);
 
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
            packer.AddStr(process_type_name);
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
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PROCESS_TYPE_NAME_STR,process_type_name);
 
            return fastMsg;
        }
    }

    //逻辑_公共_基础数据同步_新增自动同步日志
    public class ReqFuncpubL_28_107DTO : ReqBaseDTO
    {
        public ReqFuncpubL_28_107DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "pubL.28.107";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            process_type_name = " ";
            process_name = " ";
            event_msg_content = " ";
            remark_info = " ";
        }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 流程类型名
        /// </summary>
        public String process_type_name { get; set; }
 
        /// <summary>
        /// 流程名称
        /// </summary>
        public String process_name { get; set; }
 
        /// <summary>
        /// 事件消息内容
        /// </summary>
        public String event_msg_content { get; set; }
 
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
            packer.AddField("process_type_name", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("process_name", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("event_msg_content", ELDDATATYPE.LD_DATATYPE_STRING);
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
            packer.AddStr(process_type_name);
            packer.AddStr(process_name);
            packer.AddStr(event_msg_content);
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
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PROCESS_TYPE_NAME_STR,process_type_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PROCESS_NAME_STR,process_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EVENT_MSG_CONTENT_STR,event_msg_content);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
 
            return fastMsg;
        }
    }

    //逻辑_公共_基础数据同步_清空自动同步日志
    public class ReqFuncpubL_28_108DTO : ReqBaseDTO
    {
        public ReqFuncpubL_28_108DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "pubL.28.108";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
        }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
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
 
            return fastMsg;
        }
    }

}
