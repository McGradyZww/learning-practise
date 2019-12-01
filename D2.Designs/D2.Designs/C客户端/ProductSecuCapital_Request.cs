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
    public class pdsecuL_2_8_Request : BaseRequest, IRequest<pdsecuL_2_8_Response>
    {
        public pdsecuL_2_8_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.2.8";
            }
        }

        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public String crncy_type { get; set; }
        public double occur_amt { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("crncy_type", 'S', crncy_type);
            packer.AddField("occur_amt", 'D', occur_amt);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_AMT_FLOAT,occur_amt);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pdsecuL_2_9_Request : BaseRequest, IRequest<pdsecuL_2_9_Response>
    {
        public pdsecuL_2_9_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.2.9";
            }
        }

        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public String crncy_type { get; set; }
        public double occur_amt { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("crncy_type", 'S', crncy_type);
            packer.AddField("occur_amt", 'D', occur_amt);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_AMT_FLOAT,occur_amt);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pdsecuL_2_10_Request : BaseRequest, IRequest<pdsecuL_2_10_Response>
    {
        public pdsecuL_2_10_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.2.10";
            }
        }

        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public int exch_group_no { get; set; }
        public String crncy_type { get; set; }
        public double occur_amt { get; set; }
        public double occur_share { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("crncy_type", 'S', crncy_type);
            packer.AddField("occur_amt", 'D', occur_amt);
            packer.AddField("occur_share", 'D', occur_share);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_AMT_FLOAT,occur_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_SHARE_FLOAT,occur_share);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pdsecuL_2_11_Request : BaseRequest, IRequest<pdsecuL_2_11_Response>
    {
        public pdsecuL_2_11_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.2.11";
            }
        }

        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public int exch_group_no { get; set; }
        public String crncy_type { get; set; }
        public double occur_amt { get; set; }
        public double occur_share { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("crncy_type", 'S', crncy_type);
            packer.AddField("occur_amt", 'D', occur_amt);
            packer.AddField("occur_share", 'D', occur_share);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_AMT_FLOAT,occur_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_SHARE_FLOAT,occur_share);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pdsecuL_2_32_Request : BaseRequest, IRequest<pdsecuL_2_32_Response>
    {
        public pdsecuL_2_32_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.2.32";
            }
        }

        public int asset_acco_no { get; set; }
        public int exch_group_no { get; set; }
        public String crncy_type { get; set; }
        public double occur_amt { get; set; }
        public int expire_date { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("crncy_type", 'S', crncy_type);
            packer.AddField("occur_amt", 'D', occur_amt);
            packer.AddField("expire_date", 'I', expire_date);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_AMT_FLOAT,occur_amt);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXPIRE_DATE_INT,expire_date);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pdsecuL_2_33_Request : BaseRequest, IRequest<pdsecuL_2_33_Response>
    {
        public pdsecuL_2_33_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.2.33";
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

    public class pdsecuL_2_34_Request : BaseRequest, IRequest<pdsecuL_2_34_Response>
    {
        public pdsecuL_2_34_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.2.34";
            }
        }

        public int asset_acco_no { get; set; }
        public int exch_group_no { get; set; }
        public String crncy_type { get; set; }
        public double occur_amt { get; set; }
        public int expire_date { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("crncy_type", 'S', crncy_type);
            packer.AddField("occur_amt", 'D', occur_amt);
            packer.AddField("expire_date", 'I', expire_date);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_AMT_FLOAT,occur_amt);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXPIRE_DATE_INT,expire_date);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pdsecuL_2_35_Request : BaseRequest, IRequest<pdsecuL_2_35_Response>
    {
        public pdsecuL_2_35_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.2.35";
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

    public class pdsecuL_2_37_Request : BaseRequest, IRequest<pdsecuL_2_37_Response>
    {
        public pdsecuL_2_37_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.2.37";
            }
        }

        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public int exch_group_no { get; set; }
        public String crncy_type_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("crncy_type_str", 'S', crncy_type_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR_STR,crncy_type_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pdsecuL_2_38_Request : BaseRequest, IRequest<pdsecuL_2_38_Response>
    {
        public pdsecuL_2_38_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.2.38";
            }
        }

        public int begin_date { get; set; }
        public int end_date { get; set; }
        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public int exch_group_no { get; set; }
        public String crncy_type_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("crncy_type_str", 'S', crncy_type_str);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR_STR,crncy_type_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pdsecuL_2_39_Request : BaseRequest, IRequest<pdsecuL_2_39_Response>
    {
        public pdsecuL_2_39_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.2.39";
            }
        }

        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public int exch_group_no { get; set; }
        public String crncy_type_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("crncy_type_str", 'S', crncy_type_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR_STR,crncy_type_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pdsecuL_2_40_Request : BaseRequest, IRequest<pdsecuL_2_40_Response>
    {
        public pdsecuL_2_40_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.2.40";
            }
        }

        public int begin_date { get; set; }
        public int end_date { get; set; }
        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public int exch_group_no { get; set; }
        public String crncy_type_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("crncy_type_str", 'S', crncy_type_str);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR_STR,crncy_type_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pdsecuL_2_41_Request : BaseRequest, IRequest<pdsecuL_2_41_Response>
    {
        public pdsecuL_2_41_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.2.41";
            }
        }

        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public int exch_group_no { get; set; }
        public int frozen_type { get; set; }
        public String jour_status { get; set; }
        public String crncy_type_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("frozen_type", 'I', frozen_type);
            packer.AddField("jour_status", 'S', jour_status);
            packer.AddField("crncy_type_str", 'S', crncy_type_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_TYPE_INT,frozen_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_STATUS_STR,jour_status);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR_STR,crncy_type_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pdsecuL_2_42_Request : BaseRequest, IRequest<pdsecuL_2_42_Response>
    {
        public pdsecuL_2_42_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.2.42";
            }
        }

        public int begin_date { get; set; }
        public int end_date { get; set; }
        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public int exch_group_no { get; set; }
        public int frozen_type { get; set; }
        public String crncy_type_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("frozen_type", 'I', frozen_type);
            packer.AddField("crncy_type_str", 'S', crncy_type_str);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_TYPE_INT,frozen_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR_STR,crncy_type_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pdsecuL_2_43_Request : BaseRequest, IRequest<pdsecuL_2_43_Response>
    {
        public pdsecuL_2_43_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.2.43";
            }
        }

        public int asset_acco_no { get; set; }
        public int exch_group_no { get; set; }
        public String crncy_type { get; set; }
        public double total_rece_amt { get; set; }
        public double total_payab_amt { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("crncy_type", 'S', crncy_type);
            packer.AddField("total_rece_amt", 'D', total_rece_amt);
            packer.AddField("total_payab_amt", 'D', total_payab_amt);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_RECE_AMT_FLOAT,total_rece_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_PAYAB_AMT_FLOAT,total_payab_amt);
            return fastMsg;
        }
   }

    public class pdsecuL_2_44_Request : BaseRequest, IRequest<pdsecuL_2_44_Response>
    {
        public pdsecuL_2_44_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.2.44";
            }
        }

        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public String crncy_type { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("crncy_type", 'S', crncy_type);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pdsecuL_2_51_Request : BaseRequest, IRequest<pdsecuL_2_51_Response>
    {
        public pdsecuL_2_51_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.2.51";
            }
        }

        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public String crncy_type { get; set; }
        public double occur_amt { get; set; }
        public int is_change_prod_capital { get; set; }
        public int is_change_exch_group_capital { get; set; }
        public int exch_group_no { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("crncy_type", 'S', crncy_type);
            packer.AddField("occur_amt", 'D', occur_amt);
            packer.AddField("is_change_prod_capital", 'I', is_change_prod_capital);
            packer.AddField("is_change_exch_group_capital", 'I', is_change_exch_group_capital);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_AMT_FLOAT,occur_amt);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_CHANGE_PROD_CAPITAL_INT,is_change_prod_capital);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_CHANGE_EXCH_GROUP_CAPITAL_INT,is_change_exch_group_capital);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pdsecuL_2_52_Request : BaseRequest, IRequest<pdsecuL_2_52_Response>
    {
        public pdsecuL_2_52_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.2.52";
            }
        }

        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public String crncy_type { get; set; }
        public double occur_amt { get; set; }
        public int expire_date { get; set; }
        public int is_change_exch_group_capital { get; set; }
        public int exch_group_no { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("crncy_type", 'S', crncy_type);
            packer.AddField("occur_amt", 'D', occur_amt);
            packer.AddField("expire_date", 'I', expire_date);
            packer.AddField("is_change_exch_group_capital", 'I', is_change_exch_group_capital);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_AMT_FLOAT,occur_amt);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXPIRE_DATE_INT,expire_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_CHANGE_EXCH_GROUP_CAPITAL_INT,is_change_exch_group_capital);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pdsecuL_2_53_Request : BaseRequest, IRequest<pdsecuL_2_53_Response>
    {
        public pdsecuL_2_53_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.2.53";
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

    public class pdsecuL_2_54_Request : BaseRequest, IRequest<pdsecuL_2_54_Response>
    {
        public pdsecuL_2_54_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.2.54";
            }
        }

        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public String crncy_type { get; set; }
        public double occur_amt { get; set; }
        public int expire_date { get; set; }
        public int is_change_exch_group_capital { get; set; }
        public int exch_group_no { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("crncy_type", 'S', crncy_type);
            packer.AddField("occur_amt", 'D', occur_amt);
            packer.AddField("expire_date", 'I', expire_date);
            packer.AddField("is_change_exch_group_capital", 'I', is_change_exch_group_capital);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_AMT_FLOAT,occur_amt);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXPIRE_DATE_INT,expire_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_CHANGE_EXCH_GROUP_CAPITAL_INT,is_change_exch_group_capital);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pdsecuL_2_55_Request : BaseRequest, IRequest<pdsecuL_2_55_Response>
    {
        public pdsecuL_2_55_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.2.55";
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

    public class pdsecuL_2_57_Request : BaseRequest, IRequest<pdsecuL_2_57_Response>
    {
        public pdsecuL_2_57_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.2.57";
            }
        }

        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public String crncy_type_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("crncy_type_str", 'S', crncy_type_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR_STR,crncy_type_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pdsecuL_2_58_Request : BaseRequest, IRequest<pdsecuL_2_58_Response>
    {
        public pdsecuL_2_58_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.2.58";
            }
        }

        public int begin_date { get; set; }
        public int end_date { get; set; }
        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public String crncy_type_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("crncy_type_str", 'S', crncy_type_str);
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
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR_STR,crncy_type_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pdsecuL_2_59_Request : BaseRequest, IRequest<pdsecuL_2_59_Response>
    {
        public pdsecuL_2_59_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.2.59";
            }
        }

        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public String crncy_type_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("crncy_type_str", 'S', crncy_type_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR_STR,crncy_type_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pdsecuL_2_60_Request : BaseRequest, IRequest<pdsecuL_2_60_Response>
    {
        public pdsecuL_2_60_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.2.60";
            }
        }

        public int begin_date { get; set; }
        public int end_date { get; set; }
        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public String crncy_type_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("crncy_type_str", 'S', crncy_type_str);
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
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR_STR,crncy_type_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pdsecuL_2_61_Request : BaseRequest, IRequest<pdsecuL_2_61_Response>
    {
        public pdsecuL_2_61_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.2.61";
            }
        }

        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public int frozen_type { get; set; }
        public String jour_status { get; set; }
        public String crncy_type_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("frozen_type", 'I', frozen_type);
            packer.AddField("jour_status", 'S', jour_status);
            packer.AddField("crncy_type_str", 'S', crncy_type_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_TYPE_INT,frozen_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_STATUS_STR,jour_status);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR_STR,crncy_type_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pdsecuL_2_62_Request : BaseRequest, IRequest<pdsecuL_2_62_Response>
    {
        public pdsecuL_2_62_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.2.62";
            }
        }

        public int begin_date { get; set; }
        public int end_date { get; set; }
        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public int frozen_type { get; set; }
        public String crncy_type_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("frozen_type", 'I', frozen_type);
            packer.AddField("crncy_type_str", 'S', crncy_type_str);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_TYPE_INT,frozen_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR_STR,crncy_type_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pdsecuL_2_63_Request : BaseRequest, IRequest<pdsecuL_2_63_Response>
    {
        public pdsecuL_2_63_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.2.63";
            }
        }

        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public String crncy_type { get; set; }
        public double total_rece_amt { get; set; }
        public double total_payab_amt { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("crncy_type", 'S', crncy_type);
            packer.AddField("total_rece_amt", 'D', total_rece_amt);
            packer.AddField("total_payab_amt", 'D', total_payab_amt);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_RECE_AMT_FLOAT,total_rece_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_PAYAB_AMT_FLOAT,total_payab_amt);
            return fastMsg;
        }
   }

    public class pdsecuL_2_101_Request : BaseRequest, IRequest<pdsecuL_2_101_Response>
    {
        public pdsecuL_2_101_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.2.101";
            }
        }

        public int init_date { get; set; }
        public ulong pass_money_jour_no { get; set; }
        public int pass_no { get; set; }
        public String out_acco { get; set; }
        public int busi_flag { get; set; }
        public String crncy_type { get; set; }
        public double entry_amt { get; set; }
        public double entry_end_amt { get; set; }
        public int exch_no { get; set; }
        public String stock_acco { get; set; }
        public String stock_code { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("init_date", 'I', init_date);
            packer.AddField("pass_money_jour_no", 'L', pass_money_jour_no);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("out_acco", 'S', out_acco);
            packer.AddField("busi_flag", 'I', busi_flag);
            packer.AddField("crncy_type", 'S', crncy_type);
            packer.AddField("entry_amt", 'D', entry_amt);
            packer.AddField("entry_end_amt", 'D', entry_end_amt);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_acco", 'S', stock_acco);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_PASS_MONEY_JOUR_NO_INT64,pass_money_jour_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR,out_acco);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT,busi_flag);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_AMT_FLOAT,entry_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_END_AMT_FLOAT,entry_end_amt);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR,stock_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class pdsecuL_2_103_Request : BaseRequest, IRequest<pdsecuL_2_103_Response>
    {
        public pdsecuL_2_103_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.2.103";
            }
        }

        public int pass_no { get; set; }
        public String out_acco { get; set; }
        public String crncy_type_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("out_acco", 'S', out_acco);
            packer.AddField("crncy_type_str", 'S', crncy_type_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR,out_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR_STR,crncy_type_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pdsecuL_2_171_Request : BaseRequest, IRequest<pdsecuL_2_171_Response>
    {
        public pdsecuL_2_171_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.2.171";
            }
        }

        public int pass_no { get; set; }
        public String out_acco { get; set; }
        public String crncy_type { get; set; }
        public double out_curr_amt { get; set; }
        public double out_enable_amt { get; set; }
        public double out_frozen_amt { get; set; }
        public double out_unfroz_amt { get; set; }
        public double out_total_payab_amt { get; set; }
        public double out_total_rece_amt { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("out_acco", 'S', out_acco);
            packer.AddField("crncy_type", 'S', crncy_type);
            packer.AddField("out_curr_amt", 'D', out_curr_amt);
            packer.AddField("out_enable_amt", 'D', out_enable_amt);
            packer.AddField("out_frozen_amt", 'D', out_frozen_amt);
            packer.AddField("out_unfroz_amt", 'D', out_unfroz_amt);
            packer.AddField("out_total_payab_amt", 'D', out_total_payab_amt);
            packer.AddField("out_total_rece_amt", 'D', out_total_rece_amt);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR,out_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_CURR_AMT_FLOAT,out_curr_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ENABLE_AMT_FLOAT,out_enable_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_FROZEN_AMT_FLOAT,out_frozen_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_UNFROZ_AMT_FLOAT,out_unfroz_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_TOTAL_PAYAB_AMT_FLOAT,out_total_payab_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_TOTAL_RECE_AMT_FLOAT,out_total_rece_amt);
            return fastMsg;
        }
   }

    public class pdsecuL_2_64_Request : BaseRequest, IRequest<pdsecuL_2_64_Response>
    {
        public pdsecuL_2_64_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.2.64";
            }
        }

        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public String crncy_type { get; set; }
        public double total_rece_amt { get; set; }
        public double total_payab_amt { get; set; }
        public int is_change_prod_capital { get; set; }
        public int is_change_exch_group_capital { get; set; }
        public int exch_group_no { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("crncy_type", 'S', crncy_type);
            packer.AddField("total_rece_amt", 'D', total_rece_amt);
            packer.AddField("total_payab_amt", 'D', total_payab_amt);
            packer.AddField("is_change_prod_capital", 'I', is_change_prod_capital);
            packer.AddField("is_change_exch_group_capital", 'I', is_change_exch_group_capital);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_RECE_AMT_FLOAT,total_rece_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_PAYAB_AMT_FLOAT,total_payab_amt);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_CHANGE_PROD_CAPITAL_INT,is_change_prod_capital);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_CHANGE_EXCH_GROUP_CAPITAL_INT,is_change_exch_group_capital);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pdsecuL_2_65_Request : BaseRequest, IRequest<pdsecuL_2_65_Response>
    {
        public pdsecuL_2_65_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.2.65";
            }
        }

        public int pass_no { get; set; }
        public String out_acco { get; set; }
        public int trans_date { get; set; }
        public int trans_time { get; set; }
        public String bank_code { get; set; }
        public String bank_name { get; set; }
        public int busi_flag { get; set; }
        public double occur_amt { get; set; }
        public String crncy_type { get; set; }
        public String trans_status { get; set; }
        public String bank_jour_no { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("out_acco", 'S', out_acco);
            packer.AddField("trans_date", 'I', trans_date);
            packer.AddField("trans_time", 'I', trans_time);
            packer.AddField("bank_code", 'S', bank_code);
            packer.AddField("bank_name", 'S', bank_name);
            packer.AddField("busi_flag", 'I', busi_flag);
            packer.AddField("occur_amt", 'D', occur_amt);
            packer.AddField("crncy_type", 'S', crncy_type);
            packer.AddField("trans_status", 'S', trans_status);
            packer.AddField("bank_jour_no", 'S', bank_jour_no);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR,out_acco);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_DATE_INT,trans_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_TIME_INT,trans_time);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_BANK_CODE_STR,bank_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_BANK_NAME_STR,bank_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT,busi_flag);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_AMT_FLOAT,occur_amt);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_STATUS_STR,trans_status);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_BANK_JOUR_NO_STR,bank_jour_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class pdsecuL_2_66_Request : BaseRequest, IRequest<pdsecuL_2_66_Response>
    {
        public pdsecuL_2_66_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.2.66";
            }
        }

        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public double target_amt { get; set; }
        public double frozen_amt { get; set; }
        public double unfroz_amt { get; set; }
        public double total_rece_amt { get; set; }
        public double total_payab_amt { get; set; }
        public String crncy_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("target_amt", 'D', target_amt);
            packer.AddField("frozen_amt", 'D', frozen_amt);
            packer.AddField("unfroz_amt", 'D', unfroz_amt);
            packer.AddField("total_rece_amt", 'D', total_rece_amt);
            packer.AddField("total_payab_amt", 'D', total_payab_amt);
            packer.AddField("crncy_type", 'S', crncy_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_AMT_FLOAT,target_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_AMT_FLOAT,frozen_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_AMT_FLOAT,unfroz_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_RECE_AMT_FLOAT,total_rece_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_PAYAB_AMT_FLOAT,total_payab_amt);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            return fastMsg;
        }
   }

    public class pdsecuL_2_67_Request : BaseRequest, IRequest<pdsecuL_2_67_Response>
    {
        public pdsecuL_2_67_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.2.67";
            }
        }

        public int exch_group_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_group_no", 'I', exch_group_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            return fastMsg;
        }
   }

    public class pdsecuL_2_68_Request : BaseRequest, IRequest<pdsecuL_2_68_Response>
    {
        public pdsecuL_2_68_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.2.68";
            }
        }

        public int exch_group_no { get; set; }
        public int target_exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public double occur_amt { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("target_exch_group_no", 'I', target_exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("occur_amt", 'D', occur_amt);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_EXCH_GROUP_NO_INT,target_exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_AMT_FLOAT,occur_amt);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pdsecuL_2_69_Request : BaseRequest, IRequest<pdsecuL_2_69_Response>
    {
        public pdsecuL_2_69_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.2.69";
            }
        }

        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            return fastMsg;
        }
   }

    public class pdsecuL_2_70_Request : BaseRequest, IRequest<pdsecuL_2_70_Response>
    {
        public pdsecuL_2_70_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.2.70";
            }
        }

        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public int exch_group_no { get; set; }
        public String crncy_type { get; set; }
        public ulong row_id { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("crncy_type", 'S', crncy_type);
            packer.AddField("row_id", 'L', row_id);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            return fastMsg;
        }
   }

    public class pdsecuL_2_71_Request : BaseRequest, IRequest<pdsecuL_2_71_Response>
    {
        public pdsecuL_2_71_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.2.71";
            }
        }

        public int init_date { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public int pass_no { get; set; }
        public String out_acco { get; set; }
        public String crncy_type { get; set; }
        public double out_curr_amt { get; set; }
        public double out_enable_amt { get; set; }
        public double out_frozen_amt { get; set; }
        public double out_unfroz_amt { get; set; }
        public double out_total_payab_amt { get; set; }
        public double out_total_rece_amt { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("init_date", 'I', init_date);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("out_acco", 'S', out_acco);
            packer.AddField("crncy_type", 'S', crncy_type);
            packer.AddField("out_curr_amt", 'D', out_curr_amt);
            packer.AddField("out_enable_amt", 'D', out_enable_amt);
            packer.AddField("out_frozen_amt", 'D', out_frozen_amt);
            packer.AddField("out_unfroz_amt", 'D', out_unfroz_amt);
            packer.AddField("out_total_payab_amt", 'D', out_total_payab_amt);
            packer.AddField("out_total_rece_amt", 'D', out_total_rece_amt);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR,out_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_CURR_AMT_FLOAT,out_curr_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ENABLE_AMT_FLOAT,out_enable_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_FROZEN_AMT_FLOAT,out_frozen_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_UNFROZ_AMT_FLOAT,out_unfroz_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_TOTAL_PAYAB_AMT_FLOAT,out_total_payab_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_TOTAL_RECE_AMT_FLOAT,out_total_rece_amt);
            return fastMsg;
        }
   }

    public class pdsecuL_2_72_Request : BaseRequest, IRequest<pdsecuL_2_72_Response>
    {
        public pdsecuL_2_72_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.2.72";
            }
        }

        public int pass_no { get; set; }
        public String out_acco { get; set; }
        public double out_curr_amt { get; set; }
        public double out_enable_amt { get; set; }
        public double out_frozen_amt { get; set; }
        public double out_unfroz_amt { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("out_acco", 'S', out_acco);
            packer.AddField("out_curr_amt", 'D', out_curr_amt);
            packer.AddField("out_enable_amt", 'D', out_enable_amt);
            packer.AddField("out_frozen_amt", 'D', out_frozen_amt);
            packer.AddField("out_unfroz_amt", 'D', out_unfroz_amt);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR,out_acco);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_CURR_AMT_FLOAT,out_curr_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ENABLE_AMT_FLOAT,out_enable_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_FROZEN_AMT_FLOAT,out_frozen_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_UNFROZ_AMT_FLOAT,out_unfroz_amt);
            return fastMsg;
        }
   }

    public class pdsecuL_2_73_Request : BaseRequest, IRequest<pdsecuL_2_73_Response>
    {
        public pdsecuL_2_73_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.2.73";
            }
        }

        public int pass_no { get; set; }
        public String out_acco { get; set; }
        public double out_nav_asset { get; set; }
        public double out_stock_asset { get; set; }
        public double out_bond_asset { get; set; }
        public double out_fund_asset { get; set; }
        public double out_repo_asset { get; set; }
        public double out_total_rece_amt { get; set; }
        public double out_total_payab_amt { get; set; }
        public double out_other_asset { get; set; }
        public double out_option_asset { get; set; }
        public double out_fina_debt { get; set; }
        public double out_loan_debt { get; set; }
        public double out_futu_asset { get; set; }
        public double out_margin_amt { get; set; }
        public double out_shsz_T0_avail { get; set; }
        public double out_shsz_T1_avail { get; set; }
        public double out_shhk_avail_amt { get; set; }
        public double out_szhk_avail_amt { get; set; }
        public double out_cash_asset { get; set; }
        public double out_futu_pandl_amt { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("out_acco", 'S', out_acco);
            packer.AddField("out_nav_asset", 'D', out_nav_asset);
            packer.AddField("out_stock_asset", 'D', out_stock_asset);
            packer.AddField("out_bond_asset", 'D', out_bond_asset);
            packer.AddField("out_fund_asset", 'D', out_fund_asset);
            packer.AddField("out_repo_asset", 'D', out_repo_asset);
            packer.AddField("out_total_rece_amt", 'D', out_total_rece_amt);
            packer.AddField("out_total_payab_amt", 'D', out_total_payab_amt);
            packer.AddField("out_other_asset", 'D', out_other_asset);
            packer.AddField("out_option_asset", 'D', out_option_asset);
            packer.AddField("out_fina_debt", 'D', out_fina_debt);
            packer.AddField("out_loan_debt", 'D', out_loan_debt);
            packer.AddField("out_futu_asset", 'D', out_futu_asset);
            packer.AddField("out_margin_amt", 'D', out_margin_amt);
            packer.AddField("out_shsz_T0_avail", 'D', out_shsz_T0_avail);
            packer.AddField("out_shsz_T1_avail", 'D', out_shsz_T1_avail);
            packer.AddField("out_shhk_avail_amt", 'D', out_shhk_avail_amt);
            packer.AddField("out_szhk_avail_amt", 'D', out_szhk_avail_amt);
            packer.AddField("out_cash_asset", 'D', out_cash_asset);
            packer.AddField("out_futu_pandl_amt", 'D', out_futu_pandl_amt);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR,out_acco);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_NAV_ASSET_FLOAT,out_nav_asset);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_STOCK_ASSET_FLOAT,out_stock_asset);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_BOND_ASSET_FLOAT,out_bond_asset);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_FUND_ASSET_FLOAT,out_fund_asset);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_REPO_ASSET_FLOAT,out_repo_asset);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_TOTAL_RECE_AMT_FLOAT,out_total_rece_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_TOTAL_PAYAB_AMT_FLOAT,out_total_payab_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_OTHER_ASSET_FLOAT,out_other_asset);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_OPTION_ASSET_FLOAT,out_option_asset);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_FINA_DEBT_FLOAT,out_fina_debt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_LOAN_DEBT_FLOAT,out_loan_debt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_FUTU_ASSET_FLOAT,out_futu_asset);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_MARGIN_AMT_FLOAT,out_margin_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_SHSZ_T0_AVAIL_FLOAT,out_shsz_T0_avail);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_SHSZ_T1_AVAIL_FLOAT,out_shsz_T1_avail);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_SHHK_AVAIL_AMT_FLOAT,out_shhk_avail_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_SZHK_AVAIL_AMT_FLOAT,out_szhk_avail_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_CASH_ASSET_FLOAT,out_cash_asset);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_FUTU_PANDL_AMT_FLOAT,out_futu_pandl_amt);
            return fastMsg;
        }
   }

    public class pdsecuL_2_80_Request : BaseRequest, IRequest<pdsecuL_2_80_Response>
    {
        public pdsecuL_2_80_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.2.80";
            }
        }

        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public int exch_group_no { get; set; }
        public String crncy_type_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public int target_co_no { get; set; }
        public int target_opor_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("crncy_type_str", 'S', crncy_type_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
            packer.AddField("target_co_no", 'I', target_co_no);
            packer.AddField("target_opor_no", 'I', target_opor_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR_STR,crncy_type_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CO_NO_INT,target_co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_OPOR_NO_INT,target_opor_no);
            return fastMsg;
        }
   }

    public class pdsecuL_2_81_Request : BaseRequest, IRequest<pdsecuL_2_81_Response>
    {
        public pdsecuL_2_81_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.2.81";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public String asset_acco_no_str { get; set; }
        public String dist_amt_str { get; set; }
        public int redempt_type { get; set; }
        public double redempt_amt { get; set; }
        public double redempt_qty { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no_str", 'S', asset_acco_no_str);
            packer.AddField("dist_amt_str", 'S', dist_amt_str);
            packer.AddField("redempt_type", 'I', redempt_type);
            packer.AddField("redempt_amt", 'D', redempt_amt);
            packer.AddField("redempt_qty", 'D', redempt_qty);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_STR_STR,asset_acco_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_DIST_AMT_STR_STR,dist_amt_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REDEMPT_TYPE_INT,redempt_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REDEMPT_AMT_FLOAT,redempt_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REDEMPT_QTY_FLOAT,redempt_qty);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pdsecuL_2_82_Request : BaseRequest, IRequest<pdsecuL_2_82_Response>
    {
        public pdsecuL_2_82_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.2.82";
            }
        }

        public ulong row_id { get; set; }
        public int init_date { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public int record_batch_no { get; set; }
        public int redempt_type { get; set; }
        public double redempt_amt { get; set; }
        public double redempt_qty { get; set; }
        public String exch_group_no_str { get; set; }
        public String exgp_dist_amt_str { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("init_date", 'I', init_date);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("record_batch_no", 'I', record_batch_no);
            packer.AddField("redempt_type", 'I', redempt_type);
            packer.AddField("redempt_amt", 'D', redempt_amt);
            packer.AddField("redempt_qty", 'D', redempt_qty);
            packer.AddField("exch_group_no_str", 'S', exch_group_no_str);
            packer.AddField("exgp_dist_amt_str", 'S', exgp_dist_amt_str);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RECORD_BATCH_NO_INT,record_batch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REDEMPT_TYPE_INT,redempt_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REDEMPT_AMT_FLOAT,redempt_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REDEMPT_QTY_FLOAT,redempt_qty);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_STR_STR,exch_group_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXGP_DIST_AMT_STR_STR,exgp_dist_amt_str);
            return fastMsg;
        }
   }

    public class pdsecuL_2_83_Request : BaseRequest, IRequest<pdsecuL_2_83_Response>
    {
        public pdsecuL_2_83_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.2.83";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public int redempt_type { get; set; }
        public int record_batch_no { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("redempt_type", 'I', redempt_type);
            packer.AddField("record_batch_no", 'I', record_batch_no);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REDEMPT_TYPE_INT,redempt_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RECORD_BATCH_NO_INT,record_batch_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pdsecuL_2_84_Request : BaseRequest, IRequest<pdsecuL_2_84_Response>
    {
        public pdsecuL_2_84_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.2.84";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public int redempt_type { get; set; }
        public int record_batch_no { get; set; }
        public int begin_date { get; set; }
        public int end_date { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("redempt_type", 'I', redempt_type);
            packer.AddField("record_batch_no", 'I', record_batch_no);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REDEMPT_TYPE_INT,redempt_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RECORD_BATCH_NO_INT,record_batch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT,end_date);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pdsecuL_2_74_Request : BaseRequest, IRequest<pdsecuL_2_74_Response>
    {
        public pdsecuL_2_74_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.2.74";
            }
        }

        public int pass_no { get; set; }
        public String out_acco { get; set; }
        public int init_date { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("out_acco", 'S', out_acco);
            packer.AddField("init_date", 'I', init_date);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR,out_acco);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pdsecuL_2_75_Request : BaseRequest, IRequest<pdsecuL_2_75_Response>
    {
        public pdsecuL_2_75_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.2.75";
            }
        }

        public int co_no { get; set; }
        public String pd_no_str { get; set; }
        public int asset_acco_no { get; set; }
        public int pass_no { get; set; }
        public String out_acco { get; set; }
        public String deal_flag_query_str { get; set; }
        public int filter_diff_cond { get; set; }
        public int asset_sync_flag { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no_str", 'S', pd_no_str);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("out_acco", 'S', out_acco);
            packer.AddField("deal_flag_query_str", 'S', deal_flag_query_str);
            packer.AddField("filter_diff_cond", 'I', filter_diff_cond);
            packer.AddField("asset_sync_flag", 'I', asset_sync_flag);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_STR_STR,pd_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR,out_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_FLAG_QUERY_STR_STR,deal_flag_query_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FILTER_DIFF_COND_INT,filter_diff_cond);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_SYNC_FLAG_INT,asset_sync_flag);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pdsecuL_2_76_Request : BaseRequest, IRequest<pdsecuL_2_76_Response>
    {
        public pdsecuL_2_76_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.2.76";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public int exch_group_no { get; set; }
        public String crncy_type_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("crncy_type_str", 'S', crncy_type_str);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR_STR,crncy_type_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pdsecuL_2_77_Request : BaseRequest, IRequest<pdsecuL_2_77_Response>
    {
        public pdsecuL_2_77_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.2.77";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public String crncy_type { get; set; }
        public double occur_amt { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("crncy_type", 'S', crncy_type);
            packer.AddField("occur_amt", 'D', occur_amt);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_AMT_FLOAT,occur_amt);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pdsecuL_2_78_Request : BaseRequest, IRequest<pdsecuL_2_78_Response>
    {
        public pdsecuL_2_78_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.2.78";
            }
        }

        public int co_no { get; set; }
        public int asset_acco_no { get; set; }
        public int pd_no { get; set; }
        public String crncy_type { get; set; }
        public double occur_amt { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("crncy_type", 'S', crncy_type);
            packer.AddField("occur_amt", 'D', occur_amt);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_AMT_FLOAT,occur_amt);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pdsecuL_2_79_Request : BaseRequest, IRequest<pdsecuL_2_79_Response>
    {
        public pdsecuL_2_79_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.2.79";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public String crncy_type { get; set; }
        public double occur_amt { get; set; }
        public int is_change_prod_capital { get; set; }
        public int is_change_exch_group_capital { get; set; }
        public int exch_group_no { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("crncy_type", 'S', crncy_type);
            packer.AddField("occur_amt", 'D', occur_amt);
            packer.AddField("is_change_prod_capital", 'I', is_change_prod_capital);
            packer.AddField("is_change_exch_group_capital", 'I', is_change_exch_group_capital);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_AMT_FLOAT,occur_amt);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_CHANGE_PROD_CAPITAL_INT,is_change_prod_capital);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_CHANGE_EXCH_GROUP_CAPITAL_INT,is_change_exch_group_capital);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pdsecuL_2_85_Request : BaseRequest, IRequest<pdsecuL_2_85_Response>
    {
        public pdsecuL_2_85_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.2.85";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public String crncy_type { get; set; }
        public double occur_amt { get; set; }
        public int expire_date { get; set; }
        public int is_change_exch_group_capital { get; set; }
        public int exch_group_no { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("crncy_type", 'S', crncy_type);
            packer.AddField("occur_amt", 'D', occur_amt);
            packer.AddField("expire_date", 'I', expire_date);
            packer.AddField("is_change_exch_group_capital", 'I', is_change_exch_group_capital);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_AMT_FLOAT,occur_amt);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXPIRE_DATE_INT,expire_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_CHANGE_EXCH_GROUP_CAPITAL_INT,is_change_exch_group_capital);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pdsecuL_2_86_Request : BaseRequest, IRequest<pdsecuL_2_86_Response>
    {
        public pdsecuL_2_86_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.2.86";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public String crncy_type { get; set; }
        public double occur_amt { get; set; }
        public int expire_date { get; set; }
        public int is_change_exch_group_capital { get; set; }
        public int exch_group_no { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("crncy_type", 'S', crncy_type);
            packer.AddField("occur_amt", 'D', occur_amt);
            packer.AddField("expire_date", 'I', expire_date);
            packer.AddField("is_change_exch_group_capital", 'I', is_change_exch_group_capital);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_AMT_FLOAT,occur_amt);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXPIRE_DATE_INT,expire_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_CHANGE_EXCH_GROUP_CAPITAL_INT,is_change_exch_group_capital);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pdsecuL_2_87_Request : BaseRequest, IRequest<pdsecuL_2_87_Response>
    {
        public pdsecuL_2_87_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.2.87";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public String crncy_type { get; set; }
        public double total_rece_amt { get; set; }
        public double total_payab_amt { get; set; }
        public int is_change_prod_capital { get; set; }
        public int is_change_exch_group_capital { get; set; }
        public int exch_group_no { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("crncy_type", 'S', crncy_type);
            packer.AddField("total_rece_amt", 'D', total_rece_amt);
            packer.AddField("total_payab_amt", 'D', total_payab_amt);
            packer.AddField("is_change_prod_capital", 'I', is_change_prod_capital);
            packer.AddField("is_change_exch_group_capital", 'I', is_change_exch_group_capital);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_RECE_AMT_FLOAT,total_rece_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_PAYAB_AMT_FLOAT,total_payab_amt);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_CHANGE_PROD_CAPITAL_INT,is_change_prod_capital);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_CHANGE_EXCH_GROUP_CAPITAL_INT,is_change_exch_group_capital);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pdsecuL_2_88_Request : BaseRequest, IRequest<pdsecuL_2_88_Response>
    {
        public pdsecuL_2_88_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.2.88";
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

    public class pdsecuL_2_89_Request : BaseRequest, IRequest<pdsecuL_2_89_Response>
    {
        public pdsecuL_2_89_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.2.89";
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

    public class pdsecuL_2_90_Request : BaseRequest, IRequest<pdsecuL_2_90_Response>
    {
        public pdsecuL_2_90_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.2.90";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public int frozen_type { get; set; }
        public String jour_status { get; set; }
        public String crncy_type_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("frozen_type", 'I', frozen_type);
            packer.AddField("jour_status", 'S', jour_status);
            packer.AddField("crncy_type_str", 'S', crncy_type_str);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_TYPE_INT,frozen_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_STATUS_STR,jour_status);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR_STR,crncy_type_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pdsecuL_2_91_Request : BaseRequest, IRequest<pdsecuL_2_91_Response>
    {
        public pdsecuL_2_91_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.2.91";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public int exch_group_no { get; set; }
        public String crncy_type { get; set; }
        public double occur_amt { get; set; }
        public double occur_share { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("crncy_type", 'S', crncy_type);
            packer.AddField("occur_amt", 'D', occur_amt);
            packer.AddField("occur_share", 'D', occur_share);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_AMT_FLOAT,occur_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_SHARE_FLOAT,occur_share);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pdsecuL_2_92_Request : BaseRequest, IRequest<pdsecuL_2_92_Response>
    {
        public pdsecuL_2_92_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.2.92";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public int exch_group_no { get; set; }
        public String crncy_type { get; set; }
        public double occur_amt { get; set; }
        public double occur_share { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("crncy_type", 'S', crncy_type);
            packer.AddField("occur_amt", 'D', occur_amt);
            packer.AddField("occur_share", 'D', occur_share);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_AMT_FLOAT,occur_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_SHARE_FLOAT,occur_share);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pdsecuL_2_93_Request : BaseRequest, IRequest<pdsecuL_2_93_Response>
    {
        public pdsecuL_2_93_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.2.93";
            }
        }

        public int co_no { get; set; }
        public int asset_acco_no { get; set; }
        public int exch_group_no { get; set; }
        public String crncy_type { get; set; }
        public double occur_amt { get; set; }
        public int expire_date { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("crncy_type", 'S', crncy_type);
            packer.AddField("occur_amt", 'D', occur_amt);
            packer.AddField("expire_date", 'I', expire_date);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_AMT_FLOAT,occur_amt);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXPIRE_DATE_INT,expire_date);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pdsecuL_2_94_Request : BaseRequest, IRequest<pdsecuL_2_94_Response>
    {
        public pdsecuL_2_94_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.2.94";
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

    public class pdsecuL_2_95_Request : BaseRequest, IRequest<pdsecuL_2_95_Response>
    {
        public pdsecuL_2_95_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.2.95";
            }
        }

        public int co_no { get; set; }
        public int asset_acco_no { get; set; }
        public int exch_group_no { get; set; }
        public String crncy_type { get; set; }
        public double occur_amt { get; set; }
        public int expire_date { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("crncy_type", 'S', crncy_type);
            packer.AddField("occur_amt", 'D', occur_amt);
            packer.AddField("expire_date", 'I', expire_date);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_AMT_FLOAT,occur_amt);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXPIRE_DATE_INT,expire_date);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pdsecuL_2_96_Request : BaseRequest, IRequest<pdsecuL_2_96_Response>
    {
        public pdsecuL_2_96_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.2.96";
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

    public class pdsecuL_2_97_Request : BaseRequest, IRequest<pdsecuL_2_97_Response>
    {
        public pdsecuL_2_97_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.2.97";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public int exch_group_no { get; set; }
        public int frozen_type { get; set; }
        public String jour_status { get; set; }
        public String crncy_type_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("frozen_type", 'I', frozen_type);
            packer.AddField("jour_status", 'S', jour_status);
            packer.AddField("crncy_type_str", 'S', crncy_type_str);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_TYPE_INT,frozen_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_STATUS_STR,jour_status);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR_STR,crncy_type_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pdsecuL_2_98_Request : BaseRequest, IRequest<pdsecuL_2_98_Response>
    {
        public pdsecuL_2_98_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.2.98";
            }
        }

        public int co_no { get; set; }
        public int asset_acco_no { get; set; }
        public int exch_group_no { get; set; }
        public String crncy_type { get; set; }
        public double total_rece_amt { get; set; }
        public double total_payab_amt { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("crncy_type", 'S', crncy_type);
            packer.AddField("total_rece_amt", 'D', total_rece_amt);
            packer.AddField("total_payab_amt", 'D', total_payab_amt);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_RECE_AMT_FLOAT,total_rece_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_PAYAB_AMT_FLOAT,total_payab_amt);
            return fastMsg;
        }
   }

    public class pdsecuL_2_99_Request : BaseRequest, IRequest<pdsecuL_2_99_Response>
    {
        public pdsecuL_2_99_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.2.99";
            }
        }

        public int co_no { get; set; }
        public int exch_group_no { get; set; }
        public int target_exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public double occur_amt { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("target_exch_group_no", 'I', target_exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("occur_amt", 'D', occur_amt);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_EXCH_GROUP_NO_INT,target_exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_AMT_FLOAT,occur_amt);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

}
