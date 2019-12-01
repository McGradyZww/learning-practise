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
    public class pdfutuL_7_1_Request : BaseRequest, IRequest<pdfutuL_7_1_Response>
    {
        public pdfutuL_7_1_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdfutuL.7.1";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public int futu_acco_no { get; set; }
        public String futu_acco_status { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("futu_acco_no", 'I', futu_acco_no);
            packer.AddField("futu_acco_status", 'S', futu_acco_status);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT,futu_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_STATUS_STR,futu_acco_status);
            return fastMsg;
        }
   }

    public class pdfutuL_7_11_Request : BaseRequest, IRequest<pdfutuL_7_11_Response>
    {
        public pdfutuL_7_11_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdfutuL.7.11";
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

    public class pdfutuL_7_2_Request : BaseRequest, IRequest<pdfutuL_7_2_Response>
    {
        public pdfutuL_7_2_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdfutuL.7.2";
            }
        }

        public int co_no { get; set; }
        public int busi_opor_no { get; set; }
        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public int exch_no { get; set; }
        public String futu_acco { get; set; }
        public String futu_acco_name { get; set; }
        public int hedge_type { get; set; }
        public String allow_contrc_type { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("busi_opor_no", 'I', busi_opor_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("futu_acco", 'S', futu_acco);
            packer.AddField("futu_acco_name", 'S', futu_acco_name);
            packer.AddField("hedge_type", 'I', hedge_type);
            packer.AddField("allow_contrc_type", 'S', allow_contrc_type);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT,busi_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_STR,futu_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NAME_STR,futu_acco_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT,hedge_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_CONTRC_TYPE_STR,allow_contrc_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class pdfutuL_7_3_Request : BaseRequest, IRequest<pdfutuL_7_3_Response>
    {
        public pdfutuL_7_3_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdfutuL.7.3";
            }
        }

        public int co_no { get; set; }
        public int busi_opor_no { get; set; }
        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public int futu_acco_no { get; set; }
        public int exch_no { get; set; }
        public String futu_acco_name { get; set; }
        public String allow_contrc_type { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("busi_opor_no", 'I', busi_opor_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("futu_acco_no", 'I', futu_acco_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("futu_acco_name", 'S', futu_acco_name);
            packer.AddField("allow_contrc_type", 'S', allow_contrc_type);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT,busi_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT,futu_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NAME_STR,futu_acco_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_CONTRC_TYPE_STR,allow_contrc_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class pdfutuL_7_4_Request : BaseRequest, IRequest<pdfutuL_7_4_Response>
    {
        public pdfutuL_7_4_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdfutuL.7.4";
            }
        }

        public int co_no { get; set; }
        public int busi_opor_no { get; set; }
        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public int futu_acco_no { get; set; }
        public int exch_no { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("busi_opor_no", 'I', busi_opor_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("futu_acco_no", 'I', futu_acco_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT,busi_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT,futu_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pdfutuL_7_5_Request : BaseRequest, IRequest<pdfutuL_7_5_Response>
    {
        public pdfutuL_7_5_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdfutuL.7.5";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public int futu_acco_no { get; set; }
        public String exch_no_str { get; set; }
        public String futu_acco_status_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("futu_acco_no", 'I', futu_acco_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("futu_acco_status_str", 'S', futu_acco_status_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT,futu_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_STATUS_STR_STR,futu_acco_status_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pdfutuL_7_6_Request : BaseRequest, IRequest<pdfutuL_7_6_Response>
    {
        public pdfutuL_7_6_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdfutuL.7.6";
            }
        }

        public int co_no { get; set; }
        public int busi_opor_no { get; set; }
        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public int futu_acco_no { get; set; }
        public int exch_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("busi_opor_no", 'I', busi_opor_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("futu_acco_no", 'I', futu_acco_no);
            packer.AddField("exch_no", 'I', exch_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT,busi_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT,futu_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            return fastMsg;
        }
   }

    public class pdfutuL_7_7_Request : BaseRequest, IRequest<pdfutuL_7_7_Response>
    {
        public pdfutuL_7_7_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdfutuL.7.7";
            }
        }

        public int co_no { get; set; }
        public int busi_opor_no { get; set; }
        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public int futu_acco_no { get; set; }
        public int exch_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("busi_opor_no", 'I', busi_opor_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("futu_acco_no", 'I', futu_acco_no);
            packer.AddField("exch_no", 'I', exch_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT,busi_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT,futu_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            return fastMsg;
        }
   }

    public class pdfutuL_7_8_Request : BaseRequest, IRequest<pdfutuL_7_8_Response>
    {
        public pdfutuL_7_8_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdfutuL.7.8";
            }
        }

        public int co_no { get; set; }
        public int busi_opor_no { get; set; }
        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public int futu_acco_no { get; set; }
        public int exch_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("busi_opor_no", 'I', busi_opor_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("futu_acco_no", 'I', futu_acco_no);
            packer.AddField("exch_no", 'I', exch_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT,busi_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT,futu_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            return fastMsg;
        }
   }

}
