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
    public class rkfutuL_1_4_Request : BaseRequest, IRequest<rkfutuL_1_4_Response>
    {
        public rkfutuL_1_4_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rkfutuL.1.4";
            }
        }

        public ulong row_id { get; set; }
        public int co_no { get; set; }
        public int risk_rule_type { get; set; }
        public String risk_rule_name { get; set; }
        public String corrsp_plug { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("risk_rule_type", 'I', risk_rule_type);
            packer.AddField("risk_rule_name", 'S', risk_rule_name);
            packer.AddField("corrsp_plug", 'S', corrsp_plug);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_TYPE_INT,risk_rule_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_NAME_STR,risk_rule_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CORRSP_PLUG_STR,corrsp_plug);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class rkfutuL_1_5_Request : BaseRequest, IRequest<rkfutuL_1_5_Response>
    {
        public rkfutuL_1_5_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rkfutuL.1.5";
            }
        }

        public int co_no { get; set; }
        public String risk_item_name { get; set; }
        public int exch_no { get; set; }
        public int contrc_type { get; set; }
        public String order_dir_str { get; set; }
        public int trig_stage_type { get; set; }
        public int compli_calc_level { get; set; }
        public int unit_nav_flag { get; set; }
        public int trig_type { get; set; }
        public int risk_rule_id { get; set; }
        public int risk_rule_type { get; set; }
        public String risk_rule_name { get; set; }
        public String risk_rule_code { get; set; }
        public String risk_rule_value_str { get; set; }
        public String corrsp_plug { get; set; }
        public String risk_rule_action { get; set; }
        public int begin_time { get; set; }
        public int end_time { get; set; }
        public int rule_flag { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("risk_item_name", 'S', risk_item_name);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("contrc_type", 'I', contrc_type);
            packer.AddField("order_dir_str", 'S', order_dir_str);
            packer.AddField("trig_stage_type", 'I', trig_stage_type);
            packer.AddField("compli_calc_level", 'I', compli_calc_level);
            packer.AddField("unit_nav_flag", 'I', unit_nav_flag);
            packer.AddField("trig_type", 'I', trig_type);
            packer.AddField("risk_rule_id", 'I', risk_rule_id);
            packer.AddField("risk_rule_type", 'I', risk_rule_type);
            packer.AddField("risk_rule_name", 'S', risk_rule_name);
            packer.AddField("risk_rule_code", 'S', risk_rule_code);
            packer.AddField("risk_rule_value_str", 'S', risk_rule_value_str);
            packer.AddField("corrsp_plug", 'S', corrsp_plug);
            packer.AddField("risk_rule_action", 'S', risk_rule_action);
            packer.AddField("begin_time", 'I', begin_time);
            packer.AddField("end_time", 'I', end_time);
            packer.AddField("rule_flag", 'I', rule_flag);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_ITEM_NAME_STR,risk_item_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT,contrc_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR,order_dir_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_STAGE_TYPE_INT,trig_stage_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_CALC_LEVEL_INT,compli_calc_level);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_NAV_FLAG_INT,unit_nav_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_TYPE_INT,trig_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_ID_INT,risk_rule_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_TYPE_INT,risk_rule_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_NAME_STR,risk_rule_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_CODE_STR,risk_rule_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_VALUE_STR_STR,risk_rule_value_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CORRSP_PLUG_STR,corrsp_plug);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_ACTION_STR,risk_rule_action);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TIME_INT,begin_time);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_TIME_INT,end_time);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RULE_FLAG_INT,rule_flag);
            return fastMsg;
        }
   }

    public class rkfutuL_1_6_Request : BaseRequest, IRequest<rkfutuL_1_6_Response>
    {
        public rkfutuL_1_6_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rkfutuL.1.6";
            }
        }

        public ulong row_id { get; set; }
        public int co_no { get; set; }
        public String risk_item_name { get; set; }
        public int exch_no { get; set; }
        public int contrc_type { get; set; }
        public String order_dir_str { get; set; }
        public int trig_stage_type { get; set; }
        public int compli_calc_level { get; set; }
        public int unit_nav_flag { get; set; }
        public int trig_type { get; set; }
        public int risk_rule_id { get; set; }
        public int risk_rule_type { get; set; }
        public String risk_rule_name { get; set; }
        public String risk_rule_code { get; set; }
        public String risk_rule_value_str { get; set; }
        public String corrsp_plug { get; set; }
        public String risk_rule_action { get; set; }
        public int begin_time { get; set; }
        public int end_time { get; set; }
        public int rule_flag { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("risk_item_name", 'S', risk_item_name);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("contrc_type", 'I', contrc_type);
            packer.AddField("order_dir_str", 'S', order_dir_str);
            packer.AddField("trig_stage_type", 'I', trig_stage_type);
            packer.AddField("compli_calc_level", 'I', compli_calc_level);
            packer.AddField("unit_nav_flag", 'I', unit_nav_flag);
            packer.AddField("trig_type", 'I', trig_type);
            packer.AddField("risk_rule_id", 'I', risk_rule_id);
            packer.AddField("risk_rule_type", 'I', risk_rule_type);
            packer.AddField("risk_rule_name", 'S', risk_rule_name);
            packer.AddField("risk_rule_code", 'S', risk_rule_code);
            packer.AddField("risk_rule_value_str", 'S', risk_rule_value_str);
            packer.AddField("corrsp_plug", 'S', corrsp_plug);
            packer.AddField("risk_rule_action", 'S', risk_rule_action);
            packer.AddField("begin_time", 'I', begin_time);
            packer.AddField("end_time", 'I', end_time);
            packer.AddField("rule_flag", 'I', rule_flag);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_ITEM_NAME_STR,risk_item_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT,contrc_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR,order_dir_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_STAGE_TYPE_INT,trig_stage_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_CALC_LEVEL_INT,compli_calc_level);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_NAV_FLAG_INT,unit_nav_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_TYPE_INT,trig_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_ID_INT,risk_rule_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_TYPE_INT,risk_rule_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_NAME_STR,risk_rule_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_CODE_STR,risk_rule_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_VALUE_STR_STR,risk_rule_value_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CORRSP_PLUG_STR,corrsp_plug);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_ACTION_STR,risk_rule_action);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TIME_INT,begin_time);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_TIME_INT,end_time);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RULE_FLAG_INT,rule_flag);
            return fastMsg;
        }
   }

    public class rkfutuL_1_7_Request : BaseRequest, IRequest<rkfutuL_1_7_Response>
    {
        public rkfutuL_1_7_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rkfutuL.1.7";
            }
        }

        public int co_no { get; set; }
        public String risk_item_id_str { get; set; }
        public String risk_item_name { get; set; }
        public int exch_no { get; set; }
        public int contrc_type { get; set; }
        public String order_dir_str { get; set; }
        public int risk_rule_id { get; set; }
        public int risk_rule_type { get; set; }
        public String risk_rule_name { get; set; }
        public String corrsp_plug { get; set; }
        public int rule_flag { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("risk_item_id_str", 'S', risk_item_id_str);
            packer.AddField("risk_item_name", 'S', risk_item_name);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("contrc_type", 'I', contrc_type);
            packer.AddField("order_dir_str", 'S', order_dir_str);
            packer.AddField("risk_rule_id", 'I', risk_rule_id);
            packer.AddField("risk_rule_type", 'I', risk_rule_type);
            packer.AddField("risk_rule_name", 'S', risk_rule_name);
            packer.AddField("corrsp_plug", 'S', corrsp_plug);
            packer.AddField("rule_flag", 'I', rule_flag);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_ITEM_ID_STR_STR,risk_item_id_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_ITEM_NAME_STR,risk_item_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT,contrc_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR,order_dir_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_ID_INT,risk_rule_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_TYPE_INT,risk_rule_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_NAME_STR,risk_rule_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CORRSP_PLUG_STR,corrsp_plug);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RULE_FLAG_INT,rule_flag);
            return fastMsg;
        }
   }

    public class rkfutuL_1_8_Request : BaseRequest, IRequest<rkfutuL_1_8_Response>
    {
        public rkfutuL_1_8_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rkfutuL.1.8";
            }
        }

        public int co_no { get; set; }
        public String risk_item_id_str { get; set; }
        public String risk_item_name { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("risk_item_id_str", 'S', risk_item_id_str);
            packer.AddField("risk_item_name", 'S', risk_item_name);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_ITEM_ID_STR_STR,risk_item_id_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_ITEM_NAME_STR,risk_item_name);
            return fastMsg;
        }
   }

    public class rkfutuL_1_9_Request : BaseRequest, IRequest<rkfutuL_1_9_Response>
    {
        public rkfutuL_1_9_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rkfutuL.1.9";
            }
        }

        public int co_no { get; set; }
        public String risk_item_id_str { get; set; }
        public String risk_item_name { get; set; }
        public int exch_no { get; set; }
        public int contrc_type { get; set; }
        public String order_dir_str { get; set; }
        public int risk_rule_id { get; set; }
        public int risk_rule_type { get; set; }
        public String risk_rule_name { get; set; }
        public String corrsp_plug { get; set; }
        public int rule_flag { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("risk_item_id_str", 'S', risk_item_id_str);
            packer.AddField("risk_item_name", 'S', risk_item_name);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("contrc_type", 'I', contrc_type);
            packer.AddField("order_dir_str", 'S', order_dir_str);
            packer.AddField("risk_rule_id", 'I', risk_rule_id);
            packer.AddField("risk_rule_type", 'I', risk_rule_type);
            packer.AddField("risk_rule_name", 'S', risk_rule_name);
            packer.AddField("corrsp_plug", 'S', corrsp_plug);
            packer.AddField("rule_flag", 'I', rule_flag);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_ITEM_ID_STR_STR,risk_item_id_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_ITEM_NAME_STR,risk_item_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT,contrc_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR,order_dir_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_ID_INT,risk_rule_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_TYPE_INT,risk_rule_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_NAME_STR,risk_rule_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CORRSP_PLUG_STR,corrsp_plug);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RULE_FLAG_INT,rule_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class rkfutuL_1_10_Request : BaseRequest, IRequest<rkfutuL_1_10_Response>
    {
        public rkfutuL_1_10_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rkfutuL.1.10";
            }
        }

        public int co_no { get; set; }
        public String model_name { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("model_name", 'S', model_name);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MODEL_NAME_STR,model_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class rkfutuL_1_11_Request : BaseRequest, IRequest<rkfutuL_1_11_Response>
    {
        public rkfutuL_1_11_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rkfutuL.1.11";
            }
        }

        public int co_no { get; set; }
        public ulong model_id { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("model_id", 'L', model_id);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_MODEL_ID_INT64,model_id);
            return fastMsg;
        }
   }

    public class rkfutuL_1_12_Request : BaseRequest, IRequest<rkfutuL_1_12_Response>
    {
        public rkfutuL_1_12_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rkfutuL.1.12";
            }
        }

        public int co_no { get; set; }
        public ulong model_id { get; set; }
        public String model_name { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("model_id", 'L', model_id);
            packer.AddField("model_name", 'S', model_name);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_MODEL_ID_INT64,model_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MODEL_NAME_STR,model_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class rkfutuL_1_13_Request : BaseRequest, IRequest<rkfutuL_1_13_Response>
    {
        public rkfutuL_1_13_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rkfutuL.1.13";
            }
        }

        public int co_no { get; set; }
        public ulong model_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("model_id", 'L', model_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_MODEL_ID_INT64,model_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class rkfutuL_1_14_Request : BaseRequest, IRequest<rkfutuL_1_14_Response>
    {
        public rkfutuL_1_14_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rkfutuL.1.14";
            }
        }

        public int co_no { get; set; }
        public ulong model_id { get; set; }
        public String risk_item_id_str { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("model_id", 'L', model_id);
            packer.AddField("risk_item_id_str", 'S', risk_item_id_str);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_MODEL_ID_INT64,model_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_ITEM_ID_STR_STR,risk_item_id_str);
            return fastMsg;
        }
   }

    public class rkfutuL_1_15_Request : BaseRequest, IRequest<rkfutuL_1_15_Response>
    {
        public rkfutuL_1_15_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rkfutuL.1.15";
            }
        }

        public int co_no { get; set; }
        public ulong model_id { get; set; }
        public String risk_item_id_str { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("model_id", 'L', model_id);
            packer.AddField("risk_item_id_str", 'S', risk_item_id_str);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_MODEL_ID_INT64,model_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_ITEM_ID_STR_STR,risk_item_id_str);
            return fastMsg;
        }
   }

    public class rkfutuL_1_16_Request : BaseRequest, IRequest<rkfutuL_1_16_Response>
    {
        public rkfutuL_1_16_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rkfutuL.1.16";
            }
        }

        public int co_no { get; set; }
        public ulong model_id { get; set; }
        public String risk_item_id_str { get; set; }
        public String risk_item_name { get; set; }
        public int risk_rule_type { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("model_id", 'L', model_id);
            packer.AddField("risk_item_id_str", 'S', risk_item_id_str);
            packer.AddField("risk_item_name", 'S', risk_item_name);
            packer.AddField("risk_rule_type", 'I', risk_rule_type);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_MODEL_ID_INT64,model_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_ITEM_ID_STR_STR,risk_item_id_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_ITEM_NAME_STR,risk_item_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_TYPE_INT,risk_rule_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class rkfutuL_1_17_Request : BaseRequest, IRequest<rkfutuL_1_17_Response>
    {
        public rkfutuL_1_17_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rkfutuL.1.17";
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

}
