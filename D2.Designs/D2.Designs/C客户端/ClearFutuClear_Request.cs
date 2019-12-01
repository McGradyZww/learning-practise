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
    public class clfutuL_2_1_Request : BaseRequest, IRequest<clfutuL_2_1_Response>
    {
        public clfutuL_2_1_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "clfutuL.2.1";
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

    public class clfutuL_2_2_Request : BaseRequest, IRequest<clfutuL_2_2_Response>
    {
        public clfutuL_2_2_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "clfutuL.2.2";
            }
        }

        public int qry_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("qry_no", 'I', qry_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_NO_INT,qry_no);
            return fastMsg;
        }
   }

    public class clfutuL_2_6_Request : BaseRequest, IRequest<clfutuL_2_6_Response>
    {
        public clfutuL_2_6_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "clfutuL.2.6";
            }
        }

        public int qry_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("qry_no", 'I', qry_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_NO_INT,qry_no);
            return fastMsg;
        }
   }

    public class clfutuL_2_9_Request : BaseRequest, IRequest<clfutuL_2_9_Response>
    {
        public clfutuL_2_9_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "clfutuL.2.9";
            }
        }

        public int order_date { get; set; }
        public int order_no { get; set; }
        public int pass_no { get; set; }
        public String out_acco { get; set; }
        public String exch_no_str { get; set; }
        public int futu_acco_no { get; set; }
        public int contrc_code_no { get; set; }
        public String order_dir_str { get; set; }
        public String contrc_dir_str { get; set; }
        public int hedge_type { get; set; }
        public String order_status { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("order_date", 'I', order_date);
            packer.AddField("order_no", 'I', order_no);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("out_acco", 'S', out_acco);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("futu_acco_no", 'I', futu_acco_no);
            packer.AddField("contrc_code_no", 'I', contrc_code_no);
            packer.AddField("order_dir_str", 'S', order_dir_str);
            packer.AddField("contrc_dir_str", 'S', contrc_dir_str);
            packer.AddField("hedge_type", 'I', hedge_type);
            packer.AddField("order_status", 'S', order_status);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT,order_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_NO_INT,order_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR,out_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT,futu_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR,order_dir_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_DIR_STR_STR,contrc_dir_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT,hedge_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR,order_status);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class clfutuL_2_21_Request : BaseRequest, IRequest<clfutuL_2_21_Response>
    {
        public clfutuL_2_21_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "clfutuL.2.21";
            }
        }

        public int qry_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("qry_no", 'I', qry_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_NO_INT,qry_no);
            return fastMsg;
        }
   }

    public class clfutuL_2_24_Request : BaseRequest, IRequest<clfutuL_2_24_Response>
    {
        public clfutuL_2_24_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "clfutuL.2.24";
            }
        }

        public int strike_date { get; set; }
        public String strike_no { get; set; }
        public int pass_no { get; set; }
        public String out_acco { get; set; }
        public String exch_no_str { get; set; }
        public String futu_acco { get; set; }
        public String contrc_code { get; set; }
        public String order_dir_str { get; set; }
        public String contrc_dir_str { get; set; }
        public int hedge_type { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("strike_date", 'I', strike_date);
            packer.AddField("strike_no", 'S', strike_no);
            packer.AddField("pass_no", 'I', pass_no);
            packer.AddField("out_acco", 'S', out_acco);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("futu_acco", 'S', futu_acco);
            packer.AddField("contrc_code", 'S', contrc_code);
            packer.AddField("order_dir_str", 'S', order_dir_str);
            packer.AddField("contrc_dir_str", 'S', contrc_dir_str);
            packer.AddField("hedge_type", 'I', hedge_type);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT,strike_date);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR,strike_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT,pass_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR,out_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_STR,futu_acco);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR,contrc_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR,order_dir_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_DIR_STR_STR,contrc_dir_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT,hedge_type);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class clfutuL_2_37_Request : BaseRequest, IRequest<clfutuL_2_37_Response>
    {
        public clfutuL_2_37_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "clfutuL.2.37";
            }
        }

        public int qry_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("qry_no", 'I', qry_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_NO_INT,qry_no);
            return fastMsg;
        }
   }

    public class clfutuL_2_38_Request : BaseRequest, IRequest<clfutuL_2_38_Response>
    {
        public clfutuL_2_38_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "clfutuL.2.38";
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

    public class clfutuL_2_58_Request : BaseRequest, IRequest<clfutuL_2_58_Response>
    {
        public clfutuL_2_58_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "clfutuL.2.58";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public String exch_no_str { get; set; }
        public int futu_acco_no { get; set; }
        public int contrc_code_no { get; set; }
        public String crncy_type_str { get; set; }
        public String entry_status { get; set; }
        public String undo_status { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("futu_acco_no", 'I', futu_acco_no);
            packer.AddField("contrc_code_no", 'I', contrc_code_no);
            packer.AddField("crncy_type_str", 'S', crncy_type_str);
            packer.AddField("entry_status", 'S', entry_status);
            packer.AddField("undo_status", 'S', undo_status);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT,futu_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR_STR,crncy_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_STATUS_STR,entry_status);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_UNDO_STATUS_STR,undo_status);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class clfutuL_2_61_Request : BaseRequest, IRequest<clfutuL_2_61_Response>
    {
        public clfutuL_2_61_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "clfutuL.2.61";
            }
        }

        public int qry_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("qry_no", 'I', qry_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_NO_INT,qry_no);
            return fastMsg;
        }
   }

    public class clfutuL_2_62_Request : BaseRequest, IRequest<clfutuL_2_62_Response>
    {
        public clfutuL_2_62_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "clfutuL.2.62";
            }
        }

        public int qry_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("qry_no", 'I', qry_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_NO_INT,qry_no);
            return fastMsg;
        }
   }

    public class clfutuL_2_101_Request : BaseRequest, IRequest<clfutuL_2_101_Response>
    {
        public clfutuL_2_101_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "clfutuL.2.101";
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

    public class clfutuL_2_103_Request : BaseRequest, IRequest<clfutuL_2_103_Response>
    {
        public clfutuL_2_103_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "clfutuL.2.103";
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

    public class clfutuL_2_104_Request : BaseRequest, IRequest<clfutuL_2_104_Response>
    {
        public clfutuL_2_104_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "clfutuL.2.104";
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

    public class clfutuL_2_107_Request : BaseRequest, IRequest<clfutuL_2_107_Response>
    {
        public clfutuL_2_107_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "clfutuL.2.107";
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

    public class clfutuL_2_108_Request : BaseRequest, IRequest<clfutuL_2_108_Response>
    {
        public clfutuL_2_108_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "clfutuL.2.108";
            }
        }

        public int qry_no { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("qry_no", 'I', qry_no);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_NO_INT,qry_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class clfutuL_2_109_Request : BaseRequest, IRequest<clfutuL_2_109_Response>
    {
        public clfutuL_2_109_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "clfutuL.2.109";
            }
        }

        public int qry_no { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("qry_no", 'I', qry_no);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_NO_INT,qry_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class clfutuL_2_110_Request : BaseRequest, IRequest<clfutuL_2_110_Response>
    {
        public clfutuL_2_110_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "clfutuL.2.110";
            }
        }

        public int qry_no { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("qry_no", 'I', qry_no);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_NO_INT,qry_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class clfutuL_2_111_Request : BaseRequest, IRequest<clfutuL_2_111_Response>
    {
        public clfutuL_2_111_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "clfutuL.2.111";
            }
        }

        public int qry_no { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("qry_no", 'I', qry_no);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_NO_INT,qry_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

}
