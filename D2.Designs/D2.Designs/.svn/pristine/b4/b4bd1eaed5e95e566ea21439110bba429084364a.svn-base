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
    public class pubL_28_101_Request : BaseRequest, IRequest<pubL_28_101_Response>
    {
        public pubL_28_101_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.28.101";
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

    public class pubL_28_102_Request : BaseRequest, IRequest<pubL_28_102_Response>
    {
        public pubL_28_102_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.28.102";
            }
        }

        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public String stock_name { get; set; }
        public String trade_code { get; set; }
        public String target_code { get; set; }
        public int stock_code_no { get; set; }
        public int trade_code_no { get; set; }
        public int target_code_no { get; set; }
        public int apply_date { get; set; }
        public double apply_limit { get; set; }
        public int begin_trade_date { get; set; }
        public double issue_price { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("stock_name", 'S', stock_name);
            packer.AddField("trade_code", 'S', trade_code);
            packer.AddField("target_code", 'S', target_code);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("trade_code_no", 'I', trade_code_no);
            packer.AddField("target_code_no", 'I', target_code_no);
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
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR,stock_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_STR,trade_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_STR,target_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_NO_INT,trade_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_NO_INT,target_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_APPLY_DATE_INT,apply_date);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_APPLY_LIMIT_FLOAT,apply_limit);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TRADE_DATE_INT,begin_trade_date);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ISSUE_PRICE_FLOAT,issue_price);
            return fastMsg;
        }
   }

    public class pubL_28_111_Request : BaseRequest, IRequest<pubL_28_111_Response>
    {
        public pubL_28_111_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.28.111";
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

    public class pubL_28_112_Request : BaseRequest, IRequest<pubL_28_112_Response>
    {
        public pubL_28_112_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.28.112";
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
        public int time_stamp { get; set; }
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
            packer.AddField("time_stamp", 'I', time_stamp);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT,time_stamp);
            return fastMsg;
        }
   }

    public class pubL_28_121_Request : BaseRequest, IRequest<pubL_28_121_Response>
    {
        public pubL_28_121_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.28.121";
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

    public class pubL_28_122_Request : BaseRequest, IRequest<pubL_28_122_Response>
    {
        public pubL_28_122_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.28.122";
            }
        }

        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public String trade_code { get; set; }
        public String target_code { get; set; }
        public int stock_code_no { get; set; }
        public int trade_code_no { get; set; }
        public int target_code_no { get; set; }
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
        public int pay_intrst_flag { get; set; }
        public int time_stamp { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("trade_code", 'S', trade_code);
            packer.AddField("target_code", 'S', target_code);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("trade_code_no", 'I', trade_code_no);
            packer.AddField("target_code_no", 'I', target_code_no);
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
            packer.AddField("pay_intrst_flag", 'I', pay_intrst_flag);
            packer.AddField("time_stamp", 'I', time_stamp);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_STR,trade_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_STR,target_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_NO_INT,trade_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_NO_INT,target_code_no);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PAY_INTRST_FLAG_INT,pay_intrst_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT,time_stamp);
            return fastMsg;
        }
   }

    public class pubL_28_131_Request : BaseRequest, IRequest<pubL_28_131_Response>
    {
        public pubL_28_131_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.28.131";
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

    public class pubL_28_132_Request : BaseRequest, IRequest<pubL_28_132_Response>
    {
        public pubL_28_132_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.28.132";
            }
        }

        public int stock_code_no { get; set; }
        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public String stock_name { get; set; }
        public double up_limit_price { get; set; }
        public double down_limit_price { get; set; }
        public double last_price { get; set; }
        public double pre_close_price { get; set; }
        public double today_open_price { get; set; }
        public double today_close_price { get; set; }
        public double today_max_price { get; set; }
        public double today_min_price { get; set; }
        public double buy_price_1 { get; set; }
        public double buy_qty_1 { get; set; }
        public double buy_price_2 { get; set; }
        public double buy_qty_2 { get; set; }
        public double buy_price_3 { get; set; }
        public double buy_qty_3 { get; set; }
        public double buy_price_4 { get; set; }
        public double buy_qty_4 { get; set; }
        public double buy_price_5 { get; set; }
        public double buy_qty_5 { get; set; }
        public double sell_price_1 { get; set; }
        public double sell_qty_1 { get; set; }
        public double sell_price_2 { get; set; }
        public double sell_qty_2 { get; set; }
        public double sell_price_3 { get; set; }
        public double sell_qty_3 { get; set; }
        public double sell_price_4 { get; set; }
        public double sell_qty_4 { get; set; }
        public double sell_price_5 { get; set; }
        public double sell_qty_5 { get; set; }
        public double strike_qty { get; set; }
        public double strike_amt { get; set; }
        public double pe_ratio { get; set; }
        public int time_stamp { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("stock_name", 'S', stock_name);
            packer.AddField("up_limit_price", 'D', up_limit_price);
            packer.AddField("down_limit_price", 'D', down_limit_price);
            packer.AddField("last_price", 'D', last_price);
            packer.AddField("pre_close_price", 'D', pre_close_price);
            packer.AddField("today_open_price", 'D', today_open_price);
            packer.AddField("today_close_price", 'D', today_close_price);
            packer.AddField("today_max_price", 'D', today_max_price);
            packer.AddField("today_min_price", 'D', today_min_price);
            packer.AddField("buy_price_1", 'D', buy_price_1);
            packer.AddField("buy_qty_1", 'D', buy_qty_1);
            packer.AddField("buy_price_2", 'D', buy_price_2);
            packer.AddField("buy_qty_2", 'D', buy_qty_2);
            packer.AddField("buy_price_3", 'D', buy_price_3);
            packer.AddField("buy_qty_3", 'D', buy_qty_3);
            packer.AddField("buy_price_4", 'D', buy_price_4);
            packer.AddField("buy_qty_4", 'D', buy_qty_4);
            packer.AddField("buy_price_5", 'D', buy_price_5);
            packer.AddField("buy_qty_5", 'D', buy_qty_5);
            packer.AddField("sell_price_1", 'D', sell_price_1);
            packer.AddField("sell_qty_1", 'D', sell_qty_1);
            packer.AddField("sell_price_2", 'D', sell_price_2);
            packer.AddField("sell_qty_2", 'D', sell_qty_2);
            packer.AddField("sell_price_3", 'D', sell_price_3);
            packer.AddField("sell_qty_3", 'D', sell_qty_3);
            packer.AddField("sell_price_4", 'D', sell_price_4);
            packer.AddField("sell_qty_4", 'D', sell_qty_4);
            packer.AddField("sell_price_5", 'D', sell_price_5);
            packer.AddField("sell_qty_5", 'D', sell_qty_5);
            packer.AddField("strike_qty", 'D', strike_qty);
            packer.AddField("strike_amt", 'D', strike_amt);
            packer.AddField("pe_ratio", 'D', pe_ratio);
            packer.AddField("time_stamp", 'I', time_stamp);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR,stock_name);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UP_LIMIT_PRICE_FLOAT,up_limit_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DOWN_LIMIT_PRICE_FLOAT,down_limit_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT,last_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_CLOSE_PRICE_FLOAT,pre_close_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_OPEN_PRICE_FLOAT,today_open_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_CLOSE_PRICE_FLOAT,today_close_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_MAX_PRICE_FLOAT,today_max_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_MIN_PRICE_FLOAT,today_min_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_PRICE_1_FLOAT,buy_price_1);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_QTY_1_FLOAT,buy_qty_1);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_PRICE_2_FLOAT,buy_price_2);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_QTY_2_FLOAT,buy_qty_2);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_PRICE_3_FLOAT,buy_price_3);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_QTY_3_FLOAT,buy_qty_3);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_PRICE_4_FLOAT,buy_price_4);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_QTY_4_FLOAT,buy_qty_4);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_PRICE_5_FLOAT,buy_price_5);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_QTY_5_FLOAT,buy_qty_5);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_PRICE_1_FLOAT,sell_price_1);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_QTY_1_FLOAT,sell_qty_1);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_PRICE_2_FLOAT,sell_price_2);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_QTY_2_FLOAT,sell_qty_2);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_PRICE_3_FLOAT,sell_price_3);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_QTY_3_FLOAT,sell_qty_3);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_PRICE_4_FLOAT,sell_price_4);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_QTY_4_FLOAT,sell_qty_4);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_PRICE_5_FLOAT,sell_price_5);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_QTY_5_FLOAT,sell_qty_5);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT,strike_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT,strike_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PE_RATIO_FLOAT,pe_ratio);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT,time_stamp);
            return fastMsg;
        }
   }

    public class pubL_28_141_Request : BaseRequest, IRequest<pubL_28_141_Response>
    {
        public pubL_28_141_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.28.141";
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

    public class pubL_28_142_Request : BaseRequest, IRequest<pubL_28_142_Response>
    {
        public pubL_28_142_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.28.142";
            }
        }

        public int stock_code_no { get; set; }
        public String stock_code { get; set; }
        public int exch_no { get; set; }
        public String trade_code { get; set; }
        public String target_code { get; set; }
        public int time_stamp { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("trade_code", 'S', trade_code);
            packer.AddField("target_code", 'S', target_code);
            packer.AddField("time_stamp", 'I', time_stamp);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_STR,trade_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_STR,target_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT,time_stamp);
            return fastMsg;
        }
   }

    public class pubL_28_151_Request : BaseRequest, IRequest<pubL_28_151_Response>
    {
        public pubL_28_151_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.28.151";
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

    public class pubL_28_152_Request : BaseRequest, IRequest<pubL_28_152_Response>
    {
        public pubL_28_152_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.28.152";
            }
        }

        public int stock_code_no { get; set; }
        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public int order_dir { get; set; }
        public int cash_frozen_type { get; set; }
        public int order_split_flag { get; set; }
        public int min_unit { get; set; }
        public double max_qty { get; set; }
        public double min_qty { get; set; }
        public int time_stamp { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("order_dir", 'I', order_dir);
            packer.AddField("cash_frozen_type", 'I', cash_frozen_type);
            packer.AddField("order_split_flag", 'I', order_split_flag);
            packer.AddField("min_unit", 'I', min_unit);
            packer.AddField("max_qty", 'D', max_qty);
            packer.AddField("min_qty", 'D', min_qty);
            packer.AddField("time_stamp", 'I', time_stamp);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT,order_dir);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CASH_FROZEN_TYPE_INT,cash_frozen_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_SPLIT_FLAG_INT,order_split_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MIN_UNIT_INT,min_unit);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_QTY_FLOAT,max_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_QTY_FLOAT,min_qty);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT,time_stamp);
            return fastMsg;
        }
   }

    public class pubL_28_161_Request : BaseRequest, IRequest<pubL_28_161_Response>
    {
        public pubL_28_161_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.28.161";
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

    public class pubL_28_162_Request : BaseRequest, IRequest<pubL_28_162_Response>
    {
        public pubL_28_162_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.28.162";
            }
        }

        public int init_date { get; set; }
        public int exch_no { get; set; }
        public String for_crncy_type { get; set; }
        public String crncy_type { get; set; }
        public double buy_ref_rate { get; set; }
        public double sell_ref_rate { get; set; }
        public double settle_buy_rate { get; set; }
        public double settle_sell_rate { get; set; }
        public double pboc_rate { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("init_date", 'I', init_date);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("for_crncy_type", 'S', for_crncy_type);
            packer.AddField("crncy_type", 'S', crncy_type);
            packer.AddField("buy_ref_rate", 'D', buy_ref_rate);
            packer.AddField("sell_ref_rate", 'D', sell_ref_rate);
            packer.AddField("settle_buy_rate", 'D', settle_buy_rate);
            packer.AddField("settle_sell_rate", 'D', settle_sell_rate);
            packer.AddField("pboc_rate", 'D', pboc_rate);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FOR_CRNCY_TYPE_STR,for_crncy_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_REF_RATE_FLOAT,buy_ref_rate);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_REF_RATE_FLOAT,sell_ref_rate);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SETTLE_BUY_RATE_FLOAT,settle_buy_rate);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SETTLE_SELL_RATE_FLOAT,settle_sell_rate);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PBOC_RATE_FLOAT,pboc_rate);
            return fastMsg;
        }
   }

    public class pubL_28_171_Request : BaseRequest, IRequest<pubL_28_171_Response>
    {
        public pubL_28_171_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.28.171";
            }
        }

        public String exch_no_str { get; set; }
        public String stock_code_str { get; set; }
        public String stock_name_str { get; set; }
        public String total_stock_issue_str { get; set; }
        public String circl_stock_capit_str { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_code_str", 'S', stock_code_str);
            packer.AddField("stock_name_str", 'S', stock_name_str);
            packer.AddField("total_stock_issue_str", 'S', total_stock_issue_str);
            packer.AddField("circl_stock_capit_str", 'S', circl_stock_capit_str);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR_STR,stock_code_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR_STR,stock_name_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_STOCK_ISSUE_STR_STR,total_stock_issue_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CIRCL_STOCK_CAPIT_STR_STR,circl_stock_capit_str);
            return fastMsg;
        }
   }

    public class pubL_28_172_Request : BaseRequest, IRequest<pubL_28_172_Response>
    {
        public pubL_28_172_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.28.172";
            }
        }

        public String exch_no_str { get; set; }
        public String stock_code_str { get; set; }
        public String stock_name_str { get; set; }
        public String pinyin_short_str { get; set; }
        public String apply_code_str { get; set; }
        public String apply_date_str { get; set; }
        public String apply_limit_str { get; set; }
        public String begin_trade_date_str { get; set; }
        public String issue_price_str { get; set; }
        public String total_stock_issue_str { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_code_str", 'S', stock_code_str);
            packer.AddField("stock_name_str", 'S', stock_name_str);
            packer.AddField("pinyin_short_str", 'S', pinyin_short_str);
            packer.AddField("apply_code_str", 'S', apply_code_str);
            packer.AddField("apply_date_str", 'S', apply_date_str);
            packer.AddField("apply_limit_str", 'S', apply_limit_str);
            packer.AddField("begin_trade_date_str", 'S', begin_trade_date_str);
            packer.AddField("issue_price_str", 'S', issue_price_str);
            packer.AddField("total_stock_issue_str", 'S', total_stock_issue_str);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR_STR,stock_code_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR_STR,stock_name_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PINYIN_SHORT_STR_STR,pinyin_short_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_APPLY_CODE_STR_STR,apply_code_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_APPLY_DATE_STR_STR,apply_date_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_APPLY_LIMIT_STR_STR,apply_limit_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TRADE_DATE_STR_STR,begin_trade_date_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ISSUE_PRICE_STR_STR,issue_price_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_STOCK_ISSUE_STR_STR,total_stock_issue_str);
            return fastMsg;
        }
   }

    public class pubL_28_173_Request : BaseRequest, IRequest<pubL_28_173_Response>
    {
        public pubL_28_173_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.28.173";
            }
        }

        public String exch_no_str { get; set; }
        public String stock_code_str { get; set; }
        public String stock_name_str { get; set; }
        public String pinyin_short_str { get; set; }
        public String bond_type_str { get; set; }
        public String apply_code_str { get; set; }
        public String apply_limit_str { get; set; }
        public String apply_date_str { get; set; }
        public String issue_price_str { get; set; }
        public String par_value_str { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_code_str", 'S', stock_code_str);
            packer.AddField("stock_name_str", 'S', stock_name_str);
            packer.AddField("pinyin_short_str", 'S', pinyin_short_str);
            packer.AddField("bond_type_str", 'S', bond_type_str);
            packer.AddField("apply_code_str", 'S', apply_code_str);
            packer.AddField("apply_limit_str", 'S', apply_limit_str);
            packer.AddField("apply_date_str", 'S', apply_date_str);
            packer.AddField("issue_price_str", 'S', issue_price_str);
            packer.AddField("par_value_str", 'S', par_value_str);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR_STR,stock_code_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR_STR,stock_name_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PINYIN_SHORT_STR_STR,pinyin_short_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_BOND_TYPE_STR_STR,bond_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_APPLY_CODE_STR_STR,apply_code_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_APPLY_LIMIT_STR_STR,apply_limit_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_APPLY_DATE_STR_STR,apply_date_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ISSUE_PRICE_STR_STR,issue_price_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_STR_STR,par_value_str);
            return fastMsg;
        }
   }

    public class pubL_28_174_Request : BaseRequest, IRequest<pubL_28_174_Response>
    {
        public pubL_28_174_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.28.174";
            }
        }

        public String exch_no_str { get; set; }
        public String stock_code_str { get; set; }
        public String stock_name_str { get; set; }
        public String pinyin_short_str { get; set; }
        public String stock_type_str { get; set; }
        public String asset_type_str { get; set; }
        public String fund_invest_type_str { get; set; }
        public String fund_type_str { get; set; }
        public String fund_share_str { get; set; }
        public String market_share_str { get; set; }
        public String circl_stock_capit_str { get; set; }
        public String total_stock_issue_str { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_code_str", 'S', stock_code_str);
            packer.AddField("stock_name_str", 'S', stock_name_str);
            packer.AddField("pinyin_short_str", 'S', pinyin_short_str);
            packer.AddField("stock_type_str", 'S', stock_type_str);
            packer.AddField("asset_type_str", 'S', asset_type_str);
            packer.AddField("fund_invest_type_str", 'S', fund_invest_type_str);
            packer.AddField("fund_type_str", 'S', fund_type_str);
            packer.AddField("fund_share_str", 'S', fund_share_str);
            packer.AddField("market_share_str", 'S', market_share_str);
            packer.AddField("circl_stock_capit_str", 'S', circl_stock_capit_str);
            packer.AddField("total_stock_issue_str", 'S', total_stock_issue_str);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR_STR,stock_code_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR_STR,stock_name_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PINYIN_SHORT_STR_STR,pinyin_short_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_STR_STR,stock_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_STR_STR,asset_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUND_INVEST_TYPE_STR_STR,fund_invest_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUND_TYPE_STR_STR,fund_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUND_SHARE_STR_STR,fund_share_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_SHARE_STR_STR,market_share_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CIRCL_STOCK_CAPIT_STR_STR,circl_stock_capit_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_STOCK_ISSUE_STR_STR,total_stock_issue_str);
            return fastMsg;
        }
   }

    public class pubL_28_175_Request : BaseRequest, IRequest<pubL_28_175_Response>
    {
        public pubL_28_175_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.28.175";
            }
        }

        public String exch_no_str { get; set; }
        public String stock_code_str { get; set; }
        public String stock_name_str { get; set; }
        public String pinyin_short_str { get; set; }
        public String bond_type_str { get; set; }
        public String bond_class_str { get; set; }
        public String begin_trade_date_str { get; set; }
        public String total_scale_str { get; set; }
        public String impawn_code_str { get; set; }
        public String issue_date_str { get; set; }
        public String end_date_str { get; set; }
        public String value_date_str { get; set; }
        public String bond_limit_str { get; set; }
        public String issue_price_str { get; set; }
        public String intrst_ratio_str { get; set; }
        public String early_expire_date { get; set; }
        public String intrst_type_str { get; set; }
        public String pay_intrst_type_str { get; set; }
        public String bond_accr_intrst_str { get; set; }
        public String std_stock_discount_str { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_code_str", 'S', stock_code_str);
            packer.AddField("stock_name_str", 'S', stock_name_str);
            packer.AddField("pinyin_short_str", 'S', pinyin_short_str);
            packer.AddField("bond_type_str", 'S', bond_type_str);
            packer.AddField("bond_class_str", 'S', bond_class_str);
            packer.AddField("begin_trade_date_str", 'S', begin_trade_date_str);
            packer.AddField("total_scale_str", 'S', total_scale_str);
            packer.AddField("impawn_code_str", 'S', impawn_code_str);
            packer.AddField("issue_date_str", 'S', issue_date_str);
            packer.AddField("end_date_str", 'S', end_date_str);
            packer.AddField("value_date_str", 'S', value_date_str);
            packer.AddField("bond_limit_str", 'S', bond_limit_str);
            packer.AddField("issue_price_str", 'S', issue_price_str);
            packer.AddField("intrst_ratio_str", 'S', intrst_ratio_str);
            packer.AddField("early_expire_date", 'S', early_expire_date);
            packer.AddField("intrst_type_str", 'S', intrst_type_str);
            packer.AddField("pay_intrst_type_str", 'S', pay_intrst_type_str);
            packer.AddField("bond_accr_intrst_str", 'S', bond_accr_intrst_str);
            packer.AddField("std_stock_discount_str", 'S', std_stock_discount_str);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR_STR,stock_code_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR_STR,stock_name_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PINYIN_SHORT_STR_STR,pinyin_short_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_BOND_TYPE_STR_STR,bond_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_BOND_CLASS_STR_STR,bond_class_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TRADE_DATE_STR_STR,begin_trade_date_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_SCALE_STR_STR,total_scale_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_IMPAWN_CODE_STR_STR,impawn_code_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ISSUE_DATE_STR_STR,issue_date_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_STR_STR,end_date_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_VALUE_DATE_STR_STR,value_date_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_BOND_LIMIT_STR_STR,bond_limit_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ISSUE_PRICE_STR_STR,issue_price_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_RATIO_STR_STR,intrst_ratio_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EARLY_EXPIRE_DATE_STR,early_expire_date);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_TYPE_STR_STR,intrst_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PAY_INTRST_TYPE_STR_STR,pay_intrst_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_STR_STR,bond_accr_intrst_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STD_STOCK_DISCOUNT_STR_STR,std_stock_discount_str);
            return fastMsg;
        }
   }

    public class pubL_28_201_Request : BaseRequest, IRequest<pubL_28_201_Response>
    {
        public pubL_28_201_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.28.201";
            }
        }

        public int co_no { get; set; }
        public int auto_sync_type { get; set; }
        public int sync_req_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("auto_sync_type", 'I', auto_sync_type);
            packer.AddField("sync_req_type", 'I', sync_req_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_AUTO_SYNC_TYPE_INT,auto_sync_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SYNC_REQ_TYPE_INT,sync_req_type);
            return fastMsg;
        }
   }

    public class pubL_28_202_Request : BaseRequest, IRequest<pubL_28_202_Response>
    {
        public pubL_28_202_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.28.202";
            }
        }

        public int co_no { get; set; }
        public int auto_sync_type { get; set; }
        public int capital_batch_deal_range { get; set; }
        public int posi_batch_deal_range { get; set; }
        public int begin_time { get; set; }
        public int end_time { get; set; }
        public int is_batch_deal { get; set; }
        public int is_inner_check { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("auto_sync_type", 'I', auto_sync_type);
            packer.AddField("capital_batch_deal_range", 'I', capital_batch_deal_range);
            packer.AddField("posi_batch_deal_range", 'I', posi_batch_deal_range);
            packer.AddField("begin_time", 'I', begin_time);
            packer.AddField("end_time", 'I', end_time);
            packer.AddField("is_batch_deal", 'I', is_batch_deal);
            packer.AddField("is_inner_check", 'I', is_inner_check);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_AUTO_SYNC_TYPE_INT,auto_sync_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CAPITAL_BATCH_DEAL_RANGE_INT,capital_batch_deal_range);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_POSI_BATCH_DEAL_RANGE_INT,posi_batch_deal_range);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TIME_INT,begin_time);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_TIME_INT,end_time);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_BATCH_DEAL_INT,is_batch_deal);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_INNER_CHECK_INT,is_inner_check);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class pubL_28_203_Request : BaseRequest, IRequest<pubL_28_203_Response>
    {
        public pubL_28_203_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.28.203";
            }
        }

        public ulong row_id { get; set; }
        public int capital_batch_deal_range { get; set; }
        public int posi_batch_deal_range { get; set; }
        public int begin_time { get; set; }
        public int end_time { get; set; }
        public int is_batch_deal { get; set; }
        public int is_inner_check { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("capital_batch_deal_range", 'I', capital_batch_deal_range);
            packer.AddField("posi_batch_deal_range", 'I', posi_batch_deal_range);
            packer.AddField("begin_time", 'I', begin_time);
            packer.AddField("end_time", 'I', end_time);
            packer.AddField("is_batch_deal", 'I', is_batch_deal);
            packer.AddField("is_inner_check", 'I', is_inner_check);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CAPITAL_BATCH_DEAL_RANGE_INT,capital_batch_deal_range);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_POSI_BATCH_DEAL_RANGE_INT,posi_batch_deal_range);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TIME_INT,begin_time);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_TIME_INT,end_time);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_BATCH_DEAL_INT,is_batch_deal);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_INNER_CHECK_INT,is_inner_check);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class pubL_28_204_Request : BaseRequest, IRequest<pubL_28_204_Response>
    {
        public pubL_28_204_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.28.204";
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

    public class pubL_28_205_Request : BaseRequest, IRequest<pubL_28_205_Response>
    {
        public pubL_28_205_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.28.205";
            }
        }

        public ulong row_id { get; set; }
        public int auto_sync_deal_flag { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("auto_sync_deal_flag", 'I', auto_sync_deal_flag);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_AUTO_SYNC_DEAL_FLAG_INT,auto_sync_deal_flag);
            return fastMsg;
        }
   }

    public class pubL_28_106_Request : BaseRequest, IRequest<pubL_28_106_Response>
    {
        public pubL_28_106_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.28.106";
            }
        }

        public int co_no { get; set; }
        public String process_type_name { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("process_type_name", 'S', process_type_name);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PROCESS_TYPE_NAME_STR,process_type_name);
            return fastMsg;
        }
   }

    public class pubL_28_107_Request : BaseRequest, IRequest<pubL_28_107_Response>
    {
        public pubL_28_107_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.28.107";
            }
        }

        public int co_no { get; set; }
        public String process_type_name { get; set; }
        public String process_name { get; set; }
        public String event_msg_content { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("process_type_name", 'S', process_type_name);
            packer.AddField("process_name", 'S', process_name);
            packer.AddField("event_msg_content", 'S', event_msg_content);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PROCESS_TYPE_NAME_STR,process_type_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PROCESS_NAME_STR,process_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EVENT_MSG_CONTENT_STR,event_msg_content);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class pubL_28_108_Request : BaseRequest, IRequest<pubL_28_108_Response>
    {
        public pubL_28_108_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.28.108";
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

}
