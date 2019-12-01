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
    public class clsecuL_21_1_Request : BaseRequest, IRequest<clsecuL_21_1_Response>
    {
        public clsecuL_21_1_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "clsecuL.21.1";
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

    public class clsecuL_21_3_Request : BaseRequest, IRequest<clsecuL_21_3_Response>
    {
        public clsecuL_21_3_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "clsecuL.21.3";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public String exch_no_str { get; set; }
        public int stock_acco_no { get; set; }
        public int stock_code_no { get; set; }
        public int strike_date { get; set; }
        public String strike_no { get; set; }
        public String order_dir_str { get; set; }
        public int deal_flag { get; set; }
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
            packer.AddField("stock_acco_no", 'I', stock_acco_no);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("strike_date", 'I', strike_date);
            packer.AddField("strike_no", 'S', strike_no);
            packer.AddField("order_dir_str", 'S', order_dir_str);
            packer.AddField("deal_flag", 'I', deal_flag);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT,stock_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT,strike_date);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR,strike_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR,order_dir_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_FLAG_INT,deal_flag);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class clsecuL_21_4_Request : BaseRequest, IRequest<clsecuL_21_4_Response>
    {
        public clsecuL_21_4_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "clsecuL.21.4";
            }
        }

        public int sett_flag { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("sett_flag", 'I', sett_flag);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SETT_FLAG_INT,sett_flag);
            return fastMsg;
        }
   }

    public class clsecuL_21_11_Request : BaseRequest, IRequest<clsecuL_21_11_Response>
    {
        public clsecuL_21_11_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "clsecuL.21.11";
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

    public class clsecuL_21_13_Request : BaseRequest, IRequest<clsecuL_21_13_Response>
    {
        public clsecuL_21_13_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "clsecuL.21.13";
            }
        }

        public int strike_date { get; set; }
        public int busi_flag { get; set; }
        public int deal_flag { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("strike_date", 'I', strike_date);
            packer.AddField("busi_flag", 'I', busi_flag);
            packer.AddField("deal_flag", 'I', deal_flag);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT,strike_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT,busi_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_FLAG_INT,deal_flag);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class clsecuL_21_15_Request : BaseRequest, IRequest<clsecuL_21_15_Response>
    {
        public clsecuL_21_15_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "clsecuL.21.15";
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

    public class clsecuL_21_23_Request : BaseRequest, IRequest<clsecuL_21_23_Response>
    {
        public clsecuL_21_23_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "clsecuL.21.23";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public String exch_no_str { get; set; }
        public int stock_acco_no { get; set; }
        public int stock_code_no { get; set; }
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
            packer.AddField("stock_acco_no", 'I', stock_acco_no);
            packer.AddField("stock_code_no", 'I', stock_code_no);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT,stock_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR_STR,crncy_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_STATUS_STR,entry_status);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_UNDO_STATUS_STR,undo_status);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class clsecuL_21_24_Request : BaseRequest, IRequest<clsecuL_21_24_Response>
    {
        public clsecuL_21_24_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "clsecuL.21.24";
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

    public class clsecuL_21_25_Request : BaseRequest, IRequest<clsecuL_21_25_Response>
    {
        public clsecuL_21_25_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "clsecuL.21.25";
            }
        }

        public ulong query_row_id { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("query_row_id", 'L', query_row_id);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_ROW_ID_INT64,query_row_id);
            return fastMsg;
        }
   }

    public class clsecuL_21_26_Request : BaseRequest, IRequest<clsecuL_21_26_Response>
    {
        public clsecuL_21_26_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "clsecuL.21.26";
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

    public class clsecuL_21_27_Request : BaseRequest, IRequest<clsecuL_21_27_Response>
    {
        public clsecuL_21_27_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "clsecuL.21.27";
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

    public class clsecuL_21_28_Request : BaseRequest, IRequest<clsecuL_21_28_Response>
    {
        public clsecuL_21_28_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "clsecuL.21.28";
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

    public class clsecuL_21_29_Request : BaseRequest, IRequest<clsecuL_21_29_Response>
    {
        public clsecuL_21_29_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "clsecuL.21.29";
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

    public class clsecuL_21_151_Request : BaseRequest, IRequest<clsecuL_21_151_Response>
    {
        public clsecuL_21_151_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "clsecuL.21.151";
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

    public class clsecuL_21_153_Request : BaseRequest, IRequest<clsecuL_21_153_Response>
    {
        public clsecuL_21_153_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "clsecuL.21.153";
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

    public class clsecuL_21_154_Request : BaseRequest, IRequest<clsecuL_21_154_Response>
    {
        public clsecuL_21_154_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "clsecuL.21.154";
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

    public class clsecuL_21_201_Request : BaseRequest, IRequest<clsecuL_21_201_Response>
    {
        public clsecuL_21_201_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "clsecuL.21.201";
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

    public class clsecuL_21_202_Request : BaseRequest, IRequest<clsecuL_21_202_Response>
    {
        public clsecuL_21_202_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "clsecuL.21.202";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public String exch_no_str { get; set; }
        public int stock_acco_no { get; set; }
        public int stock_code_no { get; set; }
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
            packer.AddField("stock_acco_no", 'I', stock_acco_no);
            packer.AddField("stock_code_no", 'I', stock_code_no);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT,stock_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class clsecuL_21_203_Request : BaseRequest, IRequest<clsecuL_21_203_Response>
    {
        public clsecuL_21_203_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "clsecuL.21.203";
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

    public class clsecuL_21_204_Request : BaseRequest, IRequest<clsecuL_21_204_Response>
    {
        public clsecuL_21_204_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "clsecuL.21.204";
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

    public class clsecuL_21_205_Request : BaseRequest, IRequest<clsecuL_21_205_Response>
    {
        public clsecuL_21_205_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "clsecuL.21.205";
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

    public class clsecuL_21_206_Request : BaseRequest, IRequest<clsecuL_21_206_Response>
    {
        public clsecuL_21_206_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "clsecuL.21.206";
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

    public class clsecuL_21_207_Request : BaseRequest, IRequest<clsecuL_21_207_Response>
    {
        public clsecuL_21_207_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "clsecuL.21.207";
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

    public class clsecuL_21_301_Request : BaseRequest, IRequest<clsecuL_21_301_Response>
    {
        public clsecuL_21_301_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "clsecuL.21.301";
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

}
