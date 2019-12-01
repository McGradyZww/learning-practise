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
    public class pdsecuL_1_1_Request : BaseRequest, IRequest<pdsecuL_1_1_Response>
    {
        public pdsecuL_1_1_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.1.1";
            }
        }

        public int co_no { get; set; }
        public String out_acco { get; set; }
        public String trade_pwd { get; set; }
        public String comm_pwd { get; set; }
        public String sh_stock_acco { get; set; }
        public String sz_stock_acco { get; set; }
        public double acco_amt { get; set; }
        public double commis_ratio { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("out_acco", 'S', out_acco);
            packer.AddField("trade_pwd", 'S', trade_pwd);
            packer.AddField("comm_pwd", 'S', comm_pwd);
            packer.AddField("sh_stock_acco", 'S', sh_stock_acco);
            packer.AddField("sz_stock_acco", 'S', sz_stock_acco);
            packer.AddField("acco_amt", 'D', acco_amt);
            packer.AddField("commis_ratio", 'D', commis_ratio);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR,out_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_PWD_STR,trade_pwd);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_PWD_STR,comm_pwd);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_SH_STOCK_ACCO_STR,sh_stock_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_SZ_STOCK_ACCO_STR,sz_stock_acco);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_AMT_FLOAT,acco_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMMIS_RATIO_FLOAT,commis_ratio);
            return fastMsg;
        }
   }

    public class pdsecuL_1_2_Request : BaseRequest, IRequest<pdsecuL_1_2_Response>
    {
        public pdsecuL_1_2_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.1.2";
            }
        }

        public int co_no { get; set; }
        public String combo_code { get; set; }
        public String out_acco { get; set; }
        public int asset_acco_no { get; set; }
        public double acco_amt { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("combo_code", 'S', combo_code);
            packer.AddField("out_acco", 'S', out_acco);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("acco_amt", 'D', acco_amt);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_CODE_STR,combo_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR,out_acco);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_AMT_FLOAT,acco_amt);
            return fastMsg;
        }
   }

    public class pdsecuL_1_40_Request : BaseRequest, IRequest<pdsecuL_1_40_Response>
    {
        public pdsecuL_1_40_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.1.40";
            }
        }

        public int asset_acco_no { get; set; }
        public int exch_no { get; set; }
        public String stock_acco { get; set; }
        public String registration_agency { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_acco", 'S', stock_acco);
            packer.AddField("registration_agency", 'S', registration_agency);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR,stock_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REGISTRATION_AGENCY_STR,registration_agency);
            return fastMsg;
        }
   }

    public class pdsecuL_1_41_Request : BaseRequest, IRequest<pdsecuL_1_41_Response>
    {
        public pdsecuL_1_41_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.1.41";
            }
        }

        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public int exch_no { get; set; }
        public String stock_acco { get; set; }
        public String stock_acco_name { get; set; }
        public String stock_acco_apoint_status { get; set; }
        public String allow_stock_type { get; set; }
        public String busi_limit_str { get; set; }
        public String registration_agency { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_acco", 'S', stock_acco);
            packer.AddField("stock_acco_name", 'S', stock_acco_name);
            packer.AddField("stock_acco_apoint_status", 'S', stock_acco_apoint_status);
            packer.AddField("allow_stock_type", 'S', allow_stock_type);
            packer.AddField("busi_limit_str", 'S', busi_limit_str);
            packer.AddField("registration_agency", 'S', registration_agency);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR,stock_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NAME_STR,stock_acco_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_APOINT_STATUS_STR,stock_acco_apoint_status);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_STOCK_TYPE_STR,allow_stock_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_LIMIT_STR_STR,busi_limit_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REGISTRATION_AGENCY_STR,registration_agency);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class pdsecuL_1_42_Request : BaseRequest, IRequest<pdsecuL_1_42_Response>
    {
        public pdsecuL_1_42_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.1.42";
            }
        }

        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public int stock_acco_no { get; set; }
        public int exch_no { get; set; }
        public String stock_acco_name { get; set; }
        public String stock_acco_apoint_status { get; set; }
        public String allow_stock_type { get; set; }
        public String busi_limit_str { get; set; }
        public String registration_agency { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("stock_acco_no", 'I', stock_acco_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_acco_name", 'S', stock_acco_name);
            packer.AddField("stock_acco_apoint_status", 'S', stock_acco_apoint_status);
            packer.AddField("allow_stock_type", 'S', allow_stock_type);
            packer.AddField("busi_limit_str", 'S', busi_limit_str);
            packer.AddField("registration_agency", 'S', registration_agency);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT,stock_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NAME_STR,stock_acco_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_APOINT_STATUS_STR,stock_acco_apoint_status);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_STOCK_TYPE_STR,allow_stock_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_LIMIT_STR_STR,busi_limit_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REGISTRATION_AGENCY_STR,registration_agency);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class pdsecuL_1_43_Request : BaseRequest, IRequest<pdsecuL_1_43_Response>
    {
        public pdsecuL_1_43_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.1.43";
            }
        }

        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public int stock_acco_no { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("stock_acco_no", 'I', stock_acco_no);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT,stock_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pdsecuL_1_44_Request : BaseRequest, IRequest<pdsecuL_1_44_Response>
    {
        public pdsecuL_1_44_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.1.44";
            }
        }

        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public int stock_acco_no { get; set; }
        public String exch_no_str { get; set; }
        public String stock_acco_status_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("stock_acco_no", 'I', stock_acco_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_acco_status_str", 'S', stock_acco_status_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT,stock_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STATUS_STR_STR,stock_acco_status_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pdsecuL_1_45_Request : BaseRequest, IRequest<pdsecuL_1_45_Response>
    {
        public pdsecuL_1_45_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.1.45";
            }
        }

        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public int stock_acco_no { get; set; }
        public String exch_no_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("stock_acco_no", 'I', stock_acco_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT,stock_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pdsecuL_1_46_Request : BaseRequest, IRequest<pdsecuL_1_46_Response>
    {
        public pdsecuL_1_46_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.1.46";
            }
        }

        public int begin_date { get; set; }
        public int end_date { get; set; }
        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public int stock_acco_no { get; set; }
        public String exch_no_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("stock_acco_no", 'I', stock_acco_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT,stock_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pdsecuL_1_47_Request : BaseRequest, IRequest<pdsecuL_1_47_Response>
    {
        public pdsecuL_1_47_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.1.47";
            }
        }

        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public int stock_acco_no { get; set; }
        public String registration_agency { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("stock_acco_no", 'I', stock_acco_no);
            packer.AddField("registration_agency", 'S', registration_agency);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT,stock_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REGISTRATION_AGENCY_STR,registration_agency);
            return fastMsg;
        }
   }

    public class pdsecuL_1_48_Request : BaseRequest, IRequest<pdsecuL_1_48_Response>
    {
        public pdsecuL_1_48_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.1.48";
            }
        }

        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public int stock_acco_no { get; set; }
        public String registration_agency { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("stock_acco_no", 'I', stock_acco_no);
            packer.AddField("registration_agency", 'S', registration_agency);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT,stock_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REGISTRATION_AGENCY_STR,registration_agency);
            return fastMsg;
        }
   }

    public class pdsecuL_1_49_Request : BaseRequest, IRequest<pdsecuL_1_49_Response>
    {
        public pdsecuL_1_49_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.1.49";
            }
        }

        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public int stock_acco_no { get; set; }
        public String registration_agency { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("stock_acco_no", 'I', stock_acco_no);
            packer.AddField("registration_agency", 'S', registration_agency);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT,stock_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REGISTRATION_AGENCY_STR,registration_agency);
            return fastMsg;
        }
   }

    public class pdsecuL_1_51_Request : BaseRequest, IRequest<pdsecuL_1_51_Response>
    {
        public pdsecuL_1_51_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.1.51";
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

    public class pdsecuL_1_61_Request : BaseRequest, IRequest<pdsecuL_1_61_Response>
    {
        public pdsecuL_1_61_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.1.61";
            }
        }

        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public int exch_no { get; set; }
        public int stock_acco_no { get; set; }
        public int target_opor_no { get; set; }
        public int begin_time { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_acco_no", 'I', stock_acco_no);
            packer.AddField("target_opor_no", 'I', target_opor_no);
            packer.AddField("begin_time", 'I', begin_time);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT,stock_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_OPOR_NO_INT,target_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TIME_INT,begin_time);
            return fastMsg;
        }
   }

    public class pdsecuL_1_62_Request : BaseRequest, IRequest<pdsecuL_1_62_Response>
    {
        public pdsecuL_1_62_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.1.62";
            }
        }

        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public int stock_acco_no { get; set; }
        public int target_opor_no { get; set; }
        public int begin_time { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("stock_acco_no", 'I', stock_acco_no);
            packer.AddField("target_opor_no", 'I', target_opor_no);
            packer.AddField("begin_time", 'I', begin_time);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT,stock_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_OPOR_NO_INT,target_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TIME_INT,begin_time);
            return fastMsg;
        }
   }

    public class pdsecuL_1_63_Request : BaseRequest, IRequest<pdsecuL_1_63_Response>
    {
        public pdsecuL_1_63_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.1.63";
            }
        }

        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public int stock_acco_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("stock_acco_no", 'I', stock_acco_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT,stock_acco_no);
            return fastMsg;
        }
   }

    public class pdsecuL_1_64_Request : BaseRequest, IRequest<pdsecuL_1_64_Response>
    {
        public pdsecuL_1_64_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.1.64";
            }
        }

        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public int exch_no { get; set; }
        public int stock_acco_no { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_acco_no", 'I', stock_acco_no);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT,stock_acco_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pdsecuL_1_501_Request : BaseRequest, IRequest<pdsecuL_1_501_Response>
    {
        public pdsecuL_1_501_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.1.501";
            }
        }

        public int pass_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pass_no", 'I', pass_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            return fastMsg;
        }
   }

    public class pdsecuL_1_71_Request : BaseRequest, IRequest<pdsecuL_1_71_Response>
    {
        public pdsecuL_1_71_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.1.71";
            }
        }

        public int pass_no { get; set; }
        public String out_acco { get; set; }
        public int exch_no { get; set; }
        public String stock_acco { get; set; }
        public String stock_acco_name { get; set; }
        public String stock_acco_status { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("out_acco", 'S', out_acco);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_acco", 'S', stock_acco);
            packer.AddField("stock_acco_name", 'S', stock_acco_name);
            packer.AddField("stock_acco_status", 'S', stock_acco_status);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR,out_acco);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR,stock_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NAME_STR,stock_acco_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STATUS_STR,stock_acco_status);
            return fastMsg;
        }
   }

    public class pdsecuL_1_72_Request : BaseRequest, IRequest<pdsecuL_1_72_Response>
    {
        public pdsecuL_1_72_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.1.72";
            }
        }

        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pdsecuL_1_73_Request : BaseRequest, IRequest<pdsecuL_1_73_Response>
    {
        public pdsecuL_1_73_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.1.73";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public int exch_no { get; set; }
        public int stock_code_no { get; set; }
        public int target_opor_no { get; set; }
        public int begin_time { get; set; }
        public double avail_cash { get; set; }
        public double intrst_ratio { get; set; }
        public int mul_acco_trd_qty { get; set; }
        public int exec_price_type { get; set; }
        public String task_status { get; set; }
        public int order_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("target_opor_no", 'I', target_opor_no);
            packer.AddField("begin_time", 'I', begin_time);
            packer.AddField("avail_cash", 'D', avail_cash);
            packer.AddField("intrst_ratio", 'D', intrst_ratio);
            packer.AddField("mul_acco_trd_qty", 'I', mul_acco_trd_qty);
            packer.AddField("exec_price_type", 'I', exec_price_type);
            packer.AddField("task_status", 'S', task_status);
            packer.AddField("order_no", 'I', order_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_OPOR_NO_INT,target_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TIME_INT,begin_time);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVAIL_CASH_FLOAT,avail_cash);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_RATIO_FLOAT,intrst_ratio);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MUL_ACCO_TRD_QTY_INT,mul_acco_trd_qty);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_PRICE_TYPE_INT,exec_price_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STATUS_STR,task_status);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_NO_INT,order_no);
            return fastMsg;
        }
   }

    public class pdsecuL_1_74_Request : BaseRequest, IRequest<pdsecuL_1_74_Response>
    {
        public pdsecuL_1_74_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.1.74";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public int exch_no { get; set; }
        public int stock_code_no { get; set; }
        public int target_opor_no { get; set; }
        public int begin_time { get; set; }
        public double avail_cash { get; set; }
        public double intrst_ratio { get; set; }
        public int mul_acco_trd_qty { get; set; }
        public int exec_price_type { get; set; }
        public String task_status { get; set; }
        public int order_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("target_opor_no", 'I', target_opor_no);
            packer.AddField("begin_time", 'I', begin_time);
            packer.AddField("avail_cash", 'D', avail_cash);
            packer.AddField("intrst_ratio", 'D', intrst_ratio);
            packer.AddField("mul_acco_trd_qty", 'I', mul_acco_trd_qty);
            packer.AddField("exec_price_type", 'I', exec_price_type);
            packer.AddField("task_status", 'S', task_status);
            packer.AddField("order_no", 'I', order_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_OPOR_NO_INT,target_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TIME_INT,begin_time);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVAIL_CASH_FLOAT,avail_cash);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_RATIO_FLOAT,intrst_ratio);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MUL_ACCO_TRD_QTY_INT,mul_acco_trd_qty);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_PRICE_TYPE_INT,exec_price_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STATUS_STR,task_status);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_NO_INT,order_no);
            return fastMsg;
        }
   }

    public class pdsecuL_1_75_Request : BaseRequest, IRequest<pdsecuL_1_75_Response>
    {
        public pdsecuL_1_75_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.1.75";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public int exch_no { get; set; }
        public int stock_code_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code_no", 'I', stock_code_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            return fastMsg;
        }
   }

    public class pdsecuL_1_76_Request : BaseRequest, IRequest<pdsecuL_1_76_Response>
    {
        public pdsecuL_1_76_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.1.76";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public int exch_no { get; set; }
        public int stock_code_no { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pdsecuL_1_77_Request : BaseRequest, IRequest<pdsecuL_1_77_Response>
    {
        public pdsecuL_1_77_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.1.77";
            }
        }

        public int asset_acco_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int is_transfer_capital_posi { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("is_transfer_capital_posi", 'I', is_transfer_capital_posi);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_TRANSFER_CAPITAL_POSI_INT,is_transfer_capital_posi);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

}
