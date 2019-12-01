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
    //逻辑_交易证券_策略接口_新增母单
    public class ReqFunctdsecuL_11_11DTO : ReqBaseDTO
    {
        public ReqFunctdsecuL_11_11DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "tdsecuL.11.11";
            CommonDTO.func_code = CommonDTO.function_code;
            comm_opor = 0;
            exch_group_no = 0;
            asset_acco_no = 0;
            algo_order_id = 0;
            seco_algo_order_id = 0;
            algo_exec_broker = " ";
            algo_exec_comm_str = " ";
            algo_exec_kind = 0;
            exch_no = 0;
            algo_busi_type = " ";
            stock_code = " ";
            order_dir = 0;
            order_qty = 0;
            cash_order_qty = 0;
            order_price = 0;
            price_type = 0;
            algo_valid_type = 0;
            algo_rule_way = " ";
            exch_crncy_type = "CNY";
            remark_info = " ";
            algo_order_time = 0;
            co_no = 0;
            busi_opor_no = 0;
            pd_no = 0;
            margin_trade_type = 0;
            target_strategy_type = " ";
            target_strategy_param = " ";
            external_no = 0;
            comm_id = 0;
            order_batch_no = 0;
            order_oper_way = " ";
        }
 
        /// <summary>
        /// 指令下达人
        /// </summary>
        public int comm_opor { get; set; }
 
        /// <summary>
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// 母单序号
        /// </summary>
        public ulong algo_order_id { get; set; }
 
        /// <summary>
        /// 第二母单序号
        /// </summary>
        public ulong seco_algo_order_id { get; set; }
 
        /// <summary>
        /// 策略执行商
        /// </summary>
        public String algo_exec_broker { get; set; }
 
        /// <summary>
        /// 策略执行指令串
        /// </summary>
        public String algo_exec_comm_str { get; set; }
 
        /// <summary>
        /// 策略执行方式
        /// </summary>
        public int algo_exec_kind { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 策略业务类别
        /// </summary>
        public String algo_busi_type { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 订单方向
        /// </summary>
        public int order_dir { get; set; }
 
        /// <summary>
        /// 订单数量
        /// </summary>
        public double order_qty { get; set; }
 
        /// <summary>
        /// 资金订单数量
        /// </summary>
        public double cash_order_qty { get; set; }
 
        /// <summary>
        /// 订单价格
        /// </summary>
        public double order_price { get; set; }
 
        /// <summary>
        /// 价格类型
        /// </summary>
        public int price_type { get; set; }
 
        /// <summary>
        /// 策略有效期限
        /// </summary>
        public int algo_valid_type { get; set; }
 
        /// <summary>
        /// 策略规则方式
        /// </summary>
        public String algo_rule_way { get; set; }
 
        /// <summary>
        /// 交易币种
        /// </summary>
        public String exch_crncy_type { get; set; }
 
        /// <summary>
        /// 备注信息
        /// </summary>
        public String remark_info { get; set; }
 
        /// <summary>
        /// 母单时间
        /// </summary>
        public int algo_order_time { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 业务操作员编号
        /// </summary>
        public int busi_opor_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
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
        public int external_no { get; set; }
 
        /// <summary>
        /// 指令序号
        /// </summary>
        public ulong comm_id { get; set; }
 
        /// <summary>
        /// 订单批号
        /// </summary>
        public int order_batch_no { get; set; }
 
        /// <summary>
        /// 订单操作方式
        /// </summary>
        public String order_oper_way { get; set; }
 
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
            packer.AddField("exch_group_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("asset_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("algo_order_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("seco_algo_order_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("algo_exec_broker", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("algo_exec_comm_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("algo_exec_kind", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("algo_busi_type", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("stock_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("order_dir", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("order_qty", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("cash_order_qty", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("order_price", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("price_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("algo_valid_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("algo_rule_way", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("exch_crncy_type", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("remark_info", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("algo_order_time", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("busi_opor_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("margin_trade_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("target_strategy_type", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("target_strategy_param", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("external_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("order_batch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("order_oper_way", ELDDATATYPE.LD_DATATYPE_STRING);
 
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
            packer.AddInt(exch_group_no);
            packer.AddInt(asset_acco_no);
            packer.AddInt64(algo_order_id);
            packer.AddInt64(seco_algo_order_id);
            packer.AddStr(algo_exec_broker);
            packer.AddStr(algo_exec_comm_str);
            packer.AddInt(algo_exec_kind);
            packer.AddInt(exch_no);
            packer.AddStr(algo_busi_type);
            packer.AddStr(stock_code);
            packer.AddInt(order_dir);
            packer.AddDouble(order_qty);
            packer.AddDouble(cash_order_qty);
            packer.AddDouble(order_price);
            packer.AddInt(price_type);
            packer.AddInt(algo_valid_type);
            packer.AddStr(algo_rule_way);
            packer.AddStr(exch_crncy_type);
            packer.AddStr(remark_info);
            packer.AddInt(algo_order_time);
            packer.AddInt(co_no);
            packer.AddInt(busi_opor_no);
            packer.AddInt(pd_no);
            packer.AddInt(margin_trade_type);
            packer.AddStr(target_strategy_type);
            packer.AddStr(target_strategy_param);
            packer.AddInt(external_no);
            packer.AddInt64(comm_id);
            packer.AddInt(order_batch_no);
            packer.AddStr(order_oper_way);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ALGO_ORDER_ID_INT64,algo_order_id);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_SECO_ALGO_ORDER_ID_INT64,seco_algo_order_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ALGO_EXEC_BROKER_STR,algo_exec_broker);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ALGO_EXEC_COMM_STR_STR,algo_exec_comm_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ALGO_EXEC_KIND_INT,algo_exec_kind);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ALGO_BUSI_TYPE_STR,algo_busi_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT,order_dir);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT,order_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_ORDER_QTY_FLOAT,cash_order_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT,order_price);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_INT,price_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ALGO_VALID_TYPE_INT,algo_valid_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ALGO_RULE_WAY_STR,algo_rule_way);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR,exch_crncy_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ALGO_ORDER_TIME_INT,algo_order_time);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT,busi_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MARGIN_TRADE_TYPE_INT,margin_trade_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_STRATEGY_TYPE_STR,target_strategy_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_STRATEGY_PARAM_STR,target_strategy_param);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT,external_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64,comm_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT,order_batch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR,order_oper_way);
 
            return fastMsg;
        }
    }

    //逻辑_交易证券_策略接口_修改母单
    public class ReqFunctdsecuL_11_12DTO : ReqBaseDTO
    {
        public ReqFunctdsecuL_11_12DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "tdsecuL.11.12";
            CommonDTO.func_code = CommonDTO.function_code;
            exch_group_no = 0;
            asset_acco_no = 0;
            algo_order_id = 0;
            orig_algo_order_id = 0;
            algo_exec_comm_str = " ";
            algo_exec_kind = 0;
            exch_no = 0;
            algo_busi_type = " ";
            stock_code = " ";
            order_dir = 0;
            order_qty = 0;
            order_price = 0;
            price_type = 0;
            algo_valid_type = 0;
            algo_rule_way = " ";
            exch_crncy_type = "CNY";
            remark_info = " ";
            algo_order_time = 0;
            co_no = 0;
            busi_opor_no = 0;
            target_strategy_type = " ";
            target_strategy_param = " ";
            strategy_contr_comm = " ";
        }
 
        /// <summary>
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// 母单序号
        /// </summary>
        public ulong algo_order_id { get; set; }
 
        /// <summary>
        /// 原母单序号
        /// </summary>
        public ulong orig_algo_order_id { get; set; }
 
        /// <summary>
        /// 策略执行指令串
        /// </summary>
        public String algo_exec_comm_str { get; set; }
 
        /// <summary>
        /// 策略执行方式
        /// </summary>
        public int algo_exec_kind { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 策略业务类别
        /// </summary>
        public String algo_busi_type { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 订单方向
        /// </summary>
        public int order_dir { get; set; }
 
        /// <summary>
        /// 订单数量
        /// </summary>
        public double order_qty { get; set; }
 
        /// <summary>
        /// 订单价格
        /// </summary>
        public double order_price { get; set; }
 
        /// <summary>
        /// 价格类型
        /// </summary>
        public int price_type { get; set; }
 
        /// <summary>
        /// 策略有效期限
        /// </summary>
        public int algo_valid_type { get; set; }
 
        /// <summary>
        /// 策略规则方式
        /// </summary>
        public String algo_rule_way { get; set; }
 
        /// <summary>
        /// 交易币种
        /// </summary>
        public String exch_crncy_type { get; set; }
 
        /// <summary>
        /// 备注信息
        /// </summary>
        public String remark_info { get; set; }
 
        /// <summary>
        /// 母单时间
        /// </summary>
        public int algo_order_time { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 业务操作员编号
        /// </summary>
        public int busi_opor_no { get; set; }
 
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
 
            packer.AddField("exch_group_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("asset_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("algo_order_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("orig_algo_order_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("algo_exec_comm_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("algo_exec_kind", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("algo_busi_type", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("stock_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("order_dir", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("order_qty", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("order_price", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("price_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("algo_valid_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("algo_rule_way", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("exch_crncy_type", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("remark_info", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("algo_order_time", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("busi_opor_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("target_strategy_type", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("target_strategy_param", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("strategy_contr_comm", ELDDATATYPE.LD_DATATYPE_STRING);
 
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
 
            packer.AddInt(exch_group_no);
            packer.AddInt(asset_acco_no);
            packer.AddInt64(algo_order_id);
            packer.AddInt64(orig_algo_order_id);
            packer.AddStr(algo_exec_comm_str);
            packer.AddInt(algo_exec_kind);
            packer.AddInt(exch_no);
            packer.AddStr(algo_busi_type);
            packer.AddStr(stock_code);
            packer.AddInt(order_dir);
            packer.AddDouble(order_qty);
            packer.AddDouble(order_price);
            packer.AddInt(price_type);
            packer.AddInt(algo_valid_type);
            packer.AddStr(algo_rule_way);
            packer.AddStr(exch_crncy_type);
            packer.AddStr(remark_info);
            packer.AddInt(algo_order_time);
            packer.AddInt(co_no);
            packer.AddInt(busi_opor_no);
            packer.AddStr(target_strategy_type);
            packer.AddStr(target_strategy_param);
            packer.AddStr(strategy_contr_comm);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ALGO_ORDER_ID_INT64,algo_order_id);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORIG_ALGO_ORDER_ID_INT64,orig_algo_order_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ALGO_EXEC_COMM_STR_STR,algo_exec_comm_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ALGO_EXEC_KIND_INT,algo_exec_kind);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ALGO_BUSI_TYPE_STR,algo_busi_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT,order_dir);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT,order_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT,order_price);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_INT,price_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ALGO_VALID_TYPE_INT,algo_valid_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ALGO_RULE_WAY_STR,algo_rule_way);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR,exch_crncy_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ALGO_ORDER_TIME_INT,algo_order_time);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT,busi_opor_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_STRATEGY_TYPE_STR,target_strategy_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_STRATEGY_PARAM_STR,target_strategy_param);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_CONTR_COMM_STR,strategy_contr_comm);
 
            return fastMsg;
        }
    }

    //逻辑_交易证券_策略接口_撤销母单
    public class ReqFunctdsecuL_11_13DTO : ReqBaseDTO
    {
        public ReqFunctdsecuL_11_13DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "tdsecuL.11.13";
            CommonDTO.func_code = CommonDTO.function_code;
            exch_group_no = 0;
            asset_acco_no = 0;
            algo_order_id = 0;
            orig_algo_order_id = 0;
            algo_busi_type = " ";
            stock_code = " ";
            order_dir = 0;
            order_qty = 0;
            remark_info = " ";
            algo_order_time = 0;
            target_strategy_type = " ";
            target_strategy_param = " ";
        }
 
        /// <summary>
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// 母单序号
        /// </summary>
        public ulong algo_order_id { get; set; }
 
        /// <summary>
        /// 原母单序号
        /// </summary>
        public ulong orig_algo_order_id { get; set; }
 
        /// <summary>
        /// 策略业务类别
        /// </summary>
        public String algo_busi_type { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 订单方向
        /// </summary>
        public int order_dir { get; set; }
 
        /// <summary>
        /// 订单数量
        /// </summary>
        public double order_qty { get; set; }
 
        /// <summary>
        /// 备注信息
        /// </summary>
        public String remark_info { get; set; }
 
        /// <summary>
        /// 母单时间
        /// </summary>
        public int algo_order_time { get; set; }
 
        /// <summary>
        /// 目标策略类型
        /// </summary>
        public String target_strategy_type { get; set; }
 
        /// <summary>
        /// 目标策略参数
        /// </summary>
        public String target_strategy_param { get; set; }
 
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
 
            packer.AddField("exch_group_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("asset_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("algo_order_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("orig_algo_order_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("algo_busi_type", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("stock_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("order_dir", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("order_qty", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("remark_info", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("algo_order_time", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("target_strategy_type", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("target_strategy_param", ELDDATATYPE.LD_DATATYPE_STRING);
 
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
 
            packer.AddInt(exch_group_no);
            packer.AddInt(asset_acco_no);
            packer.AddInt64(algo_order_id);
            packer.AddInt64(orig_algo_order_id);
            packer.AddStr(algo_busi_type);
            packer.AddStr(stock_code);
            packer.AddInt(order_dir);
            packer.AddDouble(order_qty);
            packer.AddStr(remark_info);
            packer.AddInt(algo_order_time);
            packer.AddStr(target_strategy_type);
            packer.AddStr(target_strategy_param);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ALGO_ORDER_ID_INT64,algo_order_id);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORIG_ALGO_ORDER_ID_INT64,orig_algo_order_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ALGO_BUSI_TYPE_STR,algo_busi_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT,order_dir);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT,order_qty);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ALGO_ORDER_TIME_INT,algo_order_time);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_STRATEGY_TYPE_STR,target_strategy_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_STRATEGY_PARAM_STR,target_strategy_param);
 
            return fastMsg;
        }
    }

    //逻辑_交易证券_策略接口_查询母单
    public class ReqFunctdsecuL_11_101DTO : ReqBaseDTO
    {
        public ReqFunctdsecuL_11_101DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "tdsecuL.11.101";
            CommonDTO.func_code = CommonDTO.function_code;
            comm_opor = 0;
            exch_group_no = 0;
            asset_acco_no = 0;
            algo_order_id = 0;
            seco_algo_order_id = 0;
            exch_no = 0;
            algo_busi_type = " ";
            stock_code = " ";
            order_dir = 0;
            co_no = 0;
            busi_opor_no = 0;
            pd_no = 0;
            margin_trade_type = 0;
            target_strategy_type = " ";
            target_strategy_param = " ";
            external_no = 0;
            comm_id = 0;
            order_batch_no = 0;
            order_oper_way = " ";
        }
 
        /// <summary>
        /// 指令下达人
        /// </summary>
        public int comm_opor { get; set; }
 
        /// <summary>
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// 母单序号
        /// </summary>
        public ulong algo_order_id { get; set; }
 
        /// <summary>
        /// 第二母单序号
        /// </summary>
        public ulong seco_algo_order_id { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 策略业务类别
        /// </summary>
        public String algo_busi_type { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 订单方向
        /// </summary>
        public int order_dir { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 业务操作员编号
        /// </summary>
        public int busi_opor_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
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
        public int external_no { get; set; }
 
        /// <summary>
        /// 指令序号
        /// </summary>
        public ulong comm_id { get; set; }
 
        /// <summary>
        /// 订单批号
        /// </summary>
        public int order_batch_no { get; set; }
 
        /// <summary>
        /// 订单操作方式
        /// </summary>
        public String order_oper_way { get; set; }
 
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
            packer.AddField("exch_group_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("asset_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("algo_order_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("seco_algo_order_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("exch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("algo_busi_type", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("stock_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("order_dir", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("busi_opor_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("margin_trade_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("target_strategy_type", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("target_strategy_param", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("external_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("order_batch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("order_oper_way", ELDDATATYPE.LD_DATATYPE_STRING);
 
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
            packer.AddInt(exch_group_no);
            packer.AddInt(asset_acco_no);
            packer.AddInt64(algo_order_id);
            packer.AddInt64(seco_algo_order_id);
            packer.AddInt(exch_no);
            packer.AddStr(algo_busi_type);
            packer.AddStr(stock_code);
            packer.AddInt(order_dir);
            packer.AddInt(co_no);
            packer.AddInt(busi_opor_no);
            packer.AddInt(pd_no);
            packer.AddInt(margin_trade_type);
            packer.AddStr(target_strategy_type);
            packer.AddStr(target_strategy_param);
            packer.AddInt(external_no);
            packer.AddInt64(comm_id);
            packer.AddInt(order_batch_no);
            packer.AddStr(order_oper_way);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ALGO_ORDER_ID_INT64,algo_order_id);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_SECO_ALGO_ORDER_ID_INT64,seco_algo_order_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ALGO_BUSI_TYPE_STR,algo_busi_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT,order_dir);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT,busi_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MARGIN_TRADE_TYPE_INT,margin_trade_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_STRATEGY_TYPE_STR,target_strategy_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_STRATEGY_PARAM_STR,target_strategy_param);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT,external_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64,comm_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT,order_batch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR,order_oper_way);
 
            return fastMsg;
        }
    }

}
