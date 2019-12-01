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
    public class pubL_13_112_Request : BaseRequest, IRequest<pubL_13_112_Response>
    {
        public pubL_13_112_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.13.112";
            }
        }

        public int exch_no { get; set; }
        public int contrc_type { get; set; }
        public String contrc_type_name { get; set; }
        public int asset_type { get; set; }
        public double par_value { get; set; }
        public int contrc_unit { get; set; }
        public int report_unit { get; set; }
        public int min_unit { get; set; }
        public double max_qty { get; set; }
        public double min_qty { get; set; }
        public int type_unit { get; set; }
        public String crncy_type { get; set; }
        public String exch_crncy_type { get; set; }
        public int capit_reback_days { get; set; }
        public int posi_reback_days { get; set; }
        public int is_order_dir_flag { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("contrc_type", 'I', contrc_type);
            packer.AddField("contrc_type_name", 'S', contrc_type_name);
            packer.AddField("asset_type", 'I', asset_type);
            packer.AddField("par_value", 'D', par_value);
            packer.AddField("contrc_unit", 'I', contrc_unit);
            packer.AddField("report_unit", 'I', report_unit);
            packer.AddField("min_unit", 'I', min_unit);
            packer.AddField("max_qty", 'D', max_qty);
            packer.AddField("min_qty", 'D', min_qty);
            packer.AddField("type_unit", 'I', type_unit);
            packer.AddField("crncy_type", 'S', crncy_type);
            packer.AddField("exch_crncy_type", 'S', exch_crncy_type);
            packer.AddField("capit_reback_days", 'I', capit_reback_days);
            packer.AddField("posi_reback_days", 'I', posi_reback_days);
            packer.AddField("is_order_dir_flag", 'I', is_order_dir_flag);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT,contrc_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_NAME_STR,contrc_type_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT,asset_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_FLOAT,par_value);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_UNIT_INT,contrc_unit);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_UNIT_INT,report_unit);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MIN_UNIT_INT,min_unit);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_QTY_FLOAT,max_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_QTY_FLOAT,min_qty);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TYPE_UNIT_INT,type_unit);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR,exch_crncy_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CAPIT_REBACK_DAYS_INT,capit_reback_days);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_POSI_REBACK_DAYS_INT,posi_reback_days);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_ORDER_DIR_FLAG_INT,is_order_dir_flag);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_13_114_Request : BaseRequest, IRequest<pubL_13_114_Response>
    {
        public pubL_13_114_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.13.114";
            }
        }

        public String exch_no_str { get; set; }
        public String contrc_type_str { get; set; }
        public String asset_type_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public int time_stamp { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("contrc_type_str", 'S', contrc_type_str);
            packer.AddField("asset_type_str", 'S', asset_type_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
            packer.AddField("time_stamp", 'I', time_stamp);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_STR_STR,contrc_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_STR_STR,asset_type_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT,time_stamp);
            return fastMsg;
        }
   }

    public class pubL_13_115_Request : BaseRequest, IRequest<pubL_13_115_Response>
    {
        public pubL_13_115_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.13.115";
            }
        }

        public String exch_no_str { get; set; }
        public String contrc_type_str { get; set; }
        public String asset_type_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("contrc_type_str", 'S', contrc_type_str);
            packer.AddField("asset_type_str", 'S', asset_type_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_STR_STR,contrc_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_STR_STR,asset_type_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_13_116_Request : BaseRequest, IRequest<pubL_13_116_Response>
    {
        public pubL_13_116_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.13.116";
            }
        }

        public int begin_date { get; set; }
        public int end_date { get; set; }
        public String exch_no_str { get; set; }
        public String contrc_type_str { get; set; }
        public String asset_type_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("contrc_type_str", 'S', contrc_type_str);
            packer.AddField("asset_type_str", 'S', asset_type_str);
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
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_STR_STR,contrc_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_STR_STR,asset_type_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_13_124_Request : BaseRequest, IRequest<pubL_13_124_Response>
    {
        public pubL_13_124_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.13.124";
            }
        }

        public String exch_no_str { get; set; }
        public String contrc_type_str { get; set; }
        public String order_dir_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public int time_stamp { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("contrc_type_str", 'S', contrc_type_str);
            packer.AddField("order_dir_str", 'S', order_dir_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
            packer.AddField("time_stamp", 'I', time_stamp);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_STR_STR,contrc_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR,order_dir_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT,time_stamp);
            return fastMsg;
        }
   }

    public class pubL_13_131_Request : BaseRequest, IRequest<pubL_13_131_Response>
    {
        public pubL_13_131_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.13.131";
            }
        }

        public int exch_no { get; set; }
        public String contrc_code { get; set; }
        public String contrc_name { get; set; }
        public int contrc_unit { get; set; }
        public double step_price { get; set; }
        public int deli_year { get; set; }
        public int deli_month { get; set; }
        public int begin_trade_date { get; set; }
        public int expire_date { get; set; }
        public int begin_deli_date { get; set; }
        public int end_deli_date { get; set; }
        public int margin_pref { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("contrc_code", 'S', contrc_code);
            packer.AddField("contrc_name", 'S', contrc_name);
            packer.AddField("contrc_unit", 'I', contrc_unit);
            packer.AddField("step_price", 'D', step_price);
            packer.AddField("deli_year", 'I', deli_year);
            packer.AddField("deli_month", 'I', deli_month);
            packer.AddField("begin_trade_date", 'I', begin_trade_date);
            packer.AddField("expire_date", 'I', expire_date);
            packer.AddField("begin_deli_date", 'I', begin_deli_date);
            packer.AddField("end_deli_date", 'I', end_deli_date);
            packer.AddField("margin_pref", 'I', margin_pref);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR,contrc_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_NAME_STR,contrc_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_UNIT_INT,contrc_unit);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STEP_PRICE_FLOAT,step_price);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DELI_YEAR_INT,deli_year);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DELI_MONTH_INT,deli_month);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TRADE_DATE_INT,begin_trade_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXPIRE_DATE_INT,expire_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DELI_DATE_INT,begin_deli_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DELI_DATE_INT,end_deli_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MARGIN_PREF_INT,margin_pref);
            return fastMsg;
        }
   }

    public class pubL_13_132_Request : BaseRequest, IRequest<pubL_13_132_Response>
    {
        public pubL_13_132_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.13.132";
            }
        }

        public int exch_no { get; set; }
        public String contrc_code { get; set; }
        public double last_price { get; set; }
        public double up_limit_price { get; set; }
        public double down_limit_price { get; set; }
        public double pre_settle_price { get; set; }
        public double sett_price { get; set; }
        public double today_close_price { get; set; }
        public double pre_close_price { get; set; }
        public double hold_qty { get; set; }
        public double buy_price_1 { get; set; }
        public double sell_price_1 { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("contrc_code", 'S', contrc_code);
            packer.AddField("last_price", 'D', last_price);
            packer.AddField("up_limit_price", 'D', up_limit_price);
            packer.AddField("down_limit_price", 'D', down_limit_price);
            packer.AddField("pre_settle_price", 'D', pre_settle_price);
            packer.AddField("sett_price", 'D', sett_price);
            packer.AddField("today_close_price", 'D', today_close_price);
            packer.AddField("pre_close_price", 'D', pre_close_price);
            packer.AddField("hold_qty", 'D', hold_qty);
            packer.AddField("buy_price_1", 'D', buy_price_1);
            packer.AddField("sell_price_1", 'D', sell_price_1);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR,contrc_code);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT,last_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UP_LIMIT_PRICE_FLOAT,up_limit_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DOWN_LIMIT_PRICE_FLOAT,down_limit_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SETTLE_PRICE_FLOAT,pre_settle_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SETT_PRICE_FLOAT,sett_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_CLOSE_PRICE_FLOAT,today_close_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_CLOSE_PRICE_FLOAT,pre_close_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HOLD_QTY_FLOAT,hold_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_PRICE_1_FLOAT,buy_price_1);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_PRICE_1_FLOAT,sell_price_1);
            return fastMsg;
        }
   }

    public class pubL_13_133_Request : BaseRequest, IRequest<pubL_13_133_Response>
    {
        public pubL_13_133_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.13.133";
            }
        }

        public String exch_no_str { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no_str", 'S', exch_no_str);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            return fastMsg;
        }
   }

    public class pubL_13_134_Request : BaseRequest, IRequest<pubL_13_134_Response>
    {
        public pubL_13_134_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.13.134";
            }
        }

        public String exch_no_str { get; set; }
        public String contrc_type_str { get; set; }
        public int time_stamp { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("contrc_type_str", 'S', contrc_type_str);
            packer.AddField("time_stamp", 'I', time_stamp);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_STR_STR,contrc_type_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT,time_stamp);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_13_141_Request : BaseRequest, IRequest<pubL_13_141_Response>
    {
        public pubL_13_141_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.13.141";
            }
        }

        public int exch_no { get; set; }
        public String contrc_code { get; set; }
        public String contrc_name { get; set; }
        public String pinyin_short { get; set; }
        public int contrc_type { get; set; }
        public int asset_type { get; set; }
        public double par_value { get; set; }
        public int contrc_unit { get; set; }
        public int report_unit { get; set; }
        public int min_unit { get; set; }
        public double max_qty { get; set; }
        public double min_qty { get; set; }
        public String crncy_type { get; set; }
        public String exch_crncy_type { get; set; }
        public int capit_reback_days { get; set; }
        public int posi_reback_days { get; set; }
        public String fee_set { get; set; }
        public int is_order_dir_flag { get; set; }
        public int valid_flag { get; set; }
        public int contrc_limit_flag { get; set; }
        public int margin_pref { get; set; }
        public int posi_type { get; set; }
        public int deli_year { get; set; }
        public int deli_month { get; set; }
        public int begin_trade_date { get; set; }
        public int expire_date { get; set; }
        public int begin_deli_date { get; set; }
        public int end_deli_date { get; set; }
        public int open_order_type { get; set; }
        public double step_price { get; set; }
        public double hold_qty { get; set; }
        public int main_flag { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("contrc_code", 'S', contrc_code);
            packer.AddField("contrc_name", 'S', contrc_name);
            packer.AddField("pinyin_short", 'S', pinyin_short);
            packer.AddField("contrc_type", 'I', contrc_type);
            packer.AddField("asset_type", 'I', asset_type);
            packer.AddField("par_value", 'D', par_value);
            packer.AddField("contrc_unit", 'I', contrc_unit);
            packer.AddField("report_unit", 'I', report_unit);
            packer.AddField("min_unit", 'I', min_unit);
            packer.AddField("max_qty", 'D', max_qty);
            packer.AddField("min_qty", 'D', min_qty);
            packer.AddField("crncy_type", 'S', crncy_type);
            packer.AddField("exch_crncy_type", 'S', exch_crncy_type);
            packer.AddField("capit_reback_days", 'I', capit_reback_days);
            packer.AddField("posi_reback_days", 'I', posi_reback_days);
            packer.AddField("fee_set", 'S', fee_set);
            packer.AddField("is_order_dir_flag", 'I', is_order_dir_flag);
            packer.AddField("valid_flag", 'I', valid_flag);
            packer.AddField("contrc_limit_flag", 'I', contrc_limit_flag);
            packer.AddField("margin_pref", 'I', margin_pref);
            packer.AddField("posi_type", 'I', posi_type);
            packer.AddField("deli_year", 'I', deli_year);
            packer.AddField("deli_month", 'I', deli_month);
            packer.AddField("begin_trade_date", 'I', begin_trade_date);
            packer.AddField("expire_date", 'I', expire_date);
            packer.AddField("begin_deli_date", 'I', begin_deli_date);
            packer.AddField("end_deli_date", 'I', end_deli_date);
            packer.AddField("open_order_type", 'I', open_order_type);
            packer.AddField("step_price", 'D', step_price);
            packer.AddField("hold_qty", 'D', hold_qty);
            packer.AddField("main_flag", 'I', main_flag);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR,contrc_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_NAME_STR,contrc_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PINYIN_SHORT_STR,pinyin_short);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT,contrc_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT,asset_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_FLOAT,par_value);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_UNIT_INT,contrc_unit);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_UNIT_INT,report_unit);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MIN_UNIT_INT,min_unit);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_QTY_FLOAT,max_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_QTY_FLOAT,min_qty);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR,exch_crncy_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CAPIT_REBACK_DAYS_INT,capit_reback_days);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_POSI_REBACK_DAYS_INT,posi_reback_days);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FEE_SET_STR,fee_set);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_ORDER_DIR_FLAG_INT,is_order_dir_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_VALID_FLAG_INT,valid_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_LIMIT_FLAG_INT,contrc_limit_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MARGIN_PREF_INT,margin_pref);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_POSI_TYPE_INT,posi_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DELI_YEAR_INT,deli_year);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DELI_MONTH_INT,deli_month);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TRADE_DATE_INT,begin_trade_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXPIRE_DATE_INT,expire_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DELI_DATE_INT,begin_deli_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DELI_DATE_INT,end_deli_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_ORDER_TYPE_INT,open_order_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STEP_PRICE_FLOAT,step_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HOLD_QTY_FLOAT,hold_qty);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MAIN_FLAG_INT,main_flag);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_13_142_Request : BaseRequest, IRequest<pubL_13_142_Response>
    {
        public pubL_13_142_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.13.142";
            }
        }

        public int exch_no { get; set; }
        public String contrc_code { get; set; }
        public String contrc_name { get; set; }
        public String pinyin_short { get; set; }
        public int contrc_type { get; set; }
        public int asset_type { get; set; }
        public double par_value { get; set; }
        public int contrc_unit { get; set; }
        public int report_unit { get; set; }
        public int min_unit { get; set; }
        public double max_qty { get; set; }
        public double min_qty { get; set; }
        public String crncy_type { get; set; }
        public String exch_crncy_type { get; set; }
        public int capit_reback_days { get; set; }
        public int posi_reback_days { get; set; }
        public String fee_set { get; set; }
        public int is_order_dir_flag { get; set; }
        public int valid_flag { get; set; }
        public int contrc_limit_flag { get; set; }
        public int margin_pref { get; set; }
        public int posi_type { get; set; }
        public int deli_year { get; set; }
        public int deli_month { get; set; }
        public int begin_trade_date { get; set; }
        public int expire_date { get; set; }
        public int begin_deli_date { get; set; }
        public int end_deli_date { get; set; }
        public int open_order_type { get; set; }
        public double step_price { get; set; }
        public double hold_qty { get; set; }
        public int main_flag { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("contrc_code", 'S', contrc_code);
            packer.AddField("contrc_name", 'S', contrc_name);
            packer.AddField("pinyin_short", 'S', pinyin_short);
            packer.AddField("contrc_type", 'I', contrc_type);
            packer.AddField("asset_type", 'I', asset_type);
            packer.AddField("par_value", 'D', par_value);
            packer.AddField("contrc_unit", 'I', contrc_unit);
            packer.AddField("report_unit", 'I', report_unit);
            packer.AddField("min_unit", 'I', min_unit);
            packer.AddField("max_qty", 'D', max_qty);
            packer.AddField("min_qty", 'D', min_qty);
            packer.AddField("crncy_type", 'S', crncy_type);
            packer.AddField("exch_crncy_type", 'S', exch_crncy_type);
            packer.AddField("capit_reback_days", 'I', capit_reback_days);
            packer.AddField("posi_reback_days", 'I', posi_reback_days);
            packer.AddField("fee_set", 'S', fee_set);
            packer.AddField("is_order_dir_flag", 'I', is_order_dir_flag);
            packer.AddField("valid_flag", 'I', valid_flag);
            packer.AddField("contrc_limit_flag", 'I', contrc_limit_flag);
            packer.AddField("margin_pref", 'I', margin_pref);
            packer.AddField("posi_type", 'I', posi_type);
            packer.AddField("deli_year", 'I', deli_year);
            packer.AddField("deli_month", 'I', deli_month);
            packer.AddField("begin_trade_date", 'I', begin_trade_date);
            packer.AddField("expire_date", 'I', expire_date);
            packer.AddField("begin_deli_date", 'I', begin_deli_date);
            packer.AddField("end_deli_date", 'I', end_deli_date);
            packer.AddField("open_order_type", 'I', open_order_type);
            packer.AddField("step_price", 'D', step_price);
            packer.AddField("hold_qty", 'D', hold_qty);
            packer.AddField("main_flag", 'I', main_flag);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR,contrc_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_NAME_STR,contrc_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PINYIN_SHORT_STR,pinyin_short);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT,contrc_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT,asset_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_FLOAT,par_value);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_UNIT_INT,contrc_unit);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_UNIT_INT,report_unit);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MIN_UNIT_INT,min_unit);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_QTY_FLOAT,max_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_QTY_FLOAT,min_qty);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR,exch_crncy_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CAPIT_REBACK_DAYS_INT,capit_reback_days);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_POSI_REBACK_DAYS_INT,posi_reback_days);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FEE_SET_STR,fee_set);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_ORDER_DIR_FLAG_INT,is_order_dir_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_VALID_FLAG_INT,valid_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_LIMIT_FLAG_INT,contrc_limit_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MARGIN_PREF_INT,margin_pref);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_POSI_TYPE_INT,posi_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DELI_YEAR_INT,deli_year);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DELI_MONTH_INT,deli_month);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TRADE_DATE_INT,begin_trade_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXPIRE_DATE_INT,expire_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DELI_DATE_INT,begin_deli_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DELI_DATE_INT,end_deli_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_ORDER_TYPE_INT,open_order_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STEP_PRICE_FLOAT,step_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HOLD_QTY_FLOAT,hold_qty);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MAIN_FLAG_INT,main_flag);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_13_144_Request : BaseRequest, IRequest<pubL_13_144_Response>
    {
        public pubL_13_144_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.13.144";
            }
        }

        public int contrc_code_no { get; set; }
        public String exch_no_str { get; set; }
        public String contrc_code { get; set; }
        public String contrc_type_str { get; set; }
        public String valid_kind_str { get; set; }
        public String contrc_limit_str { get; set; }
        public int margin_pref { get; set; }
        public String posi_type_str { get; set; }
        public int deli_year { get; set; }
        public int deli_month { get; set; }
        public int expire_date { get; set; }
        public int begin_deli_date { get; set; }
        public int end_deli_date { get; set; }
        public String open_order_type_str { get; set; }
        public int time_stamp { get; set; }
        public int main_flag { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("contrc_code_no", 'I', contrc_code_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("contrc_code", 'S', contrc_code);
            packer.AddField("contrc_type_str", 'S', contrc_type_str);
            packer.AddField("valid_kind_str", 'S', valid_kind_str);
            packer.AddField("contrc_limit_str", 'S', contrc_limit_str);
            packer.AddField("margin_pref", 'I', margin_pref);
            packer.AddField("posi_type_str", 'S', posi_type_str);
            packer.AddField("deli_year", 'I', deli_year);
            packer.AddField("deli_month", 'I', deli_month);
            packer.AddField("expire_date", 'I', expire_date);
            packer.AddField("begin_deli_date", 'I', begin_deli_date);
            packer.AddField("end_deli_date", 'I', end_deli_date);
            packer.AddField("open_order_type_str", 'S', open_order_type_str);
            packer.AddField("time_stamp", 'I', time_stamp);
            packer.AddField("main_flag", 'I', main_flag);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR,contrc_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_STR_STR,contrc_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_VALID_KIND_STR_STR,valid_kind_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_LIMIT_STR_STR,contrc_limit_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MARGIN_PREF_INT,margin_pref);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_POSI_TYPE_STR_STR,posi_type_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DELI_YEAR_INT,deli_year);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DELI_MONTH_INT,deli_month);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXPIRE_DATE_INT,expire_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DELI_DATE_INT,begin_deli_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DELI_DATE_INT,end_deli_date);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_ORDER_TYPE_STR_STR,open_order_type_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT,time_stamp);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MAIN_FLAG_INT,main_flag);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_13_148_Request : BaseRequest, IRequest<pubL_13_148_Response>
    {
        public pubL_13_148_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.13.148";
            }
        }

        public String exch_no_str { get; set; }
        public int time_stamp { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("time_stamp", 'I', time_stamp);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT,time_stamp);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_13_145_Request : BaseRequest, IRequest<pubL_13_145_Response>
    {
        public pubL_13_145_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.13.145";
            }
        }

        public int exch_no { get; set; }
        public String contrc_code { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("contrc_code", 'S', contrc_code);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR,contrc_code);
            return fastMsg;
        }
   }

    public class pubL_13_146_Request : BaseRequest, IRequest<pubL_13_146_Response>
    {
        public pubL_13_146_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.13.146";
            }
        }

        public int contrc_code_no { get; set; }
        public String exch_no_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("contrc_code_no", 'I', contrc_code_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_13_147_Request : BaseRequest, IRequest<pubL_13_147_Response>
    {
        public pubL_13_147_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.13.147";
            }
        }

        public int begin_date { get; set; }
        public int end_date { get; set; }
        public int contrc_code_no { get; set; }
        public String exch_no_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("contrc_code_no", 'I', contrc_code_no);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_13_149_Request : BaseRequest, IRequest<pubL_13_149_Response>
    {
        public pubL_13_149_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.13.149";
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

    public class pubL_13_151_Request : BaseRequest, IRequest<pubL_13_151_Response>
    {
        public pubL_13_151_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.13.151";
            }
        }

        public int exch_no { get; set; }
        public String contrc_code { get; set; }
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
            packer.AddField("contrc_code", 'S', contrc_code);
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
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR,contrc_code);
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

    public class pubL_13_152_Request : BaseRequest, IRequest<pubL_13_152_Response>
    {
        public pubL_13_152_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.13.152";
            }
        }

        public int exch_no { get; set; }
        public String contrc_code { get; set; }
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
            packer.AddField("contrc_code", 'S', contrc_code);
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
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR,contrc_code);
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

    public class pubL_13_153_Request : BaseRequest, IRequest<pubL_13_153_Response>
    {
        public pubL_13_153_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.13.153";
            }
        }

        public int exch_no { get; set; }
        public String contrc_code { get; set; }
        public int order_dir { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("contrc_code", 'S', contrc_code);
            packer.AddField("order_dir", 'I', order_dir);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR,contrc_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT,order_dir);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_13_154_Request : BaseRequest, IRequest<pubL_13_154_Response>
    {
        public pubL_13_154_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.13.154";
            }
        }

        public int contrc_code_no { get; set; }
        public String exch_no_str { get; set; }
        public String order_dir_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public int time_stamp { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("contrc_code_no", 'I', contrc_code_no);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR,order_dir_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT,time_stamp);
            return fastMsg;
        }
   }

    public class pubL_13_155_Request : BaseRequest, IRequest<pubL_13_155_Response>
    {
        public pubL_13_155_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.13.155";
            }
        }

        public int contrc_code_no { get; set; }
        public String exch_no_str { get; set; }
        public String order_dir_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("contrc_code_no", 'I', contrc_code_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("order_dir_str", 'S', order_dir_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR,order_dir_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_13_156_Request : BaseRequest, IRequest<pubL_13_156_Response>
    {
        public pubL_13_156_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.13.156";
            }
        }

        public int begin_date { get; set; }
        public int end_date { get; set; }
        public int contrc_code_no { get; set; }
        public String exch_no_str { get; set; }
        public String order_dir_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("contrc_code_no", 'I', contrc_code_no);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR,order_dir_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_13_157_Request : BaseRequest, IRequest<pubL_13_157_Response>
    {
        public pubL_13_157_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.13.157";
            }
        }

        public int exch_no { get; set; }
        public String contrc_code { get; set; }
        public double deli_price { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("contrc_code", 'S', contrc_code);
            packer.AddField("deli_price", 'D', deli_price);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR,contrc_code);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DELI_PRICE_FLOAT,deli_price);
            return fastMsg;
        }
   }

    public class pubL_13_158_Request : BaseRequest, IRequest<pubL_13_158_Response>
    {
        public pubL_13_158_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.13.158";
            }
        }

        public int exch_no { get; set; }
        public String contrc_code { get; set; }
        public double deli_price { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("contrc_code", 'S', contrc_code);
            packer.AddField("deli_price", 'D', deli_price);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR,contrc_code);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DELI_PRICE_FLOAT,deli_price);
            return fastMsg;
        }
   }

    public class pubL_13_159_Request : BaseRequest, IRequest<pubL_13_159_Response>
    {
        public pubL_13_159_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.13.159";
            }
        }

        public int exch_no { get; set; }
        public String contrc_code { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("contrc_code", 'S', contrc_code);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR,contrc_code);
            return fastMsg;
        }
   }

    public class pubL_13_160_Request : BaseRequest, IRequest<pubL_13_160_Response>
    {
        public pubL_13_160_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.13.160";
            }
        }

        public int exch_no { get; set; }
        public int contrc_code_no { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("contrc_code_no", 'I', contrc_code_no);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_13_161_Request : BaseRequest, IRequest<pubL_13_161_Response>
    {
        public pubL_13_161_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.13.161";
            }
        }

        public int exch_no { get; set; }
        public String contrc_code { get; set; }
        public int contrc_type { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("contrc_code", 'S', contrc_code);
            packer.AddField("contrc_type", 'I', contrc_type);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR,contrc_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT,contrc_type);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_13_170_Request : BaseRequest, IRequest<pubL_13_170_Response>
    {
        public pubL_13_170_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.13.170";
            }
        }

        public int exch_no { get; set; }
        public int contrc_code_no { get; set; }
        public String contrc_code { get; set; }
        public String contrc_name { get; set; }
        public int contrc_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("contrc_code_no", 'I', contrc_code_no);
            packer.AddField("contrc_code", 'S', contrc_code);
            packer.AddField("contrc_name", 'S', contrc_name);
            packer.AddField("contrc_type", 'I', contrc_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR,contrc_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_NAME_STR,contrc_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT,contrc_type);
            return fastMsg;
        }
   }

    public class pubL_13_171_Request : BaseRequest, IRequest<pubL_13_171_Response>
    {
        public pubL_13_171_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.13.171";
            }
        }

        public int contrc_code_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("contrc_code_no", 'I', contrc_code_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            return fastMsg;
        }
   }

    public class pubL_13_172_Request : BaseRequest, IRequest<pubL_13_172_Response>
    {
        public pubL_13_172_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.13.172";
            }
        }

        public int exch_no { get; set; }
        public int contrc_code_no { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("contrc_code_no", 'I', contrc_code_no);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_13_173_Request : BaseRequest, IRequest<pubL_13_173_Response>
    {
        public pubL_13_173_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.13.173";
            }
        }

        public int exch_no { get; set; }
        public String contrc_code { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("contrc_code", 'S', contrc_code);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR,contrc_code);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_13_174_Request : BaseRequest, IRequest<pubL_13_174_Response>
    {
        public pubL_13_174_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.13.174";
            }
        }

        public int exch_no { get; set; }
        public String contrc_code { get; set; }
        public double sett_price { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("contrc_code", 'S', contrc_code);
            packer.AddField("sett_price", 'D', sett_price);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR,contrc_code);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SETT_PRICE_FLOAT,sett_price);
            return fastMsg;
        }
   }

}
