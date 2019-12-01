using LdNet.ClientSdk.Response;
using LdNet.ClientCore.Sdk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using LdNet.Communication;
using LdNet.ClientCore.Domain.Model;
using LDsdkDefineEx;

namespace LdNet.ClientSdk.Request
{
    public class tdsecuL_11_11_Request : BaseRequest, IRequest<tdsecuL_11_11_Response>
    {
        public tdsecuL_11_11_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.11.11";
            }
        }


        public int comm_opor { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public ulong algo_order_id { get; set; }
        public ulong seco_algo_order_id { get; set; }
        public String algo_exec_broker { get; set; }
        public String algo_exec_comm_str { get; set; }
        public int algo_exec_kind { get; set; }
        public int exch_no { get; set; }
        public String algo_busi_type { get; set; }
        public String stock_code { get; set; }
        public int order_dir { get; set; }
        public double order_qty { get; set; }
        public double cash_order_qty { get; set; }
        public double order_price { get; set; }
        public int price_type { get; set; }
        public int algo_valid_type { get; set; }
        public String algo_rule_way { get; set; }
        public String exch_crncy_type { get; set; }
        public String remark_info { get; set; }
        public int algo_order_time { get; set; }
        public int co_no { get; set; }
        public int busi_opor_no { get; set; }
        public int pd_no { get; set; }
        public int margin_trade_type { get; set; }
        public String target_strategy_type { get; set; }
        public String target_strategy_param { get; set; }
        public int external_no { get; set; }
        public ulong comm_id { get; set; }
        public int order_batch_no { get; set; }
        public String order_oper_way { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("comm_opor", 'I', comm_opor);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("algo_order_id", 'L', algo_order_id);
            packer.AddField("seco_algo_order_id", 'L', seco_algo_order_id);
            packer.AddField("algo_exec_broker", 'S', algo_exec_broker);
            packer.AddField("algo_exec_comm_str", 'S', algo_exec_comm_str);
            packer.AddField("algo_exec_kind", 'I', algo_exec_kind);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("algo_busi_type", 'S', algo_busi_type);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("order_dir", 'I', order_dir);
            packer.AddField("order_qty", 'D', order_qty);
            packer.AddField("cash_order_qty", 'D', cash_order_qty);
            packer.AddField("order_price", 'D', order_price);
            packer.AddField("price_type", 'I', price_type);
            packer.AddField("algo_valid_type", 'I', algo_valid_type);
            packer.AddField("algo_rule_way", 'S', algo_rule_way);
            packer.AddField("exch_crncy_type", 'S', exch_crncy_type);
            packer.AddField("remark_info", 'S', remark_info);
            packer.AddField("algo_order_time", 'I', algo_order_time);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("busi_opor_no", 'I', busi_opor_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("margin_trade_type", 'I', margin_trade_type);
            packer.AddField("target_strategy_type", 'S', target_strategy_type);
            packer.AddField("target_strategy_param", 'S', target_strategy_param);
            packer.AddField("external_no", 'I', external_no);
            packer.AddField("comm_id", 'L', comm_id);
            packer.AddField("order_batch_no", 'I', order_batch_no);
            packer.AddField("order_oper_way", 'S', order_oper_way);
        }
         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

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

    public class tdsecuL_11_12_Request : BaseRequest, IRequest<tdsecuL_11_12_Response>
    {
        public tdsecuL_11_12_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.11.12";
            }
        }


        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public ulong algo_order_id { get; set; }
        public ulong orig_algo_order_id { get; set; }
        public String algo_exec_comm_str { get; set; }
        public int algo_exec_kind { get; set; }
        public int exch_no { get; set; }
        public String algo_busi_type { get; set; }
        public String stock_code { get; set; }
        public int order_dir { get; set; }
        public double order_qty { get; set; }
        public double order_price { get; set; }
        public int price_type { get; set; }
        public int algo_valid_type { get; set; }
        public String algo_rule_way { get; set; }
        public String exch_crncy_type { get; set; }
        public String remark_info { get; set; }
        public int algo_order_time { get; set; }
        public int co_no { get; set; }
        public int busi_opor_no { get; set; }
        public String target_strategy_type { get; set; }
        public String target_strategy_param { get; set; }
        public String strategy_contr_comm { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("algo_order_id", 'L', algo_order_id);
            packer.AddField("orig_algo_order_id", 'L', orig_algo_order_id);
            packer.AddField("algo_exec_comm_str", 'S', algo_exec_comm_str);
            packer.AddField("algo_exec_kind", 'I', algo_exec_kind);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("algo_busi_type", 'S', algo_busi_type);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("order_dir", 'I', order_dir);
            packer.AddField("order_qty", 'D', order_qty);
            packer.AddField("order_price", 'D', order_price);
            packer.AddField("price_type", 'I', price_type);
            packer.AddField("algo_valid_type", 'I', algo_valid_type);
            packer.AddField("algo_rule_way", 'S', algo_rule_way);
            packer.AddField("exch_crncy_type", 'S', exch_crncy_type);
            packer.AddField("remark_info", 'S', remark_info);
            packer.AddField("algo_order_time", 'I', algo_order_time);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("busi_opor_no", 'I', busi_opor_no);
            packer.AddField("target_strategy_type", 'S', target_strategy_type);
            packer.AddField("target_strategy_param", 'S', target_strategy_param);
            packer.AddField("strategy_contr_comm", 'S', strategy_contr_comm);
        }
         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

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

    public class tdsecuL_11_13_Request : BaseRequest, IRequest<tdsecuL_11_13_Response>
    {
        public tdsecuL_11_13_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.11.13";
            }
        }


        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public ulong algo_order_id { get; set; }
        public ulong orig_algo_order_id { get; set; }
        public String algo_busi_type { get; set; }
        public String stock_code { get; set; }
        public int order_dir { get; set; }
        public double order_qty { get; set; }
        public String remark_info { get; set; }
        public int algo_order_time { get; set; }
        public String target_strategy_type { get; set; }
        public String target_strategy_param { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("algo_order_id", 'L', algo_order_id);
            packer.AddField("orig_algo_order_id", 'L', orig_algo_order_id);
            packer.AddField("algo_busi_type", 'S', algo_busi_type);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("order_dir", 'I', order_dir);
            packer.AddField("order_qty", 'D', order_qty);
            packer.AddField("remark_info", 'S', remark_info);
            packer.AddField("algo_order_time", 'I', algo_order_time);
            packer.AddField("target_strategy_type", 'S', target_strategy_type);
            packer.AddField("target_strategy_param", 'S', target_strategy_param);
        }
         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

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

    public class tdsecuL_11_101_Request : BaseRequest, IRequest<tdsecuL_11_101_Response>
    {
        public tdsecuL_11_101_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.11.101";
            }
        }


        public int comm_opor { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public ulong algo_order_id { get; set; }
        public ulong seco_algo_order_id { get; set; }
        public int exch_no { get; set; }
        public String algo_busi_type { get; set; }
        public String stock_code { get; set; }
        public int order_dir { get; set; }
        public int co_no { get; set; }
        public int busi_opor_no { get; set; }
        public int pd_no { get; set; }
        public int margin_trade_type { get; set; }
        public String target_strategy_type { get; set; }
        public String target_strategy_param { get; set; }
        public int external_no { get; set; }
        public ulong comm_id { get; set; }
        public int order_batch_no { get; set; }
        public String order_oper_way { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("comm_opor", 'I', comm_opor);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("algo_order_id", 'L', algo_order_id);
            packer.AddField("seco_algo_order_id", 'L', seco_algo_order_id);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("algo_busi_type", 'S', algo_busi_type);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("order_dir", 'I', order_dir);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("busi_opor_no", 'I', busi_opor_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("margin_trade_type", 'I', margin_trade_type);
            packer.AddField("target_strategy_type", 'S', target_strategy_type);
            packer.AddField("target_strategy_param", 'S', target_strategy_param);
            packer.AddField("external_no", 'I', external_no);
            packer.AddField("comm_id", 'L', comm_id);
            packer.AddField("order_batch_no", 'I', order_batch_no);
            packer.AddField("order_oper_way", 'S', order_oper_way);
        }
         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

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
