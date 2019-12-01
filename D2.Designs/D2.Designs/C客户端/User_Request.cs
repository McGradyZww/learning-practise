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
    public class pubL_5_1_Request : BaseRequest, IRequest<pubL_5_1_Response>
    {
        public pubL_5_1_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.5.1";
            }
        }

        public int target_opor_no { get; set; }
        public int co_no { get; set; }
        public String opor_name { get; set; }
        public int opor_type { get; set; }
        public String target_opor_pwd { get; set; }
        public String conta_addr { get; set; }
        public int oper_rights { get; set; }
        public String phone_number { get; set; }
        public String email { get; set; }
        public int is_trader { get; set; }
        public int trader_no { get; set; }
        public String allow_login_type { get; set; }
        public String allow_oper_ip_addr { get; set; }
        public String allow_oper_mac { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("target_opor_no", 'I', target_opor_no);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("opor_name", 'S', opor_name);
            packer.AddField("opor_type", 'I', opor_type);
            packer.AddField("target_opor_pwd", 'S', target_opor_pwd);
            packer.AddField("conta_addr", 'S', conta_addr);
            packer.AddField("oper_rights", 'I', oper_rights);
            packer.AddField("phone_number", 'S', phone_number);
            packer.AddField("email", 'S', email);
            packer.AddField("is_trader", 'I', is_trader);
            packer.AddField("trader_no", 'I', trader_no);
            packer.AddField("allow_login_type", 'S', allow_login_type);
            packer.AddField("allow_oper_ip_addr", 'S', allow_oper_ip_addr);
            packer.AddField("allow_oper_mac", 'S', allow_oper_mac);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_OPOR_NO_INT,target_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NAME_STR,opor_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_TYPE_INT,opor_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_OPOR_PWD_STR,target_opor_pwd);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTA_ADDR_STR,conta_addr);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_RIGHTS_INT,oper_rights);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PHONE_NUMBER_STR,phone_number);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EMAIL_STR,email);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_TRADER_INT,is_trader);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRADER_NO_INT,trader_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_LOGIN_TYPE_STR,allow_login_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_OPER_IP_ADDR_STR,allow_oper_ip_addr);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_OPER_MAC_STR,allow_oper_mac);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_5_2_Request : BaseRequest, IRequest<pubL_5_2_Response>
    {
        public pubL_5_2_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.5.2";
            }
        }

        public int target_opor_no { get; set; }
        public String opor_name { get; set; }
        public int opor_type { get; set; }
        public String conta_addr { get; set; }
        public String phone_number { get; set; }
        public String email { get; set; }
        public int is_trader { get; set; }
        public int trader_no { get; set; }
        public String allow_login_type { get; set; }
        public String allow_oper_ip_addr { get; set; }
        public String allow_oper_mac { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("target_opor_no", 'I', target_opor_no);
            packer.AddField("opor_name", 'S', opor_name);
            packer.AddField("opor_type", 'I', opor_type);
            packer.AddField("conta_addr", 'S', conta_addr);
            packer.AddField("phone_number", 'S', phone_number);
            packer.AddField("email", 'S', email);
            packer.AddField("is_trader", 'I', is_trader);
            packer.AddField("trader_no", 'I', trader_no);
            packer.AddField("allow_login_type", 'S', allow_login_type);
            packer.AddField("allow_oper_ip_addr", 'S', allow_oper_ip_addr);
            packer.AddField("allow_oper_mac", 'S', allow_oper_mac);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_OPOR_NO_INT,target_opor_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NAME_STR,opor_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_TYPE_INT,opor_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTA_ADDR_STR,conta_addr);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PHONE_NUMBER_STR,phone_number);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EMAIL_STR,email);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_TRADER_INT,is_trader);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRADER_NO_INT,trader_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_LOGIN_TYPE_STR,allow_login_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_OPER_IP_ADDR_STR,allow_oper_ip_addr);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_OPER_MAC_STR,allow_oper_mac);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_5_4_Request : BaseRequest, IRequest<pubL_5_4_Response>
    {
        public pubL_5_4_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.5.4";
            }
        }

        public int query_opor_no { get; set; }
        public int co_no { get; set; }
        public int is_trader { get; set; }
        public String opor_type_str { get; set; }
        public String opor_status_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("query_opor_no", 'I', query_opor_no);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("is_trader", 'I', is_trader);
            packer.AddField("opor_type_str", 'S', opor_type_str);
            packer.AddField("opor_status_str", 'S', opor_status_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_OPOR_NO_INT,query_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_TRADER_INT,is_trader);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_TYPE_STR_STR,opor_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_STATUS_STR_STR,opor_status_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_5_5_Request : BaseRequest, IRequest<pubL_5_5_Response>
    {
        public pubL_5_5_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.5.5";
            }
        }

        public int target_opor_no { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("target_opor_no", 'I', target_opor_no);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_OPOR_NO_INT,target_opor_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_5_6_Request : BaseRequest, IRequest<pubL_5_6_Response>
    {
        public pubL_5_6_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.5.6";
            }
        }

        public int target_opor_no { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("target_opor_no", 'I', target_opor_no);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_OPOR_NO_INT,target_opor_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_5_7_Request : BaseRequest, IRequest<pubL_5_7_Response>
    {
        public pubL_5_7_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.5.7";
            }
        }

        public int target_opor_no { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("target_opor_no", 'I', target_opor_no);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_OPOR_NO_INT,target_opor_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_5_9_Request : BaseRequest, IRequest<pubL_5_9_Response>
    {
        public pubL_5_9_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.5.9";
            }
        }

        public String opor_old_pwd { get; set; }
        public String opor_new_pwd { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("opor_old_pwd", 'S', opor_old_pwd);
            packer.AddField("opor_new_pwd", 'S', opor_new_pwd);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_OLD_PWD_STR,opor_old_pwd);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NEW_PWD_STR,opor_new_pwd);
            return fastMsg;
        }
   }

    public class pubL_5_10_Request : BaseRequest, IRequest<pubL_5_10_Response>
    {
        public pubL_5_10_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.5.10";
            }
        }

        public int target_opor_no { get; set; }
        public String opor_new_pwd { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("target_opor_no", 'I', target_opor_no);
            packer.AddField("opor_new_pwd", 'S', opor_new_pwd);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_OPOR_NO_INT,target_opor_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NEW_PWD_STR,opor_new_pwd);
            return fastMsg;
        }
   }

    public class pubL_5_11_Request : BaseRequest, IRequest<pubL_5_11_Response>
    {
        public pubL_5_11_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.5.11";
            }
        }

        public int co_no { get; set; }
        public int target_opor_no { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("target_opor_no", 'I', target_opor_no);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_OPOR_NO_INT,target_opor_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_5_12_Request : BaseRequest, IRequest<pubL_5_12_Response>
    {
        public pubL_5_12_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.5.12";
            }
        }

        public int begin_date { get; set; }
        public int end_date { get; set; }
        public int co_no { get; set; }
        public int target_opor_no { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("target_opor_no", 'I', target_opor_no);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_OPOR_NO_INT,target_opor_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_5_13_Request : BaseRequest, IRequest<pubL_5_13_Response>
    {
        public pubL_5_13_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.5.13";
            }
        }

        public int target_opor_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("target_opor_no", 'I', target_opor_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_OPOR_NO_INT,target_opor_no);
            return fastMsg;
        }
   }

    public class pubL_5_14_Request : BaseRequest, IRequest<pubL_5_14_Response>
    {
        public pubL_5_14_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.5.14";
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

    public class pubL_5_21_Request : BaseRequest, IRequest<pubL_5_21_Response>
    {
        public pubL_5_21_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.5.21";
            }
        }

        public String client_version { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("client_version", 'S', client_version);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CLIENT_VERSION_STR,client_version);
            return fastMsg;
        }
   }

    public class pubL_5_22_Request : BaseRequest, IRequest<pubL_5_22_Response>
    {
        public pubL_5_22_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.5.22";
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

    public class pubL_5_41_Request : BaseRequest, IRequest<pubL_5_41_Response>
    {
        public pubL_5_41_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.5.41";
            }
        }

        public int target_opor_no { get; set; }
        public int co_no { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("target_opor_no", 'I', target_opor_no);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_OPOR_NO_INT,target_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_5_42_Request : BaseRequest, IRequest<pubL_5_42_Response>
    {
        public pubL_5_42_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.5.42";
            }
        }

        public int target_opor_no { get; set; }
        public int co_no { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("target_opor_no", 'I', target_opor_no);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_OPOR_NO_INT,target_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_5_44_Request : BaseRequest, IRequest<pubL_5_44_Response>
    {
        public pubL_5_44_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.5.44";
            }
        }

        public int query_opor_no { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("query_opor_no", 'I', query_opor_no);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_OPOR_NO_INT,query_opor_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_5_65_Request : BaseRequest, IRequest<pubL_5_65_Response>
    {
        public pubL_5_65_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.5.65";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public String exch_group_status { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("exch_group_status", 'S', exch_group_status);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_STATUS_STR,exch_group_status);
            return fastMsg;
        }
   }

    public class pubL_5_201_Request : BaseRequest, IRequest<pubL_5_201_Response>
    {
        public pubL_5_201_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.5.201";
            }
        }

        public int query_opor_no { get; set; }
        public int co_no { get; set; }
        public int is_trader { get; set; }
        public String opor_status_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("query_opor_no", 'I', query_opor_no);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("is_trader", 'I', is_trader);
            packer.AddField("opor_status_str", 'S', opor_status_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_OPOR_NO_INT,query_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_TRADER_INT,is_trader);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_STATUS_STR_STR,opor_status_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_5_202_Request : BaseRequest, IRequest<pubL_5_202_Response>
    {
        public pubL_5_202_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.5.202";
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

    public class pubL_5_203_Request : BaseRequest, IRequest<pubL_5_203_Response>
    {
        public pubL_5_203_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.5.203";
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

    public class pubL_5_204_Request : BaseRequest, IRequest<pubL_5_204_Response>
    {
        public pubL_5_204_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.5.204";
            }
        }

        public int query_opor_no { get; set; }
        public int co_no { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("query_opor_no", 'I', query_opor_no);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_OPOR_NO_INT,query_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_5_205_Request : BaseRequest, IRequest<pubL_5_205_Response>
    {
        public pubL_5_205_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.5.205";
            }
        }

        public int exch_group_no { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_5_206_Request : BaseRequest, IRequest<pubL_5_206_Response>
    {
        public pubL_5_206_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.5.206";
            }
        }

        public int exch_group_no { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_5_207_Request : BaseRequest, IRequest<pubL_5_207_Response>
    {
        public pubL_5_207_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.5.207";
            }
        }

        public int co_no { get; set; }
        public int exch_group_no { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_5_208_Request : BaseRequest, IRequest<pubL_5_208_Response>
    {
        public pubL_5_208_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.5.208";
            }
        }

        public int co_no { get; set; }
        public int busi_opor_no { get; set; }
        public String exch_group_code { get; set; }
        public String exch_group_name { get; set; }
        public int pd_no { get; set; }
        public double first_asset { get; set; }
        public double exch_group_dist_pd_amt { get; set; }
        public double exch_group_pd_share { get; set; }
        public String allow_exch { get; set; }
        public String allow_stock_type { get; set; }
        public String busi_config_str { get; set; }
        public double market_price_ratio { get; set; }
        public String forbid_order_dir { get; set; }
        public String trade_acco { get; set; }
        public double weight_value { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("busi_opor_no", 'I', busi_opor_no);
            packer.AddField("exch_group_code", 'S', exch_group_code);
            packer.AddField("exch_group_name", 'S', exch_group_name);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("first_asset", 'D', first_asset);
            packer.AddField("exch_group_dist_pd_amt", 'D', exch_group_dist_pd_amt);
            packer.AddField("exch_group_pd_share", 'D', exch_group_pd_share);
            packer.AddField("allow_exch", 'S', allow_exch);
            packer.AddField("allow_stock_type", 'S', allow_stock_type);
            packer.AddField("busi_config_str", 'S', busi_config_str);
            packer.AddField("market_price_ratio", 'D', market_price_ratio);
            packer.AddField("forbid_order_dir", 'S', forbid_order_dir);
            packer.AddField("trade_acco", 'S', trade_acco);
            packer.AddField("weight_value", 'D', weight_value);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT,busi_opor_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_CODE_STR,exch_group_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NAME_STR,exch_group_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FIRST_ASSET_FLOAT,first_asset);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_DIST_PD_AMT_FLOAT,exch_group_dist_pd_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_PD_SHARE_FLOAT,exch_group_pd_share);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_EXCH_STR,allow_exch);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_STOCK_TYPE_STR,allow_stock_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_CONFIG_STR_STR,busi_config_str);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_PRICE_RATIO_FLOAT,market_price_ratio);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FORBID_ORDER_DIR_STR,forbid_order_dir);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_ACCO_STR,trade_acco);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WEIGHT_VALUE_FLOAT,weight_value);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class pubL_5_209_Request : BaseRequest, IRequest<pubL_5_209_Response>
    {
        public pubL_5_209_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.5.209";
            }
        }

        public int co_no { get; set; }
        public int exch_group_no { get; set; }
        public int default_group_flag { get; set; }
        public int pd_no { get; set; }
        public String exch_group_status_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("default_group_flag", 'I', default_group_flag);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_status_str", 'S', exch_group_status_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEFAULT_GROUP_FLAG_INT,default_group_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_STATUS_STR_STR,exch_group_status_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_5_210_Request : BaseRequest, IRequest<pubL_5_210_Response>
    {
        public pubL_5_210_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.5.210";
            }
        }

        public int co_no { get; set; }
        public int busi_opor_no { get; set; }
        public int exch_group_no { get; set; }
        public String exch_group_code { get; set; }
        public String exch_group_name { get; set; }
        public double first_asset { get; set; }
        public double exch_group_dist_pd_amt { get; set; }
        public double exch_group_pd_share { get; set; }
        public String allow_exch { get; set; }
        public String allow_stock_type { get; set; }
        public String busi_config_str { get; set; }
        public double market_price_ratio { get; set; }
        public String forbid_order_dir { get; set; }
        public String trade_acco { get; set; }
        public double weight_value { get; set; }
        public String remark_info { get; set; }
        public int futu_default_group_flag { get; set; }
        public int fina_loan_default_group_flag { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("busi_opor_no", 'I', busi_opor_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("exch_group_code", 'S', exch_group_code);
            packer.AddField("exch_group_name", 'S', exch_group_name);
            packer.AddField("first_asset", 'D', first_asset);
            packer.AddField("exch_group_dist_pd_amt", 'D', exch_group_dist_pd_amt);
            packer.AddField("exch_group_pd_share", 'D', exch_group_pd_share);
            packer.AddField("allow_exch", 'S', allow_exch);
            packer.AddField("allow_stock_type", 'S', allow_stock_type);
            packer.AddField("busi_config_str", 'S', busi_config_str);
            packer.AddField("market_price_ratio", 'D', market_price_ratio);
            packer.AddField("forbid_order_dir", 'S', forbid_order_dir);
            packer.AddField("trade_acco", 'S', trade_acco);
            packer.AddField("weight_value", 'D', weight_value);
            packer.AddField("remark_info", 'S', remark_info);
            packer.AddField("futu_default_group_flag", 'I', futu_default_group_flag);
            packer.AddField("fina_loan_default_group_flag", 'I', fina_loan_default_group_flag);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT,busi_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_CODE_STR,exch_group_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NAME_STR,exch_group_name);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FIRST_ASSET_FLOAT,first_asset);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_DIST_PD_AMT_FLOAT,exch_group_dist_pd_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_PD_SHARE_FLOAT,exch_group_pd_share);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_EXCH_STR,allow_exch);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_STOCK_TYPE_STR,allow_stock_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_CONFIG_STR_STR,busi_config_str);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_PRICE_RATIO_FLOAT,market_price_ratio);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FORBID_ORDER_DIR_STR,forbid_order_dir);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_ACCO_STR,trade_acco);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WEIGHT_VALUE_FLOAT,weight_value);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_DEFAULT_GROUP_FLAG_INT,futu_default_group_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FINA_LOAN_DEFAULT_GROUP_FLAG_INT,fina_loan_default_group_flag);
            return fastMsg;
        }
   }

    public class pubL_5_211_Request : BaseRequest, IRequest<pubL_5_211_Response>
    {
        public pubL_5_211_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.5.211";
            }
        }

        public int co_no { get; set; }
        public int busi_opor_no { get; set; }
        public int exch_group_no { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("busi_opor_no", 'I', busi_opor_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT,busi_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_5_212_Request : BaseRequest, IRequest<pubL_5_212_Response>
    {
        public pubL_5_212_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.5.212";
            }
        }

        public int co_no { get; set; }
        public int target_opor_no { get; set; }
        public int allow_opor_no { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("target_opor_no", 'I', target_opor_no);
            packer.AddField("allow_opor_no", 'I', allow_opor_no);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_OPOR_NO_INT,target_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_OPOR_NO_INT,allow_opor_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_5_213_Request : BaseRequest, IRequest<pubL_5_213_Response>
    {
        public pubL_5_213_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.5.213";
            }
        }

        public int co_no { get; set; }
        public int target_opor_no { get; set; }
        public int allow_opor_no { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("target_opor_no", 'I', target_opor_no);
            packer.AddField("allow_opor_no", 'I', allow_opor_no);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_OPOR_NO_INT,target_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_OPOR_NO_INT,allow_opor_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_5_214_Request : BaseRequest, IRequest<pubL_5_214_Response>
    {
        public pubL_5_214_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.5.214";
            }
        }

        public int co_no { get; set; }
        public int target_opor_no { get; set; }
        public int pd_no { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("target_opor_no", 'I', target_opor_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_OPOR_NO_INT,target_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_5_215_Request : BaseRequest, IRequest<pubL_5_215_Response>
    {
        public pubL_5_215_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.5.215";
            }
        }

        public int co_no { get; set; }
        public int target_opor_no { get; set; }
        public int pd_no { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("target_opor_no", 'I', target_opor_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_OPOR_NO_INT,target_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_5_216_Request : BaseRequest, IRequest<pubL_5_216_Response>
    {
        public pubL_5_216_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.5.216";
            }
        }

        public int co_no { get; set; }
        public int target_opor_no { get; set; }
        public int exch_group_no { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("target_opor_no", 'I', target_opor_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_OPOR_NO_INT,target_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_5_217_Request : BaseRequest, IRequest<pubL_5_217_Response>
    {
        public pubL_5_217_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.5.217";
            }
        }

        public int co_no { get; set; }
        public int target_opor_no { get; set; }
        public int exch_group_no { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("target_opor_no", 'I', target_opor_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_OPOR_NO_INT,target_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

}
