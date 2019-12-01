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
    public class tdsecuL_4_11_Request : BaseRequest, IRequest<tdsecuL_4_11_Response>
    {
        public tdsecuL_4_11_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.4.11";
            }
        }

        public int comm_opor { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public ulong external_no { get; set; }
        public ulong comm_id { get; set; }
        public int order_batch_no { get; set; }
        public int order_dir { get; set; }
        public double order_qty { get; set; }
        public double order_price { get; set; }
        public int price_type { get; set; }
        public String order_oper_way { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("comm_opor", 'I', comm_opor);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("external_no", 'L', external_no);
            packer.AddField("comm_id", 'L', comm_id);
            packer.AddField("order_batch_no", 'I', order_batch_no);
            packer.AddField("order_dir", 'I', order_dir);
            packer.AddField("order_qty", 'D', order_qty);
            packer.AddField("order_price", 'D', order_price);
            packer.AddField("price_type", 'I', price_type);
            packer.AddField("order_oper_way", 'S', order_oper_way);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPOR_INT,comm_opor);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64,external_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64,comm_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT,order_batch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT,order_dir);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT,order_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT,order_price);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_INT,price_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR,order_oper_way);
            return fastMsg;
        }
   }

    public class tdsecuL_4_12_Request : BaseRequest, IRequest<tdsecuL_4_12_Response>
    {
        public tdsecuL_4_12_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.4.12";
            }
        }

        public int order_date { get; set; }
        public ulong order_id { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("order_date", 'I', order_date);
            packer.AddField("order_id", 'L', order_id);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT,order_date);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64,order_id);
            return fastMsg;
        }
   }

    public class tdsecuL_4_14_Request : BaseRequest, IRequest<tdsecuL_4_14_Response>
    {
        public tdsecuL_4_14_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.4.14";
            }
        }

        public ulong external_no { get; set; }
        public int order_date { get; set; }
        public ulong order_id { get; set; }
        public int modi_batch_no { get; set; }
        public double modi_order_price { get; set; }
        public double modi_order_qty { get; set; }
        public int modi_price_type { get; set; }
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
            return fastMsg;
        }
   }

    public class tdsecuL_4_15_Request : BaseRequest, IRequest<tdsecuL_4_15_Response>
    {
        public tdsecuL_4_15_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.4.15";
            }
        }

        public int comm_opor { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public String exch_no_str { get; set; }
        public String stock_code_str { get; set; }
        public ulong external_no { get; set; }
        public String comm_id_str { get; set; }
        public int order_batch_no { get; set; }
        public String order_dir_str { get; set; }
        public String order_qty_str { get; set; }
        public String order_price_str { get; set; }
        public String price_type_str { get; set; }
        public String order_oper_way { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("comm_opor", 'I', comm_opor);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_code_str", 'S', stock_code_str);
            packer.AddField("external_no", 'L', external_no);
            packer.AddField("comm_id_str", 'S', comm_id_str);
            packer.AddField("order_batch_no", 'I', order_batch_no);
            packer.AddField("order_dir_str", 'S', order_dir_str);
            packer.AddField("order_qty_str", 'S', order_qty_str);
            packer.AddField("order_price_str", 'S', order_price_str);
            packer.AddField("price_type_str", 'S', price_type_str);
            packer.AddField("order_oper_way", 'S', order_oper_way);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPOR_INT,comm_opor);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR_STR,stock_code_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64,external_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_STR_STR,comm_id_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT,order_batch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR,order_dir_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_STR_STR,order_qty_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_STR_STR,order_price_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_STR_STR,price_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR,order_oper_way);
            return fastMsg;
        }
   }

    public class tdsecuL_4_16_Request : BaseRequest, IRequest<tdsecuL_4_16_Response>
    {
        public tdsecuL_4_16_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.4.16";
            }
        }

        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public ulong comm_id { get; set; }
        public int comm_batch_no { get; set; }
        public int order_batch_no { get; set; }
        public int order_dir { get; set; }
        public double order_qty { get; set; }
        public int price_type { get; set; }
        public int exec_price_type { get; set; }
        public double price_offset { get; set; }
        public String order_oper_way { get; set; }
        public ulong external_no { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("comm_id", 'L', comm_id);
            packer.AddField("comm_batch_no", 'I', comm_batch_no);
            packer.AddField("order_batch_no", 'I', order_batch_no);
            packer.AddField("order_dir", 'I', order_dir);
            packer.AddField("order_qty", 'D', order_qty);
            packer.AddField("price_type", 'I', price_type);
            packer.AddField("exec_price_type", 'I', exec_price_type);
            packer.AddField("price_offset", 'D', price_offset);
            packer.AddField("order_oper_way", 'S', order_oper_way);
            packer.AddField("external_no", 'L', external_no);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64,comm_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT,comm_batch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT,order_batch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT,order_dir);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT,order_qty);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_INT,price_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_PRICE_TYPE_INT,exec_price_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_OFFSET_FLOAT,price_offset);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR,order_oper_way);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64,external_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class tdsecuL_4_17_Request : BaseRequest, IRequest<tdsecuL_4_17_Response>
    {
        public tdsecuL_4_17_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.4.17";
            }
        }

        public ulong pend_order_id { get; set; }
        public String remark_info { get; set; }
        public String pend_order_status { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pend_order_id", 'L', pend_order_id);
            packer.AddField("remark_info", 'S', remark_info);
            packer.AddField("pend_order_status", 'S', pend_order_status);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_PEND_ORDER_ID_INT64,pend_order_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PEND_ORDER_STATUS_STR,pend_order_status);
            return fastMsg;
        }
   }

    public class tdsecuL_4_21_Request : BaseRequest, IRequest<tdsecuL_4_21_Response>
    {
        public tdsecuL_4_21_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.4.21";
            }
        }

        public int init_date { get; set; }
        public int pass_no { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("init_date", 'I', init_date);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class tdsecuL_4_22_Request : BaseRequest, IRequest<tdsecuL_4_22_Response>
    {
        public tdsecuL_4_22_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.4.22";
            }
        }

        public int init_date { get; set; }
        public int pass_no { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("init_date", 'I', init_date);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class tdsecuL_4_23_Request : BaseRequest, IRequest<tdsecuL_4_23_Response>
    {
        public tdsecuL_4_23_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.4.23";
            }
        }

        public int order_date { get; set; }
        public ulong order_id { get; set; }
        public String out_acco { get; set; }
        public String order_status { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("order_date", 'I', order_date);
            packer.AddField("order_id", 'L', order_id);
            packer.AddField("out_acco", 'S', out_acco);
            packer.AddField("order_status", 'S', order_status);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT,order_date);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64,order_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR,out_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR,order_status);
            return fastMsg;
        }
   }

    public class tdsecuL_4_31_Request : BaseRequest, IRequest<tdsecuL_4_31_Response>
    {
        public tdsecuL_4_31_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.4.31";
            }
        }

        public int order_date { get; set; }
        public ulong order_id { get; set; }
        public double wtdraw_qty { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("order_date", 'I', order_date);
            packer.AddField("order_id", 'L', order_id);
            packer.AddField("wtdraw_qty", 'D', wtdraw_qty);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT,order_date);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64,order_id);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_QTY_FLOAT,wtdraw_qty);
            return fastMsg;
        }
   }

    public class tdsecuL_4_32_Request : BaseRequest, IRequest<tdsecuL_4_32_Response>
    {
        public tdsecuL_4_32_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.4.32";
            }
        }

        public int pass_no { get; set; }
        public int co_no { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public int report_date { get; set; }
        public int report_time { get; set; }
        public String report_no { get; set; }
        public int order_dir { get; set; }
        public double order_price { get; set; }
        public double order_qty { get; set; }
        public int price_type { get; set; }
        public ulong row_id { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("report_date", 'I', report_date);
            packer.AddField("report_time", 'I', report_time);
            packer.AddField("report_no", 'S', report_no);
            packer.AddField("order_dir", 'I', order_dir);
            packer.AddField("order_price", 'D', order_price);
            packer.AddField("order_qty", 'D', order_qty);
            packer.AddField("price_type", 'I', price_type);
            packer.AddField("row_id", 'L', row_id);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT,report_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_TIME_INT,report_time);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR,report_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT,order_dir);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT,order_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT,order_qty);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_INT,price_type);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            return fastMsg;
        }
   }

    public class tdsecuL_4_33_Request : BaseRequest, IRequest<tdsecuL_4_33_Response>
    {
        public tdsecuL_4_33_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.4.33";
            }
        }

        public int co_no { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public int pass_no { get; set; }
        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public int report_date { get; set; }
        public int report_time { get; set; }
        public String report_no { get; set; }
        public int order_dir { get; set; }
        public double order_price { get; set; }
        public double order_qty { get; set; }
        public int price_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("report_date", 'I', report_date);
            packer.AddField("report_time", 'I', report_time);
            packer.AddField("report_no", 'S', report_no);
            packer.AddField("order_dir", 'I', order_dir);
            packer.AddField("order_price", 'D', order_price);
            packer.AddField("order_qty", 'D', order_qty);
            packer.AddField("price_type", 'I', price_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT,report_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_TIME_INT,report_time);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR,report_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT,order_dir);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT,order_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT,order_qty);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_INT,price_type);
            return fastMsg;
        }
   }

    public class tdsecuL_4_41_Request : BaseRequest, IRequest<tdsecuL_4_41_Response>
    {
        public tdsecuL_4_41_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.4.41";
            }
        }

        public ulong basket_id { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public int order_batch_no { get; set; }
        public int order_dir { get; set; }
        public int basket_trade_type { get; set; }
        public double basket_trade_amt { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("basket_id", 'L', basket_id);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("order_batch_no", 'I', order_batch_no);
            packer.AddField("order_dir", 'I', order_dir);
            packer.AddField("basket_trade_type", 'I', basket_trade_type);
            packer.AddField("basket_trade_amt", 'D', basket_trade_amt);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_ID_INT64,basket_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT,order_batch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT,order_dir);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_TRADE_TYPE_INT,basket_trade_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_TRADE_AMT_FLOAT,basket_trade_amt);
            return fastMsg;
        }
   }

    public class tdsecuL_4_42_Request : BaseRequest, IRequest<tdsecuL_4_42_Response>
    {
        public tdsecuL_4_42_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.4.42";
            }
        }

        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public int pre_order_dir { get; set; }
        public int pre_order_type { get; set; }
        public double pre_order_price { get; set; }
        public int trig_type { get; set; }
        public double trig_price { get; set; }
        public int trig_date { get; set; }
        public int trig_time { get; set; }
        public double pre_order_qty { get; set; }
        public int pre_price_type { get; set; }
        public double price_offset { get; set; }
        public int pre_begin_date { get; set; }
        public int pre_end_date { get; set; }
        public int pre_begin_time { get; set; }
        public int pre_end_time { get; set; }
        public int is_trace { get; set; }
        public double price_up { get; set; }
        public String order_no_str { get; set; }
        public int keep_trace { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("pre_order_dir", 'I', pre_order_dir);
            packer.AddField("pre_order_type", 'I', pre_order_type);
            packer.AddField("pre_order_price", 'D', pre_order_price);
            packer.AddField("trig_type", 'I', trig_type);
            packer.AddField("trig_price", 'D', trig_price);
            packer.AddField("trig_date", 'I', trig_date);
            packer.AddField("trig_time", 'I', trig_time);
            packer.AddField("pre_order_qty", 'D', pre_order_qty);
            packer.AddField("pre_price_type", 'I', pre_price_type);
            packer.AddField("price_offset", 'D', price_offset);
            packer.AddField("pre_begin_date", 'I', pre_begin_date);
            packer.AddField("pre_end_date", 'I', pre_end_date);
            packer.AddField("pre_begin_time", 'I', pre_begin_time);
            packer.AddField("pre_end_time", 'I', pre_end_time);
            packer.AddField("is_trace", 'I', is_trace);
            packer.AddField("price_up", 'D', price_up);
            packer.AddField("order_no_str", 'S', order_no_str);
            packer.AddField("keep_trace", 'I', keep_trace);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ORDER_DIR_INT,pre_order_dir);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ORDER_TYPE_INT,pre_order_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ORDER_PRICE_FLOAT,pre_order_price);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_TYPE_INT,trig_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_PRICE_FLOAT,trig_price);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_DATE_INT,trig_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_TIME_INT,trig_time);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ORDER_QTY_FLOAT,pre_order_qty);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRE_PRICE_TYPE_INT,pre_price_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_OFFSET_FLOAT,price_offset);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRE_BEGIN_DATE_INT,pre_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRE_END_DATE_INT,pre_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRE_BEGIN_TIME_INT,pre_begin_time);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRE_END_TIME_INT,pre_end_time);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_TRACE_INT,is_trace);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_UP_FLOAT,price_up);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_NO_STR_STR,order_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_KEEP_TRACE_INT,keep_trace);
            return fastMsg;
        }
   }

    public class tdsecuL_4_43_Request : BaseRequest, IRequest<tdsecuL_4_43_Response>
    {
        public tdsecuL_4_43_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.4.43";
            }
        }

        public ulong pre_order_id { get; set; }
        public ulong order_id { get; set; }
        public int order_date { get; set; }
        public int order_time { get; set; }
        public String pre_order_status { get; set; }
        public String order_no_str { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pre_order_id", 'L', pre_order_id);
            packer.AddField("order_id", 'L', order_id);
            packer.AddField("order_date", 'I', order_date);
            packer.AddField("order_time", 'I', order_time);
            packer.AddField("pre_order_status", 'S', pre_order_status);
            packer.AddField("order_no_str", 'S', order_no_str);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ORDER_ID_INT64,pre_order_id);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64,order_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT,order_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT,order_time);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ORDER_STATUS_STR,pre_order_status);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_NO_STR_STR,order_no_str);
            return fastMsg;
        }
   }

    public class tdsecuL_4_44_Request : BaseRequest, IRequest<tdsecuL_4_44_Response>
    {
        public tdsecuL_4_44_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.4.44";
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
            return fastMsg;
        }
   }

    public class tdsecuL_4_45_Request : BaseRequest, IRequest<tdsecuL_4_45_Response>
    {
        public tdsecuL_4_45_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.4.45";
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

    public class tdsecuL_4_46_Request : BaseRequest, IRequest<tdsecuL_4_46_Response>
    {
        public tdsecuL_4_46_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.4.46";
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

    public class tdsecuL_4_47_Request : BaseRequest, IRequest<tdsecuL_4_47_Response>
    {
        public tdsecuL_4_47_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.4.47";
            }
        }

        public ulong pre_order_id { get; set; }
        public int pre_order_type { get; set; }
        public int is_trace { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pre_order_id", 'L', pre_order_id);
            packer.AddField("pre_order_type", 'I', pre_order_type);
            packer.AddField("is_trace", 'I', is_trace);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ORDER_ID_INT64,pre_order_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ORDER_TYPE_INT,pre_order_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_TRACE_INT,is_trace);
            return fastMsg;
        }
   }

    public class tdsecuL_4_101_Request : BaseRequest, IRequest<tdsecuL_4_101_Response>
    {
        public tdsecuL_4_101_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.4.101";
            }
        }

        public int busi_opor_no { get; set; }
        public String order_oper_way { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int pass_no { get; set; }
        public String exch_no_str { get; set; }
        public int stock_code_no { get; set; }
        public String stock_type_str { get; set; }
        public ulong comm_id { get; set; }
        public int comm_batch_no { get; set; }
        public int comm_opor { get; set; }
        public ulong external_no { get; set; }
        public int order_batch_no { get; set; }
        public ulong order_id { get; set; }
        public String order_dir_str { get; set; }
        public String order_status_str { get; set; }
        public String price_type_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public int sort_type { get; set; }
        public String combo_code { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("busi_opor_no", 'I', busi_opor_no);
            packer.AddField("order_oper_way", 'S', order_oper_way);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("stock_type_str", 'S', stock_type_str);
            packer.AddField("comm_id", 'L', comm_id);
            packer.AddField("comm_batch_no", 'I', comm_batch_no);
            packer.AddField("comm_opor", 'I', comm_opor);
            packer.AddField("external_no", 'L', external_no);
            packer.AddField("order_batch_no", 'I', order_batch_no);
            packer.AddField("order_id", 'L', order_id);
            packer.AddField("order_dir_str", 'S', order_dir_str);
            packer.AddField("order_status_str", 'S', order_status_str);
            packer.AddField("price_type_str", 'S', price_type_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
            packer.AddField("sort_type", 'I', sort_type);
            packer.AddField("combo_code", 'S', combo_code);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT,busi_opor_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR,order_oper_way);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_STR_STR,stock_type_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64,comm_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT,comm_batch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPOR_INT,comm_opor);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64,external_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT,order_batch_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64,order_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR,order_dir_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR_STR,order_status_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_STR_STR,price_type_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SORT_TYPE_INT,sort_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_CODE_STR,combo_code);
            return fastMsg;
        }
   }

    public class tdsecuL_4_102_Request : BaseRequest, IRequest<tdsecuL_4_102_Response>
    {
        public tdsecuL_4_102_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.4.102";
            }
        }

        public int begin_date { get; set; }
        public int end_date { get; set; }
        public int busi_opor_no { get; set; }
        public String order_oper_way { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int pass_no { get; set; }
        public String exch_no_str { get; set; }
        public int stock_code_no { get; set; }
        public String stock_type_str { get; set; }
        public ulong comm_id { get; set; }
        public int comm_batch_no { get; set; }
        public int comm_opor { get; set; }
        public ulong external_no { get; set; }
        public int order_batch_no { get; set; }
        public ulong order_id { get; set; }
        public String order_dir_str { get; set; }
        public String order_status_str { get; set; }
        public String price_type_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public String combo_code { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("busi_opor_no", 'I', busi_opor_no);
            packer.AddField("order_oper_way", 'S', order_oper_way);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("stock_type_str", 'S', stock_type_str);
            packer.AddField("comm_id", 'L', comm_id);
            packer.AddField("comm_batch_no", 'I', comm_batch_no);
            packer.AddField("comm_opor", 'I', comm_opor);
            packer.AddField("external_no", 'L', external_no);
            packer.AddField("order_batch_no", 'I', order_batch_no);
            packer.AddField("order_id", 'L', order_id);
            packer.AddField("order_dir_str", 'S', order_dir_str);
            packer.AddField("order_status_str", 'S', order_status_str);
            packer.AddField("price_type_str", 'S', price_type_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
            packer.AddField("combo_code", 'S', combo_code);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT,end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT,busi_opor_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR,order_oper_way);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_STR_STR,stock_type_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64,comm_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT,comm_batch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPOR_INT,comm_opor);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64,external_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT,order_batch_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64,order_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR,order_dir_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR_STR,order_status_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_STR_STR,price_type_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_CODE_STR,combo_code);
            return fastMsg;
        }
   }

    public class tdsecuL_4_103_Request : BaseRequest, IRequest<tdsecuL_4_103_Response>
    {
        public tdsecuL_4_103_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.4.103";
            }
        }

        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int busi_opor_no { get; set; }
        public int pass_no { get; set; }
        public String exch_no_str { get; set; }
        public int stock_code_no { get; set; }
        public String stock_type_str { get; set; }
        public ulong external_no { get; set; }
        public int order_batch_no { get; set; }
        public String order_dir_str { get; set; }
        public String order_sum_status_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("busi_opor_no", 'I', busi_opor_no);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("stock_type_str", 'S', stock_type_str);
            packer.AddField("external_no", 'L', external_no);
            packer.AddField("order_batch_no", 'I', order_batch_no);
            packer.AddField("order_dir_str", 'S', order_dir_str);
            packer.AddField("order_sum_status_str", 'S', order_sum_status_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT,busi_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_STR_STR,stock_type_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64,external_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT,order_batch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR,order_dir_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_SUM_STATUS_STR_STR,order_sum_status_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class tdsecuL_4_104_Request : BaseRequest, IRequest<tdsecuL_4_104_Response>
    {
        public tdsecuL_4_104_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.4.104";
            }
        }

        public int co_no { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class tdsecuL_4_105_Request : BaseRequest, IRequest<tdsecuL_4_105_Response>
    {
        public tdsecuL_4_105_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.4.105";
            }
        }

        public int co_no { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class tdsecuL_4_106_Request : BaseRequest, IRequest<tdsecuL_4_106_Response>
    {
        public tdsecuL_4_106_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.4.106";
            }
        }

        public int busi_opor_no { get; set; }
        public String order_oper_way { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public String exch_no_str { get; set; }
        public int stock_code_no { get; set; }
        public String stock_type_str { get; set; }
        public int modi_batch_no { get; set; }
        public ulong order_id { get; set; }
        public String order_dir_str { get; set; }
        public ulong comm_id { get; set; }
        public String modi_order_status { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public int sort_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("busi_opor_no", 'I', busi_opor_no);
            packer.AddField("order_oper_way", 'S', order_oper_way);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("stock_type_str", 'S', stock_type_str);
            packer.AddField("modi_batch_no", 'I', modi_batch_no);
            packer.AddField("order_id", 'L', order_id);
            packer.AddField("order_dir_str", 'S', order_dir_str);
            packer.AddField("comm_id", 'L', comm_id);
            packer.AddField("modi_order_status", 'S', modi_order_status);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
            packer.AddField("sort_type", 'I', sort_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT,busi_opor_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR,order_oper_way);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_STR_STR,stock_type_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MODI_BATCH_NO_INT,modi_batch_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64,order_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR,order_dir_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64,comm_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MODI_ORDER_STATUS_STR,modi_order_status);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SORT_TYPE_INT,sort_type);
            return fastMsg;
        }
   }

    public class tdsecuL_4_107_Request : BaseRequest, IRequest<tdsecuL_4_107_Response>
    {
        public tdsecuL_4_107_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.4.107";
            }
        }

        public int begin_date { get; set; }
        public int end_date { get; set; }
        public int busi_opor_no { get; set; }
        public String order_oper_way { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public String exch_no_str { get; set; }
        public int stock_code_no { get; set; }
        public String stock_type_str { get; set; }
        public int modi_batch_no { get; set; }
        public ulong order_id { get; set; }
        public String order_dir_str { get; set; }
        public ulong comm_id { get; set; }
        public String modi_order_status { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public int sort_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("busi_opor_no", 'I', busi_opor_no);
            packer.AddField("order_oper_way", 'S', order_oper_way);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("stock_type_str", 'S', stock_type_str);
            packer.AddField("modi_batch_no", 'I', modi_batch_no);
            packer.AddField("order_id", 'L', order_id);
            packer.AddField("order_dir_str", 'S', order_dir_str);
            packer.AddField("comm_id", 'L', comm_id);
            packer.AddField("modi_order_status", 'S', modi_order_status);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
            packer.AddField("sort_type", 'I', sort_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT,end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT,busi_opor_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR,order_oper_way);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_STR_STR,stock_type_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MODI_BATCH_NO_INT,modi_batch_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64,order_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR,order_dir_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64,comm_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MODI_ORDER_STATUS_STR,modi_order_status);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SORT_TYPE_INT,sort_type);
            return fastMsg;
        }
   }

    public class tdsecuL_4_108_Request : BaseRequest, IRequest<tdsecuL_4_108_Response>
    {
        public tdsecuL_4_108_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.4.108";
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

    public class tdsecuL_4_109_Request : BaseRequest, IRequest<tdsecuL_4_109_Response>
    {
        public tdsecuL_4_109_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.4.109";
            }
        }

        public String stock_code { get; set; }
        public int exch_no { get; set; }
        public double last_price { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("last_price", 'D', last_price);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT,last_price);
            return fastMsg;
        }
   }

    public class tdsecuL_4_110_Request : BaseRequest, IRequest<tdsecuL_4_110_Response>
    {
        public tdsecuL_4_110_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.4.110";
            }
        }

        public int begin_date { get; set; }
        public int end_date { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int pass_no { get; set; }
        public String exch_no_str { get; set; }
        public int stock_code_no { get; set; }
        public String stock_type_str { get; set; }
        public ulong external_no { get; set; }
        public int order_batch_no { get; set; }
        public String order_dir_str { get; set; }
        public String order_sum_status_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("stock_type_str", 'S', stock_type_str);
            packer.AddField("external_no", 'L', external_no);
            packer.AddField("order_batch_no", 'I', order_batch_no);
            packer.AddField("order_dir_str", 'S', order_dir_str);
            packer.AddField("order_sum_status_str", 'S', order_sum_status_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT,end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_STR_STR,stock_type_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64,external_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT,order_batch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR,order_dir_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_SUM_STATUS_STR_STR,order_sum_status_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class tdsecuL_4_111_Request : BaseRequest, IRequest<tdsecuL_4_111_Response>
    {
        public tdsecuL_4_111_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.4.111";
            }
        }

        public int busi_opor_no { get; set; }
        public String order_oper_way { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int pass_no { get; set; }
        public String exch_no_str { get; set; }
        public int stock_code_no { get; set; }
        public String stock_type_str { get; set; }
        public ulong comm_id { get; set; }
        public int comm_batch_no { get; set; }
        public int order_batch_no { get; set; }
        public String order_dir_str { get; set; }
        public String price_type_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public int sort_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("busi_opor_no", 'I', busi_opor_no);
            packer.AddField("order_oper_way", 'S', order_oper_way);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("stock_type_str", 'S', stock_type_str);
            packer.AddField("comm_id", 'L', comm_id);
            packer.AddField("comm_batch_no", 'I', comm_batch_no);
            packer.AddField("order_batch_no", 'I', order_batch_no);
            packer.AddField("order_dir_str", 'S', order_dir_str);
            packer.AddField("price_type_str", 'S', price_type_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
            packer.AddField("sort_type", 'I', sort_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT,busi_opor_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR,order_oper_way);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_STR_STR,stock_type_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64,comm_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT,comm_batch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT,order_batch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR,order_dir_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_STR_STR,price_type_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SORT_TYPE_INT,sort_type);
            return fastMsg;
        }
   }

    public class tdsecuL_4_112_Request : BaseRequest, IRequest<tdsecuL_4_112_Response>
    {
        public tdsecuL_4_112_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.4.112";
            }
        }

        public int begin_date { get; set; }
        public int end_date { get; set; }
        public String order_oper_way { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int pass_no { get; set; }
        public String exch_no_str { get; set; }
        public int stock_code_no { get; set; }
        public String stock_type_str { get; set; }
        public ulong comm_id { get; set; }
        public int comm_batch_no { get; set; }
        public int order_batch_no { get; set; }
        public String order_dir_str { get; set; }
        public String price_type_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("order_oper_way", 'S', order_oper_way);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("stock_type_str", 'S', stock_type_str);
            packer.AddField("comm_id", 'L', comm_id);
            packer.AddField("comm_batch_no", 'I', comm_batch_no);
            packer.AddField("order_batch_no", 'I', order_batch_no);
            packer.AddField("order_dir_str", 'S', order_dir_str);
            packer.AddField("price_type_str", 'S', price_type_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT,end_date);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR,order_oper_way);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_STR_STR,stock_type_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64,comm_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT,comm_batch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT,order_batch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR,order_dir_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_STR_STR,price_type_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class tdsecuL_4_113_Request : BaseRequest, IRequest<tdsecuL_4_113_Response>
    {
        public tdsecuL_4_113_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.4.113";
            }
        }

        public int busi_opor_no { get; set; }
        public String order_oper_way { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public String order_dir_str { get; set; }
        public String order_status_str { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("busi_opor_no", 'I', busi_opor_no);
            packer.AddField("order_oper_way", 'S', order_oper_way);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("order_dir_str", 'S', order_dir_str);
            packer.AddField("order_status_str", 'S', order_status_str);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT,busi_opor_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR,order_oper_way);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR,order_dir_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR_STR,order_status_str);
            return fastMsg;
        }
   }

    public class tdsecuL_4_114_Request : BaseRequest, IRequest<tdsecuL_4_114_Response>
    {
        public tdsecuL_4_114_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.4.114";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            return fastMsg;
        }
   }

    public class tdsecuL_4_115_Request : BaseRequest, IRequest<tdsecuL_4_115_Response>
    {
        public tdsecuL_4_115_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.4.115";
            }
        }

        public int comm_opor { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public ulong external_no { get; set; }
        public ulong comm_id { get; set; }
        public int order_batch_no { get; set; }
        public int order_dir { get; set; }
        public double order_qty { get; set; }
        public double order_price { get; set; }
        public int price_type { get; set; }
        public String order_oper_way { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("comm_opor", 'I', comm_opor);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("external_no", 'L', external_no);
            packer.AddField("comm_id", 'L', comm_id);
            packer.AddField("order_batch_no", 'I', order_batch_no);
            packer.AddField("order_dir", 'I', order_dir);
            packer.AddField("order_qty", 'D', order_qty);
            packer.AddField("order_price", 'D', order_price);
            packer.AddField("price_type", 'I', price_type);
            packer.AddField("order_oper_way", 'S', order_oper_way);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPOR_INT,comm_opor);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64,external_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64,comm_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT,order_batch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT,order_dir);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT,order_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT,order_price);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_INT,price_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR,order_oper_way);
            return fastMsg;
        }
   }

    public class tdsecuL_4_120_Request : BaseRequest, IRequest<tdsecuL_4_120_Response>
    {
        public tdsecuL_4_120_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.4.120";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public String combo_code { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public int sort_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("combo_code", 'S', combo_code);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
            packer.AddField("sort_type", 'I', sort_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_CODE_STR,combo_code);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SORT_TYPE_INT,sort_type);
            return fastMsg;
        }
   }

    public class tdsecuL_4_121_Request : BaseRequest, IRequest<tdsecuL_4_121_Response>
    {
        public tdsecuL_4_121_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.4.121";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public String combo_code { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public int sort_type { get; set; }
        public int begin_date { get; set; }
        public int end_date { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("combo_code", 'S', combo_code);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
            packer.AddField("sort_type", 'I', sort_type);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_CODE_STR,combo_code);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SORT_TYPE_INT,sort_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT,end_date);
            return fastMsg;
        }
   }

    public class tdsecuL_4_122_Request : BaseRequest, IRequest<tdsecuL_4_122_Response>
    {
        public tdsecuL_4_122_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.4.122";
            }
        }

        public int co_no { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public int pass_no { get; set; }
        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public int report_date { get; set; }
        public int report_time { get; set; }
        public String report_no { get; set; }
        public int order_dir { get; set; }
        public double order_price { get; set; }
        public double order_qty { get; set; }
        public int price_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("report_date", 'I', report_date);
            packer.AddField("report_time", 'I', report_time);
            packer.AddField("report_no", 'S', report_no);
            packer.AddField("order_dir", 'I', order_dir);
            packer.AddField("order_price", 'D', order_price);
            packer.AddField("order_qty", 'D', order_qty);
            packer.AddField("price_type", 'I', price_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT,report_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_TIME_INT,report_time);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR,report_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT,order_dir);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT,order_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT,order_qty);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_INT,price_type);
            return fastMsg;
        }
   }

    public class tdsecuL_4_123_Request : BaseRequest, IRequest<tdsecuL_4_123_Response>
    {
        public tdsecuL_4_123_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.4.123";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            return fastMsg;
        }
   }

    public class tdsecuL_4_124_Request : BaseRequest, IRequest<tdsecuL_4_124_Response>
    {
        public tdsecuL_4_124_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.4.124";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            return fastMsg;
        }
   }

    public class tdsecuL_4_125_Request : BaseRequest, IRequest<tdsecuL_4_125_Response>
    {
        public tdsecuL_4_125_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.4.125";
            }
        }

        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public int exch_group_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            return fastMsg;
        }
   }

    public class tdsecuL_4_126_Request : BaseRequest, IRequest<tdsecuL_4_126_Response>
    {
        public tdsecuL_4_126_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.4.126";
            }
        }

        public int co_no { get; set; }
        public int exch_no { get; set; }
        public int am_trd_begin_time { get; set; }
        public int am_trd_end_time { get; set; }
        public int pm_trd_begin_time { get; set; }
        public int pm_trd_end_time { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("am_trd_begin_time", 'I', am_trd_begin_time);
            packer.AddField("am_trd_end_time", 'I', am_trd_end_time);
            packer.AddField("pm_trd_begin_time", 'I', pm_trd_begin_time);
            packer.AddField("pm_trd_end_time", 'I', pm_trd_end_time);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_AM_TRD_BEGIN_TIME_INT,am_trd_begin_time);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_AM_TRD_END_TIME_INT,am_trd_end_time);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PM_TRD_BEGIN_TIME_INT,pm_trd_begin_time);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PM_TRD_END_TIME_INT,pm_trd_end_time);
            return fastMsg;
        }
   }

    public class tdsecuL_4_127_Request : BaseRequest, IRequest<tdsecuL_4_127_Response>
    {
        public tdsecuL_4_127_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.4.127";
            }
        }

        public ulong row_id { get; set; }
        public int co_no { get; set; }
        public int exch_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("exch_no", 'I', exch_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            return fastMsg;
        }
   }

    public class tdsecuL_4_128_Request : BaseRequest, IRequest<tdsecuL_4_128_Response>
    {
        public tdsecuL_4_128_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.4.128";
            }
        }

        public int co_no { get; set; }
        public int exch_no { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class tdsecuL_4_129_Request : BaseRequest, IRequest<tdsecuL_4_129_Response>
    {
        public tdsecuL_4_129_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.4.129";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public int stock_acco_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("stock_acco_no", 'I', stock_acco_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT,stock_acco_no);
            return fastMsg;
        }
   }

    public class tdsecuL_4_130_Request : BaseRequest, IRequest<tdsecuL_4_130_Response>
    {
        public tdsecuL_4_130_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.4.130";
            }
        }

        public int comm_opor { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public ulong external_no { get; set; }
        public ulong comm_id { get; set; }
        public int order_batch_no { get; set; }
        public int order_dir { get; set; }
        public double order_qty { get; set; }
        public double order_price { get; set; }
        public int price_type { get; set; }
        public String order_oper_way { get; set; }
        public String contra_no { get; set; }
        public double order_amt { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("comm_opor", 'I', comm_opor);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("external_no", 'L', external_no);
            packer.AddField("comm_id", 'L', comm_id);
            packer.AddField("order_batch_no", 'I', order_batch_no);
            packer.AddField("order_dir", 'I', order_dir);
            packer.AddField("order_qty", 'D', order_qty);
            packer.AddField("order_price", 'D', order_price);
            packer.AddField("price_type", 'I', price_type);
            packer.AddField("order_oper_way", 'S', order_oper_way);
            packer.AddField("contra_no", 'S', contra_no);
            packer.AddField("order_amt", 'D', order_amt);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPOR_INT,comm_opor);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64,external_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64,comm_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT,order_batch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT,order_dir);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT,order_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT,order_price);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_INT,price_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR,order_oper_way);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRA_NO_STR,contra_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_AMT_FLOAT,order_amt);
            return fastMsg;
        }
   }

    public class tdsecuL_4_131_Request : BaseRequest, IRequest<tdsecuL_4_131_Response>
    {
        public tdsecuL_4_131_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.4.131";
            }
        }

        public int order_date { get; set; }
        public ulong order_id { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("order_date", 'I', order_date);
            packer.AddField("order_id", 'L', order_id);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT,order_date);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64,order_id);
            return fastMsg;
        }
   }

    public class tdsecuL_4_132_Request : BaseRequest, IRequest<tdsecuL_4_132_Response>
    {
        public tdsecuL_4_132_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.4.132";
            }
        }

        public int target_opor_no { get; set; }
        public int target_co_no { get; set; }
        public int comm_opor { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public ulong external_no { get; set; }
        public ulong comm_id { get; set; }
        public int order_batch_no { get; set; }
        public int order_dir { get; set; }
        public double order_qty { get; set; }
        public double order_price { get; set; }
        public int price_type { get; set; }
        public String order_oper_way { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("target_opor_no", 'I', target_opor_no);
            packer.AddField("target_co_no", 'I', target_co_no);
            packer.AddField("comm_opor", 'I', comm_opor);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("external_no", 'L', external_no);
            packer.AddField("comm_id", 'L', comm_id);
            packer.AddField("order_batch_no", 'I', order_batch_no);
            packer.AddField("order_dir", 'I', order_dir);
            packer.AddField("order_qty", 'D', order_qty);
            packer.AddField("order_price", 'D', order_price);
            packer.AddField("price_type", 'I', price_type);
            packer.AddField("order_oper_way", 'S', order_oper_way);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_OPOR_NO_INT,target_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CO_NO_INT,target_co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPOR_INT,comm_opor);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64,external_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64,comm_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT,order_batch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT,order_dir);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT,order_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT,order_price);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_INT,price_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR,order_oper_way);
            return fastMsg;
        }
   }

    public class tdsecuL_4_133_Request : BaseRequest, IRequest<tdsecuL_4_133_Response>
    {
        public tdsecuL_4_133_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.4.133";
            }
        }

        public int target_opor_no { get; set; }
        public int target_co_no { get; set; }
        public int order_date { get; set; }
        public ulong order_id { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("target_opor_no", 'I', target_opor_no);
            packer.AddField("target_co_no", 'I', target_co_no);
            packer.AddField("order_date", 'I', order_date);
            packer.AddField("order_id", 'L', order_id);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_OPOR_NO_INT,target_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CO_NO_INT,target_co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT,order_date);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64,order_id);
            return fastMsg;
        }
   }

    public class tdsecuL_4_134_Request : BaseRequest, IRequest<tdsecuL_4_134_Response>
    {
        public tdsecuL_4_134_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.4.134";
            }
        }

        public int target_opor_no { get; set; }
        public int target_co_no { get; set; }
        public ulong external_no { get; set; }
        public int order_date { get; set; }
        public ulong order_id { get; set; }
        public int modi_batch_no { get; set; }
        public double modi_order_price { get; set; }
        public double modi_order_qty { get; set; }
        public int modi_price_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("target_opor_no", 'I', target_opor_no);
            packer.AddField("target_co_no", 'I', target_co_no);
            packer.AddField("external_no", 'L', external_no);
            packer.AddField("order_date", 'I', order_date);
            packer.AddField("order_id", 'L', order_id);
            packer.AddField("modi_batch_no", 'I', modi_batch_no);
            packer.AddField("modi_order_price", 'D', modi_order_price);
            packer.AddField("modi_order_qty", 'D', modi_order_qty);
            packer.AddField("modi_price_type", 'I', modi_price_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_OPOR_NO_INT,target_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CO_NO_INT,target_co_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64,external_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT,order_date);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64,order_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MODI_BATCH_NO_INT,modi_batch_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MODI_ORDER_PRICE_FLOAT,modi_order_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MODI_ORDER_QTY_FLOAT,modi_order_qty);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MODI_PRICE_TYPE_INT,modi_price_type);
            return fastMsg;
        }
   }

    public class tdsecuL_4_135_Request : BaseRequest, IRequest<tdsecuL_4_135_Response>
    {
        public tdsecuL_4_135_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.4.135";
            }
        }

        public int target_opor_no { get; set; }
        public int target_co_no { get; set; }
        public ulong pre_order_id { get; set; }
        public ulong order_id { get; set; }
        public int order_date { get; set; }
        public int order_time { get; set; }
        public String pre_order_status { get; set; }
        public String order_no_str { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("target_opor_no", 'I', target_opor_no);
            packer.AddField("target_co_no", 'I', target_co_no);
            packer.AddField("pre_order_id", 'L', pre_order_id);
            packer.AddField("order_id", 'L', order_id);
            packer.AddField("order_date", 'I', order_date);
            packer.AddField("order_time", 'I', order_time);
            packer.AddField("pre_order_status", 'S', pre_order_status);
            packer.AddField("order_no_str", 'S', order_no_str);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_OPOR_NO_INT,target_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CO_NO_INT,target_co_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ORDER_ID_INT64,pre_order_id);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64,order_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT,order_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT,order_time);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ORDER_STATUS_STR,pre_order_status);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_NO_STR_STR,order_no_str);
            return fastMsg;
        }
   }

    public class tdsecuL_4_136_Request : BaseRequest, IRequest<tdsecuL_4_136_Response>
    {
        public tdsecuL_4_136_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.4.136";
            }
        }

        public int co_no { get; set; }
        public int exch_no { get; set; }
        public int am_trd_begin_time { get; set; }
        public int am_trd_end_time { get; set; }
        public int pm_trd_begin_time { get; set; }
        public int pm_trd_end_time { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("am_trd_begin_time", 'I', am_trd_begin_time);
            packer.AddField("am_trd_end_time", 'I', am_trd_end_time);
            packer.AddField("pm_trd_begin_time", 'I', pm_trd_begin_time);
            packer.AddField("pm_trd_end_time", 'I', pm_trd_end_time);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_AM_TRD_BEGIN_TIME_INT,am_trd_begin_time);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_AM_TRD_END_TIME_INT,am_trd_end_time);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PM_TRD_BEGIN_TIME_INT,pm_trd_begin_time);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PM_TRD_END_TIME_INT,pm_trd_end_time);
            return fastMsg;
        }
   }

    public class tdsecuL_4_137_Request : BaseRequest, IRequest<tdsecuL_4_137_Response>
    {
        public tdsecuL_4_137_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.4.137";
            }
        }

        public int target_opor_no { get; set; }
        public int target_co_no { get; set; }
        public ulong pre_order_id { get; set; }
        public int pre_order_type { get; set; }
        public int is_trace { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("target_opor_no", 'I', target_opor_no);
            packer.AddField("target_co_no", 'I', target_co_no);
            packer.AddField("pre_order_id", 'L', pre_order_id);
            packer.AddField("pre_order_type", 'I', pre_order_type);
            packer.AddField("is_trace", 'I', is_trace);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_OPOR_NO_INT,target_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CO_NO_INT,target_co_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ORDER_ID_INT64,pre_order_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ORDER_TYPE_INT,pre_order_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_TRACE_INT,is_trace);
            return fastMsg;
        }
   }

    public class tdsecuL_4_138_Request : BaseRequest, IRequest<tdsecuL_4_138_Response>
    {
        public tdsecuL_4_138_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.4.138";
            }
        }

        public int comm_opor { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public ulong external_no { get; set; }
        public ulong comm_id { get; set; }
        public String combo_code { get; set; }
        public int order_batch_no { get; set; }
        public int order_dir { get; set; }
        public double order_qty { get; set; }
        public double order_price { get; set; }
        public int price_type { get; set; }
        public String order_oper_way { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("comm_opor", 'I', comm_opor);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("external_no", 'L', external_no);
            packer.AddField("comm_id", 'L', comm_id);
            packer.AddField("combo_code", 'S', combo_code);
            packer.AddField("order_batch_no", 'I', order_batch_no);
            packer.AddField("order_dir", 'I', order_dir);
            packer.AddField("order_qty", 'D', order_qty);
            packer.AddField("order_price", 'D', order_price);
            packer.AddField("price_type", 'I', price_type);
            packer.AddField("order_oper_way", 'S', order_oper_way);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPOR_INT,comm_opor);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64,external_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64,comm_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_CODE_STR,combo_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT,order_batch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT,order_dir);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT,order_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT,order_price);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_INT,price_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR,order_oper_way);
            return fastMsg;
        }
   }

    public class tdsecuL_4_139_Request : BaseRequest, IRequest<tdsecuL_4_139_Response>
    {
        public tdsecuL_4_139_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.4.139";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public int exch_group_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            return fastMsg;
        }
   }

}
