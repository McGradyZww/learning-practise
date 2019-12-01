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
    public class tdfutuL_5_1_Request : BaseRequest, IRequest<tdfutuL_5_1_Response>
    {
        public tdfutuL_5_1_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdfutuL.5.1";
            }
        }

        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public int pass_no { get; set; }
        public int exch_no { get; set; }
        public String out_acco { get; set; }
        public String futu_acco { get; set; }
        public String contrc_code { get; set; }
        public int contrc_type { get; set; }
        public int report_date { get; set; }
        public int report_time { get; set; }
        public String report_no { get; set; }
        public ulong order_id { get; set; }
        public double order_price { get; set; }
        public double order_qty { get; set; }
        public int order_dir { get; set; }
        public int contrc_dir { get; set; }
        public int hedge_type { get; set; }
        public String rsp_info { get; set; }
        public String rsp_status { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("out_acco", 'S', out_acco);
            packer.AddField("futu_acco", 'S', futu_acco);
            packer.AddField("contrc_code", 'S', contrc_code);
            packer.AddField("contrc_type", 'I', contrc_type);
            packer.AddField("report_date", 'I', report_date);
            packer.AddField("report_time", 'I', report_time);
            packer.AddField("report_no", 'S', report_no);
            packer.AddField("order_id", 'L', order_id);
            packer.AddField("order_price", 'D', order_price);
            packer.AddField("order_qty", 'D', order_qty);
            packer.AddField("order_dir", 'I', order_dir);
            packer.AddField("contrc_dir", 'I', contrc_dir);
            packer.AddField("hedge_type", 'I', hedge_type);
            packer.AddField("rsp_info", 'S', rsp_info);
            packer.AddField("rsp_status", 'S', rsp_status);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR,out_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_STR,futu_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR,contrc_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT,contrc_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT,report_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_TIME_INT,report_time);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR,report_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64,order_id);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT,order_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT,order_qty);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT,order_dir);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_DIR_INT,contrc_dir);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT,hedge_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RSP_INFO_STR,rsp_info);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RSP_STATUS_STR,rsp_status);
            return fastMsg;
        }
   }

    public class tdfutuL_5_11_Request : BaseRequest, IRequest<tdfutuL_5_11_Response>
    {
        public tdfutuL_5_11_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdfutuL.5.11";
            }
        }

        public int exch_no { get; set; }
        public int pass_no { get; set; }
        public String out_acco { get; set; }
        public ulong order_id { get; set; }
        public int report_date { get; set; }
        public int report_time { get; set; }
        public String report_no { get; set; }
        public double wtdraw_qty { get; set; }
        public String rsp_status { get; set; }
        public String rsp_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("out_acco", 'S', out_acco);
            packer.AddField("order_id", 'L', order_id);
            packer.AddField("report_date", 'I', report_date);
            packer.AddField("report_time", 'I', report_time);
            packer.AddField("report_no", 'S', report_no);
            packer.AddField("wtdraw_qty", 'D', wtdraw_qty);
            packer.AddField("rsp_status", 'S', rsp_status);
            packer.AddField("rsp_info", 'S', rsp_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR,out_acco);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64,order_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT,report_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_TIME_INT,report_time);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR,report_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_QTY_FLOAT,wtdraw_qty);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RSP_STATUS_STR,rsp_status);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RSP_INFO_STR,rsp_info);
            return fastMsg;
        }
   }

    public class tdfutuL_5_21_Request : BaseRequest, IRequest<tdfutuL_5_21_Response>
    {
        public tdfutuL_5_21_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdfutuL.5.21";
            }
        }

        public int pass_no { get; set; }
        public int exch_no { get; set; }
        public String out_acco { get; set; }
        public String futu_acco { get; set; }
        public String contrc_code { get; set; }
        public int contrc_dir { get; set; }
        public int hedge_type { get; set; }
        public int report_date { get; set; }
        public String report_no { get; set; }
        public int strike_date { get; set; }
        public int strike_time { get; set; }
        public String strike_no { get; set; }
        public int order_dir { get; set; }
        public double strike_price { get; set; }
        public double strike_qty { get; set; }
        public double strike_amt { get; set; }
        public String rsp_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("out_acco", 'S', out_acco);
            packer.AddField("futu_acco", 'S', futu_acco);
            packer.AddField("contrc_code", 'S', contrc_code);
            packer.AddField("contrc_dir", 'I', contrc_dir);
            packer.AddField("hedge_type", 'I', hedge_type);
            packer.AddField("report_date", 'I', report_date);
            packer.AddField("report_no", 'S', report_no);
            packer.AddField("strike_date", 'I', strike_date);
            packer.AddField("strike_time", 'I', strike_time);
            packer.AddField("strike_no", 'S', strike_no);
            packer.AddField("order_dir", 'I', order_dir);
            packer.AddField("strike_price", 'D', strike_price);
            packer.AddField("strike_qty", 'D', strike_qty);
            packer.AddField("strike_amt", 'D', strike_amt);
            packer.AddField("rsp_info", 'S', rsp_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR,out_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_STR,futu_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR,contrc_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_DIR_INT,contrc_dir);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT,hedge_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT,report_date);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR,report_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT,strike_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_TIME_INT,strike_time);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR,strike_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT,order_dir);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_PRICE_FLOAT,strike_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT,strike_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT,strike_amt);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RSP_INFO_STR,rsp_info);
            return fastMsg;
        }
   }

    public class tdfutuL_5_31_Request : BaseRequest, IRequest<tdfutuL_5_31_Response>
    {
        public tdfutuL_5_31_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdfutuL.5.31";
            }
        }

        public int pass_no { get; set; }
        public String out_acco { get; set; }
        public int exch_no { get; set; }
        public String futu_acco { get; set; }
        public String contrc_code { get; set; }
        public ulong external_no { get; set; }
        public int contrc_dir { get; set; }
        public int hedge_type { get; set; }
        public int report_date { get; set; }
        public int report_time { get; set; }
        public String report_no { get; set; }
        public int order_dir { get; set; }
        public double order_price { get; set; }
        public double order_qty { get; set; }
        public String order_status { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("out_acco", 'S', out_acco);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("futu_acco", 'S', futu_acco);
            packer.AddField("contrc_code", 'S', contrc_code);
            packer.AddField("external_no", 'L', external_no);
            packer.AddField("contrc_dir", 'I', contrc_dir);
            packer.AddField("hedge_type", 'I', hedge_type);
            packer.AddField("report_date", 'I', report_date);
            packer.AddField("report_time", 'I', report_time);
            packer.AddField("report_no", 'S', report_no);
            packer.AddField("order_dir", 'I', order_dir);
            packer.AddField("order_price", 'D', order_price);
            packer.AddField("order_qty", 'D', order_qty);
            packer.AddField("order_status", 'S', order_status);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR,out_acco);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_STR,futu_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR,contrc_code);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64,external_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_DIR_INT,contrc_dir);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT,hedge_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT,report_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_TIME_INT,report_time);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR,report_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT,order_dir);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT,order_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT,order_qty);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR,order_status);
            return fastMsg;
        }
   }

    public class tdfutuL_5_101_Request : BaseRequest, IRequest<tdfutuL_5_101_Response>
    {
        public tdfutuL_5_101_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdfutuL.5.101";
            }
        }

        public String exch_no_str { get; set; }
        public String futu_acco { get; set; }
        public String contrc_code { get; set; }
        public String order_dir_str { get; set; }
        public String rsp_status_str { get; set; }
        public String deal_status_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("futu_acco", 'S', futu_acco);
            packer.AddField("contrc_code", 'S', contrc_code);
            packer.AddField("order_dir_str", 'S', order_dir_str);
            packer.AddField("rsp_status_str", 'S', rsp_status_str);
            packer.AddField("deal_status_str", 'S', deal_status_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_STR,futu_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR,contrc_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR,order_dir_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RSP_STATUS_STR_STR,rsp_status_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_STATUS_STR_STR,deal_status_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class tdfutuL_5_121_Request : BaseRequest, IRequest<tdfutuL_5_121_Response>
    {
        public tdfutuL_5_121_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdfutuL.5.121";
            }
        }

        public String exch_no_str { get; set; }
        public String futu_acco { get; set; }
        public String contrc_code { get; set; }
        public String order_dir_str { get; set; }
        public String deal_status_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("futu_acco", 'S', futu_acco);
            packer.AddField("contrc_code", 'S', contrc_code);
            packer.AddField("order_dir_str", 'S', order_dir_str);
            packer.AddField("deal_status_str", 'S', deal_status_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_STR,futu_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR,contrc_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR,order_dir_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_STATUS_STR_STR,deal_status_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class tdfutuL_5_122_Request : BaseRequest, IRequest<tdfutuL_5_122_Response>
    {
        public tdfutuL_5_122_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdfutuL.5.122";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public String exch_no_str { get; set; }
        public int pass_no { get; set; }
        public int contrc_code_no { get; set; }
        public String order_dir_str { get; set; }
        public ulong external_no { get; set; }
        public ulong comm_id { get; set; }
        public int comm_batch_no { get; set; }
        public ulong row_id { get; set; }
        public int query_type { get; set; }
        public int sort_type { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("contrc_code_no", 'I', contrc_code_no);
            packer.AddField("order_dir_str", 'S', order_dir_str);
            packer.AddField("external_no", 'L', external_no);
            packer.AddField("comm_id", 'L', comm_id);
            packer.AddField("comm_batch_no", 'I', comm_batch_no);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("query_type", 'I', query_type);
            packer.AddField("sort_type", 'I', sort_type);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR,order_dir_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64,external_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64,comm_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT,comm_batch_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_TYPE_INT,query_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SORT_TYPE_INT,sort_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class tdfutuL_5_123_Request : BaseRequest, IRequest<tdfutuL_5_123_Response>
    {
        public tdfutuL_5_123_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdfutuL.5.123";
            }
        }

        public int begin_date { get; set; }
        public int end_date { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public String exch_no_str { get; set; }
        public int pass_no { get; set; }
        public int contrc_code_no { get; set; }
        public String order_dir_str { get; set; }
        public ulong external_no { get; set; }
        public ulong comm_id { get; set; }
        public int comm_batch_no { get; set; }
        public ulong row_id { get; set; }
        public int query_type { get; set; }
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
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("contrc_code_no", 'I', contrc_code_no);
            packer.AddField("order_dir_str", 'S', order_dir_str);
            packer.AddField("external_no", 'L', external_no);
            packer.AddField("comm_id", 'L', comm_id);
            packer.AddField("comm_batch_no", 'I', comm_batch_no);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("query_type", 'I', query_type);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR,order_dir_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64,external_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64,comm_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT,comm_batch_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_TYPE_INT,query_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

}
