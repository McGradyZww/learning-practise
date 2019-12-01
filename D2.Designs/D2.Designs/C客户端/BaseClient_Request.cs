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
    public class pubL_17_8_Request : BaseRequest, IRequest<pubL_17_8_Response>
    {
        public pubL_17_8_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.17.8";
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

    public class pubL_17_12_Request : BaseRequest, IRequest<pubL_17_12_Response>
    {
        public pubL_17_12_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.17.12";
            }
        }

        public String co_name { get; set; }
        public String conta_addr { get; set; }
        public String conta_name { get; set; }
        public String phone_number { get; set; }
        public int comm_appr_oper { get; set; }
        public double market_price_ratio { get; set; }
        public String base_crncy_type { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_name", 'S', co_name);
            packer.AddField("conta_addr", 'S', conta_addr);
            packer.AddField("conta_name", 'S', conta_name);
            packer.AddField("phone_number", 'S', phone_number);
            packer.AddField("comm_appr_oper", 'I', comm_appr_oper);
            packer.AddField("market_price_ratio", 'D', market_price_ratio);
            packer.AddField("base_crncy_type", 'S', base_crncy_type);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CO_NAME_STR,co_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTA_ADDR_STR,conta_addr);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTA_NAME_STR,conta_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PHONE_NUMBER_STR,phone_number);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_OPER_INT,comm_appr_oper);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_PRICE_RATIO_FLOAT,market_price_ratio);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_BASE_CRNCY_TYPE_STR,base_crncy_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_17_13_Request : BaseRequest, IRequest<pubL_17_13_Response>
    {
        public pubL_17_13_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.17.13";
            }
        }

        public int config_index { get; set; }
        public String config_value { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("config_index", 'I', config_index);
            packer.AddField("config_value", 'S', config_value);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_INDEX_INT,config_index);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_VALUE_STR,config_value);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_17_18_Request : BaseRequest, IRequest<pubL_17_18_Response>
    {
        public pubL_17_18_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.17.18";
            }
        }

        public int co_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            return fastMsg;
        }
   }

    public class pubL_17_32_Request : BaseRequest, IRequest<pubL_17_32_Response>
    {
        public pubL_17_32_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.17.32";
            }
        }

        public String config_no_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("config_no_str", 'S', config_no_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_NO_STR_STR,config_no_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_17_38_Request : BaseRequest, IRequest<pubL_17_38_Response>
    {
        public pubL_17_38_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.17.38";
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

    public class pubL_17_154_Request : BaseRequest, IRequest<pubL_17_154_Response>
    {
        public pubL_17_154_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.17.154";
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

    public class pubL_17_155_Request : BaseRequest, IRequest<pubL_17_155_Response>
    {
        public pubL_17_155_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.17.155";
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

    public class pubL_17_117_Request : BaseRequest, IRequest<pubL_17_117_Response>
    {
        public pubL_17_117_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.17.117";
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

    public class pubL_17_118_Request : BaseRequest, IRequest<pubL_17_118_Response>
    {
        public pubL_17_118_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.17.118";
            }
        }

        public int exch_no { get; set; }
        public double begin_limit { get; set; }
        public double remain_limit { get; set; }
        public int limit_status { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("begin_limit", 'D', begin_limit);
            packer.AddField("remain_limit", 'D', remain_limit);
            packer.AddField("limit_status", 'I', limit_status);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_LIMIT_FLOAT,begin_limit);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REMAIN_LIMIT_FLOAT,remain_limit);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LIMIT_STATUS_INT,limit_status);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class pubL_17_119_Request : BaseRequest, IRequest<pubL_17_119_Response>
    {
        public pubL_17_119_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.17.119";
            }
        }

        public int exch_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            return fastMsg;
        }
   }

    public class pubL_17_180_Request : BaseRequest, IRequest<pubL_17_180_Response>
    {
        public pubL_17_180_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.17.180";
            }
        }

        public int dict_no { get; set; }
        public String dict_item_name { get; set; }
        public String dict_field_name { get; set; }
        public int time_stamp { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("dict_no", 'I', dict_no);
            packer.AddField("dict_item_name", 'S', dict_item_name);
            packer.AddField("dict_field_name", 'S', dict_field_name);
            packer.AddField("time_stamp", 'I', time_stamp);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DICT_NO_INT,dict_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_DICT_ITEM_NAME_STR,dict_item_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_DICT_FIELD_NAME_STR,dict_field_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT,time_stamp);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_17_181_Request : BaseRequest, IRequest<pubL_17_181_Response>
    {
        public pubL_17_181_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.17.181";
            }
        }

        public int busi_type { get; set; }
        public int busi_sub_type { get; set; }
        public int busi_flag { get; set; }
        public String busi_name { get; set; }
        public int time_stamp { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("busi_type", 'I', busi_type);
            packer.AddField("busi_sub_type", 'I', busi_sub_type);
            packer.AddField("busi_flag", 'I', busi_flag);
            packer.AddField("busi_name", 'S', busi_name);
            packer.AddField("time_stamp", 'I', time_stamp);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_TYPE_INT,busi_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_SUB_TYPE_INT,busi_sub_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT,busi_flag);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_NAME_STR,busi_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT,time_stamp);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_17_182_Request : BaseRequest, IRequest<pubL_17_182_Response>
    {
        public pubL_17_182_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.17.182";
            }
        }

        public int stock_code_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("stock_code_no", 'I', stock_code_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            return fastMsg;
        }
   }

    public class pubL_17_120_Request : BaseRequest, IRequest<pubL_17_120_Response>
    {
        public pubL_17_120_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.17.120";
            }
        }

        public int query_date { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("query_date", 'I', query_date);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_DATE_INT,query_date);
            return fastMsg;
        }
   }

    public class pubL_17_121_Request : BaseRequest, IRequest<pubL_17_121_Response>
    {
        public pubL_17_121_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.17.121";
            }
        }

        public int init_date { get; set; }
        public double sh_hk_buy_ref_rate { get; set; }
        public double sh_hk_sell_ref_rate { get; set; }
        public double sh_hk_settle_buy_rate { get; set; }
        public double sh_hk_settle_sell_rate { get; set; }
        public double sz_hk_buy_ref_rate { get; set; }
        public double sz_hk_sell_ref_rate { get; set; }
        public double sz_hk_settle_buy_rate { get; set; }
        public double sz_hksettle_sell_rate { get; set; }
        public double pboc_rate { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("init_date", 'I', init_date);
            packer.AddField("sh_hk_buy_ref_rate", 'D', sh_hk_buy_ref_rate);
            packer.AddField("sh_hk_sell_ref_rate", 'D', sh_hk_sell_ref_rate);
            packer.AddField("sh_hk_settle_buy_rate", 'D', sh_hk_settle_buy_rate);
            packer.AddField("sh_hk_settle_sell_rate", 'D', sh_hk_settle_sell_rate);
            packer.AddField("sz_hk_buy_ref_rate", 'D', sz_hk_buy_ref_rate);
            packer.AddField("sz_hk_sell_ref_rate", 'D', sz_hk_sell_ref_rate);
            packer.AddField("sz_hk_settle_buy_rate", 'D', sz_hk_settle_buy_rate);
            packer.AddField("sz_hksettle_sell_rate", 'D', sz_hksettle_sell_rate);
            packer.AddField("pboc_rate", 'D', pboc_rate);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SH_HK_BUY_REF_RATE_FLOAT,sh_hk_buy_ref_rate);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SH_HK_SELL_REF_RATE_FLOAT,sh_hk_sell_ref_rate);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SH_HK_SETTLE_BUY_RATE_FLOAT,sh_hk_settle_buy_rate);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SH_HK_SETTLE_SELL_RATE_FLOAT,sh_hk_settle_sell_rate);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SZ_HK_BUY_REF_RATE_FLOAT,sz_hk_buy_ref_rate);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SZ_HK_SELL_REF_RATE_FLOAT,sz_hk_sell_ref_rate);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SZ_HK_SETTLE_BUY_RATE_FLOAT,sz_hk_settle_buy_rate);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SZ_HKSETTLE_SELL_RATE_FLOAT,sz_hksettle_sell_rate);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PBOC_RATE_FLOAT,pboc_rate);
            return fastMsg;
        }
   }

    public class pubL_17_122_Request : BaseRequest, IRequest<pubL_17_122_Response>
    {
        public pubL_17_122_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.17.122";
            }
        }

        public int init_date { get; set; }
        public double sh_hk_buy_ref_rate { get; set; }
        public double sh_hk_sell_ref_rate { get; set; }
        public double sh_hk_settle_buy_rate { get; set; }
        public double sh_hk_settle_sell_rate { get; set; }
        public double sz_hk_buy_ref_rate { get; set; }
        public double sz_hk_sell_ref_rate { get; set; }
        public double sz_hk_settle_buy_rate { get; set; }
        public double sz_hksettle_sell_rate { get; set; }
        public double pboc_rate { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("init_date", 'I', init_date);
            packer.AddField("sh_hk_buy_ref_rate", 'D', sh_hk_buy_ref_rate);
            packer.AddField("sh_hk_sell_ref_rate", 'D', sh_hk_sell_ref_rate);
            packer.AddField("sh_hk_settle_buy_rate", 'D', sh_hk_settle_buy_rate);
            packer.AddField("sh_hk_settle_sell_rate", 'D', sh_hk_settle_sell_rate);
            packer.AddField("sz_hk_buy_ref_rate", 'D', sz_hk_buy_ref_rate);
            packer.AddField("sz_hk_sell_ref_rate", 'D', sz_hk_sell_ref_rate);
            packer.AddField("sz_hk_settle_buy_rate", 'D', sz_hk_settle_buy_rate);
            packer.AddField("sz_hksettle_sell_rate", 'D', sz_hksettle_sell_rate);
            packer.AddField("pboc_rate", 'D', pboc_rate);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SH_HK_BUY_REF_RATE_FLOAT,sh_hk_buy_ref_rate);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SH_HK_SELL_REF_RATE_FLOAT,sh_hk_sell_ref_rate);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SH_HK_SETTLE_BUY_RATE_FLOAT,sh_hk_settle_buy_rate);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SH_HK_SETTLE_SELL_RATE_FLOAT,sh_hk_settle_sell_rate);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SZ_HK_BUY_REF_RATE_FLOAT,sz_hk_buy_ref_rate);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SZ_HK_SELL_REF_RATE_FLOAT,sz_hk_sell_ref_rate);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SZ_HK_SETTLE_BUY_RATE_FLOAT,sz_hk_settle_buy_rate);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SZ_HKSETTLE_SELL_RATE_FLOAT,sz_hksettle_sell_rate);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PBOC_RATE_FLOAT,pboc_rate);
            return fastMsg;
        }
   }

    public class pubL_17_123_Request : BaseRequest, IRequest<pubL_17_123_Response>
    {
        public pubL_17_123_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.17.123";
            }
        }

        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public int apply_date { get; set; }
        public double apply_limit { get; set; }
        public int begin_trade_date { get; set; }
        public double issue_price { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("apply_date", 'I', apply_date);
            packer.AddField("apply_limit", 'D', apply_limit);
            packer.AddField("begin_trade_date", 'I', begin_trade_date);
            packer.AddField("issue_price", 'D', issue_price);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_APPLY_DATE_INT,apply_date);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_APPLY_LIMIT_FLOAT,apply_limit);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TRADE_DATE_INT,begin_trade_date);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ISSUE_PRICE_FLOAT,issue_price);
            return fastMsg;
        }
   }

    public class pubL_17_124_Request : BaseRequest, IRequest<pubL_17_124_Response>
    {
        public pubL_17_124_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.17.124";
            }
        }

        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public int apply_date { get; set; }
        public double apply_limit { get; set; }
        public int begin_trade_date { get; set; }
        public double issue_price { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("apply_date", 'I', apply_date);
            packer.AddField("apply_limit", 'D', apply_limit);
            packer.AddField("begin_trade_date", 'I', begin_trade_date);
            packer.AddField("issue_price", 'D', issue_price);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_APPLY_DATE_INT,apply_date);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_APPLY_LIMIT_FLOAT,apply_limit);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TRADE_DATE_INT,begin_trade_date);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ISSUE_PRICE_FLOAT,issue_price);
            return fastMsg;
        }
   }

    public class pubL_17_125_Request : BaseRequest, IRequest<pubL_17_125_Response>
    {
        public pubL_17_125_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.17.125";
            }
        }

        public int record_batch_no { get; set; }
        public int co_no { get; set; }
        public int comm_trd_type { get; set; }
        public ulong basket_id { get; set; }
        public String basket_name { get; set; }
        public double futu_qty { get; set; }
        public double spot_qty { get; set; }
        public double basket_copies { get; set; }
        public double cash_replace_amt { get; set; }
        public double hedging_pankou { get; set; }
        public double name_base_diff { get; set; }
        public double basket_base_diff { get; set; }
        public double track_base_diff { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("record_batch_no", 'I', record_batch_no);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("comm_trd_type", 'I', comm_trd_type);
            packer.AddField("basket_id", 'L', basket_id);
            packer.AddField("basket_name", 'S', basket_name);
            packer.AddField("futu_qty", 'D', futu_qty);
            packer.AddField("spot_qty", 'D', spot_qty);
            packer.AddField("basket_copies", 'D', basket_copies);
            packer.AddField("cash_replace_amt", 'D', cash_replace_amt);
            packer.AddField("hedging_pankou", 'D', hedging_pankou);
            packer.AddField("name_base_diff", 'D', name_base_diff);
            packer.AddField("basket_base_diff", 'D', basket_base_diff);
            packer.AddField("track_base_diff", 'D', track_base_diff);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RECORD_BATCH_NO_INT,record_batch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_TRD_TYPE_INT,comm_trd_type);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_ID_INT64,basket_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_NAME_STR,basket_name);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_QTY_FLOAT,futu_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SPOT_QTY_FLOAT,spot_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_COPIES_FLOAT,basket_copies);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_REPLACE_AMT_FLOAT,cash_replace_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HEDGING_PANKOU_FLOAT,hedging_pankou);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAME_BASE_DIFF_FLOAT,name_base_diff);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_BASE_DIFF_FLOAT,basket_base_diff);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRACK_BASE_DIFF_FLOAT,track_base_diff);
            return fastMsg;
        }
   }

    public class pubL_17_126_Request : BaseRequest, IRequest<pubL_17_126_Response>
    {
        public pubL_17_126_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.17.126";
            }
        }

        public int co_no { get; set; }
        public int comm_trd_type { get; set; }
        public int record_batch_no { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public int sort_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("comm_trd_type", 'I', comm_trd_type);
            packer.AddField("record_batch_no", 'I', record_batch_no);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
            packer.AddField("sort_type", 'I', sort_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_TRD_TYPE_INT,comm_trd_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RECORD_BATCH_NO_INT,record_batch_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SORT_TYPE_INT,sort_type);
            return fastMsg;
        }
   }

    public class pubL_17_127_Request : BaseRequest, IRequest<pubL_17_127_Response>
    {
        public pubL_17_127_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.17.127";
            }
        }

        public int begin_date { get; set; }
        public int end_date { get; set; }
        public int co_no { get; set; }
        public int comm_trd_type { get; set; }
        public int record_batch_no { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("comm_trd_type", 'I', comm_trd_type);
            packer.AddField("record_batch_no", 'I', record_batch_no);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_TRD_TYPE_INT,comm_trd_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RECORD_BATCH_NO_INT,record_batch_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_17_128_Request : BaseRequest, IRequest<pubL_17_128_Response>
    {
        public pubL_17_128_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.17.128";
            }
        }

        public int record_batch_no { get; set; }
        public int init_date { get; set; }
        public int co_no { get; set; }
        public double basket_copies { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("record_batch_no", 'I', record_batch_no);
            packer.AddField("init_date", 'I', init_date);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("basket_copies", 'D', basket_copies);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RECORD_BATCH_NO_INT,record_batch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_COPIES_FLOAT,basket_copies);
            return fastMsg;
        }
   }

}
