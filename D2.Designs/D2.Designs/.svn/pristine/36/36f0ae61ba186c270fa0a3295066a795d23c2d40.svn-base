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
    public class evaL_2_1_Request : BaseRequest, IRequest<evaL_2_1_Response>
    {
        public evaL_2_1_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "evaL.2.1";
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

    public class evaL_2_11_Request : BaseRequest, IRequest<evaL_2_11_Response>
    {
        public evaL_2_11_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "evaL.2.11";
            }
        }

        public int pd_no { get; set; }
        public int evalu_date { get; set; }
        public String asset_acco { get; set; }
        public int exch_no { get; set; }
        public String stock_acco { get; set; }
        public String stock_code { get; set; }
        public double curr_qty { get; set; }
        public double curr_cost_amt { get; set; }
        public double last_price { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("evalu_date", 'I', evalu_date);
            packer.AddField("asset_acco", 'S', asset_acco);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_acco", 'S', stock_acco);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("curr_qty", 'D', curr_qty);
            packer.AddField("curr_cost_amt", 'D', curr_cost_amt);
            packer.AddField("last_price", 'D', last_price);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EVALU_DATE_INT,evalu_date);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STR,asset_acco);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR,stock_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT,curr_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_COST_AMT_FLOAT,curr_cost_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT,last_price);
            return fastMsg;
        }
   }

    public class evaL_2_12_Request : BaseRequest, IRequest<evaL_2_12_Response>
    {
        public evaL_2_12_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "evaL.2.12";
            }
        }

        public int pd_no { get; set; }
        public int evalu_date { get; set; }
        public String asset_acco { get; set; }
        public int exch_no { get; set; }
        public String stock_acco { get; set; }
        public String stock_code { get; set; }
        public double curr_qty { get; set; }
        public double curr_cost_amt { get; set; }
        public double last_price { get; set; }
        public double exch_rate { get; set; }
        public double intrst_pandl { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("evalu_date", 'I', evalu_date);
            packer.AddField("asset_acco", 'S', asset_acco);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_acco", 'S', stock_acco);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("curr_qty", 'D', curr_qty);
            packer.AddField("curr_cost_amt", 'D', curr_cost_amt);
            packer.AddField("last_price", 'D', last_price);
            packer.AddField("exch_rate", 'D', exch_rate);
            packer.AddField("intrst_pandl", 'D', intrst_pandl);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EVALU_DATE_INT,evalu_date);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STR,asset_acco);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR,stock_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT,curr_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_COST_AMT_FLOAT,curr_cost_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT,last_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_RATE_FLOAT,exch_rate);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_PANDL_FLOAT,intrst_pandl);
            return fastMsg;
        }
   }

    public class evaL_2_13_Request : BaseRequest, IRequest<evaL_2_13_Response>
    {
        public evaL_2_13_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "evaL.2.13";
            }
        }

        public int pd_no { get; set; }
        public int evalu_date { get; set; }
        public String asset_acco { get; set; }
        public int exch_no { get; set; }
        public String stock_acco { get; set; }
        public String stock_code { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("evalu_date", 'I', evalu_date);
            packer.AddField("asset_acco", 'S', asset_acco);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_acco", 'S', stock_acco);
            packer.AddField("stock_code", 'S', stock_code);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EVALU_DATE_INT,evalu_date);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STR,asset_acco);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR,stock_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            return fastMsg;
        }
   }

    public class evaL_2_14_Request : BaseRequest, IRequest<evaL_2_14_Response>
    {
        public evaL_2_14_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "evaL.2.14";
            }
        }

        public int pd_no { get; set; }
        public int evalu_date { get; set; }
        public String asset_acco { get; set; }
        public int exch_no { get; set; }
        public String stock_acco { get; set; }
        public String stock_code { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("evalu_date", 'I', evalu_date);
            packer.AddField("asset_acco", 'S', asset_acco);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_acco", 'S', stock_acco);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EVALU_DATE_INT,evalu_date);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STR,asset_acco);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR,stock_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class evaL_2_15_Request : BaseRequest, IRequest<evaL_2_15_Response>
    {
        public evaL_2_15_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "evaL.2.15";
            }
        }

        public int pd_no { get; set; }
        public int evalu_date { get; set; }
        public String asset_acco { get; set; }
        public int exch_group_no { get; set; }
        public int exch_no { get; set; }
        public String stock_acco { get; set; }
        public String stock_code { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("evalu_date", 'I', evalu_date);
            packer.AddField("asset_acco", 'S', asset_acco);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_acco", 'S', stock_acco);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EVALU_DATE_INT,evalu_date);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STR,asset_acco);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR,stock_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class evaL_2_16_Request : BaseRequest, IRequest<evaL_2_16_Response>
    {
        public evaL_2_16_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "evaL.2.16";
            }
        }

        public int pd_no { get; set; }
        public int evalu_date { get; set; }
        public int asset_acco_no { get; set; }
        public int exch_no { get; set; }
        public int lngsht_type { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("evalu_date", 'I', evalu_date);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("lngsht_type", 'I', lngsht_type);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EVALU_DATE_INT,evalu_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT,lngsht_type);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class evaL_2_21_Request : BaseRequest, IRequest<evaL_2_21_Response>
    {
        public evaL_2_21_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "evaL.2.21";
            }
        }

        public int pd_no { get; set; }
        public int evalu_date { get; set; }
        public int pd_acco_type { get; set; }
        public String asset_acco { get; set; }
        public String crncy_type { get; set; }
        public double curr_amt { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("evalu_date", 'I', evalu_date);
            packer.AddField("pd_acco_type", 'I', pd_acco_type);
            packer.AddField("asset_acco", 'S', asset_acco);
            packer.AddField("crncy_type", 'S', crncy_type);
            packer.AddField("curr_amt", 'D', curr_amt);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EVALU_DATE_INT,evalu_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_ACCO_TYPE_INT,pd_acco_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STR,asset_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_AMT_FLOAT,curr_amt);
            return fastMsg;
        }
   }

    public class evaL_2_22_Request : BaseRequest, IRequest<evaL_2_22_Response>
    {
        public evaL_2_22_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "evaL.2.22";
            }
        }

        public int pd_no { get; set; }
        public int evalu_date { get; set; }
        public int pd_acco_type { get; set; }
        public String asset_acco { get; set; }
        public String crncy_type { get; set; }
        public double curr_amt { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("evalu_date", 'I', evalu_date);
            packer.AddField("pd_acco_type", 'I', pd_acco_type);
            packer.AddField("asset_acco", 'S', asset_acco);
            packer.AddField("crncy_type", 'S', crncy_type);
            packer.AddField("curr_amt", 'D', curr_amt);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EVALU_DATE_INT,evalu_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_ACCO_TYPE_INT,pd_acco_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STR,asset_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_AMT_FLOAT,curr_amt);
            return fastMsg;
        }
   }

    public class evaL_2_23_Request : BaseRequest, IRequest<evaL_2_23_Response>
    {
        public evaL_2_23_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "evaL.2.23";
            }
        }

        public int pd_no { get; set; }
        public int evalu_date { get; set; }
        public int pd_acco_type { get; set; }
        public String asset_acco { get; set; }
        public String crncy_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("evalu_date", 'I', evalu_date);
            packer.AddField("pd_acco_type", 'I', pd_acco_type);
            packer.AddField("asset_acco", 'S', asset_acco);
            packer.AddField("crncy_type", 'S', crncy_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EVALU_DATE_INT,evalu_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_ACCO_TYPE_INT,pd_acco_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STR,asset_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            return fastMsg;
        }
   }

    public class evaL_2_24_Request : BaseRequest, IRequest<evaL_2_24_Response>
    {
        public evaL_2_24_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "evaL.2.24";
            }
        }

        public int co_no { get; set; }
        public int evalu_date { get; set; }
        public int pd_no { get; set; }
        public int pd_acco_type { get; set; }
        public String asset_acco { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("evalu_date", 'I', evalu_date);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("pd_acco_type", 'I', pd_acco_type);
            packer.AddField("asset_acco", 'S', asset_acco);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EVALU_DATE_INT,evalu_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_ACCO_TYPE_INT,pd_acco_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STR,asset_acco);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class evaL_2_25_Request : BaseRequest, IRequest<evaL_2_25_Response>
    {
        public evaL_2_25_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "evaL.2.25";
            }
        }

        public int co_no { get; set; }
        public int evalu_date { get; set; }
        public int pd_no { get; set; }
        public int pd_acco_type { get; set; }
        public String asset_acco { get; set; }
        public int exch_group_no { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("evalu_date", 'I', evalu_date);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("pd_acco_type", 'I', pd_acco_type);
            packer.AddField("asset_acco", 'S', asset_acco);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EVALU_DATE_INT,evalu_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_ACCO_TYPE_INT,pd_acco_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STR,asset_acco);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class evaL_2_31_Request : BaseRequest, IRequest<evaL_2_31_Response>
    {
        public evaL_2_31_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "evaL.2.31";
            }
        }

        public int pd_no { get; set; }
        public int evalu_date { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("evalu_date", 'I', evalu_date);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EVALU_DATE_INT,evalu_date);
            return fastMsg;
        }
   }

    public class evaL_2_41_Request : BaseRequest, IRequest<evaL_2_41_Response>
    {
        public evaL_2_41_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "evaL.2.41";
            }
        }

        public int pd_no { get; set; }
        public int init_date { get; set; }
        public String asset_acco { get; set; }
        public int occur_dir { get; set; }
        public double occur_amt { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("init_date", 'I', init_date);
            packer.AddField("asset_acco", 'S', asset_acco);
            packer.AddField("occur_dir", 'I', occur_dir);
            packer.AddField("occur_amt", 'D', occur_amt);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STR,asset_acco);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_DIR_INT,occur_dir);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_AMT_FLOAT,occur_amt);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class evaL_2_42_Request : BaseRequest, IRequest<evaL_2_42_Response>
    {
        public evaL_2_42_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "evaL.2.42";
            }
        }

        public ulong row_id { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int init_date { get; set; }
        public String asset_acco { get; set; }
        public int occur_dir { get; set; }
        public double occur_amt { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("init_date", 'I', init_date);
            packer.AddField("asset_acco", 'S', asset_acco);
            packer.AddField("occur_dir", 'I', occur_dir);
            packer.AddField("occur_amt", 'D', occur_amt);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STR,asset_acco);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_DIR_INT,occur_dir);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_AMT_FLOAT,occur_amt);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class evaL_2_43_Request : BaseRequest, IRequest<evaL_2_43_Response>
    {
        public evaL_2_43_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "evaL.2.43";
            }
        }

        public ulong row_id { get; set; }
        public int pd_no { get; set; }
        public int init_date { get; set; }
        public String asset_acco { get; set; }
        public int occur_dir { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("init_date", 'I', init_date);
            packer.AddField("asset_acco", 'S', asset_acco);
            packer.AddField("occur_dir", 'I', occur_dir);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STR,asset_acco);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_DIR_INT,occur_dir);
            return fastMsg;
        }
   }

    public class evaL_2_44_Request : BaseRequest, IRequest<evaL_2_44_Response>
    {
        public evaL_2_44_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "evaL.2.44";
            }
        }

        public int pd_no { get; set; }
        public String asset_acco { get; set; }
        public int begin_date { get; set; }
        public int end_date { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco", 'S', asset_acco);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STR,asset_acco);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT,end_date);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class evaL_2_51_Request : BaseRequest, IRequest<evaL_2_51_Response>
    {
        public evaL_2_51_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "evaL.2.51";
            }
        }

        public int init_date { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_no { get; set; }
        public int stock_type { get; set; }
        public String stock_code { get; set; }
        public int order_dir { get; set; }
        public double strike_qty { get; set; }
        public double strike_price { get; set; }
        public int expire_date { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("init_date", 'I', init_date);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_type", 'I', stock_type);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("order_dir", 'I', order_dir);
            packer.AddField("strike_qty", 'D', strike_qty);
            packer.AddField("strike_price", 'D', strike_price);
            packer.AddField("expire_date", 'I', expire_date);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT,stock_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT,order_dir);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT,strike_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_PRICE_FLOAT,strike_price);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXPIRE_DATE_INT,expire_date);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class evaL_2_52_Request : BaseRequest, IRequest<evaL_2_52_Response>
    {
        public evaL_2_52_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "evaL.2.52";
            }
        }

        public ulong row_id { get; set; }
        public int init_date { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_no { get; set; }
        public int stock_type { get; set; }
        public String stock_code { get; set; }
        public int order_dir { get; set; }
        public double strike_qty { get; set; }
        public double strike_price { get; set; }
        public int expire_date { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("init_date", 'I', init_date);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_type", 'I', stock_type);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("order_dir", 'I', order_dir);
            packer.AddField("strike_qty", 'D', strike_qty);
            packer.AddField("strike_price", 'D', strike_price);
            packer.AddField("expire_date", 'I', expire_date);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT,stock_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT,order_dir);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT,strike_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_PRICE_FLOAT,strike_price);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXPIRE_DATE_INT,expire_date);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class evaL_2_53_Request : BaseRequest, IRequest<evaL_2_53_Response>
    {
        public evaL_2_53_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "evaL.2.53";
            }
        }

        public ulong row_id { get; set; }
        public int init_date { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("init_date", 'I', init_date);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            return fastMsg;
        }
   }

    public class evaL_2_54_Request : BaseRequest, IRequest<evaL_2_54_Response>
    {
        public evaL_2_54_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "evaL.2.54";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int begin_date { get; set; }
        public int end_date { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT,end_date);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

}
