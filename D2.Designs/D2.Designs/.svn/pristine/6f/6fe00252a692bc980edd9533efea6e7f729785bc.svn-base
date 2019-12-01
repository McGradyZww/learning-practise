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
    public class prodL_1_1_Request : BaseRequest, IRequest<prodL_1_1_Response>
    {
        public prodL_1_1_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.1";
            }
        }

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

    public class prodL_1_2_Request : BaseRequest, IRequest<prodL_1_2_Response>
    {
        public prodL_1_2_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.2";
            }
        }

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

    public class prodL_1_4_Request : BaseRequest, IRequest<prodL_1_4_Response>
    {
        public prodL_1_4_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.4";
            }
        }

        public int pd_no { get; set; }
        public int pd_type { get; set; }
        public String pd_status_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_TYPE_INT,pd_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_STATUS_STR_STR,pd_status_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class prodL_1_5_Request : BaseRequest, IRequest<prodL_1_5_Response>
    {
        public prodL_1_5_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.5";
            }
        }

        public int begin_date { get; set; }
        public int end_date { get; set; }
        public int pd_type { get; set; }
        public String pd_status_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("pd_type", 'I', pd_type);
            packer.AddField("pd_status_str", 'S', pd_status_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT,end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_TYPE_INT,pd_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_STATUS_STR_STR,pd_status_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class prodL_1_6_Request : BaseRequest, IRequest<prodL_1_6_Response>
    {
        public prodL_1_6_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.6";
            }
        }

        public int pd_no { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class prodL_1_7_Request : BaseRequest, IRequest<prodL_1_7_Response>
    {
        public prodL_1_7_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.7";
            }
        }

        public int begin_date { get; set; }
        public int end_date { get; set; }
        public int pd_no { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("pd_no", 'I', pd_no);
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
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class prodL_1_8_Request : BaseRequest, IRequest<prodL_1_8_Response>
    {
        public prodL_1_8_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.8";
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

    public class prodL_1_9_Request : BaseRequest, IRequest<prodL_1_9_Response>
    {
        public prodL_1_9_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.9";
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

    public class prodL_1_10_Request : BaseRequest, IRequest<prodL_1_10_Response>
    {
        public prodL_1_10_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.10";
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

    public class prodL_1_11_Request : BaseRequest, IRequest<prodL_1_11_Response>
    {
        public prodL_1_11_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.11";
            }
        }

        public int co_no { get; set; }
        public String pd_code { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_code", 'S', pd_code);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR,pd_code);
            return fastMsg;
        }
   }

    public class prodL_1_12_Request : BaseRequest, IRequest<prodL_1_12_Response>
    {
        public prodL_1_12_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.12";
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

    public class prodL_1_13_Request : BaseRequest, IRequest<prodL_1_13_Response>
    {
        public prodL_1_13_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.13";
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

    public class prodL_1_17_Request : BaseRequest, IRequest<prodL_1_17_Response>
    {
        public prodL_1_17_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.17";
            }
        }

        public int pd_no { get; set; }
        public String crncy_type { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("crncy_type", 'S', crncy_type);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class prodL_1_22_Request : BaseRequest, IRequest<prodL_1_22_Response>
    {
        public prodL_1_22_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.22";
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

    public class prodL_1_24_Request : BaseRequest, IRequest<prodL_1_24_Response>
    {
        public prodL_1_24_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.24";
            }
        }

        public int pd_no { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class prodL_1_25_Request : BaseRequest, IRequest<prodL_1_25_Response>
    {
        public prodL_1_25_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.25";
            }
        }

        public int pd_no { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class prodL_1_26_Request : BaseRequest, IRequest<prodL_1_26_Response>
    {
        public prodL_1_26_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.26";
            }
        }

        public int begin_date { get; set; }
        public int end_date { get; set; }
        public int pd_no { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("pd_no", 'I', pd_no);
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
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class prodL_1_27_Request : BaseRequest, IRequest<prodL_1_27_Response>
    {
        public prodL_1_27_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.27";
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

    public class prodL_1_28_Request : BaseRequest, IRequest<prodL_1_28_Response>
    {
        public prodL_1_28_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.28";
            }
        }

        public int pd_no { get; set; }
        public String order_dir_str { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("order_dir_str", 'S', order_dir_str);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR,order_dir_str);
            return fastMsg;
        }
   }

    public class prodL_1_29_Request : BaseRequest, IRequest<prodL_1_29_Response>
    {
        public prodL_1_29_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.29";
            }
        }

        public int pd_no { get; set; }
        public String order_dir_str { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("order_dir_str", 'S', order_dir_str);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR,order_dir_str);
            return fastMsg;
        }
   }

    public class prodL_1_30_Request : BaseRequest, IRequest<prodL_1_30_Response>
    {
        public prodL_1_30_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.30";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public String bank_code { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("bank_code", 'S', bank_code);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_BANK_CODE_STR,bank_code);
            return fastMsg;
        }
   }

    public class prodL_1_31_Request : BaseRequest, IRequest<prodL_1_31_Response>
    {
        public prodL_1_31_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.31";
            }
        }

        public int pd_no { get; set; }
        public String bank_code { get; set; }
        public String bank_name { get; set; }
        public String bank_acco { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("bank_code", 'S', bank_code);
            packer.AddField("bank_name", 'S', bank_name);
            packer.AddField("bank_acco", 'S', bank_acco);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_BANK_CODE_STR,bank_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_BANK_NAME_STR,bank_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_BANK_ACCO_STR,bank_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class prodL_1_32_Request : BaseRequest, IRequest<prodL_1_32_Response>
    {
        public prodL_1_32_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.32";
            }
        }

        public int pd_no { get; set; }
        public int bank_acco_no { get; set; }
        public String bank_name { get; set; }
        public String bank_acco { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("bank_acco_no", 'I', bank_acco_no);
            packer.AddField("bank_name", 'S', bank_name);
            packer.AddField("bank_acco", 'S', bank_acco);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BANK_ACCO_NO_INT,bank_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_BANK_NAME_STR,bank_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_BANK_ACCO_STR,bank_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class prodL_1_33_Request : BaseRequest, IRequest<prodL_1_33_Response>
    {
        public prodL_1_33_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.33";
            }
        }

        public int pd_no { get; set; }
        public int bank_acco_no { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("bank_acco_no", 'I', bank_acco_no);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BANK_ACCO_NO_INT,bank_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class prodL_1_34_Request : BaseRequest, IRequest<prodL_1_34_Response>
    {
        public prodL_1_34_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.34";
            }
        }

        public int pd_no { get; set; }
        public String bank_acco_no_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("bank_acco_no_str", 'S', bank_acco_no_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_BANK_ACCO_NO_STR_STR,bank_acco_no_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class prodL_1_35_Request : BaseRequest, IRequest<prodL_1_35_Response>
    {
        public prodL_1_35_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.35";
            }
        }

        public int pd_no { get; set; }
        public String bank_acco_no_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("bank_acco_no_str", 'S', bank_acco_no_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_BANK_ACCO_NO_STR_STR,bank_acco_no_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class prodL_1_36_Request : BaseRequest, IRequest<prodL_1_36_Response>
    {
        public prodL_1_36_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.36";
            }
        }

        public int begin_date { get; set; }
        public int end_date { get; set; }
        public int pd_no { get; set; }
        public String bank_acco_no_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("bank_acco_no_str", 'S', bank_acco_no_str);
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
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_BANK_ACCO_NO_STR_STR,bank_acco_no_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class prodL_1_40_Request : BaseRequest, IRequest<prodL_1_40_Response>
    {
        public prodL_1_40_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.40";
            }
        }

        public int pd_no { get; set; }
        public String asset_acco { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco", 'S', asset_acco);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STR,asset_acco);
            return fastMsg;
        }
   }

    public class prodL_1_41_Request : BaseRequest, IRequest<prodL_1_41_Response>
    {
        public prodL_1_41_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.41";
            }
        }

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

    public class prodL_1_42_Request : BaseRequest, IRequest<prodL_1_42_Response>
    {
        public prodL_1_42_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.42";
            }
        }

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

    public class prodL_1_43_Request : BaseRequest, IRequest<prodL_1_43_Response>
    {
        public prodL_1_43_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.43";
            }
        }

        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            return fastMsg;
        }
   }

    public class prodL_1_44_Request : BaseRequest, IRequest<prodL_1_44_Response>
    {
        public prodL_1_44_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.44";
            }
        }

        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public String asset_acco_status_str { get; set; }
        public int asset_acco_type { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("asset_acco_status_str", 'S', asset_acco_status_str);
            packer.AddField("asset_acco_type", 'I', asset_acco_type);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STATUS_STR_STR,asset_acco_status_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_TYPE_INT,asset_acco_type);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class prodL_1_45_Request : BaseRequest, IRequest<prodL_1_45_Response>
    {
        public prodL_1_45_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.45";
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

    public class prodL_1_46_Request : BaseRequest, IRequest<prodL_1_46_Response>
    {
        public prodL_1_46_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.46";
            }
        }

        public int begin_date { get; set; }
        public int end_date { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
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
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class prodL_1_47_Request : BaseRequest, IRequest<prodL_1_47_Response>
    {
        public prodL_1_47_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.47";
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

    public class prodL_1_48_Request : BaseRequest, IRequest<prodL_1_48_Response>
    {
        public prodL_1_48_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.48";
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

    public class prodL_1_49_Request : BaseRequest, IRequest<prodL_1_49_Response>
    {
        public prodL_1_49_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.49";
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

    public class prodL_1_50_Request : BaseRequest, IRequest<prodL_1_50_Response>
    {
        public prodL_1_50_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.50";
            }
        }

        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public String trade_pwd { get; set; }
        public String comm_pwd { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("trade_pwd", 'S', trade_pwd);
            packer.AddField("comm_pwd", 'S', comm_pwd);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_PWD_STR,trade_pwd);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_PWD_STR,comm_pwd);
            return fastMsg;
        }
   }

    public class prodL_1_51_Request : BaseRequest, IRequest<prodL_1_51_Response>
    {
        public prodL_1_51_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.51";
            }
        }

        public String pd_no_str { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no_str", 'S', pd_no_str);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_STR_STR,pd_no_str);
            return fastMsg;
        }
   }

    public class prodL_1_52_Request : BaseRequest, IRequest<prodL_1_52_Response>
    {
        public prodL_1_52_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.52";
            }
        }

        public int pass_no { get; set; }
        public String out_acco { get; set; }
        public int online_status { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("out_acco", 'S', out_acco);
            packer.AddField("online_status", 'I', online_status);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR,out_acco);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ONLINE_STATUS_INT,online_status);
            return fastMsg;
        }
   }

    public class prodL_1_74_Request : BaseRequest, IRequest<prodL_1_74_Response>
    {
        public prodL_1_74_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.74";
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

    public class prodL_1_75_Request : BaseRequest, IRequest<prodL_1_75_Response>
    {
        public prodL_1_75_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.75";
            }
        }

        public int pd_no { get; set; }
        public int begin_date { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("begin_date", 'I', begin_date);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            return fastMsg;
        }
   }

    public class prodL_1_76_Request : BaseRequest, IRequest<prodL_1_76_Response>
    {
        public prodL_1_76_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.76";
            }
        }

        public int pd_no { get; set; }
        public int begin_date { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("begin_date", 'I', begin_date);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            return fastMsg;
        }
   }

    public class prodL_1_77_Request : BaseRequest, IRequest<prodL_1_77_Response>
    {
        public prodL_1_77_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.77";
            }
        }

        public int asset_acco_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            return fastMsg;
        }
   }

    public class prodL_1_78_Request : BaseRequest, IRequest<prodL_1_78_Response>
    {
        public prodL_1_78_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.78";
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

    public class prodL_1_79_Request : BaseRequest, IRequest<prodL_1_79_Response>
    {
        public prodL_1_79_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.79";
            }
        }

        public int pd_no { get; set; }
        public int begin_date { get; set; }
        public int end_date { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT,end_date);
            return fastMsg;
        }
   }

    public class prodL_1_80_Request : BaseRequest, IRequest<prodL_1_80_Response>
    {
        public prodL_1_80_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.80";
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
            return fastMsg;
        }
   }

    public class prodL_1_81_Request : BaseRequest, IRequest<prodL_1_81_Response>
    {
        public prodL_1_81_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.81";
            }
        }

        public int co_no { get; set; }
        public int workflow_type { get; set; }
        public int pd_no { get; set; }
        public int workflow_num { get; set; }
        public String opor_no_str { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("workflow_type", 'I', workflow_type);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("workflow_num", 'I', workflow_num);
            packer.AddField("opor_no_str", 'S', opor_no_str);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WORKFLOW_TYPE_INT,workflow_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WORKFLOW_NUM_INT,workflow_num);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_STR_STR,opor_no_str);
            return fastMsg;
        }
   }

    public class prodL_1_82_Request : BaseRequest, IRequest<prodL_1_82_Response>
    {
        public prodL_1_82_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.82";
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

    public class prodL_1_83_Request : BaseRequest, IRequest<prodL_1_83_Response>
    {
        public prodL_1_83_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.83";
            }
        }

        public int pd_no { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class prodL_1_84_Request : BaseRequest, IRequest<prodL_1_84_Response>
    {
        public prodL_1_84_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.84";
            }
        }

        public int pass_no { get; set; }
        public String out_acco { get; set; }
        public String trade_pwd { get; set; }
        public String comm_pwd { get; set; }
        public int pwd_check_status { get; set; }
        public int asset_acco_no { get; set; }
        public int pd_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("out_acco", 'S', out_acco);
            packer.AddField("trade_pwd", 'S', trade_pwd);
            packer.AddField("comm_pwd", 'S', comm_pwd);
            packer.AddField("pwd_check_status", 'I', pwd_check_status);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("pd_no", 'I', pd_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR,out_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_PWD_STR,trade_pwd);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_PWD_STR,comm_pwd);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PWD_CHECK_STATUS_INT,pwd_check_status);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            return fastMsg;
        }
   }

    public class prodL_1_85_Request : BaseRequest, IRequest<prodL_1_85_Response>
    {
        public prodL_1_85_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.85";
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

    public class prodL_1_86_Request : BaseRequest, IRequest<prodL_1_86_Response>
    {
        public prodL_1_86_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.86";
            }
        }

        public int pass_no { get; set; }
        public String out_acco { get; set; }
        public int asset_acco_login_result { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("out_acco", 'S', out_acco);
            packer.AddField("asset_acco_login_result", 'I', asset_acco_login_result);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR,out_acco);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_LOGIN_RESULT_INT,asset_acco_login_result);
            return fastMsg;
        }
   }

    public class prodL_1_87_Request : BaseRequest, IRequest<prodL_1_87_Response>
    {
        public prodL_1_87_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.87";
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

    public class prodL_1_88_Request : BaseRequest, IRequest<prodL_1_88_Response>
    {
        public prodL_1_88_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.88";
            }
        }

        public int execute_type { get; set; }
        public int init_step { get; set; }
        public int begin_time { get; set; }
        public int open_execute_type { get; set; }
        public int open_execute_result { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("execute_type", 'I', execute_type);
            packer.AddField("init_step", 'I', init_step);
            packer.AddField("begin_time", 'I', begin_time);
            packer.AddField("open_execute_type", 'I', open_execute_type);
            packer.AddField("open_execute_result", 'I', open_execute_result);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXECUTE_TYPE_INT,execute_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_STEP_INT,init_step);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TIME_INT,begin_time);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_EXECUTE_TYPE_INT,open_execute_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_EXECUTE_RESULT_INT,open_execute_result);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class prodL_1_89_Request : BaseRequest, IRequest<prodL_1_89_Response>
    {
        public prodL_1_89_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.89";
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

    public class prodL_1_90_Request : BaseRequest, IRequest<prodL_1_90_Response>
    {
        public prodL_1_90_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.90";
            }
        }

        public int init_step { get; set; }
        public int exec_date { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("init_step", 'I', init_step);
            packer.AddField("exec_date", 'I', exec_date);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_STEP_INT,init_step);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_DATE_INT,exec_date);
            return fastMsg;
        }
   }

    public class prodL_1_91_Request : BaseRequest, IRequest<prodL_1_91_Response>
    {
        public prodL_1_91_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.91";
            }
        }

        public int flow_business { get; set; }
        public int exec_date { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("flow_business", 'I', flow_business);
            packer.AddField("exec_date", 'I', exec_date);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FLOW_BUSINESS_INT,flow_business);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_DATE_INT,exec_date);
            return fastMsg;
        }
   }

    public class prodL_1_92_Request : BaseRequest, IRequest<prodL_1_92_Response>
    {
        public prodL_1_92_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.92";
            }
        }

        public int execute_type { get; set; }
        public int flow_business { get; set; }
        public int begin_time { get; set; }
        public int close_execute_type { get; set; }
        public int error_deal_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("execute_type", 'I', execute_type);
            packer.AddField("flow_business", 'I', flow_business);
            packer.AddField("begin_time", 'I', begin_time);
            packer.AddField("close_execute_type", 'I', close_execute_type);
            packer.AddField("error_deal_type", 'I', error_deal_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXECUTE_TYPE_INT,execute_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FLOW_BUSINESS_INT,flow_business);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TIME_INT,begin_time);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_EXECUTE_TYPE_INT,close_execute_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ERROR_DEAL_TYPE_INT,error_deal_type);
            return fastMsg;
        }
   }

    public class prodL_1_101_Request : BaseRequest, IRequest<prodL_1_101_Response>
    {
        public prodL_1_101_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.101";
            }
        }

        public int pd_no { get; set; }
        public int co_no { get; set; }
        public int mum_pd_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("mum_pd_no", 'I', mum_pd_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MUM_PD_NO_INT,mum_pd_no);
            return fastMsg;
        }
   }

    public class prodL_1_102_Request : BaseRequest, IRequest<prodL_1_102_Response>
    {
        public prodL_1_102_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.102";
            }
        }

        public int pd_no { get; set; }
        public int co_no { get; set; }
        public int mum_pd_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("mum_pd_no", 'I', mum_pd_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MUM_PD_NO_INT,mum_pd_no);
            return fastMsg;
        }
   }

    public class prodL_1_103_Request : BaseRequest, IRequest<prodL_1_103_Response>
    {
        public prodL_1_103_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.103";
            }
        }

        public int pd_no { get; set; }
        public int co_no { get; set; }
        public int mum_pd_no { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("mum_pd_no", 'I', mum_pd_no);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MUM_PD_NO_INT,mum_pd_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class prodL_1_104_Request : BaseRequest, IRequest<prodL_1_104_Response>
    {
        public prodL_1_104_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.104";
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

    public class prodL_1_105_Request : BaseRequest, IRequest<prodL_1_105_Response>
    {
        public prodL_1_105_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.105";
            }
        }

        public int co_no { get; set; }
        public int asset_acco_no { get; set; }
        public int pd_no { get; set; }
        public int fina_return_type { get; set; }
        public int sell_auto_back_debt { get; set; }
        public double fina_limit_max { get; set; }
        public double loan_limit_max { get; set; }
        public double fina_year_intrst_rate { get; set; }
        public double secu_loan_year_intrst_rate { get; set; }
        public double close_posi_keep_guarantee_ratio { get; set; }
        public double fill_posi_keep_guarantee_ratio { get; set; }
        public double extract_guarantee_ratio { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("fina_return_type", 'I', fina_return_type);
            packer.AddField("sell_auto_back_debt", 'I', sell_auto_back_debt);
            packer.AddField("fina_limit_max", 'D', fina_limit_max);
            packer.AddField("loan_limit_max", 'D', loan_limit_max);
            packer.AddField("fina_year_intrst_rate", 'D', fina_year_intrst_rate);
            packer.AddField("secu_loan_year_intrst_rate", 'D', secu_loan_year_intrst_rate);
            packer.AddField("close_posi_keep_guarantee_ratio", 'D', close_posi_keep_guarantee_ratio);
            packer.AddField("fill_posi_keep_guarantee_ratio", 'D', fill_posi_keep_guarantee_ratio);
            packer.AddField("extract_guarantee_ratio", 'D', extract_guarantee_ratio);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FINA_RETURN_TYPE_INT,fina_return_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SELL_AUTO_BACK_DEBT_INT,sell_auto_back_debt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_LIMIT_MAX_FLOAT,fina_limit_max);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_LIMIT_MAX_FLOAT,loan_limit_max);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_YEAR_INTRST_RATE_FLOAT,fina_year_intrst_rate);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SECU_LOAN_YEAR_INTRST_RATE_FLOAT,secu_loan_year_intrst_rate);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_KEEP_GUARANTEE_RATIO_FLOAT,close_posi_keep_guarantee_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FILL_POSI_KEEP_GUARANTEE_RATIO_FLOAT,fill_posi_keep_guarantee_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_EXTRACT_GUARANTEE_RATIO_FLOAT,extract_guarantee_ratio);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class prodL_1_106_Request : BaseRequest, IRequest<prodL_1_106_Response>
    {
        public prodL_1_106_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.106";
            }
        }

        public int co_no { get; set; }
        public int asset_acco_no { get; set; }
        public int pd_no { get; set; }
        public int fina_return_type { get; set; }
        public int sell_auto_back_debt { get; set; }
        public double fina_limit_max { get; set; }
        public double loan_limit_max { get; set; }
        public double fina_year_intrst_rate { get; set; }
        public double secu_loan_year_intrst_rate { get; set; }
        public double close_posi_keep_guarantee_ratio { get; set; }
        public double fill_posi_keep_guarantee_ratio { get; set; }
        public double extract_guarantee_ratio { get; set; }
        public String remark_info { get; set; }
        public ulong row_id { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("fina_return_type", 'I', fina_return_type);
            packer.AddField("sell_auto_back_debt", 'I', sell_auto_back_debt);
            packer.AddField("fina_limit_max", 'D', fina_limit_max);
            packer.AddField("loan_limit_max", 'D', loan_limit_max);
            packer.AddField("fina_year_intrst_rate", 'D', fina_year_intrst_rate);
            packer.AddField("secu_loan_year_intrst_rate", 'D', secu_loan_year_intrst_rate);
            packer.AddField("close_posi_keep_guarantee_ratio", 'D', close_posi_keep_guarantee_ratio);
            packer.AddField("fill_posi_keep_guarantee_ratio", 'D', fill_posi_keep_guarantee_ratio);
            packer.AddField("extract_guarantee_ratio", 'D', extract_guarantee_ratio);
            packer.AddField("remark_info", 'S', remark_info);
            packer.AddField("row_id", 'L', row_id);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FINA_RETURN_TYPE_INT,fina_return_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SELL_AUTO_BACK_DEBT_INT,sell_auto_back_debt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_LIMIT_MAX_FLOAT,fina_limit_max);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_LIMIT_MAX_FLOAT,loan_limit_max);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_YEAR_INTRST_RATE_FLOAT,fina_year_intrst_rate);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SECU_LOAN_YEAR_INTRST_RATE_FLOAT,secu_loan_year_intrst_rate);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_KEEP_GUARANTEE_RATIO_FLOAT,close_posi_keep_guarantee_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FILL_POSI_KEEP_GUARANTEE_RATIO_FLOAT,fill_posi_keep_guarantee_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_EXTRACT_GUARANTEE_RATIO_FLOAT,extract_guarantee_ratio);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            return fastMsg;
        }
   }

    public class prodL_1_107_Request : BaseRequest, IRequest<prodL_1_107_Response>
    {
        public prodL_1_107_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.107";
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

    public class prodL_1_108_Request : BaseRequest, IRequest<prodL_1_108_Response>
    {
        public prodL_1_108_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.108";
            }
        }

        public int co_no { get; set; }
        public int asset_acco_no { get; set; }
        public int pd_no { get; set; }
        public int sort_type { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("sort_type", 'I', sort_type);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SORT_TYPE_INT,sort_type);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class prodL_1_109_Request : BaseRequest, IRequest<prodL_1_109_Response>
    {
        public prodL_1_109_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.109";
            }
        }

        public int co_no { get; set; }
        public int asset_acco_no { get; set; }
        public int pd_no { get; set; }
        public int sort_type { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("sort_type", 'I', sort_type);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SORT_TYPE_INT,sort_type);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class prodL_1_110_Request : BaseRequest, IRequest<prodL_1_110_Response>
    {
        public prodL_1_110_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.110";
            }
        }

        public int co_no { get; set; }
        public int asset_acco_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            return fastMsg;
        }
   }

    public class prodL_1_111_Request : BaseRequest, IRequest<prodL_1_111_Response>
    {
        public prodL_1_111_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.111";
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

    public class prodL_1_112_Request : BaseRequest, IRequest<prodL_1_112_Response>
    {
        public prodL_1_112_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.112";
            }
        }

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

    public class prodL_1_113_Request : BaseRequest, IRequest<prodL_1_113_Response>
    {
        public prodL_1_113_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.113";
            }
        }

        public String offer_server_name { get; set; }
        public String offer_server_ip { get; set; }
        public String mac_addr { get; set; }
        public String offer_name { get; set; }
        public int software_start_time { get; set; }
        public int pass_no { get; set; }
        public String pass_status { get; set; }
        public String bkup_field_1 { get; set; }
        public int bkup_field_2 { get; set; }
        public double bkup_field_3 { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("offer_server_name", 'S', offer_server_name);
            packer.AddField("offer_server_ip", 'S', offer_server_ip);
            packer.AddField("mac_addr", 'S', mac_addr);
            packer.AddField("offer_name", 'S', offer_name);
            packer.AddField("software_start_time", 'I', software_start_time);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("pass_status", 'S', pass_status);
            packer.AddField("bkup_field_1", 'S', bkup_field_1);
            packer.AddField("bkup_field_2", 'I', bkup_field_2);
            packer.AddField("bkup_field_3", 'D', bkup_field_3);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OFFER_SERVER_NAME_STR,offer_server_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OFFER_SERVER_IP_STR,offer_server_ip);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MAC_ADDR_STR,mac_addr);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OFFER_NAME_STR,offer_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SOFTWARE_START_TIME_INT,software_start_time);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PASS_STATUS_STR,pass_status);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_BKUP_FIELD_1_STR,bkup_field_1);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BKUP_FIELD_2_INT,bkup_field_2);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BKUP_FIELD_3_FLOAT,bkup_field_3);
            return fastMsg;
        }
   }

    public class prodL_1_114_Request : BaseRequest, IRequest<prodL_1_114_Response>
    {
        public prodL_1_114_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.114";
            }
        }

        public int co_no { get; set; }
        public String pd_no_str { get; set; }
        public String index_value_str { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no_str", 'S', pd_no_str);
            packer.AddField("index_value_str", 'S', index_value_str);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_STR_STR,pd_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_INDEX_VALUE_STR_STR,index_value_str);
            return fastMsg;
        }
   }

    public class prodL_1_115_Request : BaseRequest, IRequest<prodL_1_115_Response>
    {
        public prodL_1_115_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.115";
            }
        }

        public int pass_no { get; set; }
        public int asset_acco_no { get; set; }
        public String asset_acco { get; set; }
        public String out_acco { get; set; }
        public String stock_acco_no_str { get; set; }
        public String exch_no_str { get; set; }
        public String stock_acco_str { get; set; }
        public String comm_pwd { get; set; }
        public String trade_pwd { get; set; }
        public String config_str { get; set; }
        public String asac_busi_config_str { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("asset_acco", 'S', asset_acco);
            packer.AddField("out_acco", 'S', out_acco);
            packer.AddField("stock_acco_no_str", 'S', stock_acco_no_str);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_acco_str", 'S', stock_acco_str);
            packer.AddField("comm_pwd", 'S', comm_pwd);
            packer.AddField("trade_pwd", 'S', trade_pwd);
            packer.AddField("config_str", 'S', config_str);
            packer.AddField("asac_busi_config_str", 'S', asac_busi_config_str);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STR,asset_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR,out_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_STR_STR,stock_acco_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR_STR,stock_acco_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_PWD_STR,comm_pwd);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_PWD_STR,trade_pwd);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_STR_STR,config_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ASAC_BUSI_CONFIG_STR_STR,asac_busi_config_str);
            return fastMsg;
        }
   }

    public class prodL_1_116_Request : BaseRequest, IRequest<prodL_1_116_Response>
    {
        public prodL_1_116_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.116";
            }
        }

        public int asset_acco_no { get; set; }
        public int contrc_code_no { get; set; }
        public int exch_no { get; set; }
        public int lngsht_type { get; set; }
        public int contrc_type { get; set; }
        public int hedge_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("contrc_code_no", 'I', contrc_code_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("lngsht_type", 'I', lngsht_type);
            packer.AddField("contrc_type", 'I', contrc_type);
            packer.AddField("hedge_type", 'I', hedge_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT,lngsht_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT,contrc_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT,hedge_type);
            return fastMsg;
        }
   }

    public class prodL_1_117_Request : BaseRequest, IRequest<prodL_1_117_Response>
    {
        public prodL_1_117_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.117";
            }
        }

        public int asset_acco_no { get; set; }
        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public int order_dir { get; set; }
        public double order_qty { get; set; }
        public double order_price { get; set; }
        public int price_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("order_dir", 'I', order_dir);
            packer.AddField("order_qty", 'D', order_qty);
            packer.AddField("order_price", 'D', order_price);
            packer.AddField("price_type", 'I', price_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT,order_dir);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT,order_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT,order_price);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_INT,price_type);
            return fastMsg;
        }
   }

    public class prodL_1_118_Request : BaseRequest, IRequest<prodL_1_118_Response>
    {
        public prodL_1_118_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "prodL.1.118";
            }
        }

        public String corrsp_id_str { get; set; }
        public String asset_acco_no_str { get; set; }
        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public String order_dir_str { get; set; }
        public String order_qty_str { get; set; }
        public String order_price_str { get; set; }
        public int price_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("corrsp_id_str", 'S', corrsp_id_str);
            packer.AddField("asset_acco_no_str", 'S', asset_acco_no_str);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("order_dir_str", 'S', order_dir_str);
            packer.AddField("order_qty_str", 'S', order_qty_str);
            packer.AddField("order_price_str", 'S', order_price_str);
            packer.AddField("price_type", 'I', price_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CORRSP_ID_STR_STR,corrsp_id_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_STR_STR,asset_acco_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR,order_dir_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_STR_STR,order_qty_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_STR_STR,order_price_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_INT,price_type);
            return fastMsg;
        }
   }

}
