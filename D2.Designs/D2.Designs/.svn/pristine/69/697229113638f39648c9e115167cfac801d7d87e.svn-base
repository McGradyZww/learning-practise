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
    public class tdsecuL_11_1_Request : BaseRequest, IRequest<tdsecuL_11_1_Response>
    {
        public tdsecuL_11_1_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.11.1";
            }
        }

        public int strategy_plugin_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("strategy_plugin_type", 'I', strategy_plugin_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_PLUGIN_TYPE_INT,strategy_plugin_type);
            return fastMsg;
        }
   }

    public class tdsecuL_11_2_Request : BaseRequest, IRequest<tdsecuL_11_2_Response>
    {
        public tdsecuL_11_2_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.11.2";
            }
        }

        public int strategy_plugin_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("strategy_plugin_type", 'I', strategy_plugin_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_PLUGIN_TYPE_INT,strategy_plugin_type);
            return fastMsg;
        }
   }

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
        public int co_no { get; set; }
        public String pd_code { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public int strategy_batch_no { get; set; }
        public String strategy_exec_broker { get; set; }
        public String strategy_exec_comm_str { get; set; }
        public int strategy_exec_kind { get; set; }
        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public int strategy_dir { get; set; }
        public double strategy_qty { get; set; }
        public double cash_strategy_qty { get; set; }
        public double strategy_price { get; set; }
        public int price_type { get; set; }
        public double strategy_amt { get; set; }
        public int strategy_valid_type { get; set; }
        public String strategy_rule_way { get; set; }
        public String remark_info { get; set; }
        public int margin_trade_type { get; set; }
        public String target_strategy_type { get; set; }
        public String target_strategy_param { get; set; }
        public ulong external_no { get; set; }
        public int order_batch_no { get; set; }
        public String strategy_oper_way { get; set; }
        public int strategy_price_type { get; set; }
        public int comm_batch_no { get; set; }
        public ulong comm_id { get; set; }
        public ulong basket_id { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("comm_opor", 'I', comm_opor);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_code", 'S', pd_code);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("strategy_batch_no", 'I', strategy_batch_no);
            packer.AddField("strategy_exec_broker", 'S', strategy_exec_broker);
            packer.AddField("strategy_exec_comm_str", 'S', strategy_exec_comm_str);
            packer.AddField("strategy_exec_kind", 'I', strategy_exec_kind);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("strategy_dir", 'I', strategy_dir);
            packer.AddField("strategy_qty", 'D', strategy_qty);
            packer.AddField("cash_strategy_qty", 'D', cash_strategy_qty);
            packer.AddField("strategy_price", 'D', strategy_price);
            packer.AddField("price_type", 'I', price_type);
            packer.AddField("strategy_amt", 'D', strategy_amt);
            packer.AddField("strategy_valid_type", 'I', strategy_valid_type);
            packer.AddField("strategy_rule_way", 'S', strategy_rule_way);
            packer.AddField("remark_info", 'S', remark_info);
            packer.AddField("margin_trade_type", 'I', margin_trade_type);
            packer.AddField("target_strategy_type", 'S', target_strategy_type);
            packer.AddField("target_strategy_param", 'S', target_strategy_param);
            packer.AddField("external_no", 'L', external_no);
            packer.AddField("order_batch_no", 'I', order_batch_no);
            packer.AddField("strategy_oper_way", 'S', strategy_oper_way);
            packer.AddField("strategy_price_type", 'I', strategy_price_type);
            packer.AddField("comm_batch_no", 'I', comm_batch_no);
            packer.AddField("comm_id", 'L', comm_id);
            packer.AddField("basket_id", 'L', basket_id);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

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

        public ulong strategy_id { get; set; }
        public String target_strategy_type { get; set; }
        public String target_strategy_param { get; set; }
        public String strategy_contr_comm { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("strategy_id", 'L', strategy_id);
            packer.AddField("target_strategy_type", 'S', target_strategy_type);
            packer.AddField("target_strategy_param", 'S', target_strategy_param);
            packer.AddField("strategy_contr_comm", 'S', strategy_contr_comm);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_ID_INT64,strategy_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_STRATEGY_TYPE_STR,target_strategy_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_STRATEGY_PARAM_STR,target_strategy_param);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_CONTR_COMM_STR,strategy_contr_comm);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
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

        public ulong strategy_id { get; set; }
        public String target_strategy_type { get; set; }
        public String target_strategy_param { get; set; }
        public String strategy_contr_comm { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("strategy_id", 'L', strategy_id);
            packer.AddField("target_strategy_type", 'S', target_strategy_type);
            packer.AddField("target_strategy_param", 'S', target_strategy_param);
            packer.AddField("strategy_contr_comm", 'S', strategy_contr_comm);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_ID_INT64,strategy_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_STRATEGY_TYPE_STR,target_strategy_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_STRATEGY_PARAM_STR,target_strategy_param);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_CONTR_COMM_STR,strategy_contr_comm);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class tdsecuL_11_14_Request : BaseRequest, IRequest<tdsecuL_11_14_Response>
    {
        public tdsecuL_11_14_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.11.14";
            }
        }

        public ulong strategy_id { get; set; }
        public String target_strategy_type { get; set; }
        public String target_strategy_param { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("strategy_id", 'L', strategy_id);
            packer.AddField("target_strategy_type", 'S', target_strategy_type);
            packer.AddField("target_strategy_param", 'S', target_strategy_param);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_ID_INT64,strategy_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_STRATEGY_TYPE_STR,target_strategy_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_STRATEGY_PARAM_STR,target_strategy_param);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class tdsecuL_11_15_Request : BaseRequest, IRequest<tdsecuL_11_15_Response>
    {
        public tdsecuL_11_15_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.11.15";
            }
        }

        public ulong strategy_id { get; set; }
        public ulong order_id { get; set; }
        public double order_qty { get; set; }
        public double order_amt { get; set; }
        public double wtdraw_qty { get; set; }
        public ulong strike_id { get; set; }
        public double strike_qty { get; set; }
        public double strike_amt { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("strategy_id", 'L', strategy_id);
            packer.AddField("order_id", 'L', order_id);
            packer.AddField("order_qty", 'D', order_qty);
            packer.AddField("order_amt", 'D', order_amt);
            packer.AddField("wtdraw_qty", 'D', wtdraw_qty);
            packer.AddField("strike_id", 'L', strike_id);
            packer.AddField("strike_qty", 'D', strike_qty);
            packer.AddField("strike_amt", 'D', strike_amt);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

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

    public class tdsecuL_11_16_Request : BaseRequest, IRequest<tdsecuL_11_16_Response>
    {
        public tdsecuL_11_16_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.11.16";
            }
        }

        public ulong orig_strategy_id { get; set; }
        public ulong strategy_id { get; set; }
        public String strategy_deal_status { get; set; }
        public String strategy_status { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("orig_strategy_id", 'L', orig_strategy_id);
            packer.AddField("strategy_id", 'L', strategy_id);
            packer.AddField("strategy_deal_status", 'S', strategy_deal_status);
            packer.AddField("strategy_status", 'S', strategy_status);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORIG_STRATEGY_ID_INT64,orig_strategy_id);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_ID_INT64,strategy_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_DEAL_STATUS_STR,strategy_deal_status);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_STATUS_STR,strategy_status);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
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
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public ulong strategy_id { get; set; }
        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public int strategy_dir { get; set; }
        public int busi_opor_no { get; set; }
        public int margin_trade_type { get; set; }
        public String target_strategy_type { get; set; }
        public String strategy_status { get; set; }
        public String strategy_deal_status { get; set; }
        public int strategy_deal_kind { get; set; }
        public ulong external_no { get; set; }
        public int order_batch_no { get; set; }
        public String strategy_oper_way { get; set; }
        public ulong comm_id { get; set; }
        public int comm_batch_no { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public int sort_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("comm_opor", 'I', comm_opor);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("strategy_id", 'L', strategy_id);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("strategy_dir", 'I', strategy_dir);
            packer.AddField("busi_opor_no", 'I', busi_opor_no);
            packer.AddField("margin_trade_type", 'I', margin_trade_type);
            packer.AddField("target_strategy_type", 'S', target_strategy_type);
            packer.AddField("strategy_status", 'S', strategy_status);
            packer.AddField("strategy_deal_status", 'S', strategy_deal_status);
            packer.AddField("strategy_deal_kind", 'I', strategy_deal_kind);
            packer.AddField("external_no", 'L', external_no);
            packer.AddField("order_batch_no", 'I', order_batch_no);
            packer.AddField("strategy_oper_way", 'S', strategy_oper_way);
            packer.AddField("comm_id", 'L', comm_id);
            packer.AddField("comm_batch_no", 'I', comm_batch_no);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
            packer.AddField("sort_type", 'I', sort_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

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

    public class tdsecuL_11_102_Request : BaseRequest, IRequest<tdsecuL_11_102_Response>
    {
        public tdsecuL_11_102_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.11.102";
            }
        }

        public int comm_opor { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public ulong strategy_id { get; set; }
        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public int strategy_dir { get; set; }
        public int busi_opor_no { get; set; }
        public int margin_trade_type { get; set; }
        public String target_strategy_type { get; set; }
        public String strategy_status { get; set; }
        public String strategy_deal_status { get; set; }
        public int strategy_deal_kind { get; set; }
        public ulong external_no { get; set; }
        public int order_batch_no { get; set; }
        public String strategy_oper_way { get; set; }
        public int comm_batch_no { get; set; }
        public ulong comm_id { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public int sort_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("comm_opor", 'I', comm_opor);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("strategy_id", 'L', strategy_id);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("strategy_dir", 'I', strategy_dir);
            packer.AddField("busi_opor_no", 'I', busi_opor_no);
            packer.AddField("margin_trade_type", 'I', margin_trade_type);
            packer.AddField("target_strategy_type", 'S', target_strategy_type);
            packer.AddField("strategy_status", 'S', strategy_status);
            packer.AddField("strategy_deal_status", 'S', strategy_deal_status);
            packer.AddField("strategy_deal_kind", 'I', strategy_deal_kind);
            packer.AddField("external_no", 'L', external_no);
            packer.AddField("order_batch_no", 'I', order_batch_no);
            packer.AddField("strategy_oper_way", 'S', strategy_oper_way);
            packer.AddField("comm_batch_no", 'I', comm_batch_no);
            packer.AddField("comm_id", 'L', comm_id);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
            packer.AddField("sort_type", 'I', sort_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

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

    public class tdsecuL_11_103_Request : BaseRequest, IRequest<tdsecuL_11_103_Response>
    {
        public tdsecuL_11_103_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.11.103";
            }
        }

        public int comm_opor { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public ulong strategy_sum_id { get; set; }
        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public int strategy_dir { get; set; }
        public int busi_opor_no { get; set; }
        public int margin_trade_type { get; set; }
        public String target_strategy_type { get; set; }
        public String strategy_status { get; set; }
        public String strategy_deal_status { get; set; }
        public int strategy_deal_kind { get; set; }
        public ulong external_no { get; set; }
        public int order_batch_no { get; set; }
        public int comm_batch_no { get; set; }
        public String strategy_oper_way { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public int sort_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("comm_opor", 'I', comm_opor);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("strategy_sum_id", 'L', strategy_sum_id);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("strategy_dir", 'I', strategy_dir);
            packer.AddField("busi_opor_no", 'I', busi_opor_no);
            packer.AddField("margin_trade_type", 'I', margin_trade_type);
            packer.AddField("target_strategy_type", 'S', target_strategy_type);
            packer.AddField("strategy_status", 'S', strategy_status);
            packer.AddField("strategy_deal_status", 'S', strategy_deal_status);
            packer.AddField("strategy_deal_kind", 'I', strategy_deal_kind);
            packer.AddField("external_no", 'L', external_no);
            packer.AddField("order_batch_no", 'I', order_batch_no);
            packer.AddField("comm_batch_no", 'I', comm_batch_no);
            packer.AddField("strategy_oper_way", 'S', strategy_oper_way);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
            packer.AddField("sort_type", 'I', sort_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

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

    public class tdsecuL_11_104_Request : BaseRequest, IRequest<tdsecuL_11_104_Response>
    {
        public tdsecuL_11_104_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.11.104";
            }
        }

        public ulong strategy_id { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("strategy_id", 'L', strategy_id);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_ID_INT64,strategy_id);
            return fastMsg;
        }
   }

    public class tdsecuL_11_105_Request : BaseRequest, IRequest<tdsecuL_11_105_Response>
    {
        public tdsecuL_11_105_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.11.105";
            }
        }

        public int co_no { get; set; }
        public ulong comm_id { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("comm_id", 'L', comm_id);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64,comm_id);
            return fastMsg;
        }
   }

}
