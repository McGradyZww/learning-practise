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
    public class tdsecuL_1_1_Request : BaseRequest, IRequest<tdsecuL_1_1_Response>
    {
        public tdsecuL_1_1_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.1.1";
            }
        }

        public int pass_no { get; set; }
        public String pass_status { get; set; }
        public String offer_name { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("pass_status", 'S', pass_status);
            packer.AddField("offer_name", 'S', offer_name);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PASS_STATUS_STR,pass_status);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OFFER_NAME_STR,offer_name);
            return fastMsg;
        }
   }

    public class tdsecuL_1_11_Request : BaseRequest, IRequest<tdsecuL_1_11_Response>
    {
        public tdsecuL_1_11_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.1.11";
            }
        }

        public int co_no { get; set; }
        public String basket_name { get; set; }
        public int weight_type { get; set; }
        public int is_public { get; set; }
        public int compos_count { get; set; }
        public String basket_status { get; set; }
        public double cash_replace_amt { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("basket_name", 'S', basket_name);
            packer.AddField("weight_type", 'I', weight_type);
            packer.AddField("is_public", 'I', is_public);
            packer.AddField("compos_count", 'I', compos_count);
            packer.AddField("basket_status", 'S', basket_status);
            packer.AddField("cash_replace_amt", 'D', cash_replace_amt);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_NAME_STR,basket_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WEIGHT_TYPE_INT,weight_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_PUBLIC_INT,is_public);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMPOS_COUNT_INT,compos_count);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_STATUS_STR,basket_status);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_REPLACE_AMT_FLOAT,cash_replace_amt);
            return fastMsg;
        }
   }

    public class tdsecuL_1_12_Request : BaseRequest, IRequest<tdsecuL_1_12_Response>
    {
        public tdsecuL_1_12_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.1.12";
            }
        }

        public ulong basket_id { get; set; }
        public String basket_name { get; set; }
        public int weight_type { get; set; }
        public int is_public { get; set; }
        public int compos_count { get; set; }
        public String basket_status { get; set; }
        public double cash_replace_amt { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("basket_id", 'L', basket_id);
            packer.AddField("basket_name", 'S', basket_name);
            packer.AddField("weight_type", 'I', weight_type);
            packer.AddField("is_public", 'I', is_public);
            packer.AddField("compos_count", 'I', compos_count);
            packer.AddField("basket_status", 'S', basket_status);
            packer.AddField("cash_replace_amt", 'D', cash_replace_amt);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_ID_INT64,basket_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_NAME_STR,basket_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WEIGHT_TYPE_INT,weight_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_PUBLIC_INT,is_public);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMPOS_COUNT_INT,compos_count);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_STATUS_STR,basket_status);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_REPLACE_AMT_FLOAT,cash_replace_amt);
            return fastMsg;
        }
   }

    public class tdsecuL_1_13_Request : BaseRequest, IRequest<tdsecuL_1_13_Response>
    {
        public tdsecuL_1_13_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.1.13";
            }
        }

        public ulong basket_id { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("basket_id", 'L', basket_id);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_ID_INT64,basket_id);
            return fastMsg;
        }
   }

    public class tdsecuL_1_14_Request : BaseRequest, IRequest<tdsecuL_1_14_Response>
    {
        public tdsecuL_1_14_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.1.14";
            }
        }

        public int query_opor_no { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("query_opor_no", 'I', query_opor_no);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_OPOR_NO_INT,query_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class tdsecuL_1_21_Request : BaseRequest, IRequest<tdsecuL_1_21_Response>
    {
        public tdsecuL_1_21_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.1.21";
            }
        }

        public ulong basket_id { get; set; }
        public int exch_no { get; set; }
        public int stock_code_no { get; set; }
        public double compos_qty { get; set; }
        public double compos_ratio { get; set; }
        public int repl_stock_code_no { get; set; }
        public double repl_qty { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("basket_id", 'L', basket_id);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("compos_qty", 'D', compos_qty);
            packer.AddField("compos_ratio", 'D', compos_ratio);
            packer.AddField("repl_stock_code_no", 'I', repl_stock_code_no);
            packer.AddField("repl_qty", 'D', repl_qty);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_ID_INT64,basket_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMPOS_QTY_FLOAT,compos_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMPOS_RATIO_FLOAT,compos_ratio);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPL_STOCK_CODE_NO_INT,repl_stock_code_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPL_QTY_FLOAT,repl_qty);
            return fastMsg;
        }
   }

    public class tdsecuL_1_22_Request : BaseRequest, IRequest<tdsecuL_1_22_Response>
    {
        public tdsecuL_1_22_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.1.22";
            }
        }

        public ulong row_id { get; set; }
        public ulong basket_id { get; set; }
        public int exch_no { get; set; }
        public int stock_code_no { get; set; }
        public double compos_qty { get; set; }
        public double compos_ratio { get; set; }
        public int repl_stock_code_no { get; set; }
        public double repl_qty { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("basket_id", 'L', basket_id);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("compos_qty", 'D', compos_qty);
            packer.AddField("compos_ratio", 'D', compos_ratio);
            packer.AddField("repl_stock_code_no", 'I', repl_stock_code_no);
            packer.AddField("repl_qty", 'D', repl_qty);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_ID_INT64,basket_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMPOS_QTY_FLOAT,compos_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMPOS_RATIO_FLOAT,compos_ratio);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPL_STOCK_CODE_NO_INT,repl_stock_code_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPL_QTY_FLOAT,repl_qty);
            return fastMsg;
        }
   }

    public class tdsecuL_1_23_Request : BaseRequest, IRequest<tdsecuL_1_23_Response>
    {
        public tdsecuL_1_23_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.1.23";
            }
        }

        public ulong row_id { get; set; }
        public ulong basket_id { get; set; }
        public int stock_code_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("basket_id", 'L', basket_id);
            packer.AddField("stock_code_no", 'I', stock_code_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_ID_INT64,basket_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            return fastMsg;
        }
   }

    public class tdsecuL_1_24_Request : BaseRequest, IRequest<tdsecuL_1_24_Response>
    {
        public tdsecuL_1_24_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.1.24";
            }
        }

        public ulong basket_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("basket_id", 'L', basket_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_ID_INT64,basket_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class tdsecuL_1_51_Request : BaseRequest, IRequest<tdsecuL_1_51_Response>
    {
        public tdsecuL_1_51_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.1.51";
            }
        }

        public int task_no { get; set; }
        public int exec_count { get; set; }
        public int exec_date { get; set; }
        public int exec_time { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("task_no", 'I', task_no);
            packer.AddField("exec_count", 'I', exec_count);
            packer.AddField("exec_date", 'I', exec_date);
            packer.AddField("exec_time", 'I', exec_time);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TASK_NO_INT,task_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_COUNT_INT,exec_count);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_DATE_INT,exec_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_TIME_INT,exec_time);
            return fastMsg;
        }
   }

    public class tdsecuL_1_54_Request : BaseRequest, IRequest<tdsecuL_1_54_Response>
    {
        public tdsecuL_1_54_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.1.54";
            }
        }

        public int task_no { get; set; }
        public int exec_count { get; set; }
        public int exec_date { get; set; }
        public int exec_time { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("task_no", 'I', task_no);
            packer.AddField("exec_count", 'I', exec_count);
            packer.AddField("exec_date", 'I', exec_date);
            packer.AddField("exec_time", 'I', exec_time);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TASK_NO_INT,task_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_COUNT_INT,exec_count);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_DATE_INT,exec_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_TIME_INT,exec_time);
            return fastMsg;
        }
   }

    public class tdsecuL_1_901_Request : BaseRequest, IRequest<tdsecuL_1_901_Response>
    {
        public tdsecuL_1_901_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.1.901";
            }
        }

        public int co_no { get; set; }
        public int record_no_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("record_no_type", 'I', record_no_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RECORD_NO_TYPE_INT,record_no_type);
            return fastMsg;
        }
   }

    public class tdsecuL_1_31_Request : BaseRequest, IRequest<tdsecuL_1_31_Response>
    {
        public tdsecuL_1_31_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.1.31";
            }
        }

        public int co_no { get; set; }
        public String combo_code { get; set; }
        public String comb_name { get; set; }
        public int is_public { get; set; }
        public int create_failure_validity_date { get; set; }
        public int create_end_validity_date { get; set; }
        public int rebalance_failure_validity_date { get; set; }
        public int rebalance_end_validity_date { get; set; }
        public int repair_failure_validity_date { get; set; }
        public int repair_end_validity_date { get; set; }
        public int broke_validity_date { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("combo_code", 'S', combo_code);
            packer.AddField("comb_name", 'S', comb_name);
            packer.AddField("is_public", 'I', is_public);
            packer.AddField("create_failure_validity_date", 'I', create_failure_validity_date);
            packer.AddField("create_end_validity_date", 'I', create_end_validity_date);
            packer.AddField("rebalance_failure_validity_date", 'I', rebalance_failure_validity_date);
            packer.AddField("rebalance_end_validity_date", 'I', rebalance_end_validity_date);
            packer.AddField("repair_failure_validity_date", 'I', repair_failure_validity_date);
            packer.AddField("repair_end_validity_date", 'I', repair_end_validity_date);
            packer.AddField("broke_validity_date", 'I', broke_validity_date);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_CODE_STR,combo_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMB_NAME_STR,comb_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_PUBLIC_INT,is_public);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_FAILURE_VALIDITY_DATE_INT,create_failure_validity_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_END_VALIDITY_DATE_INT,create_end_validity_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REBALANCE_FAILURE_VALIDITY_DATE_INT,rebalance_failure_validity_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REBALANCE_END_VALIDITY_DATE_INT,rebalance_end_validity_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPAIR_FAILURE_VALIDITY_DATE_INT,repair_failure_validity_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPAIR_END_VALIDITY_DATE_INT,repair_end_validity_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BROKE_VALIDITY_DATE_INT,broke_validity_date);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class tdsecuL_1_32_Request : BaseRequest, IRequest<tdsecuL_1_32_Response>
    {
        public tdsecuL_1_32_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.1.32";
            }
        }

        public ulong combo_id { get; set; }
        public String combo_code { get; set; }
        public String comb_name { get; set; }
        public int is_public { get; set; }
        public int create_failure_validity_date { get; set; }
        public int create_end_validity_date { get; set; }
        public int rebalance_failure_validity_date { get; set; }
        public int rebalance_end_validity_date { get; set; }
        public int repair_failure_validity_date { get; set; }
        public int repair_end_validity_date { get; set; }
        public int broke_validity_date { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("combo_id", 'L', combo_id);
            packer.AddField("combo_code", 'S', combo_code);
            packer.AddField("comb_name", 'S', comb_name);
            packer.AddField("is_public", 'I', is_public);
            packer.AddField("create_failure_validity_date", 'I', create_failure_validity_date);
            packer.AddField("create_end_validity_date", 'I', create_end_validity_date);
            packer.AddField("rebalance_failure_validity_date", 'I', rebalance_failure_validity_date);
            packer.AddField("rebalance_end_validity_date", 'I', rebalance_end_validity_date);
            packer.AddField("repair_failure_validity_date", 'I', repair_failure_validity_date);
            packer.AddField("repair_end_validity_date", 'I', repair_end_validity_date);
            packer.AddField("broke_validity_date", 'I', broke_validity_date);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_ID_INT64,combo_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_CODE_STR,combo_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMB_NAME_STR,comb_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_PUBLIC_INT,is_public);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_FAILURE_VALIDITY_DATE_INT,create_failure_validity_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_END_VALIDITY_DATE_INT,create_end_validity_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REBALANCE_FAILURE_VALIDITY_DATE_INT,rebalance_failure_validity_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REBALANCE_END_VALIDITY_DATE_INT,rebalance_end_validity_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPAIR_FAILURE_VALIDITY_DATE_INT,repair_failure_validity_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPAIR_END_VALIDITY_DATE_INT,repair_end_validity_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BROKE_VALIDITY_DATE_INT,broke_validity_date);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class tdsecuL_1_33_Request : BaseRequest, IRequest<tdsecuL_1_33_Response>
    {
        public tdsecuL_1_33_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.1.33";
            }
        }

        public ulong combo_id { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("combo_id", 'L', combo_id);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_ID_INT64,combo_id);
            return fastMsg;
        }
   }

    public class tdsecuL_1_34_Request : BaseRequest, IRequest<tdsecuL_1_34_Response>
    {
        public tdsecuL_1_34_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.1.34";
            }
        }

        public int co_no { get; set; }
        public int query_opor_no { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("query_opor_no", 'I', query_opor_no);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_OPOR_NO_INT,query_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class tdsecuL_1_35_Request : BaseRequest, IRequest<tdsecuL_1_35_Response>
    {
        public tdsecuL_1_35_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.1.35";
            }
        }

        public int co_no { get; set; }
        public String combo_code { get; set; }
        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public double combo_ratio { get; set; }
        public double combo_qty { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("combo_code", 'S', combo_code);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("combo_ratio", 'D', combo_ratio);
            packer.AddField("combo_qty", 'D', combo_qty);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_CODE_STR,combo_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_RATIO_FLOAT,combo_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_QTY_FLOAT,combo_qty);
            return fastMsg;
        }
   }

    public class tdsecuL_1_36_Request : BaseRequest, IRequest<tdsecuL_1_36_Response>
    {
        public tdsecuL_1_36_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.1.36";
            }
        }

        public ulong combo_stock_id { get; set; }
        public String combo_code { get; set; }
        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public double combo_ratio { get; set; }
        public double combo_qty { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("combo_stock_id", 'L', combo_stock_id);
            packer.AddField("combo_code", 'S', combo_code);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("combo_ratio", 'D', combo_ratio);
            packer.AddField("combo_qty", 'D', combo_qty);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_STOCK_ID_INT64,combo_stock_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_CODE_STR,combo_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_RATIO_FLOAT,combo_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_QTY_FLOAT,combo_qty);
            return fastMsg;
        }
   }

    public class tdsecuL_1_37_Request : BaseRequest, IRequest<tdsecuL_1_37_Response>
    {
        public tdsecuL_1_37_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.1.37";
            }
        }

        public String combo_code { get; set; }
        public int stock_code_no { get; set; }
        public ulong combo_stock_id { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("combo_code", 'S', combo_code);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("combo_stock_id", 'L', combo_stock_id);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_CODE_STR,combo_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_STOCK_ID_INT64,combo_stock_id);
            return fastMsg;
        }
   }

    public class tdsecuL_1_38_Request : BaseRequest, IRequest<tdsecuL_1_38_Response>
    {
        public tdsecuL_1_38_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.1.38";
            }
        }

        public int co_no { get; set; }
        public int query_opor_no { get; set; }
        public String combo_code { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("query_opor_no", 'I', query_opor_no);
            packer.AddField("combo_code", 'S', combo_code);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_OPOR_NO_INT,query_opor_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_CODE_STR,combo_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class tdsecuL_1_39_Request : BaseRequest, IRequest<tdsecuL_1_39_Response>
    {
        public tdsecuL_1_39_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.1.39";
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

    public class tdsecuL_1_56_Request : BaseRequest, IRequest<tdsecuL_1_56_Response>
    {
        public tdsecuL_1_56_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.1.56";
            }
        }

        public int task_no { get; set; }
        public int exec_count { get; set; }
        public int exec_date { get; set; }
        public int exec_time { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("task_no", 'I', task_no);
            packer.AddField("exec_count", 'I', exec_count);
            packer.AddField("exec_date", 'I', exec_date);
            packer.AddField("exec_time", 'I', exec_time);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TASK_NO_INT,task_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_COUNT_INT,exec_count);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_DATE_INT,exec_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_TIME_INT,exec_time);
            return fastMsg;
        }
   }

    public class tdsecuL_1_40_Request : BaseRequest, IRequest<tdsecuL_1_40_Response>
    {
        public tdsecuL_1_40_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.1.40";
            }
        }

        public int co_no { get; set; }
        public String rule_name { get; set; }
        public int prior_type { get; set; }
        public String exch_group_no_str { get; set; }
        public String exch_no_str { get; set; }
        public String stock_type_str { get; set; }
        public String stock_code_str { get; set; }
        public String opor_no_str { get; set; }
        public int distribute_last_trader { get; set; }
        public int distribute_by_jobs { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("rule_name", 'S', rule_name);
            packer.AddField("prior_type", 'I', prior_type);
            packer.AddField("exch_group_no_str", 'S', exch_group_no_str);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_type_str", 'S', stock_type_str);
            packer.AddField("stock_code_str", 'S', stock_code_str);
            packer.AddField("opor_no_str", 'S', opor_no_str);
            packer.AddField("distribute_last_trader", 'I', distribute_last_trader);
            packer.AddField("distribute_by_jobs", 'I', distribute_by_jobs);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RULE_NAME_STR,rule_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRIOR_TYPE_INT,prior_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_STR_STR,exch_group_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_STR_STR,stock_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR_STR,stock_code_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_STR_STR,opor_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DISTRIBUTE_LAST_TRADER_INT,distribute_last_trader);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DISTRIBUTE_BY_JOBS_INT,distribute_by_jobs);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class tdsecuL_1_41_Request : BaseRequest, IRequest<tdsecuL_1_41_Response>
    {
        public tdsecuL_1_41_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.1.41";
            }
        }

        public ulong row_id { get; set; }
        public int co_no { get; set; }
        public String rule_name { get; set; }
        public int prior_type { get; set; }
        public String exch_group_no_str { get; set; }
        public String exch_no_str { get; set; }
        public String stock_type_str { get; set; }
        public String stock_code_str { get; set; }
        public String opor_no_str { get; set; }
        public int distribute_last_trader { get; set; }
        public int distribute_by_jobs { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("rule_name", 'S', rule_name);
            packer.AddField("prior_type", 'I', prior_type);
            packer.AddField("exch_group_no_str", 'S', exch_group_no_str);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_type_str", 'S', stock_type_str);
            packer.AddField("stock_code_str", 'S', stock_code_str);
            packer.AddField("opor_no_str", 'S', opor_no_str);
            packer.AddField("distribute_last_trader", 'I', distribute_last_trader);
            packer.AddField("distribute_by_jobs", 'I', distribute_by_jobs);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RULE_NAME_STR,rule_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRIOR_TYPE_INT,prior_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_STR_STR,exch_group_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_STR_STR,stock_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR_STR,stock_code_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_STR_STR,opor_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DISTRIBUTE_LAST_TRADER_INT,distribute_last_trader);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DISTRIBUTE_BY_JOBS_INT,distribute_by_jobs);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class tdsecuL_1_42_Request : BaseRequest, IRequest<tdsecuL_1_42_Response>
    {
        public tdsecuL_1_42_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.1.42";
            }
        }

        public ulong row_id { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("row_id", 'L', row_id);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            return fastMsg;
        }
   }

    public class tdsecuL_1_43_Request : BaseRequest, IRequest<tdsecuL_1_43_Response>
    {
        public tdsecuL_1_43_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.1.43";
            }
        }

        public int co_no { get; set; }
        public int query_opor_no { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("query_opor_no", 'I', query_opor_no);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_OPOR_NO_INT,query_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class tdsecuL_1_60_Request : BaseRequest, IRequest<tdsecuL_1_60_Response>
    {
        public tdsecuL_1_60_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.1.60";
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

    public class tdsecuL_1_61_Request : BaseRequest, IRequest<tdsecuL_1_61_Response>
    {
        public tdsecuL_1_61_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.1.61";
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

    public class tdsecuL_1_62_Request : BaseRequest, IRequest<tdsecuL_1_62_Response>
    {
        public tdsecuL_1_62_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.1.62";
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

    public class tdsecuL_1_63_Request : BaseRequest, IRequest<tdsecuL_1_63_Response>
    {
        public tdsecuL_1_63_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.1.63";
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

    public class tdsecuL_1_64_Request : BaseRequest, IRequest<tdsecuL_1_64_Response>
    {
        public tdsecuL_1_64_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.1.64";
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

    public class tdsecuL_1_65_Request : BaseRequest, IRequest<tdsecuL_1_65_Response>
    {
        public tdsecuL_1_65_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.1.65";
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

    public class tdsecuL_1_66_Request : BaseRequest, IRequest<tdsecuL_1_66_Response>
    {
        public tdsecuL_1_66_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.1.66";
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

    public class tdsecuL_1_67_Request : BaseRequest, IRequest<tdsecuL_1_67_Response>
    {
        public tdsecuL_1_67_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.1.67";
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
