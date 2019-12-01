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
    public class tdfutuL_4_11_Request : BaseRequest, IRequest<tdfutuL_4_11_Response>
    {
        public tdfutuL_4_11_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdfutuL.4.11";
            }
        }

        public int comm_opor { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public int exch_no { get; set; }
        public String contrc_code { get; set; }
        public String contrc_name { get; set; }
        public int contrc_dir { get; set; }
        public int hedge_type { get; set; }
        public ulong external_no { get; set; }
        public ulong comm_id { get; set; }
        public int order_batch_no { get; set; }
        public int order_dir { get; set; }
        public double order_qty { get; set; }
        public double order_price { get; set; }
        public String order_oper_way { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("comm_opor", 'I', comm_opor);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("contrc_code", 'S', contrc_code);
            packer.AddField("contrc_name", 'S', contrc_name);
            packer.AddField("contrc_dir", 'I', contrc_dir);
            packer.AddField("hedge_type", 'I', hedge_type);
            packer.AddField("external_no", 'L', external_no);
            packer.AddField("comm_id", 'L', comm_id);
            packer.AddField("order_batch_no", 'I', order_batch_no);
            packer.AddField("order_dir", 'I', order_dir);
            packer.AddField("order_qty", 'D', order_qty);
            packer.AddField("order_price", 'D', order_price);
            packer.AddField("order_oper_way", 'S', order_oper_way);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPOR_INT,comm_opor);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR,contrc_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_NAME_STR,contrc_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_DIR_INT,contrc_dir);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT,hedge_type);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64,external_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64,comm_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT,order_batch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT,order_dir);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT,order_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT,order_price);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR,order_oper_way);
            return fastMsg;
        }
   }

    public class tdfutuL_4_12_Request : BaseRequest, IRequest<tdfutuL_4_12_Response>
    {
        public tdfutuL_4_12_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdfutuL.4.12";
            }
        }

        public int order_date { get; set; }
        public ulong order_id { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("order_date", 'I', order_date);
            packer.AddField("order_id", 'L', order_id);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT,order_date);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64,order_id);
            return fastMsg;
        }
   }

    public class tdfutuL_4_21_Request : BaseRequest, IRequest<tdfutuL_4_21_Response>
    {
        public tdfutuL_4_21_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdfutuL.4.21";
            }
        }

        public ulong order_id { get; set; }
        public String order_status { get; set; }
        public int order_date { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("order_id", 'L', order_id);
            packer.AddField("order_status", 'S', order_status);
            packer.AddField("order_date", 'I', order_date);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64,order_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR,order_status);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT,order_date);
            return fastMsg;
        }
   }

    public class tdfutuL_4_31_Request : BaseRequest, IRequest<tdfutuL_4_31_Response>
    {
        public tdfutuL_4_31_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdfutuL.4.31";
            }
        }

        public int init_date { get; set; }
        public int pass_no { get; set; }
        public int row_count { get; set; }
        public ulong row_id { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("init_date", 'I', init_date);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("row_count", 'I', row_count);
            packer.AddField("row_id", 'L', row_id);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            return fastMsg;
        }
   }

    public class tdfutuL_4_32_Request : BaseRequest, IRequest<tdfutuL_4_32_Response>
    {
        public tdfutuL_4_32_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdfutuL.4.32";
            }
        }

        public int init_date { get; set; }
        public int pass_no { get; set; }
        public int row_count { get; set; }
        public ulong row_id { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("init_date", 'I', init_date);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("row_count", 'I', row_count);
            packer.AddField("row_id", 'L', row_id);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            return fastMsg;
        }
   }

    public class tdfutuL_4_101_Request : BaseRequest, IRequest<tdfutuL_4_101_Response>
    {
        public tdfutuL_4_101_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdfutuL.4.101";
            }
        }

        public int busi_opor_no { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int pass_no { get; set; }
        public String exch_no_str { get; set; }
        public int contrc_code_no { get; set; }
        public String contrc_type_str { get; set; }
        public ulong comm_id { get; set; }
        public int comm_batch_no { get; set; }
        public int comm_opor { get; set; }
        public ulong external_no { get; set; }
        public int order_batch_no { get; set; }
        public ulong order_id { get; set; }
        public String order_dir_str { get; set; }
        public String order_status_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public int sort_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("busi_opor_no", 'I', busi_opor_no);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("contrc_code_no", 'I', contrc_code_no);
            packer.AddField("contrc_type_str", 'S', contrc_type_str);
            packer.AddField("comm_id", 'L', comm_id);
            packer.AddField("comm_batch_no", 'I', comm_batch_no);
            packer.AddField("comm_opor", 'I', comm_opor);
            packer.AddField("external_no", 'L', external_no);
            packer.AddField("order_batch_no", 'I', order_batch_no);
            packer.AddField("order_id", 'L', order_id);
            packer.AddField("order_dir_str", 'S', order_dir_str);
            packer.AddField("order_status_str", 'S', order_status_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
            packer.AddField("sort_type", 'I', sort_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT,busi_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_STR_STR,contrc_type_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64,comm_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT,comm_batch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPOR_INT,comm_opor);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64,external_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT,order_batch_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64,order_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR,order_dir_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR_STR,order_status_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SORT_TYPE_INT,sort_type);
            return fastMsg;
        }
   }

    public class tdfutuL_4_102_Request : BaseRequest, IRequest<tdfutuL_4_102_Response>
    {
        public tdfutuL_4_102_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdfutuL.4.102";
            }
        }

        public int begin_date { get; set; }
        public int end_date { get; set; }
        public int busi_opor_no { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int pass_no { get; set; }
        public String exch_no_str { get; set; }
        public int contrc_code_no { get; set; }
        public String contrc_type_str { get; set; }
        public ulong comm_id { get; set; }
        public int comm_batch_no { get; set; }
        public int comm_opor { get; set; }
        public ulong external_no { get; set; }
        public int order_batch_no { get; set; }
        public ulong order_id { get; set; }
        public String order_dir_str { get; set; }
        public String order_status_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("busi_opor_no", 'I', busi_opor_no);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("contrc_code_no", 'I', contrc_code_no);
            packer.AddField("contrc_type_str", 'S', contrc_type_str);
            packer.AddField("comm_id", 'L', comm_id);
            packer.AddField("comm_batch_no", 'I', comm_batch_no);
            packer.AddField("comm_opor", 'I', comm_opor);
            packer.AddField("external_no", 'L', external_no);
            packer.AddField("order_batch_no", 'I', order_batch_no);
            packer.AddField("order_id", 'L', order_id);
            packer.AddField("order_dir_str", 'S', order_dir_str);
            packer.AddField("order_status_str", 'S', order_status_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT,end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT,busi_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_STR_STR,contrc_type_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64,comm_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT,comm_batch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPOR_INT,comm_opor);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64,external_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT,order_batch_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64,order_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR,order_dir_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR_STR,order_status_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class tdfutuL_4_103_Request : BaseRequest, IRequest<tdfutuL_4_103_Response>
    {
        public tdfutuL_4_103_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdfutuL.4.103";
            }
        }

        public int busi_opor_no { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int pass_no { get; set; }
        public String exch_no_str { get; set; }
        public int contrc_code_no { get; set; }
        public String contrc_type_str { get; set; }
        public ulong external_no { get; set; }
        public int order_batch_no { get; set; }
        public ulong order_id { get; set; }
        public String order_dir_str { get; set; }
        public String order_sum_status_str { get; set; }
        public String order_oper_way { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public int sort_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("busi_opor_no", 'I', busi_opor_no);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("contrc_code_no", 'I', contrc_code_no);
            packer.AddField("contrc_type_str", 'S', contrc_type_str);
            packer.AddField("external_no", 'L', external_no);
            packer.AddField("order_batch_no", 'I', order_batch_no);
            packer.AddField("order_id", 'L', order_id);
            packer.AddField("order_dir_str", 'S', order_dir_str);
            packer.AddField("order_sum_status_str", 'S', order_sum_status_str);
            packer.AddField("order_oper_way", 'S', order_oper_way);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
            packer.AddField("sort_type", 'I', sort_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT,busi_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_STR_STR,contrc_type_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64,external_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT,order_batch_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64,order_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR,order_dir_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_SUM_STATUS_STR_STR,order_sum_status_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR,order_oper_way);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SORT_TYPE_INT,sort_type);
            return fastMsg;
        }
   }

    public class tdfutuL_4_104_Request : BaseRequest, IRequest<tdfutuL_4_104_Response>
    {
        public tdfutuL_4_104_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdfutuL.4.104";
            }
        }

        public int begin_date { get; set; }
        public int end_date { get; set; }
        public int busi_opor_no { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int pass_no { get; set; }
        public String exch_no_str { get; set; }
        public int contrc_code_no { get; set; }
        public String contrc_type_str { get; set; }
        public ulong external_no { get; set; }
        public int order_batch_no { get; set; }
        public ulong order_id { get; set; }
        public String order_dir_str { get; set; }
        public String order_sum_status_str { get; set; }
        public String order_oper_way { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public int sort_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("busi_opor_no", 'I', busi_opor_no);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("contrc_code_no", 'I', contrc_code_no);
            packer.AddField("contrc_type_str", 'S', contrc_type_str);
            packer.AddField("external_no", 'L', external_no);
            packer.AddField("order_batch_no", 'I', order_batch_no);
            packer.AddField("order_id", 'L', order_id);
            packer.AddField("order_dir_str", 'S', order_dir_str);
            packer.AddField("order_sum_status_str", 'S', order_sum_status_str);
            packer.AddField("order_oper_way", 'S', order_oper_way);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
            packer.AddField("sort_type", 'I', sort_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT,end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT,busi_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_STR_STR,contrc_type_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64,external_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT,order_batch_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64,order_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR,order_dir_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_SUM_STATUS_STR_STR,order_sum_status_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR,order_oper_way);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SORT_TYPE_INT,sort_type);
            return fastMsg;
        }
   }

    public class tdfutuL_4_33_Request : BaseRequest, IRequest<tdfutuL_4_33_Response>
    {
        public tdfutuL_4_33_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdfutuL.4.33";
            }
        }

        public ulong external_no { get; set; }
        public int order_date { get; set; }
        public ulong order_id { get; set; }
        public int modi_batch_no { get; set; }
        public double modi_order_price { get; set; }
        public double modi_order_qty { get; set; }
        public int modi_price_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("external_no", 'L', external_no);
            packer.AddField("order_date", 'I', order_date);
            packer.AddField("order_id", 'L', order_id);
            packer.AddField("modi_batch_no", 'I', modi_batch_no);
            packer.AddField("modi_order_price", 'D', modi_order_price);
            packer.AddField("modi_order_qty", 'D', modi_order_qty);
            packer.AddField("modi_price_type", 'I', modi_price_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64,external_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT,order_date);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64,order_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MODI_BATCH_NO_INT,modi_batch_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MODI_ORDER_PRICE_FLOAT,modi_order_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MODI_ORDER_QTY_FLOAT,modi_order_qty);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MODI_PRICE_TYPE_INT,modi_price_type);
            return fastMsg;
        }
   }

    public class tdfutuL_4_41_Request : BaseRequest, IRequest<tdfutuL_4_41_Response>
    {
        public tdfutuL_4_41_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdfutuL.4.41";
            }
        }

        public int init_date { get; set; }
        public int pass_no { get; set; }
        public int row_count { get; set; }
        public ulong row_id { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("init_date", 'I', init_date);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("row_count", 'I', row_count);
            packer.AddField("row_id", 'L', row_id);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            return fastMsg;
        }
   }

    public class tdfutuL_4_42_Request : BaseRequest, IRequest<tdfutuL_4_42_Response>
    {
        public tdfutuL_4_42_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdfutuL.4.42";
            }
        }

        public int init_date { get; set; }
        public int pass_no { get; set; }
        public int row_count { get; set; }
        public ulong row_id { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("init_date", 'I', init_date);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("row_count", 'I', row_count);
            packer.AddField("row_id", 'L', row_id);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            return fastMsg;
        }
   }

}
