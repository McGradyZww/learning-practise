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
    public class prodL_5_1_Request : BaseRequest, IRequest<prodL_5_1_Response>
    {
        public prodL_5_1_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.5.1";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public String pd_status { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("pd_status", 'S', pd_status);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_STATUS_STR,pd_status);
            return fastMsg;
        }
   }

    public class prodL_5_2_Request : BaseRequest, IRequest<prodL_5_2_Response>
    {
        public prodL_5_2_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.5.2";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public String asset_acco_status { get; set; }
        public String out_acco { get; set; }
        public String pd_name { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("asset_acco_status", 'S', asset_acco_status);
            packer.AddField("out_acco", 'S', out_acco);
            packer.AddField("pd_name", 'S', pd_name);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STATUS_STR,asset_acco_status);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR,out_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR,pd_name);
            return fastMsg;
        }
   }

    public class prodL_5_4_Request : BaseRequest, IRequest<prodL_5_4_Response>
    {
        public prodL_5_4_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.5.4";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int pd_type { get; set; }
        public String pd_status_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("pd_type", 'I', pd_type);
            packer.AddField("pd_status_str", 'S', pd_status_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_TYPE_INT,pd_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_STATUS_STR_STR,pd_status_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class prodL_5_5_Request : BaseRequest, IRequest<prodL_5_5_Response>
    {
        public prodL_5_5_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.5.5";
            }
        }

        public int pd_no { get; set; }
        public int config_index { get; set; }
        public String config_value { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("config_index", 'I', config_index);
            packer.AddField("config_value", 'S', config_value);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_INDEX_INT,config_index);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_VALUE_STR,config_value);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class prodL_5_6_Request : BaseRequest, IRequest<prodL_5_6_Response>
    {
        public prodL_5_6_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.5.6";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public String asset_acco_status_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("asset_acco_status_str", 'S', asset_acco_status_str);
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
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STATUS_STR_STR,asset_acco_status_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class prodL_5_7_Request : BaseRequest, IRequest<prodL_5_7_Response>
    {
        public prodL_5_7_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.5.7";
            }
        }

        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public int config_index { get; set; }
        public String config_value { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("config_index", 'I', config_index);
            packer.AddField("config_value", 'S', config_value);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_INDEX_INT,config_index);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_VALUE_STR,config_value);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class prodL_5_8_Request : BaseRequest, IRequest<prodL_5_8_Response>
    {
        public prodL_5_8_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.5.8";
            }
        }

        public int co_no { get; set; }
        public String pd_no_str { get; set; }
        public int pass_no { get; set; }
        public int online_status { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no_str", 'S', pd_no_str);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("online_status", 'I', online_status);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_STR_STR,pd_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ONLINE_STATUS_INT,online_status);
            return fastMsg;
        }
   }

    public class prodL_5_11_Request : BaseRequest, IRequest<prodL_5_11_Response>
    {
        public prodL_5_11_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.5.11";
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

    public class prodL_5_21_Request : BaseRequest, IRequest<prodL_5_21_Response>
    {
        public prodL_5_21_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.5.21";
            }
        }

        public int pd_no { get; set; }
        public String crncy_type { get; set; }
        public double evalu_nav_asset { get; set; }
        public double begin_evalu_nav_asset { get; set; }
        public double evalu_share { get; set; }
        public double total_rece_amt { get; set; }
        public double total_payab_amt { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("crncy_type", 'S', crncy_type);
            packer.AddField("evalu_nav_asset", 'D', evalu_nav_asset);
            packer.AddField("begin_evalu_nav_asset", 'D', begin_evalu_nav_asset);
            packer.AddField("evalu_share", 'D', evalu_share);
            packer.AddField("total_rece_amt", 'D', total_rece_amt);
            packer.AddField("total_payab_amt", 'D', total_payab_amt);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_EVALU_NAV_ASSET_FLOAT,evalu_nav_asset);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_EVALU_NAV_ASSET_FLOAT,begin_evalu_nav_asset);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_EVALU_SHARE_FLOAT,evalu_share);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_RECE_AMT_FLOAT,total_rece_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_PAYAB_AMT_FLOAT,total_payab_amt);
            return fastMsg;
        }
   }

    public class prodL_5_71_Request : BaseRequest, IRequest<prodL_5_71_Response>
    {
        public prodL_5_71_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.5.71";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public int pass_no { get; set; }
        public int pass_type { get; set; }
        public String out_acco { get; set; }
        public String config_str { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("pass_type", 'I', pass_type);
            packer.AddField("out_acco", 'S', out_acco);
            packer.AddField("config_str", 'S', config_str);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_TYPE_INT,pass_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR,out_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_STR_STR,config_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class prodL_5_74_Request : BaseRequest, IRequest<prodL_5_74_Response>
    {
        public prodL_5_74_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.5.74";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public int pass_no { get; set; }
        public String pd_name { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("pd_name", 'S', pd_name);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR,pd_name);
            return fastMsg;
        }
   }

    public class prodL_5_75_Request : BaseRequest, IRequest<prodL_5_75_Response>
    {
        public prodL_5_75_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.5.75";
            }
        }

        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public String asset_acco_status { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("asset_acco_status", 'S', asset_acco_status);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STATUS_STR,asset_acco_status);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class prodL_5_76_Request : BaseRequest, IRequest<prodL_5_76_Response>
    {
        public prodL_5_76_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.5.76";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public String pd_status { get; set; }
        public String asset_acco_type_str { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("pd_status", 'S', pd_status);
            packer.AddField("asset_acco_type_str", 'S', asset_acco_type_str);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_STATUS_STR,pd_status);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_TYPE_STR_STR,asset_acco_type_str);
            return fastMsg;
        }
   }

    public class prodL_5_77_Request : BaseRequest, IRequest<prodL_5_77_Response>
    {
        public prodL_5_77_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.5.77";
            }
        }

        public String mac_addr { get; set; }
        public String offer_name { get; set; }
        public int pass_no { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("mac_addr", 'S', mac_addr);
            packer.AddField("offer_name", 'S', offer_name);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MAC_ADDR_STR,mac_addr);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OFFER_NAME_STR,offer_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class prodL_5_78_Request : BaseRequest, IRequest<prodL_5_78_Response>
    {
        public prodL_5_78_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.5.78";
            }
        }

        public int pd_no { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class prodL_5_79_Request : BaseRequest, IRequest<prodL_5_79_Response>
    {
        public prodL_5_79_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.5.79";
            }
        }

        public int pd_no { get; set; }
        public int cost_calc_type { get; set; }
        public String allow_exch { get; set; }
        public String allow_stock_type { get; set; }
        public int comm_appr_oper { get; set; }
        public double market_price_ratio { get; set; }
        public String forbid_order_dir { get; set; }
        public double comm_no_limit_price_ratio { get; set; }
        public int hk_asset_calc_rate { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("cost_calc_type", 'I', cost_calc_type);
            packer.AddField("allow_exch", 'S', allow_exch);
            packer.AddField("allow_stock_type", 'S', allow_stock_type);
            packer.AddField("comm_appr_oper", 'I', comm_appr_oper);
            packer.AddField("market_price_ratio", 'D', market_price_ratio);
            packer.AddField("forbid_order_dir", 'S', forbid_order_dir);
            packer.AddField("comm_no_limit_price_ratio", 'D', comm_no_limit_price_ratio);
            packer.AddField("hk_asset_calc_rate", 'I', hk_asset_calc_rate);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COST_CALC_TYPE_INT,cost_calc_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_EXCH_STR,allow_exch);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_STOCK_TYPE_STR,allow_stock_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_OPER_INT,comm_appr_oper);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_PRICE_RATIO_FLOAT,market_price_ratio);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FORBID_ORDER_DIR_STR,forbid_order_dir);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_NO_LIMIT_PRICE_RATIO_FLOAT,comm_no_limit_price_ratio);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HK_ASSET_CALC_RATE_INT,hk_asset_calc_rate);
            return fastMsg;
        }
   }

    public class prodL_5_80_Request : BaseRequest, IRequest<prodL_5_80_Response>
    {
        public prodL_5_80_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.5.80";
            }
        }

        public int pd_no { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class prodL_5_81_Request : BaseRequest, IRequest<prodL_5_81_Response>
    {
        public prodL_5_81_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.5.81";
            }
        }

        public int pd_no { get; set; }
        public String forbid_order_dir { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("forbid_order_dir", 'S', forbid_order_dir);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FORBID_ORDER_DIR_STR,forbid_order_dir);
            return fastMsg;
        }
   }

    public class prodL_5_82_Request : BaseRequest, IRequest<prodL_5_82_Response>
    {
        public prodL_5_82_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.5.82";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class prodL_5_83_Request : BaseRequest, IRequest<prodL_5_83_Response>
    {
        public prodL_5_83_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.5.83";
            }
        }

        public int co_no { get; set; }
        public int busi_opor_no { get; set; }
        public String pd_code { get; set; }
        public String pd_name { get; set; }
        public String pd_flname { get; set; }
        public String pd_manager { get; set; }
        public String fund_reg_code { get; set; }
        public int found_date { get; set; }
        public int pd_type { get; set; }
        public String apply_currency { get; set; }
        public String crncy_type { get; set; }
        public double first_asset { get; set; }
        public double first_amt { get; set; }
        public double pd_all_share { get; set; }
        public double pre_share { get; set; }
        public double his_max_per_nav { get; set; }
        public double pre_nav { get; set; }
        public String coust_full_name { get; set; }
        public String coust_acco { get; set; }
        public String coust_acco_name { get; set; }
        public double warn_posi_value { get; set; }
        public double close_posi_value { get; set; }
        public double target_posi_ratio { get; set; }
        public double beta_coeffi { get; set; }
        public String custom_pd_class { get; set; }
        public String remark_info { get; set; }
        public int cost_calc_type { get; set; }
        public String allow_exch { get; set; }
        public String allow_stock_type { get; set; }
        public int comm_appr_oper { get; set; }
        public double market_price_ratio { get; set; }
        public String forbid_order_dir { get; set; }
        public double comm_no_limit_price_ratio { get; set; }
        public int hk_asset_calc_rate { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("busi_opor_no", 'I', busi_opor_no);
            packer.AddField("pd_code", 'S', pd_code);
            packer.AddField("pd_name", 'S', pd_name);
            packer.AddField("pd_flname", 'S', pd_flname);
            packer.AddField("pd_manager", 'S', pd_manager);
            packer.AddField("fund_reg_code", 'S', fund_reg_code);
            packer.AddField("found_date", 'I', found_date);
            packer.AddField("pd_type", 'I', pd_type);
            packer.AddField("apply_currency", 'S', apply_currency);
            packer.AddField("crncy_type", 'S', crncy_type);
            packer.AddField("first_asset", 'D', first_asset);
            packer.AddField("first_amt", 'D', first_amt);
            packer.AddField("pd_all_share", 'D', pd_all_share);
            packer.AddField("pre_share", 'D', pre_share);
            packer.AddField("his_max_per_nav", 'D', his_max_per_nav);
            packer.AddField("pre_nav", 'D', pre_nav);
            packer.AddField("coust_full_name", 'S', coust_full_name);
            packer.AddField("coust_acco", 'S', coust_acco);
            packer.AddField("coust_acco_name", 'S', coust_acco_name);
            packer.AddField("warn_posi_value", 'D', warn_posi_value);
            packer.AddField("close_posi_value", 'D', close_posi_value);
            packer.AddField("target_posi_ratio", 'D', target_posi_ratio);
            packer.AddField("beta_coeffi", 'D', beta_coeffi);
            packer.AddField("custom_pd_class", 'S', custom_pd_class);
            packer.AddField("remark_info", 'S', remark_info);
            packer.AddField("cost_calc_type", 'I', cost_calc_type);
            packer.AddField("allow_exch", 'S', allow_exch);
            packer.AddField("allow_stock_type", 'S', allow_stock_type);
            packer.AddField("comm_appr_oper", 'I', comm_appr_oper);
            packer.AddField("market_price_ratio", 'D', market_price_ratio);
            packer.AddField("forbid_order_dir", 'S', forbid_order_dir);
            packer.AddField("comm_no_limit_price_ratio", 'D', comm_no_limit_price_ratio);
            packer.AddField("hk_asset_calc_rate", 'I', hk_asset_calc_rate);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT,busi_opor_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR,pd_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR,pd_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_FLNAME_STR,pd_flname);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_MANAGER_STR,pd_manager);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUND_REG_CODE_STR,fund_reg_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FOUND_DATE_INT,found_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_TYPE_INT,pd_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_APPLY_CURRENCY_STR,apply_currency);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FIRST_ASSET_FLOAT,first_asset);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FIRST_AMT_FLOAT,first_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_ALL_SHARE_FLOAT,pd_all_share);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SHARE_FLOAT,pre_share);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HIS_MAX_PER_NAV_FLOAT,his_max_per_nav);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_NAV_FLOAT,pre_nav);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COUST_FULL_NAME_STR,coust_full_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COUST_ACCO_STR,coust_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COUST_ACCO_NAME_STR,coust_acco_name);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WARN_POSI_VALUE_FLOAT,warn_posi_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_VALUE_FLOAT,close_posi_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_POSI_RATIO_FLOAT,target_posi_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BETA_COEFFI_FLOAT,beta_coeffi);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CUSTOM_PD_CLASS_STR,custom_pd_class);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COST_CALC_TYPE_INT,cost_calc_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_EXCH_STR,allow_exch);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_STOCK_TYPE_STR,allow_stock_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_OPER_INT,comm_appr_oper);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_PRICE_RATIO_FLOAT,market_price_ratio);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FORBID_ORDER_DIR_STR,forbid_order_dir);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_NO_LIMIT_PRICE_RATIO_FLOAT,comm_no_limit_price_ratio);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HK_ASSET_CALC_RATE_INT,hk_asset_calc_rate);
            return fastMsg;
        }
   }

    public class prodL_5_84_Request : BaseRequest, IRequest<prodL_5_84_Response>
    {
        public prodL_5_84_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.5.84";
            }
        }

        public int co_no { get; set; }
        public int busi_opor_no { get; set; }
        public String pd_code { get; set; }
        public String pd_name { get; set; }
        public String pd_flname { get; set; }
        public String pd_manager { get; set; }
        public String fund_reg_code { get; set; }
        public int found_date { get; set; }
        public int pd_type { get; set; }
        public String apply_currency { get; set; }
        public String crncy_type { get; set; }
        public double first_asset { get; set; }
        public double first_amt { get; set; }
        public double pd_all_share { get; set; }
        public double pre_share { get; set; }
        public double his_max_per_nav { get; set; }
        public double pre_nav { get; set; }
        public String coust_full_name { get; set; }
        public String coust_acco { get; set; }
        public String coust_acco_name { get; set; }
        public double warn_posi_value { get; set; }
        public double close_posi_value { get; set; }
        public double target_posi_ratio { get; set; }
        public double beta_coeffi { get; set; }
        public String custom_pd_class { get; set; }
        public String remark_info { get; set; }
        public int cost_calc_type { get; set; }
        public String allow_exch { get; set; }
        public String allow_stock_type { get; set; }
        public int comm_appr_oper { get; set; }
        public double market_price_ratio { get; set; }
        public String forbid_order_dir { get; set; }
        public double comm_no_limit_price_ratio { get; set; }
        public int hk_asset_calc_rate { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("busi_opor_no", 'I', busi_opor_no);
            packer.AddField("pd_code", 'S', pd_code);
            packer.AddField("pd_name", 'S', pd_name);
            packer.AddField("pd_flname", 'S', pd_flname);
            packer.AddField("pd_manager", 'S', pd_manager);
            packer.AddField("fund_reg_code", 'S', fund_reg_code);
            packer.AddField("found_date", 'I', found_date);
            packer.AddField("pd_type", 'I', pd_type);
            packer.AddField("apply_currency", 'S', apply_currency);
            packer.AddField("crncy_type", 'S', crncy_type);
            packer.AddField("first_asset", 'D', first_asset);
            packer.AddField("first_amt", 'D', first_amt);
            packer.AddField("pd_all_share", 'D', pd_all_share);
            packer.AddField("pre_share", 'D', pre_share);
            packer.AddField("his_max_per_nav", 'D', his_max_per_nav);
            packer.AddField("pre_nav", 'D', pre_nav);
            packer.AddField("coust_full_name", 'S', coust_full_name);
            packer.AddField("coust_acco", 'S', coust_acco);
            packer.AddField("coust_acco_name", 'S', coust_acco_name);
            packer.AddField("warn_posi_value", 'D', warn_posi_value);
            packer.AddField("close_posi_value", 'D', close_posi_value);
            packer.AddField("target_posi_ratio", 'D', target_posi_ratio);
            packer.AddField("beta_coeffi", 'D', beta_coeffi);
            packer.AddField("custom_pd_class", 'S', custom_pd_class);
            packer.AddField("remark_info", 'S', remark_info);
            packer.AddField("cost_calc_type", 'I', cost_calc_type);
            packer.AddField("allow_exch", 'S', allow_exch);
            packer.AddField("allow_stock_type", 'S', allow_stock_type);
            packer.AddField("comm_appr_oper", 'I', comm_appr_oper);
            packer.AddField("market_price_ratio", 'D', market_price_ratio);
            packer.AddField("forbid_order_dir", 'S', forbid_order_dir);
            packer.AddField("comm_no_limit_price_ratio", 'D', comm_no_limit_price_ratio);
            packer.AddField("hk_asset_calc_rate", 'I', hk_asset_calc_rate);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT,busi_opor_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR,pd_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR,pd_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_FLNAME_STR,pd_flname);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_MANAGER_STR,pd_manager);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUND_REG_CODE_STR,fund_reg_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FOUND_DATE_INT,found_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_TYPE_INT,pd_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_APPLY_CURRENCY_STR,apply_currency);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FIRST_ASSET_FLOAT,first_asset);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FIRST_AMT_FLOAT,first_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_ALL_SHARE_FLOAT,pd_all_share);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SHARE_FLOAT,pre_share);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HIS_MAX_PER_NAV_FLOAT,his_max_per_nav);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_NAV_FLOAT,pre_nav);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COUST_FULL_NAME_STR,coust_full_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COUST_ACCO_STR,coust_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COUST_ACCO_NAME_STR,coust_acco_name);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WARN_POSI_VALUE_FLOAT,warn_posi_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_VALUE_FLOAT,close_posi_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_POSI_RATIO_FLOAT,target_posi_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BETA_COEFFI_FLOAT,beta_coeffi);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CUSTOM_PD_CLASS_STR,custom_pd_class);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COST_CALC_TYPE_INT,cost_calc_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_EXCH_STR,allow_exch);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_STOCK_TYPE_STR,allow_stock_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_OPER_INT,comm_appr_oper);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_PRICE_RATIO_FLOAT,market_price_ratio);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FORBID_ORDER_DIR_STR,forbid_order_dir);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_NO_LIMIT_PRICE_RATIO_FLOAT,comm_no_limit_price_ratio);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HK_ASSET_CALC_RATE_INT,hk_asset_calc_rate);
            return fastMsg;
        }
   }

    public class prodL_5_85_Request : BaseRequest, IRequest<prodL_5_85_Response>
    {
        public prodL_5_85_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.5.85";
            }
        }

        public int co_no { get; set; }
        public int busi_opor_no { get; set; }
        public int pd_no { get; set; }
        public int config_index { get; set; }
        public String config_value { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("busi_opor_no", 'I', busi_opor_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("config_index", 'I', config_index);
            packer.AddField("config_value", 'S', config_value);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT,busi_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_INDEX_INT,config_index);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_VALUE_STR,config_value);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class prodL_5_86_Request : BaseRequest, IRequest<prodL_5_86_Response>
    {
        public prodL_5_86_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.5.86";
            }
        }

        public int co_no { get; set; }
        public int busi_opor_no { get; set; }
        public int pd_no { get; set; }
        public String asset_acco { get; set; }
        public String asset_acco_name { get; set; }
        public int asset_acco_type { get; set; }
        public String out_acco { get; set; }
        public String trade_pwd { get; set; }
        public String comm_pwd { get; set; }
        public double market_price_ratio { get; set; }
        public String allow_exch { get; set; }
        public String allow_stock_type { get; set; }
        public String split_fee_typr_str { get; set; }
        public String busi_limit_str { get; set; }
        public int exter_comm_flag { get; set; }
        public int sh_hk_trader_type { get; set; }
        public int sz_hk_trader_type { get; set; }
        public String remark_info { get; set; }
        public String busi_depart { get; set; }
        public int syn_update_cost_amt { get; set; }
        public int exch_group_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("busi_opor_no", 'I', busi_opor_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco", 'S', asset_acco);
            packer.AddField("asset_acco_name", 'S', asset_acco_name);
            packer.AddField("asset_acco_type", 'I', asset_acco_type);
            packer.AddField("out_acco", 'S', out_acco);
            packer.AddField("trade_pwd", 'S', trade_pwd);
            packer.AddField("comm_pwd", 'S', comm_pwd);
            packer.AddField("market_price_ratio", 'D', market_price_ratio);
            packer.AddField("allow_exch", 'S', allow_exch);
            packer.AddField("allow_stock_type", 'S', allow_stock_type);
            packer.AddField("split_fee_typr_str", 'S', split_fee_typr_str);
            packer.AddField("busi_limit_str", 'S', busi_limit_str);
            packer.AddField("exter_comm_flag", 'I', exter_comm_flag);
            packer.AddField("sh_hk_trader_type", 'I', sh_hk_trader_type);
            packer.AddField("sz_hk_trader_type", 'I', sz_hk_trader_type);
            packer.AddField("remark_info", 'S', remark_info);
            packer.AddField("busi_depart", 'S', busi_depart);
            packer.AddField("syn_update_cost_amt", 'I', syn_update_cost_amt);
            packer.AddField("exch_group_no", 'I', exch_group_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT,busi_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STR,asset_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NAME_STR,asset_acco_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_TYPE_INT,asset_acco_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR,out_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_PWD_STR,trade_pwd);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_PWD_STR,comm_pwd);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_PRICE_RATIO_FLOAT,market_price_ratio);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_EXCH_STR,allow_exch);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_STOCK_TYPE_STR,allow_stock_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_SPLIT_FEE_TYPR_STR_STR,split_fee_typr_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_LIMIT_STR_STR,busi_limit_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXTER_COMM_FLAG_INT,exter_comm_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SH_HK_TRADER_TYPE_INT,sh_hk_trader_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SZ_HK_TRADER_TYPE_INT,sz_hk_trader_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_DEPART_STR,busi_depart);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SYN_UPDATE_COST_AMT_INT,syn_update_cost_amt);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            return fastMsg;
        }
   }

    public class prodL_5_87_Request : BaseRequest, IRequest<prodL_5_87_Response>
    {
        public prodL_5_87_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.5.87";
            }
        }

        public int co_no { get; set; }
        public int asset_acco_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            return fastMsg;
        }
   }

    public class prodL_5_88_Request : BaseRequest, IRequest<prodL_5_88_Response>
    {
        public prodL_5_88_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.5.88";
            }
        }

        public int co_no { get; set; }
        public int busi_opor_no { get; set; }
        public int pd_no { get; set; }
        public String pd_code { get; set; }
        public String pd_name { get; set; }
        public String pd_flname { get; set; }
        public String fund_reg_code { get; set; }
        public String pd_manager { get; set; }
        public int found_date { get; set; }
        public int pd_type { get; set; }
        public String apply_currency { get; set; }
        public String crncy_type { get; set; }
        public double first_asset { get; set; }
        public double first_amt { get; set; }
        public double pd_all_share { get; set; }
        public double pre_share { get; set; }
        public double his_max_per_nav { get; set; }
        public double pre_nav { get; set; }
        public String coust_full_name { get; set; }
        public String coust_acco { get; set; }
        public String coust_acco_name { get; set; }
        public double warn_posi_value { get; set; }
        public double close_posi_value { get; set; }
        public double target_posi_ratio { get; set; }
        public double beta_coeffi { get; set; }
        public String custom_pd_class { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("busi_opor_no", 'I', busi_opor_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("pd_code", 'S', pd_code);
            packer.AddField("pd_name", 'S', pd_name);
            packer.AddField("pd_flname", 'S', pd_flname);
            packer.AddField("fund_reg_code", 'S', fund_reg_code);
            packer.AddField("pd_manager", 'S', pd_manager);
            packer.AddField("found_date", 'I', found_date);
            packer.AddField("pd_type", 'I', pd_type);
            packer.AddField("apply_currency", 'S', apply_currency);
            packer.AddField("crncy_type", 'S', crncy_type);
            packer.AddField("first_asset", 'D', first_asset);
            packer.AddField("first_amt", 'D', first_amt);
            packer.AddField("pd_all_share", 'D', pd_all_share);
            packer.AddField("pre_share", 'D', pre_share);
            packer.AddField("his_max_per_nav", 'D', his_max_per_nav);
            packer.AddField("pre_nav", 'D', pre_nav);
            packer.AddField("coust_full_name", 'S', coust_full_name);
            packer.AddField("coust_acco", 'S', coust_acco);
            packer.AddField("coust_acco_name", 'S', coust_acco_name);
            packer.AddField("warn_posi_value", 'D', warn_posi_value);
            packer.AddField("close_posi_value", 'D', close_posi_value);
            packer.AddField("target_posi_ratio", 'D', target_posi_ratio);
            packer.AddField("beta_coeffi", 'D', beta_coeffi);
            packer.AddField("custom_pd_class", 'S', custom_pd_class);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT,busi_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR,pd_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR,pd_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_FLNAME_STR,pd_flname);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUND_REG_CODE_STR,fund_reg_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_MANAGER_STR,pd_manager);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FOUND_DATE_INT,found_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_TYPE_INT,pd_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_APPLY_CURRENCY_STR,apply_currency);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FIRST_ASSET_FLOAT,first_asset);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FIRST_AMT_FLOAT,first_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_ALL_SHARE_FLOAT,pd_all_share);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SHARE_FLOAT,pre_share);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HIS_MAX_PER_NAV_FLOAT,his_max_per_nav);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_NAV_FLOAT,pre_nav);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COUST_FULL_NAME_STR,coust_full_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COUST_ACCO_STR,coust_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COUST_ACCO_NAME_STR,coust_acco_name);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WARN_POSI_VALUE_FLOAT,warn_posi_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_VALUE_FLOAT,close_posi_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_POSI_RATIO_FLOAT,target_posi_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BETA_COEFFI_FLOAT,beta_coeffi);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CUSTOM_PD_CLASS_STR,custom_pd_class);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class prodL_5_89_Request : BaseRequest, IRequest<prodL_5_89_Response>
    {
        public prodL_5_89_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.5.89";
            }
        }

        public int co_no { get; set; }
        public int busi_opor_no { get; set; }
        public String pd_no_str { get; set; }
        public String index_value_str { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("busi_opor_no", 'I', busi_opor_no);
            packer.AddField("pd_no_str", 'S', pd_no_str);
            packer.AddField("index_value_str", 'S', index_value_str);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT,busi_opor_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_STR_STR,pd_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_INDEX_VALUE_STR_STR,index_value_str);
            return fastMsg;
        }
   }

    public class prodL_5_90_Request : BaseRequest, IRequest<prodL_5_90_Response>
    {
        public prodL_5_90_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.5.90";
            }
        }

        public int co_no { get; set; }
        public int busi_opor_no { get; set; }
        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("busi_opor_no", 'I', busi_opor_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
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
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class prodL_5_91_Request : BaseRequest, IRequest<prodL_5_91_Response>
    {
        public prodL_5_91_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.5.91";
            }
        }

        public int co_no { get; set; }
        public int busi_opor_no { get; set; }
        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("busi_opor_no", 'I', busi_opor_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
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
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class prodL_5_92_Request : BaseRequest, IRequest<prodL_5_92_Response>
    {
        public prodL_5_92_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.5.92";
            }
        }

        public int co_no { get; set; }
        public int busi_opor_no { get; set; }
        public int pd_no { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("busi_opor_no", 'I', busi_opor_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT,busi_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class prodL_5_93_Request : BaseRequest, IRequest<prodL_5_93_Response>
    {
        public prodL_5_93_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.5.93";
            }
        }

        public int co_no { get; set; }
        public int busi_opor_no { get; set; }
        public int pd_no { get; set; }
        public int pd_type { get; set; }
        public String pd_status_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("busi_opor_no", 'I', busi_opor_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("pd_type", 'I', pd_type);
            packer.AddField("pd_status_str", 'S', pd_status_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT,busi_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_TYPE_INT,pd_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_STATUS_STR_STR,pd_status_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class prodL_5_94_Request : BaseRequest, IRequest<prodL_5_94_Response>
    {
        public prodL_5_94_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.5.94";
            }
        }

        public int co_no { get; set; }
        public int busi_opor_no { get; set; }
        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public String asset_acco { get; set; }
        public String asset_acco_name { get; set; }
        public int asset_acco_type { get; set; }
        public double market_price_ratio { get; set; }
        public String allow_exch { get; set; }
        public String allow_stock_type { get; set; }
        public String split_fee_typr_str { get; set; }
        public String busi_limit_str { get; set; }
        public int exter_comm_flag { get; set; }
        public int sh_hk_trader_type { get; set; }
        public int sz_hk_trader_type { get; set; }
        public String remark_info { get; set; }
        public String busi_depart { get; set; }
        public int syn_update_cost_amt { get; set; }
        public int exch_group_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("busi_opor_no", 'I', busi_opor_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("asset_acco", 'S', asset_acco);
            packer.AddField("asset_acco_name", 'S', asset_acco_name);
            packer.AddField("asset_acco_type", 'I', asset_acco_type);
            packer.AddField("market_price_ratio", 'D', market_price_ratio);
            packer.AddField("allow_exch", 'S', allow_exch);
            packer.AddField("allow_stock_type", 'S', allow_stock_type);
            packer.AddField("split_fee_typr_str", 'S', split_fee_typr_str);
            packer.AddField("busi_limit_str", 'S', busi_limit_str);
            packer.AddField("exter_comm_flag", 'I', exter_comm_flag);
            packer.AddField("sh_hk_trader_type", 'I', sh_hk_trader_type);
            packer.AddField("sz_hk_trader_type", 'I', sz_hk_trader_type);
            packer.AddField("remark_info", 'S', remark_info);
            packer.AddField("busi_depart", 'S', busi_depart);
            packer.AddField("syn_update_cost_amt", 'I', syn_update_cost_amt);
            packer.AddField("exch_group_no", 'I', exch_group_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT,busi_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STR,asset_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NAME_STR,asset_acco_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_TYPE_INT,asset_acco_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_PRICE_RATIO_FLOAT,market_price_ratio);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_EXCH_STR,allow_exch);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_STOCK_TYPE_STR,allow_stock_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_SPLIT_FEE_TYPR_STR_STR,split_fee_typr_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_LIMIT_STR_STR,busi_limit_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXTER_COMM_FLAG_INT,exter_comm_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SH_HK_TRADER_TYPE_INT,sh_hk_trader_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SZ_HK_TRADER_TYPE_INT,sz_hk_trader_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_DEPART_STR,busi_depart);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SYN_UPDATE_COST_AMT_INT,syn_update_cost_amt);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            return fastMsg;
        }
   }

}
