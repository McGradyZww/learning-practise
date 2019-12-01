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
    public class pdsecuL_9_1_Request : BaseRequest, IRequest<pdsecuL_9_1_Response>
    {
        public pdsecuL_9_1_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.9.1";
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

    public class pdsecuL_9_2_Request : BaseRequest, IRequest<pdsecuL_9_2_Response>
    {
        public pdsecuL_9_2_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.9.2";
            }
        }

        public String co_no_str { get; set; }
        public String pd_no_str { get; set; }
        public int asset_acco_no { get; set; }
        public String stock_code_str { get; set; }
        public String exch_no_str { get; set; }
        public int is_contain { get; set; }
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
            packer.AddField("co_no_str", 'S', co_no_str);
            packer.AddField("pd_no_str", 'S', pd_no_str);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("stock_code_str", 'S', stock_code_str);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("is_contain", 'I', is_contain);
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

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_STR_STR,co_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_STR_STR,pd_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR_STR,stock_code_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_CONTAIN_INT,is_contain);
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

    public class pdsecuL_9_3_Request : BaseRequest, IRequest<pdsecuL_9_3_Response>
    {
        public pdsecuL_9_3_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.9.3";
            }
        }

        public ulong row_id { get; set; }
        public int sync_deal_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("sync_deal_type", 'I', sync_deal_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SYNC_DEAL_TYPE_INT,sync_deal_type);
            return fastMsg;
        }
   }

    public class pdsecuL_9_5_Request : BaseRequest, IRequest<pdsecuL_9_5_Response>
    {
        public pdsecuL_9_5_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.9.5";
            }
        }

        public int pass_no { get; set; }
        public String out_acco { get; set; }
        public int exch_no { get; set; }
        public String stock_acco { get; set; }
        public String stock_code { get; set; }
        public double out_cost_price { get; set; }
        public double out_curr_qty { get; set; }
        public double out_enable_qty { get; set; }
        public double out_frozen_qty { get; set; }
        public double out_unfroz_qty { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("out_acco", 'S', out_acco);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_acco", 'S', stock_acco);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("out_cost_price", 'D', out_cost_price);
            packer.AddField("out_curr_qty", 'D', out_curr_qty);
            packer.AddField("out_enable_qty", 'D', out_enable_qty);
            packer.AddField("out_frozen_qty", 'D', out_frozen_qty);
            packer.AddField("out_unfroz_qty", 'D', out_unfroz_qty);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR,out_acco);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR,stock_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_COST_PRICE_FLOAT,out_cost_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_CURR_QTY_FLOAT,out_curr_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ENABLE_QTY_FLOAT,out_enable_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_FROZEN_QTY_FLOAT,out_frozen_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_UNFROZ_QTY_FLOAT,out_unfroz_qty);
            return fastMsg;
        }
   }

    public class pdsecuL_9_6_Request : BaseRequest, IRequest<pdsecuL_9_6_Response>
    {
        public pdsecuL_9_6_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.9.6";
            }
        }

        public int co_no { get; set; }
        public String pd_no_str { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no_str", 'S', pd_no_str);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_STR_STR,pd_no_str);
            return fastMsg;
        }
   }

    public class pdsecuL_9_7_Request : BaseRequest, IRequest<pdsecuL_9_7_Response>
    {
        public pdsecuL_9_7_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.9.7";
            }
        }

        public int co_no { get; set; }
        public String pd_no_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no_str", 'S', pd_no_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_STR_STR,pd_no_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pdsecuL_9_8_Request : BaseRequest, IRequest<pdsecuL_9_8_Response>
    {
        public pdsecuL_9_8_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.9.8";
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

    public class pdsecuL_9_9_Request : BaseRequest, IRequest<pdsecuL_9_9_Response>
    {
        public pdsecuL_9_9_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.9.9";
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

    public class pdsecuL_9_10_Request : BaseRequest, IRequest<pdsecuL_9_10_Response>
    {
        public pdsecuL_9_10_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.9.10";
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

    public class pdsecuL_9_11_Request : BaseRequest, IRequest<pdsecuL_9_11_Response>
    {
        public pdsecuL_9_11_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.9.11";
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

    public class pdsecuL_9_12_Request : BaseRequest, IRequest<pdsecuL_9_12_Response>
    {
        public pdsecuL_9_12_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.9.12";
            }
        }

        public String co_no_str { get; set; }
        public int pd_no { get; set; }
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
            packer.AddField("co_no_str", 'S', co_no_str);
            packer.AddField("pd_no", 'I', pd_no);
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

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_STR_STR,co_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
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

    public class pdsecuL_9_13_Request : BaseRequest, IRequest<pdsecuL_9_13_Response>
    {
        public pdsecuL_9_13_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.9.13";
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

    public class pdsecuL_9_31_Request : BaseRequest, IRequest<pdsecuL_9_31_Response>
    {
        public pdsecuL_9_31_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.9.31";
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

    public class pdsecuL_9_71_Request : BaseRequest, IRequest<pdsecuL_9_71_Response>
    {
        public pdsecuL_9_71_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.9.71";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public String exch_no_str { get; set; }
        public int stock_acco_no { get; set; }
        public String stock_code_no_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_acco_no", 'I', stock_acco_no);
            packer.AddField("stock_code_no_str", 'S', stock_code_no_str);
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
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT,stock_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_STR_STR,stock_code_no_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pdsecuL_9_72_Request : BaseRequest, IRequest<pdsecuL_9_72_Response>
    {
        public pdsecuL_9_72_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.9.72";
            }
        }

        public int begin_date { get; set; }
        public int end_date { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public String exch_no_str { get; set; }
        public int stock_acco_no { get; set; }
        public String stock_code_no_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_acco_no", 'I', stock_acco_no);
            packer.AddField("stock_code_no_str", 'S', stock_code_no_str);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT,stock_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_STR_STR,stock_code_no_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pdsecuL_9_81_Request : BaseRequest, IRequest<pdsecuL_9_81_Response>
    {
        public pdsecuL_9_81_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.9.81";
            }
        }

        public String co_no_str { get; set; }
        public String pd_no_str { get; set; }
        public String asset_acco_no_str { get; set; }
        public String busi_flag_str { get; set; }
        public String exch_no_str { get; set; }
        public int stock_acco_no { get; set; }
        public String stock_code_no_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no_str", 'S', co_no_str);
            packer.AddField("pd_no_str", 'S', pd_no_str);
            packer.AddField("asset_acco_no_str", 'S', asset_acco_no_str);
            packer.AddField("busi_flag_str", 'S', busi_flag_str);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_acco_no", 'I', stock_acco_no);
            packer.AddField("stock_code_no_str", 'S', stock_code_no_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_STR_STR,co_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_STR_STR,pd_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_STR_STR,asset_acco_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_STR_STR,busi_flag_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT,stock_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_STR_STR,stock_code_no_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pdsecuL_9_82_Request : BaseRequest, IRequest<pdsecuL_9_82_Response>
    {
        public pdsecuL_9_82_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.9.82";
            }
        }

        public int begin_date { get; set; }
        public int end_date { get; set; }
        public String co_no_str { get; set; }
        public String pd_no_str { get; set; }
        public String asset_acco_no_str { get; set; }
        public String busi_flag_str { get; set; }
        public String exch_no_str { get; set; }
        public int stock_acco_no { get; set; }
        public String stock_code_no_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("co_no_str", 'S', co_no_str);
            packer.AddField("pd_no_str", 'S', pd_no_str);
            packer.AddField("asset_acco_no_str", 'S', asset_acco_no_str);
            packer.AddField("busi_flag_str", 'S', busi_flag_str);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_acco_no", 'I', stock_acco_no);
            packer.AddField("stock_code_no_str", 'S', stock_code_no_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT,end_date);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_STR_STR,co_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_STR_STR,pd_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_STR_STR,asset_acco_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_STR_STR,busi_flag_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT,stock_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_STR_STR,stock_code_no_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pdsecuL_9_90_Request : BaseRequest, IRequest<pdsecuL_9_90_Response>
    {
        public pdsecuL_9_90_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.9.90";
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

    public class pdsecuL_9_91_Request : BaseRequest, IRequest<pdsecuL_9_91_Response>
    {
        public pdsecuL_9_91_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.9.91";
            }
        }

        public String co_no_str { get; set; }
        public String pd_no_str { get; set; }
        public int asset_acco_no { get; set; }
        public String stock_code_str { get; set; }
        public String exch_no_str { get; set; }
        public int is_contain { get; set; }
        public int pass_no { get; set; }
        public String out_acco { get; set; }
        public String deal_flag_query_str { get; set; }
        public int query_pass_no { get; set; }
        public int filter_diff_cond { get; set; }
        public int asset_sync_flag { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no_str", 'S', co_no_str);
            packer.AddField("pd_no_str", 'S', pd_no_str);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("stock_code_str", 'S', stock_code_str);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("is_contain", 'I', is_contain);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("out_acco", 'S', out_acco);
            packer.AddField("deal_flag_query_str", 'S', deal_flag_query_str);
            packer.AddField("query_pass_no", 'I', query_pass_no);
            packer.AddField("filter_diff_cond", 'I', filter_diff_cond);
            packer.AddField("asset_sync_flag", 'I', asset_sync_flag);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_STR_STR,co_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_STR_STR,pd_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR_STR,stock_code_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_CONTAIN_INT,is_contain);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR,out_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_FLAG_QUERY_STR_STR,deal_flag_query_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_PASS_NO_INT,query_pass_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FILTER_DIFF_COND_INT,filter_diff_cond);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_SYNC_FLAG_INT,asset_sync_flag);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pdsecuL_9_92_Request : BaseRequest, IRequest<pdsecuL_9_92_Response>
    {
        public pdsecuL_9_92_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.9.92";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public String exch_no_str { get; set; }
        public int stock_acco_no { get; set; }
        public String stock_type_str { get; set; }
        public String stock_code_no_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_acco_no", 'I', stock_acco_no);
            packer.AddField("stock_type_str", 'S', stock_type_str);
            packer.AddField("stock_code_no_str", 'S', stock_code_no_str);
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
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT,stock_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_STR_STR,stock_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_STR_STR,stock_code_no_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pdsecuL_9_93_Request : BaseRequest, IRequest<pdsecuL_9_93_Response>
    {
        public pdsecuL_9_93_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.9.93";
            }
        }

        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public int exch_no { get; set; }
        public int stock_acco_no { get; set; }
        public int stock_code_no { get; set; }
        public int invest_type { get; set; }
        public double occur_cost_amt { get; set; }
        public double occur_intrst_amt { get; set; }
        public String oper_remark_info { get; set; }
        public int co_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_acco_no", 'I', stock_acco_no);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("invest_type", 'I', invest_type);
            packer.AddField("occur_cost_amt", 'D', occur_cost_amt);
            packer.AddField("occur_intrst_amt", 'D', occur_intrst_amt);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
            packer.AddField("co_no", 'I', co_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT,stock_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INVEST_TYPE_INT,invest_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_COST_AMT_FLOAT,occur_cost_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_INTRST_AMT_FLOAT,occur_intrst_amt);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            return fastMsg;
        }
   }

    public class pdsecuL_9_94_Request : BaseRequest, IRequest<pdsecuL_9_94_Response>
    {
        public pdsecuL_9_94_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.9.94";
            }
        }

        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public int exch_no { get; set; }
        public int stock_acco_no { get; set; }
        public int stock_code_no { get; set; }
        public double occur_qty { get; set; }
        public int expire_date { get; set; }
        public int is_change_exch_group_posi { get; set; }
        public int exch_group_no { get; set; }
        public String oper_remark_info { get; set; }
        public int co_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_acco_no", 'I', stock_acco_no);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("occur_qty", 'D', occur_qty);
            packer.AddField("expire_date", 'I', expire_date);
            packer.AddField("is_change_exch_group_posi", 'I', is_change_exch_group_posi);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
            packer.AddField("co_no", 'I', co_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT,stock_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_QTY_FLOAT,occur_qty);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXPIRE_DATE_INT,expire_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_CHANGE_EXCH_GROUP_POSI_INT,is_change_exch_group_posi);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            return fastMsg;
        }
   }

    public class pdsecuL_9_95_Request : BaseRequest, IRequest<pdsecuL_9_95_Response>
    {
        public pdsecuL_9_95_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.9.95";
            }
        }

        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public int exch_no { get; set; }
        public int stock_acco_no { get; set; }
        public int stock_code_no { get; set; }
        public double occur_qty { get; set; }
        public int is_change_exch_group_posi { get; set; }
        public int exch_group_no { get; set; }
        public int expire_date { get; set; }
        public String oper_remark_info { get; set; }
        public int co_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_acco_no", 'I', stock_acco_no);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("occur_qty", 'D', occur_qty);
            packer.AddField("is_change_exch_group_posi", 'I', is_change_exch_group_posi);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("expire_date", 'I', expire_date);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
            packer.AddField("co_no", 'I', co_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT,stock_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_QTY_FLOAT,occur_qty);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_CHANGE_EXCH_GROUP_POSI_INT,is_change_exch_group_posi);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXPIRE_DATE_INT,expire_date);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            return fastMsg;
        }
   }

    public class pdsecuL_9_96_Request : BaseRequest, IRequest<pdsecuL_9_96_Response>
    {
        public pdsecuL_9_96_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.9.96";
            }
        }

        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public String exch_no_str { get; set; }
        public int stock_acco_no { get; set; }
        public String stock_code_no_str { get; set; }
        public int frozen_type { get; set; }
        public String jour_status { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public int co_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_acco_no", 'I', stock_acco_no);
            packer.AddField("stock_code_no_str", 'S', stock_code_no_str);
            packer.AddField("frozen_type", 'I', frozen_type);
            packer.AddField("jour_status", 'S', jour_status);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
            packer.AddField("co_no", 'I', co_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT,stock_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_STR_STR,stock_code_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_TYPE_INT,frozen_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_STATUS_STR,jour_status);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            return fastMsg;
        }
   }

    public class pdsecuL_9_97_Request : BaseRequest, IRequest<pdsecuL_9_97_Response>
    {
        public pdsecuL_9_97_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.9.97";
            }
        }

        public ulong row_id { get; set; }
        public String oper_remark_info { get; set; }
        public int co_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
            packer.AddField("co_no", 'I', co_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            return fastMsg;
        }
   }

    public class pdsecuL_9_98_Request : BaseRequest, IRequest<pdsecuL_9_98_Response>
    {
        public pdsecuL_9_98_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.9.98";
            }
        }

        public ulong row_id { get; set; }
        public String oper_remark_info { get; set; }
        public int co_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
            packer.AddField("co_no", 'I', co_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            return fastMsg;
        }
   }

}
