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
    public class rptL_1_1_Request : BaseRequest, IRequest<rptL_1_1_Response>
    {
        public rptL_1_1_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.1.1";
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

    public class rptL_1_2_Request : BaseRequest, IRequest<rptL_1_2_Response>
    {
        public rptL_1_2_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.1.2";
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

    public class rptL_1_3_Request : BaseRequest, IRequest<rptL_1_3_Response>
    {
        public rptL_1_3_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.1.3";
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

    public class rptL_1_21_Request : BaseRequest, IRequest<rptL_1_21_Response>
    {
        public rptL_1_21_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.1.21";
            }
        }

        public int sql_no { get; set; }
        public String sql_name { get; set; }
        public String sql_str { get; set; }
        public int sql_type { get; set; }
        public String in_params { get; set; }
        public String in_params_value { get; set; }
        public int valid_flag { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("sql_no", 'I', sql_no);
            packer.AddField("sql_name", 'S', sql_name);
            packer.AddField("sql_str", 'S', sql_str);
            packer.AddField("sql_type", 'I', sql_type);
            packer.AddField("in_params", 'S', in_params);
            packer.AddField("in_params_value", 'S', in_params_value);
            packer.AddField("valid_flag", 'I', valid_flag);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SQL_NO_INT,sql_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_SQL_NAME_STR,sql_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_SQL_STR_STR,sql_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SQL_TYPE_INT,sql_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_IN_PARAMS_STR,in_params);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_IN_PARAMS_VALUE_STR,in_params_value);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_VALID_FLAG_INT,valid_flag);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class rptL_1_22_Request : BaseRequest, IRequest<rptL_1_22_Response>
    {
        public rptL_1_22_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.1.22";
            }
        }

        public int sql_no { get; set; }
        public String sql_name { get; set; }
        public String sql_str { get; set; }
        public int sql_type { get; set; }
        public String in_params { get; set; }
        public String in_params_value { get; set; }
        public int valid_flag { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("sql_no", 'I', sql_no);
            packer.AddField("sql_name", 'S', sql_name);
            packer.AddField("sql_str", 'S', sql_str);
            packer.AddField("sql_type", 'I', sql_type);
            packer.AddField("in_params", 'S', in_params);
            packer.AddField("in_params_value", 'S', in_params_value);
            packer.AddField("valid_flag", 'I', valid_flag);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SQL_NO_INT,sql_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_SQL_NAME_STR,sql_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_SQL_STR_STR,sql_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SQL_TYPE_INT,sql_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_IN_PARAMS_STR,in_params);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_IN_PARAMS_VALUE_STR,in_params_value);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_VALID_FLAG_INT,valid_flag);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class rptL_1_23_Request : BaseRequest, IRequest<rptL_1_23_Response>
    {
        public rptL_1_23_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.1.23";
            }
        }

        public String exe_sql_name { get; set; }
        public String in_params_value { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exe_sql_name", 'S', exe_sql_name);
            packer.AddField("in_params_value", 'S', in_params_value);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXE_SQL_NAME_STR,exe_sql_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_IN_PARAMS_VALUE_STR,in_params_value);
            return fastMsg;
        }
   }

    public class rptL_1_25_Request : BaseRequest, IRequest<rptL_1_25_Response>
    {
        public rptL_1_25_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.1.25";
            }
        }

        public String exe_sql_name { get; set; }
        public int exe_sql_type { get; set; }
        public String exe_sql_str { get; set; }
        public int manual_modi_flag { get; set; }
        public String in_params_value { get; set; }
        public String update_table_name { get; set; }
        public String update_fields { get; set; }
        public String rl_fields { get; set; }
        public String join_fields { get; set; }
        public int sql_no { get; set; }
        public String sql_name { get; set; }
        public int valid_flag { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exe_sql_name", 'S', exe_sql_name);
            packer.AddField("exe_sql_type", 'I', exe_sql_type);
            packer.AddField("exe_sql_str", 'S', exe_sql_str);
            packer.AddField("manual_modi_flag", 'I', manual_modi_flag);
            packer.AddField("in_params_value", 'S', in_params_value);
            packer.AddField("update_table_name", 'S', update_table_name);
            packer.AddField("update_fields", 'S', update_fields);
            packer.AddField("rl_fields", 'S', rl_fields);
            packer.AddField("join_fields", 'S', join_fields);
            packer.AddField("sql_no", 'I', sql_no);
            packer.AddField("sql_name", 'S', sql_name);
            packer.AddField("valid_flag", 'I', valid_flag);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXE_SQL_NAME_STR,exe_sql_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXE_SQL_TYPE_INT,exe_sql_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXE_SQL_STR_STR,exe_sql_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MANUAL_MODI_FLAG_INT,manual_modi_flag);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_IN_PARAMS_VALUE_STR,in_params_value);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TABLE_NAME_STR,update_table_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_FIELDS_STR,update_fields);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RL_FIELDS_STR,rl_fields);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_JOIN_FIELDS_STR,join_fields);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SQL_NO_INT,sql_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_SQL_NAME_STR,sql_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_VALID_FLAG_INT,valid_flag);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class rptL_1_27_Request : BaseRequest, IRequest<rptL_1_27_Response>
    {
        public rptL_1_27_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.1.27";
            }
        }

        public String exe_sql_grp_nos_str { get; set; }
        public String exe_sql_nos_str { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exe_sql_grp_nos_str", 'S', exe_sql_grp_nos_str);
            packer.AddField("exe_sql_nos_str", 'S', exe_sql_nos_str);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXE_SQL_GRP_NOS_STR_STR,exe_sql_grp_nos_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXE_SQL_NOS_STR_STR,exe_sql_nos_str);
            return fastMsg;
        }
   }

    public class rptL_1_30_Request : BaseRequest, IRequest<rptL_1_30_Response>
    {
        public rptL_1_30_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rptL.1.30";
            }
        }

        public ulong sql_grp_no { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int sync_his_flag { get; set; }
        public int begin_date { get; set; }
        public int end_date { get; set; }
        public int src_data_type { get; set; }
        public String pos_str { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("sql_grp_no", 'L', sql_grp_no);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("sync_his_flag", 'I', sync_his_flag);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("src_data_type", 'I', src_data_type);
            packer.AddField("pos_str", 'S', pos_str);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_SQL_GRP_NO_INT64,sql_grp_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SYNC_HIS_FLAG_INT,sync_his_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT,end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SRC_DATA_TYPE_INT,src_data_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_POS_STR_STR,pos_str);
            return fastMsg;
        }
   }

}
