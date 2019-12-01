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
    //逻辑_交易证券_策略_策略插件上线
    public class ReqFunctdsecuL_11_1DTO : ReqBaseDTO
    {
        public ReqFunctdsecuL_11_1DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "tdsecuL.11.1";
            CommonDTO.func_code = CommonDTO.function_code;
            strategy_plugin_type = 0;
        }
 
        /// <summary>
        /// 策略插件类型
        /// </summary>
        public int strategy_plugin_type { get; set; }
 
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
 
            packer.AddField("strategy_plugin_type", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(strategy_plugin_type);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_PLUGIN_TYPE_INT,strategy_plugin_type);
 
            return fastMsg;
        }
    }

    //逻辑_交易证券_策略_策略插件下线
    public class ReqFunctdsecuL_11_2DTO : ReqBaseDTO
    {
        public ReqFunctdsecuL_11_2DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "tdsecuL.11.2";
            CommonDTO.func_code = CommonDTO.function_code;
            strategy_plugin_type = 0;
        }
 
        /// <summary>
        /// 策略插件类型
        /// </summary>
        public int strategy_plugin_type { get; set; }
 
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
 
            packer.AddField("strategy_plugin_type", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(strategy_plugin_type);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_PLUGIN_TYPE_INT,strategy_plugin_type);
 
            return fastMsg;
        }
    }

    //逻辑_交易证券_策略_新增策略
    public class ReqFunctdsecuL_11_11DTO : ReqBaseDTO
    {
        public ReqFunctdsecuL_11_11DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "tdsecuL.11.11";
            CommonDTO.func_code = CommonDTO.function_code;
            comm_opor = 0;
            co_no = 0;
            pd_code = " ";
            exch_group_no = 0;
            asset_acco_no = 0;
            strategy_batch_no = 0;
            strategy_exec_broker = " ";
            strategy_exec_comm_str = " ";
            strategy_exec_kind = 0;
            exch_no = 0;
            stock_code = " ";
            strategy_dir = 0;
            strategy_qty = 0;
            cash_strategy_qty = 0;
            strategy_price = 0;
            price_type = 0;
            strategy_amt = 0;
            strategy_valid_type = 0;
            strategy_rule_way = " ";
            remark_info = " ";
            margin_trade_type = 0;
            target_strategy_type = " ";
            target_strategy_param = " ";
            external_no = 0;
            order_batch_no = 0;
            strategy_oper_way = " ";
            strategy_price_type = 0;
            comm_batch_no = 0;
            comm_id = 0;
            basket_id = 0;
        }
 
        /// <summary>
        /// 指令下达人
        /// </summary>
        public int comm_opor { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编码
        /// </summary>
        public String pd_code { get; set; }
 
        /// <summary>
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// 策略批号
        /// </summary>
        public int strategy_batch_no { get; set; }
 
        /// <summary>
        /// 策略执行商
        /// </summary>
        public String strategy_exec_broker { get; set; }
 
        /// <summary>
        /// 策略执行指令串
        /// </summary>
        public String strategy_exec_comm_str { get; set; }
 
        /// <summary>
        /// 策略执行方式
        /// </summary>
        public int strategy_exec_kind { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 策略方向
        /// </summary>
        public int strategy_dir { get; set; }
 
        /// <summary>
        /// 策略数量
        /// </summary>
        public double strategy_qty { get; set; }
 
        /// <summary>
        /// 资金策略数量
        /// </summary>
        public double cash_strategy_qty { get; set; }
 
        /// <summary>
        /// 策略价格
        /// </summary>
        public double strategy_price { get; set; }
 
        /// <summary>
        /// 价格类型
        /// </summary>
        public int price_type { get; set; }
 
        /// <summary>
        /// 策略金额
        /// </summary>
        public double strategy_amt { get; set; }
 
        /// <summary>
        /// 策略有效期限
        /// </summary>
        public int strategy_valid_type { get; set; }
 
        /// <summary>
        /// 策略规则方式
        /// </summary>
        public String strategy_rule_way { get; set; }
 
        /// <summary>
        /// 备注信息
        /// </summary>
        public String remark_info { get; set; }
 
        /// <summary>
        /// 信用交易方式
        /// </summary>
        public int margin_trade_type { get; set; }
 
        /// <summary>
        /// 目标策略类型
        /// </summary>
        public String target_strategy_type { get; set; }
 
        /// <summary>
        /// 目标策略参数
        /// </summary>
        public String target_strategy_param { get; set; }
 
        /// <summary>
        /// 外部编号
        /// </summary>
        public ulong external_no { get; set; }
 
        /// <summary>
        /// 订单批号
        /// </summary>
        public int order_batch_no { get; set; }
 
        /// <summary>
        /// 策略操作方式
        /// </summary>
        public String strategy_oper_way { get; set; }
 
        /// <summary>
        /// 策略价格类型
        /// </summary>
        public int strategy_price_type { get; set; }
 
        /// <summary>
        /// 指令批号
        /// </summary>
        public int comm_batch_no { get; set; }
 
        /// <summary>
        /// 指令序号
        /// </summary>
        public ulong comm_id { get; set; }
 
        /// <summary>
        /// 篮子序号
        /// </summary>
        public ulong basket_id { get; set; }
 
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
 
            packer.AddField("comm_opor", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("exch_group_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("asset_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("strategy_batch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("strategy_exec_broker", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("strategy_exec_comm_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("strategy_exec_kind", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("strategy_dir", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("strategy_qty", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("cash_strategy_qty", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("strategy_price", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("price_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("strategy_amt", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("strategy_valid_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("strategy_rule_way", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("remark_info", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("margin_trade_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("target_strategy_type", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("target_strategy_param", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("external_no", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("order_batch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("strategy_oper_way", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("strategy_price_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_batch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("basket_id", ELDDATATYPE.LD_DATATYPE_LONG);
 
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
 
            packer.AddInt(comm_opor);
            packer.AddInt(co_no);
            packer.AddStr(pd_code);
            packer.AddInt(exch_group_no);
            packer.AddInt(asset_acco_no);
            packer.AddInt(strategy_batch_no);
            packer.AddStr(strategy_exec_broker);
            packer.AddStr(strategy_exec_comm_str);
            packer.AddInt(strategy_exec_kind);
            packer.AddInt(exch_no);
            packer.AddStr(stock_code);
            packer.AddInt(strategy_dir);
            packer.AddDouble(strategy_qty);
            packer.AddDouble(cash_strategy_qty);
            packer.AddDouble(strategy_price);
            packer.AddInt(price_type);
            packer.AddDouble(strategy_amt);
            packer.AddInt(strategy_valid_type);
            packer.AddStr(strategy_rule_way);
            packer.AddStr(remark_info);
            packer.AddInt(margin_trade_type);
            packer.AddStr(target_strategy_type);
            packer.AddStr(target_strategy_param);
            packer.AddInt64(external_no);
            packer.AddInt(order_batch_no);
            packer.AddStr(strategy_oper_way);
            packer.AddInt(strategy_price_type);
            packer.AddInt(comm_batch_no);
            packer.AddInt64(comm_id);
            packer.AddInt64(basket_id);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPOR_INT,comm_opor);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR,pd_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_BATCH_NO_INT,strategy_batch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_EXEC_BROKER_STR,strategy_exec_broker);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_EXEC_COMM_STR_STR,strategy_exec_comm_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_EXEC_KIND_INT,strategy_exec_kind);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_DIR_INT,strategy_dir);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_QTY_FLOAT,strategy_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_STRATEGY_QTY_FLOAT,cash_strategy_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_PRICE_FLOAT,strategy_price);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_INT,price_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_AMT_FLOAT,strategy_amt);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_VALID_TYPE_INT,strategy_valid_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_RULE_WAY_STR,strategy_rule_way);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MARGIN_TRADE_TYPE_INT,margin_trade_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_STRATEGY_TYPE_STR,target_strategy_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_STRATEGY_PARAM_STR,target_strategy_param);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64,external_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT,order_batch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_OPER_WAY_STR,strategy_oper_way);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_PRICE_TYPE_INT,strategy_price_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT,comm_batch_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64,comm_id);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_ID_INT64,basket_id);
 
            return fastMsg;
        }
    }

    //逻辑_交易证券_策略_暂停策略
    public class ReqFunctdsecuL_11_12DTO : ReqBaseDTO
    {
        public ReqFunctdsecuL_11_12DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "tdsecuL.11.12";
            CommonDTO.func_code = CommonDTO.function_code;
            strategy_id = 0;
            target_strategy_type = " ";
            target_strategy_param = " ";
            strategy_contr_comm = " ";
            remark_info = " ";
        }
 
        /// <summary>
        /// 策略序号
        /// </summary>
        public ulong strategy_id { get; set; }
 
        /// <summary>
        /// 目标策略类型
        /// </summary>
        public String target_strategy_type { get; set; }
 
        /// <summary>
        /// 目标策略参数
        /// </summary>
        public String target_strategy_param { get; set; }
 
        /// <summary>
        /// 策略控制指令
        /// </summary>
        public String strategy_contr_comm { get; set; }
 
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
 
            packer.AddField("strategy_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("target_strategy_type", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("target_strategy_param", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("strategy_contr_comm", ELDDATATYPE.LD_DATATYPE_STRING);
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
 
            packer.AddInt64(strategy_id);
            packer.AddStr(target_strategy_type);
            packer.AddStr(target_strategy_param);
            packer.AddStr(strategy_contr_comm);
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

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_ID_INT64,strategy_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_STRATEGY_TYPE_STR,target_strategy_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_STRATEGY_PARAM_STR,target_strategy_param);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_CONTR_COMM_STR,strategy_contr_comm);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
 
            return fastMsg;
        }
    }

    //逻辑_交易证券_策略_重启策略
    public class ReqFunctdsecuL_11_13DTO : ReqBaseDTO
    {
        public ReqFunctdsecuL_11_13DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "tdsecuL.11.13";
            CommonDTO.func_code = CommonDTO.function_code;
            strategy_id = 0;
            target_strategy_type = " ";
            target_strategy_param = " ";
            strategy_contr_comm = " ";
            remark_info = " ";
        }
 
        /// <summary>
        /// 策略序号
        /// </summary>
        public ulong strategy_id { get; set; }
 
        /// <summary>
        /// 目标策略类型
        /// </summary>
        public String target_strategy_type { get; set; }
 
        /// <summary>
        /// 目标策略参数
        /// </summary>
        public String target_strategy_param { get; set; }
 
        /// <summary>
        /// 策略控制指令
        /// </summary>
        public String strategy_contr_comm { get; set; }
 
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
 
            packer.AddField("strategy_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("target_strategy_type", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("target_strategy_param", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("strategy_contr_comm", ELDDATATYPE.LD_DATATYPE_STRING);
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
 
            packer.AddInt64(strategy_id);
            packer.AddStr(target_strategy_type);
            packer.AddStr(target_strategy_param);
            packer.AddStr(strategy_contr_comm);
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

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_ID_INT64,strategy_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_STRATEGY_TYPE_STR,target_strategy_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_STRATEGY_PARAM_STR,target_strategy_param);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_CONTR_COMM_STR,strategy_contr_comm);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
 
            return fastMsg;
        }
    }

    //逻辑_交易证券_策略_撤销策略
    public class ReqFunctdsecuL_11_14DTO : ReqBaseDTO
    {
        public ReqFunctdsecuL_11_14DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "tdsecuL.11.14";
            CommonDTO.func_code = CommonDTO.function_code;
            strategy_id = 0;
            target_strategy_type = " ";
            target_strategy_param = " ";
            remark_info = " ";
        }
 
        /// <summary>
        /// 策略序号
        /// </summary>
        public ulong strategy_id { get; set; }
 
        /// <summary>
        /// 目标策略类型
        /// </summary>
        public String target_strategy_type { get; set; }
 
        /// <summary>
        /// 目标策略参数
        /// </summary>
        public String target_strategy_param { get; set; }
 
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
 
            packer.AddField("strategy_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("target_strategy_type", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("target_strategy_param", ELDDATATYPE.LD_DATATYPE_STRING);
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
 
            packer.AddInt64(strategy_id);
            packer.AddStr(target_strategy_type);
            packer.AddStr(target_strategy_param);
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

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_ID_INT64,strategy_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_STRATEGY_TYPE_STR,target_strategy_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_STRATEGY_PARAM_STR,target_strategy_param);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
 
            return fastMsg;
        }
    }

    //逻辑_交易证券_策略_更新策略执行情况
    public class ReqFunctdsecuL_11_15DTO : ReqBaseDTO
    {
        public ReqFunctdsecuL_11_15DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "tdsecuL.11.15";
            CommonDTO.func_code = CommonDTO.function_code;
            strategy_id = 0;
            order_id = 0;
            order_qty = 0;
            order_amt = 0;
            wtdraw_qty = 0;
            strike_id = 0;
            strike_qty = 0;
            strike_amt = 0;
        }
 
        /// <summary>
        /// 策略序号
        /// </summary>
        public ulong strategy_id { get; set; }
 
        /// <summary>
        /// 订单序号
        /// </summary>
        public ulong order_id { get; set; }
 
        /// <summary>
        /// 订单数量
        /// </summary>
        public double order_qty { get; set; }
 
        /// <summary>
        /// 订单金额
        /// </summary>
        public double order_amt { get; set; }
 
        /// <summary>
        /// 撤单数量
        /// </summary>
        public double wtdraw_qty { get; set; }
 
        /// <summary>
        /// 成交序号
        /// </summary>
        public ulong strike_id { get; set; }
 
        /// <summary>
        /// 成交数量
        /// </summary>
        public double strike_qty { get; set; }
 
        /// <summary>
        /// 成交金额
        /// </summary>
        public double strike_amt { get; set; }
 
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
 
            packer.AddField("strategy_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("order_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("order_qty", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("order_amt", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("wtdraw_qty", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("strike_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("strike_qty", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("strike_amt", ELDDATATYPE.LD_DATATYPE_DOUBLE);
 
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
 
            packer.AddInt64(strategy_id);
            packer.AddInt64(order_id);
            packer.AddDouble(order_qty);
            packer.AddDouble(order_amt);
            packer.AddDouble(wtdraw_qty);
            packer.AddInt64(strike_id);
            packer.AddDouble(strike_qty);
            packer.AddDouble(strike_amt);
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

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_ID_INT64,strategy_id);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64,order_id);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT,order_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_AMT_FLOAT,order_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_QTY_FLOAT,wtdraw_qty);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_ID_INT64,strike_id);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT,strike_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT,strike_amt);
 
            return fastMsg;
        }
    }

    //逻辑_交易证券_策略_更新策略状态
    public class ReqFunctdsecuL_11_16DTO : ReqBaseDTO
    {
        public ReqFunctdsecuL_11_16DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "tdsecuL.11.16";
            CommonDTO.func_code = CommonDTO.function_code;
            orig_strategy_id = 0;
            strategy_id = 0;
            strategy_deal_status = " ";
            strategy_status = " ";
            remark_info = " ";
        }
 
        /// <summary>
        /// 原策略序号
        /// </summary>
        public ulong orig_strategy_id { get; set; }
 
        /// <summary>
        /// 策略序号
        /// </summary>
        public ulong strategy_id { get; set; }
 
        /// <summary>
        /// 策略处理状态
        /// </summary>
        public String strategy_deal_status { get; set; }
 
        /// <summary>
        /// 策略状态
        /// </summary>
        public String strategy_status { get; set; }
 
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
 
            packer.AddField("orig_strategy_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("strategy_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("strategy_deal_status", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("strategy_status", ELDDATATYPE.LD_DATATYPE_STRING);
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
 
            packer.AddInt64(orig_strategy_id);
            packer.AddInt64(strategy_id);
            packer.AddStr(strategy_deal_status);
            packer.AddStr(strategy_status);
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

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORIG_STRATEGY_ID_INT64,orig_strategy_id);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_ID_INT64,strategy_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_DEAL_STATUS_STR,strategy_deal_status);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_STATUS_STR,strategy_status);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
 
            return fastMsg;
        }
    }

    //逻辑_交易证券_策略_查询策略
    public class ReqFunctdsecuL_11_101DTO : ReqBaseDTO
    {
        public ReqFunctdsecuL_11_101DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "tdsecuL.11.101";
            CommonDTO.func_code = CommonDTO.function_code;
            comm_opor = 0;
            pd_no = 0;
            exch_group_no = 0;
            asset_acco_no = 0;
            strategy_id = 0;
            exch_no = 0;
            stock_code = " ";
            strategy_dir = 0;
            busi_opor_no = 0;
            margin_trade_type = 0;
            target_strategy_type = " ";
            strategy_status = " ";
            strategy_deal_status = " ";
            strategy_deal_kind = 0;
            external_no = 0;
            order_batch_no = 0;
            strategy_oper_way = " ";
            comm_id = 0;
            comm_batch_no = 0;
            row_id = 0;
            row_count = -1;
            sort_type = 1;
        }
 
        /// <summary>
        /// 指令下达人
        /// </summary>
        public int comm_opor { get; set; }
 
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
        /// 策略序号
        /// </summary>
        public ulong strategy_id { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 策略方向
        /// </summary>
        public int strategy_dir { get; set; }
 
        /// <summary>
        /// 业务操作员编号
        /// </summary>
        public int busi_opor_no { get; set; }
 
        /// <summary>
        /// 信用交易方式
        /// </summary>
        public int margin_trade_type { get; set; }
 
        /// <summary>
        /// 目标策略类型
        /// </summary>
        public String target_strategy_type { get; set; }
 
        /// <summary>
        /// 策略状态
        /// </summary>
        public String strategy_status { get; set; }
 
        /// <summary>
        /// 策略处理状态
        /// </summary>
        public String strategy_deal_status { get; set; }
 
        /// <summary>
        /// 策略处理方式
        /// </summary>
        public int strategy_deal_kind { get; set; }
 
        /// <summary>
        /// 外部编号
        /// </summary>
        public ulong external_no { get; set; }
 
        /// <summary>
        /// 订单批号
        /// </summary>
        public int order_batch_no { get; set; }
 
        /// <summary>
        /// 策略操作方式
        /// </summary>
        public String strategy_oper_way { get; set; }
 
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
        /// 指定行数
        /// </summary>
        public int row_count { get; set; }
 
        /// <summary>
        /// 排序方式
        /// </summary>
        public int sort_type { get; set; }
 
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
 
            packer.AddField("comm_opor", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_group_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("asset_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("strategy_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("exch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("strategy_dir", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("busi_opor_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("margin_trade_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("target_strategy_type", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("strategy_status", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("strategy_deal_status", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("strategy_deal_kind", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("external_no", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("order_batch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("strategy_oper_way", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("comm_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("comm_batch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("row_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("row_count", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("sort_type", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(comm_opor);
            packer.AddInt(pd_no);
            packer.AddInt(exch_group_no);
            packer.AddInt(asset_acco_no);
            packer.AddInt64(strategy_id);
            packer.AddInt(exch_no);
            packer.AddStr(stock_code);
            packer.AddInt(strategy_dir);
            packer.AddInt(busi_opor_no);
            packer.AddInt(margin_trade_type);
            packer.AddStr(target_strategy_type);
            packer.AddStr(strategy_status);
            packer.AddStr(strategy_deal_status);
            packer.AddInt(strategy_deal_kind);
            packer.AddInt64(external_no);
            packer.AddInt(order_batch_no);
            packer.AddStr(strategy_oper_way);
            packer.AddInt64(comm_id);
            packer.AddInt(comm_batch_no);
            packer.AddInt64(row_id);
            packer.AddInt(row_count);
            packer.AddInt(sort_type);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPOR_INT,comm_opor);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_ID_INT64,strategy_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_DIR_INT,strategy_dir);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT,busi_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MARGIN_TRADE_TYPE_INT,margin_trade_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_STRATEGY_TYPE_STR,target_strategy_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_STATUS_STR,strategy_status);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_DEAL_STATUS_STR,strategy_deal_status);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_DEAL_KIND_INT,strategy_deal_kind);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64,external_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT,order_batch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_OPER_WAY_STR,strategy_oper_way);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64,comm_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT,comm_batch_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SORT_TYPE_INT,sort_type);
 
            return fastMsg;
        }
    }

    //逻辑_交易证券_策略_插件查询策略
    public class ReqFunctdsecuL_11_102DTO : ReqBaseDTO
    {
        public ReqFunctdsecuL_11_102DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "tdsecuL.11.102";
            CommonDTO.func_code = CommonDTO.function_code;
            comm_opor = 0;
            pd_no = 0;
            exch_group_no = 0;
            asset_acco_no = 0;
            strategy_id = 0;
            exch_no = 0;
            stock_code = " ";
            strategy_dir = 0;
            busi_opor_no = 0;
            margin_trade_type = 0;
            target_strategy_type = " ";
            strategy_status = " ";
            strategy_deal_status = " ";
            strategy_deal_kind = 0;
            external_no = 0;
            order_batch_no = 0;
            strategy_oper_way = " ";
            comm_batch_no = 0;
            comm_id = 0;
            row_id = 0;
            row_count = -1;
            sort_type = 1;
        }
 
        /// <summary>
        /// 指令下达人
        /// </summary>
        public int comm_opor { get; set; }
 
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
        /// 策略序号
        /// </summary>
        public ulong strategy_id { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 策略方向
        /// </summary>
        public int strategy_dir { get; set; }
 
        /// <summary>
        /// 业务操作员编号
        /// </summary>
        public int busi_opor_no { get; set; }
 
        /// <summary>
        /// 信用交易方式
        /// </summary>
        public int margin_trade_type { get; set; }
 
        /// <summary>
        /// 目标策略类型
        /// </summary>
        public String target_strategy_type { get; set; }
 
        /// <summary>
        /// 策略状态
        /// </summary>
        public String strategy_status { get; set; }
 
        /// <summary>
        /// 策略处理状态
        /// </summary>
        public String strategy_deal_status { get; set; }
 
        /// <summary>
        /// 策略处理方式
        /// </summary>
        public int strategy_deal_kind { get; set; }
 
        /// <summary>
        /// 外部编号
        /// </summary>
        public ulong external_no { get; set; }
 
        /// <summary>
        /// 订单批号
        /// </summary>
        public int order_batch_no { get; set; }
 
        /// <summary>
        /// 策略操作方式
        /// </summary>
        public String strategy_oper_way { get; set; }
 
        /// <summary>
        /// 指令批号
        /// </summary>
        public int comm_batch_no { get; set; }
 
        /// <summary>
        /// 指令序号
        /// </summary>
        public ulong comm_id { get; set; }
 
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 指定行数
        /// </summary>
        public int row_count { get; set; }
 
        /// <summary>
        /// 排序方式
        /// </summary>
        public int sort_type { get; set; }
 
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
 
            packer.AddField("comm_opor", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_group_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("asset_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("strategy_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("exch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("strategy_dir", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("busi_opor_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("margin_trade_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("target_strategy_type", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("strategy_status", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("strategy_deal_status", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("strategy_deal_kind", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("external_no", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("order_batch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("strategy_oper_way", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("comm_batch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("row_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("row_count", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("sort_type", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(comm_opor);
            packer.AddInt(pd_no);
            packer.AddInt(exch_group_no);
            packer.AddInt(asset_acco_no);
            packer.AddInt64(strategy_id);
            packer.AddInt(exch_no);
            packer.AddStr(stock_code);
            packer.AddInt(strategy_dir);
            packer.AddInt(busi_opor_no);
            packer.AddInt(margin_trade_type);
            packer.AddStr(target_strategy_type);
            packer.AddStr(strategy_status);
            packer.AddStr(strategy_deal_status);
            packer.AddInt(strategy_deal_kind);
            packer.AddInt64(external_no);
            packer.AddInt(order_batch_no);
            packer.AddStr(strategy_oper_way);
            packer.AddInt(comm_batch_no);
            packer.AddInt64(comm_id);
            packer.AddInt64(row_id);
            packer.AddInt(row_count);
            packer.AddInt(sort_type);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPOR_INT,comm_opor);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_ID_INT64,strategy_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_DIR_INT,strategy_dir);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT,busi_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MARGIN_TRADE_TYPE_INT,margin_trade_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_STRATEGY_TYPE_STR,target_strategy_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_STATUS_STR,strategy_status);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_DEAL_STATUS_STR,strategy_deal_status);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_DEAL_KIND_INT,strategy_deal_kind);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64,external_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT,order_batch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_OPER_WAY_STR,strategy_oper_way);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT,comm_batch_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64,comm_id);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SORT_TYPE_INT,sort_type);
 
            return fastMsg;
        }
    }

    //逻辑_交易证券_策略_查询策略汇总
    public class ReqFunctdsecuL_11_103DTO : ReqBaseDTO
    {
        public ReqFunctdsecuL_11_103DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "tdsecuL.11.103";
            CommonDTO.func_code = CommonDTO.function_code;
            comm_opor = 0;
            pd_no = 0;
            exch_group_no = 0;
            asset_acco_no = 0;
            strategy_sum_id = 0;
            exch_no = 0;
            stock_code = " ";
            strategy_dir = 0;
            busi_opor_no = 0;
            margin_trade_type = 0;
            target_strategy_type = " ";
            strategy_status = " ";
            strategy_deal_status = " ";
            strategy_deal_kind = 0;
            external_no = 0;
            order_batch_no = 0;
            comm_batch_no = 0;
            strategy_oper_way = " ";
            row_id = 0;
            row_count = -1;
            sort_type = 1;
        }
 
        /// <summary>
        /// 指令下达人
        /// </summary>
        public int comm_opor { get; set; }
 
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
        /// 策略汇总序号
        /// </summary>
        public ulong strategy_sum_id { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 策略方向
        /// </summary>
        public int strategy_dir { get; set; }
 
        /// <summary>
        /// 业务操作员编号
        /// </summary>
        public int busi_opor_no { get; set; }
 
        /// <summary>
        /// 信用交易方式
        /// </summary>
        public int margin_trade_type { get; set; }
 
        /// <summary>
        /// 目标策略类型
        /// </summary>
        public String target_strategy_type { get; set; }
 
        /// <summary>
        /// 策略状态
        /// </summary>
        public String strategy_status { get; set; }
 
        /// <summary>
        /// 策略处理状态
        /// </summary>
        public String strategy_deal_status { get; set; }
 
        /// <summary>
        /// 策略处理方式
        /// </summary>
        public int strategy_deal_kind { get; set; }
 
        /// <summary>
        /// 外部编号
        /// </summary>
        public ulong external_no { get; set; }
 
        /// <summary>
        /// 订单批号
        /// </summary>
        public int order_batch_no { get; set; }
 
        /// <summary>
        /// 指令批号
        /// </summary>
        public int comm_batch_no { get; set; }
 
        /// <summary>
        /// 策略操作方式
        /// </summary>
        public String strategy_oper_way { get; set; }
 
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 指定行数
        /// </summary>
        public int row_count { get; set; }
 
        /// <summary>
        /// 排序方式
        /// </summary>
        public int sort_type { get; set; }
 
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
 
            packer.AddField("comm_opor", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_group_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("asset_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("strategy_sum_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("exch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("strategy_dir", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("busi_opor_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("margin_trade_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("target_strategy_type", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("strategy_status", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("strategy_deal_status", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("strategy_deal_kind", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("external_no", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("order_batch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_batch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("strategy_oper_way", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("row_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("row_count", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("sort_type", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(comm_opor);
            packer.AddInt(pd_no);
            packer.AddInt(exch_group_no);
            packer.AddInt(asset_acco_no);
            packer.AddInt64(strategy_sum_id);
            packer.AddInt(exch_no);
            packer.AddStr(stock_code);
            packer.AddInt(strategy_dir);
            packer.AddInt(busi_opor_no);
            packer.AddInt(margin_trade_type);
            packer.AddStr(target_strategy_type);
            packer.AddStr(strategy_status);
            packer.AddStr(strategy_deal_status);
            packer.AddInt(strategy_deal_kind);
            packer.AddInt64(external_no);
            packer.AddInt(order_batch_no);
            packer.AddInt(comm_batch_no);
            packer.AddStr(strategy_oper_way);
            packer.AddInt64(row_id);
            packer.AddInt(row_count);
            packer.AddInt(sort_type);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPOR_INT,comm_opor);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_SUM_ID_INT64,strategy_sum_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_DIR_INT,strategy_dir);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT,busi_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MARGIN_TRADE_TYPE_INT,margin_trade_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_STRATEGY_TYPE_STR,target_strategy_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_STATUS_STR,strategy_status);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_DEAL_STATUS_STR,strategy_deal_status);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_DEAL_KIND_INT,strategy_deal_kind);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64,external_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT,order_batch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT,comm_batch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_OPER_WAY_STR,strategy_oper_way);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SORT_TYPE_INT,sort_type);
 
            return fastMsg;
        }
    }

    //逻辑_交易证券_策略_手工撤销策略
    public class ReqFunctdsecuL_11_104DTO : ReqBaseDTO
    {
        public ReqFunctdsecuL_11_104DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "tdsecuL.11.104";
            CommonDTO.func_code = CommonDTO.function_code;
            strategy_id = 0;
        }
 
        /// <summary>
        /// 策略序号
        /// </summary>
        public ulong strategy_id { get; set; }
 
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
 
            packer.AddField("strategy_id", ELDDATATYPE.LD_DATATYPE_LONG);
 
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
 
            packer.AddInt64(strategy_id);
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

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_ID_INT64,strategy_id);
 
            return fastMsg;
        }
    }

    //逻辑_交易证券_策略_重置指令策略数量
    public class ReqFunctdsecuL_11_105DTO : ReqBaseDTO
    {
        public ReqFunctdsecuL_11_105DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "tdsecuL.11.105";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            comm_id = 0;
        }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 指令序号
        /// </summary>
        public ulong comm_id { get; set; }
 
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
            packer.AddField("comm_id", ELDDATATYPE.LD_DATATYPE_LONG);
 
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
            packer.AddInt64(comm_id);
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
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64,comm_id);
 
            return fastMsg;
        }
    }

}
