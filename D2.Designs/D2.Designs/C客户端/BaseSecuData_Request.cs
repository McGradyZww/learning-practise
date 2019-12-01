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
    public class pubL_1_6_Request : BaseRequest, IRequest<pubL_1_6_Response>
    {
        public pubL_1_6_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.6";
            }
        }

        public String exch_no_str { get; set; }
        public String stock_type_str { get; set; }
        public String stock_code_feature { get; set; }
        public String stock_name_feature { get; set; }
        public String model_name { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_type_str", 'S', stock_type_str);
            packer.AddField("stock_code_feature", 'S', stock_code_feature);
            packer.AddField("stock_name_feature", 'S', stock_name_feature);
            packer.AddField("model_name", 'S', model_name);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_STR_STR,stock_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_FEATURE_STR,stock_code_feature);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_FEATURE_STR,stock_name_feature);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MODEL_NAME_STR,model_name);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_1_12_Request : BaseRequest, IRequest<pubL_1_12_Response>
    {
        public pubL_1_12_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.12";
            }
        }

        public int exch_no { get; set; }
        public int stock_type { get; set; }
        public String stock_type_name { get; set; }
        public int asset_type { get; set; }
        public double par_value { get; set; }
        public String crncy_type { get; set; }
        public String exch_crncy_type { get; set; }
        public int capit_reback_days { get; set; }
        public int posi_reback_days { get; set; }
        public int type_unit { get; set; }
        public int report_unit { get; set; }
        public int min_unit { get; set; }
        public double max_qty { get; set; }
        public double min_qty { get; set; }
        public int is_order_dir_flag { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_type", 'I', stock_type);
            packer.AddField("stock_type_name", 'S', stock_type_name);
            packer.AddField("asset_type", 'I', asset_type);
            packer.AddField("par_value", 'D', par_value);
            packer.AddField("crncy_type", 'S', crncy_type);
            packer.AddField("exch_crncy_type", 'S', exch_crncy_type);
            packer.AddField("capit_reback_days", 'I', capit_reback_days);
            packer.AddField("posi_reback_days", 'I', posi_reback_days);
            packer.AddField("type_unit", 'I', type_unit);
            packer.AddField("report_unit", 'I', report_unit);
            packer.AddField("min_unit", 'I', min_unit);
            packer.AddField("max_qty", 'D', max_qty);
            packer.AddField("min_qty", 'D', min_qty);
            packer.AddField("is_order_dir_flag", 'I', is_order_dir_flag);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT,stock_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_NAME_STR,stock_type_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT,asset_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_FLOAT,par_value);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR,exch_crncy_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CAPIT_REBACK_DAYS_INT,capit_reback_days);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_POSI_REBACK_DAYS_INT,posi_reback_days);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TYPE_UNIT_INT,type_unit);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_UNIT_INT,report_unit);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MIN_UNIT_INT,min_unit);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_QTY_FLOAT,max_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_QTY_FLOAT,min_qty);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_ORDER_DIR_FLAG_INT,is_order_dir_flag);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_1_14_Request : BaseRequest, IRequest<pubL_1_14_Response>
    {
        public pubL_1_14_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.14";
            }
        }

        public String exch_no_str { get; set; }
        public String stock_type_str { get; set; }
        public String asset_type_str { get; set; }
        public int time_stamp { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_type_str", 'S', stock_type_str);
            packer.AddField("asset_type_str", 'S', asset_type_str);
            packer.AddField("time_stamp", 'I', time_stamp);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_STR_STR,stock_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_STR_STR,asset_type_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT,time_stamp);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_1_15_Request : BaseRequest, IRequest<pubL_1_15_Response>
    {
        public pubL_1_15_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.15";
            }
        }

        public String exch_no_str { get; set; }
        public String stock_type_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_type_str", 'S', stock_type_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_STR_STR,stock_type_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_1_16_Request : BaseRequest, IRequest<pubL_1_16_Response>
    {
        public pubL_1_16_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.16";
            }
        }

        public int begin_date { get; set; }
        public int end_date { get; set; }
        public String exch_no_str { get; set; }
        public String stock_type_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_type_str", 'S', stock_type_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT,end_date);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_STR_STR,stock_type_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_1_24_Request : BaseRequest, IRequest<pubL_1_24_Response>
    {
        public pubL_1_24_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.24";
            }
        }

        public String exch_no_str { get; set; }
        public String stock_type_str { get; set; }
        public String order_dir_str { get; set; }
        public int time_stamp { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_type_str", 'S', stock_type_str);
            packer.AddField("order_dir_str", 'S', order_dir_str);
            packer.AddField("time_stamp", 'I', time_stamp);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_STR_STR,stock_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR,order_dir_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT,time_stamp);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_1_41_Request : BaseRequest, IRequest<pubL_1_41_Response>
    {
        public pubL_1_41_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.41";
            }
        }

        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public String stock_name { get; set; }
        public String pinyin_short { get; set; }
        public int stock_type { get; set; }
        public int asset_type { get; set; }
        public double par_value { get; set; }
        public String crncy_type { get; set; }
        public String exch_crncy_type { get; set; }
        public double total_stock_issue { get; set; }
        public double circl_stock_capit { get; set; }
        public int capit_reback_days { get; set; }
        public int posi_reback_days { get; set; }
        public int type_unit { get; set; }
        public int report_unit { get; set; }
        public int min_unit { get; set; }
        public double max_qty { get; set; }
        public double min_qty { get; set; }
        public int is_order_dir_flag { get; set; }
        public double price_up { get; set; }
        public double price_down { get; set; }
        public double step_price { get; set; }
        public double fair_price { get; set; }
        public String stop_status { get; set; }
        public int hk_stock_flag { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("stock_name", 'S', stock_name);
            packer.AddField("pinyin_short", 'S', pinyin_short);
            packer.AddField("stock_type", 'I', stock_type);
            packer.AddField("asset_type", 'I', asset_type);
            packer.AddField("par_value", 'D', par_value);
            packer.AddField("crncy_type", 'S', crncy_type);
            packer.AddField("exch_crncy_type", 'S', exch_crncy_type);
            packer.AddField("total_stock_issue", 'D', total_stock_issue);
            packer.AddField("circl_stock_capit", 'D', circl_stock_capit);
            packer.AddField("capit_reback_days", 'I', capit_reback_days);
            packer.AddField("posi_reback_days", 'I', posi_reback_days);
            packer.AddField("type_unit", 'I', type_unit);
            packer.AddField("report_unit", 'I', report_unit);
            packer.AddField("min_unit", 'I', min_unit);
            packer.AddField("max_qty", 'D', max_qty);
            packer.AddField("min_qty", 'D', min_qty);
            packer.AddField("is_order_dir_flag", 'I', is_order_dir_flag);
            packer.AddField("price_up", 'D', price_up);
            packer.AddField("price_down", 'D', price_down);
            packer.AddField("step_price", 'D', step_price);
            packer.AddField("fair_price", 'D', fair_price);
            packer.AddField("stop_status", 'S', stop_status);
            packer.AddField("hk_stock_flag", 'I', hk_stock_flag);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR,stock_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PINYIN_SHORT_STR,pinyin_short);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT,stock_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT,asset_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_FLOAT,par_value);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR,exch_crncy_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_STOCK_ISSUE_FLOAT,total_stock_issue);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CIRCL_STOCK_CAPIT_FLOAT,circl_stock_capit);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CAPIT_REBACK_DAYS_INT,capit_reback_days);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_POSI_REBACK_DAYS_INT,posi_reback_days);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TYPE_UNIT_INT,type_unit);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_UNIT_INT,report_unit);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MIN_UNIT_INT,min_unit);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_QTY_FLOAT,max_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_QTY_FLOAT,min_qty);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_ORDER_DIR_FLAG_INT,is_order_dir_flag);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_UP_FLOAT,price_up);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_DOWN_FLOAT,price_down);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STEP_PRICE_FLOAT,step_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FAIR_PRICE_FLOAT,fair_price);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOP_STATUS_STR,stop_status);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HK_STOCK_FLAG_INT,hk_stock_flag);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_1_42_Request : BaseRequest, IRequest<pubL_1_42_Response>
    {
        public pubL_1_42_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.42";
            }
        }

        public int stock_code_no { get; set; }
        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public String stock_name { get; set; }
        public String pinyin_short { get; set; }
        public int stock_type { get; set; }
        public int asset_type { get; set; }
        public double par_value { get; set; }
        public String crncy_type { get; set; }
        public String exch_crncy_type { get; set; }
        public double total_stock_issue { get; set; }
        public double circl_stock_capit { get; set; }
        public int capit_reback_days { get; set; }
        public int posi_reback_days { get; set; }
        public int type_unit { get; set; }
        public int report_unit { get; set; }
        public int min_unit { get; set; }
        public double max_qty { get; set; }
        public double min_qty { get; set; }
        public int is_order_dir_flag { get; set; }
        public double price_up { get; set; }
        public double price_down { get; set; }
        public double step_price { get; set; }
        public double fair_price { get; set; }
        public String stop_status { get; set; }
        public int hk_stock_flag { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("stock_name", 'S', stock_name);
            packer.AddField("pinyin_short", 'S', pinyin_short);
            packer.AddField("stock_type", 'I', stock_type);
            packer.AddField("asset_type", 'I', asset_type);
            packer.AddField("par_value", 'D', par_value);
            packer.AddField("crncy_type", 'S', crncy_type);
            packer.AddField("exch_crncy_type", 'S', exch_crncy_type);
            packer.AddField("total_stock_issue", 'D', total_stock_issue);
            packer.AddField("circl_stock_capit", 'D', circl_stock_capit);
            packer.AddField("capit_reback_days", 'I', capit_reback_days);
            packer.AddField("posi_reback_days", 'I', posi_reback_days);
            packer.AddField("type_unit", 'I', type_unit);
            packer.AddField("report_unit", 'I', report_unit);
            packer.AddField("min_unit", 'I', min_unit);
            packer.AddField("max_qty", 'D', max_qty);
            packer.AddField("min_qty", 'D', min_qty);
            packer.AddField("is_order_dir_flag", 'I', is_order_dir_flag);
            packer.AddField("price_up", 'D', price_up);
            packer.AddField("price_down", 'D', price_down);
            packer.AddField("step_price", 'D', step_price);
            packer.AddField("fair_price", 'D', fair_price);
            packer.AddField("stop_status", 'S', stop_status);
            packer.AddField("hk_stock_flag", 'I', hk_stock_flag);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR,stock_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PINYIN_SHORT_STR,pinyin_short);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT,stock_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT,asset_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_FLOAT,par_value);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR,exch_crncy_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_STOCK_ISSUE_FLOAT,total_stock_issue);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CIRCL_STOCK_CAPIT_FLOAT,circl_stock_capit);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CAPIT_REBACK_DAYS_INT,capit_reback_days);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_POSI_REBACK_DAYS_INT,posi_reback_days);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TYPE_UNIT_INT,type_unit);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_UNIT_INT,report_unit);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MIN_UNIT_INT,min_unit);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_QTY_FLOAT,max_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_QTY_FLOAT,min_qty);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_ORDER_DIR_FLAG_INT,is_order_dir_flag);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_UP_FLOAT,price_up);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_DOWN_FLOAT,price_down);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STEP_PRICE_FLOAT,step_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FAIR_PRICE_FLOAT,fair_price);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOP_STATUS_STR,stop_status);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HK_STOCK_FLAG_INT,hk_stock_flag);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_1_43_Request : BaseRequest, IRequest<pubL_1_43_Response>
    {
        public pubL_1_43_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.43";
            }
        }

        public String exch_no_str { get; set; }
        public String stock_code { get; set; }
        public String stock_name { get; set; }
        public String pinyin_short { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("stock_name", 'S', stock_name);
            packer.AddField("pinyin_short", 'S', pinyin_short);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR,stock_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PINYIN_SHORT_STR,pinyin_short);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_1_44_Request : BaseRequest, IRequest<pubL_1_44_Response>
    {
        public pubL_1_44_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.44";
            }
        }

        public int stock_code_no { get; set; }
        public String exch_no_str { get; set; }
        public String stock_code { get; set; }
        public String stock_type_str { get; set; }
        public String asset_type_str { get; set; }
        public String stop_status_str { get; set; }
        public int time_stamp { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("stock_type_str", 'S', stock_type_str);
            packer.AddField("asset_type_str", 'S', asset_type_str);
            packer.AddField("stop_status_str", 'S', stop_status_str);
            packer.AddField("time_stamp", 'I', time_stamp);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_STR_STR,stock_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_STR_STR,asset_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOP_STATUS_STR_STR,stop_status_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT,time_stamp);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_1_45_Request : BaseRequest, IRequest<pubL_1_45_Response>
    {
        public pubL_1_45_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.45";
            }
        }

        public int stock_code_no { get; set; }
        public String exch_no_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_1_46_Request : BaseRequest, IRequest<pubL_1_46_Response>
    {
        public pubL_1_46_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.46";
            }
        }

        public int begin_date { get; set; }
        public int end_date { get; set; }
        public int stock_code_no { get; set; }
        public String exch_no_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT,end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_1_47_Request : BaseRequest, IRequest<pubL_1_47_Response>
    {
        public pubL_1_47_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.47";
            }
        }

        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_1_49_Request : BaseRequest, IRequest<pubL_1_49_Response>
    {
        public pubL_1_49_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.49";
            }
        }

        public int stock_code_load_range { get; set; }
        public int time_stamp { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("stock_code_load_range", 'I', stock_code_load_range);
            packer.AddField("time_stamp", 'I', time_stamp);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_LOAD_RANGE_INT,stock_code_load_range);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT,time_stamp);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_1_51_Request : BaseRequest, IRequest<pubL_1_51_Response>
    {
        public pubL_1_51_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.51";
            }
        }

        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public int order_dir { get; set; }
        public int cash_frozen_type { get; set; }
        public int order_split_flag { get; set; }
        public int min_unit { get; set; }
        public double max_qty { get; set; }
        public double min_qty { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("order_dir", 'I', order_dir);
            packer.AddField("cash_frozen_type", 'I', cash_frozen_type);
            packer.AddField("order_split_flag", 'I', order_split_flag);
            packer.AddField("min_unit", 'I', min_unit);
            packer.AddField("max_qty", 'D', max_qty);
            packer.AddField("min_qty", 'D', min_qty);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT,order_dir);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CASH_FROZEN_TYPE_INT,cash_frozen_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_SPLIT_FLAG_INT,order_split_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MIN_UNIT_INT,min_unit);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_QTY_FLOAT,max_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_QTY_FLOAT,min_qty);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_1_52_Request : BaseRequest, IRequest<pubL_1_52_Response>
    {
        public pubL_1_52_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.52";
            }
        }

        public int stock_code_no { get; set; }
        public int exch_no { get; set; }
        public int order_dir { get; set; }
        public int cash_frozen_type { get; set; }
        public int order_split_flag { get; set; }
        public int min_unit { get; set; }
        public double max_qty { get; set; }
        public double min_qty { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("order_dir", 'I', order_dir);
            packer.AddField("cash_frozen_type", 'I', cash_frozen_type);
            packer.AddField("order_split_flag", 'I', order_split_flag);
            packer.AddField("min_unit", 'I', min_unit);
            packer.AddField("max_qty", 'D', max_qty);
            packer.AddField("min_qty", 'D', min_qty);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT,order_dir);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CASH_FROZEN_TYPE_INT,cash_frozen_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_SPLIT_FLAG_INT,order_split_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MIN_UNIT_INT,min_unit);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_QTY_FLOAT,max_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_QTY_FLOAT,min_qty);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_1_53_Request : BaseRequest, IRequest<pubL_1_53_Response>
    {
        public pubL_1_53_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.53";
            }
        }

        public int stock_code_no { get; set; }
        public int exch_no { get; set; }
        public int order_dir { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("order_dir", 'I', order_dir);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT,order_dir);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_1_54_Request : BaseRequest, IRequest<pubL_1_54_Response>
    {
        public pubL_1_54_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.54";
            }
        }

        public int stock_code_no { get; set; }
        public String exch_no_str { get; set; }
        public String order_dir_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public int time_stamp { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("order_dir_str", 'S', order_dir_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
            packer.AddField("time_stamp", 'I', time_stamp);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR,order_dir_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT,time_stamp);
            return fastMsg;
        }
   }

    public class pubL_1_55_Request : BaseRequest, IRequest<pubL_1_55_Response>
    {
        public pubL_1_55_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.55";
            }
        }

        public int stock_code_no { get; set; }
        public String exch_no_str { get; set; }
        public String order_dir_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("order_dir_str", 'S', order_dir_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR,order_dir_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_1_56_Request : BaseRequest, IRequest<pubL_1_56_Response>
    {
        public pubL_1_56_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.56";
            }
        }

        public int begin_date { get; set; }
        public int end_date { get; set; }
        public int stock_code_no { get; set; }
        public String exch_no_str { get; set; }
        public String order_dir_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("order_dir_str", 'S', order_dir_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT,end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR,order_dir_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_1_61_Request : BaseRequest, IRequest<pubL_1_61_Response>
    {
        public pubL_1_61_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.61";
            }
        }

        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public String trade_code { get; set; }
        public String target_code { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("trade_code", 'S', trade_code);
            packer.AddField("target_code", 'S', target_code);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_STR,trade_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_STR,target_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_1_62_Request : BaseRequest, IRequest<pubL_1_62_Response>
    {
        public pubL_1_62_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.62";
            }
        }

        public int stock_code_no { get; set; }
        public int exch_no { get; set; }
        public String trade_code { get; set; }
        public String target_code { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("trade_code", 'S', trade_code);
            packer.AddField("target_code", 'S', target_code);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_STR,trade_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_STR,target_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_1_63_Request : BaseRequest, IRequest<pubL_1_63_Response>
    {
        public pubL_1_63_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.63";
            }
        }

        public int stock_code_no { get; set; }
        public int exch_no { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_1_64_Request : BaseRequest, IRequest<pubL_1_64_Response>
    {
        public pubL_1_64_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.64";
            }
        }

        public int stock_code_no { get; set; }
        public String exch_no_str { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            return fastMsg;
        }
   }

    public class pubL_1_65_Request : BaseRequest, IRequest<pubL_1_65_Response>
    {
        public pubL_1_65_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.65";
            }
        }

        public int stock_code_no { get; set; }
        public String exch_no_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_1_66_Request : BaseRequest, IRequest<pubL_1_66_Response>
    {
        public pubL_1_66_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.66";
            }
        }

        public int begin_date { get; set; }
        public int end_date { get; set; }
        public int stock_code_no { get; set; }
        public String exch_no_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT,end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_1_34_Request : BaseRequest, IRequest<pubL_1_34_Response>
    {
        public pubL_1_34_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.34";
            }
        }

        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_1_35_Request : BaseRequest, IRequest<pubL_1_35_Response>
    {
        public pubL_1_35_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.35";
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

    public class pubL_1_36_Request : BaseRequest, IRequest<pubL_1_36_Response>
    {
        public pubL_1_36_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.36";
            }
        }

        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_1_37_Request : BaseRequest, IRequest<pubL_1_37_Response>
    {
        public pubL_1_37_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.37";
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

    public class pubL_1_71_Request : BaseRequest, IRequest<pubL_1_71_Response>
    {
        public pubL_1_71_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.71";
            }
        }

        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public double up_limit_price { get; set; }
        public double down_limit_price { get; set; }
        public double last_price { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("up_limit_price", 'D', up_limit_price);
            packer.AddField("down_limit_price", 'D', down_limit_price);
            packer.AddField("last_price", 'D', last_price);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UP_LIMIT_PRICE_FLOAT,up_limit_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DOWN_LIMIT_PRICE_FLOAT,down_limit_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT,last_price);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_1_72_Request : BaseRequest, IRequest<pubL_1_72_Response>
    {
        public pubL_1_72_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.72";
            }
        }

        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public double up_limit_price { get; set; }
        public double down_limit_price { get; set; }
        public double last_price { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("up_limit_price", 'D', up_limit_price);
            packer.AddField("down_limit_price", 'D', down_limit_price);
            packer.AddField("last_price", 'D', last_price);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UP_LIMIT_PRICE_FLOAT,up_limit_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DOWN_LIMIT_PRICE_FLOAT,down_limit_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT,last_price);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_1_73_Request : BaseRequest, IRequest<pubL_1_73_Response>
    {
        public pubL_1_73_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.73";
            }
        }

        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_1_74_Request : BaseRequest, IRequest<pubL_1_74_Response>
    {
        public pubL_1_74_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.74";
            }
        }

        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_1_77_Request : BaseRequest, IRequest<pubL_1_77_Response>
    {
        public pubL_1_77_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.77";
            }
        }

        public String stock_code_no_str { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("stock_code_no_str", 'S', stock_code_no_str);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_STR_STR,stock_code_no_str);
            return fastMsg;
        }
   }

    public class pubL_1_78_Request : BaseRequest, IRequest<pubL_1_78_Response>
    {
        public pubL_1_78_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.78";
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

    public class pubL_1_75_Request : BaseRequest, IRequest<pubL_1_75_Response>
    {
        public pubL_1_75_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.75";
            }
        }

        public int stock_code_no { get; set; }
        public String exch_no_str { get; set; }
        public String stock_code { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_1_76_Request : BaseRequest, IRequest<pubL_1_76_Response>
    {
        public pubL_1_76_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.76";
            }
        }

        public int begin_date { get; set; }
        public int end_date { get; set; }
        public int stock_code_no { get; set; }
        public String exch_no_str { get; set; }
        public String stock_code { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT,end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_1_79_Request : BaseRequest, IRequest<pubL_1_79_Response>
    {
        public pubL_1_79_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.79";
            }
        }

        public int task_no { get; set; }
        public int exec_count { get; set; }
        public int exec_date { get; set; }
        public int exec_time { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("task_no", 'I', task_no);
            packer.AddField("exec_count", 'I', exec_count);
            packer.AddField("exec_date", 'I', exec_date);
            packer.AddField("exec_time", 'I', exec_time);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TASK_NO_INT,task_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_COUNT_INT,exec_count);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_DATE_INT,exec_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_TIME_INT,exec_time);
            return fastMsg;
        }
   }

    public class pubL_1_81_Request : BaseRequest, IRequest<pubL_1_81_Response>
    {
        public pubL_1_81_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.81";
            }
        }

        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public String stock_name { get; set; }
        public int issue_date { get; set; }
        public int end_date { get; set; }
        public int value_date { get; set; }
        public int next_value_date { get; set; }
        public int begin_trade_date { get; set; }
        public double bond_limit { get; set; }
        public double issue_price { get; set; }
        public double par_value { get; set; }
        public double intrst_ratio { get; set; }
        public int intrst_days { get; set; }
        public int pay_inteval { get; set; }
        public double bond_accr_intrst { get; set; }
        public int bond_rate_type { get; set; }
        public int inteval_days { get; set; }
        public int net_price_flag { get; set; }
        public int last_trade_date { get; set; }
        public int rights_type { get; set; }
        public int trans_begin_date { get; set; }
        public int trans_end_date { get; set; }
        public int exec_begin_date { get; set; }
        public int exec_end_date { get; set; }
        public double impawn_ratio { get; set; }
        public String trade_code { get; set; }
        public String target_code { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("stock_name", 'S', stock_name);
            packer.AddField("issue_date", 'I', issue_date);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("value_date", 'I', value_date);
            packer.AddField("next_value_date", 'I', next_value_date);
            packer.AddField("begin_trade_date", 'I', begin_trade_date);
            packer.AddField("bond_limit", 'D', bond_limit);
            packer.AddField("issue_price", 'D', issue_price);
            packer.AddField("par_value", 'D', par_value);
            packer.AddField("intrst_ratio", 'D', intrst_ratio);
            packer.AddField("intrst_days", 'I', intrst_days);
            packer.AddField("pay_inteval", 'I', pay_inteval);
            packer.AddField("bond_accr_intrst", 'D', bond_accr_intrst);
            packer.AddField("bond_rate_type", 'I', bond_rate_type);
            packer.AddField("inteval_days", 'I', inteval_days);
            packer.AddField("net_price_flag", 'I', net_price_flag);
            packer.AddField("last_trade_date", 'I', last_trade_date);
            packer.AddField("rights_type", 'I', rights_type);
            packer.AddField("trans_begin_date", 'I', trans_begin_date);
            packer.AddField("trans_end_date", 'I', trans_end_date);
            packer.AddField("exec_begin_date", 'I', exec_begin_date);
            packer.AddField("exec_end_date", 'I', exec_end_date);
            packer.AddField("impawn_ratio", 'D', impawn_ratio);
            packer.AddField("trade_code", 'S', trade_code);
            packer.AddField("target_code", 'S', target_code);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR,stock_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ISSUE_DATE_INT,issue_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT,end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_VALUE_DATE_INT,value_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NEXT_VALUE_DATE_INT,next_value_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TRADE_DATE_INT,begin_trade_date);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_LIMIT_FLOAT,bond_limit);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ISSUE_PRICE_FLOAT,issue_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_FLOAT,par_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_RATIO_FLOAT,intrst_ratio);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_DAYS_INT,intrst_days);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PAY_INTEVAL_INT,pay_inteval);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT,bond_accr_intrst);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BOND_RATE_TYPE_INT,bond_rate_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INTEVAL_DAYS_INT,inteval_days);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLAG_INT,net_price_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LAST_TRADE_DATE_INT,last_trade_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RIGHTS_TYPE_INT,rights_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_BEGIN_DATE_INT,trans_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_END_DATE_INT,trans_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_BEGIN_DATE_INT,exec_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_END_DATE_INT,exec_end_date);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_IMPAWN_RATIO_FLOAT,impawn_ratio);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_STR,trade_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_STR,target_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_1_82_Request : BaseRequest, IRequest<pubL_1_82_Response>
    {
        public pubL_1_82_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.82";
            }
        }

        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public String stock_name { get; set; }
        public int issue_date { get; set; }
        public int end_date { get; set; }
        public int value_date { get; set; }
        public int next_value_date { get; set; }
        public int begin_trade_date { get; set; }
        public double bond_limit { get; set; }
        public double issue_price { get; set; }
        public double par_value { get; set; }
        public double intrst_ratio { get; set; }
        public int intrst_days { get; set; }
        public int pay_inteval { get; set; }
        public double bond_accr_intrst { get; set; }
        public int bond_rate_type { get; set; }
        public int inteval_days { get; set; }
        public int net_price_flag { get; set; }
        public int last_trade_date { get; set; }
        public int rights_type { get; set; }
        public int trans_begin_date { get; set; }
        public int trans_end_date { get; set; }
        public int exec_begin_date { get; set; }
        public int exec_end_date { get; set; }
        public double impawn_ratio { get; set; }
        public String trade_code { get; set; }
        public String target_code { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("stock_name", 'S', stock_name);
            packer.AddField("issue_date", 'I', issue_date);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("value_date", 'I', value_date);
            packer.AddField("next_value_date", 'I', next_value_date);
            packer.AddField("begin_trade_date", 'I', begin_trade_date);
            packer.AddField("bond_limit", 'D', bond_limit);
            packer.AddField("issue_price", 'D', issue_price);
            packer.AddField("par_value", 'D', par_value);
            packer.AddField("intrst_ratio", 'D', intrst_ratio);
            packer.AddField("intrst_days", 'I', intrst_days);
            packer.AddField("pay_inteval", 'I', pay_inteval);
            packer.AddField("bond_accr_intrst", 'D', bond_accr_intrst);
            packer.AddField("bond_rate_type", 'I', bond_rate_type);
            packer.AddField("inteval_days", 'I', inteval_days);
            packer.AddField("net_price_flag", 'I', net_price_flag);
            packer.AddField("last_trade_date", 'I', last_trade_date);
            packer.AddField("rights_type", 'I', rights_type);
            packer.AddField("trans_begin_date", 'I', trans_begin_date);
            packer.AddField("trans_end_date", 'I', trans_end_date);
            packer.AddField("exec_begin_date", 'I', exec_begin_date);
            packer.AddField("exec_end_date", 'I', exec_end_date);
            packer.AddField("impawn_ratio", 'D', impawn_ratio);
            packer.AddField("trade_code", 'S', trade_code);
            packer.AddField("target_code", 'S', target_code);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR,stock_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ISSUE_DATE_INT,issue_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT,end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_VALUE_DATE_INT,value_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NEXT_VALUE_DATE_INT,next_value_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TRADE_DATE_INT,begin_trade_date);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_LIMIT_FLOAT,bond_limit);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ISSUE_PRICE_FLOAT,issue_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_FLOAT,par_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_RATIO_FLOAT,intrst_ratio);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_DAYS_INT,intrst_days);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PAY_INTEVAL_INT,pay_inteval);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT,bond_accr_intrst);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BOND_RATE_TYPE_INT,bond_rate_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INTEVAL_DAYS_INT,inteval_days);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLAG_INT,net_price_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LAST_TRADE_DATE_INT,last_trade_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RIGHTS_TYPE_INT,rights_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_BEGIN_DATE_INT,trans_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_END_DATE_INT,trans_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_BEGIN_DATE_INT,exec_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_END_DATE_INT,exec_end_date);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_IMPAWN_RATIO_FLOAT,impawn_ratio);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_STR,trade_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_STR,target_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_1_83_Request : BaseRequest, IRequest<pubL_1_83_Response>
    {
        public pubL_1_83_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.83";
            }
        }

        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_1_84_Request : BaseRequest, IRequest<pubL_1_84_Response>
    {
        public pubL_1_84_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.84";
            }
        }

        public String exch_no_str { get; set; }
        public String stock_code { get; set; }
        public int time_stamp { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("time_stamp", 'I', time_stamp);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT,time_stamp);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_1_88_Request : BaseRequest, IRequest<pubL_1_88_Response>
    {
        public pubL_1_88_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.88";
            }
        }

        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            return fastMsg;
        }
   }

    public class pubL_1_85_Request : BaseRequest, IRequest<pubL_1_85_Response>
    {
        public pubL_1_85_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.85";
            }
        }

        public String exch_no_str { get; set; }
        public String stock_code { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_1_86_Request : BaseRequest, IRequest<pubL_1_86_Response>
    {
        public pubL_1_86_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.86";
            }
        }

        public int begin_date { get; set; }
        public int end_date { get; set; }
        public String exch_no_str { get; set; }
        public String stock_code { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT,end_date);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_1_87_Request : BaseRequest, IRequest<pubL_1_87_Response>
    {
        public pubL_1_87_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.87";
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

    public class pubL_1_91_Request : BaseRequest, IRequest<pubL_1_91_Response>
    {
        public pubL_1_91_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.91";
            }
        }

        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public int intrst_begin_date { get; set; }
        public double intrst_ratio { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("intrst_begin_date", 'I', intrst_begin_date);
            packer.AddField("intrst_ratio", 'D', intrst_ratio);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_BEGIN_DATE_INT,intrst_begin_date);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_RATIO_FLOAT,intrst_ratio);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_1_92_Request : BaseRequest, IRequest<pubL_1_92_Response>
    {
        public pubL_1_92_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.92";
            }
        }

        public int stock_code_no { get; set; }
        public int exch_no { get; set; }
        public int intrst_begin_date { get; set; }
        public double intrst_ratio { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("intrst_begin_date", 'I', intrst_begin_date);
            packer.AddField("intrst_ratio", 'D', intrst_ratio);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_BEGIN_DATE_INT,intrst_begin_date);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_RATIO_FLOAT,intrst_ratio);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_1_93_Request : BaseRequest, IRequest<pubL_1_93_Response>
    {
        public pubL_1_93_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.93";
            }
        }

        public int stock_code_no { get; set; }
        public int exch_no { get; set; }
        public int intrst_begin_date { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("intrst_begin_date", 'I', intrst_begin_date);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_BEGIN_DATE_INT,intrst_begin_date);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_1_94_Request : BaseRequest, IRequest<pubL_1_94_Response>
    {
        public pubL_1_94_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.94";
            }
        }

        public int stock_code_no { get; set; }
        public String exch_no_str { get; set; }
        public int time_stamp { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("time_stamp", 'I', time_stamp);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT,time_stamp);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_1_95_Request : BaseRequest, IRequest<pubL_1_95_Response>
    {
        public pubL_1_95_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.95";
            }
        }

        public int stock_code_no { get; set; }
        public String exch_no_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_1_96_Request : BaseRequest, IRequest<pubL_1_96_Response>
    {
        public pubL_1_96_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.96";
            }
        }

        public int begin_date { get; set; }
        public int end_date { get; set; }
        public int stock_code_no { get; set; }
        public String exch_no_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT,end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_1_101_Request : BaseRequest, IRequest<pubL_1_101_Response>
    {
        public pubL_1_101_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.101";
            }
        }

        public String stock_code { get; set; }
        public int exch_no { get; set; }
        public String rating_agency { get; set; }
        public int co_no { get; set; }
        public int bond_level { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("rating_agency", 'S', rating_agency);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("bond_level", 'I', bond_level);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RATING_AGENCY_STR,rating_agency);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BOND_LEVEL_INT,bond_level);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_1_102_Request : BaseRequest, IRequest<pubL_1_102_Response>
    {
        public pubL_1_102_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.102";
            }
        }

        public int stock_code_no { get; set; }
        public int exch_no { get; set; }
        public String rating_agency { get; set; }
        public int co_no { get; set; }
        public int bond_level { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("rating_agency", 'S', rating_agency);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("bond_level", 'I', bond_level);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RATING_AGENCY_STR,rating_agency);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BOND_LEVEL_INT,bond_level);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_1_103_Request : BaseRequest, IRequest<pubL_1_103_Response>
    {
        public pubL_1_103_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.103";
            }
        }

        public int stock_code_no { get; set; }
        public String rating_agency { get; set; }
        public int co_no { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("rating_agency", 'S', rating_agency);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RATING_AGENCY_STR,rating_agency);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_1_104_Request : BaseRequest, IRequest<pubL_1_104_Response>
    {
        public pubL_1_104_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.104";
            }
        }

        public int stock_code_no { get; set; }
        public String exch_no_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_1_105_Request : BaseRequest, IRequest<pubL_1_105_Response>
    {
        public pubL_1_105_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.105";
            }
        }

        public int stock_code_no { get; set; }
        public String exch_no_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_1_106_Request : BaseRequest, IRequest<pubL_1_106_Response>
    {
        public pubL_1_106_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.106";
            }
        }

        public int begin_date { get; set; }
        public int end_date { get; set; }
        public int stock_code_no { get; set; }
        public String exch_no_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT,end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_1_130_Request : BaseRequest, IRequest<pubL_1_130_Response>
    {
        public pubL_1_130_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.130";
            }
        }

        public int stock_code_no { get; set; }
        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            return fastMsg;
        }
   }

    public class pubL_1_131_Request : BaseRequest, IRequest<pubL_1_131_Response>
    {
        public pubL_1_131_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.131";
            }
        }

        public String stock_code_no_str { get; set; }
        public String exch_no_str { get; set; }
        public String stock_code_str { get; set; }
        public String asset_acco_no_str { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("stock_code_no_str", 'S', stock_code_no_str);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_code_str", 'S', stock_code_str);
            packer.AddField("asset_acco_no_str", 'S', asset_acco_no_str);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_STR_STR,stock_code_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR_STR,stock_code_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_STR_STR,asset_acco_no_str);
            return fastMsg;
        }
   }

    public class pubL_1_140_Request : BaseRequest, IRequest<pubL_1_140_Response>
    {
        public pubL_1_140_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.140";
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

    public class pubL_1_141_Request : BaseRequest, IRequest<pubL_1_141_Response>
    {
        public pubL_1_141_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.141";
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

    public class pubL_1_142_Request : BaseRequest, IRequest<pubL_1_142_Response>
    {
        public pubL_1_142_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.142";
            }
        }

        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public String stock_name { get; set; }
        public int fund_kind { get; set; }
        public String fund_manager { get; set; }
        public String fund_trustee { get; set; }
        public double distribution_scale { get; set; }
        public int charging_method { get; set; }
        public int default_divide_type { get; set; }
        public int fund_found_date { get; set; }
        public int fund_expire_date { get; set; }
        public int subscription_trade_mark { get; set; }
        public int purchase_trade_mark { get; set; }
        public int rede_trade_mark { get; set; }
        public double first_minimum_amt { get; set; }
        public double minimum_subscription_amt { get; set; }
        public double minimum_purchase_amt { get; set; }
        public double minimum_rede_share { get; set; }
        public double minimum_holding_share { get; set; }
        public double minimum_turning_out_share { get; set; }
        public int rede_money_to_account_days { get; set; }
        public String registration_agency { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("stock_name", 'S', stock_name);
            packer.AddField("fund_kind", 'I', fund_kind);
            packer.AddField("fund_manager", 'S', fund_manager);
            packer.AddField("fund_trustee", 'S', fund_trustee);
            packer.AddField("distribution_scale", 'D', distribution_scale);
            packer.AddField("charging_method", 'I', charging_method);
            packer.AddField("default_divide_type", 'I', default_divide_type);
            packer.AddField("fund_found_date", 'I', fund_found_date);
            packer.AddField("fund_expire_date", 'I', fund_expire_date);
            packer.AddField("subscription_trade_mark", 'I', subscription_trade_mark);
            packer.AddField("purchase_trade_mark", 'I', purchase_trade_mark);
            packer.AddField("rede_trade_mark", 'I', rede_trade_mark);
            packer.AddField("first_minimum_amt", 'D', first_minimum_amt);
            packer.AddField("minimum_subscription_amt", 'D', minimum_subscription_amt);
            packer.AddField("minimum_purchase_amt", 'D', minimum_purchase_amt);
            packer.AddField("minimum_rede_share", 'D', minimum_rede_share);
            packer.AddField("minimum_holding_share", 'D', minimum_holding_share);
            packer.AddField("minimum_turning_out_share", 'D', minimum_turning_out_share);
            packer.AddField("rede_money_to_account_days", 'I', rede_money_to_account_days);
            packer.AddField("registration_agency", 'S', registration_agency);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR,stock_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUND_KIND_INT,fund_kind);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_STR,fund_manager);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUND_TRUSTEE_STR,fund_trustee);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DISTRIBUTION_SCALE_FLOAT,distribution_scale);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CHARGING_METHOD_INT,charging_method);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEFAULT_DIVIDE_TYPE_INT,default_divide_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUND_FOUND_DATE_INT,fund_found_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUND_EXPIRE_DATE_INT,fund_expire_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SUBSCRIPTION_TRADE_MARK_INT,subscription_trade_mark);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PURCHASE_TRADE_MARK_INT,purchase_trade_mark);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REDE_TRADE_MARK_INT,rede_trade_mark);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FIRST_MINIMUM_AMT_FLOAT,first_minimum_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MINIMUM_SUBSCRIPTION_AMT_FLOAT,minimum_subscription_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MINIMUM_PURCHASE_AMT_FLOAT,minimum_purchase_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MINIMUM_REDE_SHARE_FLOAT,minimum_rede_share);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MINIMUM_HOLDING_SHARE_FLOAT,minimum_holding_share);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MINIMUM_TURNING_OUT_SHARE_FLOAT,minimum_turning_out_share);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REDE_MONEY_TO_ACCOUNT_DAYS_INT,rede_money_to_account_days);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REGISTRATION_AGENCY_STR,registration_agency);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_1_143_Request : BaseRequest, IRequest<pubL_1_143_Response>
    {
        public pubL_1_143_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.143";
            }
        }

        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public String stock_name { get; set; }
        public int fund_kind { get; set; }
        public String fund_manager { get; set; }
        public String fund_trustee { get; set; }
        public double distribution_scale { get; set; }
        public int charging_method { get; set; }
        public int default_divide_type { get; set; }
        public int fund_found_date { get; set; }
        public int fund_expire_date { get; set; }
        public int subscription_trade_mark { get; set; }
        public int purchase_trade_mark { get; set; }
        public int rede_trade_mark { get; set; }
        public double first_minimum_amt { get; set; }
        public double minimum_subscription_amt { get; set; }
        public double minimum_purchase_amt { get; set; }
        public double minimum_rede_share { get; set; }
        public double minimum_holding_share { get; set; }
        public double minimum_turning_out_share { get; set; }
        public int rede_money_to_account_days { get; set; }
        public String registration_agency { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("stock_name", 'S', stock_name);
            packer.AddField("fund_kind", 'I', fund_kind);
            packer.AddField("fund_manager", 'S', fund_manager);
            packer.AddField("fund_trustee", 'S', fund_trustee);
            packer.AddField("distribution_scale", 'D', distribution_scale);
            packer.AddField("charging_method", 'I', charging_method);
            packer.AddField("default_divide_type", 'I', default_divide_type);
            packer.AddField("fund_found_date", 'I', fund_found_date);
            packer.AddField("fund_expire_date", 'I', fund_expire_date);
            packer.AddField("subscription_trade_mark", 'I', subscription_trade_mark);
            packer.AddField("purchase_trade_mark", 'I', purchase_trade_mark);
            packer.AddField("rede_trade_mark", 'I', rede_trade_mark);
            packer.AddField("first_minimum_amt", 'D', first_minimum_amt);
            packer.AddField("minimum_subscription_amt", 'D', minimum_subscription_amt);
            packer.AddField("minimum_purchase_amt", 'D', minimum_purchase_amt);
            packer.AddField("minimum_rede_share", 'D', minimum_rede_share);
            packer.AddField("minimum_holding_share", 'D', minimum_holding_share);
            packer.AddField("minimum_turning_out_share", 'D', minimum_turning_out_share);
            packer.AddField("rede_money_to_account_days", 'I', rede_money_to_account_days);
            packer.AddField("registration_agency", 'S', registration_agency);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR,stock_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUND_KIND_INT,fund_kind);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_STR,fund_manager);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUND_TRUSTEE_STR,fund_trustee);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DISTRIBUTION_SCALE_FLOAT,distribution_scale);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CHARGING_METHOD_INT,charging_method);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEFAULT_DIVIDE_TYPE_INT,default_divide_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUND_FOUND_DATE_INT,fund_found_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUND_EXPIRE_DATE_INT,fund_expire_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SUBSCRIPTION_TRADE_MARK_INT,subscription_trade_mark);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PURCHASE_TRADE_MARK_INT,purchase_trade_mark);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REDE_TRADE_MARK_INT,rede_trade_mark);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FIRST_MINIMUM_AMT_FLOAT,first_minimum_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MINIMUM_SUBSCRIPTION_AMT_FLOAT,minimum_subscription_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MINIMUM_PURCHASE_AMT_FLOAT,minimum_purchase_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MINIMUM_REDE_SHARE_FLOAT,minimum_rede_share);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MINIMUM_HOLDING_SHARE_FLOAT,minimum_holding_share);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MINIMUM_TURNING_OUT_SHARE_FLOAT,minimum_turning_out_share);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REDE_MONEY_TO_ACCOUNT_DAYS_INT,rede_money_to_account_days);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REGISTRATION_AGENCY_STR,registration_agency);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_1_144_Request : BaseRequest, IRequest<pubL_1_144_Response>
    {
        public pubL_1_144_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.144";
            }
        }

        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_1_145_Request : BaseRequest, IRequest<pubL_1_145_Response>
    {
        public pubL_1_145_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.145";
            }
        }

        public String exch_no_str { get; set; }
        public String stock_code { get; set; }
        public int time_stamp { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("time_stamp", 'I', time_stamp);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT,time_stamp);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_1_146_Request : BaseRequest, IRequest<pubL_1_146_Response>
    {
        public pubL_1_146_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.146";
            }
        }

        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            return fastMsg;
        }
   }

    public class pubL_1_147_Request : BaseRequest, IRequest<pubL_1_147_Response>
    {
        public pubL_1_147_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.147";
            }
        }

        public String exch_no_str { get; set; }
        public String stock_code { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_1_148_Request : BaseRequest, IRequest<pubL_1_148_Response>
    {
        public pubL_1_148_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.148";
            }
        }

        public int begin_date { get; set; }
        public int end_date { get; set; }
        public String exch_no_str { get; set; }
        public String stock_code { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT,end_date);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_1_151_Request : BaseRequest, IRequest<pubL_1_151_Response>
    {
        public pubL_1_151_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.151";
            }
        }

        public int co_no { get; set; }
        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_1_152_Request : BaseRequest, IRequest<pubL_1_152_Response>
    {
        public pubL_1_152_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.152";
            }
        }

        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public double warn_trade_amount { get; set; }
        public double warn_buy_amount { get; set; }
        public int warn_auto_sell { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("warn_trade_amount", 'D', warn_trade_amount);
            packer.AddField("warn_buy_amount", 'D', warn_buy_amount);
            packer.AddField("warn_auto_sell", 'I', warn_auto_sell);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WARN_TRADE_AMOUNT_FLOAT,warn_trade_amount);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WARN_BUY_AMOUNT_FLOAT,warn_buy_amount);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WARN_AUTO_SELL_INT,warn_auto_sell);
            return fastMsg;
        }
   }

    public class pubL_1_153_Request : BaseRequest, IRequest<pubL_1_153_Response>
    {
        public pubL_1_153_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.153";
            }
        }

        public ulong row_id { get; set; }
        public double warn_trade_amount { get; set; }
        public double warn_buy_amount { get; set; }
        public int warn_auto_sell { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("warn_trade_amount", 'D', warn_trade_amount);
            packer.AddField("warn_buy_amount", 'D', warn_buy_amount);
            packer.AddField("warn_auto_sell", 'I', warn_auto_sell);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WARN_TRADE_AMOUNT_FLOAT,warn_trade_amount);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WARN_BUY_AMOUNT_FLOAT,warn_buy_amount);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WARN_AUTO_SELL_INT,warn_auto_sell);
            return fastMsg;
        }
   }

    public class pubL_1_154_Request : BaseRequest, IRequest<pubL_1_154_Response>
    {
        public pubL_1_154_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.154";
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

    public class pubL_1_155_Request : BaseRequest, IRequest<pubL_1_155_Response>
    {
        public pubL_1_155_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.155";
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

    public class pubL_1_156_Request : BaseRequest, IRequest<pubL_1_156_Response>
    {
        public pubL_1_156_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.156";
            }
        }

        public ulong row_id { get; set; }
        public double strike_qty { get; set; }
        public double buy_qty_1 { get; set; }
        public double up_limit_price { get; set; }
        public double last_price { get; set; }
        public int is_warn { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("strike_qty", 'D', strike_qty);
            packer.AddField("buy_qty_1", 'D', buy_qty_1);
            packer.AddField("up_limit_price", 'D', up_limit_price);
            packer.AddField("last_price", 'D', last_price);
            packer.AddField("is_warn", 'I', is_warn);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT,strike_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_QTY_1_FLOAT,buy_qty_1);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UP_LIMIT_PRICE_FLOAT,up_limit_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT,last_price);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_WARN_INT,is_warn);
            return fastMsg;
        }
   }

    public class pubL_1_157_Request : BaseRequest, IRequest<pubL_1_157_Response>
    {
        public pubL_1_157_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.157";
            }
        }

        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_1_158_Request : BaseRequest, IRequest<pubL_1_158_Response>
    {
        public pubL_1_158_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.158";
            }
        }

        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public String stock_name { get; set; }
        public int pd_no { get; set; }
        public int co_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("stock_name", 'S', stock_name);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("co_no", 'I', co_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR,stock_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            return fastMsg;
        }
   }

    public class pubL_1_159_Request : BaseRequest, IRequest<pubL_1_159_Response>
    {
        public pubL_1_159_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.159";
            }
        }

        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public String stock_name { get; set; }
        public int pd_no { get; set; }
        public int co_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("stock_name", 'S', stock_name);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("co_no", 'I', co_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR,stock_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            return fastMsg;
        }
   }

    public class pubL_1_160_Request : BaseRequest, IRequest<pubL_1_160_Response>
    {
        public pubL_1_160_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.160";
            }
        }

        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_1_161_Request : BaseRequest, IRequest<pubL_1_161_Response>
    {
        public pubL_1_161_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.161";
            }
        }

        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public double last_price { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("last_price", 'D', last_price);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT,last_price);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_1_162_Request : BaseRequest, IRequest<pubL_1_162_Response>
    {
        public pubL_1_162_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.162";
            }
        }

        public ulong row_id { get; set; }
        public int pd_no { get; set; }
        public int co_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("co_no", 'I', co_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            return fastMsg;
        }
   }

    public class pubL_1_163_Request : BaseRequest, IRequest<pubL_1_163_Response>
    {
        public pubL_1_163_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.163";
            }
        }

        public int exch_no { get; set; }
        public int fund_kind { get; set; }
        public double first_minimum_amt { get; set; }
        public double minimum_subscription_amt { get; set; }
        public double minimum_purchase_amt { get; set; }
        public double minimum_rede_share { get; set; }
        public double minimum_holding_share { get; set; }
        public double minimum_turning_out_share { get; set; }
        public int rede_money_to_account_days { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("fund_kind", 'I', fund_kind);
            packer.AddField("first_minimum_amt", 'D', first_minimum_amt);
            packer.AddField("minimum_subscription_amt", 'D', minimum_subscription_amt);
            packer.AddField("minimum_purchase_amt", 'D', minimum_purchase_amt);
            packer.AddField("minimum_rede_share", 'D', minimum_rede_share);
            packer.AddField("minimum_holding_share", 'D', minimum_holding_share);
            packer.AddField("minimum_turning_out_share", 'D', minimum_turning_out_share);
            packer.AddField("rede_money_to_account_days", 'I', rede_money_to_account_days);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUND_KIND_INT,fund_kind);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FIRST_MINIMUM_AMT_FLOAT,first_minimum_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MINIMUM_SUBSCRIPTION_AMT_FLOAT,minimum_subscription_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MINIMUM_PURCHASE_AMT_FLOAT,minimum_purchase_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MINIMUM_REDE_SHARE_FLOAT,minimum_rede_share);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MINIMUM_HOLDING_SHARE_FLOAT,minimum_holding_share);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MINIMUM_TURNING_OUT_SHARE_FLOAT,minimum_turning_out_share);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REDE_MONEY_TO_ACCOUNT_DAYS_INT,rede_money_to_account_days);
            return fastMsg;
        }
   }

    public class pubL_1_164_Request : BaseRequest, IRequest<pubL_1_164_Response>
    {
        public pubL_1_164_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.164";
            }
        }

        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public int stock_code_no { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_1_165_Request : BaseRequest, IRequest<pubL_1_165_Response>
    {
        public pubL_1_165_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.165";
            }
        }

        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public double quot_calc_unit { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("quot_calc_unit", 'D', quot_calc_unit);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_QUOT_CALC_UNIT_FLOAT,quot_calc_unit);
            return fastMsg;
        }
   }

    public class pubL_1_166_Request : BaseRequest, IRequest<pubL_1_166_Response>
    {
        public pubL_1_166_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.166";
            }
        }

        public ulong row_id { get; set; }
        public int stock_code_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("stock_code_no", 'I', stock_code_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            return fastMsg;
        }
   }

    public class pubL_1_177_Request : BaseRequest, IRequest<pubL_1_177_Response>
    {
        public pubL_1_177_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.1.177";
            }
        }

        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public String stock_type_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("stock_type_str", 'S', stock_type_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_STR_STR,stock_type_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

}
