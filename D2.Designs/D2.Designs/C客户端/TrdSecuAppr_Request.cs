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
    public class tdsecuL_3_1_Request : BaseRequest, IRequest<tdsecuL_3_1_Response>
    {
        public tdsecuL_3_1_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.3.1";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public int comm_batch_no { get; set; }
        public int comm_executor { get; set; }
        public int comm_dir { get; set; }
        public int price_kind { get; set; }
        public int ctrl_type { get; set; }
        public double comm_limit_price { get; set; }
        public double limit_actual_price { get; set; }
        public double comm_qty { get; set; }
        public double comm_amt { get; set; }
        public String comm_remark { get; set; }
        public int comm_begin_date { get; set; }
        public int comm_end_date { get; set; }
        public int comm_begin_time { get; set; }
        public int comm_end_time { get; set; }
        public ulong external_no { get; set; }
        public ulong basket_id { get; set; }
        public String comm_oper_way { get; set; }
        public String comm_remark_info { get; set; }
        public String acco_concat_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("comm_batch_no", 'I', comm_batch_no);
            packer.AddField("comm_executor", 'I', comm_executor);
            packer.AddField("comm_dir", 'I', comm_dir);
            packer.AddField("price_kind", 'I', price_kind);
            packer.AddField("ctrl_type", 'I', ctrl_type);
            packer.AddField("comm_limit_price", 'D', comm_limit_price);
            packer.AddField("limit_actual_price", 'D', limit_actual_price);
            packer.AddField("comm_qty", 'D', comm_qty);
            packer.AddField("comm_amt", 'D', comm_amt);
            packer.AddField("comm_remark", 'S', comm_remark);
            packer.AddField("comm_begin_date", 'I', comm_begin_date);
            packer.AddField("comm_end_date", 'I', comm_end_date);
            packer.AddField("comm_begin_time", 'I', comm_begin_time);
            packer.AddField("comm_end_time", 'I', comm_end_time);
            packer.AddField("external_no", 'L', external_no);
            packer.AddField("basket_id", 'L', basket_id);
            packer.AddField("comm_oper_way", 'S', comm_oper_way);
            packer.AddField("comm_remark_info", 'S', comm_remark_info);
            packer.AddField("acco_concat_info", 'S', acco_concat_info);
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
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT,comm_batch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_EXECUTOR_INT,comm_executor);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_INT,comm_dir);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_KIND_INT,price_kind);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CTRL_TYPE_INT,ctrl_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_LIMIT_PRICE_FLOAT,comm_limit_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT,limit_actual_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_QTY_FLOAT,comm_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_AMT_FLOAT,comm_amt);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_REMARK_STR,comm_remark);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BEGIN_DATE_INT,comm_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_END_DATE_INT,comm_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BEGIN_TIME_INT,comm_begin_time);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_END_TIME_INT,comm_end_time);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64,external_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_ID_INT64,basket_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPER_WAY_STR,comm_oper_way);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_REMARK_INFO_STR,comm_remark_info);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_CONCAT_INFO_STR,acco_concat_info);
            return fastMsg;
        }
   }

    public class tdsecuL_3_2_Request : BaseRequest, IRequest<tdsecuL_3_2_Response>
    {
        public tdsecuL_3_2_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.3.2";
            }
        }

        public int exch_no { get; set; }
        public ulong comm_id { get; set; }
        public String cancel_info { get; set; }
        public int is_withdraw { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("comm_id", 'L', comm_id);
            packer.AddField("cancel_info", 'S', cancel_info);
            packer.AddField("is_withdraw", 'I', is_withdraw);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64,comm_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CANCEL_INFO_STR,cancel_info);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_WITHDRAW_INT,is_withdraw);
            return fastMsg;
        }
   }

    public class tdsecuL_3_3_Request : BaseRequest, IRequest<tdsecuL_3_3_Response>
    {
        public tdsecuL_3_3_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.3.3";
            }
        }

        public ulong comm_id { get; set; }
        public int comm_dir { get; set; }
        public double comm_limit_price { get; set; }
        public double limit_actual_price { get; set; }
        public double comm_qty { get; set; }
        public double comm_amt { get; set; }
        public int comm_begin_date { get; set; }
        public int comm_end_date { get; set; }
        public int comm_begin_time { get; set; }
        public int comm_end_time { get; set; }
        public String comm_remark_info { get; set; }
        public int read_flag { get; set; }
        public String modi_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("comm_id", 'L', comm_id);
            packer.AddField("comm_dir", 'I', comm_dir);
            packer.AddField("comm_limit_price", 'D', comm_limit_price);
            packer.AddField("limit_actual_price", 'D', limit_actual_price);
            packer.AddField("comm_qty", 'D', comm_qty);
            packer.AddField("comm_amt", 'D', comm_amt);
            packer.AddField("comm_begin_date", 'I', comm_begin_date);
            packer.AddField("comm_end_date", 'I', comm_end_date);
            packer.AddField("comm_begin_time", 'I', comm_begin_time);
            packer.AddField("comm_end_time", 'I', comm_end_time);
            packer.AddField("comm_remark_info", 'S', comm_remark_info);
            packer.AddField("read_flag", 'I', read_flag);
            packer.AddField("modi_info", 'S', modi_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64,comm_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_INT,comm_dir);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_LIMIT_PRICE_FLOAT,comm_limit_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT,limit_actual_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_QTY_FLOAT,comm_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_AMT_FLOAT,comm_amt);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BEGIN_DATE_INT,comm_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_END_DATE_INT,comm_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BEGIN_TIME_INT,comm_begin_time);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_END_TIME_INT,comm_end_time);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_REMARK_INFO_STR,comm_remark_info);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_READ_FLAG_INT,read_flag);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MODI_INFO_STR,modi_info);
            return fastMsg;
        }
   }

    public class tdsecuL_3_4_Request : BaseRequest, IRequest<tdsecuL_3_4_Response>
    {
        public tdsecuL_3_4_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.3.4";
            }
        }

        public int exch_no { get; set; }
        public ulong comm_id { get; set; }
        public int comm_date { get; set; }
        public String comm_appr_status { get; set; }
        public String comm_appr_remark { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("comm_id", 'L', comm_id);
            packer.AddField("comm_date", 'I', comm_date);
            packer.AddField("comm_appr_status", 'S', comm_appr_status);
            packer.AddField("comm_appr_remark", 'S', comm_appr_remark);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64,comm_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DATE_INT,comm_date);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_STATUS_STR,comm_appr_status);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_REMARK_STR,comm_appr_remark);
            return fastMsg;
        }
   }

    public class tdsecuL_3_5_Request : BaseRequest, IRequest<tdsecuL_3_5_Response>
    {
        public tdsecuL_3_5_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.3.5";
            }
        }

        public int exch_no { get; set; }
        public int co_no { get; set; }
        public int exch_group_no { get; set; }
        public ulong comm_id { get; set; }
        public int comm_executor { get; set; }
        public int is_withdraw { get; set; }
        public String disp_remark { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("comm_id", 'L', comm_id);
            packer.AddField("comm_executor", 'I', comm_executor);
            packer.AddField("is_withdraw", 'I', is_withdraw);
            packer.AddField("disp_remark", 'S', disp_remark);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64,comm_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_EXECUTOR_INT,comm_executor);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_WITHDRAW_INT,is_withdraw);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_DISP_REMARK_STR,disp_remark);
            return fastMsg;
        }
   }

    public class tdsecuL_3_6_Request : BaseRequest, IRequest<tdsecuL_3_6_Response>
    {
        public tdsecuL_3_6_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.3.6";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public String exch_no_str { get; set; }
        public String stock_code_str { get; set; }
        public int comm_batch_no { get; set; }
        public int comm_executor { get; set; }
        public String comm_dir_str { get; set; }
        public int price_kind { get; set; }
        public int ctrl_type { get; set; }
        public String limit_price_str { get; set; }
        public String limit_actual_price_str { get; set; }
        public String comm_qty_str { get; set; }
        public String comm_amt_str { get; set; }
        public String comm_remark { get; set; }
        public int comm_begin_date { get; set; }
        public int comm_end_date { get; set; }
        public int comm_begin_time { get; set; }
        public int comm_end_time { get; set; }
        public ulong basket_id { get; set; }
        public ulong external_no { get; set; }
        public String comm_oper_way { get; set; }
        public String comm_remark_info { get; set; }
        public String acco_concat_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_code_str", 'S', stock_code_str);
            packer.AddField("comm_batch_no", 'I', comm_batch_no);
            packer.AddField("comm_executor", 'I', comm_executor);
            packer.AddField("comm_dir_str", 'S', comm_dir_str);
            packer.AddField("price_kind", 'I', price_kind);
            packer.AddField("ctrl_type", 'I', ctrl_type);
            packer.AddField("limit_price_str", 'S', limit_price_str);
            packer.AddField("limit_actual_price_str", 'S', limit_actual_price_str);
            packer.AddField("comm_qty_str", 'S', comm_qty_str);
            packer.AddField("comm_amt_str", 'S', comm_amt_str);
            packer.AddField("comm_remark", 'S', comm_remark);
            packer.AddField("comm_begin_date", 'I', comm_begin_date);
            packer.AddField("comm_end_date", 'I', comm_end_date);
            packer.AddField("comm_begin_time", 'I', comm_begin_time);
            packer.AddField("comm_end_time", 'I', comm_end_time);
            packer.AddField("basket_id", 'L', basket_id);
            packer.AddField("external_no", 'L', external_no);
            packer.AddField("comm_oper_way", 'S', comm_oper_way);
            packer.AddField("comm_remark_info", 'S', comm_remark_info);
            packer.AddField("acco_concat_info", 'S', acco_concat_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR_STR,stock_code_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT,comm_batch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_EXECUTOR_INT,comm_executor);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_STR_STR,comm_dir_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_KIND_INT,price_kind);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CTRL_TYPE_INT,ctrl_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_LIMIT_PRICE_STR_STR,limit_price_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_LIMIT_ACTUAL_PRICE_STR_STR,limit_actual_price_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_QTY_STR_STR,comm_qty_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_AMT_STR_STR,comm_amt_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_REMARK_STR,comm_remark);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BEGIN_DATE_INT,comm_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_END_DATE_INT,comm_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BEGIN_TIME_INT,comm_begin_time);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_END_TIME_INT,comm_end_time);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_ID_INT64,basket_id);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64,external_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPER_WAY_STR,comm_oper_way);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_REMARK_INFO_STR,comm_remark_info);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_CONCAT_INFO_STR,acco_concat_info);
            return fastMsg;
        }
   }

    public class tdsecuL_3_7_Request : BaseRequest, IRequest<tdsecuL_3_7_Response>
    {
        public tdsecuL_3_7_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.3.7";
            }
        }

        public int co_no { get; set; }
        public int exch_group_no { get; set; }
        public int comm_date { get; set; }
        public int comm_batch_no { get; set; }
        public int comm_executor { get; set; }
        public int is_withdraw { get; set; }
        public String disp_remark { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("comm_date", 'I', comm_date);
            packer.AddField("comm_batch_no", 'I', comm_batch_no);
            packer.AddField("comm_executor", 'I', comm_executor);
            packer.AddField("is_withdraw", 'I', is_withdraw);
            packer.AddField("disp_remark", 'S', disp_remark);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DATE_INT,comm_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT,comm_batch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_EXECUTOR_INT,comm_executor);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_WITHDRAW_INT,is_withdraw);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_DISP_REMARK_STR,disp_remark);
            return fastMsg;
        }
   }

    public class tdsecuL_3_8_Request : BaseRequest, IRequest<tdsecuL_3_8_Response>
    {
        public tdsecuL_3_8_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.3.8";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public String exch_no_str { get; set; }
        public String stock_code_str { get; set; }
        public int comm_batch_no { get; set; }
        public int comm_executor { get; set; }
        public String comm_dir_str { get; set; }
        public int price_kind { get; set; }
        public int ctrl_type { get; set; }
        public String limit_price_str { get; set; }
        public String limit_actual_price_str { get; set; }
        public String comm_qty_str { get; set; }
        public String comm_amt_str { get; set; }
        public String comm_remark { get; set; }
        public int comm_begin_date { get; set; }
        public int comm_end_date { get; set; }
        public int comm_begin_time { get; set; }
        public int comm_end_time { get; set; }
        public ulong basket_id { get; set; }
        public ulong external_no { get; set; }
        public String comm_oper_way { get; set; }
        public double comm_frozen_amt { get; set; }
        public String comm_remark_info { get; set; }
        public String acco_concat_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_code_str", 'S', stock_code_str);
            packer.AddField("comm_batch_no", 'I', comm_batch_no);
            packer.AddField("comm_executor", 'I', comm_executor);
            packer.AddField("comm_dir_str", 'S', comm_dir_str);
            packer.AddField("price_kind", 'I', price_kind);
            packer.AddField("ctrl_type", 'I', ctrl_type);
            packer.AddField("limit_price_str", 'S', limit_price_str);
            packer.AddField("limit_actual_price_str", 'S', limit_actual_price_str);
            packer.AddField("comm_qty_str", 'S', comm_qty_str);
            packer.AddField("comm_amt_str", 'S', comm_amt_str);
            packer.AddField("comm_remark", 'S', comm_remark);
            packer.AddField("comm_begin_date", 'I', comm_begin_date);
            packer.AddField("comm_end_date", 'I', comm_end_date);
            packer.AddField("comm_begin_time", 'I', comm_begin_time);
            packer.AddField("comm_end_time", 'I', comm_end_time);
            packer.AddField("basket_id", 'L', basket_id);
            packer.AddField("external_no", 'L', external_no);
            packer.AddField("comm_oper_way", 'S', comm_oper_way);
            packer.AddField("comm_frozen_amt", 'D', comm_frozen_amt);
            packer.AddField("comm_remark_info", 'S', comm_remark_info);
            packer.AddField("acco_concat_info", 'S', acco_concat_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR_STR,stock_code_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT,comm_batch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_EXECUTOR_INT,comm_executor);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_STR_STR,comm_dir_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_KIND_INT,price_kind);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CTRL_TYPE_INT,ctrl_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_LIMIT_PRICE_STR_STR,limit_price_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_LIMIT_ACTUAL_PRICE_STR_STR,limit_actual_price_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_QTY_STR_STR,comm_qty_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_AMT_STR_STR,comm_amt_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_REMARK_STR,comm_remark);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BEGIN_DATE_INT,comm_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_END_DATE_INT,comm_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BEGIN_TIME_INT,comm_begin_time);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_END_TIME_INT,comm_end_time);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_ID_INT64,basket_id);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64,external_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPER_WAY_STR,comm_oper_way);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_FROZEN_AMT_FLOAT,comm_frozen_amt);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_REMARK_INFO_STR,comm_remark_info);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_CONCAT_INFO_STR,acco_concat_info);
            return fastMsg;
        }
   }

    public class tdsecuL_3_9_Request : BaseRequest, IRequest<tdsecuL_3_9_Response>
    {
        public tdsecuL_3_9_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.3.9";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public String combo_code { get; set; }
        public double combo_copies { get; set; }
        public String exch_no_str { get; set; }
        public String stock_code_str { get; set; }
        public String target_stock_code_str { get; set; }
        public int comm_batch_no { get; set; }
        public int comm_executor { get; set; }
        public int comm_begin_date { get; set; }
        public int comm_end_date { get; set; }
        public int comm_begin_time { get; set; }
        public int comm_end_time { get; set; }
        public int order_batch_no { get; set; }
        public String comm_dir_str { get; set; }
        public String price_type_str { get; set; }
        public String comm_qty_str { get; set; }
        public String limit_price_str { get; set; }
        public String limit_actual_price_str { get; set; }
        public String comm_amt_str { get; set; }
        public String comm_oper_way { get; set; }
        public ulong basket_id { get; set; }
        public String combo_posi_id_str { get; set; }
        public String acco_concat_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("combo_code", 'S', combo_code);
            packer.AddField("combo_copies", 'D', combo_copies);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_code_str", 'S', stock_code_str);
            packer.AddField("target_stock_code_str", 'S', target_stock_code_str);
            packer.AddField("comm_batch_no", 'I', comm_batch_no);
            packer.AddField("comm_executor", 'I', comm_executor);
            packer.AddField("comm_begin_date", 'I', comm_begin_date);
            packer.AddField("comm_end_date", 'I', comm_end_date);
            packer.AddField("comm_begin_time", 'I', comm_begin_time);
            packer.AddField("comm_end_time", 'I', comm_end_time);
            packer.AddField("order_batch_no", 'I', order_batch_no);
            packer.AddField("comm_dir_str", 'S', comm_dir_str);
            packer.AddField("price_type_str", 'S', price_type_str);
            packer.AddField("comm_qty_str", 'S', comm_qty_str);
            packer.AddField("limit_price_str", 'S', limit_price_str);
            packer.AddField("limit_actual_price_str", 'S', limit_actual_price_str);
            packer.AddField("comm_amt_str", 'S', comm_amt_str);
            packer.AddField("comm_oper_way", 'S', comm_oper_way);
            packer.AddField("basket_id", 'L', basket_id);
            packer.AddField("combo_posi_id_str", 'S', combo_posi_id_str);
            packer.AddField("acco_concat_info", 'S', acco_concat_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_CODE_STR,combo_code);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_COPIES_FLOAT,combo_copies);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR_STR,stock_code_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_STOCK_CODE_STR_STR,target_stock_code_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT,comm_batch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_EXECUTOR_INT,comm_executor);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BEGIN_DATE_INT,comm_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_END_DATE_INT,comm_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BEGIN_TIME_INT,comm_begin_time);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_END_TIME_INT,comm_end_time);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT,order_batch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_STR_STR,comm_dir_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_STR_STR,price_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_QTY_STR_STR,comm_qty_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_LIMIT_PRICE_STR_STR,limit_price_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_LIMIT_ACTUAL_PRICE_STR_STR,limit_actual_price_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_AMT_STR_STR,comm_amt_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPER_WAY_STR,comm_oper_way);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_ID_INT64,basket_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_POSI_ID_STR_STR,combo_posi_id_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_CONCAT_INFO_STR,acco_concat_info);
            return fastMsg;
        }
   }

    public class tdsecuL_3_51_Request : BaseRequest, IRequest<tdsecuL_3_51_Response>
    {
        public tdsecuL_3_51_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.3.51";
            }
        }

        public ulong comm_id { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public int comm_opor { get; set; }
        public int comm_executor { get; set; }
        public int comm_appr_oper { get; set; }
        public String comm_appr_status_str { get; set; }
        public String exch_no_str { get; set; }
        public int stock_code_no { get; set; }
        public String stock_type_str { get; set; }
        public String asset_type_str { get; set; }
        public String comm_dir_str { get; set; }
        public String comm_status_str { get; set; }
        public String strike_status_str { get; set; }
        public ulong basket_id { get; set; }
        public String comm_oper_way { get; set; }
        public int exter_comm_flag { get; set; }
        public int comm_comple_flag { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public int sort_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("comm_id", 'L', comm_id);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("comm_opor", 'I', comm_opor);
            packer.AddField("comm_executor", 'I', comm_executor);
            packer.AddField("comm_appr_oper", 'I', comm_appr_oper);
            packer.AddField("comm_appr_status_str", 'S', comm_appr_status_str);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("stock_type_str", 'S', stock_type_str);
            packer.AddField("asset_type_str", 'S', asset_type_str);
            packer.AddField("comm_dir_str", 'S', comm_dir_str);
            packer.AddField("comm_status_str", 'S', comm_status_str);
            packer.AddField("strike_status_str", 'S', strike_status_str);
            packer.AddField("basket_id", 'L', basket_id);
            packer.AddField("comm_oper_way", 'S', comm_oper_way);
            packer.AddField("exter_comm_flag", 'I', exter_comm_flag);
            packer.AddField("comm_comple_flag", 'I', comm_comple_flag);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
            packer.AddField("sort_type", 'I', sort_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64,comm_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPOR_INT,comm_opor);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_EXECUTOR_INT,comm_executor);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_OPER_INT,comm_appr_oper);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_STATUS_STR_STR,comm_appr_status_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_STR_STR,stock_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_STR_STR,asset_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_STR_STR,comm_dir_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_STATUS_STR_STR,comm_status_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_STATUS_STR_STR,strike_status_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_ID_INT64,basket_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPER_WAY_STR,comm_oper_way);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXTER_COMM_FLAG_INT,exter_comm_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_COMPLE_FLAG_INT,comm_comple_flag);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SORT_TYPE_INT,sort_type);
            return fastMsg;
        }
   }

    public class tdsecuL_3_52_Request : BaseRequest, IRequest<tdsecuL_3_52_Response>
    {
        public tdsecuL_3_52_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.3.52";
            }
        }

        public int begin_date { get; set; }
        public int end_date { get; set; }
        public ulong comm_id { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public int comm_opor { get; set; }
        public int comm_executor { get; set; }
        public int comm_appr_oper { get; set; }
        public String comm_appr_status_str { get; set; }
        public String exch_no_str { get; set; }
        public int stock_code_no { get; set; }
        public String stock_type_str { get; set; }
        public String asset_type_str { get; set; }
        public String comm_dir_str { get; set; }
        public String comm_status_str { get; set; }
        public String strike_status_str { get; set; }
        public ulong basket_id { get; set; }
        public String comm_oper_way { get; set; }
        public int exter_comm_flag { get; set; }
        public int comm_comple_flag { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("comm_id", 'L', comm_id);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("comm_opor", 'I', comm_opor);
            packer.AddField("comm_executor", 'I', comm_executor);
            packer.AddField("comm_appr_oper", 'I', comm_appr_oper);
            packer.AddField("comm_appr_status_str", 'S', comm_appr_status_str);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("stock_type_str", 'S', stock_type_str);
            packer.AddField("asset_type_str", 'S', asset_type_str);
            packer.AddField("comm_dir_str", 'S', comm_dir_str);
            packer.AddField("comm_status_str", 'S', comm_status_str);
            packer.AddField("strike_status_str", 'S', strike_status_str);
            packer.AddField("basket_id", 'L', basket_id);
            packer.AddField("comm_oper_way", 'S', comm_oper_way);
            packer.AddField("exter_comm_flag", 'I', exter_comm_flag);
            packer.AddField("comm_comple_flag", 'I', comm_comple_flag);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT,end_date);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64,comm_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPOR_INT,comm_opor);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_EXECUTOR_INT,comm_executor);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_OPER_INT,comm_appr_oper);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_STATUS_STR_STR,comm_appr_status_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_STR_STR,stock_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_STR_STR,asset_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_STR_STR,comm_dir_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_STATUS_STR_STR,comm_status_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_STATUS_STR_STR,strike_status_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_ID_INT64,basket_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPER_WAY_STR,comm_oper_way);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXTER_COMM_FLAG_INT,exter_comm_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_COMPLE_FLAG_INT,comm_comple_flag);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class tdsecuL_3_53_Request : BaseRequest, IRequest<tdsecuL_3_53_Response>
    {
        public tdsecuL_3_53_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.3.53";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public String exch_no_str { get; set; }
        public int stock_code_no { get; set; }
        public String stock_type_str { get; set; }
        public int disp_opor { get; set; }
        public int before_comm_executor { get; set; }
        public int comm_executor { get; set; }
        public ulong comm_id { get; set; }
        public String comm_dir_str { get; set; }
        public int exter_comm_flag { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public int sort_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("stock_type_str", 'S', stock_type_str);
            packer.AddField("disp_opor", 'I', disp_opor);
            packer.AddField("before_comm_executor", 'I', before_comm_executor);
            packer.AddField("comm_executor", 'I', comm_executor);
            packer.AddField("comm_id", 'L', comm_id);
            packer.AddField("comm_dir_str", 'S', comm_dir_str);
            packer.AddField("exter_comm_flag", 'I', exter_comm_flag);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
            packer.AddField("sort_type", 'I', sort_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_STR_STR,stock_type_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DISP_OPOR_INT,disp_opor);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEFORE_COMM_EXECUTOR_INT,before_comm_executor);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_EXECUTOR_INT,comm_executor);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64,comm_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_STR_STR,comm_dir_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXTER_COMM_FLAG_INT,exter_comm_flag);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SORT_TYPE_INT,sort_type);
            return fastMsg;
        }
   }

    public class tdsecuL_3_54_Request : BaseRequest, IRequest<tdsecuL_3_54_Response>
    {
        public tdsecuL_3_54_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.3.54";
            }
        }

        public int begin_date { get; set; }
        public int end_date { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public String exch_no_str { get; set; }
        public int stock_code_no { get; set; }
        public String stock_type_str { get; set; }
        public int disp_opor { get; set; }
        public int before_comm_executor { get; set; }
        public int comm_executor { get; set; }
        public ulong comm_id { get; set; }
        public String comm_dir_str { get; set; }
        public int exter_comm_flag { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("stock_type_str", 'S', stock_type_str);
            packer.AddField("disp_opor", 'I', disp_opor);
            packer.AddField("before_comm_executor", 'I', before_comm_executor);
            packer.AddField("comm_executor", 'I', comm_executor);
            packer.AddField("comm_id", 'L', comm_id);
            packer.AddField("comm_dir_str", 'S', comm_dir_str);
            packer.AddField("exter_comm_flag", 'I', exter_comm_flag);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_STR_STR,stock_type_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DISP_OPOR_INT,disp_opor);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEFORE_COMM_EXECUTOR_INT,before_comm_executor);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_EXECUTOR_INT,comm_executor);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64,comm_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_STR_STR,comm_dir_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXTER_COMM_FLAG_INT,exter_comm_flag);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class tdsecuL_3_55_Request : BaseRequest, IRequest<tdsecuL_3_55_Response>
    {
        public tdsecuL_3_55_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.3.55";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public String exch_no_str { get; set; }
        public int stock_code_no { get; set; }
        public String stock_type_str { get; set; }
        public ulong comm_id { get; set; }
        public int comm_opor { get; set; }
        public String comm_dir_str { get; set; }
        public int comm_appr_oper { get; set; }
        public int exter_comm_flag { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public int sort_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("stock_type_str", 'S', stock_type_str);
            packer.AddField("comm_id", 'L', comm_id);
            packer.AddField("comm_opor", 'I', comm_opor);
            packer.AddField("comm_dir_str", 'S', comm_dir_str);
            packer.AddField("comm_appr_oper", 'I', comm_appr_oper);
            packer.AddField("exter_comm_flag", 'I', exter_comm_flag);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
            packer.AddField("sort_type", 'I', sort_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_STR_STR,stock_type_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64,comm_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPOR_INT,comm_opor);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_STR_STR,comm_dir_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_OPER_INT,comm_appr_oper);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXTER_COMM_FLAG_INT,exter_comm_flag);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SORT_TYPE_INT,sort_type);
            return fastMsg;
        }
   }

    public class tdsecuL_3_56_Request : BaseRequest, IRequest<tdsecuL_3_56_Response>
    {
        public tdsecuL_3_56_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.3.56";
            }
        }

        public int begin_date { get; set; }
        public int end_date { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public String exch_no_str { get; set; }
        public int stock_code_no { get; set; }
        public String stock_type_str { get; set; }
        public ulong comm_id { get; set; }
        public int comm_opor { get; set; }
        public String comm_dir_str { get; set; }
        public int comm_appr_oper { get; set; }
        public int exter_comm_flag { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("stock_type_str", 'S', stock_type_str);
            packer.AddField("comm_id", 'L', comm_id);
            packer.AddField("comm_opor", 'I', comm_opor);
            packer.AddField("comm_dir_str", 'S', comm_dir_str);
            packer.AddField("comm_appr_oper", 'I', comm_appr_oper);
            packer.AddField("exter_comm_flag", 'I', exter_comm_flag);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_STR_STR,stock_type_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64,comm_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPOR_INT,comm_opor);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_STR_STR,comm_dir_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_OPER_INT,comm_appr_oper);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXTER_COMM_FLAG_INT,exter_comm_flag);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class tdsecuL_3_57_Request : BaseRequest, IRequest<tdsecuL_3_57_Response>
    {
        public tdsecuL_3_57_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.3.57";
            }
        }

        public int comm_date { get; set; }
        public int comm_batch_no { get; set; }
        public int comm_opor { get; set; }
        public int comm_executor { get; set; }
        public String comm_sum_appr_status_str { get; set; }
        public String exch_no_str { get; set; }
        public int stock_code_no { get; set; }
        public String stock_type_str { get; set; }
        public String asset_type_str { get; set; }
        public String comm_dir_str { get; set; }
        public String comm_sum_status_str { get; set; }
        public String strike_status_str { get; set; }
        public ulong basket_id { get; set; }
        public String comm_oper_way { get; set; }
        public int exter_comm_flag { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public int sort_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("comm_date", 'I', comm_date);
            packer.AddField("comm_batch_no", 'I', comm_batch_no);
            packer.AddField("comm_opor", 'I', comm_opor);
            packer.AddField("comm_executor", 'I', comm_executor);
            packer.AddField("comm_sum_appr_status_str", 'S', comm_sum_appr_status_str);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("stock_type_str", 'S', stock_type_str);
            packer.AddField("asset_type_str", 'S', asset_type_str);
            packer.AddField("comm_dir_str", 'S', comm_dir_str);
            packer.AddField("comm_sum_status_str", 'S', comm_sum_status_str);
            packer.AddField("strike_status_str", 'S', strike_status_str);
            packer.AddField("basket_id", 'L', basket_id);
            packer.AddField("comm_oper_way", 'S', comm_oper_way);
            packer.AddField("exter_comm_flag", 'I', exter_comm_flag);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
            packer.AddField("sort_type", 'I', sort_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DATE_INT,comm_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT,comm_batch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPOR_INT,comm_opor);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_EXECUTOR_INT,comm_executor);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_SUM_APPR_STATUS_STR_STR,comm_sum_appr_status_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_STR_STR,stock_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_STR_STR,asset_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_STR_STR,comm_dir_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_SUM_STATUS_STR_STR,comm_sum_status_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_STATUS_STR_STR,strike_status_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_ID_INT64,basket_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPER_WAY_STR,comm_oper_way);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXTER_COMM_FLAG_INT,exter_comm_flag);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SORT_TYPE_INT,sort_type);
            return fastMsg;
        }
   }

    public class tdsecuL_3_58_Request : BaseRequest, IRequest<tdsecuL_3_58_Response>
    {
        public tdsecuL_3_58_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.3.58";
            }
        }

        public int begin_date { get; set; }
        public int end_date { get; set; }
        public int comm_date { get; set; }
        public int comm_batch_no { get; set; }
        public int comm_opor { get; set; }
        public int comm_executor { get; set; }
        public String comm_sum_appr_status_str { get; set; }
        public String exch_no_str { get; set; }
        public int stock_code_no { get; set; }
        public String stock_type_str { get; set; }
        public String asset_type_str { get; set; }
        public String comm_dir_str { get; set; }
        public String comm_sum_status_str { get; set; }
        public String strike_status_str { get; set; }
        public ulong basket_id { get; set; }
        public String comm_oper_way { get; set; }
        public int exter_comm_flag { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("comm_date", 'I', comm_date);
            packer.AddField("comm_batch_no", 'I', comm_batch_no);
            packer.AddField("comm_opor", 'I', comm_opor);
            packer.AddField("comm_executor", 'I', comm_executor);
            packer.AddField("comm_sum_appr_status_str", 'S', comm_sum_appr_status_str);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("stock_type_str", 'S', stock_type_str);
            packer.AddField("asset_type_str", 'S', asset_type_str);
            packer.AddField("comm_dir_str", 'S', comm_dir_str);
            packer.AddField("comm_sum_status_str", 'S', comm_sum_status_str);
            packer.AddField("strike_status_str", 'S', strike_status_str);
            packer.AddField("basket_id", 'L', basket_id);
            packer.AddField("comm_oper_way", 'S', comm_oper_way);
            packer.AddField("exter_comm_flag", 'I', exter_comm_flag);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT,end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DATE_INT,comm_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT,comm_batch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPOR_INT,comm_opor);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_EXECUTOR_INT,comm_executor);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_SUM_APPR_STATUS_STR_STR,comm_sum_appr_status_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_STR_STR,stock_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_STR_STR,asset_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_STR_STR,comm_dir_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_SUM_STATUS_STR_STR,comm_sum_status_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_STATUS_STR_STR,strike_status_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_ID_INT64,basket_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPER_WAY_STR,comm_oper_way);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXTER_COMM_FLAG_INT,exter_comm_flag);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class tdsecuL_3_59_Request : BaseRequest, IRequest<tdsecuL_3_59_Response>
    {
        public tdsecuL_3_59_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.3.59";
            }
        }

        public String comm_id_str { get; set; }
        public String exch_no_str { get; set; }
        public int co_no { get; set; }
        public String stock_code_str { get; set; }
        public int comm_date { get; set; }
        public int comm_batch_no { get; set; }
        public int comm_executor { get; set; }
        public String comm_dir_str { get; set; }
        public String comm_qty_str { get; set; }
        public String limit_price_str { get; set; }
        public int is_withdraw { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("comm_id_str", 'S', comm_id_str);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("stock_code_str", 'S', stock_code_str);
            packer.AddField("comm_date", 'I', comm_date);
            packer.AddField("comm_batch_no", 'I', comm_batch_no);
            packer.AddField("comm_executor", 'I', comm_executor);
            packer.AddField("comm_dir_str", 'S', comm_dir_str);
            packer.AddField("comm_qty_str", 'S', comm_qty_str);
            packer.AddField("limit_price_str", 'S', limit_price_str);
            packer.AddField("is_withdraw", 'I', is_withdraw);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_STR_STR,comm_id_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR_STR,stock_code_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DATE_INT,comm_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT,comm_batch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_EXECUTOR_INT,comm_executor);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_STR_STR,comm_dir_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_QTY_STR_STR,comm_qty_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_LIMIT_PRICE_STR_STR,limit_price_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_WITHDRAW_INT,is_withdraw);
            return fastMsg;
        }
   }

    public class tdsecuL_3_60_Request : BaseRequest, IRequest<tdsecuL_3_60_Response>
    {
        public tdsecuL_3_60_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.3.60";
            }
        }

        public int comm_date { get; set; }
        public int co_no { get; set; }
        public int comm_batch_no { get; set; }
        public int comm_executor { get; set; }
        public int is_withdraw { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("comm_date", 'I', comm_date);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("comm_batch_no", 'I', comm_batch_no);
            packer.AddField("comm_executor", 'I', comm_executor);
            packer.AddField("is_withdraw", 'I', is_withdraw);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DATE_INT,comm_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT,comm_batch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_EXECUTOR_INT,comm_executor);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_WITHDRAW_INT,is_withdraw);
            return fastMsg;
        }
   }

    public class tdsecuL_3_61_Request : BaseRequest, IRequest<tdsecuL_3_61_Response>
    {
        public tdsecuL_3_61_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.3.61";
            }
        }

        public String comm_id_str { get; set; }
        public String exch_no_str { get; set; }
        public int co_no { get; set; }
        public String stock_code_str { get; set; }
        public int comm_date { get; set; }
        public int comm_batch_no { get; set; }
        public int comm_executor { get; set; }
        public String comm_dir_str { get; set; }
        public String comm_qty_str { get; set; }
        public String limit_price_str { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("comm_id_str", 'S', comm_id_str);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("stock_code_str", 'S', stock_code_str);
            packer.AddField("comm_date", 'I', comm_date);
            packer.AddField("comm_batch_no", 'I', comm_batch_no);
            packer.AddField("comm_executor", 'I', comm_executor);
            packer.AddField("comm_dir_str", 'S', comm_dir_str);
            packer.AddField("comm_qty_str", 'S', comm_qty_str);
            packer.AddField("limit_price_str", 'S', limit_price_str);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_STR_STR,comm_id_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR_STR,stock_code_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DATE_INT,comm_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT,comm_batch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_EXECUTOR_INT,comm_executor);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_STR_STR,comm_dir_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_QTY_STR_STR,comm_qty_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_LIMIT_PRICE_STR_STR,limit_price_str);
            return fastMsg;
        }
   }

    public class tdsecuL_3_62_Request : BaseRequest, IRequest<tdsecuL_3_62_Response>
    {
        public tdsecuL_3_62_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.3.62";
            }
        }

        public int comm_date { get; set; }
        public int co_no { get; set; }
        public int comm_batch_no { get; set; }
        public int comm_executor { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("comm_date", 'I', comm_date);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("comm_batch_no", 'I', comm_batch_no);
            packer.AddField("comm_executor", 'I', comm_executor);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DATE_INT,comm_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT,comm_batch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_EXECUTOR_INT,comm_executor);
            return fastMsg;
        }
   }

    public class tdsecuL_3_63_Request : BaseRequest, IRequest<tdsecuL_3_63_Response>
    {
        public tdsecuL_3_63_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.3.63";
            }
        }

        public int exch_no { get; set; }
        public int co_no { get; set; }
        public int exch_group_no { get; set; }
        public ulong comm_id { get; set; }
        public int comm_executor { get; set; }
        public int is_withdraw { get; set; }
        public String disp_remark { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("comm_id", 'L', comm_id);
            packer.AddField("comm_executor", 'I', comm_executor);
            packer.AddField("is_withdraw", 'I', is_withdraw);
            packer.AddField("disp_remark", 'S', disp_remark);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64,comm_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_EXECUTOR_INT,comm_executor);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_WITHDRAW_INT,is_withdraw);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_DISP_REMARK_STR,disp_remark);
            return fastMsg;
        }
   }

    public class tdsecuL_3_64_Request : BaseRequest, IRequest<tdsecuL_3_64_Response>
    {
        public tdsecuL_3_64_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.3.64";
            }
        }

        public ulong row_id { get; set; }
        public int exch_no { get; set; }
        public ulong comm_id { get; set; }
        public int comm_date { get; set; }
        public String comm_dispense_appr_status { get; set; }
        public String comm_dispense_appr_remark { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("comm_id", 'L', comm_id);
            packer.AddField("comm_date", 'I', comm_date);
            packer.AddField("comm_dispense_appr_status", 'S', comm_dispense_appr_status);
            packer.AddField("comm_dispense_appr_remark", 'S', comm_dispense_appr_remark);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64,comm_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DATE_INT,comm_date);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DISPENSE_APPR_STATUS_STR,comm_dispense_appr_status);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DISPENSE_APPR_REMARK_STR,comm_dispense_appr_remark);
            return fastMsg;
        }
   }

    public class tdsecuL_3_65_Request : BaseRequest, IRequest<tdsecuL_3_65_Response>
    {
        public tdsecuL_3_65_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.3.65";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public ulong comm_id { get; set; }
        public String comm_disp_appr_remark_str { get; set; }
        public String exch_no_str { get; set; }
        public int stock_code_no { get; set; }
        public String comm_dir_str { get; set; }
        public String comm_status_str { get; set; }
        public String strike_status_str { get; set; }
        public String comm_oper_way { get; set; }
        public int exter_comm_flag { get; set; }
        public int comm_comple_flag { get; set; }
        public ulong row_id { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("comm_id", 'L', comm_id);
            packer.AddField("comm_disp_appr_remark_str", 'S', comm_disp_appr_remark_str);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("comm_dir_str", 'S', comm_dir_str);
            packer.AddField("comm_status_str", 'S', comm_status_str);
            packer.AddField("strike_status_str", 'S', strike_status_str);
            packer.AddField("comm_oper_way", 'S', comm_oper_way);
            packer.AddField("exter_comm_flag", 'I', exter_comm_flag);
            packer.AddField("comm_comple_flag", 'I', comm_comple_flag);
            packer.AddField("row_id", 'L', row_id);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64,comm_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DISP_APPR_REMARK_STR_STR,comm_disp_appr_remark_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_STR_STR,comm_dir_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_STATUS_STR_STR,comm_status_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_STATUS_STR_STR,strike_status_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPER_WAY_STR,comm_oper_way);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXTER_COMM_FLAG_INT,exter_comm_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_COMPLE_FLAG_INT,comm_comple_flag);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            return fastMsg;
        }
   }

    public class tdsecuL_3_66_Request : BaseRequest, IRequest<tdsecuL_3_66_Response>
    {
        public tdsecuL_3_66_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.3.66";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public int comm_batch_no { get; set; }
        public int comm_executor { get; set; }
        public int comm_dir { get; set; }
        public int price_kind { get; set; }
        public int ctrl_type { get; set; }
        public double comm_limit_price { get; set; }
        public double limit_actual_price { get; set; }
        public double comm_qty { get; set; }
        public double comm_amt { get; set; }
        public String comm_remark { get; set; }
        public int comm_begin_date { get; set; }
        public int comm_end_date { get; set; }
        public int comm_begin_time { get; set; }
        public int comm_end_time { get; set; }
        public ulong external_no { get; set; }
        public ulong basket_id { get; set; }
        public String comm_oper_way { get; set; }
        public String contra_no { get; set; }
        public String comm_remark_info { get; set; }
        public String acco_concat_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("comm_batch_no", 'I', comm_batch_no);
            packer.AddField("comm_executor", 'I', comm_executor);
            packer.AddField("comm_dir", 'I', comm_dir);
            packer.AddField("price_kind", 'I', price_kind);
            packer.AddField("ctrl_type", 'I', ctrl_type);
            packer.AddField("comm_limit_price", 'D', comm_limit_price);
            packer.AddField("limit_actual_price", 'D', limit_actual_price);
            packer.AddField("comm_qty", 'D', comm_qty);
            packer.AddField("comm_amt", 'D', comm_amt);
            packer.AddField("comm_remark", 'S', comm_remark);
            packer.AddField("comm_begin_date", 'I', comm_begin_date);
            packer.AddField("comm_end_date", 'I', comm_end_date);
            packer.AddField("comm_begin_time", 'I', comm_begin_time);
            packer.AddField("comm_end_time", 'I', comm_end_time);
            packer.AddField("external_no", 'L', external_no);
            packer.AddField("basket_id", 'L', basket_id);
            packer.AddField("comm_oper_way", 'S', comm_oper_way);
            packer.AddField("contra_no", 'S', contra_no);
            packer.AddField("comm_remark_info", 'S', comm_remark_info);
            packer.AddField("acco_concat_info", 'S', acco_concat_info);
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
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT,comm_batch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_EXECUTOR_INT,comm_executor);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_INT,comm_dir);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_KIND_INT,price_kind);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CTRL_TYPE_INT,ctrl_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_LIMIT_PRICE_FLOAT,comm_limit_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT,limit_actual_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_QTY_FLOAT,comm_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_AMT_FLOAT,comm_amt);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_REMARK_STR,comm_remark);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BEGIN_DATE_INT,comm_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_END_DATE_INT,comm_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BEGIN_TIME_INT,comm_begin_time);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_END_TIME_INT,comm_end_time);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64,external_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_ID_INT64,basket_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPER_WAY_STR,comm_oper_way);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRA_NO_STR,contra_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_REMARK_INFO_STR,comm_remark_info);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_CONCAT_INFO_STR,acco_concat_info);
            return fastMsg;
        }
   }

    public class tdsecuL_3_67_Request : BaseRequest, IRequest<tdsecuL_3_67_Response>
    {
        public tdsecuL_3_67_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.3.67";
            }
        }

        public int exch_no { get; set; }
        public ulong comm_id { get; set; }
        public String cancel_info { get; set; }
        public int is_withdraw { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("comm_id", 'L', comm_id);
            packer.AddField("cancel_info", 'S', cancel_info);
            packer.AddField("is_withdraw", 'I', is_withdraw);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64,comm_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CANCEL_INFO_STR,cancel_info);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_WITHDRAW_INT,is_withdraw);
            return fastMsg;
        }
   }

    public class tdsecuL_3_68_Request : BaseRequest, IRequest<tdsecuL_3_68_Response>
    {
        public tdsecuL_3_68_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.3.68";
            }
        }

        public int exch_no { get; set; }
        public ulong comm_id { get; set; }
        public int comm_date { get; set; }
        public String comm_appr_status { get; set; }
        public String comm_appr_remark { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("comm_id", 'L', comm_id);
            packer.AddField("comm_date", 'I', comm_date);
            packer.AddField("comm_appr_status", 'S', comm_appr_status);
            packer.AddField("comm_appr_remark", 'S', comm_appr_remark);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64,comm_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DATE_INT,comm_date);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_STATUS_STR,comm_appr_status);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_REMARK_STR,comm_appr_remark);
            return fastMsg;
        }
   }

    public class tdsecuL_3_69_Request : BaseRequest, IRequest<tdsecuL_3_69_Response>
    {
        public tdsecuL_3_69_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.3.69";
            }
        }

        public int exch_no { get; set; }
        public int co_no { get; set; }
        public int exch_group_no { get; set; }
        public ulong comm_id { get; set; }
        public int comm_executor { get; set; }
        public int is_withdraw { get; set; }
        public String disp_remark { get; set; }
        public int disp_status { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("comm_id", 'L', comm_id);
            packer.AddField("comm_executor", 'I', comm_executor);
            packer.AddField("is_withdraw", 'I', is_withdraw);
            packer.AddField("disp_remark", 'S', disp_remark);
            packer.AddField("disp_status", 'I', disp_status);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64,comm_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_EXECUTOR_INT,comm_executor);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_WITHDRAW_INT,is_withdraw);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_DISP_REMARK_STR,disp_remark);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DISP_STATUS_INT,disp_status);
            return fastMsg;
        }
   }

    public class tdsecuL_3_70_Request : BaseRequest, IRequest<tdsecuL_3_70_Response>
    {
        public tdsecuL_3_70_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.3.70";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public String combo_code { get; set; }
        public int comm_batch_no { get; set; }
        public int comm_executor { get; set; }
        public int comm_dir { get; set; }
        public int price_kind { get; set; }
        public int ctrl_type { get; set; }
        public double comm_limit_price { get; set; }
        public double limit_actual_price { get; set; }
        public double comm_qty { get; set; }
        public double comm_amt { get; set; }
        public String comm_remark { get; set; }
        public int comm_begin_date { get; set; }
        public int comm_end_date { get; set; }
        public int comm_begin_time { get; set; }
        public int comm_end_time { get; set; }
        public ulong external_no { get; set; }
        public ulong basket_id { get; set; }
        public String comm_oper_way { get; set; }
        public String comm_remark_info { get; set; }
        public String acco_concat_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("combo_code", 'S', combo_code);
            packer.AddField("comm_batch_no", 'I', comm_batch_no);
            packer.AddField("comm_executor", 'I', comm_executor);
            packer.AddField("comm_dir", 'I', comm_dir);
            packer.AddField("price_kind", 'I', price_kind);
            packer.AddField("ctrl_type", 'I', ctrl_type);
            packer.AddField("comm_limit_price", 'D', comm_limit_price);
            packer.AddField("limit_actual_price", 'D', limit_actual_price);
            packer.AddField("comm_qty", 'D', comm_qty);
            packer.AddField("comm_amt", 'D', comm_amt);
            packer.AddField("comm_remark", 'S', comm_remark);
            packer.AddField("comm_begin_date", 'I', comm_begin_date);
            packer.AddField("comm_end_date", 'I', comm_end_date);
            packer.AddField("comm_begin_time", 'I', comm_begin_time);
            packer.AddField("comm_end_time", 'I', comm_end_time);
            packer.AddField("external_no", 'L', external_no);
            packer.AddField("basket_id", 'L', basket_id);
            packer.AddField("comm_oper_way", 'S', comm_oper_way);
            packer.AddField("comm_remark_info", 'S', comm_remark_info);
            packer.AddField("acco_concat_info", 'S', acco_concat_info);
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
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_CODE_STR,combo_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT,comm_batch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_EXECUTOR_INT,comm_executor);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_INT,comm_dir);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_KIND_INT,price_kind);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CTRL_TYPE_INT,ctrl_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_LIMIT_PRICE_FLOAT,comm_limit_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT,limit_actual_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_QTY_FLOAT,comm_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_AMT_FLOAT,comm_amt);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_REMARK_STR,comm_remark);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BEGIN_DATE_INT,comm_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_END_DATE_INT,comm_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BEGIN_TIME_INT,comm_begin_time);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_END_TIME_INT,comm_end_time);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64,external_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_ID_INT64,basket_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPER_WAY_STR,comm_oper_way);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_REMARK_INFO_STR,comm_remark_info);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_CONCAT_INFO_STR,acco_concat_info);
            return fastMsg;
        }
   }

}
