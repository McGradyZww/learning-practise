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
    public class pubL_29_1_Request : BaseRequest, IRequest<pubL_29_1_Response>
    {
        public pubL_29_1_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.29.1";
            }
        }

        public int pass_no { get; set; }
        public int co_no { get; set; }
        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public double discount_rate { get; set; }
        public int offset_status { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("discount_rate", 'D', discount_rate);
            packer.AddField("offset_status", 'I', offset_status);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DISCOUNT_RATE_FLOAT,discount_rate);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OFFSET_STATUS_INT,offset_status);
            return fastMsg;
        }
   }

    public class pubL_29_2_Request : BaseRequest, IRequest<pubL_29_2_Response>
    {
        public pubL_29_2_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.29.2";
            }
        }

        public ulong row_id { get; set; }
        public int pass_no { get; set; }
        public int co_no { get; set; }
        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public double discount_rate { get; set; }
        public int offset_status { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("discount_rate", 'D', discount_rate);
            packer.AddField("offset_status", 'I', offset_status);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DISCOUNT_RATE_FLOAT,discount_rate);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OFFSET_STATUS_INT,offset_status);
            return fastMsg;
        }
   }

    public class pubL_29_3_Request : BaseRequest, IRequest<pubL_29_3_Response>
    {
        public pubL_29_3_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.29.3";
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

    public class pubL_29_4_Request : BaseRequest, IRequest<pubL_29_4_Response>
    {
        public pubL_29_4_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.29.4";
            }
        }

        public int pass_no { get; set; }
        public int co_no { get; set; }
        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public ulong row_id { get; set; }
        public int sort_type { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("sort_type", 'I', sort_type);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SORT_TYPE_INT,sort_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_29_5_Request : BaseRequest, IRequest<pubL_29_5_Response>
    {
        public pubL_29_5_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.29.5";
            }
        }

        public int pass_no { get; set; }
        public int co_no { get; set; }
        public double fina_year_intrst_rate { get; set; }
        public double secu_loan_year_intrst_rate { get; set; }
        public double fina_pen_intrst_rate { get; set; }
        public double secu_loan_pen_intrst_rate { get; set; }
        public int intrst_sett_day { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("fina_year_intrst_rate", 'D', fina_year_intrst_rate);
            packer.AddField("secu_loan_year_intrst_rate", 'D', secu_loan_year_intrst_rate);
            packer.AddField("fina_pen_intrst_rate", 'D', fina_pen_intrst_rate);
            packer.AddField("secu_loan_pen_intrst_rate", 'D', secu_loan_pen_intrst_rate);
            packer.AddField("intrst_sett_day", 'I', intrst_sett_day);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_YEAR_INTRST_RATE_FLOAT,fina_year_intrst_rate);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SECU_LOAN_YEAR_INTRST_RATE_FLOAT,secu_loan_year_intrst_rate);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_PEN_INTRST_RATE_FLOAT,fina_pen_intrst_rate);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SECU_LOAN_PEN_INTRST_RATE_FLOAT,secu_loan_pen_intrst_rate);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_SETT_DAY_INT,intrst_sett_day);
            return fastMsg;
        }
   }

    public class pubL_29_6_Request : BaseRequest, IRequest<pubL_29_6_Response>
    {
        public pubL_29_6_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.29.6";
            }
        }

        public int pass_no { get; set; }
        public int co_no { get; set; }
        public double fina_year_intrst_rate { get; set; }
        public double secu_loan_year_intrst_rate { get; set; }
        public double fina_pen_intrst_rate { get; set; }
        public double secu_loan_pen_intrst_rate { get; set; }
        public int intrst_sett_day { get; set; }
        public ulong row_id { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("fina_year_intrst_rate", 'D', fina_year_intrst_rate);
            packer.AddField("secu_loan_year_intrst_rate", 'D', secu_loan_year_intrst_rate);
            packer.AddField("fina_pen_intrst_rate", 'D', fina_pen_intrst_rate);
            packer.AddField("secu_loan_pen_intrst_rate", 'D', secu_loan_pen_intrst_rate);
            packer.AddField("intrst_sett_day", 'I', intrst_sett_day);
            packer.AddField("row_id", 'L', row_id);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_YEAR_INTRST_RATE_FLOAT,fina_year_intrst_rate);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SECU_LOAN_YEAR_INTRST_RATE_FLOAT,secu_loan_year_intrst_rate);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_PEN_INTRST_RATE_FLOAT,fina_pen_intrst_rate);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SECU_LOAN_PEN_INTRST_RATE_FLOAT,secu_loan_pen_intrst_rate);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_SETT_DAY_INT,intrst_sett_day);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            return fastMsg;
        }
   }

    public class pubL_29_7_Request : BaseRequest, IRequest<pubL_29_7_Response>
    {
        public pubL_29_7_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.29.7";
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

    public class pubL_29_8_Request : BaseRequest, IRequest<pubL_29_8_Response>
    {
        public pubL_29_8_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.29.8";
            }
        }

        public ulong row_id { get; set; }
        public int pass_no { get; set; }
        public int co_no { get; set; }
        public int sort_type { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("sort_type", 'I', sort_type);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SORT_TYPE_INT,sort_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_29_9_Request : BaseRequest, IRequest<pubL_29_9_Response>
    {
        public pubL_29_9_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.29.9";
            }
        }

        public String stock_code { get; set; }
        public int exch_no { get; set; }
        public String fina_status { get; set; }
        public String secu_loan_status { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("fina_status", 'S', fina_status);
            packer.AddField("secu_loan_status", 'S', secu_loan_status);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FINA_STATUS_STR,fina_status);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_SECU_LOAN_STATUS_STR,secu_loan_status);
            return fastMsg;
        }
   }

    public class pubL_29_10_Request : BaseRequest, IRequest<pubL_29_10_Response>
    {
        public pubL_29_10_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.29.10";
            }
        }

        public String stock_code { get; set; }
        public int exch_no { get; set; }
        public String fina_status { get; set; }
        public String secu_loan_status { get; set; }
        public ulong row_id { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("fina_status", 'S', fina_status);
            packer.AddField("secu_loan_status", 'S', secu_loan_status);
            packer.AddField("row_id", 'L', row_id);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FINA_STATUS_STR,fina_status);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_SECU_LOAN_STATUS_STR,secu_loan_status);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            return fastMsg;
        }
   }

    public class pubL_29_11_Request : BaseRequest, IRequest<pubL_29_11_Response>
    {
        public pubL_29_11_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.29.11";
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

    public class pubL_29_12_Request : BaseRequest, IRequest<pubL_29_12_Response>
    {
        public pubL_29_12_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.29.12";
            }
        }

        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public int row_count { get; set; }
        public ulong row_id { get; set; }
        public int sort_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("row_count", 'I', row_count);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("sort_type", 'I', sort_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SORT_TYPE_INT,sort_type);
            return fastMsg;
        }
   }

    public class pubL_29_13_Request : BaseRequest, IRequest<pubL_29_13_Response>
    {
        public pubL_29_13_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.29.13";
            }
        }

        public int pass_no { get; set; }
        public int co_no { get; set; }
        public String stock_code { get; set; }
        public int exch_no { get; set; }
        public String fina_status { get; set; }
        public String secu_loan_status { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("fina_status", 'S', fina_status);
            packer.AddField("secu_loan_status", 'S', secu_loan_status);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FINA_STATUS_STR,fina_status);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_SECU_LOAN_STATUS_STR,secu_loan_status);
            return fastMsg;
        }
   }

    public class pubL_29_14_Request : BaseRequest, IRequest<pubL_29_14_Response>
    {
        public pubL_29_14_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.29.14";
            }
        }

        public int pass_no { get; set; }
        public int co_no { get; set; }
        public String stock_code { get; set; }
        public int exch_no { get; set; }
        public String fina_status { get; set; }
        public String secu_loan_status { get; set; }
        public ulong row_id { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("fina_status", 'S', fina_status);
            packer.AddField("secu_loan_status", 'S', secu_loan_status);
            packer.AddField("row_id", 'L', row_id);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FINA_STATUS_STR,fina_status);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_SECU_LOAN_STATUS_STR,secu_loan_status);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            return fastMsg;
        }
   }

    public class pubL_29_15_Request : BaseRequest, IRequest<pubL_29_15_Response>
    {
        public pubL_29_15_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.29.15";
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

    public class pubL_29_16_Request : BaseRequest, IRequest<pubL_29_16_Response>
    {
        public pubL_29_16_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.29.16";
            }
        }

        public int pass_no { get; set; }
        public int co_no { get; set; }
        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public int row_count { get; set; }
        public ulong row_id { get; set; }
        public int sort_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("row_count", 'I', row_count);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("sort_type", 'I', sort_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SORT_TYPE_INT,sort_type);
            return fastMsg;
        }
   }

    public class pubL_29_17_Request : BaseRequest, IRequest<pubL_29_17_Response>
    {
        public pubL_29_17_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.29.17";
            }
        }

        public int pass_no { get; set; }
        public int co_no { get; set; }
        public String stock_code { get; set; }
        public int exch_no { get; set; }
        public int stock_type { get; set; }
        public double fina_marg_ratio { get; set; }
        public double secu_loan_marg_ratio { get; set; }
        public double secu_loan_price_limit { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_type", 'I', stock_type);
            packer.AddField("fina_marg_ratio", 'D', fina_marg_ratio);
            packer.AddField("secu_loan_marg_ratio", 'D', secu_loan_marg_ratio);
            packer.AddField("secu_loan_price_limit", 'D', secu_loan_price_limit);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT,stock_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_MARG_RATIO_FLOAT,fina_marg_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SECU_LOAN_MARG_RATIO_FLOAT,secu_loan_marg_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SECU_LOAN_PRICE_LIMIT_FLOAT,secu_loan_price_limit);
            return fastMsg;
        }
   }

    public class pubL_29_18_Request : BaseRequest, IRequest<pubL_29_18_Response>
    {
        public pubL_29_18_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.29.18";
            }
        }

        public int pass_no { get; set; }
        public int co_no { get; set; }
        public int stock_code_no { get; set; }
        public String stock_code { get; set; }
        public int exch_no { get; set; }
        public int stock_type { get; set; }
        public double fina_marg_ratio { get; set; }
        public double secu_loan_marg_ratio { get; set; }
        public double secu_loan_price_limit { get; set; }
        public ulong row_id { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_type", 'I', stock_type);
            packer.AddField("fina_marg_ratio", 'D', fina_marg_ratio);
            packer.AddField("secu_loan_marg_ratio", 'D', secu_loan_marg_ratio);
            packer.AddField("secu_loan_price_limit", 'D', secu_loan_price_limit);
            packer.AddField("row_id", 'L', row_id);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT,stock_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_MARG_RATIO_FLOAT,fina_marg_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SECU_LOAN_MARG_RATIO_FLOAT,secu_loan_marg_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SECU_LOAN_PRICE_LIMIT_FLOAT,secu_loan_price_limit);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            return fastMsg;
        }
   }

    public class pubL_29_19_Request : BaseRequest, IRequest<pubL_29_19_Response>
    {
        public pubL_29_19_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.29.19";
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

    public class pubL_29_20_Request : BaseRequest, IRequest<pubL_29_20_Response>
    {
        public pubL_29_20_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.29.20";
            }
        }

        public int pass_no { get; set; }
        public int co_no { get; set; }
        public int stock_code_no { get; set; }
        public String stock_code { get; set; }
        public int exch_no { get; set; }
        public int stock_type { get; set; }
        public int row_count { get; set; }
        public ulong row_id { get; set; }
        public int sort_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_type", 'I', stock_type);
            packer.AddField("row_count", 'I', row_count);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("sort_type", 'I', sort_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT,stock_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SORT_TYPE_INT,sort_type);
            return fastMsg;
        }
   }

    public class pubL_29_21_Request : BaseRequest, IRequest<pubL_29_21_Response>
    {
        public pubL_29_21_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.29.21";
            }
        }

        public int pass_no { get; set; }
        public int co_no { get; set; }
        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            return fastMsg;
        }
   }

    public class pubL_29_22_Request : BaseRequest, IRequest<pubL_29_22_Response>
    {
        public pubL_29_22_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.29.22";
            }
        }

        public int pass_no { get; set; }
        public int co_no { get; set; }
        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public ulong row_id { get; set; }
        public int sort_type { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("sort_type", 'I', sort_type);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SORT_TYPE_INT,sort_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_29_23_Request : BaseRequest, IRequest<pubL_29_23_Response>
    {
        public pubL_29_23_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.29.23";
            }
        }

        public int pass_no { get; set; }
        public int co_no { get; set; }
        public int stock_code_no { get; set; }
        public String stock_code { get; set; }
        public int exch_no { get; set; }
        public int stock_type { get; set; }
        public int row_count { get; set; }
        public ulong row_id { get; set; }
        public int sort_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_type", 'I', stock_type);
            packer.AddField("row_count", 'I', row_count);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("sort_type", 'I', sort_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT,stock_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SORT_TYPE_INT,sort_type);
            return fastMsg;
        }
   }

    public class pubL_29_24_Request : BaseRequest, IRequest<pubL_29_24_Response>
    {
        public pubL_29_24_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.29.24";
            }
        }

        public int pass_no { get; set; }
        public int co_no { get; set; }
        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public double discount_rate { get; set; }
        public int offset_status { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("discount_rate", 'D', discount_rate);
            packer.AddField("offset_status", 'I', offset_status);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DISCOUNT_RATE_FLOAT,discount_rate);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OFFSET_STATUS_INT,offset_status);
            return fastMsg;
        }
   }

    public class pubL_29_25_Request : BaseRequest, IRequest<pubL_29_25_Response>
    {
        public pubL_29_25_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.29.25";
            }
        }

        public String stock_code { get; set; }
        public int exch_no { get; set; }
        public String fina_status { get; set; }
        public String secu_loan_status { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("fina_status", 'S', fina_status);
            packer.AddField("secu_loan_status", 'S', secu_loan_status);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FINA_STATUS_STR,fina_status);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_SECU_LOAN_STATUS_STR,secu_loan_status);
            return fastMsg;
        }
   }

}
