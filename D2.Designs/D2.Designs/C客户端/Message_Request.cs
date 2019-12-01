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
    public class pubL_11_1_Request : BaseRequest, IRequest<pubL_11_1_Response>
    {
        public pubL_11_1_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.11.1";
            }
        }

        public String object_zh_name { get; set; }
        public String object_en_name { get; set; }
        public int object_type { get; set; }
        public int main_ver_no { get; set; }
        public int second_ver_no { get; set; }
        public int rele_ver_no { get; set; }
        public int ver_date { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("object_zh_name", 'S', object_zh_name);
            packer.AddField("object_en_name", 'S', object_en_name);
            packer.AddField("object_type", 'I', object_type);
            packer.AddField("main_ver_no", 'I', main_ver_no);
            packer.AddField("second_ver_no", 'I', second_ver_no);
            packer.AddField("rele_ver_no", 'I', rele_ver_no);
            packer.AddField("ver_date", 'I', ver_date);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OBJECT_ZH_NAME_STR,object_zh_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OBJECT_EN_NAME_STR,object_en_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OBJECT_TYPE_INT,object_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MAIN_VER_NO_INT,main_ver_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SECOND_VER_NO_INT,second_ver_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RELE_VER_NO_INT,rele_ver_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_VER_DATE_INT,ver_date);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class pubL_11_2_Request : BaseRequest, IRequest<pubL_11_2_Response>
    {
        public pubL_11_2_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.11.2";
            }
        }

        public String object_zh_name { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("object_zh_name", 'S', object_zh_name);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OBJECT_ZH_NAME_STR,object_zh_name);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_11_3_Request : BaseRequest, IRequest<pubL_11_3_Response>
    {
        public pubL_11_3_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.11.3";
            }
        }

        public int begin_date { get; set; }
        public int end_date { get; set; }
        public String object_zh_name { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("object_zh_name", 'S', object_zh_name);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT,end_date);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OBJECT_ZH_NAME_STR,object_zh_name);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_11_6_Request : BaseRequest, IRequest<pubL_11_6_Response>
    {
        public pubL_11_6_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.11.6";
            }
        }

        public int task_no { get; set; }
        public String task_name { get; set; }
        public int depend_task_no { get; set; }
        public String task_order { get; set; }
        public String task_strike_status { get; set; }
        public String task_strike_rule { get; set; }
        public String exec_pro { get; set; }
        public int busi_menu_no { get; set; }
        public String busi_func_code { get; set; }
        public int exec_count { get; set; }
        public String task_status { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("task_no", 'I', task_no);
            packer.AddField("task_name", 'S', task_name);
            packer.AddField("depend_task_no", 'I', depend_task_no);
            packer.AddField("task_order", 'S', task_order);
            packer.AddField("task_strike_status", 'S', task_strike_status);
            packer.AddField("task_strike_rule", 'S', task_strike_rule);
            packer.AddField("exec_pro", 'S', exec_pro);
            packer.AddField("busi_menu_no", 'I', busi_menu_no);
            packer.AddField("busi_func_code", 'S', busi_func_code);
            packer.AddField("exec_count", 'I', exec_count);
            packer.AddField("task_status", 'S', task_status);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TASK_NO_INT,task_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_NAME_STR,task_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEPEND_TASK_NO_INT,depend_task_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_ORDER_STR,task_order);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STRIKE_STATUS_STR,task_strike_status);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STRIKE_RULE_STR,task_strike_rule);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_PRO_STR,exec_pro);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_MENU_NO_INT,busi_menu_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FUNC_CODE_STR,busi_func_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_COUNT_INT,exec_count);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STATUS_STR,task_status);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class pubL_11_7_Request : BaseRequest, IRequest<pubL_11_7_Response>
    {
        public pubL_11_7_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.11.7";
            }
        }

        public int task_no { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("task_no", 'I', task_no);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TASK_NO_INT,task_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_11_11_Request : BaseRequest, IRequest<pubL_11_11_Response>
    {
        public pubL_11_11_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.11.11";
            }
        }

        public int task_no { get; set; }
        public String task_name { get; set; }
        public int depend_task_no { get; set; }
        public String task_order { get; set; }
        public String task_strike_status { get; set; }
        public String task_strike_rule { get; set; }
        public String exec_pro { get; set; }
        public int busi_menu_no { get; set; }
        public String busi_func_code { get; set; }
        public int exec_count { get; set; }
        public String task_status { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("task_no", 'I', task_no);
            packer.AddField("task_name", 'S', task_name);
            packer.AddField("depend_task_no", 'I', depend_task_no);
            packer.AddField("task_order", 'S', task_order);
            packer.AddField("task_strike_status", 'S', task_strike_status);
            packer.AddField("task_strike_rule", 'S', task_strike_rule);
            packer.AddField("exec_pro", 'S', exec_pro);
            packer.AddField("busi_menu_no", 'I', busi_menu_no);
            packer.AddField("busi_func_code", 'S', busi_func_code);
            packer.AddField("exec_count", 'I', exec_count);
            packer.AddField("task_status", 'S', task_status);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TASK_NO_INT,task_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_NAME_STR,task_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEPEND_TASK_NO_INT,depend_task_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_ORDER_STR,task_order);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STRIKE_STATUS_STR,task_strike_status);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STRIKE_RULE_STR,task_strike_rule);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_PRO_STR,exec_pro);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_MENU_NO_INT,busi_menu_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FUNC_CODE_STR,busi_func_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_COUNT_INT,exec_count);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STATUS_STR,task_status);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class pubL_11_12_Request : BaseRequest, IRequest<pubL_11_12_Response>
    {
        public pubL_11_12_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.11.12";
            }
        }

        public int task_no { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("task_no", 'I', task_no);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TASK_NO_INT,task_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_11_21_Request : BaseRequest, IRequest<pubL_11_21_Response>
    {
        public pubL_11_21_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.11.21";
            }
        }

        public int query_opor_no { get; set; }
        public int co_no { get; set; }
        public int query_menu_no { get; set; }
        public String query_func_code { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("query_opor_no", 'I', query_opor_no);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("query_menu_no", 'I', query_menu_no);
            packer.AddField("query_func_code", 'S', query_func_code);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_OPOR_NO_INT,query_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_MENU_NO_INT,query_menu_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_FUNC_CODE_STR,query_func_code);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_11_22_Request : BaseRequest, IRequest<pubL_11_22_Response>
    {
        public pubL_11_22_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.11.22";
            }
        }

        public int begin_date { get; set; }
        public int end_date { get; set; }
        public int query_opor_no { get; set; }
        public int co_no { get; set; }
        public int query_menu_no { get; set; }
        public String query_func_code { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("query_opor_no", 'I', query_opor_no);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("query_menu_no", 'I', query_menu_no);
            packer.AddField("query_func_code", 'S', query_func_code);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT,end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_OPOR_NO_INT,query_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_MENU_NO_INT,query_menu_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_FUNC_CODE_STR,query_func_code);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_11_30_Request : BaseRequest, IRequest<pubL_11_30_Response>
    {
        public pubL_11_30_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.11.30";
            }
        }

        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_11_31_Request : BaseRequest, IRequest<pubL_11_31_Response>
    {
        public pubL_11_31_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.11.31";
            }
        }

        public int log_level { get; set; }
        public int exec_date { get; set; }
        public int exec_time { get; set; }
        public int comple_date { get; set; }
        public int comple_time { get; set; }
        public String mark_info { get; set; }
        public int busi_menu_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("log_level", 'I', log_level);
            packer.AddField("exec_date", 'I', exec_date);
            packer.AddField("exec_time", 'I', exec_time);
            packer.AddField("comple_date", 'I', comple_date);
            packer.AddField("comple_time", 'I', comple_time);
            packer.AddField("mark_info", 'S', mark_info);
            packer.AddField("busi_menu_no", 'I', busi_menu_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LOG_LEVEL_INT,log_level);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_DATE_INT,exec_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_TIME_INT,exec_time);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMPLE_DATE_INT,comple_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMPLE_TIME_INT,comple_time);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MARK_INFO_STR,mark_info);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_MENU_NO_INT,busi_menu_no);
            return fastMsg;
        }
   }

    public class pubL_11_32_Request : BaseRequest, IRequest<pubL_11_32_Response>
    {
        public pubL_11_32_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.11.32";
            }
        }

        public ulong row_id { get; set; }
        public int log_level { get; set; }
        public int exec_date { get; set; }
        public int exec_time { get; set; }
        public int comple_date { get; set; }
        public int comple_time { get; set; }
        public String mark_info { get; set; }
        public int busi_menu_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("log_level", 'I', log_level);
            packer.AddField("exec_date", 'I', exec_date);
            packer.AddField("exec_time", 'I', exec_time);
            packer.AddField("comple_date", 'I', comple_date);
            packer.AddField("comple_time", 'I', comple_time);
            packer.AddField("mark_info", 'S', mark_info);
            packer.AddField("busi_menu_no", 'I', busi_menu_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LOG_LEVEL_INT,log_level);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_DATE_INT,exec_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_TIME_INT,exec_time);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMPLE_DATE_INT,comple_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMPLE_TIME_INT,comple_time);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MARK_INFO_STR,mark_info);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_MENU_NO_INT,busi_menu_no);
            return fastMsg;
        }
   }

    public class pubL_11_33_Request : BaseRequest, IRequest<pubL_11_33_Response>
    {
        public pubL_11_33_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.11.33";
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

    public class pubL_11_40_Request : BaseRequest, IRequest<pubL_11_40_Response>
    {
        public pubL_11_40_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.11.40";
            }
        }

        public int deal_flag { get; set; }
        public int begin_date { get; set; }
        public int begin_time { get; set; }
        public int end_date { get; set; }
        public int end_time { get; set; }
        public int moni_server_type { get; set; }
        public int exception_level { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("deal_flag", 'I', deal_flag);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("begin_time", 'I', begin_time);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("end_time", 'I', end_time);
            packer.AddField("moni_server_type", 'I', moni_server_type);
            packer.AddField("exception_level", 'I', exception_level);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_FLAG_INT,deal_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TIME_INT,begin_time);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT,end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_TIME_INT,end_time);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MONI_SERVER_TYPE_INT,moni_server_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCEPTION_LEVEL_INT,exception_level);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class pubL_11_41_Request : BaseRequest, IRequest<pubL_11_41_Response>
    {
        public pubL_11_41_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.11.41";
            }
        }

        public int exception_level { get; set; }
        public int moni_server_type { get; set; }
        public String computer_name { get; set; }
        public int proc_no { get; set; }
        public String proc_path { get; set; }
        public String remark_info { get; set; }
        public int deal_flag { get; set; }
        public String deal_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exception_level", 'I', exception_level);
            packer.AddField("moni_server_type", 'I', moni_server_type);
            packer.AddField("computer_name", 'S', computer_name);
            packer.AddField("proc_no", 'I', proc_no);
            packer.AddField("proc_path", 'S', proc_path);
            packer.AddField("remark_info", 'S', remark_info);
            packer.AddField("deal_flag", 'I', deal_flag);
            packer.AddField("deal_info", 'S', deal_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCEPTION_LEVEL_INT,exception_level);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MONI_SERVER_TYPE_INT,moni_server_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMPUTER_NAME_STR,computer_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PROC_NO_INT,proc_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PROC_PATH_STR,proc_path);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_FLAG_INT,deal_flag);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_INFO_STR,deal_info);
            return fastMsg;
        }
   }

    public class pubL_11_42_Request : BaseRequest, IRequest<pubL_11_42_Response>
    {
        public pubL_11_42_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.11.42";
            }
        }

        public ulong row_id { get; set; }
        public int deal_flag { get; set; }
        public String deal_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("deal_flag", 'I', deal_flag);
            packer.AddField("deal_info", 'S', deal_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_FLAG_INT,deal_flag);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_INFO_STR,deal_info);
            return fastMsg;
        }
   }

    public class pubL_11_43_Request : BaseRequest, IRequest<pubL_11_43_Response>
    {
        public pubL_11_43_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.11.43";
            }
        }

        public int query_date { get; set; }
        public int query_opor_no { get; set; }
        public int co_no { get; set; }
        public int query_menu_no { get; set; }
        public String query_func_code { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("query_date", 'I', query_date);
            packer.AddField("query_opor_no", 'I', query_opor_no);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("query_menu_no", 'I', query_menu_no);
            packer.AddField("query_func_code", 'S', query_func_code);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_DATE_INT,query_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_OPOR_NO_INT,query_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_MENU_NO_INT,query_menu_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_FUNC_CODE_STR,query_func_code);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

}
