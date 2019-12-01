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
    public class pubL_15_41_Request : BaseRequest, IRequest<pubL_15_41_Response>
    {
        public pubL_15_41_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.15.41";
            }
        }

        public int co_no { get; set; }
        public String fee_tmplat_name { get; set; }
        public int fee_tmplat_kind { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("fee_tmplat_name", 'S', fee_tmplat_name);
            packer.AddField("fee_tmplat_kind", 'I', fee_tmplat_kind);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NAME_STR,fee_tmplat_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_KIND_INT,fee_tmplat_kind);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class pubL_15_42_Request : BaseRequest, IRequest<pubL_15_42_Response>
    {
        public pubL_15_42_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.15.42";
            }
        }

        public int co_no { get; set; }
        public int fee_tmplat_no { get; set; }
        public String fee_tmplat_name { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("fee_tmplat_no", 'I', fee_tmplat_no);
            packer.AddField("fee_tmplat_name", 'S', fee_tmplat_name);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_INT,fee_tmplat_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NAME_STR,fee_tmplat_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class pubL_15_43_Request : BaseRequest, IRequest<pubL_15_43_Response>
    {
        public pubL_15_43_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.15.43";
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

    public class pubL_15_44_Request : BaseRequest, IRequest<pubL_15_44_Response>
    {
        public pubL_15_44_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.15.44";
            }
        }

        public int co_no { get; set; }
        public int fee_tmplat_no { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("fee_tmplat_no", 'I', fee_tmplat_no);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_INT,fee_tmplat_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_15_45_Request : BaseRequest, IRequest<pubL_15_45_Response>
    {
        public pubL_15_45_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.15.45";
            }
        }

        public int co_no { get; set; }
        public int fee_tmplat_no { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("fee_tmplat_no", 'I', fee_tmplat_no);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_INT,fee_tmplat_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_15_46_Request : BaseRequest, IRequest<pubL_15_46_Response>
    {
        public pubL_15_46_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.15.46";
            }
        }

        public int begin_date { get; set; }
        public int end_date { get; set; }
        public int co_no { get; set; }
        public int fee_tmplat_no { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("co_no", 'I', co_no);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_INT,fee_tmplat_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_15_51_Request : BaseRequest, IRequest<pubL_15_51_Response>
    {
        public pubL_15_51_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.15.51";
            }
        }

        public int fee_tmplat_no { get; set; }
        public int exch_no { get; set; }
        public int contrc_type { get; set; }
        public int futu_fee_type { get; set; }
        public int order_dir { get; set; }
        public int contrc_dir { get; set; }
        public double amt_ratio { get; set; }
        public double amt_value { get; set; }
        public double par_value_ratio { get; set; }
        public double par_value_value { get; set; }
        public double max_fee { get; set; }
        public double min_fee { get; set; }
        public int hedge_type { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("fee_tmplat_no", 'I', fee_tmplat_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("contrc_type", 'I', contrc_type);
            packer.AddField("futu_fee_type", 'I', futu_fee_type);
            packer.AddField("order_dir", 'I', order_dir);
            packer.AddField("contrc_dir", 'I', contrc_dir);
            packer.AddField("amt_ratio", 'D', amt_ratio);
            packer.AddField("amt_value", 'D', amt_value);
            packer.AddField("par_value_ratio", 'D', par_value_ratio);
            packer.AddField("par_value_value", 'D', par_value_value);
            packer.AddField("max_fee", 'D', max_fee);
            packer.AddField("min_fee", 'D', min_fee);
            packer.AddField("hedge_type", 'I', hedge_type);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_INT,fee_tmplat_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT,contrc_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_FEE_TYPE_INT,futu_fee_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT,order_dir);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_DIR_INT,contrc_dir);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_RATIO_FLOAT,amt_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_VALUE_FLOAT,amt_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_RATIO_FLOAT,par_value_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_VALUE_FLOAT,par_value_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_FEE_FLOAT,max_fee);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_FEE_FLOAT,min_fee);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT,hedge_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class pubL_15_52_Request : BaseRequest, IRequest<pubL_15_52_Response>
    {
        public pubL_15_52_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.15.52";
            }
        }

        public int fee_tmplat_no { get; set; }
        public int exch_no { get; set; }
        public int contrc_type { get; set; }
        public int fee_no { get; set; }
        public double amt_ratio { get; set; }
        public double amt_value { get; set; }
        public double par_value_ratio { get; set; }
        public double par_value_value { get; set; }
        public double max_fee { get; set; }
        public double min_fee { get; set; }
        public int hedge_type { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("fee_tmplat_no", 'I', fee_tmplat_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("contrc_type", 'I', contrc_type);
            packer.AddField("fee_no", 'I', fee_no);
            packer.AddField("amt_ratio", 'D', amt_ratio);
            packer.AddField("amt_value", 'D', amt_value);
            packer.AddField("par_value_ratio", 'D', par_value_ratio);
            packer.AddField("par_value_value", 'D', par_value_value);
            packer.AddField("max_fee", 'D', max_fee);
            packer.AddField("min_fee", 'D', min_fee);
            packer.AddField("hedge_type", 'I', hedge_type);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_INT,fee_tmplat_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT,contrc_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_NO_INT,fee_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_RATIO_FLOAT,amt_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_VALUE_FLOAT,amt_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_RATIO_FLOAT,par_value_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_VALUE_FLOAT,par_value_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_FEE_FLOAT,max_fee);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_FEE_FLOAT,min_fee);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT,hedge_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class pubL_15_53_Request : BaseRequest, IRequest<pubL_15_53_Response>
    {
        public pubL_15_53_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.15.53";
            }
        }

        public int fee_tmplat_no { get; set; }
        public int exch_no { get; set; }
        public int contrc_type { get; set; }
        public int fee_no { get; set; }
        public int hedge_type { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("fee_tmplat_no", 'I', fee_tmplat_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("contrc_type", 'I', contrc_type);
            packer.AddField("fee_no", 'I', fee_no);
            packer.AddField("hedge_type", 'I', hedge_type);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_INT,fee_tmplat_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT,contrc_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_NO_INT,fee_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT,hedge_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_15_54_Request : BaseRequest, IRequest<pubL_15_54_Response>
    {
        public pubL_15_54_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.15.54";
            }
        }

        public int co_no { get; set; }
        public String fee_tmplat_no_str { get; set; }
        public String exch_no_str { get; set; }
        public String contrc_type_str { get; set; }
        public String fee_no_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("fee_tmplat_no_str", 'S', fee_tmplat_no_str);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("contrc_type_str", 'S', contrc_type_str);
            packer.AddField("fee_no_str", 'S', fee_no_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_STR_STR,fee_tmplat_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_STR_STR,contrc_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FEE_NO_STR_STR,fee_no_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_15_55_Request : BaseRequest, IRequest<pubL_15_55_Response>
    {
        public pubL_15_55_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.15.55";
            }
        }

        public int co_no { get; set; }
        public String fee_tmplat_no_str { get; set; }
        public String exch_no_str { get; set; }
        public String contrc_type_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("fee_tmplat_no_str", 'S', fee_tmplat_no_str);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("contrc_type_str", 'S', contrc_type_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_STR_STR,fee_tmplat_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_STR_STR,contrc_type_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_15_56_Request : BaseRequest, IRequest<pubL_15_56_Response>
    {
        public pubL_15_56_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.15.56";
            }
        }

        public int co_no { get; set; }
        public int begin_date { get; set; }
        public int end_date { get; set; }
        public String fee_tmplat_no_str { get; set; }
        public String exch_no_str { get; set; }
        public String contrc_type_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("fee_tmplat_no_str", 'S', fee_tmplat_no_str);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("contrc_type_str", 'S', contrc_type_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT,end_date);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_STR_STR,fee_tmplat_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_STR_STR,contrc_type_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_15_61_Request : BaseRequest, IRequest<pubL_15_61_Response>
    {
        public pubL_15_61_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.15.61";
            }
        }

        public int fee_tmplat_no { get; set; }
        public int exch_no { get; set; }
        public String contrc_code { get; set; }
        public int futu_fee_type { get; set; }
        public int order_dir { get; set; }
        public int contrc_dir { get; set; }
        public double amt_ratio { get; set; }
        public double amt_value { get; set; }
        public double par_value_ratio { get; set; }
        public double par_value_value { get; set; }
        public double max_fee { get; set; }
        public double min_fee { get; set; }
        public int hedge_type { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("fee_tmplat_no", 'I', fee_tmplat_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("contrc_code", 'S', contrc_code);
            packer.AddField("futu_fee_type", 'I', futu_fee_type);
            packer.AddField("order_dir", 'I', order_dir);
            packer.AddField("contrc_dir", 'I', contrc_dir);
            packer.AddField("amt_ratio", 'D', amt_ratio);
            packer.AddField("amt_value", 'D', amt_value);
            packer.AddField("par_value_ratio", 'D', par_value_ratio);
            packer.AddField("par_value_value", 'D', par_value_value);
            packer.AddField("max_fee", 'D', max_fee);
            packer.AddField("min_fee", 'D', min_fee);
            packer.AddField("hedge_type", 'I', hedge_type);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_INT,fee_tmplat_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR,contrc_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_FEE_TYPE_INT,futu_fee_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT,order_dir);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_DIR_INT,contrc_dir);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_RATIO_FLOAT,amt_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_VALUE_FLOAT,amt_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_RATIO_FLOAT,par_value_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_VALUE_FLOAT,par_value_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_FEE_FLOAT,max_fee);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_FEE_FLOAT,min_fee);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT,hedge_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class pubL_15_62_Request : BaseRequest, IRequest<pubL_15_62_Response>
    {
        public pubL_15_62_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.15.62";
            }
        }

        public int fee_tmplat_no { get; set; }
        public int exch_no { get; set; }
        public int contrc_code_no { get; set; }
        public int fee_no { get; set; }
        public double amt_ratio { get; set; }
        public double amt_value { get; set; }
        public double par_value_ratio { get; set; }
        public double par_value_value { get; set; }
        public double max_fee { get; set; }
        public double min_fee { get; set; }
        public int hedge_type { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("fee_tmplat_no", 'I', fee_tmplat_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("contrc_code_no", 'I', contrc_code_no);
            packer.AddField("fee_no", 'I', fee_no);
            packer.AddField("amt_ratio", 'D', amt_ratio);
            packer.AddField("amt_value", 'D', amt_value);
            packer.AddField("par_value_ratio", 'D', par_value_ratio);
            packer.AddField("par_value_value", 'D', par_value_value);
            packer.AddField("max_fee", 'D', max_fee);
            packer.AddField("min_fee", 'D', min_fee);
            packer.AddField("hedge_type", 'I', hedge_type);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_INT,fee_tmplat_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_NO_INT,fee_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_RATIO_FLOAT,amt_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_VALUE_FLOAT,amt_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_RATIO_FLOAT,par_value_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_VALUE_FLOAT,par_value_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_FEE_FLOAT,max_fee);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_FEE_FLOAT,min_fee);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT,hedge_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class pubL_15_63_Request : BaseRequest, IRequest<pubL_15_63_Response>
    {
        public pubL_15_63_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.15.63";
            }
        }

        public int fee_tmplat_no { get; set; }
        public int exch_no { get; set; }
        public int contrc_code_no { get; set; }
        public int fee_no { get; set; }
        public int hedge_type { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("fee_tmplat_no", 'I', fee_tmplat_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("contrc_code_no", 'I', contrc_code_no);
            packer.AddField("fee_no", 'I', fee_no);
            packer.AddField("hedge_type", 'I', hedge_type);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_INT,fee_tmplat_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_NO_INT,fee_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT,hedge_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_15_64_Request : BaseRequest, IRequest<pubL_15_64_Response>
    {
        public pubL_15_64_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.15.64";
            }
        }

        public int co_no { get; set; }
        public String fee_tmplat_no_str { get; set; }
        public String exch_no_str { get; set; }
        public int contrc_code_no { get; set; }
        public String fee_no_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("fee_tmplat_no_str", 'S', fee_tmplat_no_str);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("contrc_code_no", 'I', contrc_code_no);
            packer.AddField("fee_no_str", 'S', fee_no_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_STR_STR,fee_tmplat_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FEE_NO_STR_STR,fee_no_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_15_65_Request : BaseRequest, IRequest<pubL_15_65_Response>
    {
        public pubL_15_65_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.15.65";
            }
        }

        public int co_no { get; set; }
        public String fee_tmplat_no_str { get; set; }
        public String exch_no_str { get; set; }
        public int contrc_code_no { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("fee_tmplat_no_str", 'S', fee_tmplat_no_str);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("contrc_code_no", 'I', contrc_code_no);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_STR_STR,fee_tmplat_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_15_66_Request : BaseRequest, IRequest<pubL_15_66_Response>
    {
        public pubL_15_66_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.15.66";
            }
        }

        public int begin_date { get; set; }
        public int end_date { get; set; }
        public int co_no { get; set; }
        public String fee_tmplat_no_str { get; set; }
        public String exch_no_str { get; set; }
        public int contrc_code_no { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("fee_tmplat_no_str", 'S', fee_tmplat_no_str);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("contrc_code_no", 'I', contrc_code_no);
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
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_STR_STR,fee_tmplat_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_15_121_Request : BaseRequest, IRequest<pubL_15_121_Response>
    {
        public pubL_15_121_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.15.121";
            }
        }

        public int pass_no { get; set; }
        public int exch_no { get; set; }
        public int contrc_type { get; set; }
        public int futu_fee_type { get; set; }
        public int order_dir { get; set; }
        public int contrc_dir { get; set; }
        public double amt_ratio { get; set; }
        public double amt_value { get; set; }
        public double par_value_ratio { get; set; }
        public double par_value_value { get; set; }
        public double max_fee { get; set; }
        public double min_fee { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("contrc_type", 'I', contrc_type);
            packer.AddField("futu_fee_type", 'I', futu_fee_type);
            packer.AddField("order_dir", 'I', order_dir);
            packer.AddField("contrc_dir", 'I', contrc_dir);
            packer.AddField("amt_ratio", 'D', amt_ratio);
            packer.AddField("amt_value", 'D', amt_value);
            packer.AddField("par_value_ratio", 'D', par_value_ratio);
            packer.AddField("par_value_value", 'D', par_value_value);
            packer.AddField("max_fee", 'D', max_fee);
            packer.AddField("min_fee", 'D', min_fee);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT,contrc_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_FEE_TYPE_INT,futu_fee_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT,order_dir);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_DIR_INT,contrc_dir);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_RATIO_FLOAT,amt_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_VALUE_FLOAT,amt_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_RATIO_FLOAT,par_value_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_VALUE_FLOAT,par_value_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_FEE_FLOAT,max_fee);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_FEE_FLOAT,min_fee);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_15_122_Request : BaseRequest, IRequest<pubL_15_122_Response>
    {
        public pubL_15_122_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.15.122";
            }
        }

        public int pass_no { get; set; }
        public int exch_no { get; set; }
        public int contrc_type { get; set; }
        public int fee_no { get; set; }
        public double amt_ratio { get; set; }
        public double amt_value { get; set; }
        public double par_value_ratio { get; set; }
        public double par_value_value { get; set; }
        public double max_fee { get; set; }
        public double min_fee { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("contrc_type", 'I', contrc_type);
            packer.AddField("fee_no", 'I', fee_no);
            packer.AddField("amt_ratio", 'D', amt_ratio);
            packer.AddField("amt_value", 'D', amt_value);
            packer.AddField("par_value_ratio", 'D', par_value_ratio);
            packer.AddField("par_value_value", 'D', par_value_value);
            packer.AddField("max_fee", 'D', max_fee);
            packer.AddField("min_fee", 'D', min_fee);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT,contrc_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_NO_INT,fee_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_RATIO_FLOAT,amt_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_VALUE_FLOAT,amt_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_RATIO_FLOAT,par_value_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_VALUE_FLOAT,par_value_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_FEE_FLOAT,max_fee);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_FEE_FLOAT,min_fee);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_15_123_Request : BaseRequest, IRequest<pubL_15_123_Response>
    {
        public pubL_15_123_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.15.123";
            }
        }

        public int pass_no { get; set; }
        public int exch_no { get; set; }
        public int contrc_type { get; set; }
        public int fee_no { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("contrc_type", 'I', contrc_type);
            packer.AddField("fee_no", 'I', fee_no);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT,contrc_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_NO_INT,fee_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_15_124_Request : BaseRequest, IRequest<pubL_15_124_Response>
    {
        public pubL_15_124_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.15.124";
            }
        }

        public int pass_no { get; set; }
        public String exch_no_str { get; set; }
        public String contrc_type_str { get; set; }
        public int fee_no { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("contrc_type_str", 'S', contrc_type_str);
            packer.AddField("fee_no", 'I', fee_no);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_STR_STR,contrc_type_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_NO_INT,fee_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_15_125_Request : BaseRequest, IRequest<pubL_15_125_Response>
    {
        public pubL_15_125_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.15.125";
            }
        }

        public int pass_no { get; set; }
        public String exch_no_str { get; set; }
        public String contrc_type_str { get; set; }
        public int fee_no { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("contrc_type_str", 'S', contrc_type_str);
            packer.AddField("fee_no", 'I', fee_no);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_STR_STR,contrc_type_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_NO_INT,fee_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_15_126_Request : BaseRequest, IRequest<pubL_15_126_Response>
    {
        public pubL_15_126_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.15.126";
            }
        }

        public int begin_date { get; set; }
        public int end_date { get; set; }
        public int pass_no { get; set; }
        public String exch_no_str { get; set; }
        public String contrc_type_str { get; set; }
        public int fee_no { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("contrc_type_str", 'S', contrc_type_str);
            packer.AddField("fee_no", 'I', fee_no);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT,end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_STR_STR,contrc_type_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_NO_INT,fee_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_15_131_Request : BaseRequest, IRequest<pubL_15_131_Response>
    {
        public pubL_15_131_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.15.131";
            }
        }

        public int pass_no { get; set; }
        public int exch_no { get; set; }
        public String contrc_code { get; set; }
        public int futu_fee_type { get; set; }
        public int order_dir { get; set; }
        public int contrc_dir { get; set; }
        public double amt_ratio { get; set; }
        public double amt_value { get; set; }
        public double par_value_ratio { get; set; }
        public double par_value_value { get; set; }
        public double max_fee { get; set; }
        public double min_fee { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("contrc_code", 'S', contrc_code);
            packer.AddField("futu_fee_type", 'I', futu_fee_type);
            packer.AddField("order_dir", 'I', order_dir);
            packer.AddField("contrc_dir", 'I', contrc_dir);
            packer.AddField("amt_ratio", 'D', amt_ratio);
            packer.AddField("amt_value", 'D', amt_value);
            packer.AddField("par_value_ratio", 'D', par_value_ratio);
            packer.AddField("par_value_value", 'D', par_value_value);
            packer.AddField("max_fee", 'D', max_fee);
            packer.AddField("min_fee", 'D', min_fee);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR,contrc_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_FEE_TYPE_INT,futu_fee_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT,order_dir);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_DIR_INT,contrc_dir);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_RATIO_FLOAT,amt_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_VALUE_FLOAT,amt_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_RATIO_FLOAT,par_value_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_VALUE_FLOAT,par_value_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_FEE_FLOAT,max_fee);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_FEE_FLOAT,min_fee);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_15_132_Request : BaseRequest, IRequest<pubL_15_132_Response>
    {
        public pubL_15_132_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.15.132";
            }
        }

        public int pass_no { get; set; }
        public int exch_no { get; set; }
        public int contrc_code_no { get; set; }
        public int fee_no { get; set; }
        public double amt_ratio { get; set; }
        public double amt_value { get; set; }
        public double par_value_ratio { get; set; }
        public double par_value_value { get; set; }
        public double max_fee { get; set; }
        public double min_fee { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("contrc_code_no", 'I', contrc_code_no);
            packer.AddField("fee_no", 'I', fee_no);
            packer.AddField("amt_ratio", 'D', amt_ratio);
            packer.AddField("amt_value", 'D', amt_value);
            packer.AddField("par_value_ratio", 'D', par_value_ratio);
            packer.AddField("par_value_value", 'D', par_value_value);
            packer.AddField("max_fee", 'D', max_fee);
            packer.AddField("min_fee", 'D', min_fee);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_NO_INT,fee_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_RATIO_FLOAT,amt_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_VALUE_FLOAT,amt_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_RATIO_FLOAT,par_value_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_VALUE_FLOAT,par_value_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_FEE_FLOAT,max_fee);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_FEE_FLOAT,min_fee);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_15_133_Request : BaseRequest, IRequest<pubL_15_133_Response>
    {
        public pubL_15_133_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.15.133";
            }
        }

        public int pass_no { get; set; }
        public int exch_no { get; set; }
        public int contrc_code_no { get; set; }
        public int fee_no { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("contrc_code_no", 'I', contrc_code_no);
            packer.AddField("fee_no", 'I', fee_no);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_NO_INT,fee_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_15_134_Request : BaseRequest, IRequest<pubL_15_134_Response>
    {
        public pubL_15_134_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.15.134";
            }
        }

        public int pass_no { get; set; }
        public String exch_no_str { get; set; }
        public int contrc_code_no { get; set; }
        public int fee_no { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("contrc_code_no", 'I', contrc_code_no);
            packer.AddField("fee_no", 'I', fee_no);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_NO_INT,fee_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_15_135_Request : BaseRequest, IRequest<pubL_15_135_Response>
    {
        public pubL_15_135_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.15.135";
            }
        }

        public int pass_no { get; set; }
        public String exch_no_str { get; set; }
        public int contrc_code_no { get; set; }
        public int fee_no { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("contrc_code_no", 'I', contrc_code_no);
            packer.AddField("fee_no", 'I', fee_no);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_NO_INT,fee_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_15_136_Request : BaseRequest, IRequest<pubL_15_136_Response>
    {
        public pubL_15_136_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.15.136";
            }
        }

        public int begin_date { get; set; }
        public int end_date { get; set; }
        public int pass_no { get; set; }
        public String exch_no_str { get; set; }
        public int contrc_code_no { get; set; }
        public int fee_no { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("contrc_code_no", 'I', contrc_code_no);
            packer.AddField("fee_no", 'I', fee_no);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT,end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_NO_INT,fee_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_15_141_Request : BaseRequest, IRequest<pubL_15_141_Response>
    {
        public pubL_15_141_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.15.141";
            }
        }

        public int exch_no { get; set; }
        public int contrc_type { get; set; }
        public int futu_fee_type { get; set; }
        public int order_dir { get; set; }
        public int contrc_dir { get; set; }
        public double amt_ratio { get; set; }
        public double amt_value { get; set; }
        public double par_value_ratio { get; set; }
        public double par_value_value { get; set; }
        public double max_fee { get; set; }
        public double min_fee { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("contrc_type", 'I', contrc_type);
            packer.AddField("futu_fee_type", 'I', futu_fee_type);
            packer.AddField("order_dir", 'I', order_dir);
            packer.AddField("contrc_dir", 'I', contrc_dir);
            packer.AddField("amt_ratio", 'D', amt_ratio);
            packer.AddField("amt_value", 'D', amt_value);
            packer.AddField("par_value_ratio", 'D', par_value_ratio);
            packer.AddField("par_value_value", 'D', par_value_value);
            packer.AddField("max_fee", 'D', max_fee);
            packer.AddField("min_fee", 'D', min_fee);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT,contrc_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_FEE_TYPE_INT,futu_fee_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT,order_dir);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_DIR_INT,contrc_dir);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_RATIO_FLOAT,amt_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_VALUE_FLOAT,amt_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_RATIO_FLOAT,par_value_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_VALUE_FLOAT,par_value_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_FEE_FLOAT,max_fee);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_FEE_FLOAT,min_fee);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_15_142_Request : BaseRequest, IRequest<pubL_15_142_Response>
    {
        public pubL_15_142_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.15.142";
            }
        }

        public int exch_no { get; set; }
        public int contrc_type { get; set; }
        public int fee_no { get; set; }
        public double amt_ratio { get; set; }
        public double amt_value { get; set; }
        public double par_value_ratio { get; set; }
        public double par_value_value { get; set; }
        public double max_fee { get; set; }
        public double min_fee { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("contrc_type", 'I', contrc_type);
            packer.AddField("fee_no", 'I', fee_no);
            packer.AddField("amt_ratio", 'D', amt_ratio);
            packer.AddField("amt_value", 'D', amt_value);
            packer.AddField("par_value_ratio", 'D', par_value_ratio);
            packer.AddField("par_value_value", 'D', par_value_value);
            packer.AddField("max_fee", 'D', max_fee);
            packer.AddField("min_fee", 'D', min_fee);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT,contrc_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_NO_INT,fee_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_RATIO_FLOAT,amt_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_VALUE_FLOAT,amt_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_RATIO_FLOAT,par_value_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_VALUE_FLOAT,par_value_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_FEE_FLOAT,max_fee);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_FEE_FLOAT,min_fee);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_15_143_Request : BaseRequest, IRequest<pubL_15_143_Response>
    {
        public pubL_15_143_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.15.143";
            }
        }

        public int exch_no { get; set; }
        public int contrc_type { get; set; }
        public int fee_no { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("contrc_type", 'I', contrc_type);
            packer.AddField("fee_no", 'I', fee_no);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT,contrc_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_NO_INT,fee_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_15_144_Request : BaseRequest, IRequest<pubL_15_144_Response>
    {
        public pubL_15_144_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.15.144";
            }
        }

        public String exch_no_str { get; set; }
        public String contrc_type_str { get; set; }
        public String fee_no_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("contrc_type_str", 'S', contrc_type_str);
            packer.AddField("fee_no_str", 'S', fee_no_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_STR_STR,contrc_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FEE_NO_STR_STR,fee_no_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_15_145_Request : BaseRequest, IRequest<pubL_15_145_Response>
    {
        public pubL_15_145_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.15.145";
            }
        }

        public String exch_no_str { get; set; }
        public String contrc_type_str { get; set; }
        public String fee_no_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("contrc_type_str", 'S', contrc_type_str);
            packer.AddField("fee_no_str", 'S', fee_no_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_STR_STR,contrc_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FEE_NO_STR_STR,fee_no_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_15_146_Request : BaseRequest, IRequest<pubL_15_146_Response>
    {
        public pubL_15_146_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.15.146";
            }
        }

        public int begin_date { get; set; }
        public int end_date { get; set; }
        public String exch_no_str { get; set; }
        public String contrc_type_str { get; set; }
        public String fee_no_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("contrc_type_str", 'S', contrc_type_str);
            packer.AddField("fee_no_str", 'S', fee_no_str);
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
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_STR_STR,contrc_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FEE_NO_STR_STR,fee_no_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_15_151_Request : BaseRequest, IRequest<pubL_15_151_Response>
    {
        public pubL_15_151_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.15.151";
            }
        }

        public int exch_no { get; set; }
        public String contrc_code { get; set; }
        public int futu_fee_type { get; set; }
        public int order_dir { get; set; }
        public int contrc_dir { get; set; }
        public double amt_ratio { get; set; }
        public double amt_value { get; set; }
        public double par_value_ratio { get; set; }
        public double par_value_value { get; set; }
        public double max_fee { get; set; }
        public double min_fee { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("contrc_code", 'S', contrc_code);
            packer.AddField("futu_fee_type", 'I', futu_fee_type);
            packer.AddField("order_dir", 'I', order_dir);
            packer.AddField("contrc_dir", 'I', contrc_dir);
            packer.AddField("amt_ratio", 'D', amt_ratio);
            packer.AddField("amt_value", 'D', amt_value);
            packer.AddField("par_value_ratio", 'D', par_value_ratio);
            packer.AddField("par_value_value", 'D', par_value_value);
            packer.AddField("max_fee", 'D', max_fee);
            packer.AddField("min_fee", 'D', min_fee);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR,contrc_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_FEE_TYPE_INT,futu_fee_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT,order_dir);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_DIR_INT,contrc_dir);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_RATIO_FLOAT,amt_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_VALUE_FLOAT,amt_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_RATIO_FLOAT,par_value_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_VALUE_FLOAT,par_value_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_FEE_FLOAT,max_fee);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_FEE_FLOAT,min_fee);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_15_152_Request : BaseRequest, IRequest<pubL_15_152_Response>
    {
        public pubL_15_152_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.15.152";
            }
        }

        public int exch_no { get; set; }
        public int contrc_code_no { get; set; }
        public int fee_no { get; set; }
        public double amt_ratio { get; set; }
        public double amt_value { get; set; }
        public double par_value_ratio { get; set; }
        public double par_value_value { get; set; }
        public double max_fee { get; set; }
        public double min_fee { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("contrc_code_no", 'I', contrc_code_no);
            packer.AddField("fee_no", 'I', fee_no);
            packer.AddField("amt_ratio", 'D', amt_ratio);
            packer.AddField("amt_value", 'D', amt_value);
            packer.AddField("par_value_ratio", 'D', par_value_ratio);
            packer.AddField("par_value_value", 'D', par_value_value);
            packer.AddField("max_fee", 'D', max_fee);
            packer.AddField("min_fee", 'D', min_fee);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_NO_INT,fee_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_RATIO_FLOAT,amt_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_VALUE_FLOAT,amt_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_RATIO_FLOAT,par_value_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_VALUE_FLOAT,par_value_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_FEE_FLOAT,max_fee);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_FEE_FLOAT,min_fee);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_15_153_Request : BaseRequest, IRequest<pubL_15_153_Response>
    {
        public pubL_15_153_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.15.153";
            }
        }

        public int exch_no { get; set; }
        public int contrc_code_no { get; set; }
        public int fee_no { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("contrc_code_no", 'I', contrc_code_no);
            packer.AddField("fee_no", 'I', fee_no);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_NO_INT,fee_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_15_154_Request : BaseRequest, IRequest<pubL_15_154_Response>
    {
        public pubL_15_154_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.15.154";
            }
        }

        public String exch_no_str { get; set; }
        public int contrc_code_no { get; set; }
        public String fee_no_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("contrc_code_no", 'I', contrc_code_no);
            packer.AddField("fee_no_str", 'S', fee_no_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FEE_NO_STR_STR,fee_no_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_15_155_Request : BaseRequest, IRequest<pubL_15_155_Response>
    {
        public pubL_15_155_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.15.155";
            }
        }

        public String exch_no_str { get; set; }
        public int contrc_code_no { get; set; }
        public String fee_no_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("contrc_code_no", 'I', contrc_code_no);
            packer.AddField("fee_no_str", 'S', fee_no_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FEE_NO_STR_STR,fee_no_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_15_156_Request : BaseRequest, IRequest<pubL_15_156_Response>
    {
        public pubL_15_156_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.15.156";
            }
        }

        public int begin_date { get; set; }
        public int end_date { get; set; }
        public String exch_no_str { get; set; }
        public int contrc_code_no { get; set; }
        public String fee_no_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("contrc_code_no", 'I', contrc_code_no);
            packer.AddField("fee_no_str", 'S', fee_no_str);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FEE_NO_STR_STR,fee_no_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_15_203_Request : BaseRequest, IRequest<pubL_15_203_Response>
    {
        public pubL_15_203_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.15.203";
            }
        }

        public int pass_no { get; set; }
        public int asset_acco_no { get; set; }
        public int contrc_code_no { get; set; }
        public int exch_no { get; set; }
        public int contrc_type { get; set; }
        public int order_dir { get; set; }
        public int contrc_dir { get; set; }
        public double fee_qty { get; set; }
        public double order_qty { get; set; }
        public double wtdraw_qty { get; set; }
        public double fee_price { get; set; }
        public int contrc_unit { get; set; }
        public int hedge_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("contrc_code_no", 'I', contrc_code_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("contrc_type", 'I', contrc_type);
            packer.AddField("order_dir", 'I', order_dir);
            packer.AddField("contrc_dir", 'I', contrc_dir);
            packer.AddField("fee_qty", 'D', fee_qty);
            packer.AddField("order_qty", 'D', order_qty);
            packer.AddField("wtdraw_qty", 'D', wtdraw_qty);
            packer.AddField("fee_price", 'D', fee_price);
            packer.AddField("contrc_unit", 'I', contrc_unit);
            packer.AddField("hedge_type", 'I', hedge_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT,contrc_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT,order_dir);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_DIR_INT,contrc_dir);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FEE_QTY_FLOAT,fee_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT,order_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_QTY_FLOAT,wtdraw_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FEE_PRICE_FLOAT,fee_price);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_UNIT_INT,contrc_unit);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT,hedge_type);
            return fastMsg;
        }
   }

    public class pubL_15_302_Request : BaseRequest, IRequest<pubL_15_302_Response>
    {
        public pubL_15_302_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.15.302";
            }
        }

        public int fee_no { get; set; }
        public int futu_fee_type { get; set; }
        public int order_dir { get; set; }
        public int contrc_dir { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("fee_no", 'I', fee_no);
            packer.AddField("futu_fee_type", 'I', futu_fee_type);
            packer.AddField("order_dir", 'I', order_dir);
            packer.AddField("contrc_dir", 'I', contrc_dir);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_NO_INT,fee_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_FEE_TYPE_INT,futu_fee_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT,order_dir);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_DIR_INT,contrc_dir);
            return fastMsg;
        }
   }

    public class pubL_15_303_Request : BaseRequest, IRequest<pubL_15_303_Response>
    {
        public pubL_15_303_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.15.303";
            }
        }

        public int co_no { get; set; }
        public int busi_opor_no { get; set; }
        public int asset_acco_no { get; set; }
        public int futu_code_fee_tmplat_no { get; set; }
        public int futu_type_fee_tmplat_no { get; set; }
        public int futu_code_out_fee_tmplat_no { get; set; }
        public int futu_type_out_fee_tmplat_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("busi_opor_no", 'I', busi_opor_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("futu_code_fee_tmplat_no", 'I', futu_code_fee_tmplat_no);
            packer.AddField("futu_type_fee_tmplat_no", 'I', futu_type_fee_tmplat_no);
            packer.AddField("futu_code_out_fee_tmplat_no", 'I', futu_code_out_fee_tmplat_no);
            packer.AddField("futu_type_out_fee_tmplat_no", 'I', futu_type_out_fee_tmplat_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT,busi_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_CODE_FEE_TMPLAT_NO_INT,futu_code_fee_tmplat_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_TYPE_FEE_TMPLAT_NO_INT,futu_type_fee_tmplat_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_CODE_OUT_FEE_TMPLAT_NO_INT,futu_code_out_fee_tmplat_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_TYPE_OUT_FEE_TMPLAT_NO_INT,futu_type_out_fee_tmplat_no);
            return fastMsg;
        }
   }

    public class pubL_15_304_Request : BaseRequest, IRequest<pubL_15_304_Response>
    {
        public pubL_15_304_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.15.304";
            }
        }

        public int co_no { get; set; }
        public int fee_tmplat_no { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("fee_tmplat_no", 'I', fee_tmplat_no);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_INT,fee_tmplat_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_15_305_Request : BaseRequest, IRequest<pubL_15_305_Response>
    {
        public pubL_15_305_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.15.305";
            }
        }

        public int co_no { get; set; }
        public int source_fee_tmplat_no { get; set; }
        public String fee_tmplat_name { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("source_fee_tmplat_no", 'I', source_fee_tmplat_no);
            packer.AddField("fee_tmplat_name", 'S', fee_tmplat_name);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SOURCE_FEE_TMPLAT_NO_INT,source_fee_tmplat_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NAME_STR,fee_tmplat_name);
            return fastMsg;
        }
   }

    public class pubL_15_306_Request : BaseRequest, IRequest<pubL_15_306_Response>
    {
        public pubL_15_306_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.15.306";
            }
        }

        public int co_no { get; set; }
        public int busi_opor_no { get; set; }
        public int asset_acco_no { get; set; }
        public int futu_code_fee_tmplat_no { get; set; }
        public int futu_type_fee_tmplat_no { get; set; }
        public int futu_code_out_fee_tmplat_no { get; set; }
        public int futu_type_out_fee_tmplat_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("busi_opor_no", 'I', busi_opor_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("futu_code_fee_tmplat_no", 'I', futu_code_fee_tmplat_no);
            packer.AddField("futu_type_fee_tmplat_no", 'I', futu_type_fee_tmplat_no);
            packer.AddField("futu_code_out_fee_tmplat_no", 'I', futu_code_out_fee_tmplat_no);
            packer.AddField("futu_type_out_fee_tmplat_no", 'I', futu_type_out_fee_tmplat_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT,busi_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_CODE_FEE_TMPLAT_NO_INT,futu_code_fee_tmplat_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_TYPE_FEE_TMPLAT_NO_INT,futu_type_fee_tmplat_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_CODE_OUT_FEE_TMPLAT_NO_INT,futu_code_out_fee_tmplat_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_TYPE_OUT_FEE_TMPLAT_NO_INT,futu_type_out_fee_tmplat_no);
            return fastMsg;
        }
   }

    public class pubL_15_307_Request : BaseRequest, IRequest<pubL_15_307_Response>
    {
        public pubL_15_307_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.15.307";
            }
        }

        public int co_no { get; set; }
        public int busi_opor_no { get; set; }
        public int asset_acco_no { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("busi_opor_no", 'I', busi_opor_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT,busi_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_15_308_Request : BaseRequest, IRequest<pubL_15_308_Response>
    {
        public pubL_15_308_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.15.308";
            }
        }

        public int co_no { get; set; }
        public int busi_opor_no { get; set; }
        public int asset_acco_no { get; set; }
        public String futu_code_fee_tmplat_str { get; set; }
        public String futu_type_fee_tmplat_str { get; set; }
        public String futu_code_out_fee_tmplat_str { get; set; }
        public String futu_type_out_fee_tmplat_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("busi_opor_no", 'I', busi_opor_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("futu_code_fee_tmplat_str", 'S', futu_code_fee_tmplat_str);
            packer.AddField("futu_type_fee_tmplat_str", 'S', futu_type_fee_tmplat_str);
            packer.AddField("futu_code_out_fee_tmplat_str", 'S', futu_code_out_fee_tmplat_str);
            packer.AddField("futu_type_out_fee_tmplat_str", 'S', futu_type_out_fee_tmplat_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT,busi_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_CODE_FEE_TMPLAT_STR_STR,futu_code_fee_tmplat_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_TYPE_FEE_TMPLAT_STR_STR,futu_type_fee_tmplat_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_CODE_OUT_FEE_TMPLAT_STR_STR,futu_code_out_fee_tmplat_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_TYPE_OUT_FEE_TMPLAT_STR_STR,futu_type_out_fee_tmplat_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

}
