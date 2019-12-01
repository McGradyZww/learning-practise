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
    public class pubL_23_11_Request : BaseRequest, IRequest<pubL_23_11_Response>
    {
        public pubL_23_11_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.23.11";
            }
        }

        public String fee_tmplat_name { get; set; }
        public int fee_tmplat_kind { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("fee_tmplat_name", 'S', fee_tmplat_name);
            packer.AddField("fee_tmplat_kind", 'I', fee_tmplat_kind);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NAME_STR,fee_tmplat_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_KIND_INT,fee_tmplat_kind);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class pubL_23_12_Request : BaseRequest, IRequest<pubL_23_12_Response>
    {
        public pubL_23_12_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.23.12";
            }
        }

        public int fee_tmplat_no { get; set; }
        public String fee_tmplat_name { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("fee_tmplat_no", 'I', fee_tmplat_no);
            packer.AddField("fee_tmplat_name", 'S', fee_tmplat_name);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_INT,fee_tmplat_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NAME_STR,fee_tmplat_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class pubL_23_13_Request : BaseRequest, IRequest<pubL_23_13_Response>
    {
        public pubL_23_13_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.23.13";
            }
        }

        public int fee_tmplat_no { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("fee_tmplat_no", 'I', fee_tmplat_no);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_INT,fee_tmplat_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_23_14_Request : BaseRequest, IRequest<pubL_23_14_Response>
    {
        public pubL_23_14_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.23.14";
            }
        }

        public int fee_tmplat_no { get; set; }
        public int fee_tmplat_kind { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("fee_tmplat_no", 'I', fee_tmplat_no);
            packer.AddField("fee_tmplat_kind", 'I', fee_tmplat_kind);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_INT,fee_tmplat_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_KIND_INT,fee_tmplat_kind);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_23_15_Request : BaseRequest, IRequest<pubL_23_15_Response>
    {
        public pubL_23_15_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.23.15";
            }
        }

        public int fee_tmplat_no { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("fee_tmplat_no", 'I', fee_tmplat_no);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_INT,fee_tmplat_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_23_16_Request : BaseRequest, IRequest<pubL_23_16_Response>
    {
        public pubL_23_16_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.23.16";
            }
        }

        public int begin_date { get; set; }
        public int end_date { get; set; }
        public int fee_tmplat_no { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("fee_tmplat_no", 'I', fee_tmplat_no);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT,end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_INT,fee_tmplat_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_23_17_Request : BaseRequest, IRequest<pubL_23_17_Response>
    {
        public pubL_23_17_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.23.17";
            }
        }

        public int source_fee_tmplat_no { get; set; }
        public String fee_tmplat_name { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("source_fee_tmplat_no", 'I', source_fee_tmplat_no);
            packer.AddField("fee_tmplat_name", 'S', fee_tmplat_name);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SOURCE_FEE_TMPLAT_NO_INT,source_fee_tmplat_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NAME_STR,fee_tmplat_name);
            return fastMsg;
        }
   }

    public class pubL_23_21_Request : BaseRequest, IRequest<pubL_23_21_Response>
    {
        public pubL_23_21_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.23.21";
            }
        }

        public int exch_no { get; set; }
        public int stock_type { get; set; }
        public int fee_tmplat_no { get; set; }
        public int secu_fee_type { get; set; }
        public int order_dir { get; set; }
        public double amt_ratio { get; set; }
        public double amt_value { get; set; }
        public double par_value_ratio { get; set; }
        public double par_value_value { get; set; }
        public double max_fee { get; set; }
        public double min_fee { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_type", 'I', stock_type);
            packer.AddField("fee_tmplat_no", 'I', fee_tmplat_no);
            packer.AddField("secu_fee_type", 'I', secu_fee_type);
            packer.AddField("order_dir", 'I', order_dir);
            packer.AddField("amt_ratio", 'D', amt_ratio);
            packer.AddField("amt_value", 'D', amt_value);
            packer.AddField("par_value_ratio", 'D', par_value_ratio);
            packer.AddField("par_value_value", 'D', par_value_value);
            packer.AddField("max_fee", 'D', max_fee);
            packer.AddField("min_fee", 'D', min_fee);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT,stock_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_INT,fee_tmplat_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SECU_FEE_TYPE_INT,secu_fee_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT,order_dir);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_RATIO_FLOAT,amt_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_VALUE_FLOAT,amt_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_RATIO_FLOAT,par_value_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_VALUE_FLOAT,par_value_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_FEE_FLOAT,max_fee);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_FEE_FLOAT,min_fee);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class pubL_23_22_Request : BaseRequest, IRequest<pubL_23_22_Response>
    {
        public pubL_23_22_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.23.22";
            }
        }

        public int exch_no { get; set; }
        public int stock_type { get; set; }
        public int fee_tmplat_no { get; set; }
        public int fee_no { get; set; }
        public double amt_ratio { get; set; }
        public double amt_value { get; set; }
        public double par_value_ratio { get; set; }
        public double par_value_value { get; set; }
        public double max_fee { get; set; }
        public double min_fee { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_type", 'I', stock_type);
            packer.AddField("fee_tmplat_no", 'I', fee_tmplat_no);
            packer.AddField("fee_no", 'I', fee_no);
            packer.AddField("amt_ratio", 'D', amt_ratio);
            packer.AddField("amt_value", 'D', amt_value);
            packer.AddField("par_value_ratio", 'D', par_value_ratio);
            packer.AddField("par_value_value", 'D', par_value_value);
            packer.AddField("max_fee", 'D', max_fee);
            packer.AddField("min_fee", 'D', min_fee);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT,stock_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_INT,fee_tmplat_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_NO_INT,fee_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_RATIO_FLOAT,amt_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_VALUE_FLOAT,amt_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_RATIO_FLOAT,par_value_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_VALUE_FLOAT,par_value_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_FEE_FLOAT,max_fee);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_FEE_FLOAT,min_fee);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class pubL_23_23_Request : BaseRequest, IRequest<pubL_23_23_Response>
    {
        public pubL_23_23_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.23.23";
            }
        }

        public int exch_no { get; set; }
        public int stock_type { get; set; }
        public int fee_tmplat_no { get; set; }
        public int fee_no { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_type", 'I', stock_type);
            packer.AddField("fee_tmplat_no", 'I', fee_tmplat_no);
            packer.AddField("fee_no", 'I', fee_no);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT,stock_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_INT,fee_tmplat_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_NO_INT,fee_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_23_24_Request : BaseRequest, IRequest<pubL_23_24_Response>
    {
        public pubL_23_24_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.23.24";
            }
        }

        public String exch_no_str { get; set; }
        public String stock_type_str { get; set; }
        public String fee_tmplat_no_str { get; set; }
        public int secu_fee_type { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_type_str", 'S', stock_type_str);
            packer.AddField("fee_tmplat_no_str", 'S', fee_tmplat_no_str);
            packer.AddField("secu_fee_type", 'I', secu_fee_type);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_STR_STR,stock_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_STR_STR,fee_tmplat_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SECU_FEE_TYPE_INT,secu_fee_type);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_23_25_Request : BaseRequest, IRequest<pubL_23_25_Response>
    {
        public pubL_23_25_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.23.25";
            }
        }

        public String exch_no_str { get; set; }
        public String stock_type_str { get; set; }
        public String fee_tmplat_no_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_type_str", 'S', stock_type_str);
            packer.AddField("fee_tmplat_no_str", 'S', fee_tmplat_no_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_STR_STR,stock_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_STR_STR,fee_tmplat_no_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_23_26_Request : BaseRequest, IRequest<pubL_23_26_Response>
    {
        public pubL_23_26_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.23.26";
            }
        }

        public int begin_date { get; set; }
        public int end_date { get; set; }
        public String exch_no_str { get; set; }
        public String stock_type_str { get; set; }
        public String fee_tmplat_no_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_type_str", 'S', stock_type_str);
            packer.AddField("fee_tmplat_no_str", 'S', fee_tmplat_no_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT,end_date);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_STR_STR,stock_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_STR_STR,fee_tmplat_no_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_23_31_Request : BaseRequest, IRequest<pubL_23_31_Response>
    {
        public pubL_23_31_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.23.31";
            }
        }

        public int fee_tmplat_no { get; set; }
        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public int secu_fee_type { get; set; }
        public int order_dir { get; set; }
        public double amt_ratio { get; set; }
        public double amt_value { get; set; }
        public double par_value_ratio { get; set; }
        public double par_value_value { get; set; }
        public double max_fee { get; set; }
        public double min_fee { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("fee_tmplat_no", 'I', fee_tmplat_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("secu_fee_type", 'I', secu_fee_type);
            packer.AddField("order_dir", 'I', order_dir);
            packer.AddField("amt_ratio", 'D', amt_ratio);
            packer.AddField("amt_value", 'D', amt_value);
            packer.AddField("par_value_ratio", 'D', par_value_ratio);
            packer.AddField("par_value_value", 'D', par_value_value);
            packer.AddField("max_fee", 'D', max_fee);
            packer.AddField("min_fee", 'D', min_fee);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_INT,fee_tmplat_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SECU_FEE_TYPE_INT,secu_fee_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT,order_dir);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_RATIO_FLOAT,amt_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_VALUE_FLOAT,amt_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_RATIO_FLOAT,par_value_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_VALUE_FLOAT,par_value_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_FEE_FLOAT,max_fee);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_FEE_FLOAT,min_fee);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class pubL_23_32_Request : BaseRequest, IRequest<pubL_23_32_Response>
    {
        public pubL_23_32_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.23.32";
            }
        }

        public int fee_tmplat_no { get; set; }
        public int exch_no { get; set; }
        public int stock_code_no { get; set; }
        public int fee_no { get; set; }
        public double amt_ratio { get; set; }
        public double amt_value { get; set; }
        public double par_value_ratio { get; set; }
        public double par_value_value { get; set; }
        public double max_fee { get; set; }
        public double min_fee { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("fee_tmplat_no", 'I', fee_tmplat_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("fee_no", 'I', fee_no);
            packer.AddField("amt_ratio", 'D', amt_ratio);
            packer.AddField("amt_value", 'D', amt_value);
            packer.AddField("par_value_ratio", 'D', par_value_ratio);
            packer.AddField("par_value_value", 'D', par_value_value);
            packer.AddField("max_fee", 'D', max_fee);
            packer.AddField("min_fee", 'D', min_fee);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_INT,fee_tmplat_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_NO_INT,fee_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_RATIO_FLOAT,amt_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_VALUE_FLOAT,amt_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_RATIO_FLOAT,par_value_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_VALUE_FLOAT,par_value_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_FEE_FLOAT,max_fee);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_FEE_FLOAT,min_fee);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class pubL_23_33_Request : BaseRequest, IRequest<pubL_23_33_Response>
    {
        public pubL_23_33_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.23.33";
            }
        }

        public int fee_tmplat_no { get; set; }
        public int exch_no { get; set; }
        public int stock_code_no { get; set; }
        public int fee_no { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("fee_tmplat_no", 'I', fee_tmplat_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("fee_no", 'I', fee_no);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_INT,fee_tmplat_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_NO_INT,fee_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_23_34_Request : BaseRequest, IRequest<pubL_23_34_Response>
    {
        public pubL_23_34_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.23.34";
            }
        }

        public String fee_tmplat_no_str { get; set; }
        public String exch_no_str { get; set; }
        public String stock_code_no_str { get; set; }
        public int secu_fee_type { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("fee_tmplat_no_str", 'S', fee_tmplat_no_str);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_code_no_str", 'S', stock_code_no_str);
            packer.AddField("secu_fee_type", 'I', secu_fee_type);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_STR_STR,fee_tmplat_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_STR_STR,stock_code_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SECU_FEE_TYPE_INT,secu_fee_type);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_23_35_Request : BaseRequest, IRequest<pubL_23_35_Response>
    {
        public pubL_23_35_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.23.35";
            }
        }

        public String fee_tmplat_no_str { get; set; }
        public String exch_no_str { get; set; }
        public int stock_code_no { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("fee_tmplat_no_str", 'S', fee_tmplat_no_str);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_STR_STR,fee_tmplat_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_23_36_Request : BaseRequest, IRequest<pubL_23_36_Response>
    {
        public pubL_23_36_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.23.36";
            }
        }

        public int begin_date { get; set; }
        public int end_date { get; set; }
        public String fee_tmplat_no_str { get; set; }
        public String exch_no_str { get; set; }
        public int stock_code_no { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("fee_tmplat_no_str", 'S', fee_tmplat_no_str);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT,end_date);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_STR_STR,fee_tmplat_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_23_71_Request : BaseRequest, IRequest<pubL_23_71_Response>
    {
        public pubL_23_71_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.23.71";
            }
        }

        public int asset_acco_no { get; set; }
        public int secu_code_fee_tmplat_no { get; set; }
        public int secu_type_fee_tmplat_no { get; set; }
        public int secu_code_out_fee_tmplat_no { get; set; }
        public int secu_type_out_fee_tmplat_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("secu_code_fee_tmplat_no", 'I', secu_code_fee_tmplat_no);
            packer.AddField("secu_type_fee_tmplat_no", 'I', secu_type_fee_tmplat_no);
            packer.AddField("secu_code_out_fee_tmplat_no", 'I', secu_code_out_fee_tmplat_no);
            packer.AddField("secu_type_out_fee_tmplat_no", 'I', secu_type_out_fee_tmplat_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SECU_CODE_FEE_TMPLAT_NO_INT,secu_code_fee_tmplat_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SECU_TYPE_FEE_TMPLAT_NO_INT,secu_type_fee_tmplat_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SECU_CODE_OUT_FEE_TMPLAT_NO_INT,secu_code_out_fee_tmplat_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SECU_TYPE_OUT_FEE_TMPLAT_NO_INT,secu_type_out_fee_tmplat_no);
            return fastMsg;
        }
   }

    public class pubL_23_72_Request : BaseRequest, IRequest<pubL_23_72_Response>
    {
        public pubL_23_72_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.23.72";
            }
        }

        public int asset_acco_no { get; set; }
        public int secu_code_fee_tmplat_no { get; set; }
        public int secu_type_fee_tmplat_no { get; set; }
        public int secu_code_out_fee_tmplat_no { get; set; }
        public int secu_type_out_fee_tmplat_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("secu_code_fee_tmplat_no", 'I', secu_code_fee_tmplat_no);
            packer.AddField("secu_type_fee_tmplat_no", 'I', secu_type_fee_tmplat_no);
            packer.AddField("secu_code_out_fee_tmplat_no", 'I', secu_code_out_fee_tmplat_no);
            packer.AddField("secu_type_out_fee_tmplat_no", 'I', secu_type_out_fee_tmplat_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SECU_CODE_FEE_TMPLAT_NO_INT,secu_code_fee_tmplat_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SECU_TYPE_FEE_TMPLAT_NO_INT,secu_type_fee_tmplat_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SECU_CODE_OUT_FEE_TMPLAT_NO_INT,secu_code_out_fee_tmplat_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SECU_TYPE_OUT_FEE_TMPLAT_NO_INT,secu_type_out_fee_tmplat_no);
            return fastMsg;
        }
   }

    public class pubL_23_73_Request : BaseRequest, IRequest<pubL_23_73_Response>
    {
        public pubL_23_73_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.23.73";
            }
        }

        public int asset_acco_no { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_23_74_Request : BaseRequest, IRequest<pubL_23_74_Response>
    {
        public pubL_23_74_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.23.74";
            }
        }

        public int asset_acco_no { get; set; }
        public String secu_code_fee_tmplat_str { get; set; }
        public String secu_type_fee_tmplat_str { get; set; }
        public String secu_code_out_fee_tmplat_str { get; set; }
        public String secu_type_out_fee_tmplat_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("secu_code_fee_tmplat_str", 'S', secu_code_fee_tmplat_str);
            packer.AddField("secu_type_fee_tmplat_str", 'S', secu_type_fee_tmplat_str);
            packer.AddField("secu_code_out_fee_tmplat_str", 'S', secu_code_out_fee_tmplat_str);
            packer.AddField("secu_type_out_fee_tmplat_str", 'S', secu_type_out_fee_tmplat_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_SECU_CODE_FEE_TMPLAT_STR_STR,secu_code_fee_tmplat_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_SECU_TYPE_FEE_TMPLAT_STR_STR,secu_type_fee_tmplat_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_SECU_CODE_OUT_FEE_TMPLAT_STR_STR,secu_code_out_fee_tmplat_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_SECU_TYPE_OUT_FEE_TMPLAT_STR_STR,secu_type_out_fee_tmplat_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_23_75_Request : BaseRequest, IRequest<pubL_23_75_Response>
    {
        public pubL_23_75_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.23.75";
            }
        }

        public int asset_acco_no { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_23_76_Request : BaseRequest, IRequest<pubL_23_76_Response>
    {
        public pubL_23_76_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.23.76";
            }
        }

        public int begin_date { get; set; }
        public int end_date { get; set; }
        public int asset_acco_no { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT,end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_23_104_Request : BaseRequest, IRequest<pubL_23_104_Response>
    {
        public pubL_23_104_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.23.104";
            }
        }

        public String exch_no_str { get; set; }
        public String stock_type_str { get; set; }
        public String fee_no_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_type_str", 'S', stock_type_str);
            packer.AddField("fee_no_str", 'S', fee_no_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_STR_STR,stock_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FEE_NO_STR_STR,fee_no_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_23_114_Request : BaseRequest, IRequest<pubL_23_114_Response>
    {
        public pubL_23_114_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.23.114";
            }
        }

        public String exch_no_str { get; set; }
        public String stock_code_no_str { get; set; }
        public String fee_no_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_code_no_str", 'S', stock_code_no_str);
            packer.AddField("fee_no_str", 'S', fee_no_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_STR_STR,stock_code_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FEE_NO_STR_STR,fee_no_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_23_161_Request : BaseRequest, IRequest<pubL_23_161_Response>
    {
        public pubL_23_161_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.23.161";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int pd_fee_type { get; set; }
        public String pd_fee_name { get; set; }
        public double pd_fee_rate { get; set; }
        public int pd_fee_cacl_type { get; set; }
        public double pd_fee_cacl_base { get; set; }
        public double min_fee { get; set; }
        public String crncy_type { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("pd_fee_type", 'I', pd_fee_type);
            packer.AddField("pd_fee_name", 'S', pd_fee_name);
            packer.AddField("pd_fee_rate", 'D', pd_fee_rate);
            packer.AddField("pd_fee_cacl_type", 'I', pd_fee_cacl_type);
            packer.AddField("pd_fee_cacl_base", 'D', pd_fee_cacl_base);
            packer.AddField("min_fee", 'D', min_fee);
            packer.AddField("crncy_type", 'S', crncy_type);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_FEE_TYPE_INT,pd_fee_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_FEE_NAME_STR,pd_fee_name);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_FEE_RATE_FLOAT,pd_fee_rate);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_FEE_CACL_TYPE_INT,pd_fee_cacl_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_FEE_CACL_BASE_FLOAT,pd_fee_cacl_base);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_FEE_FLOAT,min_fee);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class pubL_23_162_Request : BaseRequest, IRequest<pubL_23_162_Response>
    {
        public pubL_23_162_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.23.162";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int pd_fee_type { get; set; }
        public String pd_fee_name { get; set; }
        public double pd_fee_rate { get; set; }
        public int pd_fee_cacl_type { get; set; }
        public double pd_fee_cacl_base { get; set; }
        public double min_fee { get; set; }
        public String crncy_type { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("pd_fee_type", 'I', pd_fee_type);
            packer.AddField("pd_fee_name", 'S', pd_fee_name);
            packer.AddField("pd_fee_rate", 'D', pd_fee_rate);
            packer.AddField("pd_fee_cacl_type", 'I', pd_fee_cacl_type);
            packer.AddField("pd_fee_cacl_base", 'D', pd_fee_cacl_base);
            packer.AddField("min_fee", 'D', min_fee);
            packer.AddField("crncy_type", 'S', crncy_type);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_FEE_TYPE_INT,pd_fee_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_FEE_NAME_STR,pd_fee_name);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_FEE_RATE_FLOAT,pd_fee_rate);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_FEE_CACL_TYPE_INT,pd_fee_cacl_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_FEE_CACL_BASE_FLOAT,pd_fee_cacl_base);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_FEE_FLOAT,min_fee);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class pubL_23_163_Request : BaseRequest, IRequest<pubL_23_163_Response>
    {
        public pubL_23_163_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.23.163";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int pd_fee_type { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("pd_fee_type", 'I', pd_fee_type);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_FEE_TYPE_INT,pd_fee_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_23_164_Request : BaseRequest, IRequest<pubL_23_164_Response>
    {
        public pubL_23_164_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.23.164";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int pd_fee_type { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("pd_fee_type", 'I', pd_fee_type);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_FEE_TYPE_INT,pd_fee_type);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_23_165_Request : BaseRequest, IRequest<pubL_23_165_Response>
    {
        public pubL_23_165_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.23.165";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public String pd_fee_type_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("pd_fee_type_str", 'S', pd_fee_type_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_FEE_TYPE_STR_STR,pd_fee_type_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_23_166_Request : BaseRequest, IRequest<pubL_23_166_Response>
    {
        public pubL_23_166_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.23.166";
            }
        }

        public int begin_date { get; set; }
        public int end_date { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public String pd_fee_type_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("pd_fee_type_str", 'S', pd_fee_type_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT,end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_FEE_TYPE_STR_STR,pd_fee_type_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_23_201_Request : BaseRequest, IRequest<pubL_23_201_Response>
    {
        public pubL_23_201_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.23.201";
            }
        }

        public int pass_no { get; set; }
        public int asset_acco_no { get; set; }
        public int stock_code_no { get; set; }
        public int exch_no { get; set; }
        public int stock_type { get; set; }
        public int order_dir { get; set; }
        public int contrc_dir { get; set; }
        public double fee_qty { get; set; }
        public double fee_price { get; set; }
        public int net_price_flag { get; set; }
        public double bond_accr_intrst { get; set; }
        public int bond_rate_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_type", 'I', stock_type);
            packer.AddField("order_dir", 'I', order_dir);
            packer.AddField("contrc_dir", 'I', contrc_dir);
            packer.AddField("fee_qty", 'D', fee_qty);
            packer.AddField("fee_price", 'D', fee_price);
            packer.AddField("net_price_flag", 'I', net_price_flag);
            packer.AddField("bond_accr_intrst", 'D', bond_accr_intrst);
            packer.AddField("bond_rate_type", 'I', bond_rate_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT,stock_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT,order_dir);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_DIR_INT,contrc_dir);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FEE_QTY_FLOAT,fee_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FEE_PRICE_FLOAT,fee_price);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLAG_INT,net_price_flag);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT,bond_accr_intrst);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BOND_RATE_TYPE_INT,bond_rate_type);
            return fastMsg;
        }
   }

    public class pubL_23_302_Request : BaseRequest, IRequest<pubL_23_302_Response>
    {
        public pubL_23_302_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.23.302";
            }
        }

        public int fee_no { get; set; }
        public int secu_fee_type { get; set; }
        public int order_dir { get; set; }
        public int contrc_dir { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("fee_no", 'I', fee_no);
            packer.AddField("secu_fee_type", 'I', secu_fee_type);
            packer.AddField("order_dir", 'I', order_dir);
            packer.AddField("contrc_dir", 'I', contrc_dir);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_NO_INT,fee_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SECU_FEE_TYPE_INT,secu_fee_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT,order_dir);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_DIR_INT,contrc_dir);
            return fastMsg;
        }
   }

    public class pubL_23_167_Request : BaseRequest, IRequest<pubL_23_167_Response>
    {
        public pubL_23_167_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.23.167";
            }
        }

        public int fee_tmplat_no { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("fee_tmplat_no", 'I', fee_tmplat_no);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_INT,fee_tmplat_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

}
