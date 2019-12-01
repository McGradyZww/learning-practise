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
    public class pdfutuL_3_1_Request : BaseRequest, IRequest<pdfutuL_3_1_Response>
    {
        public pdfutuL_3_1_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdfutuL.3.1";
            }
        }

        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public int exch_group_no { get; set; }
        public int exch_no { get; set; }
        public int futu_acco_no { get; set; }
        public int contrc_code_no { get; set; }
        public int lngsht_type { get; set; }
        public int hedge_type { get; set; }
        public int is_change_asac_posi { get; set; }
        public double occur_qty { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("futu_acco_no", 'I', futu_acco_no);
            packer.AddField("contrc_code_no", 'I', contrc_code_no);
            packer.AddField("lngsht_type", 'I', lngsht_type);
            packer.AddField("hedge_type", 'I', hedge_type);
            packer.AddField("is_change_asac_posi", 'I', is_change_asac_posi);
            packer.AddField("occur_qty", 'D', occur_qty);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT,futu_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT,lngsht_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT,hedge_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_CHANGE_ASAC_POSI_INT,is_change_asac_posi);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_QTY_FLOAT,occur_qty);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pdfutuL_3_2_Request : BaseRequest, IRequest<pdfutuL_3_2_Response>
    {
        public pdfutuL_3_2_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdfutuL.3.2";
            }
        }

        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public int exch_group_no { get; set; }
        public int exch_no { get; set; }
        public int futu_acco_no { get; set; }
        public int contrc_code_no { get; set; }
        public int lngsht_type { get; set; }
        public int hedge_type { get; set; }
        public double occur_qty { get; set; }
        public int expire_date { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("futu_acco_no", 'I', futu_acco_no);
            packer.AddField("contrc_code_no", 'I', contrc_code_no);
            packer.AddField("lngsht_type", 'I', lngsht_type);
            packer.AddField("hedge_type", 'I', hedge_type);
            packer.AddField("occur_qty", 'D', occur_qty);
            packer.AddField("expire_date", 'I', expire_date);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT,futu_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT,lngsht_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT,hedge_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_QTY_FLOAT,occur_qty);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXPIRE_DATE_INT,expire_date);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pdfutuL_3_3_Request : BaseRequest, IRequest<pdfutuL_3_3_Response>
    {
        public pdfutuL_3_3_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdfutuL.3.3";
            }
        }

        public ulong row_id { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pdfutuL_3_4_Request : BaseRequest, IRequest<pdfutuL_3_4_Response>
    {
        public pdfutuL_3_4_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdfutuL.3.4";
            }
        }

        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public int exch_group_no { get; set; }
        public int exch_no { get; set; }
        public int futu_acco_no { get; set; }
        public int contrc_code_no { get; set; }
        public int lngsht_type { get; set; }
        public int hedge_type { get; set; }
        public double occur_qty { get; set; }
        public int expire_date { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("futu_acco_no", 'I', futu_acco_no);
            packer.AddField("contrc_code_no", 'I', contrc_code_no);
            packer.AddField("lngsht_type", 'I', lngsht_type);
            packer.AddField("hedge_type", 'I', hedge_type);
            packer.AddField("occur_qty", 'D', occur_qty);
            packer.AddField("expire_date", 'I', expire_date);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT,futu_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT,lngsht_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT,hedge_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_QTY_FLOAT,occur_qty);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXPIRE_DATE_INT,expire_date);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pdfutuL_3_5_Request : BaseRequest, IRequest<pdfutuL_3_5_Response>
    {
        public pdfutuL_3_5_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdfutuL.3.5";
            }
        }

        public ulong row_id { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pdfutuL_3_21_Request : BaseRequest, IRequest<pdfutuL_3_21_Response>
    {
        public pdfutuL_3_21_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdfutuL.3.21";
            }
        }

        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public String exch_no_str { get; set; }
        public int futu_acco_no { get; set; }
        public int contrc_code_no { get; set; }
        public int lngsht_type { get; set; }
        public int hedge_type { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("futu_acco_no", 'I', futu_acco_no);
            packer.AddField("contrc_code_no", 'I', contrc_code_no);
            packer.AddField("lngsht_type", 'I', lngsht_type);
            packer.AddField("hedge_type", 'I', hedge_type);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT,futu_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT,lngsht_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT,hedge_type);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pdfutuL_3_22_Request : BaseRequest, IRequest<pdfutuL_3_22_Response>
    {
        public pdfutuL_3_22_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdfutuL.3.22";
            }
        }

        public int begin_date { get; set; }
        public int end_date { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public String exch_no_str { get; set; }
        public int futu_acco_no { get; set; }
        public int contrc_code_no { get; set; }
        public int lngsht_type { get; set; }
        public int hedge_type { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("futu_acco_no", 'I', futu_acco_no);
            packer.AddField("contrc_code_no", 'I', contrc_code_no);
            packer.AddField("lngsht_type", 'I', lngsht_type);
            packer.AddField("hedge_type", 'I', hedge_type);
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
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT,futu_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT,lngsht_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT,hedge_type);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pdfutuL_3_31_Request : BaseRequest, IRequest<pdfutuL_3_31_Response>
    {
        public pdfutuL_3_31_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdfutuL.3.31";
            }
        }

        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public String exch_no_str { get; set; }
        public int futu_acco_no { get; set; }
        public int contrc_code_no { get; set; }
        public int lngsht_type { get; set; }
        public int hedge_type { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("futu_acco_no", 'I', futu_acco_no);
            packer.AddField("contrc_code_no", 'I', contrc_code_no);
            packer.AddField("lngsht_type", 'I', lngsht_type);
            packer.AddField("hedge_type", 'I', hedge_type);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT,futu_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT,lngsht_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT,hedge_type);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pdfutuL_3_32_Request : BaseRequest, IRequest<pdfutuL_3_32_Response>
    {
        public pdfutuL_3_32_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdfutuL.3.32";
            }
        }

        public int begin_date { get; set; }
        public int end_date { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public String exch_no_str { get; set; }
        public int futu_acco_no { get; set; }
        public int contrc_code_no { get; set; }
        public int lngsht_type { get; set; }
        public int hedge_type { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("futu_acco_no", 'I', futu_acco_no);
            packer.AddField("contrc_code_no", 'I', contrc_code_no);
            packer.AddField("lngsht_type", 'I', lngsht_type);
            packer.AddField("hedge_type", 'I', hedge_type);
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
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT,futu_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT,lngsht_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT,hedge_type);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pdfutuL_3_34_Request : BaseRequest, IRequest<pdfutuL_3_34_Response>
    {
        public pdfutuL_3_34_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdfutuL.3.34";
            }
        }

        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public String exch_no_str { get; set; }
        public int futu_acco_no { get; set; }
        public int contrc_code_no { get; set; }
        public int lngsht_type { get; set; }
        public int hedge_type { get; set; }
        public int frozen_type { get; set; }
        public String jour_status { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("futu_acco_no", 'I', futu_acco_no);
            packer.AddField("contrc_code_no", 'I', contrc_code_no);
            packer.AddField("lngsht_type", 'I', lngsht_type);
            packer.AddField("hedge_type", 'I', hedge_type);
            packer.AddField("frozen_type", 'I', frozen_type);
            packer.AddField("jour_status", 'S', jour_status);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT,futu_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT,lngsht_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT,hedge_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_TYPE_INT,frozen_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_STATUS_STR,jour_status);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pdfutuL_3_35_Request : BaseRequest, IRequest<pdfutuL_3_35_Response>
    {
        public pdfutuL_3_35_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdfutuL.3.35";
            }
        }

        public int begin_date { get; set; }
        public int end_date { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public String exch_no_str { get; set; }
        public int futu_acco_no { get; set; }
        public int contrc_code_no { get; set; }
        public int lngsht_type { get; set; }
        public int hedge_type { get; set; }
        public int frozen_type { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("futu_acco_no", 'I', futu_acco_no);
            packer.AddField("contrc_code_no", 'I', contrc_code_no);
            packer.AddField("lngsht_type", 'I', lngsht_type);
            packer.AddField("hedge_type", 'I', hedge_type);
            packer.AddField("frozen_type", 'I', frozen_type);
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
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT,futu_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT,lngsht_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT,hedge_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_TYPE_INT,frozen_type);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pdfutuL_3_51_Request : BaseRequest, IRequest<pdfutuL_3_51_Response>
    {
        public pdfutuL_3_51_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdfutuL.3.51";
            }
        }

        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public int exch_no { get; set; }
        public int futu_acco_no { get; set; }
        public int contrc_code_no { get; set; }
        public int lngsht_type { get; set; }
        public int hedge_type { get; set; }
        public double occur_qty { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("futu_acco_no", 'I', futu_acco_no);
            packer.AddField("contrc_code_no", 'I', contrc_code_no);
            packer.AddField("lngsht_type", 'I', lngsht_type);
            packer.AddField("hedge_type", 'I', hedge_type);
            packer.AddField("occur_qty", 'D', occur_qty);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT,futu_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT,lngsht_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT,hedge_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_QTY_FLOAT,occur_qty);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pdfutuL_3_52_Request : BaseRequest, IRequest<pdfutuL_3_52_Response>
    {
        public pdfutuL_3_52_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdfutuL.3.52";
            }
        }

        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public int exch_no { get; set; }
        public int futu_acco_no { get; set; }
        public int contrc_code_no { get; set; }
        public int lngsht_type { get; set; }
        public int hedge_type { get; set; }
        public double occur_qty { get; set; }
        public int expire_date { get; set; }
        public int is_change_exch_group_posi { get; set; }
        public int exch_group_no { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("futu_acco_no", 'I', futu_acco_no);
            packer.AddField("contrc_code_no", 'I', contrc_code_no);
            packer.AddField("lngsht_type", 'I', lngsht_type);
            packer.AddField("hedge_type", 'I', hedge_type);
            packer.AddField("occur_qty", 'D', occur_qty);
            packer.AddField("expire_date", 'I', expire_date);
            packer.AddField("is_change_exch_group_posi", 'I', is_change_exch_group_posi);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT,futu_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT,lngsht_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT,hedge_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_QTY_FLOAT,occur_qty);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXPIRE_DATE_INT,expire_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_CHANGE_EXCH_GROUP_POSI_INT,is_change_exch_group_posi);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pdfutuL_3_53_Request : BaseRequest, IRequest<pdfutuL_3_53_Response>
    {
        public pdfutuL_3_53_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdfutuL.3.53";
            }
        }

        public ulong row_id { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pdfutuL_3_54_Request : BaseRequest, IRequest<pdfutuL_3_54_Response>
    {
        public pdfutuL_3_54_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdfutuL.3.54";
            }
        }

        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public int exch_no { get; set; }
        public int futu_acco_no { get; set; }
        public int contrc_code_no { get; set; }
        public int lngsht_type { get; set; }
        public int hedge_type { get; set; }
        public double occur_qty { get; set; }
        public int expire_date { get; set; }
        public int is_change_exch_group_posi { get; set; }
        public int exch_group_no { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("futu_acco_no", 'I', futu_acco_no);
            packer.AddField("contrc_code_no", 'I', contrc_code_no);
            packer.AddField("lngsht_type", 'I', lngsht_type);
            packer.AddField("hedge_type", 'I', hedge_type);
            packer.AddField("occur_qty", 'D', occur_qty);
            packer.AddField("expire_date", 'I', expire_date);
            packer.AddField("is_change_exch_group_posi", 'I', is_change_exch_group_posi);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT,futu_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT,lngsht_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT,hedge_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_QTY_FLOAT,occur_qty);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXPIRE_DATE_INT,expire_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_CHANGE_EXCH_GROUP_POSI_INT,is_change_exch_group_posi);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pdfutuL_3_55_Request : BaseRequest, IRequest<pdfutuL_3_55_Response>
    {
        public pdfutuL_3_55_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdfutuL.3.55";
            }
        }

        public ulong row_id { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pdfutuL_3_71_Request : BaseRequest, IRequest<pdfutuL_3_71_Response>
    {
        public pdfutuL_3_71_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdfutuL.3.71";
            }
        }

        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public String exch_no_str { get; set; }
        public int futu_acco_no { get; set; }
        public int contrc_code_no { get; set; }
        public int lngsht_type { get; set; }
        public int hedge_type { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("futu_acco_no", 'I', futu_acco_no);
            packer.AddField("contrc_code_no", 'I', contrc_code_no);
            packer.AddField("lngsht_type", 'I', lngsht_type);
            packer.AddField("hedge_type", 'I', hedge_type);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT,futu_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT,lngsht_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT,hedge_type);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pdfutuL_3_72_Request : BaseRequest, IRequest<pdfutuL_3_72_Response>
    {
        public pdfutuL_3_72_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdfutuL.3.72";
            }
        }

        public int begin_date { get; set; }
        public int end_date { get; set; }
        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public String exch_no_str { get; set; }
        public int futu_acco_no { get; set; }
        public int contrc_code_no { get; set; }
        public int lngsht_type { get; set; }
        public int hedge_type { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("futu_acco_no", 'I', futu_acco_no);
            packer.AddField("contrc_code_no", 'I', contrc_code_no);
            packer.AddField("lngsht_type", 'I', lngsht_type);
            packer.AddField("hedge_type", 'I', hedge_type);
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
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT,futu_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT,lngsht_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT,hedge_type);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pdfutuL_3_81_Request : BaseRequest, IRequest<pdfutuL_3_81_Response>
    {
        public pdfutuL_3_81_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdfutuL.3.81";
            }
        }

        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public String exch_no_str { get; set; }
        public int futu_acco_no { get; set; }
        public int contrc_code_no { get; set; }
        public int lngsht_type { get; set; }
        public int hedge_type { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("futu_acco_no", 'I', futu_acco_no);
            packer.AddField("contrc_code_no", 'I', contrc_code_no);
            packer.AddField("lngsht_type", 'I', lngsht_type);
            packer.AddField("hedge_type", 'I', hedge_type);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT,futu_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT,lngsht_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT,hedge_type);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pdfutuL_3_82_Request : BaseRequest, IRequest<pdfutuL_3_82_Response>
    {
        public pdfutuL_3_82_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdfutuL.3.82";
            }
        }

        public int begin_date { get; set; }
        public int end_date { get; set; }
        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public String exch_no_str { get; set; }
        public int futu_acco_no { get; set; }
        public int contrc_code_no { get; set; }
        public int lngsht_type { get; set; }
        public int hedge_type { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("futu_acco_no", 'I', futu_acco_no);
            packer.AddField("contrc_code_no", 'I', contrc_code_no);
            packer.AddField("lngsht_type", 'I', lngsht_type);
            packer.AddField("hedge_type", 'I', hedge_type);
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
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT,futu_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT,lngsht_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT,hedge_type);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pdfutuL_3_84_Request : BaseRequest, IRequest<pdfutuL_3_84_Response>
    {
        public pdfutuL_3_84_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdfutuL.3.84";
            }
        }

        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public String exch_no_str { get; set; }
        public int futu_acco_no { get; set; }
        public int contrc_code_no { get; set; }
        public int lngsht_type { get; set; }
        public int hedge_type { get; set; }
        public int frozen_type { get; set; }
        public String jour_status { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("futu_acco_no", 'I', futu_acco_no);
            packer.AddField("contrc_code_no", 'I', contrc_code_no);
            packer.AddField("lngsht_type", 'I', lngsht_type);
            packer.AddField("hedge_type", 'I', hedge_type);
            packer.AddField("frozen_type", 'I', frozen_type);
            packer.AddField("jour_status", 'S', jour_status);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT,futu_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT,lngsht_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT,hedge_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_TYPE_INT,frozen_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_STATUS_STR,jour_status);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pdfutuL_3_85_Request : BaseRequest, IRequest<pdfutuL_3_85_Response>
    {
        public pdfutuL_3_85_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdfutuL.3.85";
            }
        }

        public int begin_date { get; set; }
        public int end_date { get; set; }
        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public String exch_no_str { get; set; }
        public int futu_acco_no { get; set; }
        public int contrc_code_no { get; set; }
        public int lngsht_type { get; set; }
        public int hedge_type { get; set; }
        public int frozen_type { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("futu_acco_no", 'I', futu_acco_no);
            packer.AddField("contrc_code_no", 'I', contrc_code_no);
            packer.AddField("lngsht_type", 'I', lngsht_type);
            packer.AddField("hedge_type", 'I', hedge_type);
            packer.AddField("frozen_type", 'I', frozen_type);
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
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT,futu_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT,lngsht_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT,hedge_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_TYPE_INT,frozen_type);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pdfutuL_3_171_Request : BaseRequest, IRequest<pdfutuL_3_171_Response>
    {
        public pdfutuL_3_171_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdfutuL.3.171";
            }
        }

        public int pass_no { get; set; }
        public String out_acco { get; set; }
        public String contrc_code { get; set; }
        public int lngsht_type { get; set; }
        public int hedge_type { get; set; }
        public double out_curr_qty { get; set; }
        public double out_enable_qty { get; set; }
        public double out_rece_margin { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("out_acco", 'S', out_acco);
            packer.AddField("contrc_code", 'S', contrc_code);
            packer.AddField("lngsht_type", 'I', lngsht_type);
            packer.AddField("hedge_type", 'I', hedge_type);
            packer.AddField("out_curr_qty", 'D', out_curr_qty);
            packer.AddField("out_enable_qty", 'D', out_enable_qty);
            packer.AddField("out_rece_margin", 'D', out_rece_margin);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR,out_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR,contrc_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT,lngsht_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT,hedge_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_CURR_QTY_FLOAT,out_curr_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ENABLE_QTY_FLOAT,out_enable_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_RECE_MARGIN_FLOAT,out_rece_margin);
            return fastMsg;
        }
   }

    public class pdfutuL_3_172_Request : BaseRequest, IRequest<pdfutuL_3_172_Response>
    {
        public pdfutuL_3_172_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdfutuL.3.172";
            }
        }

        public int pass_no { get; set; }
        public String out_acco { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("out_acco", 'S', out_acco);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR,out_acco);
            return fastMsg;
        }
   }

    public class pdfutuL_3_173_Request : BaseRequest, IRequest<pdfutuL_3_173_Response>
    {
        public pdfutuL_3_173_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdfutuL.3.173";
            }
        }

        public int pass_no { get; set; }
        public String out_acco { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("out_acco", 'S', out_acco);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR,out_acco);
            return fastMsg;
        }
   }

}
