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
    public class rptL_2_1_Request : BaseRequest, IRequest<rptL_2_1_Response>
    {
        public rptL_2_1_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.1";
            }
        }

        public int input_date { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("input_date", 'I', input_date);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INPUT_DATE_INT,input_date);
            return fastMsg;
        }
   }

    public class rptL_2_2_Request : BaseRequest, IRequest<rptL_2_2_Response>
    {
        public rptL_2_2_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.2";
            }
        }

        public int pd_no { get; set; }
        public int pd_type { get; set; }
        public String pd_status_str { get; set; }
        public int borker_no { get; set; }
        public int broker_my_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("pd_type", 'I', pd_type);
            packer.AddField("pd_status_str", 'S', pd_status_str);
            packer.AddField("borker_no", 'I', borker_no);
            packer.AddField("broker_my_type", 'I', broker_my_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_TYPE_INT,pd_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_STATUS_STR_STR,pd_status_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BORKER_NO_INT,borker_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BROKER_MY_TYPE_INT,broker_my_type);
            return fastMsg;
        }
   }

    public class rptL_2_3_Request : BaseRequest, IRequest<rptL_2_3_Response>
    {
        public rptL_2_3_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.3";
            }
        }

        public int co_no { get; set; }
        public String pd_code { get; set; }
        public double risk_free_interest_rate { get; set; }
        public double follow_share { get; set; }
        public double warn_value { get; set; }
        public double stop_value { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_code", 'S', pd_code);
            packer.AddField("risk_free_interest_rate", 'D', risk_free_interest_rate);
            packer.AddField("follow_share", 'D', follow_share);
            packer.AddField("warn_value", 'D', warn_value);
            packer.AddField("stop_value", 'D', stop_value);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR,pd_code);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RISK_FREE_INTEREST_RATE_FLOAT,risk_free_interest_rate);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FOLLOW_SHARE_FLOAT,follow_share);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WARN_VALUE_FLOAT,warn_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOP_VALUE_FLOAT,stop_value);
            return fastMsg;
        }
   }

    public class rptL_2_4_Request : BaseRequest, IRequest<rptL_2_4_Response>
    {
        public rptL_2_4_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.4";
            }
        }

        public int input_date { get; set; }
        public int co_no { get; set; }
        public String pd_code { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("input_date", 'I', input_date);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_code", 'S', pd_code);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INPUT_DATE_INT,input_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR,pd_code);
            return fastMsg;
        }
   }

    public class rptL_2_5_Request : BaseRequest, IRequest<rptL_2_5_Response>
    {
        public rptL_2_5_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.5";
            }
        }

        public int input_date { get; set; }
        public int co_no { get; set; }
        public String pd_code { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("input_date", 'I', input_date);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_code", 'S', pd_code);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INPUT_DATE_INT,input_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR,pd_code);
            return fastMsg;
        }
   }

    public class rptL_2_6_Request : BaseRequest, IRequest<rptL_2_6_Response>
    {
        public rptL_2_6_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.6";
            }
        }

        public int input_date { get; set; }
        public int co_no { get; set; }
        public String pd_code { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("input_date", 'I', input_date);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_code", 'S', pd_code);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INPUT_DATE_INT,input_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR,pd_code);
            return fastMsg;
        }
   }

    public class rptL_2_7_Request : BaseRequest, IRequest<rptL_2_7_Response>
    {
        public rptL_2_7_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.7";
            }
        }

        public int input_date { get; set; }
        public int co_no { get; set; }
        public String pd_code { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("input_date", 'I', input_date);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_code", 'S', pd_code);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INPUT_DATE_INT,input_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR,pd_code);
            return fastMsg;
        }
   }

    public class rptL_2_8_Request : BaseRequest, IRequest<rptL_2_8_Response>
    {
        public rptL_2_8_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.8";
            }
        }

        public int co_no { get; set; }
        public String pd_code { get; set; }
        public int begin_date { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_code", 'S', pd_code);
            packer.AddField("begin_date", 'I', begin_date);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR,pd_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            return fastMsg;
        }
   }

    public class rptL_2_9_Request : BaseRequest, IRequest<rptL_2_9_Response>
    {
        public rptL_2_9_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.9";
            }
        }

        public int co_no { get; set; }
        public String pd_code { get; set; }
        public int begin_date { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_code", 'S', pd_code);
            packer.AddField("begin_date", 'I', begin_date);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR,pd_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            return fastMsg;
        }
   }

    public class rptL_2_10_Request : BaseRequest, IRequest<rptL_2_10_Response>
    {
        public rptL_2_10_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.10";
            }
        }

        public int co_no { get; set; }
        public String pd_code { get; set; }
        public int begin_date { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_code", 'S', pd_code);
            packer.AddField("begin_date", 'I', begin_date);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR,pd_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            return fastMsg;
        }
   }

    public class rptL_2_11_Request : BaseRequest, IRequest<rptL_2_11_Response>
    {
        public rptL_2_11_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.11";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int begin_date { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("begin_date", 'I', begin_date);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            return fastMsg;
        }
   }

    public class rptL_2_12_Request : BaseRequest, IRequest<rptL_2_12_Response>
    {
        public rptL_2_12_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.12";
            }
        }

        public int co_no { get; set; }
        public String pd_code { get; set; }
        public int begin_date { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_code", 'S', pd_code);
            packer.AddField("begin_date", 'I', begin_date);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR,pd_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            return fastMsg;
        }
   }

    public class rptL_2_13_Request : BaseRequest, IRequest<rptL_2_13_Response>
    {
        public rptL_2_13_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.13";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int begin_date { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("begin_date", 'I', begin_date);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            return fastMsg;
        }
   }

    public class rptL_2_14_Request : BaseRequest, IRequest<rptL_2_14_Response>
    {
        public rptL_2_14_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.14";
            }
        }

        public int co_no { get; set; }
        public String pd_code { get; set; }
        public int begin_date { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_code", 'S', pd_code);
            packer.AddField("begin_date", 'I', begin_date);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR,pd_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            return fastMsg;
        }
   }

    public class rptL_2_15_Request : BaseRequest, IRequest<rptL_2_15_Response>
    {
        public rptL_2_15_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.15";
            }
        }

        public int co_no { get; set; }
        public String pd_code { get; set; }
        public int begin_date { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_code", 'S', pd_code);
            packer.AddField("begin_date", 'I', begin_date);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR,pd_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            return fastMsg;
        }
   }

    public class rptL_2_16_Request : BaseRequest, IRequest<rptL_2_16_Response>
    {
        public rptL_2_16_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.16";
            }
        }

        public int co_no { get; set; }
        public String pd_code { get; set; }
        public int begin_date { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_code", 'S', pd_code);
            packer.AddField("begin_date", 'I', begin_date);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR,pd_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            return fastMsg;
        }
   }

    public class rptL_2_17_Request : BaseRequest, IRequest<rptL_2_17_Response>
    {
        public rptL_2_17_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.17";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int begin_date { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("begin_date", 'I', begin_date);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            return fastMsg;
        }
   }

    public class rptL_2_18_Request : BaseRequest, IRequest<rptL_2_18_Response>
    {
        public rptL_2_18_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.18";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int begin_date { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("begin_date", 'I', begin_date);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            return fastMsg;
        }
   }

    public class rptL_2_19_Request : BaseRequest, IRequest<rptL_2_19_Response>
    {
        public rptL_2_19_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.19";
            }
        }

        public int init_date { get; set; }
        public int pd_no { get; set; }
        public int co_no { get; set; }
        public String pd_code { get; set; }
        public String pd_name { get; set; }
        public String pd_flname { get; set; }
        public String pd_manager { get; set; }
        public int found_date { get; set; }
        public int pd_type { get; set; }
        public String apply_currency { get; set; }
        public String crncy_type { get; set; }
        public double first_asset { get; set; }
        public double first_amt { get; set; }
        public double pd_all_share { get; set; }
        public double curr_share { get; set; }
        public double pre_share { get; set; }
        public double his_max_per_nav { get; set; }
        public double pre_nav { get; set; }
        public String coust_full_name { get; set; }
        public String coust_acco { get; set; }
        public String coust_acco_name { get; set; }
        public String pd_status { get; set; }
        public String remark_info { get; set; }
        public int cost_calc_type { get; set; }
        public double risk_free_interest_rate { get; set; }
        public String allow_exch { get; set; }
        public int sys_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("init_date", 'I', init_date);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_code", 'S', pd_code);
            packer.AddField("pd_name", 'S', pd_name);
            packer.AddField("pd_flname", 'S', pd_flname);
            packer.AddField("pd_manager", 'S', pd_manager);
            packer.AddField("found_date", 'I', found_date);
            packer.AddField("pd_type", 'I', pd_type);
            packer.AddField("apply_currency", 'S', apply_currency);
            packer.AddField("crncy_type", 'S', crncy_type);
            packer.AddField("first_asset", 'D', first_asset);
            packer.AddField("first_amt", 'D', first_amt);
            packer.AddField("pd_all_share", 'D', pd_all_share);
            packer.AddField("curr_share", 'D', curr_share);
            packer.AddField("pre_share", 'D', pre_share);
            packer.AddField("his_max_per_nav", 'D', his_max_per_nav);
            packer.AddField("pre_nav", 'D', pre_nav);
            packer.AddField("coust_full_name", 'S', coust_full_name);
            packer.AddField("coust_acco", 'S', coust_acco);
            packer.AddField("coust_acco_name", 'S', coust_acco_name);
            packer.AddField("pd_status", 'S', pd_status);
            packer.AddField("remark_info", 'S', remark_info);
            packer.AddField("cost_calc_type", 'I', cost_calc_type);
            packer.AddField("risk_free_interest_rate", 'D', risk_free_interest_rate);
            packer.AddField("allow_exch", 'S', allow_exch);
            packer.AddField("sys_no", 'I', sys_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR,pd_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR,pd_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_FLNAME_STR,pd_flname);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_MANAGER_STR,pd_manager);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FOUND_DATE_INT,found_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_TYPE_INT,pd_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_APPLY_CURRENCY_STR,apply_currency);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FIRST_ASSET_FLOAT,first_asset);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FIRST_AMT_FLOAT,first_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_ALL_SHARE_FLOAT,pd_all_share);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_SHARE_FLOAT,curr_share);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SHARE_FLOAT,pre_share);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HIS_MAX_PER_NAV_FLOAT,his_max_per_nav);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_NAV_FLOAT,pre_nav);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COUST_FULL_NAME_STR,coust_full_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COUST_ACCO_STR,coust_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COUST_ACCO_NAME_STR,coust_acco_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_STATUS_STR,pd_status);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COST_CALC_TYPE_INT,cost_calc_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RISK_FREE_INTEREST_RATE_FLOAT,risk_free_interest_rate);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_EXCH_STR,allow_exch);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SYS_NO_INT,sys_no);
            return fastMsg;
        }
   }

    public class rptL_2_21_Request : BaseRequest, IRequest<rptL_2_21_Response>
    {
        public rptL_2_21_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.21";
            }
        }

        public int industry_std { get; set; }
        public int industry_classification { get; set; }
        public int industry_id { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("industry_std", 'I', industry_std);
            packer.AddField("industry_classification", 'I', industry_classification);
            packer.AddField("industry_id", 'I', industry_id);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDUSTRY_STD_INT,industry_std);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDUSTRY_CLASSIFICATION_INT,industry_classification);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDUSTRY_ID_INT,industry_id);
            return fastMsg;
        }
   }

    public class rptL_2_22_Request : BaseRequest, IRequest<rptL_2_22_Response>
    {
        public rptL_2_22_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.22";
            }
        }

        public int exch_no { get; set; }
        public int stock_code_no { get; set; }
        public int stock_type { get; set; }
        public int asset_type { get; set; }
        public int industry_std { get; set; }
        public int industry_classification { get; set; }
        public int industry_id { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("stock_type", 'I', stock_type);
            packer.AddField("asset_type", 'I', asset_type);
            packer.AddField("industry_std", 'I', industry_std);
            packer.AddField("industry_classification", 'I', industry_classification);
            packer.AddField("industry_id", 'I', industry_id);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT,stock_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT,asset_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDUSTRY_STD_INT,industry_std);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDUSTRY_CLASSIFICATION_INT,industry_classification);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDUSTRY_ID_INT,industry_id);
            return fastMsg;
        }
   }

    public class rptL_2_50_Request : BaseRequest, IRequest<rptL_2_50_Response>
    {
        public rptL_2_50_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.50";
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

    public class rptL_2_51_Request : BaseRequest, IRequest<rptL_2_51_Response>
    {
        public rptL_2_51_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.51";
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

    public class rptL_2_52_Request : BaseRequest, IRequest<rptL_2_52_Response>
    {
        public rptL_2_52_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.52";
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

    public class rptL_2_53_Request : BaseRequest, IRequest<rptL_2_53_Response>
    {
        public rptL_2_53_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.53";
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

    public class rptL_2_54_Request : BaseRequest, IRequest<rptL_2_54_Response>
    {
        public rptL_2_54_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.54";
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

    public class rptL_2_55_Request : BaseRequest, IRequest<rptL_2_55_Response>
    {
        public rptL_2_55_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.55";
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

    public class rptL_2_56_Request : BaseRequest, IRequest<rptL_2_56_Response>
    {
        public rptL_2_56_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.56";
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

    public class rptL_2_61_Request : BaseRequest, IRequest<rptL_2_61_Response>
    {
        public rptL_2_61_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.61";
            }
        }

        public int def_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("def_type", 'I', def_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEF_TYPE_INT,def_type);
            return fastMsg;
        }
   }

    public class rptL_2_62_Request : BaseRequest, IRequest<rptL_2_62_Response>
    {
        public rptL_2_62_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.62";
            }
        }

        public int input_date { get; set; }
        public int pd_no { get; set; }
        public int def_asset_type { get; set; }
        public int def_type { get; set; }
        public int def_asset_field { get; set; }
        public double asset_value { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("input_date", 'I', input_date);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("def_asset_type", 'I', def_asset_type);
            packer.AddField("def_type", 'I', def_type);
            packer.AddField("def_asset_field", 'I', def_asset_field);
            packer.AddField("asset_value", 'D', asset_value);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INPUT_DATE_INT,input_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEF_ASSET_TYPE_INT,def_asset_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEF_TYPE_INT,def_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEF_ASSET_FIELD_INT,def_asset_field);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_VALUE_FLOAT,asset_value);
            return fastMsg;
        }
   }

    public class rptL_2_63_Request : BaseRequest, IRequest<rptL_2_63_Response>
    {
        public rptL_2_63_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.63";
            }
        }

        public int input_date { get; set; }
        public int pd_no { get; set; }
        public int def_asset_type { get; set; }
        public int def_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("input_date", 'I', input_date);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("def_asset_type", 'I', def_asset_type);
            packer.AddField("def_type", 'I', def_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INPUT_DATE_INT,input_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEF_ASSET_TYPE_INT,def_asset_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEF_TYPE_INT,def_type);
            return fastMsg;
        }
   }

    public class rptL_2_64_Request : BaseRequest, IRequest<rptL_2_64_Response>
    {
        public rptL_2_64_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.64";
            }
        }

        public int input_date { get; set; }
        public int pd_no { get; set; }
        public int def_asset_type { get; set; }
        public int def_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("input_date", 'I', input_date);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("def_asset_type", 'I', def_asset_type);
            packer.AddField("def_type", 'I', def_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INPUT_DATE_INT,input_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEF_ASSET_TYPE_INT,def_asset_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEF_TYPE_INT,def_type);
            return fastMsg;
        }
   }

    public class rptL_2_65_Request : BaseRequest, IRequest<rptL_2_65_Response>
    {
        public rptL_2_65_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.65";
            }
        }

        public int input_date { get; set; }
        public int pd_no { get; set; }
        public int def_asset_type { get; set; }
        public int def_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("input_date", 'I', input_date);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("def_asset_type", 'I', def_asset_type);
            packer.AddField("def_type", 'I', def_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INPUT_DATE_INT,input_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEF_ASSET_TYPE_INT,def_asset_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEF_TYPE_INT,def_type);
            return fastMsg;
        }
   }

    public class rptL_2_66_Request : BaseRequest, IRequest<rptL_2_66_Response>
    {
        public rptL_2_66_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.66";
            }
        }

        public int def_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("def_type", 'I', def_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEF_TYPE_INT,def_type);
            return fastMsg;
        }
   }

    public class rptL_2_67_Request : BaseRequest, IRequest<rptL_2_67_Response>
    {
        public rptL_2_67_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.67";
            }
        }

        public int input_date { get; set; }
        public int pd_no { get; set; }
        public String sql_grp_no_str { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("input_date", 'I', input_date);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("sql_grp_no_str", 'S', sql_grp_no_str);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INPUT_DATE_INT,input_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_SQL_GRP_NO_STR_STR,sql_grp_no_str);
            return fastMsg;
        }
   }

    public class rptL_2_68_Request : BaseRequest, IRequest<rptL_2_68_Response>
    {
        public rptL_2_68_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.68";
            }
        }

        public int cmd_id { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("cmd_id", 'I', cmd_id);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CMD_ID_INT,cmd_id);
            return fastMsg;
        }
   }

    public class rptL_2_69_Request : BaseRequest, IRequest<rptL_2_69_Response>
    {
        public rptL_2_69_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.69";
            }
        }

        public int sync_no { get; set; }
        public String sync_name { get; set; }
        public String target_db_name { get; set; }
        public String target_table_name { get; set; }
        public String source_db_name { get; set; }
        public String source_table_name { get; set; }
        public int sync_type { get; set; }
        public int sync_status { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("sync_no", 'I', sync_no);
            packer.AddField("sync_name", 'S', sync_name);
            packer.AddField("target_db_name", 'S', target_db_name);
            packer.AddField("target_table_name", 'S', target_table_name);
            packer.AddField("source_db_name", 'S', source_db_name);
            packer.AddField("source_table_name", 'S', source_table_name);
            packer.AddField("sync_type", 'I', sync_type);
            packer.AddField("sync_status", 'I', sync_status);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SYNC_NO_INT,sync_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_SYNC_NAME_STR,sync_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_DB_NAME_STR,target_db_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_TABLE_NAME_STR,target_table_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_SOURCE_DB_NAME_STR,source_db_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_SOURCE_TABLE_NAME_STR,source_table_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SYNC_TYPE_INT,sync_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SYNC_STATUS_INT,sync_status);
            return fastMsg;
        }
   }

    public class rptL_2_100_Request : BaseRequest, IRequest<rptL_2_100_Response>
    {
        public rptL_2_100_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.100";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int last_init_date { get; set; }
        public int init_date { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("last_init_date", 'I', last_init_date);
            packer.AddField("init_date", 'I', init_date);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LAST_INIT_DATE_INT,last_init_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            return fastMsg;
        }
   }

    public class rptL_2_101_Request : BaseRequest, IRequest<rptL_2_101_Response>
    {
        public rptL_2_101_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.101";
            }
        }

        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public double first_asset { get; set; }
        public double first_amt { get; set; }
        public double curr_share { get; set; }
        public int strategy_type { get; set; }
        public double total_pre_fee { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("first_asset", 'D', first_asset);
            packer.AddField("first_amt", 'D', first_amt);
            packer.AddField("curr_share", 'D', curr_share);
            packer.AddField("strategy_type", 'I', strategy_type);
            packer.AddField("total_pre_fee", 'D', total_pre_fee);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FIRST_ASSET_FLOAT,first_asset);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FIRST_AMT_FLOAT,first_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_SHARE_FLOAT,curr_share);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_TYPE_INT,strategy_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_PRE_FEE_FLOAT,total_pre_fee);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class rptL_2_151_Request : BaseRequest, IRequest<rptL_2_151_Response>
    {
        public rptL_2_151_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.151";
            }
        }

        public int pd_no { get; set; }
        public int curr_month { get; set; }
        public int region_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("curr_month", 'I', curr_month);
            packer.AddField("region_type", 'I', region_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONTH_INT,curr_month);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REGION_TYPE_INT,region_type);
            return fastMsg;
        }
   }

    public class rptL_2_152_Request : BaseRequest, IRequest<rptL_2_152_Response>
    {
        public rptL_2_152_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.152";
            }
        }

        public int indicator_id { get; set; }
        public int curr_month { get; set; }
        public int region_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("indicator_id", 'I', indicator_id);
            packer.AddField("curr_month", 'I', curr_month);
            packer.AddField("region_type", 'I', region_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDICATOR_ID_INT,indicator_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONTH_INT,curr_month);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REGION_TYPE_INT,region_type);
            return fastMsg;
        }
   }

    public class rptL_2_153_Request : BaseRequest, IRequest<rptL_2_153_Response>
    {
        public rptL_2_153_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.153";
            }
        }

        public int pd_no { get; set; }
        public int curr_month { get; set; }
        public int region_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("curr_month", 'I', curr_month);
            packer.AddField("region_type", 'I', region_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONTH_INT,curr_month);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REGION_TYPE_INT,region_type);
            return fastMsg;
        }
   }

    public class rptL_2_154_Request : BaseRequest, IRequest<rptL_2_154_Response>
    {
        public rptL_2_154_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.154";
            }
        }

        public int pd_no { get; set; }
        public int curr_month { get; set; }
        public int region_type { get; set; }
        public int indicator_id { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("curr_month", 'I', curr_month);
            packer.AddField("region_type", 'I', region_type);
            packer.AddField("indicator_id", 'I', indicator_id);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONTH_INT,curr_month);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REGION_TYPE_INT,region_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDICATOR_ID_INT,indicator_id);
            return fastMsg;
        }
   }

    public class rptL_2_155_Request : BaseRequest, IRequest<rptL_2_155_Response>
    {
        public rptL_2_155_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.155";
            }
        }

        public String stock_code { get; set; }
        public int exch_no { get; set; }
        public int curr_month { get; set; }
        public int region_type { get; set; }
        public int indicator_id { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("curr_month", 'I', curr_month);
            packer.AddField("region_type", 'I', region_type);
            packer.AddField("indicator_id", 'I', indicator_id);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONTH_INT,curr_month);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REGION_TYPE_INT,region_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDICATOR_ID_INT,indicator_id);
            return fastMsg;
        }
   }

    public class rptL_2_156_Request : BaseRequest, IRequest<rptL_2_156_Response>
    {
        public rptL_2_156_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.156";
            }
        }

        public int pd_no { get; set; }
        public int curr_month { get; set; }
        public int region_type { get; set; }
        public int indicator_id { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("curr_month", 'I', curr_month);
            packer.AddField("region_type", 'I', region_type);
            packer.AddField("indicator_id", 'I', indicator_id);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONTH_INT,curr_month);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REGION_TYPE_INT,region_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDICATOR_ID_INT,indicator_id);
            return fastMsg;
        }
   }

    public class rptL_2_157_Request : BaseRequest, IRequest<rptL_2_157_Response>
    {
        public rptL_2_157_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.157";
            }
        }

        public int init_date { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public double share_net { get; set; }
        public double last_share_net { get; set; }
        public double share_net_total { get; set; }
        public double pre_share_net_total { get; set; }
        public double net_change { get; set; }
        public ulong grp_row { get; set; }
        public double nav_asset { get; set; }
        public double asset_market_value { get; set; }
        public double fund_share_total { get; set; }
        public double fund_asset_net { get; set; }
        public double pre_fee_share_net_total { get; set; }
        public double post_fee_share_net_total { get; set; }
        public double achieve_performance { get; set; }
        public double recover_param { get; set; }
        public int last_init_date { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("init_date", 'I', init_date);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("share_net", 'D', share_net);
            packer.AddField("last_share_net", 'D', last_share_net);
            packer.AddField("share_net_total", 'D', share_net_total);
            packer.AddField("pre_share_net_total", 'D', pre_share_net_total);
            packer.AddField("net_change", 'D', net_change);
            packer.AddField("grp_row", 'L', grp_row);
            packer.AddField("nav_asset", 'D', nav_asset);
            packer.AddField("asset_market_value", 'D', asset_market_value);
            packer.AddField("fund_share_total", 'D', fund_share_total);
            packer.AddField("fund_asset_net", 'D', fund_asset_net);
            packer.AddField("pre_fee_share_net_total", 'D', pre_fee_share_net_total);
            packer.AddField("post_fee_share_net_total", 'D', post_fee_share_net_total);
            packer.AddField("achieve_performance", 'D', achieve_performance);
            packer.AddField("recover_param", 'D', recover_param);
            packer.AddField("last_init_date", 'I', last_init_date);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SHARE_NET_FLOAT,share_net);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_SHARE_NET_FLOAT,last_share_net);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SHARE_NET_TOTAL_FLOAT,share_net_total);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SHARE_NET_TOTAL_FLOAT,pre_share_net_total);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NET_CHANGE_FLOAT,net_change);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_GRP_ROW_INT64,grp_row);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT,nav_asset);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_MARKET_VALUE_FLOAT,asset_market_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_SHARE_TOTAL_FLOAT,fund_share_total);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_ASSET_NET_FLOAT,fund_asset_net);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_FEE_SHARE_NET_TOTAL_FLOAT,pre_fee_share_net_total);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POST_FEE_SHARE_NET_TOTAL_FLOAT,post_fee_share_net_total);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACHIEVE_PERFORMANCE_FLOAT,achieve_performance);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RECOVER_PARAM_FLOAT,recover_param);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LAST_INIT_DATE_INT,last_init_date);
            return fastMsg;
        }
   }

    public class rptL_2_158_Request : BaseRequest, IRequest<rptL_2_158_Response>
    {
        public rptL_2_158_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.158";
            }
        }

        public int init_date { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("init_date", 'I', init_date);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            return fastMsg;
        }
   }

    public class rptL_2_159_Request : BaseRequest, IRequest<rptL_2_159_Response>
    {
        public rptL_2_159_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.159";
            }
        }

        public int init_date { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public double share_net { get; set; }
        public double last_share_net { get; set; }
        public double share_net_total { get; set; }
        public double pre_share_net_total { get; set; }
        public double net_change { get; set; }
        public ulong grp_row { get; set; }
        public double nav_asset { get; set; }
        public double asset_market_value { get; set; }
        public double fund_share_total { get; set; }
        public double fund_asset_net { get; set; }
        public double pre_fee_share_net_total { get; set; }
        public double post_fee_share_net_total { get; set; }
        public double achieve_performance { get; set; }
        public double recover_param { get; set; }
        public int last_init_date { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("init_date", 'I', init_date);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("share_net", 'D', share_net);
            packer.AddField("last_share_net", 'D', last_share_net);
            packer.AddField("share_net_total", 'D', share_net_total);
            packer.AddField("pre_share_net_total", 'D', pre_share_net_total);
            packer.AddField("net_change", 'D', net_change);
            packer.AddField("grp_row", 'L', grp_row);
            packer.AddField("nav_asset", 'D', nav_asset);
            packer.AddField("asset_market_value", 'D', asset_market_value);
            packer.AddField("fund_share_total", 'D', fund_share_total);
            packer.AddField("fund_asset_net", 'D', fund_asset_net);
            packer.AddField("pre_fee_share_net_total", 'D', pre_fee_share_net_total);
            packer.AddField("post_fee_share_net_total", 'D', post_fee_share_net_total);
            packer.AddField("achieve_performance", 'D', achieve_performance);
            packer.AddField("recover_param", 'D', recover_param);
            packer.AddField("last_init_date", 'I', last_init_date);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SHARE_NET_FLOAT,share_net);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_SHARE_NET_FLOAT,last_share_net);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SHARE_NET_TOTAL_FLOAT,share_net_total);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SHARE_NET_TOTAL_FLOAT,pre_share_net_total);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NET_CHANGE_FLOAT,net_change);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_GRP_ROW_INT64,grp_row);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT,nav_asset);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_MARKET_VALUE_FLOAT,asset_market_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_SHARE_TOTAL_FLOAT,fund_share_total);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_ASSET_NET_FLOAT,fund_asset_net);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_FEE_SHARE_NET_TOTAL_FLOAT,pre_fee_share_net_total);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POST_FEE_SHARE_NET_TOTAL_FLOAT,post_fee_share_net_total);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACHIEVE_PERFORMANCE_FLOAT,achieve_performance);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RECOVER_PARAM_FLOAT,recover_param);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LAST_INIT_DATE_INT,last_init_date);
            return fastMsg;
        }
   }

    public class rptL_2_160_Request : BaseRequest, IRequest<rptL_2_160_Response>
    {
        public rptL_2_160_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.160";
            }
        }

        public int qry_begin_date { get; set; }
        public int qry_end_date { get; set; }
        public int query_region_type { get; set; }
        public int pd_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("qry_begin_date", 'I', qry_begin_date);
            packer.AddField("qry_end_date", 'I', qry_end_date);
            packer.AddField("query_region_type", 'I', query_region_type);
            packer.AddField("pd_no", 'I', pd_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_BEGIN_DATE_INT,qry_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_END_DATE_INT,qry_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_REGION_TYPE_INT,query_region_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            return fastMsg;
        }
   }

    public class rptL_2_161_Request : BaseRequest, IRequest<rptL_2_161_Response>
    {
        public rptL_2_161_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.161";
            }
        }

        public int init_date { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("init_date", 'I', init_date);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            return fastMsg;
        }
   }

    public class rptL_2_162_Request : BaseRequest, IRequest<rptL_2_162_Response>
    {
        public rptL_2_162_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.162";
            }
        }

        public int init_date { get; set; }
        public int stock_code_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("init_date", 'I', init_date);
            packer.AddField("stock_code_no", 'I', stock_code_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            return fastMsg;
        }
   }

    public class rptL_2_163_Request : BaseRequest, IRequest<rptL_2_163_Response>
    {
        public rptL_2_163_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.163";
            }
        }

        public int init_date { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("init_date", 'I', init_date);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            return fastMsg;
        }
   }

    public class rptL_2_164_Request : BaseRequest, IRequest<rptL_2_164_Response>
    {
        public rptL_2_164_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.164";
            }
        }

        public int init_date { get; set; }
        public int stock_code_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("init_date", 'I', init_date);
            packer.AddField("stock_code_no", 'I', stock_code_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            return fastMsg;
        }
   }

    public class rptL_2_165_Request : BaseRequest, IRequest<rptL_2_165_Response>
    {
        public rptL_2_165_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.165";
            }
        }

        public int init_date { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("init_date", 'I', init_date);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            return fastMsg;
        }
   }

    public class rptL_2_166_Request : BaseRequest, IRequest<rptL_2_166_Response>
    {
        public rptL_2_166_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.166";
            }
        }

        public int init_date { get; set; }
        public int stock_code_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("init_date", 'I', init_date);
            packer.AddField("stock_code_no", 'I', stock_code_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            return fastMsg;
        }
   }

    public class rptL_2_181_Request : BaseRequest, IRequest<rptL_2_181_Response>
    {
        public rptL_2_181_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.181";
            }
        }

        public int qry_begin_date { get; set; }
        public int qry_end_date { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("qry_begin_date", 'I', qry_begin_date);
            packer.AddField("qry_end_date", 'I', qry_end_date);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_BEGIN_DATE_INT,qry_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_END_DATE_INT,qry_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            return fastMsg;
        }
   }

    public class rptL_2_182_Request : BaseRequest, IRequest<rptL_2_182_Response>
    {
        public rptL_2_182_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.182";
            }
        }

        public int qry_begin_date { get; set; }
        public int qry_end_date { get; set; }
        public int stock_code_no { get; set; }
        public String stock_code { get; set; }
        public int exch_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("qry_begin_date", 'I', qry_begin_date);
            packer.AddField("qry_end_date", 'I', qry_end_date);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("exch_no", 'I', exch_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_BEGIN_DATE_INT,qry_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_END_DATE_INT,qry_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            return fastMsg;
        }
   }

    public class rptL_2_183_Request : BaseRequest, IRequest<rptL_2_183_Response>
    {
        public rptL_2_183_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.183";
            }
        }

        public int qry_begin_date { get; set; }
        public int qry_end_date { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("qry_begin_date", 'I', qry_begin_date);
            packer.AddField("qry_end_date", 'I', qry_end_date);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_BEGIN_DATE_INT,qry_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_END_DATE_INT,qry_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            return fastMsg;
        }
   }

    public class rptL_2_184_Request : BaseRequest, IRequest<rptL_2_184_Response>
    {
        public rptL_2_184_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.184";
            }
        }

        public int qry_begin_date { get; set; }
        public int qry_end_date { get; set; }
        public int stock_code_no { get; set; }
        public String stock_code { get; set; }
        public int exch_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("qry_begin_date", 'I', qry_begin_date);
            packer.AddField("qry_end_date", 'I', qry_end_date);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("exch_no", 'I', exch_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_BEGIN_DATE_INT,qry_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_END_DATE_INT,qry_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            return fastMsg;
        }
   }

    public class rptL_2_185_Request : BaseRequest, IRequest<rptL_2_185_Response>
    {
        public rptL_2_185_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.185";
            }
        }

        public int qry_begin_date { get; set; }
        public int qry_end_date { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("qry_begin_date", 'I', qry_begin_date);
            packer.AddField("qry_end_date", 'I', qry_end_date);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_BEGIN_DATE_INT,qry_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_END_DATE_INT,qry_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            return fastMsg;
        }
   }

    public class rptL_2_186_Request : BaseRequest, IRequest<rptL_2_186_Response>
    {
        public rptL_2_186_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.186";
            }
        }

        public int qry_begin_date { get; set; }
        public int qry_end_date { get; set; }
        public int stock_code_no { get; set; }
        public String stock_code { get; set; }
        public int exch_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("qry_begin_date", 'I', qry_begin_date);
            packer.AddField("qry_end_date", 'I', qry_end_date);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("exch_no", 'I', exch_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_BEGIN_DATE_INT,qry_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_END_DATE_INT,qry_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            return fastMsg;
        }
   }

    public class rptL_2_201_Request : BaseRequest, IRequest<rptL_2_201_Response>
    {
        public rptL_2_201_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.201";
            }
        }

        public int curr_month { get; set; }
        public int indicator_id { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("curr_month", 'I', curr_month);
            packer.AddField("indicator_id", 'I', indicator_id);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONTH_INT,curr_month);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDICATOR_ID_INT,indicator_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            return fastMsg;
        }
   }

    public class rptL_2_202_Request : BaseRequest, IRequest<rptL_2_202_Response>
    {
        public rptL_2_202_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.202";
            }
        }

        public int curr_month { get; set; }
        public int indicator_id { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("curr_month", 'I', curr_month);
            packer.AddField("indicator_id", 'I', indicator_id);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONTH_INT,curr_month);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDICATOR_ID_INT,indicator_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            return fastMsg;
        }
   }

    public class rptL_2_203_Request : BaseRequest, IRequest<rptL_2_203_Response>
    {
        public rptL_2_203_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.203";
            }
        }

        public int curr_month { get; set; }
        public int indicator_id { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("curr_month", 'I', curr_month);
            packer.AddField("indicator_id", 'I', indicator_id);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONTH_INT,curr_month);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDICATOR_ID_INT,indicator_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            return fastMsg;
        }
   }

    public class rptL_2_204_Request : BaseRequest, IRequest<rptL_2_204_Response>
    {
        public rptL_2_204_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.204";
            }
        }

        public int curr_month { get; set; }
        public int indicator_id { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("curr_month", 'I', curr_month);
            packer.AddField("indicator_id", 'I', indicator_id);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONTH_INT,curr_month);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDICATOR_ID_INT,indicator_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            return fastMsg;
        }
   }

    public class rptL_2_205_Request : BaseRequest, IRequest<rptL_2_205_Response>
    {
        public rptL_2_205_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.205";
            }
        }

        public int curr_month { get; set; }
        public int indicator_id { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("curr_month", 'I', curr_month);
            packer.AddField("indicator_id", 'I', indicator_id);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONTH_INT,curr_month);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDICATOR_ID_INT,indicator_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            return fastMsg;
        }
   }

    public class rptL_2_206_Request : BaseRequest, IRequest<rptL_2_206_Response>
    {
        public rptL_2_206_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.206";
            }
        }

        public int curr_month { get; set; }
        public int indicator_id { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("curr_month", 'I', curr_month);
            packer.AddField("indicator_id", 'I', indicator_id);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONTH_INT,curr_month);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDICATOR_ID_INT,indicator_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            return fastMsg;
        }
   }

    public class rptL_2_207_Request : BaseRequest, IRequest<rptL_2_207_Response>
    {
        public rptL_2_207_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.207";
            }
        }

        public int curr_month { get; set; }
        public int indicator_id { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("curr_month", 'I', curr_month);
            packer.AddField("indicator_id", 'I', indicator_id);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONTH_INT,curr_month);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDICATOR_ID_INT,indicator_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            return fastMsg;
        }
   }

    public class rptL_2_208_Request : BaseRequest, IRequest<rptL_2_208_Response>
    {
        public rptL_2_208_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.208";
            }
        }

        public int curr_month { get; set; }
        public int indicator_id { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("curr_month", 'I', curr_month);
            packer.AddField("indicator_id", 'I', indicator_id);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONTH_INT,curr_month);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDICATOR_ID_INT,indicator_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            return fastMsg;
        }
   }

    public class rptL_2_209_Request : BaseRequest, IRequest<rptL_2_209_Response>
    {
        public rptL_2_209_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.209";
            }
        }

        public int curr_month { get; set; }
        public int indicator_id { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("curr_month", 'I', curr_month);
            packer.AddField("indicator_id", 'I', indicator_id);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONTH_INT,curr_month);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDICATOR_ID_INT,indicator_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            return fastMsg;
        }
   }

    public class rptL_2_210_Request : BaseRequest, IRequest<rptL_2_210_Response>
    {
        public rptL_2_210_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.210";
            }
        }

        public int curr_month { get; set; }
        public int indicator_id { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("curr_month", 'I', curr_month);
            packer.AddField("indicator_id", 'I', indicator_id);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONTH_INT,curr_month);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDICATOR_ID_INT,indicator_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            return fastMsg;
        }
   }

    public class rptL_2_211_Request : BaseRequest, IRequest<rptL_2_211_Response>
    {
        public rptL_2_211_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.211";
            }
        }

        public int pd_no { get; set; }
        public int fund_manager_no { get; set; }
        public int trader_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("fund_manager_no", 'I', fund_manager_no);
            packer.AddField("trader_no", 'I', trader_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_NO_INT,fund_manager_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRADER_NO_INT,trader_no);
            return fastMsg;
        }
   }

    public class rptL_2_301_Request : BaseRequest, IRequest<rptL_2_301_Response>
    {
        public rptL_2_301_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.301";
            }
        }

        public int qry_begin_date { get; set; }
        public int qry_end_date { get; set; }
        public int query_region_type { get; set; }
        public int pd_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("qry_begin_date", 'I', qry_begin_date);
            packer.AddField("qry_end_date", 'I', qry_end_date);
            packer.AddField("query_region_type", 'I', query_region_type);
            packer.AddField("pd_no", 'I', pd_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_BEGIN_DATE_INT,qry_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_END_DATE_INT,qry_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_REGION_TYPE_INT,query_region_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            return fastMsg;
        }
   }

    public class rptL_2_302_Request : BaseRequest, IRequest<rptL_2_302_Response>
    {
        public rptL_2_302_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.302";
            }
        }

        public int qry_begin_date { get; set; }
        public int qry_end_date { get; set; }
        public int query_region_type { get; set; }
        public int pd_no { get; set; }
        public String stock_code { get; set; }
        public int exch_no { get; set; }
        public int stock_code_no { get; set; }
        public int stock_type { get; set; }
        public int asset_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("qry_begin_date", 'I', qry_begin_date);
            packer.AddField("qry_end_date", 'I', qry_end_date);
            packer.AddField("query_region_type", 'I', query_region_type);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("stock_type", 'I', stock_type);
            packer.AddField("asset_type", 'I', asset_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_BEGIN_DATE_INT,qry_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_END_DATE_INT,qry_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_REGION_TYPE_INT,query_region_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT,stock_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT,asset_type);
            return fastMsg;
        }
   }

    public class rptL_2_303_Request : BaseRequest, IRequest<rptL_2_303_Response>
    {
        public rptL_2_303_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.303";
            }
        }

        public int qry_begin_date { get; set; }
        public int qry_end_date { get; set; }
        public int pd_no { get; set; }
        public int industry_std { get; set; }
        public int industry_classification { get; set; }
        public int industry_id { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("qry_begin_date", 'I', qry_begin_date);
            packer.AddField("qry_end_date", 'I', qry_end_date);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("industry_std", 'I', industry_std);
            packer.AddField("industry_classification", 'I', industry_classification);
            packer.AddField("industry_id", 'I', industry_id);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_BEGIN_DATE_INT,qry_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_END_DATE_INT,qry_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDUSTRY_STD_INT,industry_std);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDUSTRY_CLASSIFICATION_INT,industry_classification);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDUSTRY_ID_INT,industry_id);
            return fastMsg;
        }
   }

    public class rptL_2_304_Request : BaseRequest, IRequest<rptL_2_304_Response>
    {
        public rptL_2_304_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.304";
            }
        }

        public int qry_begin_date { get; set; }
        public int qry_end_date { get; set; }
        public int pd_no { get; set; }
        public int industry_std { get; set; }
        public int industry_classification { get; set; }
        public int industry_id { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("qry_begin_date", 'I', qry_begin_date);
            packer.AddField("qry_end_date", 'I', qry_end_date);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("industry_std", 'I', industry_std);
            packer.AddField("industry_classification", 'I', industry_classification);
            packer.AddField("industry_id", 'I', industry_id);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_BEGIN_DATE_INT,qry_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_END_DATE_INT,qry_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDUSTRY_STD_INT,industry_std);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDUSTRY_CLASSIFICATION_INT,industry_classification);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDUSTRY_ID_INT,industry_id);
            return fastMsg;
        }
   }

    public class rptL_2_305_Request : BaseRequest, IRequest<rptL_2_305_Response>
    {
        public rptL_2_305_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.305";
            }
        }

        public int qry_begin_date { get; set; }
        public int qry_end_date { get; set; }
        public int pd_no { get; set; }
        public int exch_no { get; set; }
        public int stock_code_no { get; set; }
        public int stock_type { get; set; }
        public int asset_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("qry_begin_date", 'I', qry_begin_date);
            packer.AddField("qry_end_date", 'I', qry_end_date);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("stock_type", 'I', stock_type);
            packer.AddField("asset_type", 'I', asset_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_BEGIN_DATE_INT,qry_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_END_DATE_INT,qry_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT,stock_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT,asset_type);
            return fastMsg;
        }
   }

    public class rptL_2_306_Request : BaseRequest, IRequest<rptL_2_306_Response>
    {
        public rptL_2_306_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.306";
            }
        }

        public int qry_begin_date { get; set; }
        public int qry_end_date { get; set; }
        public int pd_no { get; set; }
        public int exch_no { get; set; }
        public int stock_code_no { get; set; }
        public int stock_type { get; set; }
        public int asset_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("qry_begin_date", 'I', qry_begin_date);
            packer.AddField("qry_end_date", 'I', qry_end_date);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("stock_type", 'I', stock_type);
            packer.AddField("asset_type", 'I', asset_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_BEGIN_DATE_INT,qry_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_END_DATE_INT,qry_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT,stock_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT,asset_type);
            return fastMsg;
        }
   }

    public class rptL_2_307_Request : BaseRequest, IRequest<rptL_2_307_Response>
    {
        public rptL_2_307_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.307";
            }
        }

        public int qry_begin_date { get; set; }
        public int qry_end_date { get; set; }
        public int pd_no { get; set; }
        public String stock_code { get; set; }
        public int exch_no { get; set; }
        public int stock_code_no { get; set; }
        public int stock_type { get; set; }
        public int asset_type { get; set; }
        public int order_dir { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("qry_begin_date", 'I', qry_begin_date);
            packer.AddField("qry_end_date", 'I', qry_end_date);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("stock_type", 'I', stock_type);
            packer.AddField("asset_type", 'I', asset_type);
            packer.AddField("order_dir", 'I', order_dir);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_BEGIN_DATE_INT,qry_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_END_DATE_INT,qry_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT,stock_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT,asset_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT,order_dir);
            return fastMsg;
        }
   }

    public class rptL_2_308_Request : BaseRequest, IRequest<rptL_2_308_Response>
    {
        public rptL_2_308_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.308";
            }
        }

        public int qry_begin_date { get; set; }
        public int qry_end_date { get; set; }
        public int query_region_type { get; set; }
        public int pd_no { get; set; }
        public int exch_no { get; set; }
        public int stock_code_no { get; set; }
        public int stock_type { get; set; }
        public int asset_type { get; set; }
        public int order_dir { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("qry_begin_date", 'I', qry_begin_date);
            packer.AddField("qry_end_date", 'I', qry_end_date);
            packer.AddField("query_region_type", 'I', query_region_type);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("stock_type", 'I', stock_type);
            packer.AddField("asset_type", 'I', asset_type);
            packer.AddField("order_dir", 'I', order_dir);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_BEGIN_DATE_INT,qry_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_END_DATE_INT,qry_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_REGION_TYPE_INT,query_region_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT,stock_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT,asset_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT,order_dir);
            return fastMsg;
        }
   }

    public class rptL_2_309_Request : BaseRequest, IRequest<rptL_2_309_Response>
    {
        public rptL_2_309_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.309";
            }
        }

        public int qry_begin_date { get; set; }
        public int qry_end_date { get; set; }
        public int pd_no { get; set; }
        public int busi_flag { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("qry_begin_date", 'I', qry_begin_date);
            packer.AddField("qry_end_date", 'I', qry_end_date);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("busi_flag", 'I', busi_flag);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_BEGIN_DATE_INT,qry_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_END_DATE_INT,qry_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT,busi_flag);
            return fastMsg;
        }
   }

    public class rptL_2_310_Request : BaseRequest, IRequest<rptL_2_310_Response>
    {
        public rptL_2_310_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.310";
            }
        }

        public int qry_begin_date { get; set; }
        public int qry_end_date { get; set; }
        public int pd_no { get; set; }
        public int busi_flag { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("qry_begin_date", 'I', qry_begin_date);
            packer.AddField("qry_end_date", 'I', qry_end_date);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("busi_flag", 'I', busi_flag);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_BEGIN_DATE_INT,qry_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_END_DATE_INT,qry_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT,busi_flag);
            return fastMsg;
        }
   }

    public class rptL_2_311_Request : BaseRequest, IRequest<rptL_2_311_Response>
    {
        public rptL_2_311_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.311";
            }
        }

        public int qry_begin_date { get; set; }
        public int qry_end_date { get; set; }
        public int pd_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("qry_begin_date", 'I', qry_begin_date);
            packer.AddField("qry_end_date", 'I', qry_end_date);
            packer.AddField("pd_no", 'I', pd_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_BEGIN_DATE_INT,qry_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_END_DATE_INT,qry_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            return fastMsg;
        }
   }

    public class rptL_2_312_Request : BaseRequest, IRequest<rptL_2_312_Response>
    {
        public rptL_2_312_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.312";
            }
        }

        public int qry_begin_date { get; set; }
        public int qry_end_date { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int stock_code_no { get; set; }
        public int stock_type { get; set; }
        public int asset_type { get; set; }
        public int busi_flag { get; set; }
        public int act_record_flag { get; set; }
        public int acco_entry_flag { get; set; }
        public String entry_status { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("qry_begin_date", 'I', qry_begin_date);
            packer.AddField("qry_end_date", 'I', qry_end_date);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("stock_type", 'I', stock_type);
            packer.AddField("asset_type", 'I', asset_type);
            packer.AddField("busi_flag", 'I', busi_flag);
            packer.AddField("act_record_flag", 'I', act_record_flag);
            packer.AddField("acco_entry_flag", 'I', acco_entry_flag);
            packer.AddField("entry_status", 'S', entry_status);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_BEGIN_DATE_INT,qry_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_END_DATE_INT,qry_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT,stock_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT,asset_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT,busi_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ACT_RECORD_FLAG_INT,act_record_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_ENTRY_FLAG_INT,acco_entry_flag);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_STATUS_STR,entry_status);
            return fastMsg;
        }
   }

    public class rptL_2_313_Request : BaseRequest, IRequest<rptL_2_313_Response>
    {
        public rptL_2_313_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.313";
            }
        }

        public int init_date { get; set; }
        public int co_no { get; set; }
        public int fund_manager_no { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("init_date", 'I', init_date);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("fund_manager_no", 'I', fund_manager_no);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_NO_INT,fund_manager_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class rptL_2_314_Request : BaseRequest, IRequest<rptL_2_314_Response>
    {
        public rptL_2_314_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.314";
            }
        }

        public int qry_begin_date { get; set; }
        public int qry_end_date { get; set; }
        public int query_region_type { get; set; }
        public int fund_manager_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("qry_begin_date", 'I', qry_begin_date);
            packer.AddField("qry_end_date", 'I', qry_end_date);
            packer.AddField("query_region_type", 'I', query_region_type);
            packer.AddField("fund_manager_no", 'I', fund_manager_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_BEGIN_DATE_INT,qry_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_END_DATE_INT,qry_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_REGION_TYPE_INT,query_region_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_NO_INT,fund_manager_no);
            return fastMsg;
        }
   }

    public class rptL_2_315_Request : BaseRequest, IRequest<rptL_2_315_Response>
    {
        public rptL_2_315_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.315";
            }
        }

        public int init_date { get; set; }
        public int fund_manager_no { get; set; }
        public int stock_code_no { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("init_date", 'I', init_date);
            packer.AddField("fund_manager_no", 'I', fund_manager_no);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_NO_INT,fund_manager_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class rptL_2_316_Request : BaseRequest, IRequest<rptL_2_316_Response>
    {
        public rptL_2_316_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.316";
            }
        }

        public int qry_begin_date { get; set; }
        public int qry_end_date { get; set; }
        public int query_region_type { get; set; }
        public int fund_manager_no { get; set; }
        public int exch_no { get; set; }
        public int stock_code_no { get; set; }
        public int stock_type { get; set; }
        public int asset_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("qry_begin_date", 'I', qry_begin_date);
            packer.AddField("qry_end_date", 'I', qry_end_date);
            packer.AddField("query_region_type", 'I', query_region_type);
            packer.AddField("fund_manager_no", 'I', fund_manager_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("stock_type", 'I', stock_type);
            packer.AddField("asset_type", 'I', asset_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_BEGIN_DATE_INT,qry_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_END_DATE_INT,qry_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_REGION_TYPE_INT,query_region_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_NO_INT,fund_manager_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT,stock_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT,asset_type);
            return fastMsg;
        }
   }

    public class rptL_2_401_Request : BaseRequest, IRequest<rptL_2_401_Response>
    {
        public rptL_2_401_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.401";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public ulong config_no { get; set; }
        public String config_name { get; set; }
        public int show_order { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("config_no", 'L', config_no);
            packer.AddField("config_name", 'S', config_name);
            packer.AddField("show_order", 'I', show_order);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_NO_INT64,config_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_NAME_STR,config_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SHOW_ORDER_INT,show_order);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class rptL_2_402_Request : BaseRequest, IRequest<rptL_2_402_Response>
    {
        public rptL_2_402_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.402";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public ulong config_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("config_no", 'L', config_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_NO_INT64,config_no);
            return fastMsg;
        }
   }

    public class rptL_2_403_Request : BaseRequest, IRequest<rptL_2_403_Response>
    {
        public rptL_2_403_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.403";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public ulong config_no { get; set; }
        public String config_name { get; set; }
        public int show_order { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("config_no", 'L', config_no);
            packer.AddField("config_name", 'S', config_name);
            packer.AddField("show_order", 'I', show_order);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_NO_INT64,config_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_NAME_STR,config_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SHOW_ORDER_INT,show_order);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class rptL_2_404_Request : BaseRequest, IRequest<rptL_2_404_Response>
    {
        public rptL_2_404_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.404";
            }
        }

        public int pd_no { get; set; }
        public ulong config_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("config_no", 'L', config_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_NO_INT64,config_no);
            return fastMsg;
        }
   }

    public class rptL_2_406_Request : BaseRequest, IRequest<rptL_2_406_Response>
    {
        public rptL_2_406_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.406";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public String rpt_add_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("rpt_add_info", 'S', rpt_add_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RPT_ADD_INFO_STR,rpt_add_info);
            return fastMsg;
        }
   }

    public class rptL_2_407_Request : BaseRequest, IRequest<rptL_2_407_Response>
    {
        public rptL_2_407_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.407";
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

    public class rptL_2_408_Request : BaseRequest, IRequest<rptL_2_408_Response>
    {
        public rptL_2_408_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.408";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public String rpt_add_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("rpt_add_info", 'S', rpt_add_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RPT_ADD_INFO_STR,rpt_add_info);
            return fastMsg;
        }
   }

    public class rptL_2_409_Request : BaseRequest, IRequest<rptL_2_409_Response>
    {
        public rptL_2_409_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.409";
            }
        }

        public int pd_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            return fastMsg;
        }
   }

    public class rptL_2_411_Request : BaseRequest, IRequest<rptL_2_411_Response>
    {
        public rptL_2_411_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.411";
            }
        }

        public int co_no { get; set; }
        public int fund_manager_no { get; set; }
        public String fund_manager_name { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("fund_manager_no", 'I', fund_manager_no);
            packer.AddField("fund_manager_name", 'S', fund_manager_name);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_NO_INT,fund_manager_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_NAME_STR,fund_manager_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class rptL_2_412_Request : BaseRequest, IRequest<rptL_2_412_Response>
    {
        public rptL_2_412_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.412";
            }
        }

        public int co_no { get; set; }
        public int fund_manager_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("fund_manager_no", 'I', fund_manager_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_NO_INT,fund_manager_no);
            return fastMsg;
        }
   }

    public class rptL_2_413_Request : BaseRequest, IRequest<rptL_2_413_Response>
    {
        public rptL_2_413_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.413";
            }
        }

        public int co_no { get; set; }
        public int fund_manager_no { get; set; }
        public String fund_manager_name { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("fund_manager_no", 'I', fund_manager_no);
            packer.AddField("fund_manager_name", 'S', fund_manager_name);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_NO_INT,fund_manager_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_NAME_STR,fund_manager_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class rptL_2_414_Request : BaseRequest, IRequest<rptL_2_414_Response>
    {
        public rptL_2_414_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.414";
            }
        }

        public int co_no { get; set; }
        public int fund_manager_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("fund_manager_no", 'I', fund_manager_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_NO_INT,fund_manager_no);
            return fastMsg;
        }
   }

    public class rptL_2_416_Request : BaseRequest, IRequest<rptL_2_416_Response>
    {
        public rptL_2_416_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.416";
            }
        }

        public int co_no { get; set; }
        public int fund_manager_no { get; set; }
        public String fund_manager_name { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("fund_manager_no", 'I', fund_manager_no);
            packer.AddField("fund_manager_name", 'S', fund_manager_name);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_NO_INT,fund_manager_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_NAME_STR,fund_manager_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class rptL_2_417_Request : BaseRequest, IRequest<rptL_2_417_Response>
    {
        public rptL_2_417_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.417";
            }
        }

        public int co_no { get; set; }
        public int fund_manager_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("fund_manager_no", 'I', fund_manager_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_NO_INT,fund_manager_no);
            return fastMsg;
        }
   }

    public class rptL_2_418_Request : BaseRequest, IRequest<rptL_2_418_Response>
    {
        public rptL_2_418_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.418";
            }
        }

        public int co_no { get; set; }
        public int fund_manager_no { get; set; }
        public String fund_manager_name { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("fund_manager_no", 'I', fund_manager_no);
            packer.AddField("fund_manager_name", 'S', fund_manager_name);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_NO_INT,fund_manager_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_NAME_STR,fund_manager_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class rptL_2_419_Request : BaseRequest, IRequest<rptL_2_419_Response>
    {
        public rptL_2_419_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.419";
            }
        }

        public int co_no { get; set; }
        public int fund_manager_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("fund_manager_no", 'I', fund_manager_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_NO_INT,fund_manager_no);
            return fastMsg;
        }
   }

    public class rptL_2_421_Request : BaseRequest, IRequest<rptL_2_421_Response>
    {
        public rptL_2_421_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.421";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int fund_manager_no { get; set; }
        public String fund_manager_name { get; set; }
        public int trader_no { get; set; }
        public String trader_name { get; set; }
        public int show_order { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("fund_manager_no", 'I', fund_manager_no);
            packer.AddField("fund_manager_name", 'S', fund_manager_name);
            packer.AddField("trader_no", 'I', trader_no);
            packer.AddField("trader_name", 'S', trader_name);
            packer.AddField("show_order", 'I', show_order);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_NO_INT,fund_manager_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_NAME_STR,fund_manager_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRADER_NO_INT,trader_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TRADER_NAME_STR,trader_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SHOW_ORDER_INT,show_order);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class rptL_2_422_Request : BaseRequest, IRequest<rptL_2_422_Response>
    {
        public rptL_2_422_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.422";
            }
        }

        public ulong row_id { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            return fastMsg;
        }
   }

    public class rptL_2_423_Request : BaseRequest, IRequest<rptL_2_423_Response>
    {
        public rptL_2_423_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.423";
            }
        }

        public ulong row_id { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int fund_manager_no { get; set; }
        public String fund_manager_name { get; set; }
        public int trader_no { get; set; }
        public String trader_name { get; set; }
        public int show_order { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("fund_manager_no", 'I', fund_manager_no);
            packer.AddField("fund_manager_name", 'S', fund_manager_name);
            packer.AddField("trader_no", 'I', trader_no);
            packer.AddField("trader_name", 'S', trader_name);
            packer.AddField("show_order", 'I', show_order);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_NO_INT,fund_manager_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_NAME_STR,fund_manager_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRADER_NO_INT,trader_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TRADER_NAME_STR,trader_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SHOW_ORDER_INT,show_order);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class rptL_2_424_Request : BaseRequest, IRequest<rptL_2_424_Response>
    {
        public rptL_2_424_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.424";
            }
        }

        public int co_no { get; set; }
        public int fund_manager_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("fund_manager_no", 'I', fund_manager_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_NO_INT,fund_manager_no);
            return fastMsg;
        }
   }

    public class rptL_2_425_Request : BaseRequest, IRequest<rptL_2_425_Response>
    {
        public rptL_2_425_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.425";
            }
        }

        public int init_date { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public int pass_no { get; set; }
        public String out_acco { get; set; }
        public ulong pass_deli_jour_no { get; set; }
        public int strike_date { get; set; }
        public int strike_time { get; set; }
        public String strike_no { get; set; }
        public int report_date { get; set; }
        public int report_time { get; set; }
        public String report_no { get; set; }
        public String crncy_type { get; set; }
        public int exch_no { get; set; }
        public String stock_acco { get; set; }
        public String stock_code { get; set; }
        public int order_dir { get; set; }
        public double order_price { get; set; }
        public double order_qty { get; set; }
        public double strike_price { get; set; }
        public double strike_qty { get; set; }
        public double strike_amt { get; set; }
        public int strike_num { get; set; }
        public double entry_end_qty { get; set; }
        public double entry_end_amt { get; set; }
        public double out_all_fee { get; set; }
        public double out_stamp_tax { get; set; }
        public double out_trans_fee { get; set; }
        public double out_brkage { get; set; }
        public double out_SEC_charges { get; set; }
        public double out_other_fee { get; set; }
        public double out_brkage_commis { get; set; }
        public double out_chann_commis { get; set; }
        public double out_divi_commis { get; set; }
        public double out_other_commis { get; set; }
        public int busi_flag { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("init_date", 'I', init_date);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("out_acco", 'S', out_acco);
            packer.AddField("pass_deli_jour_no", 'L', pass_deli_jour_no);
            packer.AddField("strike_date", 'I', strike_date);
            packer.AddField("strike_time", 'I', strike_time);
            packer.AddField("strike_no", 'S', strike_no);
            packer.AddField("report_date", 'I', report_date);
            packer.AddField("report_time", 'I', report_time);
            packer.AddField("report_no", 'S', report_no);
            packer.AddField("crncy_type", 'S', crncy_type);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_acco", 'S', stock_acco);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("order_dir", 'I', order_dir);
            packer.AddField("order_price", 'D', order_price);
            packer.AddField("order_qty", 'D', order_qty);
            packer.AddField("strike_price", 'D', strike_price);
            packer.AddField("strike_qty", 'D', strike_qty);
            packer.AddField("strike_amt", 'D', strike_amt);
            packer.AddField("strike_num", 'I', strike_num);
            packer.AddField("entry_end_qty", 'D', entry_end_qty);
            packer.AddField("entry_end_amt", 'D', entry_end_amt);
            packer.AddField("out_all_fee", 'D', out_all_fee);
            packer.AddField("out_stamp_tax", 'D', out_stamp_tax);
            packer.AddField("out_trans_fee", 'D', out_trans_fee);
            packer.AddField("out_brkage", 'D', out_brkage);
            packer.AddField("out_SEC_charges", 'D', out_SEC_charges);
            packer.AddField("out_other_fee", 'D', out_other_fee);
            packer.AddField("out_brkage_commis", 'D', out_brkage_commis);
            packer.AddField("out_chann_commis", 'D', out_chann_commis);
            packer.AddField("out_divi_commis", 'D', out_divi_commis);
            packer.AddField("out_other_commis", 'D', out_other_commis);
            packer.AddField("busi_flag", 'I', busi_flag);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR,out_acco);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_PASS_DELI_JOUR_NO_INT64,pass_deli_jour_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT,strike_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_TIME_INT,strike_time);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR,strike_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT,report_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_TIME_INT,report_time);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR,report_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR,stock_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT,order_dir);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT,order_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT,order_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_PRICE_FLOAT,strike_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT,strike_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT,strike_amt);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NUM_INT,strike_num);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_END_QTY_FLOAT,entry_end_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_END_AMT_FLOAT,entry_end_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ALL_FEE_FLOAT,out_all_fee);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_STAMP_TAX_FLOAT,out_stamp_tax);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_TRANS_FEE_FLOAT,out_trans_fee);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_BRKAGE_FLOAT,out_brkage);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_SEC_CHARGES_FLOAT,out_SEC_charges);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_OTHER_FEE_FLOAT,out_other_fee);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_BRKAGE_COMMIS_FLOAT,out_brkage_commis);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_CHANN_COMMIS_FLOAT,out_chann_commis);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_DIVI_COMMIS_FLOAT,out_divi_commis);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_OTHER_COMMIS_FLOAT,out_other_commis);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT,busi_flag);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class rptL_2_426_Request : BaseRequest, IRequest<rptL_2_426_Response>
    {
        public rptL_2_426_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.426";
            }
        }

        public int qry_begin_date { get; set; }
        public int qry_end_date { get; set; }
        public int query_region_type { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public int pass_no { get; set; }
        public String out_acco { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("qry_begin_date", 'I', qry_begin_date);
            packer.AddField("qry_end_date", 'I', qry_end_date);
            packer.AddField("query_region_type", 'I', query_region_type);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("out_acco", 'S', out_acco);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_BEGIN_DATE_INT,qry_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_END_DATE_INT,qry_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_REGION_TYPE_INT,query_region_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR,out_acco);
            return fastMsg;
        }
   }

    public class rptL_2_428_Request : BaseRequest, IRequest<rptL_2_428_Response>
    {
        public rptL_2_428_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.428";
            }
        }

        public int qry_begin_date { get; set; }
        public int qry_end_date { get; set; }
        public int query_region_type { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public int pass_no { get; set; }
        public String out_acco { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("qry_begin_date", 'I', qry_begin_date);
            packer.AddField("qry_end_date", 'I', qry_end_date);
            packer.AddField("query_region_type", 'I', query_region_type);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("out_acco", 'S', out_acco);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_BEGIN_DATE_INT,qry_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_END_DATE_INT,qry_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_REGION_TYPE_INT,query_region_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR,out_acco);
            return fastMsg;
        }
   }

    public class rptL_2_429_Request : BaseRequest, IRequest<rptL_2_429_Response>
    {
        public rptL_2_429_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.429";
            }
        }

        public int qry_begin_date { get; set; }
        public int qry_end_date { get; set; }
        public int query_region_type { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public int pass_no { get; set; }
        public String out_acco { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("qry_begin_date", 'I', qry_begin_date);
            packer.AddField("qry_end_date", 'I', qry_end_date);
            packer.AddField("query_region_type", 'I', query_region_type);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("out_acco", 'S', out_acco);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_BEGIN_DATE_INT,qry_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_END_DATE_INT,qry_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_REGION_TYPE_INT,query_region_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR,out_acco);
            return fastMsg;
        }
   }

    public class rptL_2_431_Request : BaseRequest, IRequest<rptL_2_431_Response>
    {
        public rptL_2_431_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.431";
            }
        }

        public int curr_month { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public double month_apply_amt { get; set; }
        public double trade_deduct_amt { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("curr_month", 'I', curr_month);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("month_apply_amt", 'D', month_apply_amt);
            packer.AddField("trade_deduct_amt", 'D', trade_deduct_amt);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONTH_INT,curr_month);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MONTH_APPLY_AMT_FLOAT,month_apply_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_DEDUCT_AMT_FLOAT,trade_deduct_amt);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class rptL_2_436_Request : BaseRequest, IRequest<rptL_2_436_Response>
    {
        public rptL_2_436_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.436";
            }
        }

        public int init_date { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int stock_code_no { get; set; }
        public String asset_acco { get; set; }
        public String stock_acco { get; set; }
        public int exch_no { get; set; }
        public int invest_type { get; set; }
        public int stock_type { get; set; }
        public String stock_code { get; set; }
        public String stock_name { get; set; }
        public String crncy_type { get; set; }
        public double strike_aver_price { get; set; }
        public int order_dir { get; set; }
        public double order_price { get; set; }
        public double order_qty { get; set; }
        public double strike_qty { get; set; }
        public double strike_amt { get; set; }
        public double all_fee { get; set; }
        public double stamp_tax { get; set; }
        public double trans_fee { get; set; }
        public double brkage_fee { get; set; }
        public double SEC_charges { get; set; }
        public double other_fee { get; set; }
        public double trade_commis { get; set; }
        public double other_commis { get; set; }
        public double bond_accr_intrst { get; set; }
        public int net_price_flag { get; set; }
        public String bank_ib_member { get; set; }
        public double last_price { get; set; }
        public double quot_strike_qty { get; set; }
        public double quot_strike_amt { get; set; }
        public int sum_grp_cnt { get; set; }
        public String sum_grp_str { get; set; }
        public int busi_flag { get; set; }
        public int valid_flag { get; set; }
        public String remark_info { get; set; }
        public int src_data_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("init_date", 'I', init_date);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("asset_acco", 'S', asset_acco);
            packer.AddField("stock_acco", 'S', stock_acco);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("invest_type", 'I', invest_type);
            packer.AddField("stock_type", 'I', stock_type);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("stock_name", 'S', stock_name);
            packer.AddField("crncy_type", 'S', crncy_type);
            packer.AddField("strike_aver_price", 'D', strike_aver_price);
            packer.AddField("order_dir", 'I', order_dir);
            packer.AddField("order_price", 'D', order_price);
            packer.AddField("order_qty", 'D', order_qty);
            packer.AddField("strike_qty", 'D', strike_qty);
            packer.AddField("strike_amt", 'D', strike_amt);
            packer.AddField("all_fee", 'D', all_fee);
            packer.AddField("stamp_tax", 'D', stamp_tax);
            packer.AddField("trans_fee", 'D', trans_fee);
            packer.AddField("brkage_fee", 'D', brkage_fee);
            packer.AddField("SEC_charges", 'D', SEC_charges);
            packer.AddField("other_fee", 'D', other_fee);
            packer.AddField("trade_commis", 'D', trade_commis);
            packer.AddField("other_commis", 'D', other_commis);
            packer.AddField("bond_accr_intrst", 'D', bond_accr_intrst);
            packer.AddField("net_price_flag", 'I', net_price_flag);
            packer.AddField("bank_ib_member", 'S', bank_ib_member);
            packer.AddField("last_price", 'D', last_price);
            packer.AddField("quot_strike_qty", 'D', quot_strike_qty);
            packer.AddField("quot_strike_amt", 'D', quot_strike_amt);
            packer.AddField("sum_grp_cnt", 'I', sum_grp_cnt);
            packer.AddField("sum_grp_str", 'S', sum_grp_str);
            packer.AddField("busi_flag", 'I', busi_flag);
            packer.AddField("valid_flag", 'I', valid_flag);
            packer.AddField("remark_info", 'S', remark_info);
            packer.AddField("src_data_type", 'I', src_data_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STR,asset_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR,stock_acco);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INVEST_TYPE_INT,invest_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT,stock_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR,stock_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AVER_PRICE_FLOAT,strike_aver_price);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT,order_dir);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT,order_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT,order_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT,strike_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT,strike_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT,all_fee);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STAMP_TAX_FLOAT,stamp_tax);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_FEE_FLOAT,trans_fee);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BRKAGE_FEE_FLOAT,brkage_fee);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SEC_CHARGES_FLOAT,SEC_charges);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_FEE_FLOAT,other_fee);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_COMMIS_FLOAT,trade_commis);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_COMMIS_FLOAT,other_commis);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT,bond_accr_intrst);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLAG_INT,net_price_flag);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_BANK_IB_MEMBER_STR,bank_ib_member);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT,last_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_QUOT_STRIKE_QTY_FLOAT,quot_strike_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_QUOT_STRIKE_AMT_FLOAT,quot_strike_amt);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SUM_GRP_CNT_INT,sum_grp_cnt);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_SUM_GRP_STR_STR,sum_grp_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT,busi_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_VALID_FLAG_INT,valid_flag);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SRC_DATA_TYPE_INT,src_data_type);
            return fastMsg;
        }
   }

    public class rptL_2_437_Request : BaseRequest, IRequest<rptL_2_437_Response>
    {
        public rptL_2_437_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.437";
            }
        }

        public ulong row_id { get; set; }
        public int init_date { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int exch_no { get; set; }
        public int stock_acco_no { get; set; }
        public int stock_code_no { get; set; }
        public String stock_code { get; set; }
        public int stock_type { get; set; }
        public int asset_type { get; set; }
        public int busi_flag { get; set; }
        public int valid_flag { get; set; }
        public int src_data_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("init_date", 'I', init_date);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_acco_no", 'I', stock_acco_no);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("stock_type", 'I', stock_type);
            packer.AddField("asset_type", 'I', asset_type);
            packer.AddField("busi_flag", 'I', busi_flag);
            packer.AddField("valid_flag", 'I', valid_flag);
            packer.AddField("src_data_type", 'I', src_data_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT,stock_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT,stock_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT,asset_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT,busi_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_VALID_FLAG_INT,valid_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SRC_DATA_TYPE_INT,src_data_type);
            return fastMsg;
        }
   }

    public class rptL_2_438_Request : BaseRequest, IRequest<rptL_2_438_Response>
    {
        public rptL_2_438_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.438";
            }
        }

        public ulong row_id { get; set; }
        public int init_date { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int stock_code_no { get; set; }
        public String asset_acco { get; set; }
        public String stock_acco { get; set; }
        public int exch_no { get; set; }
        public int invest_type { get; set; }
        public int stock_type { get; set; }
        public String stock_code { get; set; }
        public String stock_name { get; set; }
        public String crncy_type { get; set; }
        public double strike_aver_price { get; set; }
        public int order_dir { get; set; }
        public double order_price { get; set; }
        public double order_qty { get; set; }
        public double strike_qty { get; set; }
        public double strike_amt { get; set; }
        public double all_fee { get; set; }
        public double stamp_tax { get; set; }
        public double trans_fee { get; set; }
        public double brkage_fee { get; set; }
        public double SEC_charges { get; set; }
        public double other_fee { get; set; }
        public double trade_commis { get; set; }
        public double other_commis { get; set; }
        public double bond_accr_intrst { get; set; }
        public int net_price_flag { get; set; }
        public String bank_ib_member { get; set; }
        public double last_price { get; set; }
        public double quot_strike_qty { get; set; }
        public double quot_strike_amt { get; set; }
        public int sum_grp_cnt { get; set; }
        public String sum_grp_str { get; set; }
        public int busi_flag { get; set; }
        public int valid_flag { get; set; }
        public String remark_info { get; set; }
        public int src_data_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("init_date", 'I', init_date);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("asset_acco", 'S', asset_acco);
            packer.AddField("stock_acco", 'S', stock_acco);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("invest_type", 'I', invest_type);
            packer.AddField("stock_type", 'I', stock_type);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("stock_name", 'S', stock_name);
            packer.AddField("crncy_type", 'S', crncy_type);
            packer.AddField("strike_aver_price", 'D', strike_aver_price);
            packer.AddField("order_dir", 'I', order_dir);
            packer.AddField("order_price", 'D', order_price);
            packer.AddField("order_qty", 'D', order_qty);
            packer.AddField("strike_qty", 'D', strike_qty);
            packer.AddField("strike_amt", 'D', strike_amt);
            packer.AddField("all_fee", 'D', all_fee);
            packer.AddField("stamp_tax", 'D', stamp_tax);
            packer.AddField("trans_fee", 'D', trans_fee);
            packer.AddField("brkage_fee", 'D', brkage_fee);
            packer.AddField("SEC_charges", 'D', SEC_charges);
            packer.AddField("other_fee", 'D', other_fee);
            packer.AddField("trade_commis", 'D', trade_commis);
            packer.AddField("other_commis", 'D', other_commis);
            packer.AddField("bond_accr_intrst", 'D', bond_accr_intrst);
            packer.AddField("net_price_flag", 'I', net_price_flag);
            packer.AddField("bank_ib_member", 'S', bank_ib_member);
            packer.AddField("last_price", 'D', last_price);
            packer.AddField("quot_strike_qty", 'D', quot_strike_qty);
            packer.AddField("quot_strike_amt", 'D', quot_strike_amt);
            packer.AddField("sum_grp_cnt", 'I', sum_grp_cnt);
            packer.AddField("sum_grp_str", 'S', sum_grp_str);
            packer.AddField("busi_flag", 'I', busi_flag);
            packer.AddField("valid_flag", 'I', valid_flag);
            packer.AddField("remark_info", 'S', remark_info);
            packer.AddField("src_data_type", 'I', src_data_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STR,asset_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR,stock_acco);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INVEST_TYPE_INT,invest_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT,stock_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR,stock_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AVER_PRICE_FLOAT,strike_aver_price);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT,order_dir);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT,order_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT,order_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT,strike_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT,strike_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT,all_fee);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STAMP_TAX_FLOAT,stamp_tax);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_FEE_FLOAT,trans_fee);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BRKAGE_FEE_FLOAT,brkage_fee);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SEC_CHARGES_FLOAT,SEC_charges);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_FEE_FLOAT,other_fee);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_COMMIS_FLOAT,trade_commis);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_COMMIS_FLOAT,other_commis);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT,bond_accr_intrst);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLAG_INT,net_price_flag);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_BANK_IB_MEMBER_STR,bank_ib_member);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT,last_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_QUOT_STRIKE_QTY_FLOAT,quot_strike_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_QUOT_STRIKE_AMT_FLOAT,quot_strike_amt);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SUM_GRP_CNT_INT,sum_grp_cnt);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_SUM_GRP_STR_STR,sum_grp_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT,busi_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_VALID_FLAG_INT,valid_flag);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SRC_DATA_TYPE_INT,src_data_type);
            return fastMsg;
        }
   }

    public class rptL_2_441_Request : BaseRequest, IRequest<rptL_2_441_Response>
    {
        public rptL_2_441_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.441";
            }
        }

        public int init_date { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public String pd_name { get; set; }
        public int exch_group_no { get; set; }
        public int exch_no { get; set; }
        public int stock_acco_no { get; set; }
        public int stock_code_no { get; set; }
        public String stock_code { get; set; }
        public String stock_name { get; set; }
        public int asset_acco_no { get; set; }
        public String crncy_type { get; set; }
        public String exch_crncy_type { get; set; }
        public double exch_rate { get; set; }
        public int trade_code_no { get; set; }
        public int target_code_no { get; set; }
        public int stock_type { get; set; }
        public int asset_type { get; set; }
        public double pre_entry_qty { get; set; }
        public double pre_entry_amt { get; set; }
        public double impawn_ratio { get; set; }
        public double bond_accr_intrst { get; set; }
        public int busi_flag { get; set; }
        public int act_record_flag { get; set; }
        public int acco_entry_flag { get; set; }
        public ulong entry_money_jour_no { get; set; }
        public String entry_status { get; set; }
        public int reg_date { get; set; }
        public int arrive_date { get; set; }
        public int begin_trade_date { get; set; }
        public String remark_info { get; set; }
        public int src_data_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("init_date", 'I', init_date);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("pd_name", 'S', pd_name);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_acco_no", 'I', stock_acco_no);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("stock_name", 'S', stock_name);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("crncy_type", 'S', crncy_type);
            packer.AddField("exch_crncy_type", 'S', exch_crncy_type);
            packer.AddField("exch_rate", 'D', exch_rate);
            packer.AddField("trade_code_no", 'I', trade_code_no);
            packer.AddField("target_code_no", 'I', target_code_no);
            packer.AddField("stock_type", 'I', stock_type);
            packer.AddField("asset_type", 'I', asset_type);
            packer.AddField("pre_entry_qty", 'D', pre_entry_qty);
            packer.AddField("pre_entry_amt", 'D', pre_entry_amt);
            packer.AddField("impawn_ratio", 'D', impawn_ratio);
            packer.AddField("bond_accr_intrst", 'D', bond_accr_intrst);
            packer.AddField("busi_flag", 'I', busi_flag);
            packer.AddField("act_record_flag", 'I', act_record_flag);
            packer.AddField("acco_entry_flag", 'I', acco_entry_flag);
            packer.AddField("entry_money_jour_no", 'L', entry_money_jour_no);
            packer.AddField("entry_status", 'S', entry_status);
            packer.AddField("reg_date", 'I', reg_date);
            packer.AddField("arrive_date", 'I', arrive_date);
            packer.AddField("begin_trade_date", 'I', begin_trade_date);
            packer.AddField("remark_info", 'S', remark_info);
            packer.AddField("src_data_type", 'I', src_data_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR,pd_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT,stock_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR,stock_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR,exch_crncy_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_RATE_FLOAT,exch_rate);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_NO_INT,trade_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_NO_INT,target_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT,stock_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT,asset_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ENTRY_QTY_FLOAT,pre_entry_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ENTRY_AMT_FLOAT,pre_entry_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_IMPAWN_RATIO_FLOAT,impawn_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT,bond_accr_intrst);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT,busi_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ACT_RECORD_FLAG_INT,act_record_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_ENTRY_FLAG_INT,acco_entry_flag);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_MONEY_JOUR_NO_INT64,entry_money_jour_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_STATUS_STR,entry_status);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REG_DATE_INT,reg_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ARRIVE_DATE_INT,arrive_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TRADE_DATE_INT,begin_trade_date);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SRC_DATA_TYPE_INT,src_data_type);
            return fastMsg;
        }
   }

    public class rptL_2_442_Request : BaseRequest, IRequest<rptL_2_442_Response>
    {
        public rptL_2_442_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.442";
            }
        }

        public ulong row_id { get; set; }
        public int init_date { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int exch_no { get; set; }
        public int stock_acco_no { get; set; }
        public int stock_code_no { get; set; }
        public String stock_code { get; set; }
        public int stock_type { get; set; }
        public int asset_type { get; set; }
        public int busi_flag { get; set; }
        public int act_record_flag { get; set; }
        public int src_data_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("init_date", 'I', init_date);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_acco_no", 'I', stock_acco_no);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("stock_type", 'I', stock_type);
            packer.AddField("asset_type", 'I', asset_type);
            packer.AddField("busi_flag", 'I', busi_flag);
            packer.AddField("act_record_flag", 'I', act_record_flag);
            packer.AddField("src_data_type", 'I', src_data_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT,stock_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT,stock_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT,asset_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT,busi_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ACT_RECORD_FLAG_INT,act_record_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SRC_DATA_TYPE_INT,src_data_type);
            return fastMsg;
        }
   }

    public class rptL_2_443_Request : BaseRequest, IRequest<rptL_2_443_Response>
    {
        public rptL_2_443_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.2.443";
            }
        }

        public ulong row_id { get; set; }
        public int init_date { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public String pd_name { get; set; }
        public int exch_group_no { get; set; }
        public int exch_no { get; set; }
        public int stock_acco_no { get; set; }
        public int stock_code_no { get; set; }
        public String stock_code { get; set; }
        public String stock_name { get; set; }
        public int asset_acco_no { get; set; }
        public String crncy_type { get; set; }
        public String exch_crncy_type { get; set; }
        public double exch_rate { get; set; }
        public int trade_code_no { get; set; }
        public int target_code_no { get; set; }
        public int stock_type { get; set; }
        public int asset_type { get; set; }
        public double pre_entry_qty { get; set; }
        public double pre_entry_amt { get; set; }
        public double impawn_ratio { get; set; }
        public double bond_accr_intrst { get; set; }
        public int busi_flag { get; set; }
        public int act_record_flag { get; set; }
        public int acco_entry_flag { get; set; }
        public ulong entry_money_jour_no { get; set; }
        public String entry_status { get; set; }
        public int reg_date { get; set; }
        public int arrive_date { get; set; }
        public int begin_trade_date { get; set; }
        public String remark_info { get; set; }
        public int src_data_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("init_date", 'I', init_date);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("pd_name", 'S', pd_name);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_acco_no", 'I', stock_acco_no);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("stock_name", 'S', stock_name);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("crncy_type", 'S', crncy_type);
            packer.AddField("exch_crncy_type", 'S', exch_crncy_type);
            packer.AddField("exch_rate", 'D', exch_rate);
            packer.AddField("trade_code_no", 'I', trade_code_no);
            packer.AddField("target_code_no", 'I', target_code_no);
            packer.AddField("stock_type", 'I', stock_type);
            packer.AddField("asset_type", 'I', asset_type);
            packer.AddField("pre_entry_qty", 'D', pre_entry_qty);
            packer.AddField("pre_entry_amt", 'D', pre_entry_amt);
            packer.AddField("impawn_ratio", 'D', impawn_ratio);
            packer.AddField("bond_accr_intrst", 'D', bond_accr_intrst);
            packer.AddField("busi_flag", 'I', busi_flag);
            packer.AddField("act_record_flag", 'I', act_record_flag);
            packer.AddField("acco_entry_flag", 'I', acco_entry_flag);
            packer.AddField("entry_money_jour_no", 'L', entry_money_jour_no);
            packer.AddField("entry_status", 'S', entry_status);
            packer.AddField("reg_date", 'I', reg_date);
            packer.AddField("arrive_date", 'I', arrive_date);
            packer.AddField("begin_trade_date", 'I', begin_trade_date);
            packer.AddField("remark_info", 'S', remark_info);
            packer.AddField("src_data_type", 'I', src_data_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR,pd_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT,stock_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR,stock_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR,exch_crncy_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_RATE_FLOAT,exch_rate);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_NO_INT,trade_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_NO_INT,target_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT,stock_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT,asset_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ENTRY_QTY_FLOAT,pre_entry_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ENTRY_AMT_FLOAT,pre_entry_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_IMPAWN_RATIO_FLOAT,impawn_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT,bond_accr_intrst);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT,busi_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ACT_RECORD_FLAG_INT,act_record_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_ENTRY_FLAG_INT,acco_entry_flag);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_MONEY_JOUR_NO_INT64,entry_money_jour_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_STATUS_STR,entry_status);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REG_DATE_INT,reg_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ARRIVE_DATE_INT,arrive_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TRADE_DATE_INT,begin_trade_date);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SRC_DATA_TYPE_INT,src_data_type);
            return fastMsg;
        }
   }

}
