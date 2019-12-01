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
    public class pubL_19_1_Request : BaseRequest, IRequest<pubL_19_1_Response>
    {
        public pubL_19_1_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.1";
            }
        }

        public int target_opor_no { get; set; }
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
        public int index_value { get; set; }
        public int manage_nolgn_opor_orders { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("target_opor_no", 'I', target_opor_no);
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
            packer.AddField("index_value", 'I', index_value);
            packer.AddField("manage_nolgn_opor_orders", 'I', manage_nolgn_opor_orders);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_OPOR_NO_INT,target_opor_no);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDEX_VALUE_INT,index_value);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MANAGE_NOLGN_OPOR_ORDERS_INT,manage_nolgn_opor_orders);
            return fastMsg;
        }
   }

    public class pubL_19_2_Request : BaseRequest, IRequest<pubL_19_2_Response>
    {
        public pubL_19_2_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.2";
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
        public int manage_nolgn_opor_orders { get; set; }
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
            packer.AddField("manage_nolgn_opor_orders", 'I', manage_nolgn_opor_orders);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MANAGE_NOLGN_OPOR_ORDERS_INT,manage_nolgn_opor_orders);
            return fastMsg;
        }
   }

    public class pubL_19_4_Request : BaseRequest, IRequest<pubL_19_4_Response>
    {
        public pubL_19_4_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.4";
            }
        }

        public int query_opor_no { get; set; }
        public int is_trader { get; set; }
        public String opor_type_str { get; set; }
        public String opor_status_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("query_opor_no", 'I', query_opor_no);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_TRADER_INT,is_trader);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_TYPE_STR_STR,opor_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_STATUS_STR_STR,opor_status_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_19_5_Request : BaseRequest, IRequest<pubL_19_5_Response>
    {
        public pubL_19_5_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.5";
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

    public class pubL_19_6_Request : BaseRequest, IRequest<pubL_19_6_Response>
    {
        public pubL_19_6_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.6";
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

    public class pubL_19_7_Request : BaseRequest, IRequest<pubL_19_7_Response>
    {
        public pubL_19_7_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.7";
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

    public class pubL_19_9_Request : BaseRequest, IRequest<pubL_19_9_Response>
    {
        public pubL_19_9_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.9";
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

    public class pubL_19_10_Request : BaseRequest, IRequest<pubL_19_10_Response>
    {
        public pubL_19_10_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.10";
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

    public class pubL_19_11_Request : BaseRequest, IRequest<pubL_19_11_Response>
    {
        public pubL_19_11_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.11";
            }
        }

        public int target_opor_no { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("target_opor_no", 'I', target_opor_no);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_OPOR_NO_INT,target_opor_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_19_12_Request : BaseRequest, IRequest<pubL_19_12_Response>
    {
        public pubL_19_12_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.12";
            }
        }

        public int begin_date { get; set; }
        public int end_date { get; set; }
        public int target_opor_no { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_OPOR_NO_INT,target_opor_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_19_14_Request : BaseRequest, IRequest<pubL_19_14_Response>
    {
        public pubL_19_14_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.14";
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

    public class pubL_19_15_Request : BaseRequest, IRequest<pubL_19_15_Response>
    {
        public pubL_19_15_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.15";
            }
        }

        public int is_trader { get; set; }
        public String opor_status_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("is_trader", 'I', is_trader);
            packer.AddField("opor_status_str", 'S', opor_status_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_TRADER_INT,is_trader);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_STATUS_STR_STR,opor_status_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_19_16_Request : BaseRequest, IRequest<pubL_19_16_Response>
    {
        public pubL_19_16_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.16";
            }
        }

        public int target_opor_no { get; set; }
        public String allow_oper_mac { get; set; }
        public String opor_rights_str { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("target_opor_no", 'I', target_opor_no);
            packer.AddField("allow_oper_mac", 'S', allow_oper_mac);
            packer.AddField("opor_rights_str", 'S', opor_rights_str);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_OPOR_NO_INT,target_opor_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_OPER_MAC_STR,allow_oper_mac);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_RIGHTS_STR_STR,opor_rights_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_19_17_Request : BaseRequest, IRequest<pubL_19_17_Response>
    {
        public pubL_19_17_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.17";
            }
        }

        public int target_opor_no { get; set; }
        public String allow_oper_mac { get; set; }
        public String opor_rights_str { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("target_opor_no", 'I', target_opor_no);
            packer.AddField("allow_oper_mac", 'S', allow_oper_mac);
            packer.AddField("opor_rights_str", 'S', opor_rights_str);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_OPOR_NO_INT,target_opor_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_OPER_MAC_STR,allow_oper_mac);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_RIGHTS_STR_STR,opor_rights_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_19_18_Request : BaseRequest, IRequest<pubL_19_18_Response>
    {
        public pubL_19_18_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.18";
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

    public class pubL_19_19_Request : BaseRequest, IRequest<pubL_19_19_Response>
    {
        public pubL_19_19_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.19";
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

    public class pubL_19_21_Request : BaseRequest, IRequest<pubL_19_21_Response>
    {
        public pubL_19_21_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.21";
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

    public class pubL_19_22_Request : BaseRequest, IRequest<pubL_19_22_Response>
    {
        public pubL_19_22_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.22";
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

    public class pubL_19_31_Request : BaseRequest, IRequest<pubL_19_31_Response>
    {
        public pubL_19_31_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.31";
            }
        }

        public int co_no { get; set; }
        public ulong config_no { get; set; }
        public String config_value { get; set; }
        public String config_name { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("config_no", 'L', config_no);
            packer.AddField("config_value", 'S', config_value);
            packer.AddField("config_name", 'S', config_name);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_NO_INT64,config_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_VALUE_STR,config_value);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_NAME_STR,config_name);
            return fastMsg;
        }
   }

    public class pubL_19_32_Request : BaseRequest, IRequest<pubL_19_32_Response>
    {
        public pubL_19_32_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.32";
            }
        }

        public String opor_no_str { get; set; }
        public ulong config_no { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("opor_no_str", 'S', opor_no_str);
            packer.AddField("config_no", 'L', config_no);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_STR_STR,opor_no_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_NO_INT64,config_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_19_33_Request : BaseRequest, IRequest<pubL_19_33_Response>
    {
        public pubL_19_33_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.33";
            }
        }

        public String parent_panel { get; set; }
        public String dbgrid_name { get; set; }
        public String dbgrid_conf_str { get; set; }
        public int client_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("parent_panel", 'S', parent_panel);
            packer.AddField("dbgrid_name", 'S', dbgrid_name);
            packer.AddField("dbgrid_conf_str", 'S', dbgrid_conf_str);
            packer.AddField("client_type", 'I', client_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PARENT_PANEL_STR,parent_panel);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_DBGRID_NAME_STR,dbgrid_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_DBGRID_CONF_STR_STR,dbgrid_conf_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLIENT_TYPE_INT,client_type);
            return fastMsg;
        }
   }

    public class pubL_19_34_Request : BaseRequest, IRequest<pubL_19_34_Response>
    {
        public pubL_19_34_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.34";
            }
        }

        public int client_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("client_type", 'I', client_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLIENT_TYPE_INT,client_type);
            return fastMsg;
        }
   }

    public class pubL_19_45_Request : BaseRequest, IRequest<pubL_19_45_Response>
    {
        public pubL_19_45_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.45";
            }
        }

        public int target_opor_no { get; set; }
        public int pd_no { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("target_opor_no", 'I', target_opor_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_OPOR_NO_INT,target_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_19_46_Request : BaseRequest, IRequest<pubL_19_46_Response>
    {
        public pubL_19_46_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.46";
            }
        }

        public int target_opor_no { get; set; }
        public int pd_no { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("target_opor_no", 'I', target_opor_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_OPOR_NO_INT,target_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_19_48_Request : BaseRequest, IRequest<pubL_19_48_Response>
    {
        public pubL_19_48_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.48";
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

    public class pubL_19_51_Request : BaseRequest, IRequest<pubL_19_51_Response>
    {
        public pubL_19_51_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.51";
            }
        }

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

    public class pubL_19_52_Request : BaseRequest, IRequest<pubL_19_52_Response>
    {
        public pubL_19_52_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.52";
            }
        }

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

    public class pubL_19_54_Request : BaseRequest, IRequest<pubL_19_54_Response>
    {
        public pubL_19_54_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.54";
            }
        }

        public int exch_group_no { get; set; }
        public int default_group_flag { get; set; }
        public int pd_no { get; set; }
        public String exch_group_status_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEFAULT_GROUP_FLAG_INT,default_group_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_STATUS_STR_STR,exch_group_status_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_19_55_Request : BaseRequest, IRequest<pubL_19_55_Response>
    {
        public pubL_19_55_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.55";
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

    public class pubL_19_56_Request : BaseRequest, IRequest<pubL_19_56_Response>
    {
        public pubL_19_56_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.56";
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

    public class pubL_19_57_Request : BaseRequest, IRequest<pubL_19_57_Response>
    {
        public pubL_19_57_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.57";
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

    public class pubL_19_58_Request : BaseRequest, IRequest<pubL_19_58_Response>
    {
        public pubL_19_58_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.58";
            }
        }

        public int exch_group_no { get; set; }
        public int pd_no { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_19_59_Request : BaseRequest, IRequest<pubL_19_59_Response>
    {
        public pubL_19_59_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.59";
            }
        }

        public int begin_date { get; set; }
        public int end_date { get; set; }
        public int exch_group_no { get; set; }
        public int pd_no { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT,end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_19_60_Request : BaseRequest, IRequest<pubL_19_60_Response>
    {
        public pubL_19_60_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.60";
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

    public class pubL_19_73_Request : BaseRequest, IRequest<pubL_19_73_Response>
    {
        public pubL_19_73_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.73";
            }
        }

        public int pd_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            return fastMsg;
        }
   }

    public class pubL_19_61_Request : BaseRequest, IRequest<pubL_19_61_Response>
    {
        public pubL_19_61_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.61";
            }
        }

        public int target_opor_no { get; set; }
        public int exch_group_no { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("target_opor_no", 'I', target_opor_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_OPOR_NO_INT,target_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_19_62_Request : BaseRequest, IRequest<pubL_19_62_Response>
    {
        public pubL_19_62_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.62";
            }
        }

        public int target_opor_no { get; set; }
        public int exch_group_no { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("target_opor_no", 'I', target_opor_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_OPOR_NO_INT,target_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_19_64_Request : BaseRequest, IRequest<pubL_19_64_Response>
    {
        public pubL_19_64_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.64";
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

    public class pubL_19_65_Request : BaseRequest, IRequest<pubL_19_65_Response>
    {
        public pubL_19_65_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.65";
            }
        }

        public String group_name { get; set; }
        public String remark_info { get; set; }
        public int pd_account_group_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("group_name", 'S', group_name);
            packer.AddField("remark_info", 'S', remark_info);
            packer.AddField("pd_account_group_type", 'I', pd_account_group_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_GROUP_NAME_STR,group_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_ACCOUNT_GROUP_TYPE_INT,pd_account_group_type);
            return fastMsg;
        }
   }

    public class pubL_19_66_Request : BaseRequest, IRequest<pubL_19_66_Response>
    {
        public pubL_19_66_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.66";
            }
        }

        public int group_no { get; set; }
        public String group_name { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("group_no", 'I', group_no);
            packer.AddField("group_name", 'S', group_name);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_GROUP_NO_INT,group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_GROUP_NAME_STR,group_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class pubL_19_67_Request : BaseRequest, IRequest<pubL_19_67_Response>
    {
        public pubL_19_67_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.67";
            }
        }

        public int group_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("group_no", 'I', group_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_GROUP_NO_INT,group_no);
            return fastMsg;
        }
   }

    public class pubL_19_68_Request : BaseRequest, IRequest<pubL_19_68_Response>
    {
        public pubL_19_68_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.68";
            }
        }

        public int group_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("group_no", 'I', group_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_GROUP_NO_INT,group_no);
            return fastMsg;
        }
   }

    public class pubL_19_69_Request : BaseRequest, IRequest<pubL_19_69_Response>
    {
        public pubL_19_69_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.69";
            }
        }

        public int group_no { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public int exch_group_no { get; set; }
        public double weight_ratio { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("group_no", 'I', group_no);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("weight_ratio", 'D', weight_ratio);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_GROUP_NO_INT,group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WEIGHT_RATIO_FLOAT,weight_ratio);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class pubL_19_70_Request : BaseRequest, IRequest<pubL_19_70_Response>
    {
        public pubL_19_70_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.70";
            }
        }

        public int group_no { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public int exch_group_no { get; set; }
        public double weight_ratio { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("group_no", 'I', group_no);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("weight_ratio", 'D', weight_ratio);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_GROUP_NO_INT,group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WEIGHT_RATIO_FLOAT,weight_ratio);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class pubL_19_71_Request : BaseRequest, IRequest<pubL_19_71_Response>
    {
        public pubL_19_71_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.71";
            }
        }

        public int group_no { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public int exch_group_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("group_no", 'I', group_no);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_GROUP_NO_INT,group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            return fastMsg;
        }
   }

    public class pubL_19_72_Request : BaseRequest, IRequest<pubL_19_72_Response>
    {
        public pubL_19_72_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.72";
            }
        }

        public int group_no { get; set; }
        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public int part_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("group_no", 'I', group_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("part_no", 'I', part_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_GROUP_NO_INT,group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PART_NO_INT,part_no);
            return fastMsg;
        }
   }

    public class pubL_19_77_Request : BaseRequest, IRequest<pubL_19_77_Response>
    {
        public pubL_19_77_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.77";
            }
        }

        public int target_opor_no { get; set; }
        public String allow_opor_no_str { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("target_opor_no", 'I', target_opor_no);
            packer.AddField("allow_opor_no_str", 'S', allow_opor_no_str);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_OPOR_NO_INT,target_opor_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_OPOR_NO_STR_STR,allow_opor_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_19_74_Request : BaseRequest, IRequest<pubL_19_74_Response>
    {
        public pubL_19_74_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.74";
            }
        }

        public int target_opor_no { get; set; }
        public int allow_opor_no { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("target_opor_no", 'I', target_opor_no);
            packer.AddField("allow_opor_no", 'I', allow_opor_no);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_OPOR_NO_INT,target_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_OPOR_NO_INT,allow_opor_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_19_75_Request : BaseRequest, IRequest<pubL_19_75_Response>
    {
        public pubL_19_75_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.75";
            }
        }

        public int target_opor_no { get; set; }
        public int allow_opor_no { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("target_opor_no", 'I', target_opor_no);
            packer.AddField("allow_opor_no", 'I', allow_opor_no);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_OPOR_NO_INT,target_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_OPOR_NO_INT,allow_opor_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_19_78_Request : BaseRequest, IRequest<pubL_19_78_Response>
    {
        public pubL_19_78_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.78";
            }
        }

        public int target_opor_no { get; set; }
        public String allow_opor_no_str { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("target_opor_no", 'I', target_opor_no);
            packer.AddField("allow_opor_no_str", 'S', allow_opor_no_str);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_OPOR_NO_INT,target_opor_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_OPOR_NO_STR_STR,allow_opor_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_19_76_Request : BaseRequest, IRequest<pubL_19_76_Response>
    {
        public pubL_19_76_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.76";
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

    public class pubL_19_89_Request : BaseRequest, IRequest<pubL_19_89_Response>
    {
        public pubL_19_89_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.89";
            }
        }

        public int begin_date { get; set; }
        public int end_date { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public String crncy_type { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("crncy_type", 'S', crncy_type);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT,end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_19_91_Request : BaseRequest, IRequest<pubL_19_91_Response>
    {
        public pubL_19_91_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.91";
            }
        }

        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public String crncy_type { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("crncy_type", 'S', crncy_type);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_19_90_Request : BaseRequest, IRequest<pubL_19_90_Response>
    {
        public pubL_19_90_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.90";
            }
        }

        public int init_date { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public String crncy_type { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("init_date", 'I', init_date);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("crncy_type", 'S', crncy_type);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_19_92_Request : BaseRequest, IRequest<pubL_19_92_Response>
    {
        public pubL_19_92_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.92";
            }
        }

        public int exch_group_no { get; set; }
        public int begin_date { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("begin_date", 'I', begin_date);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            return fastMsg;
        }
   }

    public class pubL_19_93_Request : BaseRequest, IRequest<pubL_19_93_Response>
    {
        public pubL_19_93_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.93";
            }
        }

        public int exch_group_no { get; set; }
        public int begin_date { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("begin_date", 'I', begin_date);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            return fastMsg;
        }
   }

    public class pubL_19_94_Request : BaseRequest, IRequest<pubL_19_94_Response>
    {
        public pubL_19_94_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.94";
            }
        }

        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            return fastMsg;
        }
   }

    public class pubL_19_95_Request : BaseRequest, IRequest<pubL_19_95_Response>
    {
        public pubL_19_95_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.95";
            }
        }

        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int begin_date { get; set; }
        public int end_date { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT,end_date);
            return fastMsg;
        }
   }

    public class pubL_19_202_Request : BaseRequest, IRequest<pubL_19_202_Response>
    {
        public pubL_19_202_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.202";
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

    public class pubL_19_203_Request : BaseRequest, IRequest<pubL_19_203_Response>
    {
        public pubL_19_203_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.203";
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

    public class pubL_19_900_Request : BaseRequest, IRequest<pubL_19_900_Response>
    {
        public pubL_19_900_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.900";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public String crncy_type { get; set; }
        public int asset_item { get; set; }
        public double asset_value { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("crncy_type", 'S', crncy_type);
            packer.AddField("asset_item", 'I', asset_item);
            packer.AddField("asset_value", 'D', asset_value);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ITEM_INT,asset_item);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_VALUE_FLOAT,asset_value);
            return fastMsg;
        }
   }

    public class pubL_19_901_Request : BaseRequest, IRequest<pubL_19_901_Response>
    {
        public pubL_19_901_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.901";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public String crncy_type { get; set; }
        public int asset_item { get; set; }
        public double asset_value { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("crncy_type", 'S', crncy_type);
            packer.AddField("asset_item", 'I', asset_item);
            packer.AddField("asset_value", 'D', asset_value);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ITEM_INT,asset_item);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_VALUE_FLOAT,asset_value);
            return fastMsg;
        }
   }

    public class pubL_19_902_Request : BaseRequest, IRequest<pubL_19_902_Response>
    {
        public pubL_19_902_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.902";
            }
        }

        public int target_pd_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("target_pd_no", 'I', target_pd_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_PD_NO_INT,target_pd_no);
            return fastMsg;
        }
   }

    public class pubL_19_301_Request : BaseRequest, IRequest<pubL_19_301_Response>
    {
        public pubL_19_301_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.301";
            }
        }

        public int co_no { get; set; }
        public int comm_trd_type { get; set; }
        public String hedg_name { get; set; }
        public int futu_exch_group_no { get; set; }
        public int futu_asset_acco_no { get; set; }
        public int futu_order_pd_no { get; set; }
        public int secu_exch_group_no { get; set; }
        public int secu_asset_acco_no { get; set; }
        public int secu_order_pd_no { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("comm_trd_type", 'I', comm_trd_type);
            packer.AddField("hedg_name", 'S', hedg_name);
            packer.AddField("futu_exch_group_no", 'I', futu_exch_group_no);
            packer.AddField("futu_asset_acco_no", 'I', futu_asset_acco_no);
            packer.AddField("futu_order_pd_no", 'I', futu_order_pd_no);
            packer.AddField("secu_exch_group_no", 'I', secu_exch_group_no);
            packer.AddField("secu_asset_acco_no", 'I', secu_asset_acco_no);
            packer.AddField("secu_order_pd_no", 'I', secu_order_pd_no);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_TRD_TYPE_INT,comm_trd_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_HEDG_NAME_STR,hedg_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_EXCH_GROUP_NO_INT,futu_exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ASSET_ACCO_NO_INT,futu_asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ORDER_PD_NO_INT,futu_order_pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SECU_EXCH_GROUP_NO_INT,secu_exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SECU_ASSET_ACCO_NO_INT,secu_asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SECU_ORDER_PD_NO_INT,secu_order_pd_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class pubL_19_303_Request : BaseRequest, IRequest<pubL_19_303_Response>
    {
        public pubL_19_303_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.303";
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

    public class pubL_19_304_Request : BaseRequest, IRequest<pubL_19_304_Response>
    {
        public pubL_19_304_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.304";
            }
        }

        public int query_opor_no { get; set; }
        public int comm_trd_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("query_opor_no", 'I', query_opor_no);
            packer.AddField("comm_trd_type", 'I', comm_trd_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_OPOR_NO_INT,query_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_TRD_TYPE_INT,comm_trd_type);
            return fastMsg;
        }
   }

    public class pubL_19_401_Request : BaseRequest, IRequest<pubL_19_401_Response>
    {
        public pubL_19_401_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.401";
            }
        }

        public int co_no { get; set; }
        public int comm_trd_type { get; set; }
        public String hedg_plan_name { get; set; }
        public int contrc_code_no { get; set; }
        public double futu_qty { get; set; }
        public double basket_qty { get; set; }
        public ulong basket_id { get; set; }
        public int plan_type { get; set; }
        public ulong hedg_no { get; set; }
        public double hedging_pankou { get; set; }
        public double futu_price_offset { get; set; }
        public double price_offset { get; set; }
        public double target_base_diff { get; set; }
        public double template_base_diff { get; set; }
        public double up_value_ratio { get; set; }
        public double down_value_ratio { get; set; }
        public double stop_value_ratio { get; set; }
        public double cash_replace_amt { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("comm_trd_type", 'I', comm_trd_type);
            packer.AddField("hedg_plan_name", 'S', hedg_plan_name);
            packer.AddField("contrc_code_no", 'I', contrc_code_no);
            packer.AddField("futu_qty", 'D', futu_qty);
            packer.AddField("basket_qty", 'D', basket_qty);
            packer.AddField("basket_id", 'L', basket_id);
            packer.AddField("plan_type", 'I', plan_type);
            packer.AddField("hedg_no", 'L', hedg_no);
            packer.AddField("hedging_pankou", 'D', hedging_pankou);
            packer.AddField("futu_price_offset", 'D', futu_price_offset);
            packer.AddField("price_offset", 'D', price_offset);
            packer.AddField("target_base_diff", 'D', target_base_diff);
            packer.AddField("template_base_diff", 'D', template_base_diff);
            packer.AddField("up_value_ratio", 'D', up_value_ratio);
            packer.AddField("down_value_ratio", 'D', down_value_ratio);
            packer.AddField("stop_value_ratio", 'D', stop_value_ratio);
            packer.AddField("cash_replace_amt", 'D', cash_replace_amt);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_TRD_TYPE_INT,comm_trd_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_HEDG_PLAN_NAME_STR,hedg_plan_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT,contrc_code_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_QTY_FLOAT,futu_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_QTY_FLOAT,basket_qty);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_ID_INT64,basket_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PLAN_TYPE_INT,plan_type);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_HEDG_NO_INT64,hedg_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HEDGING_PANKOU_FLOAT,hedging_pankou);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_PRICE_OFFSET_FLOAT,futu_price_offset);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_OFFSET_FLOAT,price_offset);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_BASE_DIFF_FLOAT,target_base_diff);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TEMPLATE_BASE_DIFF_FLOAT,template_base_diff);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UP_VALUE_RATIO_FLOAT,up_value_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DOWN_VALUE_RATIO_FLOAT,down_value_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOP_VALUE_RATIO_FLOAT,stop_value_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_REPLACE_AMT_FLOAT,cash_replace_amt);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class pubL_19_402_Request : BaseRequest, IRequest<pubL_19_402_Response>
    {
        public pubL_19_402_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.402";
            }
        }

        public ulong row_id { get; set; }
        public String hedg_plan_name { get; set; }
        public double futu_qty { get; set; }
        public double basket_qty { get; set; }
        public double hedging_pankou { get; set; }
        public double futu_price_offset { get; set; }
        public double price_offset { get; set; }
        public double target_base_diff { get; set; }
        public double template_base_diff { get; set; }
        public double up_value_ratio { get; set; }
        public double down_value_ratio { get; set; }
        public double stop_value_ratio { get; set; }
        public double cash_replace_amt { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("hedg_plan_name", 'S', hedg_plan_name);
            packer.AddField("futu_qty", 'D', futu_qty);
            packer.AddField("basket_qty", 'D', basket_qty);
            packer.AddField("hedging_pankou", 'D', hedging_pankou);
            packer.AddField("futu_price_offset", 'D', futu_price_offset);
            packer.AddField("price_offset", 'D', price_offset);
            packer.AddField("target_base_diff", 'D', target_base_diff);
            packer.AddField("template_base_diff", 'D', template_base_diff);
            packer.AddField("up_value_ratio", 'D', up_value_ratio);
            packer.AddField("down_value_ratio", 'D', down_value_ratio);
            packer.AddField("stop_value_ratio", 'D', stop_value_ratio);
            packer.AddField("cash_replace_amt", 'D', cash_replace_amt);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_HEDG_PLAN_NAME_STR,hedg_plan_name);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_QTY_FLOAT,futu_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_QTY_FLOAT,basket_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HEDGING_PANKOU_FLOAT,hedging_pankou);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_PRICE_OFFSET_FLOAT,futu_price_offset);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_OFFSET_FLOAT,price_offset);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_BASE_DIFF_FLOAT,target_base_diff);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TEMPLATE_BASE_DIFF_FLOAT,template_base_diff);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UP_VALUE_RATIO_FLOAT,up_value_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DOWN_VALUE_RATIO_FLOAT,down_value_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOP_VALUE_RATIO_FLOAT,stop_value_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_REPLACE_AMT_FLOAT,cash_replace_amt);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class pubL_19_403_Request : BaseRequest, IRequest<pubL_19_403_Response>
    {
        public pubL_19_403_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.403";
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

    public class pubL_19_404_Request : BaseRequest, IRequest<pubL_19_404_Response>
    {
        public pubL_19_404_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.404";
            }
        }

        public int query_opor_no { get; set; }
        public int comm_trd_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("query_opor_no", 'I', query_opor_no);
            packer.AddField("comm_trd_type", 'I', comm_trd_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_OPOR_NO_INT,query_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_TRD_TYPE_INT,comm_trd_type);
            return fastMsg;
        }
   }

    public class pubL_19_501_Request : BaseRequest, IRequest<pubL_19_501_Response>
    {
        public pubL_19_501_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.501";
            }
        }

        public int target_opor_no { get; set; }
        public int allow_opor_no { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("target_opor_no", 'I', target_opor_no);
            packer.AddField("allow_opor_no", 'I', allow_opor_no);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_OPOR_NO_INT,target_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_OPOR_NO_INT,allow_opor_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_19_502_Request : BaseRequest, IRequest<pubL_19_502_Response>
    {
        public pubL_19_502_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.502";
            }
        }

        public int target_opor_no { get; set; }
        public int allow_opor_no { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("target_opor_no", 'I', target_opor_no);
            packer.AddField("allow_opor_no", 'I', allow_opor_no);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_OPOR_NO_INT,target_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_OPOR_NO_INT,allow_opor_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_19_503_Request : BaseRequest, IRequest<pubL_19_503_Response>
    {
        public pubL_19_503_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.503";
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

    public class pubL_19_504_Request : BaseRequest, IRequest<pubL_19_504_Response>
    {
        public pubL_19_504_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.504";
            }
        }

        public int pd_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            return fastMsg;
        }
   }

    public class pubL_19_505_Request : BaseRequest, IRequest<pubL_19_505_Response>
    {
        public pubL_19_505_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.505";
            }
        }

        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public double last_price { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("last_price", 'D', last_price);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT,last_price);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_19_506_Request : BaseRequest, IRequest<pubL_19_506_Response>
    {
        public pubL_19_506_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.506";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public String stock_code { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_19_507_Request : BaseRequest, IRequest<pubL_19_507_Response>
    {
        public pubL_19_507_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.507";
            }
        }

        public int co_no { get; set; }
        public String opor_no_str { get; set; }
        public String index_value_str { get; set; }
        public String oper_remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("opor_no_str", 'S', opor_no_str);
            packer.AddField("index_value_str", 'S', index_value_str);
            packer.AddField("oper_remark_info", 'S', oper_remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_STR_STR,opor_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_INDEX_VALUE_STR_STR,index_value_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR,oper_remark_info);
            return fastMsg;
        }
   }

    public class pubL_19_508_Request : BaseRequest, IRequest<pubL_19_508_Response>
    {
        public pubL_19_508_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.508";
            }
        }

        public int target_opor_no { get; set; }
        public String query_oper_way { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("target_opor_no", 'I', target_opor_no);
            packer.AddField("query_oper_way", 'S', query_oper_way);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_OPOR_NO_INT,target_opor_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_OPER_WAY_STR,query_oper_way);
            return fastMsg;
        }
   }

    public class pubL_19_96_Request : BaseRequest, IRequest<pubL_19_96_Response>
    {
        public pubL_19_96_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.19.96";
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

}
