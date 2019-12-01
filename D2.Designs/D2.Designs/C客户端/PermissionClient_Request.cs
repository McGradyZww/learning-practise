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
    public class pubL_21_1_Request : BaseRequest, IRequest<pubL_21_1_Response>
    {
        public pubL_21_1_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.21.1";
            }
        }

        public String role_code { get; set; }
        public String role_name { get; set; }
        public int role_type { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("role_code", 'S', role_code);
            packer.AddField("role_name", 'S', role_name);
            packer.AddField("role_type", 'I', role_type);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ROLE_CODE_STR,role_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ROLE_NAME_STR,role_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROLE_TYPE_INT,role_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_21_2_Request : BaseRequest, IRequest<pubL_21_2_Response>
    {
        public pubL_21_2_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.21.2";
            }
        }

        public int role_no { get; set; }
        public String role_code { get; set; }
        public String role_name { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("role_no", 'I', role_no);
            packer.AddField("role_code", 'S', role_code);
            packer.AddField("role_name", 'S', role_name);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROLE_NO_INT,role_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ROLE_CODE_STR,role_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ROLE_NAME_STR,role_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_21_3_Request : BaseRequest, IRequest<pubL_21_3_Response>
    {
        public pubL_21_3_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.21.3";
            }
        }

        public int role_no { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("role_no", 'I', role_no);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROLE_NO_INT,role_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_21_4_Request : BaseRequest, IRequest<pubL_21_4_Response>
    {
        public pubL_21_4_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.21.4";
            }
        }

        public String role_code { get; set; }
        public String role_name { get; set; }
        public int source_role_no { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("role_code", 'S', role_code);
            packer.AddField("role_name", 'S', role_name);
            packer.AddField("source_role_no", 'I', source_role_no);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ROLE_CODE_STR,role_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ROLE_NAME_STR,role_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SOURCE_ROLE_NO_INT,source_role_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_21_5_Request : BaseRequest, IRequest<pubL_21_5_Response>
    {
        public pubL_21_5_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.21.5";
            }
        }

        public int role_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("role_no", 'I', role_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROLE_NO_INT,role_no);
            return fastMsg;
        }
   }

    public class pubL_21_13_Request : BaseRequest, IRequest<pubL_21_13_Response>
    {
        public pubL_21_13_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.21.13";
            }
        }

        public int role_no { get; set; }
        public String menu_func_str { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("role_no", 'I', role_no);
            packer.AddField("menu_func_str", 'S', menu_func_str);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROLE_NO_INT,role_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MENU_FUNC_STR_STR,menu_func_str);
            return fastMsg;
        }
   }

    public class pubL_21_14_Request : BaseRequest, IRequest<pubL_21_14_Response>
    {
        public pubL_21_14_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.21.14";
            }
        }

        public int role_no { get; set; }
        public String menu_func_str { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("role_no", 'I', role_no);
            packer.AddField("menu_func_str", 'S', menu_func_str);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROLE_NO_INT,role_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MENU_FUNC_STR_STR,menu_func_str);
            return fastMsg;
        }
   }

    public class pubL_21_15_Request : BaseRequest, IRequest<pubL_21_15_Response>
    {
        public pubL_21_15_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.21.15";
            }
        }

        public int role_no { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("role_no", 'I', role_no);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROLE_NO_INT,role_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_21_21_Request : BaseRequest, IRequest<pubL_21_21_Response>
    {
        public pubL_21_21_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.21.21";
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

    public class pubL_21_22_Request : BaseRequest, IRequest<pubL_21_22_Response>
    {
        public pubL_21_22_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.21.22";
            }
        }

        public int target_opor_no { get; set; }
        public int role_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("target_opor_no", 'I', target_opor_no);
            packer.AddField("role_no", 'I', role_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_OPOR_NO_INT,target_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROLE_NO_INT,role_no);
            return fastMsg;
        }
   }

    public class pubL_21_23_Request : BaseRequest, IRequest<pubL_21_23_Response>
    {
        public pubL_21_23_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.21.23";
            }
        }

        public int target_opor_no { get; set; }
        public int role_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("target_opor_no", 'I', target_opor_no);
            packer.AddField("role_no", 'I', role_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_OPOR_NO_INT,target_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROLE_NO_INT,role_no);
            return fastMsg;
        }
   }

    public class pubL_21_24_Request : BaseRequest, IRequest<pubL_21_24_Response>
    {
        public pubL_21_24_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.21.24";
            }
        }

        public int query_opor_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("query_opor_no", 'I', query_opor_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_OPOR_NO_INT,query_opor_no);
            return fastMsg;
        }
   }

    public class pubL_21_27_Request : BaseRequest, IRequest<pubL_21_27_Response>
    {
        public pubL_21_27_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.21.27";
            }
        }

        public int target_opor_no { get; set; }
        public int menu_type { get; set; }
        public String menu_func_str { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("target_opor_no", 'I', target_opor_no);
            packer.AddField("menu_type", 'I', menu_type);
            packer.AddField("menu_func_str", 'S', menu_func_str);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_OPOR_NO_INT,target_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MENU_TYPE_INT,menu_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MENU_FUNC_STR_STR,menu_func_str);
            return fastMsg;
        }
   }

    public class pubL_21_28_Request : BaseRequest, IRequest<pubL_21_28_Response>
    {
        public pubL_21_28_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.21.28";
            }
        }

        public int target_opor_no { get; set; }
        public int menu_type { get; set; }
        public String menu_func_str { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("target_opor_no", 'I', target_opor_no);
            packer.AddField("menu_type", 'I', menu_type);
            packer.AddField("menu_func_str", 'S', menu_func_str);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_OPOR_NO_INT,target_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MENU_TYPE_INT,menu_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MENU_FUNC_STR_STR,menu_func_str);
            return fastMsg;
        }
   }

    public class pubL_21_29_Request : BaseRequest, IRequest<pubL_21_29_Response>
    {
        public pubL_21_29_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.21.29";
            }
        }

        public int query_opor_no { get; set; }
        public int menu_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("query_opor_no", 'I', query_opor_no);
            packer.AddField("menu_type", 'I', menu_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_OPOR_NO_INT,query_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MENU_TYPE_INT,menu_type);
            return fastMsg;
        }
   }

    public class pubL_21_30_Request : BaseRequest, IRequest<pubL_21_30_Response>
    {
        public pubL_21_30_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.21.30";
            }
        }

        public int query_opor_no { get; set; }
        public int menu_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("query_opor_no", 'I', query_opor_no);
            packer.AddField("menu_type", 'I', menu_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_OPOR_NO_INT,query_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MENU_TYPE_INT,menu_type);
            return fastMsg;
        }
   }

    public class pubL_21_31_Request : BaseRequest, IRequest<pubL_21_31_Response>
    {
        public pubL_21_31_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.21.31";
            }
        }

        public int query_opor_no { get; set; }
        public int menu_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("query_opor_no", 'I', query_opor_no);
            packer.AddField("menu_type", 'I', menu_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_OPOR_NO_INT,query_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MENU_TYPE_INT,menu_type);
            return fastMsg;
        }
   }

    public class pubL_21_32_Request : BaseRequest, IRequest<pubL_21_32_Response>
    {
        public pubL_21_32_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.21.32";
            }
        }

        public int query_opor_no { get; set; }
        public int menu_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("query_opor_no", 'I', query_opor_no);
            packer.AddField("menu_type", 'I', menu_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_OPOR_NO_INT,query_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MENU_TYPE_INT,menu_type);
            return fastMsg;
        }
   }

    public class pubL_21_33_Request : BaseRequest, IRequest<pubL_21_33_Response>
    {
        public pubL_21_33_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.21.33";
            }
        }

        public int menu_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("menu_type", 'I', menu_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MENU_TYPE_INT,menu_type);
            return fastMsg;
        }
   }

    public class pubL_21_51_Request : BaseRequest, IRequest<pubL_21_51_Response>
    {
        public pubL_21_51_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.21.51";
            }
        }

        public int co_no { get; set; }
        public int menu_type { get; set; }
        public String menu_func_str { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("menu_type", 'I', menu_type);
            packer.AddField("menu_func_str", 'S', menu_func_str);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MENU_TYPE_INT,menu_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MENU_FUNC_STR_STR,menu_func_str);
            return fastMsg;
        }
   }

}
