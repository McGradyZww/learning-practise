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
    public class pubL_7_1_Request : BaseRequest, IRequest<pubL_7_1_Response>
    {
        public pubL_7_1_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.7.1";
            }
        }

        public String role_code { get; set; }
        public String role_name { get; set; }
        public int co_no { get; set; }
        public int role_type { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("role_code", 'S', role_code);
            packer.AddField("role_name", 'S', role_name);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("role_type", 'I', role_type);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ROLE_CODE_STR,role_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ROLE_NAME_STR,role_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROLE_TYPE_INT,role_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_7_2_Request : BaseRequest, IRequest<pubL_7_2_Response>
    {
        public pubL_7_2_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.7.2";
            }
        }

        public int role_no { get; set; }
        public String role_name { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("role_no", 'I', role_no);
            packer.AddField("role_name", 'S', role_name);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROLE_NO_INT,role_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ROLE_NAME_STR,role_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_7_3_Request : BaseRequest, IRequest<pubL_7_3_Response>
    {
        public pubL_7_3_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.7.3";
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

    public class pubL_7_4_Request : BaseRequest, IRequest<pubL_7_4_Response>
    {
        public pubL_7_4_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.7.4";
            }
        }

        public int co_no { get; set; }
        public String role_code { get; set; }
        public String role_name { get; set; }
        public int source_role_no { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("role_code", 'S', role_code);
            packer.AddField("role_name", 'S', role_name);
            packer.AddField("source_role_no", 'I', source_role_no);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ROLE_CODE_STR,role_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ROLE_NAME_STR,role_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SOURCE_ROLE_NO_INT,source_role_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_7_5_Request : BaseRequest, IRequest<pubL_7_5_Response>
    {
        public pubL_7_5_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.7.5";
            }
        }

        public int co_no { get; set; }
        public int role_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("role_no", 'I', role_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROLE_NO_INT,role_no);
            return fastMsg;
        }
   }

    public class pubL_7_6_Request : BaseRequest, IRequest<pubL_7_6_Response>
    {
        public pubL_7_6_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.7.6";
            }
        }

        public int co_no { get; set; }
        public String role_code { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("role_code", 'S', role_code);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ROLE_CODE_STR,role_code);
            return fastMsg;
        }
   }

    public class pubL_7_13_Request : BaseRequest, IRequest<pubL_7_13_Response>
    {
        public pubL_7_13_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.7.13";
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

    public class pubL_7_14_Request : BaseRequest, IRequest<pubL_7_14_Response>
    {
        public pubL_7_14_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.7.14";
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

    public class pubL_7_15_Request : BaseRequest, IRequest<pubL_7_15_Response>
    {
        public pubL_7_15_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.7.15";
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

    public class pubL_7_21_Request : BaseRequest, IRequest<pubL_7_21_Response>
    {
        public pubL_7_21_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.7.21";
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

    public class pubL_7_22_Request : BaseRequest, IRequest<pubL_7_22_Response>
    {
        public pubL_7_22_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.7.22";
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

    public class pubL_7_23_Request : BaseRequest, IRequest<pubL_7_23_Response>
    {
        public pubL_7_23_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.7.23";
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

    public class pubL_7_24_Request : BaseRequest, IRequest<pubL_7_24_Response>
    {
        public pubL_7_24_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.7.24";
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

    public class pubL_7_27_Request : BaseRequest, IRequest<pubL_7_27_Response>
    {
        public pubL_7_27_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.7.27";
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

    public class pubL_7_28_Request : BaseRequest, IRequest<pubL_7_28_Response>
    {
        public pubL_7_28_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.7.28";
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

    public class pubL_7_33_Request : BaseRequest, IRequest<pubL_7_33_Response>
    {
        public pubL_7_33_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.7.33";
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

    public class pubL_7_34_Request : BaseRequest, IRequest<pubL_7_34_Response>
    {
        public pubL_7_34_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.7.34";
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

    public class pubL_7_29_Request : BaseRequest, IRequest<pubL_7_29_Response>
    {
        public pubL_7_29_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.7.29";
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

    public class pubL_7_30_Request : BaseRequest, IRequest<pubL_7_30_Response>
    {
        public pubL_7_30_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.7.30";
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

    public class pubL_7_31_Request : BaseRequest, IRequest<pubL_7_31_Response>
    {
        public pubL_7_31_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.7.31";
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

    public class pubL_7_32_Request : BaseRequest, IRequest<pubL_7_32_Response>
    {
        public pubL_7_32_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.7.32";
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

    public class pubL_7_51_Request : BaseRequest, IRequest<pubL_7_51_Response>
    {
        public pubL_7_51_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.7.51";
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

    public class pubL_7_52_Request : BaseRequest, IRequest<pubL_7_52_Response>
    {
        public pubL_7_52_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.7.52";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            return fastMsg;
        }
   }

}
