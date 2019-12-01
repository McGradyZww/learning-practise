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
    public class tdsecuL_7_1_Request : BaseRequest, IRequest<tdsecuL_7_1_Response>
    {
        public tdsecuL_7_1_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.7.1";
            }
        }

        public int exch_no { get; set; }
        public ulong comm_id { get; set; }
        public String cancel_info { get; set; }
        public int is_withdraw { get; set; }
        public String long_token { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("comm_id", 'L', comm_id);
            packer.AddField("cancel_info", 'S', cancel_info);
            packer.AddField("is_withdraw", 'I', is_withdraw);
            packer.AddField("long_token", 'S', long_token);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64,comm_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CANCEL_INFO_STR,cancel_info);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_WITHDRAW_INT,is_withdraw);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_LONG_TOKEN_STR,long_token);
            return fastMsg;
        }
   }

    public class tdsecuL_7_2_Request : BaseRequest, IRequest<tdsecuL_7_2_Response>
    {
        public tdsecuL_7_2_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.7.2";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public String combo_code { get; set; }
        public double combo_copies { get; set; }
        public String exch_no_str { get; set; }
        public String stock_code_str { get; set; }
        public String target_stock_code_str { get; set; }
        public int comm_batch_no { get; set; }
        public int comm_executor { get; set; }
        public int comm_begin_date { get; set; }
        public int comm_end_date { get; set; }
        public int comm_begin_time { get; set; }
        public int comm_end_time { get; set; }
        public int order_batch_no { get; set; }
        public String comm_dir_str { get; set; }
        public String price_type_str { get; set; }
        public String comm_qty_str { get; set; }
        public String limit_price_str { get; set; }
        public String limit_actual_price_str { get; set; }
        public String comm_amt_str { get; set; }
        public String comm_oper_way { get; set; }
        public ulong basket_id { get; set; }
        public String combo_posi_id_str { get; set; }
        public String long_token { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("combo_code", 'S', combo_code);
            packer.AddField("combo_copies", 'D', combo_copies);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_code_str", 'S', stock_code_str);
            packer.AddField("target_stock_code_str", 'S', target_stock_code_str);
            packer.AddField("comm_batch_no", 'I', comm_batch_no);
            packer.AddField("comm_executor", 'I', comm_executor);
            packer.AddField("comm_begin_date", 'I', comm_begin_date);
            packer.AddField("comm_end_date", 'I', comm_end_date);
            packer.AddField("comm_begin_time", 'I', comm_begin_time);
            packer.AddField("comm_end_time", 'I', comm_end_time);
            packer.AddField("order_batch_no", 'I', order_batch_no);
            packer.AddField("comm_dir_str", 'S', comm_dir_str);
            packer.AddField("price_type_str", 'S', price_type_str);
            packer.AddField("comm_qty_str", 'S', comm_qty_str);
            packer.AddField("limit_price_str", 'S', limit_price_str);
            packer.AddField("limit_actual_price_str", 'S', limit_actual_price_str);
            packer.AddField("comm_amt_str", 'S', comm_amt_str);
            packer.AddField("comm_oper_way", 'S', comm_oper_way);
            packer.AddField("basket_id", 'L', basket_id);
            packer.AddField("combo_posi_id_str", 'S', combo_posi_id_str);
            packer.AddField("long_token", 'S', long_token);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_CODE_STR,combo_code);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_COPIES_FLOAT,combo_copies);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR_STR,stock_code_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_STOCK_CODE_STR_STR,target_stock_code_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT,comm_batch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_EXECUTOR_INT,comm_executor);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BEGIN_DATE_INT,comm_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_END_DATE_INT,comm_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BEGIN_TIME_INT,comm_begin_time);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_END_TIME_INT,comm_end_time);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT,order_batch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_STR_STR,comm_dir_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_STR_STR,price_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_QTY_STR_STR,comm_qty_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_LIMIT_PRICE_STR_STR,limit_price_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_LIMIT_ACTUAL_PRICE_STR_STR,limit_actual_price_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_AMT_STR_STR,comm_amt_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPER_WAY_STR,comm_oper_way);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_ID_INT64,basket_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_POSI_ID_STR_STR,combo_posi_id_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_LONG_TOKEN_STR,long_token);
            return fastMsg;
        }
   }

    public class tdsecuL_7_3_Request : BaseRequest, IRequest<tdsecuL_7_3_Response>
    {
        public tdsecuL_7_3_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.7.3";
            }
        }

        public String combo_code { get; set; }
        public double combo_copies { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public String exch_no_str { get; set; }
        public String stock_code_str { get; set; }
        public String target_stock_code_str { get; set; }
        public int order_batch_no { get; set; }
        public String comm_id_str { get; set; }
        public String order_dir_str { get; set; }
        public String price_type_str { get; set; }
        public String order_qty_str { get; set; }
        public String order_price_str { get; set; }
        public String order_amt_str { get; set; }
        public String order_oper_way { get; set; }
        public String combo_posi_id_str { get; set; }
        public String long_token { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("combo_code", 'S', combo_code);
            packer.AddField("combo_copies", 'D', combo_copies);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_code_str", 'S', stock_code_str);
            packer.AddField("target_stock_code_str", 'S', target_stock_code_str);
            packer.AddField("order_batch_no", 'I', order_batch_no);
            packer.AddField("comm_id_str", 'S', comm_id_str);
            packer.AddField("order_dir_str", 'S', order_dir_str);
            packer.AddField("price_type_str", 'S', price_type_str);
            packer.AddField("order_qty_str", 'S', order_qty_str);
            packer.AddField("order_price_str", 'S', order_price_str);
            packer.AddField("order_amt_str", 'S', order_amt_str);
            packer.AddField("order_oper_way", 'S', order_oper_way);
            packer.AddField("combo_posi_id_str", 'S', combo_posi_id_str);
            packer.AddField("long_token", 'S', long_token);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_CODE_STR,combo_code);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_COPIES_FLOAT,combo_copies);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR_STR,stock_code_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_STOCK_CODE_STR_STR,target_stock_code_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT,order_batch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_STR_STR,comm_id_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR,order_dir_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_STR_STR,price_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_STR_STR,order_qty_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_STR_STR,order_price_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_AMT_STR_STR,order_amt_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR,order_oper_way);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_POSI_ID_STR_STR,combo_posi_id_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_LONG_TOKEN_STR,long_token);
            return fastMsg;
        }
   }

    public class tdsecuL_7_4_Request : BaseRequest, IRequest<tdsecuL_7_4_Response>
    {
        public tdsecuL_7_4_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.7.4";
            }
        }

        public int order_date { get; set; }
        public ulong order_id { get; set; }
        public String long_token { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("order_date", 'I', order_date);
            packer.AddField("order_id", 'L', order_id);
            packer.AddField("long_token", 'S', long_token);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT,order_date);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64,order_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_LONG_TOKEN_STR,long_token);
            return fastMsg;
        }
   }

    public class tdsecuL_7_5_Request : BaseRequest, IRequest<tdsecuL_7_5_Response>
    {
        public tdsecuL_7_5_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.7.5";
            }
        }

        public ulong external_no { get; set; }
        public int order_date { get; set; }
        public ulong order_id { get; set; }
        public int modi_batch_no { get; set; }
        public double modi_order_price { get; set; }
        public double modi_order_qty { get; set; }
        public int modi_price_type { get; set; }
        public String long_token { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("external_no", 'L', external_no);
            packer.AddField("order_date", 'I', order_date);
            packer.AddField("order_id", 'L', order_id);
            packer.AddField("modi_batch_no", 'I', modi_batch_no);
            packer.AddField("modi_order_price", 'D', modi_order_price);
            packer.AddField("modi_order_qty", 'D', modi_order_qty);
            packer.AddField("modi_price_type", 'I', modi_price_type);
            packer.AddField("long_token", 'S', long_token);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64,external_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT,order_date);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64,order_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MODI_BATCH_NO_INT,modi_batch_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MODI_ORDER_PRICE_FLOAT,modi_order_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MODI_ORDER_QTY_FLOAT,modi_order_qty);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MODI_PRICE_TYPE_INT,modi_price_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_LONG_TOKEN_STR,long_token);
            return fastMsg;
        }
   }

    public class tdsecuL_7_6_Request : BaseRequest, IRequest<tdsecuL_7_6_Response>
    {
        public tdsecuL_7_6_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.7.6";
            }
        }

        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            return fastMsg;
        }
   }

}
