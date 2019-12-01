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
    public class valL_4_1_Request : BaseRequest, IRequest<valL_4_1_Response>
    {
        public valL_4_1_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "valL.4.1";
            }
        }

        public int co_no { get; set; }
        public String mail_server { get; set; }
        public int server_type { get; set; }
        public String mail_server_protocol { get; set; }
        public int mail_server_port { get; set; }
        public String mail_server_username { get; set; }
        public String mail_server_password { get; set; }
        public int ssl_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("mail_server", 'S', mail_server);
            packer.AddField("server_type", 'I', server_type);
            packer.AddField("mail_server_protocol", 'S', mail_server_protocol);
            packer.AddField("mail_server_port", 'I', mail_server_port);
            packer.AddField("mail_server_username", 'S', mail_server_username);
            packer.AddField("mail_server_password", 'S', mail_server_password);
            packer.AddField("ssl_type", 'I', ssl_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MAIL_SERVER_STR,mail_server);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SERVER_TYPE_INT,server_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MAIL_SERVER_PROTOCOL_STR,mail_server_protocol);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MAIL_SERVER_PORT_INT,mail_server_port);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MAIL_SERVER_USERNAME_STR,mail_server_username);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MAIL_SERVER_PASSWORD_STR,mail_server_password);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SSL_TYPE_INT,ssl_type);
            return fastMsg;
        }
   }

    public class valL_4_2_Request : BaseRequest, IRequest<valL_4_2_Response>
    {
        public valL_4_2_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "valL.4.2";
            }
        }

        public ulong row_id { get; set; }
        public int co_no { get; set; }
        public String mail_server { get; set; }
        public int server_type { get; set; }
        public String mail_server_protocol { get; set; }
        public int mail_server_port { get; set; }
        public String mail_server_username { get; set; }
        public String mail_server_password { get; set; }
        public int ssl_type { get; set; }
        public int rule_flag { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("mail_server", 'S', mail_server);
            packer.AddField("server_type", 'I', server_type);
            packer.AddField("mail_server_protocol", 'S', mail_server_protocol);
            packer.AddField("mail_server_port", 'I', mail_server_port);
            packer.AddField("mail_server_username", 'S', mail_server_username);
            packer.AddField("mail_server_password", 'S', mail_server_password);
            packer.AddField("ssl_type", 'I', ssl_type);
            packer.AddField("rule_flag", 'I', rule_flag);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MAIL_SERVER_STR,mail_server);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SERVER_TYPE_INT,server_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MAIL_SERVER_PROTOCOL_STR,mail_server_protocol);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MAIL_SERVER_PORT_INT,mail_server_port);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MAIL_SERVER_USERNAME_STR,mail_server_username);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MAIL_SERVER_PASSWORD_STR,mail_server_password);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SSL_TYPE_INT,ssl_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RULE_FLAG_INT,rule_flag);
            return fastMsg;
        }
   }

    public class valL_4_3_Request : BaseRequest, IRequest<valL_4_3_Response>
    {
        public valL_4_3_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "valL.4.3";
            }
        }

        public int co_no { get; set; }
        public int rule_flag { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("rule_flag", 'I', rule_flag);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RULE_FLAG_INT,rule_flag);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class valL_4_11_Request : BaseRequest, IRequest<valL_4_11_Response>
    {
        public valL_4_11_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "valL.4.11";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public String file_name { get; set; }
        public String netvalue_date_posi { get; set; }
        public int valtable_begin_row { get; set; }
        public String fina_acco_code { get; set; }
        public String fina_acco_name { get; set; }
        public String crncy_type { get; set; }
        public String amount { get; set; }
        public String unit_cost { get; set; }
        public String prime_cost_original { get; set; }
        public String prime_cost_crncy { get; set; }
        public String cost_net_ratio { get; set; }
        public String market_price { get; set; }
        public String market_value_original { get; set; }
        public String market_value_crncy { get; set; }
        public String market_net_ratio { get; set; }
        public String evalu_add_original { get; set; }
        public String evalu_add_crncy { get; set; }
        public String stop_info { get; set; }
        public String rights_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("file_name", 'S', file_name);
            packer.AddField("netvalue_date_posi", 'S', netvalue_date_posi);
            packer.AddField("valtable_begin_row", 'I', valtable_begin_row);
            packer.AddField("fina_acco_code", 'S', fina_acco_code);
            packer.AddField("fina_acco_name", 'S', fina_acco_name);
            packer.AddField("crncy_type", 'S', crncy_type);
            packer.AddField("amount", 'S', amount);
            packer.AddField("unit_cost", 'S', unit_cost);
            packer.AddField("prime_cost_original", 'S', prime_cost_original);
            packer.AddField("prime_cost_crncy", 'S', prime_cost_crncy);
            packer.AddField("cost_net_ratio", 'S', cost_net_ratio);
            packer.AddField("market_price", 'S', market_price);
            packer.AddField("market_value_original", 'S', market_value_original);
            packer.AddField("market_value_crncy", 'S', market_value_crncy);
            packer.AddField("market_net_ratio", 'S', market_net_ratio);
            packer.AddField("evalu_add_original", 'S', evalu_add_original);
            packer.AddField("evalu_add_crncy", 'S', evalu_add_crncy);
            packer.AddField("stop_info", 'S', stop_info);
            packer.AddField("rights_info", 'S', rights_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FILE_NAME_STR,file_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_NETVALUE_DATE_POSI_STR,netvalue_date_posi);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_VALTABLE_BEGIN_ROW_INT,valtable_begin_row);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FINA_ACCO_CODE_STR,fina_acco_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FINA_ACCO_NAME_STR,fina_acco_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_AMOUNT_STR,amount);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_COST_STR,unit_cost);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PRIME_COST_ORIGINAL_STR,prime_cost_original);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PRIME_COST_CRNCY_STR,prime_cost_crncy);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COST_NET_RATIO_STR,cost_net_ratio);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_PRICE_STR,market_price);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_VALUE_ORIGINAL_STR,market_value_original);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_VALUE_CRNCY_STR,market_value_crncy);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_NET_RATIO_STR,market_net_ratio);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EVALU_ADD_ORIGINAL_STR,evalu_add_original);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EVALU_ADD_CRNCY_STR,evalu_add_crncy);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOP_INFO_STR,stop_info);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RIGHTS_INFO_STR,rights_info);
            return fastMsg;
        }
   }

    public class valL_4_12_Request : BaseRequest, IRequest<valL_4_12_Response>
    {
        public valL_4_12_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "valL.4.12";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public String file_name { get; set; }
        public String netvalue_date_posi { get; set; }
        public int valtable_begin_row { get; set; }
        public String fina_acco_code { get; set; }
        public String fina_acco_name { get; set; }
        public String crncy_type { get; set; }
        public String amount { get; set; }
        public String unit_cost { get; set; }
        public String prime_cost_original { get; set; }
        public String prime_cost_crncy { get; set; }
        public String cost_net_ratio { get; set; }
        public String market_price { get; set; }
        public String market_value_original { get; set; }
        public String market_value_crncy { get; set; }
        public String market_net_ratio { get; set; }
        public String evalu_add_original { get; set; }
        public String evalu_add_crncy { get; set; }
        public String stop_info { get; set; }
        public String rights_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("file_name", 'S', file_name);
            packer.AddField("netvalue_date_posi", 'S', netvalue_date_posi);
            packer.AddField("valtable_begin_row", 'I', valtable_begin_row);
            packer.AddField("fina_acco_code", 'S', fina_acco_code);
            packer.AddField("fina_acco_name", 'S', fina_acco_name);
            packer.AddField("crncy_type", 'S', crncy_type);
            packer.AddField("amount", 'S', amount);
            packer.AddField("unit_cost", 'S', unit_cost);
            packer.AddField("prime_cost_original", 'S', prime_cost_original);
            packer.AddField("prime_cost_crncy", 'S', prime_cost_crncy);
            packer.AddField("cost_net_ratio", 'S', cost_net_ratio);
            packer.AddField("market_price", 'S', market_price);
            packer.AddField("market_value_original", 'S', market_value_original);
            packer.AddField("market_value_crncy", 'S', market_value_crncy);
            packer.AddField("market_net_ratio", 'S', market_net_ratio);
            packer.AddField("evalu_add_original", 'S', evalu_add_original);
            packer.AddField("evalu_add_crncy", 'S', evalu_add_crncy);
            packer.AddField("stop_info", 'S', stop_info);
            packer.AddField("rights_info", 'S', rights_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FILE_NAME_STR,file_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_NETVALUE_DATE_POSI_STR,netvalue_date_posi);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_VALTABLE_BEGIN_ROW_INT,valtable_begin_row);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FINA_ACCO_CODE_STR,fina_acco_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FINA_ACCO_NAME_STR,fina_acco_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_AMOUNT_STR,amount);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_COST_STR,unit_cost);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PRIME_COST_ORIGINAL_STR,prime_cost_original);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PRIME_COST_CRNCY_STR,prime_cost_crncy);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COST_NET_RATIO_STR,cost_net_ratio);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_PRICE_STR,market_price);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_VALUE_ORIGINAL_STR,market_value_original);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_VALUE_CRNCY_STR,market_value_crncy);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_NET_RATIO_STR,market_net_ratio);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EVALU_ADD_ORIGINAL_STR,evalu_add_original);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EVALU_ADD_CRNCY_STR,evalu_add_crncy);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOP_INFO_STR,stop_info);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RIGHTS_INFO_STR,rights_info);
            return fastMsg;
        }
   }

    public class valL_4_13_Request : BaseRequest, IRequest<valL_4_13_Response>
    {
        public valL_4_13_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "valL.4.13";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class valL_4_21_Request : BaseRequest, IRequest<valL_4_21_Response>
    {
        public valL_4_21_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "valL.4.21";
            }
        }

        public int evalu_date { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int valtable_no { get; set; }
        public String fina_acco_code { get; set; }
        public String fina_acco_name { get; set; }
        public String crncy_type { get; set; }
        public String amount { get; set; }
        public String unit_cost { get; set; }
        public String prime_cost_original { get; set; }
        public String prime_cost_crncy { get; set; }
        public String cost_net_ratio { get; set; }
        public String market_price { get; set; }
        public String market_value_original { get; set; }
        public String market_value_crncy { get; set; }
        public String market_net_ratio { get; set; }
        public String evalu_add_original { get; set; }
        public String evalu_add_crncy { get; set; }
        public String stop_info { get; set; }
        public String rights_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("evalu_date", 'I', evalu_date);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("valtable_no", 'I', valtable_no);
            packer.AddField("fina_acco_code", 'S', fina_acco_code);
            packer.AddField("fina_acco_name", 'S', fina_acco_name);
            packer.AddField("crncy_type", 'S', crncy_type);
            packer.AddField("amount", 'S', amount);
            packer.AddField("unit_cost", 'S', unit_cost);
            packer.AddField("prime_cost_original", 'S', prime_cost_original);
            packer.AddField("prime_cost_crncy", 'S', prime_cost_crncy);
            packer.AddField("cost_net_ratio", 'S', cost_net_ratio);
            packer.AddField("market_price", 'S', market_price);
            packer.AddField("market_value_original", 'S', market_value_original);
            packer.AddField("market_value_crncy", 'S', market_value_crncy);
            packer.AddField("market_net_ratio", 'S', market_net_ratio);
            packer.AddField("evalu_add_original", 'S', evalu_add_original);
            packer.AddField("evalu_add_crncy", 'S', evalu_add_crncy);
            packer.AddField("stop_info", 'S', stop_info);
            packer.AddField("rights_info", 'S', rights_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EVALU_DATE_INT,evalu_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_VALTABLE_NO_INT,valtable_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FINA_ACCO_CODE_STR,fina_acco_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FINA_ACCO_NAME_STR,fina_acco_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_AMOUNT_STR,amount);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_COST_STR,unit_cost);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PRIME_COST_ORIGINAL_STR,prime_cost_original);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PRIME_COST_CRNCY_STR,prime_cost_crncy);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COST_NET_RATIO_STR,cost_net_ratio);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_PRICE_STR,market_price);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_VALUE_ORIGINAL_STR,market_value_original);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_VALUE_CRNCY_STR,market_value_crncy);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_NET_RATIO_STR,market_net_ratio);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EVALU_ADD_ORIGINAL_STR,evalu_add_original);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EVALU_ADD_CRNCY_STR,evalu_add_crncy);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOP_INFO_STR,stop_info);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RIGHTS_INFO_STR,rights_info);
            return fastMsg;
        }
   }

    public class valL_4_22_Request : BaseRequest, IRequest<valL_4_22_Response>
    {
        public valL_4_22_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "valL.4.22";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int evalu_date { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("evalu_date", 'I', evalu_date);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EVALU_DATE_INT,evalu_date);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

}
