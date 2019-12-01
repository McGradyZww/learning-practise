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
    public class pubL_16_1_Request : BaseRequest, IRequest<pubL_16_1_Response>
    {
        public pubL_16_1_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.16.1";
            }
        }

        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public String stock_name { get; set; }
        public String pinyin_short { get; set; }
        public double up_limit_price { get; set; }
        public double down_limit_price { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("stock_name", 'S', stock_name);
            packer.AddField("pinyin_short", 'S', pinyin_short);
            packer.AddField("up_limit_price", 'D', up_limit_price);
            packer.AddField("down_limit_price", 'D', down_limit_price);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR,stock_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PINYIN_SHORT_STR,pinyin_short);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UP_LIMIT_PRICE_FLOAT,up_limit_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DOWN_LIMIT_PRICE_FLOAT,down_limit_price);
            return fastMsg;
        }
   }

    public class pubL_16_2_Request : BaseRequest, IRequest<pubL_16_2_Response>
    {
        public pubL_16_2_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.16.2";
            }
        }

        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public double last_price { get; set; }
        public double pre_close_price { get; set; }
        public String stop_status { get; set; }
        public double up_limit_price { get; set; }
        public double down_limit_price { get; set; }
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
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("last_price", 'D', last_price);
            packer.AddField("pre_close_price", 'D', pre_close_price);
            packer.AddField("stop_status", 'S', stop_status);
            packer.AddField("up_limit_price", 'D', up_limit_price);
            packer.AddField("down_limit_price", 'D', down_limit_price);
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
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT,last_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_CLOSE_PRICE_FLOAT,pre_close_price);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOP_STATUS_STR,stop_status);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UP_LIMIT_PRICE_FLOAT,up_limit_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DOWN_LIMIT_PRICE_FLOAT,down_limit_price);
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
            return fastMsg;
        }
   }

    public class pubL_16_3_Request : BaseRequest, IRequest<pubL_16_3_Response>
    {
        public pubL_16_3_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.16.3";
            }
        }

        public int order_dir { get; set; }
        public double ask_exec_qty { get; set; }
        public int begin_time { get; set; }
        public int end_time { get; set; }
        public double comm_limit_price { get; set; }
        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("order_dir", 'I', order_dir);
            packer.AddField("ask_exec_qty", 'D', ask_exec_qty);
            packer.AddField("begin_time", 'I', begin_time);
            packer.AddField("end_time", 'I', end_time);
            packer.AddField("comm_limit_price", 'D', comm_limit_price);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT,order_dir);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASK_EXEC_QTY_FLOAT,ask_exec_qty);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TIME_INT,begin_time);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_TIME_INT,end_time);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_LIMIT_PRICE_FLOAT,comm_limit_price);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            return fastMsg;
        }
   }

    public class pubL_16_4_Request : BaseRequest, IRequest<pubL_16_4_Response>
    {
        public pubL_16_4_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.16.4";
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

    public class pubL_16_5_Request : BaseRequest, IRequest<pubL_16_5_Response>
    {
        public pubL_16_5_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.16.5";
            }
        }

        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public String quot_price_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("quot_price_info", 'S', quot_price_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_QUOT_PRICE_INFO_STR,quot_price_info);
            return fastMsg;
        }
   }

    public class pubL_16_11_Request : BaseRequest, IRequest<pubL_16_11_Response>
    {
        public pubL_16_11_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.16.11";
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

    public class pubL_16_12_Request : BaseRequest, IRequest<pubL_16_12_Response>
    {
        public pubL_16_12_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.16.12";
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

    public class pubL_16_15_Request : BaseRequest, IRequest<pubL_16_15_Response>
    {
        public pubL_16_15_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.16.15";
            }
        }

        public String exch_no_str { get; set; }
        public String stock_code_str { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_code_str", 'S', stock_code_str);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR_STR,stock_code_str);
            return fastMsg;
        }
   }

    public class pubL_16_16_Request : BaseRequest, IRequest<pubL_16_16_Response>
    {
        public pubL_16_16_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.16.16";
            }
        }

        public int order_dir { get; set; }
        public ulong comm_id { get; set; }
        public double ask_exec_qty { get; set; }
        public int comm_begin_date { get; set; }
        public int comm_end_date { get; set; }
        public int begin_time { get; set; }
        public int end_time { get; set; }
        public double comm_limit_price { get; set; }
        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("order_dir", 'I', order_dir);
            packer.AddField("comm_id", 'L', comm_id);
            packer.AddField("ask_exec_qty", 'D', ask_exec_qty);
            packer.AddField("comm_begin_date", 'I', comm_begin_date);
            packer.AddField("comm_end_date", 'I', comm_end_date);
            packer.AddField("begin_time", 'I', begin_time);
            packer.AddField("end_time", 'I', end_time);
            packer.AddField("comm_limit_price", 'D', comm_limit_price);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT,order_dir);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64,comm_id);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASK_EXEC_QTY_FLOAT,ask_exec_qty);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BEGIN_DATE_INT,comm_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_END_DATE_INT,comm_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TIME_INT,begin_time);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_TIME_INT,end_time);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_LIMIT_PRICE_FLOAT,comm_limit_price);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            return fastMsg;
        }
   }

    public class pubL_16_17_Request : BaseRequest, IRequest<pubL_16_17_Response>
    {
        public pubL_16_17_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.16.17";
            }
        }

        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public double last_price { get; set; }
        public double pre_close_price { get; set; }
        public double up_limit_price { get; set; }
        public double down_limit_price { get; set; }
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
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("last_price", 'D', last_price);
            packer.AddField("pre_close_price", 'D', pre_close_price);
            packer.AddField("up_limit_price", 'D', up_limit_price);
            packer.AddField("down_limit_price", 'D', down_limit_price);
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
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT,last_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_CLOSE_PRICE_FLOAT,pre_close_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UP_LIMIT_PRICE_FLOAT,up_limit_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DOWN_LIMIT_PRICE_FLOAT,down_limit_price);
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
            return fastMsg;
        }
   }

    public class pubL_16_18_Request : BaseRequest, IRequest<pubL_16_18_Response>
    {
        public pubL_16_18_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.16.18";
            }
        }

        public String exch_no_str { get; set; }
        public String stock_code_str { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_code_str", 'S', stock_code_str);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR_STR,stock_code_str);
            return fastMsg;
        }
   }

    public class pubL_16_19_Request : BaseRequest, IRequest<pubL_16_19_Response>
    {
        public pubL_16_19_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.16.19";
            }
        }

        public int order_dir { get; set; }
        public ulong comm_id { get; set; }
        public double ask_exec_qty { get; set; }
        public int comm_begin_date { get; set; }
        public int comm_end_date { get; set; }
        public int begin_time { get; set; }
        public int end_time { get; set; }
        public double comm_limit_price { get; set; }
        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("order_dir", 'I', order_dir);
            packer.AddField("comm_id", 'L', comm_id);
            packer.AddField("ask_exec_qty", 'D', ask_exec_qty);
            packer.AddField("comm_begin_date", 'I', comm_begin_date);
            packer.AddField("comm_end_date", 'I', comm_end_date);
            packer.AddField("begin_time", 'I', begin_time);
            packer.AddField("end_time", 'I', end_time);
            packer.AddField("comm_limit_price", 'D', comm_limit_price);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT,order_dir);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64,comm_id);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASK_EXEC_QTY_FLOAT,ask_exec_qty);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BEGIN_DATE_INT,comm_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_END_DATE_INT,comm_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TIME_INT,begin_time);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_TIME_INT,end_time);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_LIMIT_PRICE_FLOAT,comm_limit_price);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            return fastMsg;
        }
   }

}
