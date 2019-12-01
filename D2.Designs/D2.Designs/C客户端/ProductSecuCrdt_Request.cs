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
    public class pdsecuL_21_1_Request : BaseRequest, IRequest<pdsecuL_21_1_Response>
    {
        public pdsecuL_21_1_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.21.1";
            }
        }

        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public String exch_no_str { get; set; }
        public int stock_acco_no { get; set; }
        public String stock_code_no_str { get; set; }
        public int debt_type { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_acco_no", 'I', stock_acco_no);
            packer.AddField("stock_code_no_str", 'S', stock_code_no_str);
            packer.AddField("debt_type", 'I', debt_type);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT,stock_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_STR_STR,stock_code_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_TYPE_INT,debt_type);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pdsecuL_21_2_Request : BaseRequest, IRequest<pdsecuL_21_2_Response>
    {
        public pdsecuL_21_2_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.21.2";
            }
        }

        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public int exch_group_no { get; set; }
        public String exch_no_str { get; set; }
        public int stock_acco_no { get; set; }
        public String stock_code_no_str { get; set; }
        public int debt_type { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_acco_no", 'I', stock_acco_no);
            packer.AddField("stock_code_no_str", 'S', stock_code_no_str);
            packer.AddField("debt_type", 'I', debt_type);
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
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT,stock_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_STR_STR,stock_code_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_TYPE_INT,debt_type);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pdsecuL_21_3_Request : BaseRequest, IRequest<pdsecuL_21_3_Response>
    {
        public pdsecuL_21_3_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.21.3";
            }
        }

        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public int exch_group_no { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
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
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pdsecuL_21_4_Request : BaseRequest, IRequest<pdsecuL_21_4_Response>
    {
        public pdsecuL_21_4_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.21.4";
            }
        }

        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pdsecuL_21_5_Request : BaseRequest, IRequest<pdsecuL_21_5_Response>
    {
        public pdsecuL_21_5_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.21.5";
            }
        }

        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public String exch_no_str { get; set; }
        public int stock_acco_no { get; set; }
        public String stock_code_no_str { get; set; }
        public int debt_type { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_acco_no", 'I', stock_acco_no);
            packer.AddField("stock_code_no_str", 'S', stock_code_no_str);
            packer.AddField("debt_type", 'I', debt_type);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT,stock_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_STR_STR,stock_code_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_TYPE_INT,debt_type);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pdsecuL_21_6_Request : BaseRequest, IRequest<pdsecuL_21_6_Response>
    {
        public pdsecuL_21_6_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.21.6";
            }
        }

        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public int exch_group_no { get; set; }
        public String exch_no_str { get; set; }
        public int stock_acco_no { get; set; }
        public String stock_code_no_str { get; set; }
        public int debt_type { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_acco_no", 'I', stock_acco_no);
            packer.AddField("stock_code_no_str", 'S', stock_code_no_str);
            packer.AddField("debt_type", 'I', debt_type);
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
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT,stock_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_STR_STR,stock_code_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_TYPE_INT,debt_type);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pdsecuL_21_21_Request : BaseRequest, IRequest<pdsecuL_21_21_Response>
    {
        public pdsecuL_21_21_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.21.21";
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

    public class pdsecuL_21_22_Request : BaseRequest, IRequest<pdsecuL_21_22_Response>
    {
        public pdsecuL_21_22_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.21.22";
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

    public class pdsecuL_21_7_Request : BaseRequest, IRequest<pdsecuL_21_7_Response>
    {
        public pdsecuL_21_7_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pdsecuL.21.7";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public int exch_no { get; set; }
        public int stock_acco_no { get; set; }
        public String stock_code { get; set; }
        public int stock_code_no { get; set; }
        public int is_change_asac_posi { get; set; }
        public int invest_type { get; set; }
        public int debt_type { get; set; }
        public double occur_qty { get; set; }
        public double occur_amt { get; set; }
        public double debt_fee { get; set; }
        public double debt_interest { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_acco_no", 'I', stock_acco_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("is_change_asac_posi", 'I', is_change_asac_posi);
            packer.AddField("invest_type", 'I', invest_type);
            packer.AddField("debt_type", 'I', debt_type);
            packer.AddField("occur_qty", 'D', occur_qty);
            packer.AddField("occur_amt", 'D', occur_amt);
            packer.AddField("debt_fee", 'D', debt_fee);
            packer.AddField("debt_interest", 'D', debt_interest);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT,stock_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_CHANGE_ASAC_POSI_INT,is_change_asac_posi);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INVEST_TYPE_INT,invest_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_TYPE_INT,debt_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_QTY_FLOAT,occur_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_AMT_FLOAT,occur_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_FEE_FLOAT,debt_fee);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_INTEREST_FLOAT,debt_interest);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

}
