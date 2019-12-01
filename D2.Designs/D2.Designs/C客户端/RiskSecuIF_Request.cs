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
    public class rksecuL_5_16_Request : BaseRequest, IRequest<rksecuL_5_16_Response>
    {
        public rksecuL_5_16_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rksecuL.5.16";
            }
        }

        public ulong moni_set_id { get; set; }
        public double curr_moni_value { get; set; }
        public double contrs_curr_moni_value { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("moni_set_id", 'L', moni_set_id);
            packer.AddField("curr_moni_value", 'D', curr_moni_value);
            packer.AddField("contrs_curr_moni_value", 'D', contrs_curr_moni_value);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_MONI_SET_ID_INT64,moni_set_id);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONI_VALUE_FLOAT,curr_moni_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CONTRS_CURR_MONI_VALUE_FLOAT,contrs_curr_moni_value);
            return fastMsg;
        }
   }

    public class rksecuL_5_17_Request : BaseRequest, IRequest<rksecuL_5_17_Response>
    {
        public rksecuL_5_17_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rksecuL.5.17";
            }
        }

        public ulong moni_set_id { get; set; }
        public double curr_moni_value { get; set; }
        public double cash_asset { get; set; }
        public double fund_asset { get; set; }
        public double bond_asset { get; set; }
        public double stock_asset { get; set; }
        public double repo_asset { get; set; }
        public double nav_asset { get; set; }
        public double contrs_curr_moni_value { get; set; }
        public double pd_share { get; set; }
        public double begin_asset_value { get; set; }
        public double hk_thrgh_stock_asset { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("moni_set_id", 'L', moni_set_id);
            packer.AddField("curr_moni_value", 'D', curr_moni_value);
            packer.AddField("cash_asset", 'D', cash_asset);
            packer.AddField("fund_asset", 'D', fund_asset);
            packer.AddField("bond_asset", 'D', bond_asset);
            packer.AddField("stock_asset", 'D', stock_asset);
            packer.AddField("repo_asset", 'D', repo_asset);
            packer.AddField("nav_asset", 'D', nav_asset);
            packer.AddField("contrs_curr_moni_value", 'D', contrs_curr_moni_value);
            packer.AddField("pd_share", 'D', pd_share);
            packer.AddField("begin_asset_value", 'D', begin_asset_value);
            packer.AddField("hk_thrgh_stock_asset", 'D', hk_thrgh_stock_asset);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_MONI_SET_ID_INT64,moni_set_id);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONI_VALUE_FLOAT,curr_moni_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_ASSET_FLOAT,cash_asset);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_ASSET_FLOAT,fund_asset);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ASSET_FLOAT,bond_asset);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_FLOAT,stock_asset);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPO_ASSET_FLOAT,repo_asset);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT,nav_asset);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CONTRS_CURR_MONI_VALUE_FLOAT,contrs_curr_moni_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_SHARE_FLOAT,pd_share);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_ASSET_VALUE_FLOAT,begin_asset_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HK_THRGH_STOCK_ASSET_FLOAT,hk_thrgh_stock_asset);
            return fastMsg;
        }
   }

    public class rksecuL_5_18_Request : BaseRequest, IRequest<rksecuL_5_18_Response>
    {
        public rksecuL_5_18_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rksecuL.5.18";
            }
        }

        public ulong detail_posi_id { get; set; }
        public int target_opor_no { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public int stock_acco_no { get; set; }
        public int stock_code_no { get; set; }
        public int lngsht_type { get; set; }
        public double curr_qty { get; set; }
        public int open_posi_date { get; set; }
        public int open_posi_time { get; set; }
        public double open_posi_price { get; set; }
        public double open_posi_value { get; set; }
        public double open_posi_fee { get; set; }
        public double close_posi_qty { get; set; }
        public double close_posi_market_value { get; set; }
        public double close_posi_fee { get; set; }
        public double realize_pandl { get; set; }
        public double pandl_ratio { get; set; }
        public double un_close_posi_qty { get; set; }
        public double un_close_marke_value { get; set; }
        public double last_price { get; set; }
        public double up_limit_price { get; set; }
        public double down_limit_price { get; set; }
        public double cost_price { get; set; }
        public double last_tshold_value { get; set; }
        public double float_pandl { get; set; }
        public String posi_status { get; set; }
        public String moni_result_status { get; set; }
        public String posi_limit_status { get; set; }
        public double opor_warn_tshold { get; set; }
        public double opor_stop_tshold { get; set; }
        public double stock_warn_ratio { get; set; }
        public double stock_stop_ratio { get; set; }
        public double stock_warn_amt { get; set; }
        public double stock_stop_amt { get; set; }
        public int open_close_permission { get; set; }
        public int posi_limit_time { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("detail_posi_id", 'L', detail_posi_id);
            packer.AddField("target_opor_no", 'I', target_opor_no);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("stock_acco_no", 'I', stock_acco_no);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("lngsht_type", 'I', lngsht_type);
            packer.AddField("curr_qty", 'D', curr_qty);
            packer.AddField("open_posi_date", 'I', open_posi_date);
            packer.AddField("open_posi_time", 'I', open_posi_time);
            packer.AddField("open_posi_price", 'D', open_posi_price);
            packer.AddField("open_posi_value", 'D', open_posi_value);
            packer.AddField("open_posi_fee", 'D', open_posi_fee);
            packer.AddField("close_posi_qty", 'D', close_posi_qty);
            packer.AddField("close_posi_market_value", 'D', close_posi_market_value);
            packer.AddField("close_posi_fee", 'D', close_posi_fee);
            packer.AddField("realize_pandl", 'D', realize_pandl);
            packer.AddField("pandl_ratio", 'D', pandl_ratio);
            packer.AddField("un_close_posi_qty", 'D', un_close_posi_qty);
            packer.AddField("un_close_marke_value", 'D', un_close_marke_value);
            packer.AddField("last_price", 'D', last_price);
            packer.AddField("up_limit_price", 'D', up_limit_price);
            packer.AddField("down_limit_price", 'D', down_limit_price);
            packer.AddField("cost_price", 'D', cost_price);
            packer.AddField("last_tshold_value", 'D', last_tshold_value);
            packer.AddField("float_pandl", 'D', float_pandl);
            packer.AddField("posi_status", 'S', posi_status);
            packer.AddField("moni_result_status", 'S', moni_result_status);
            packer.AddField("posi_limit_status", 'S', posi_limit_status);
            packer.AddField("opor_warn_tshold", 'D', opor_warn_tshold);
            packer.AddField("opor_stop_tshold", 'D', opor_stop_tshold);
            packer.AddField("stock_warn_ratio", 'D', stock_warn_ratio);
            packer.AddField("stock_stop_ratio", 'D', stock_stop_ratio);
            packer.AddField("stock_warn_amt", 'D', stock_warn_amt);
            packer.AddField("stock_stop_amt", 'D', stock_stop_amt);
            packer.AddField("open_close_permission", 'I', open_close_permission);
            packer.AddField("posi_limit_time", 'I', posi_limit_time);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_DETAIL_POSI_ID_INT64,detail_posi_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_OPOR_NO_INT,target_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT,stock_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT,lngsht_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT,curr_qty);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_DATE_INT,open_posi_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_TIME_INT,open_posi_time);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_PRICE_FLOAT,open_posi_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_VALUE_FLOAT,open_posi_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_FEE_FLOAT,open_posi_fee);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_QTY_FLOAT,close_posi_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_MARKET_VALUE_FLOAT,close_posi_market_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_FEE_FLOAT,close_posi_fee);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT,realize_pandl);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PANDL_RATIO_FLOAT,pandl_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UN_CLOSE_POSI_QTY_FLOAT,un_close_posi_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UN_CLOSE_MARKE_VALUE_FLOAT,un_close_marke_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT,last_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UP_LIMIT_PRICE_FLOAT,up_limit_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DOWN_LIMIT_PRICE_FLOAT,down_limit_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_PRICE_FLOAT,cost_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_TSHOLD_VALUE_FLOAT,last_tshold_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FLOAT_PANDL_FLOAT,float_pandl);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_POSI_STATUS_STR,posi_status);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MONI_RESULT_STATUS_STR,moni_result_status);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_POSI_LIMIT_STATUS_STR,posi_limit_status);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_WARN_TSHOLD_FLOAT,opor_warn_tshold);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_STOP_TSHOLD_FLOAT,opor_stop_tshold);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_WARN_RATIO_FLOAT,stock_warn_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_STOP_RATIO_FLOAT,stock_stop_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_WARN_AMT_FLOAT,stock_warn_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_STOP_AMT_FLOAT,stock_stop_amt);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_CLOSE_PERMISSION_INT,open_close_permission);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_POSI_LIMIT_TIME_INT,posi_limit_time);
            return fastMsg;
        }
   }

    public class rksecuL_5_19_Request : BaseRequest, IRequest<rksecuL_5_19_Response>
    {
        public rksecuL_5_19_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rksecuL.5.19";
            }
        }

        public int target_opor_no { get; set; }
        public int co_no { get; set; }
        public double curr_qty { get; set; }
        public double open_posi_value { get; set; }
        public double open_posi_fee { get; set; }
        public double close_posi_qty { get; set; }
        public double close_posi_market_value { get; set; }
        public double close_posi_fee { get; set; }
        public double realize_pandl { get; set; }
        public double float_pandl { get; set; }
        public double pandl_ratio { get; set; }
        public double un_close_posi_qty { get; set; }
        public double un_close_marke_value { get; set; }
        public double last_tshold_value { get; set; }
        public String moni_result_status { get; set; }
        public double opor_warn_tshold { get; set; }
        public double opor_stop_tshold { get; set; }
        public int open_close_permission { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("target_opor_no", 'I', target_opor_no);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("curr_qty", 'D', curr_qty);
            packer.AddField("open_posi_value", 'D', open_posi_value);
            packer.AddField("open_posi_fee", 'D', open_posi_fee);
            packer.AddField("close_posi_qty", 'D', close_posi_qty);
            packer.AddField("close_posi_market_value", 'D', close_posi_market_value);
            packer.AddField("close_posi_fee", 'D', close_posi_fee);
            packer.AddField("realize_pandl", 'D', realize_pandl);
            packer.AddField("float_pandl", 'D', float_pandl);
            packer.AddField("pandl_ratio", 'D', pandl_ratio);
            packer.AddField("un_close_posi_qty", 'D', un_close_posi_qty);
            packer.AddField("un_close_marke_value", 'D', un_close_marke_value);
            packer.AddField("last_tshold_value", 'D', last_tshold_value);
            packer.AddField("moni_result_status", 'S', moni_result_status);
            packer.AddField("opor_warn_tshold", 'D', opor_warn_tshold);
            packer.AddField("opor_stop_tshold", 'D', opor_stop_tshold);
            packer.AddField("open_close_permission", 'I', open_close_permission);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_OPOR_NO_INT,target_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT,curr_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_VALUE_FLOAT,open_posi_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_FEE_FLOAT,open_posi_fee);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_QTY_FLOAT,close_posi_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_MARKET_VALUE_FLOAT,close_posi_market_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_FEE_FLOAT,close_posi_fee);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT,realize_pandl);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FLOAT_PANDL_FLOAT,float_pandl);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PANDL_RATIO_FLOAT,pandl_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UN_CLOSE_POSI_QTY_FLOAT,un_close_posi_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UN_CLOSE_MARKE_VALUE_FLOAT,un_close_marke_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_TSHOLD_VALUE_FLOAT,last_tshold_value);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MONI_RESULT_STATUS_STR,moni_result_status);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_WARN_TSHOLD_FLOAT,opor_warn_tshold);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_STOP_TSHOLD_FLOAT,opor_stop_tshold);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_CLOSE_PERMISSION_INT,open_close_permission);
            return fastMsg;
        }
   }

    public class rksecuL_5_20_Request : BaseRequest, IRequest<rksecuL_5_20_Response>
    {
        public rksecuL_5_20_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rksecuL.5.20";
            }
        }

        public ulong moni_set_id { get; set; }
        public double curr_moni_value { get; set; }
        public double cash_asset { get; set; }
        public double fund_asset { get; set; }
        public double bond_asset { get; set; }
        public double stock_asset { get; set; }
        public double repo_asset { get; set; }
        public double nav_asset { get; set; }
        public double contrs_curr_moni_value { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("moni_set_id", 'L', moni_set_id);
            packer.AddField("curr_moni_value", 'D', curr_moni_value);
            packer.AddField("cash_asset", 'D', cash_asset);
            packer.AddField("fund_asset", 'D', fund_asset);
            packer.AddField("bond_asset", 'D', bond_asset);
            packer.AddField("stock_asset", 'D', stock_asset);
            packer.AddField("repo_asset", 'D', repo_asset);
            packer.AddField("nav_asset", 'D', nav_asset);
            packer.AddField("contrs_curr_moni_value", 'D', contrs_curr_moni_value);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_MONI_SET_ID_INT64,moni_set_id);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONI_VALUE_FLOAT,curr_moni_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_ASSET_FLOAT,cash_asset);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_ASSET_FLOAT,fund_asset);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ASSET_FLOAT,bond_asset);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_FLOAT,stock_asset);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPO_ASSET_FLOAT,repo_asset);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT,nav_asset);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CONTRS_CURR_MONI_VALUE_FLOAT,contrs_curr_moni_value);
            return fastMsg;
        }
   }

    public class rksecuL_5_21_Request : BaseRequest, IRequest<rksecuL_5_21_Response>
    {
        public rksecuL_5_21_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rksecuL.5.21";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            return fastMsg;
        }
   }

    public class rksecuL_5_22_Request : BaseRequest, IRequest<rksecuL_5_22_Response>
    {
        public rksecuL_5_22_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rksecuL.5.22";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public int exch_no { get; set; }
        public String exch_crncy_type { get; set; }
        public String stock_code { get; set; }
        public double comm_limit_price { get; set; }
        public double limit_actual_price { get; set; }
        public int comm_dir { get; set; }
        public double comm_qty { get; set; }
        public int comm_executor { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("exch_crncy_type", 'S', exch_crncy_type);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("comm_limit_price", 'D', comm_limit_price);
            packer.AddField("limit_actual_price", 'D', limit_actual_price);
            packer.AddField("comm_dir", 'I', comm_dir);
            packer.AddField("comm_qty", 'D', comm_qty);
            packer.AddField("comm_executor", 'I', comm_executor);
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
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR,exch_crncy_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_LIMIT_PRICE_FLOAT,comm_limit_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT,limit_actual_price);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_INT,comm_dir);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_QTY_FLOAT,comm_qty);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_EXECUTOR_INT,comm_executor);
            return fastMsg;
        }
   }

}
