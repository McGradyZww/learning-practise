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
    public class rksecuL_4_1_Request : BaseRequest, IRequest<rksecuL_4_1_Response>
    {
        public rksecuL_4_1_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rksecuL.4.1";
            }
        }

        public int co_no { get; set; }
        public String pd_no_str { get; set; }
        public String exch_group_no_str { get; set; }
        public ulong model_id { get; set; }
        public int risk_item_id { get; set; }
        public int templ_flag { get; set; }
        public int union_flag { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no_str", 'S', pd_no_str);
            packer.AddField("exch_group_no_str", 'S', exch_group_no_str);
            packer.AddField("model_id", 'L', model_id);
            packer.AddField("risk_item_id", 'I', risk_item_id);
            packer.AddField("templ_flag", 'I', templ_flag);
            packer.AddField("union_flag", 'I', union_flag);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_STR_STR,pd_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_STR_STR,exch_group_no_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_MODEL_ID_INT64,model_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_ITEM_ID_INT,risk_item_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TEMPL_FLAG_INT,templ_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UNION_FLAG_INT,union_flag);
            return fastMsg;
        }
   }

    public class rksecuL_4_2_Request : BaseRequest, IRequest<rksecuL_4_2_Response>
    {
        public rksecuL_4_2_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rksecuL.4.2";
            }
        }

        public int co_no { get; set; }
        public String pd_no_str { get; set; }
        public String exch_group_no_str { get; set; }
        public ulong model_id { get; set; }
        public String risk_item_id_str { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no_str", 'S', pd_no_str);
            packer.AddField("exch_group_no_str", 'S', exch_group_no_str);
            packer.AddField("model_id", 'L', model_id);
            packer.AddField("risk_item_id_str", 'S', risk_item_id_str);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_STR_STR,pd_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_STR_STR,exch_group_no_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_MODEL_ID_INT64,model_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_ITEM_ID_STR_STR,risk_item_id_str);
            return fastMsg;
        }
   }

    public class rksecuL_4_3_Request : BaseRequest, IRequest<rksecuL_4_3_Response>
    {
        public rksecuL_4_3_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rksecuL.4.3";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public ulong model_id { get; set; }
        public String risk_item_id_str { get; set; }
        public String risk_rule_type_str { get; set; }
        public int trig_stage_type { get; set; }
        public int templ_flag { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("model_id", 'L', model_id);
            packer.AddField("risk_item_id_str", 'S', risk_item_id_str);
            packer.AddField("risk_rule_type_str", 'S', risk_rule_type_str);
            packer.AddField("trig_stage_type", 'I', trig_stage_type);
            packer.AddField("templ_flag", 'I', templ_flag);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_MODEL_ID_INT64,model_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_ITEM_ID_STR_STR,risk_item_id_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_TYPE_STR_STR,risk_rule_type_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_STAGE_TYPE_INT,trig_stage_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TEMPL_FLAG_INT,templ_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class rksecuL_4_4_Request : BaseRequest, IRequest<rksecuL_4_4_Response>
    {
        public rksecuL_4_4_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rksecuL.4.4";
            }
        }

        public int co_no { get; set; }
        public String client_risk_rule_id_str { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("client_risk_rule_id_str", 'S', client_risk_rule_id_str);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CLIENT_RISK_RULE_ID_STR_STR,client_risk_rule_id_str);
            return fastMsg;
        }
   }

    public class rksecuL_4_5_Request : BaseRequest, IRequest<rksecuL_4_5_Response>
    {
        public rksecuL_4_5_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rksecuL.4.5";
            }
        }

        public int create_date { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public String risk_rule_action { get; set; }
        public int risk_rule_type { get; set; }
        public int trig_stage_type { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("create_date", 'I', create_date);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("risk_rule_action", 'S', risk_rule_action);
            packer.AddField("risk_rule_type", 'I', risk_rule_type);
            packer.AddField("trig_stage_type", 'I', trig_stage_type);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT,create_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_ACTION_STR,risk_rule_action);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_TYPE_INT,risk_rule_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_STAGE_TYPE_INT,trig_stage_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class rksecuL_4_6_Request : BaseRequest, IRequest<rksecuL_4_6_Response>
    {
        public rksecuL_4_6_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rksecuL.4.6";
            }
        }

        public int co_no { get; set; }
        public ulong model_id { get; set; }
        public String risk_rule_type_str { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("model_id", 'L', model_id);
            packer.AddField("risk_rule_type_str", 'S', risk_rule_type_str);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_MODEL_ID_INT64,model_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_TYPE_STR_STR,risk_rule_type_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class rksecuL_4_7_Request : BaseRequest, IRequest<rksecuL_4_7_Response>
    {
        public rksecuL_4_7_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rksecuL.4.7";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public int exch_no { get; set; }
        public String exch_crncy_type { get; set; }
        public String stock_code { get; set; }
        public int order_dir { get; set; }
        public double order_price { get; set; }
        public double order_qty { get; set; }
        public int trig_stage_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("exch_crncy_type", 'S', exch_crncy_type);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("order_dir", 'I', order_dir);
            packer.AddField("order_price", 'D', order_price);
            packer.AddField("order_qty", 'D', order_qty);
            packer.AddField("trig_stage_type", 'I', trig_stage_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR,exch_crncy_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT,order_dir);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT,order_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT,order_qty);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_STAGE_TYPE_INT,trig_stage_type);
            return fastMsg;
        }
   }

    public class rksecuL_4_8_Request : BaseRequest, IRequest<rksecuL_4_8_Response>
    {
        public rksecuL_4_8_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rksecuL.4.8";
            }
        }

        public int co_no { get; set; }
        public String pd_no_str { get; set; }
        public String exch_group_no_str { get; set; }
        public int moni_role_type { get; set; }
        public int moni_value_flag { get; set; }
        public int moni_value_type { get; set; }
        public double warn_posi_value { get; set; }
        public int warn_trig_oper_type { get; set; }
        public double close_posi_value { get; set; }
        public int close_trig_oper_type { get; set; }
        public double appd_value { get; set; }
        public int appd_trig_oper_type { get; set; }
        public int begin_moni_date { get; set; }
        public double begin_moni_value { get; set; }
        public double max_moni_value { get; set; }
        public String contrs_stock_code { get; set; }
        public int contrs_exch_no { get; set; }
        public double contrs_max_moni_value { get; set; }
        public int close_posi_flag { get; set; }
        public double close_ratio_level_one { get; set; }
        public double close_ratio_level_two { get; set; }
        public double close_ratio_level_three { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no_str", 'S', pd_no_str);
            packer.AddField("exch_group_no_str", 'S', exch_group_no_str);
            packer.AddField("moni_role_type", 'I', moni_role_type);
            packer.AddField("moni_value_flag", 'I', moni_value_flag);
            packer.AddField("moni_value_type", 'I', moni_value_type);
            packer.AddField("warn_posi_value", 'D', warn_posi_value);
            packer.AddField("warn_trig_oper_type", 'I', warn_trig_oper_type);
            packer.AddField("close_posi_value", 'D', close_posi_value);
            packer.AddField("close_trig_oper_type", 'I', close_trig_oper_type);
            packer.AddField("appd_value", 'D', appd_value);
            packer.AddField("appd_trig_oper_type", 'I', appd_trig_oper_type);
            packer.AddField("begin_moni_date", 'I', begin_moni_date);
            packer.AddField("begin_moni_value", 'D', begin_moni_value);
            packer.AddField("max_moni_value", 'D', max_moni_value);
            packer.AddField("contrs_stock_code", 'S', contrs_stock_code);
            packer.AddField("contrs_exch_no", 'I', contrs_exch_no);
            packer.AddField("contrs_max_moni_value", 'D', contrs_max_moni_value);
            packer.AddField("close_posi_flag", 'I', close_posi_flag);
            packer.AddField("close_ratio_level_one", 'D', close_ratio_level_one);
            packer.AddField("close_ratio_level_two", 'D', close_ratio_level_two);
            packer.AddField("close_ratio_level_three", 'D', close_ratio_level_three);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_STR_STR,pd_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_STR_STR,exch_group_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MONI_ROLE_TYPE_INT,moni_role_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MONI_VALUE_FLAG_INT,moni_value_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MONI_VALUE_TYPE_INT,moni_value_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WARN_POSI_VALUE_FLOAT,warn_posi_value);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WARN_TRIG_OPER_TYPE_INT,warn_trig_oper_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_VALUE_FLOAT,close_posi_value);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_TRIG_OPER_TYPE_INT,close_trig_oper_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_APPD_VALUE_FLOAT,appd_value);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_APPD_TRIG_OPER_TYPE_INT,appd_trig_oper_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_MONI_DATE_INT,begin_moni_date);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_MONI_VALUE_FLOAT,begin_moni_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_MONI_VALUE_FLOAT,max_moni_value);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRS_STOCK_CODE_STR,contrs_stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRS_EXCH_NO_INT,contrs_exch_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CONTRS_MAX_MONI_VALUE_FLOAT,contrs_max_moni_value);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_FLAG_INT,close_posi_flag);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_RATIO_LEVEL_ONE_FLOAT,close_ratio_level_one);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_RATIO_LEVEL_TWO_FLOAT,close_ratio_level_two);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_RATIO_LEVEL_THREE_FLOAT,close_ratio_level_three);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class rksecuL_4_9_Request : BaseRequest, IRequest<rksecuL_4_9_Response>
    {
        public rksecuL_4_9_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rksecuL.4.9";
            }
        }

        public ulong moni_set_id { get; set; }
        public int co_no { get; set; }
        public String pd_no_str { get; set; }
        public String exch_group_no_str { get; set; }
        public int moni_role_type { get; set; }
        public int moni_value_flag { get; set; }
        public int moni_value_type { get; set; }
        public double warn_posi_value { get; set; }
        public int warn_trig_oper_type { get; set; }
        public double close_posi_value { get; set; }
        public int close_trig_oper_type { get; set; }
        public double appd_value { get; set; }
        public int appd_trig_oper_type { get; set; }
        public int begin_moni_date { get; set; }
        public double begin_moni_value { get; set; }
        public double max_moni_value { get; set; }
        public double curr_moni_value { get; set; }
        public String contrs_stock_code { get; set; }
        public int contrs_exch_no { get; set; }
        public double contrs_max_moni_value { get; set; }
        public int close_posi_flag { get; set; }
        public double close_ratio_level_one { get; set; }
        public double close_ratio_level_two { get; set; }
        public double close_ratio_level_three { get; set; }
        public int trig_oper_type { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("moni_set_id", 'L', moni_set_id);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no_str", 'S', pd_no_str);
            packer.AddField("exch_group_no_str", 'S', exch_group_no_str);
            packer.AddField("moni_role_type", 'I', moni_role_type);
            packer.AddField("moni_value_flag", 'I', moni_value_flag);
            packer.AddField("moni_value_type", 'I', moni_value_type);
            packer.AddField("warn_posi_value", 'D', warn_posi_value);
            packer.AddField("warn_trig_oper_type", 'I', warn_trig_oper_type);
            packer.AddField("close_posi_value", 'D', close_posi_value);
            packer.AddField("close_trig_oper_type", 'I', close_trig_oper_type);
            packer.AddField("appd_value", 'D', appd_value);
            packer.AddField("appd_trig_oper_type", 'I', appd_trig_oper_type);
            packer.AddField("begin_moni_date", 'I', begin_moni_date);
            packer.AddField("begin_moni_value", 'D', begin_moni_value);
            packer.AddField("max_moni_value", 'D', max_moni_value);
            packer.AddField("curr_moni_value", 'D', curr_moni_value);
            packer.AddField("contrs_stock_code", 'S', contrs_stock_code);
            packer.AddField("contrs_exch_no", 'I', contrs_exch_no);
            packer.AddField("contrs_max_moni_value", 'D', contrs_max_moni_value);
            packer.AddField("close_posi_flag", 'I', close_posi_flag);
            packer.AddField("close_ratio_level_one", 'D', close_ratio_level_one);
            packer.AddField("close_ratio_level_two", 'D', close_ratio_level_two);
            packer.AddField("close_ratio_level_three", 'D', close_ratio_level_three);
            packer.AddField("trig_oper_type", 'I', trig_oper_type);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_MONI_SET_ID_INT64,moni_set_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_STR_STR,pd_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_STR_STR,exch_group_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MONI_ROLE_TYPE_INT,moni_role_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MONI_VALUE_FLAG_INT,moni_value_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MONI_VALUE_TYPE_INT,moni_value_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WARN_POSI_VALUE_FLOAT,warn_posi_value);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WARN_TRIG_OPER_TYPE_INT,warn_trig_oper_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_VALUE_FLOAT,close_posi_value);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_TRIG_OPER_TYPE_INT,close_trig_oper_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_APPD_VALUE_FLOAT,appd_value);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_APPD_TRIG_OPER_TYPE_INT,appd_trig_oper_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_MONI_DATE_INT,begin_moni_date);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_MONI_VALUE_FLOAT,begin_moni_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_MONI_VALUE_FLOAT,max_moni_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONI_VALUE_FLOAT,curr_moni_value);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRS_STOCK_CODE_STR,contrs_stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRS_EXCH_NO_INT,contrs_exch_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CONTRS_MAX_MONI_VALUE_FLOAT,contrs_max_moni_value);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_FLAG_INT,close_posi_flag);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_RATIO_LEVEL_ONE_FLOAT,close_ratio_level_one);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_RATIO_LEVEL_TWO_FLOAT,close_ratio_level_two);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_RATIO_LEVEL_THREE_FLOAT,close_ratio_level_three);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_OPER_TYPE_INT,trig_oper_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class rksecuL_4_10_Request : BaseRequest, IRequest<rksecuL_4_10_Response>
    {
        public rksecuL_4_10_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rksecuL.4.10";
            }
        }

        public int co_no { get; set; }
        public ulong moni_set_id { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("moni_set_id", 'L', moni_set_id);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_MONI_SET_ID_INT64,moni_set_id);
            return fastMsg;
        }
   }

    public class rksecuL_4_11_Request : BaseRequest, IRequest<rksecuL_4_11_Response>
    {
        public rksecuL_4_11_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rksecuL.4.11";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int moni_role_type { get; set; }
        public int moni_value_flag { get; set; }
        public int moni_value_type { get; set; }
        public String moni_set_status { get; set; }
        public String moni_result_status { get; set; }
        public int sort_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("moni_role_type", 'I', moni_role_type);
            packer.AddField("moni_value_flag", 'I', moni_value_flag);
            packer.AddField("moni_value_type", 'I', moni_value_type);
            packer.AddField("moni_set_status", 'S', moni_set_status);
            packer.AddField("moni_result_status", 'S', moni_result_status);
            packer.AddField("sort_type", 'I', sort_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MONI_ROLE_TYPE_INT,moni_role_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MONI_VALUE_FLAG_INT,moni_value_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MONI_VALUE_TYPE_INT,moni_value_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MONI_SET_STATUS_STR,moni_set_status);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MONI_RESULT_STATUS_STR,moni_result_status);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SORT_TYPE_INT,sort_type);
            return fastMsg;
        }
   }

    public class rksecuL_4_12_Request : BaseRequest, IRequest<rksecuL_4_12_Response>
    {
        public rksecuL_4_12_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rksecuL.4.12";
            }
        }

        public int co_no { get; set; }
        public ulong moni_set_id { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("moni_set_id", 'L', moni_set_id);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_MONI_SET_ID_INT64,moni_set_id);
            return fastMsg;
        }
   }

    public class rksecuL_4_13_Request : BaseRequest, IRequest<rksecuL_4_13_Response>
    {
        public rksecuL_4_13_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rksecuL.4.13";
            }
        }

        public int co_no { get; set; }
        public ulong moni_set_id { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("moni_set_id", 'L', moni_set_id);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_MONI_SET_ID_INT64,moni_set_id);
            return fastMsg;
        }
   }

    public class rksecuL_4_14_Request : BaseRequest, IRequest<rksecuL_4_14_Response>
    {
        public rksecuL_4_14_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rksecuL.4.14";
            }
        }

        public int co_no { get; set; }
        public ulong moni_set_id { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("moni_set_id", 'L', moni_set_id);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_MONI_SET_ID_INT64,moni_set_id);
            return fastMsg;
        }
   }

    public class rksecuL_4_15_Request : BaseRequest, IRequest<rksecuL_4_15_Response>
    {
        public rksecuL_4_15_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rksecuL.4.15";
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

    public class rksecuL_4_16_Request : BaseRequest, IRequest<rksecuL_4_16_Response>
    {
        public rksecuL_4_16_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rksecuL.4.16";
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

    public class rksecuL_4_17_Request : BaseRequest, IRequest<rksecuL_4_17_Response>
    {
        public rksecuL_4_17_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rksecuL.4.17";
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

    public class rksecuL_4_18_Request : BaseRequest, IRequest<rksecuL_4_18_Response>
    {
        public rksecuL_4_18_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rksecuL.4.18";
            }
        }

        public int co_no { get; set; }
        public String pd_no_str { get; set; }
        public String exch_group_no_str { get; set; }
        public int monitor_ctrl_type { get; set; }
        public int moni_value_type { get; set; }
        public int monitor_param_value { get; set; }
        public String stock_code { get; set; }
        public int exch_no { get; set; }
        public int moni_value_flag { get; set; }
        public double warn_posi_value { get; set; }
        public double appd_value { get; set; }
        public double close_posi_value { get; set; }
        public double max_moni_value { get; set; }
        public String contrs_stock_code { get; set; }
        public int contrs_exch_no { get; set; }
        public double contrs_max_moni_value { get; set; }
        public int close_posi_flag { get; set; }
        public double close_ratio_level_one { get; set; }
        public double close_ratio_level_two { get; set; }
        public double close_ratio_level_three { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no_str", 'S', pd_no_str);
            packer.AddField("exch_group_no_str", 'S', exch_group_no_str);
            packer.AddField("monitor_ctrl_type", 'I', monitor_ctrl_type);
            packer.AddField("moni_value_type", 'I', moni_value_type);
            packer.AddField("monitor_param_value", 'I', monitor_param_value);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("moni_value_flag", 'I', moni_value_flag);
            packer.AddField("warn_posi_value", 'D', warn_posi_value);
            packer.AddField("appd_value", 'D', appd_value);
            packer.AddField("close_posi_value", 'D', close_posi_value);
            packer.AddField("max_moni_value", 'D', max_moni_value);
            packer.AddField("contrs_stock_code", 'S', contrs_stock_code);
            packer.AddField("contrs_exch_no", 'I', contrs_exch_no);
            packer.AddField("contrs_max_moni_value", 'D', contrs_max_moni_value);
            packer.AddField("close_posi_flag", 'I', close_posi_flag);
            packer.AddField("close_ratio_level_one", 'D', close_ratio_level_one);
            packer.AddField("close_ratio_level_two", 'D', close_ratio_level_two);
            packer.AddField("close_ratio_level_three", 'D', close_ratio_level_three);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_STR_STR,pd_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_STR_STR,exch_group_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MONITOR_CTRL_TYPE_INT,monitor_ctrl_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MONI_VALUE_TYPE_INT,moni_value_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MONITOR_PARAM_VALUE_INT,monitor_param_value);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MONI_VALUE_FLAG_INT,moni_value_flag);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WARN_POSI_VALUE_FLOAT,warn_posi_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_APPD_VALUE_FLOAT,appd_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_VALUE_FLOAT,close_posi_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_MONI_VALUE_FLOAT,max_moni_value);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRS_STOCK_CODE_STR,contrs_stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRS_EXCH_NO_INT,contrs_exch_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CONTRS_MAX_MONI_VALUE_FLOAT,contrs_max_moni_value);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_FLAG_INT,close_posi_flag);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_RATIO_LEVEL_ONE_FLOAT,close_ratio_level_one);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_RATIO_LEVEL_TWO_FLOAT,close_ratio_level_two);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_RATIO_LEVEL_THREE_FLOAT,close_ratio_level_three);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class rksecuL_4_19_Request : BaseRequest, IRequest<rksecuL_4_19_Response>
    {
        public rksecuL_4_19_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rksecuL.4.19";
            }
        }

        public ulong moni_set_id { get; set; }
        public int co_no { get; set; }
        public String pd_no_str { get; set; }
        public String exch_group_no_str { get; set; }
        public int monitor_ctrl_type { get; set; }
        public int moni_value_type { get; set; }
        public int monitor_param_value { get; set; }
        public String stock_code { get; set; }
        public int exch_no { get; set; }
        public int moni_value_flag { get; set; }
        public double warn_posi_value { get; set; }
        public double appd_value { get; set; }
        public double close_posi_value { get; set; }
        public double max_moni_value { get; set; }
        public String contrs_stock_code { get; set; }
        public int contrs_exch_no { get; set; }
        public double contrs_max_moni_value { get; set; }
        public int close_posi_flag { get; set; }
        public double close_ratio_level_one { get; set; }
        public double close_ratio_level_two { get; set; }
        public double close_ratio_level_three { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("moni_set_id", 'L', moni_set_id);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no_str", 'S', pd_no_str);
            packer.AddField("exch_group_no_str", 'S', exch_group_no_str);
            packer.AddField("monitor_ctrl_type", 'I', monitor_ctrl_type);
            packer.AddField("moni_value_type", 'I', moni_value_type);
            packer.AddField("monitor_param_value", 'I', monitor_param_value);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("moni_value_flag", 'I', moni_value_flag);
            packer.AddField("warn_posi_value", 'D', warn_posi_value);
            packer.AddField("appd_value", 'D', appd_value);
            packer.AddField("close_posi_value", 'D', close_posi_value);
            packer.AddField("max_moni_value", 'D', max_moni_value);
            packer.AddField("contrs_stock_code", 'S', contrs_stock_code);
            packer.AddField("contrs_exch_no", 'I', contrs_exch_no);
            packer.AddField("contrs_max_moni_value", 'D', contrs_max_moni_value);
            packer.AddField("close_posi_flag", 'I', close_posi_flag);
            packer.AddField("close_ratio_level_one", 'D', close_ratio_level_one);
            packer.AddField("close_ratio_level_two", 'D', close_ratio_level_two);
            packer.AddField("close_ratio_level_three", 'D', close_ratio_level_three);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_MONI_SET_ID_INT64,moni_set_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_STR_STR,pd_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_STR_STR,exch_group_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MONITOR_CTRL_TYPE_INT,monitor_ctrl_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MONI_VALUE_TYPE_INT,moni_value_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MONITOR_PARAM_VALUE_INT,monitor_param_value);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MONI_VALUE_FLAG_INT,moni_value_flag);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WARN_POSI_VALUE_FLOAT,warn_posi_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_APPD_VALUE_FLOAT,appd_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_VALUE_FLOAT,close_posi_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_MONI_VALUE_FLOAT,max_moni_value);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRS_STOCK_CODE_STR,contrs_stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRS_EXCH_NO_INT,contrs_exch_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CONTRS_MAX_MONI_VALUE_FLOAT,contrs_max_moni_value);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_FLAG_INT,close_posi_flag);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_RATIO_LEVEL_ONE_FLOAT,close_ratio_level_one);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_RATIO_LEVEL_TWO_FLOAT,close_ratio_level_two);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_RATIO_LEVEL_THREE_FLOAT,close_ratio_level_three);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class rksecuL_4_20_Request : BaseRequest, IRequest<rksecuL_4_20_Response>
    {
        public rksecuL_4_20_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rksecuL.4.20";
            }
        }

        public int co_no { get; set; }
        public ulong moni_set_id { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("moni_set_id", 'L', moni_set_id);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_MONI_SET_ID_INT64,moni_set_id);
            return fastMsg;
        }
   }

    public class rksecuL_4_21_Request : BaseRequest, IRequest<rksecuL_4_21_Response>
    {
        public rksecuL_4_21_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rksecuL.4.21";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int moni_value_flag { get; set; }
        public int moni_value_type { get; set; }
        public String moni_set_status { get; set; }
        public String moni_result_status { get; set; }
        public int sort_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("moni_value_flag", 'I', moni_value_flag);
            packer.AddField("moni_value_type", 'I', moni_value_type);
            packer.AddField("moni_set_status", 'S', moni_set_status);
            packer.AddField("moni_result_status", 'S', moni_result_status);
            packer.AddField("sort_type", 'I', sort_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MONI_VALUE_FLAG_INT,moni_value_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MONI_VALUE_TYPE_INT,moni_value_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MONI_SET_STATUS_STR,moni_set_status);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MONI_RESULT_STATUS_STR,moni_result_status);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SORT_TYPE_INT,sort_type);
            return fastMsg;
        }
   }

    public class rksecuL_4_22_Request : BaseRequest, IRequest<rksecuL_4_22_Response>
    {
        public rksecuL_4_22_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rksecuL.4.22";
            }
        }

        public int co_no { get; set; }
        public ulong moni_set_id { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("moni_set_id", 'L', moni_set_id);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_MONI_SET_ID_INT64,moni_set_id);
            return fastMsg;
        }
   }

    public class rksecuL_4_23_Request : BaseRequest, IRequest<rksecuL_4_23_Response>
    {
        public rksecuL_4_23_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rksecuL.4.23";
            }
        }

        public int co_no { get; set; }
        public ulong moni_set_id { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("moni_set_id", 'L', moni_set_id);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_MONI_SET_ID_INT64,moni_set_id);
            return fastMsg;
        }
   }

    public class rksecuL_4_24_Request : BaseRequest, IRequest<rksecuL_4_24_Response>
    {
        public rksecuL_4_24_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rksecuL.4.24";
            }
        }

        public int co_no { get; set; }
        public ulong moni_set_id { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("moni_set_id", 'L', moni_set_id);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_MONI_SET_ID_INT64,moni_set_id);
            return fastMsg;
        }
   }

    public class rksecuL_4_25_Request : BaseRequest, IRequest<rksecuL_4_25_Response>
    {
        public rksecuL_4_25_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rksecuL.4.25";
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

    public class rksecuL_4_26_Request : BaseRequest, IRequest<rksecuL_4_26_Response>
    {
        public rksecuL_4_26_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rksecuL.4.26";
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

    public class rksecuL_4_27_Request : BaseRequest, IRequest<rksecuL_4_27_Response>
    {
        public rksecuL_4_27_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rksecuL.4.27";
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

    public class rksecuL_4_28_Request : BaseRequest, IRequest<rksecuL_4_28_Response>
    {
        public rksecuL_4_28_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rksecuL.4.28";
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

    public class rksecuL_4_29_Request : BaseRequest, IRequest<rksecuL_4_29_Response>
    {
        public rksecuL_4_29_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rksecuL.4.29";
            }
        }

        public int begin_date { get; set; }
        public int end_date { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int trig_stage_type { get; set; }
        public String risk_rule_action { get; set; }
        public int risk_rule_type { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("trig_stage_type", 'I', trig_stage_type);
            packer.AddField("risk_rule_action", 'S', risk_rule_action);
            packer.AddField("risk_rule_type", 'I', risk_rule_type);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT,end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_STAGE_TYPE_INT,trig_stage_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_ACTION_STR,risk_rule_action);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_TYPE_INT,risk_rule_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class rksecuL_4_30_Request : BaseRequest, IRequest<rksecuL_4_30_Response>
    {
        public rksecuL_4_30_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rksecuL.4.30";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int risk_item_id { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("risk_item_id", 'I', risk_item_id);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_ITEM_ID_INT,risk_item_id);
            return fastMsg;
        }
   }

    public class rksecuL_4_31_Request : BaseRequest, IRequest<rksecuL_4_31_Response>
    {
        public rksecuL_4_31_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rksecuL.4.31";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public ulong row_id { get; set; }
        public int rule_flag { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("rule_flag", 'I', rule_flag);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RULE_FLAG_INT,rule_flag);
            return fastMsg;
        }
   }

    public class rksecuL_4_32_Request : BaseRequest, IRequest<rksecuL_4_32_Response>
    {
        public rksecuL_4_32_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rksecuL.4.32";
            }
        }

        public int co_no { get; set; }
        public String pd_no_str { get; set; }
        public String exch_group_no_str { get; set; }
        public String asset_acco_no_str { get; set; }
        public String exch_no_str { get; set; }
        public String exch_crncy_type_str { get; set; }
        public String stock_code_str { get; set; }
        public String order_dir_str { get; set; }
        public String order_price_str { get; set; }
        public String order_qty_str { get; set; }
        public int trig_stage_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no_str", 'S', pd_no_str);
            packer.AddField("exch_group_no_str", 'S', exch_group_no_str);
            packer.AddField("asset_acco_no_str", 'S', asset_acco_no_str);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("exch_crncy_type_str", 'S', exch_crncy_type_str);
            packer.AddField("stock_code_str", 'S', stock_code_str);
            packer.AddField("order_dir_str", 'S', order_dir_str);
            packer.AddField("order_price_str", 'S', order_price_str);
            packer.AddField("order_qty_str", 'S', order_qty_str);
            packer.AddField("trig_stage_type", 'I', trig_stage_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_STR_STR,pd_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_STR_STR,exch_group_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_STR_STR,asset_acco_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR_STR,exch_crncy_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR_STR,stock_code_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR,order_dir_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_STR_STR,order_price_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_STR_STR,order_qty_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_STAGE_TYPE_INT,trig_stage_type);
            return fastMsg;
        }
   }

    public class rksecuL_4_33_Request : BaseRequest, IRequest<rksecuL_4_33_Response>
    {
        public rksecuL_4_33_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rksecuL.4.33";
            }
        }

        public int query_opor_no { get; set; }
        public double last_tshold_value { get; set; }
        public String posi_status { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("query_opor_no", 'I', query_opor_no);
            packer.AddField("last_tshold_value", 'D', last_tshold_value);
            packer.AddField("posi_status", 'S', posi_status);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_OPOR_NO_INT,query_opor_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_TSHOLD_VALUE_FLOAT,last_tshold_value);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_POSI_STATUS_STR,posi_status);
            return fastMsg;
        }
   }

    public class rksecuL_4_34_Request : BaseRequest, IRequest<rksecuL_4_34_Response>
    {
        public rksecuL_4_34_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rksecuL.4.34";
            }
        }

        public int query_opor_no { get; set; }
        public double last_tshold_value { get; set; }
        public String posi_status { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("query_opor_no", 'I', query_opor_no);
            packer.AddField("last_tshold_value", 'D', last_tshold_value);
            packer.AddField("posi_status", 'S', posi_status);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_OPOR_NO_INT,query_opor_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_TSHOLD_VALUE_FLOAT,last_tshold_value);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_POSI_STATUS_STR,posi_status);
            return fastMsg;
        }
   }

    public class rksecuL_4_35_Request : BaseRequest, IRequest<rksecuL_4_35_Response>
    {
        public rksecuL_4_35_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rksecuL.4.35";
            }
        }

        public int co_no { get; set; }
        public int busi_opor_no { get; set; }
        public int moni_role_type { get; set; }
        public int moni_value_flag { get; set; }
        public int moni_value_type { get; set; }
        public double warn_posi_value { get; set; }
        public int warn_trig_oper_type { get; set; }
        public double close_posi_value { get; set; }
        public int close_trig_oper_type { get; set; }
        public double appd_value { get; set; }
        public int appd_trig_oper_type { get; set; }
        public int begin_moni_date { get; set; }
        public double begin_moni_value { get; set; }
        public double max_moni_value { get; set; }
        public String contrs_stock_code { get; set; }
        public int contrs_exch_no { get; set; }
        public double contrs_max_moni_value { get; set; }
        public int close_posi_flag { get; set; }
        public double close_ratio_level_one { get; set; }
        public double close_ratio_level_two { get; set; }
        public double close_ratio_level_three { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("busi_opor_no", 'I', busi_opor_no);
            packer.AddField("moni_role_type", 'I', moni_role_type);
            packer.AddField("moni_value_flag", 'I', moni_value_flag);
            packer.AddField("moni_value_type", 'I', moni_value_type);
            packer.AddField("warn_posi_value", 'D', warn_posi_value);
            packer.AddField("warn_trig_oper_type", 'I', warn_trig_oper_type);
            packer.AddField("close_posi_value", 'D', close_posi_value);
            packer.AddField("close_trig_oper_type", 'I', close_trig_oper_type);
            packer.AddField("appd_value", 'D', appd_value);
            packer.AddField("appd_trig_oper_type", 'I', appd_trig_oper_type);
            packer.AddField("begin_moni_date", 'I', begin_moni_date);
            packer.AddField("begin_moni_value", 'D', begin_moni_value);
            packer.AddField("max_moni_value", 'D', max_moni_value);
            packer.AddField("contrs_stock_code", 'S', contrs_stock_code);
            packer.AddField("contrs_exch_no", 'I', contrs_exch_no);
            packer.AddField("contrs_max_moni_value", 'D', contrs_max_moni_value);
            packer.AddField("close_posi_flag", 'I', close_posi_flag);
            packer.AddField("close_ratio_level_one", 'D', close_ratio_level_one);
            packer.AddField("close_ratio_level_two", 'D', close_ratio_level_two);
            packer.AddField("close_ratio_level_three", 'D', close_ratio_level_three);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT,busi_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MONI_ROLE_TYPE_INT,moni_role_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MONI_VALUE_FLAG_INT,moni_value_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MONI_VALUE_TYPE_INT,moni_value_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WARN_POSI_VALUE_FLOAT,warn_posi_value);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WARN_TRIG_OPER_TYPE_INT,warn_trig_oper_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_VALUE_FLOAT,close_posi_value);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_TRIG_OPER_TYPE_INT,close_trig_oper_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_APPD_VALUE_FLOAT,appd_value);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_APPD_TRIG_OPER_TYPE_INT,appd_trig_oper_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_MONI_DATE_INT,begin_moni_date);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_MONI_VALUE_FLOAT,begin_moni_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_MONI_VALUE_FLOAT,max_moni_value);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRS_STOCK_CODE_STR,contrs_stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRS_EXCH_NO_INT,contrs_exch_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CONTRS_MAX_MONI_VALUE_FLOAT,contrs_max_moni_value);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_FLAG_INT,close_posi_flag);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_RATIO_LEVEL_ONE_FLOAT,close_ratio_level_one);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_RATIO_LEVEL_TWO_FLOAT,close_ratio_level_two);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_RATIO_LEVEL_THREE_FLOAT,close_ratio_level_three);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class rksecuL_4_36_Request : BaseRequest, IRequest<rksecuL_4_36_Response>
    {
        public rksecuL_4_36_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rksecuL.4.36";
            }
        }

        public ulong moni_set_id { get; set; }
        public int co_no { get; set; }
        public int busi_opor_no { get; set; }
        public int moni_role_type { get; set; }
        public int moni_value_flag { get; set; }
        public int moni_value_type { get; set; }
        public double warn_posi_value { get; set; }
        public int warn_trig_oper_type { get; set; }
        public double close_posi_value { get; set; }
        public int close_trig_oper_type { get; set; }
        public double appd_value { get; set; }
        public int appd_trig_oper_type { get; set; }
        public int begin_moni_date { get; set; }
        public double begin_moni_value { get; set; }
        public double max_moni_value { get; set; }
        public double curr_moni_value { get; set; }
        public String contrs_stock_code { get; set; }
        public int contrs_exch_no { get; set; }
        public double contrs_max_moni_value { get; set; }
        public int close_posi_flag { get; set; }
        public double close_ratio_level_one { get; set; }
        public double close_ratio_level_two { get; set; }
        public double close_ratio_level_three { get; set; }
        public int trig_oper_type { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("moni_set_id", 'L', moni_set_id);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("busi_opor_no", 'I', busi_opor_no);
            packer.AddField("moni_role_type", 'I', moni_role_type);
            packer.AddField("moni_value_flag", 'I', moni_value_flag);
            packer.AddField("moni_value_type", 'I', moni_value_type);
            packer.AddField("warn_posi_value", 'D', warn_posi_value);
            packer.AddField("warn_trig_oper_type", 'I', warn_trig_oper_type);
            packer.AddField("close_posi_value", 'D', close_posi_value);
            packer.AddField("close_trig_oper_type", 'I', close_trig_oper_type);
            packer.AddField("appd_value", 'D', appd_value);
            packer.AddField("appd_trig_oper_type", 'I', appd_trig_oper_type);
            packer.AddField("begin_moni_date", 'I', begin_moni_date);
            packer.AddField("begin_moni_value", 'D', begin_moni_value);
            packer.AddField("max_moni_value", 'D', max_moni_value);
            packer.AddField("curr_moni_value", 'D', curr_moni_value);
            packer.AddField("contrs_stock_code", 'S', contrs_stock_code);
            packer.AddField("contrs_exch_no", 'I', contrs_exch_no);
            packer.AddField("contrs_max_moni_value", 'D', contrs_max_moni_value);
            packer.AddField("close_posi_flag", 'I', close_posi_flag);
            packer.AddField("close_ratio_level_one", 'D', close_ratio_level_one);
            packer.AddField("close_ratio_level_two", 'D', close_ratio_level_two);
            packer.AddField("close_ratio_level_three", 'D', close_ratio_level_three);
            packer.AddField("trig_oper_type", 'I', trig_oper_type);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_MONI_SET_ID_INT64,moni_set_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT,busi_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MONI_ROLE_TYPE_INT,moni_role_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MONI_VALUE_FLAG_INT,moni_value_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MONI_VALUE_TYPE_INT,moni_value_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WARN_POSI_VALUE_FLOAT,warn_posi_value);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WARN_TRIG_OPER_TYPE_INT,warn_trig_oper_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_VALUE_FLOAT,close_posi_value);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_TRIG_OPER_TYPE_INT,close_trig_oper_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_APPD_VALUE_FLOAT,appd_value);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_APPD_TRIG_OPER_TYPE_INT,appd_trig_oper_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_MONI_DATE_INT,begin_moni_date);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_MONI_VALUE_FLOAT,begin_moni_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_MONI_VALUE_FLOAT,max_moni_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONI_VALUE_FLOAT,curr_moni_value);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRS_STOCK_CODE_STR,contrs_stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRS_EXCH_NO_INT,contrs_exch_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CONTRS_MAX_MONI_VALUE_FLOAT,contrs_max_moni_value);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_FLAG_INT,close_posi_flag);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_RATIO_LEVEL_ONE_FLOAT,close_ratio_level_one);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_RATIO_LEVEL_TWO_FLOAT,close_ratio_level_two);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_RATIO_LEVEL_THREE_FLOAT,close_ratio_level_three);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_OPER_TYPE_INT,trig_oper_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class rksecuL_4_37_Request : BaseRequest, IRequest<rksecuL_4_37_Response>
    {
        public rksecuL_4_37_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rksecuL.4.37";
            }
        }

        public int co_no { get; set; }
        public ulong moni_set_id { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("moni_set_id", 'L', moni_set_id);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_MONI_SET_ID_INT64,moni_set_id);
            return fastMsg;
        }
   }

    public class rksecuL_4_38_Request : BaseRequest, IRequest<rksecuL_4_38_Response>
    {
        public rksecuL_4_38_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rksecuL.4.38";
            }
        }

        public int co_no { get; set; }
        public int busi_opor_no { get; set; }
        public int moni_role_type { get; set; }
        public int moni_value_flag { get; set; }
        public int moni_value_type { get; set; }
        public String moni_set_status { get; set; }
        public String moni_result_status { get; set; }
        public int sort_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("busi_opor_no", 'I', busi_opor_no);
            packer.AddField("moni_role_type", 'I', moni_role_type);
            packer.AddField("moni_value_flag", 'I', moni_value_flag);
            packer.AddField("moni_value_type", 'I', moni_value_type);
            packer.AddField("moni_set_status", 'S', moni_set_status);
            packer.AddField("moni_result_status", 'S', moni_result_status);
            packer.AddField("sort_type", 'I', sort_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT,busi_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MONI_ROLE_TYPE_INT,moni_role_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MONI_VALUE_FLAG_INT,moni_value_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MONI_VALUE_TYPE_INT,moni_value_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MONI_SET_STATUS_STR,moni_set_status);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MONI_RESULT_STATUS_STR,moni_result_status);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SORT_TYPE_INT,sort_type);
            return fastMsg;
        }
   }

    public class rksecuL_4_39_Request : BaseRequest, IRequest<rksecuL_4_39_Response>
    {
        public rksecuL_4_39_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rksecuL.4.39";
            }
        }

        public int co_no { get; set; }
        public ulong moni_set_id { get; set; }
        public String moni_set_status { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("moni_set_id", 'L', moni_set_id);
            packer.AddField("moni_set_status", 'S', moni_set_status);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_MONI_SET_ID_INT64,moni_set_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MONI_SET_STATUS_STR,moni_set_status);
            return fastMsg;
        }
   }

    public class rksecuL_4_40_Request : BaseRequest, IRequest<rksecuL_4_40_Response>
    {
        public rksecuL_4_40_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rksecuL.4.40";
            }
        }

        public int co_no { get; set; }
        public String moni_set_status { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("moni_set_status", 'S', moni_set_status);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MONI_SET_STATUS_STR,moni_set_status);
            return fastMsg;
        }
   }

    public class rksecuL_4_41_Request : BaseRequest, IRequest<rksecuL_4_41_Response>
    {
        public rksecuL_4_41_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rksecuL.4.41";
            }
        }

        public int co_no { get; set; }
        public int query_opor_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int exch_no { get; set; }
        public int stock_code_no { get; set; }
        public int begin_date { get; set; }
        public int end_date { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("query_opor_no", 'I', query_opor_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_OPOR_NO_INT,query_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT,end_date);
            return fastMsg;
        }
   }

    public class rksecuL_4_42_Request : BaseRequest, IRequest<rksecuL_4_42_Response>
    {
        public rksecuL_4_42_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rksecuL.4.42";
            }
        }

        public int co_no { get; set; }
        public int query_opor_no { get; set; }
        public int begin_date { get; set; }
        public int end_date { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("query_opor_no", 'I', query_opor_no);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_OPOR_NO_INT,query_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT,end_date);
            return fastMsg;
        }
   }

    public class rksecuL_4_43_Request : BaseRequest, IRequest<rksecuL_4_43_Response>
    {
        public rksecuL_4_43_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rksecuL.4.43";
            }
        }

        public int co_no { get; set; }
        public int query_opor_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int exch_no { get; set; }
        public int stock_code_no { get; set; }
        public int begin_date { get; set; }
        public int end_date { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("query_opor_no", 'I', query_opor_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_OPOR_NO_INT,query_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT,end_date);
            return fastMsg;
        }
   }

    public class rksecuL_4_44_Request : BaseRequest, IRequest<rksecuL_4_44_Response>
    {
        public rksecuL_4_44_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rksecuL.4.44";
            }
        }

        public int co_no { get; set; }
        public int query_opor_no { get; set; }
        public int begin_date { get; set; }
        public int end_date { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("query_opor_no", 'I', query_opor_no);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_OPOR_NO_INT,query_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT,end_date);
            return fastMsg;
        }
   }

    public class rksecuL_4_45_Request : BaseRequest, IRequest<rksecuL_4_45_Response>
    {
        public rksecuL_4_45_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rksecuL.4.45";
            }
        }

        public int co_no { get; set; }
        public int trig_stage_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("trig_stage_type", 'I', trig_stage_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_STAGE_TYPE_INT,trig_stage_type);
            return fastMsg;
        }
   }

    public class rksecuL_4_51_Request : BaseRequest, IRequest<rksecuL_4_51_Response>
    {
        public rksecuL_4_51_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rksecuL.4.51";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public double curr_converted_margin { get; set; }
        public double cmmd_converted_margin { get; set; }
        public double order_converted_margin { get; set; }
        public double fina_market_value { get; set; }
        public double fina_profit { get; set; }
        public double fina_converted_pandl { get; set; }
        public double loan_market_value { get; set; }
        public double loan_profit { get; set; }
        public double loan_converted_pandl { get; set; }
        public double fina_capt_margin { get; set; }
        public double loan_capt_margin { get; set; }
        public double keep_guarantee_ratio { get; set; }
        public double loan_sell_amt { get; set; }
        public double margin_ratio_market_value { get; set; }
        public double fina_interest { get; set; }
        public double loan_interest { get; set; }
        public int update_times { get; set; }
        public double fina_comm_capt_margin { get; set; }
        public double loan_comm_capt_margin { get; set; }
        public double fina_order_capt_margin { get; set; }
        public double loan_order_capt_margin { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("curr_converted_margin", 'D', curr_converted_margin);
            packer.AddField("cmmd_converted_margin", 'D', cmmd_converted_margin);
            packer.AddField("order_converted_margin", 'D', order_converted_margin);
            packer.AddField("fina_market_value", 'D', fina_market_value);
            packer.AddField("fina_profit", 'D', fina_profit);
            packer.AddField("fina_converted_pandl", 'D', fina_converted_pandl);
            packer.AddField("loan_market_value", 'D', loan_market_value);
            packer.AddField("loan_profit", 'D', loan_profit);
            packer.AddField("loan_converted_pandl", 'D', loan_converted_pandl);
            packer.AddField("fina_capt_margin", 'D', fina_capt_margin);
            packer.AddField("loan_capt_margin", 'D', loan_capt_margin);
            packer.AddField("keep_guarantee_ratio", 'D', keep_guarantee_ratio);
            packer.AddField("loan_sell_amt", 'D', loan_sell_amt);
            packer.AddField("margin_ratio_market_value", 'D', margin_ratio_market_value);
            packer.AddField("fina_interest", 'D', fina_interest);
            packer.AddField("loan_interest", 'D', loan_interest);
            packer.AddField("update_times", 'I', update_times);
            packer.AddField("fina_comm_capt_margin", 'D', fina_comm_capt_margin);
            packer.AddField("loan_comm_capt_margin", 'D', loan_comm_capt_margin);
            packer.AddField("fina_order_capt_margin", 'D', fina_order_capt_margin);
            packer.AddField("loan_order_capt_margin", 'D', loan_order_capt_margin);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_CONVERTED_MARGIN_FLOAT,curr_converted_margin);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CMMD_CONVERTED_MARGIN_FLOAT,cmmd_converted_margin);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_CONVERTED_MARGIN_FLOAT,order_converted_margin);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_MARKET_VALUE_FLOAT,fina_market_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_PROFIT_FLOAT,fina_profit);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_CONVERTED_PANDL_FLOAT,fina_converted_pandl);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_MARKET_VALUE_FLOAT,loan_market_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_PROFIT_FLOAT,loan_profit);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_CONVERTED_PANDL_FLOAT,loan_converted_pandl);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_CAPT_MARGIN_FLOAT,fina_capt_margin);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_CAPT_MARGIN_FLOAT,loan_capt_margin);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_KEEP_GUARANTEE_RATIO_FLOAT,keep_guarantee_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_SELL_AMT_FLOAT,loan_sell_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARGIN_RATIO_MARKET_VALUE_FLOAT,margin_ratio_market_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_INTEREST_FLOAT,fina_interest);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_INTEREST_FLOAT,loan_interest);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT,update_times);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_COMM_CAPT_MARGIN_FLOAT,fina_comm_capt_margin);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_COMM_CAPT_MARGIN_FLOAT,loan_comm_capt_margin);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_ORDER_CAPT_MARGIN_FLOAT,fina_order_capt_margin);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_ORDER_CAPT_MARGIN_FLOAT,loan_order_capt_margin);
            return fastMsg;
        }
   }

    public class rksecuL_4_54_Request : BaseRequest, IRequest<rksecuL_4_54_Response>
    {
        public rksecuL_4_54_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rksecuL.4.54";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public String exch_crncy_type { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_crncy_type", 'S', exch_crncy_type);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR,exch_crncy_type);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class rksecuL_4_61_Request : BaseRequest, IRequest<rksecuL_4_61_Response>
    {
        public rksecuL_4_61_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rksecuL.4.61";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public int exch_group_no { get; set; }
        public double curr_converted_margin { get; set; }
        public double cmmd_converted_margin { get; set; }
        public double order_converted_margin { get; set; }
        public double fina_market_value { get; set; }
        public double fina_profit { get; set; }
        public double fina_converted_pandl { get; set; }
        public double loan_market_value { get; set; }
        public double loan_profit { get; set; }
        public double loan_converted_pandl { get; set; }
        public double fina_capt_margin { get; set; }
        public double loan_capt_margin { get; set; }
        public double keep_guarantee_ratio { get; set; }
        public double loan_sell_amt { get; set; }
        public double margin_ratio_market_value { get; set; }
        public double fina_interest { get; set; }
        public double loan_interest { get; set; }
        public int update_times { get; set; }
        public double fina_comm_capt_margin { get; set; }
        public double loan_comm_capt_margin { get; set; }
        public double fina_order_capt_margin { get; set; }
        public double loan_order_capt_margin { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("curr_converted_margin", 'D', curr_converted_margin);
            packer.AddField("cmmd_converted_margin", 'D', cmmd_converted_margin);
            packer.AddField("order_converted_margin", 'D', order_converted_margin);
            packer.AddField("fina_market_value", 'D', fina_market_value);
            packer.AddField("fina_profit", 'D', fina_profit);
            packer.AddField("fina_converted_pandl", 'D', fina_converted_pandl);
            packer.AddField("loan_market_value", 'D', loan_market_value);
            packer.AddField("loan_profit", 'D', loan_profit);
            packer.AddField("loan_converted_pandl", 'D', loan_converted_pandl);
            packer.AddField("fina_capt_margin", 'D', fina_capt_margin);
            packer.AddField("loan_capt_margin", 'D', loan_capt_margin);
            packer.AddField("keep_guarantee_ratio", 'D', keep_guarantee_ratio);
            packer.AddField("loan_sell_amt", 'D', loan_sell_amt);
            packer.AddField("margin_ratio_market_value", 'D', margin_ratio_market_value);
            packer.AddField("fina_interest", 'D', fina_interest);
            packer.AddField("loan_interest", 'D', loan_interest);
            packer.AddField("update_times", 'I', update_times);
            packer.AddField("fina_comm_capt_margin", 'D', fina_comm_capt_margin);
            packer.AddField("loan_comm_capt_margin", 'D', loan_comm_capt_margin);
            packer.AddField("fina_order_capt_margin", 'D', fina_order_capt_margin);
            packer.AddField("loan_order_capt_margin", 'D', loan_order_capt_margin);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_CONVERTED_MARGIN_FLOAT,curr_converted_margin);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CMMD_CONVERTED_MARGIN_FLOAT,cmmd_converted_margin);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_CONVERTED_MARGIN_FLOAT,order_converted_margin);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_MARKET_VALUE_FLOAT,fina_market_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_PROFIT_FLOAT,fina_profit);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_CONVERTED_PANDL_FLOAT,fina_converted_pandl);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_MARKET_VALUE_FLOAT,loan_market_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_PROFIT_FLOAT,loan_profit);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_CONVERTED_PANDL_FLOAT,loan_converted_pandl);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_CAPT_MARGIN_FLOAT,fina_capt_margin);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_CAPT_MARGIN_FLOAT,loan_capt_margin);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_KEEP_GUARANTEE_RATIO_FLOAT,keep_guarantee_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_SELL_AMT_FLOAT,loan_sell_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARGIN_RATIO_MARKET_VALUE_FLOAT,margin_ratio_market_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_INTEREST_FLOAT,fina_interest);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_INTEREST_FLOAT,loan_interest);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT,update_times);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_COMM_CAPT_MARGIN_FLOAT,fina_comm_capt_margin);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_COMM_CAPT_MARGIN_FLOAT,loan_comm_capt_margin);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_ORDER_CAPT_MARGIN_FLOAT,fina_order_capt_margin);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_ORDER_CAPT_MARGIN_FLOAT,loan_order_capt_margin);
            return fastMsg;
        }
   }

    public class rksecuL_4_64_Request : BaseRequest, IRequest<rksecuL_4_64_Response>
    {
        public rksecuL_4_64_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rksecuL.4.64";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int asset_acco_no { get; set; }
        public int exch_group_no { get; set; }
        public String exch_crncy_type { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("exch_crncy_type", 'S', exch_crncy_type);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR,exch_crncy_type);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class rksecuL_4_65_Request : BaseRequest, IRequest<rksecuL_4_65_Response>
    {
        public rksecuL_4_65_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rksecuL.4.65";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int moni_role_type { get; set; }
        public int moni_value_flag { get; set; }
        public int moni_value_type { get; set; }
        public String moni_set_status { get; set; }
        public String moni_result_status { get; set; }
        public int sort_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("moni_role_type", 'I', moni_role_type);
            packer.AddField("moni_value_flag", 'I', moni_value_flag);
            packer.AddField("moni_value_type", 'I', moni_value_type);
            packer.AddField("moni_set_status", 'S', moni_set_status);
            packer.AddField("moni_result_status", 'S', moni_result_status);
            packer.AddField("sort_type", 'I', sort_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MONI_ROLE_TYPE_INT,moni_role_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MONI_VALUE_FLAG_INT,moni_value_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MONI_VALUE_TYPE_INT,moni_value_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MONI_SET_STATUS_STR,moni_set_status);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MONI_RESULT_STATUS_STR,moni_result_status);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SORT_TYPE_INT,sort_type);
            return fastMsg;
        }
   }

    public class rksecuL_4_66_Request : BaseRequest, IRequest<rksecuL_4_66_Response>
    {
        public rksecuL_4_66_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rksecuL.4.66";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public int exch_no { get; set; }
        public String exch_crncy_type { get; set; }
        public String stock_code { get; set; }
        public int order_dir { get; set; }
        public double order_price { get; set; }
        public double order_qty { get; set; }
        public int order_batch_no { get; set; }
        public int price_type { get; set; }
        public String order_oper_way { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("exch_crncy_type", 'S', exch_crncy_type);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("order_dir", 'I', order_dir);
            packer.AddField("order_price", 'D', order_price);
            packer.AddField("order_qty", 'D', order_qty);
            packer.AddField("order_batch_no", 'I', order_batch_no);
            packer.AddField("price_type", 'I', price_type);
            packer.AddField("order_oper_way", 'S', order_oper_way);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR,exch_crncy_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT,order_dir);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT,order_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT,order_qty);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT,order_batch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_INT,price_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR,order_oper_way);
            return fastMsg;
        }
   }

    public class rksecuL_4_67_Request : BaseRequest, IRequest<rksecuL_4_67_Response>
    {
        public rksecuL_4_67_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rksecuL.4.67";
            }
        }

        public int order_batch_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("order_batch_no", 'I', order_batch_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT,order_batch_no);
            return fastMsg;
        }
   }

    public class rksecuL_4_68_Request : BaseRequest, IRequest<rksecuL_4_68_Response>
    {
        public rksecuL_4_68_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rksecuL.4.68";
            }
        }

        public int co_no { get; set; }
        public int order_batch_no { get; set; }
        public int trig_stage_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("order_batch_no", 'I', order_batch_no);
            packer.AddField("trig_stage_type", 'I', trig_stage_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT,order_batch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_STAGE_TYPE_INT,trig_stage_type);
            return fastMsg;
        }
   }

    public class rksecuL_4_69_Request : BaseRequest, IRequest<rksecuL_4_69_Response>
    {
        public rksecuL_4_69_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rksecuL.4.69";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public int exch_no { get; set; }
        public String exch_crncy_type { get; set; }
        public int stock_code_no { get; set; }
        public String stock_code { get; set; }
        public int comm_dir { get; set; }
        public double limit_actual_price { get; set; }
        public double comm_qty { get; set; }
        public int comm_batch_no { get; set; }
        public int comm_executor { get; set; }
        public double comm_limit_price { get; set; }
        public int price_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("exch_crncy_type", 'S', exch_crncy_type);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("comm_dir", 'I', comm_dir);
            packer.AddField("limit_actual_price", 'D', limit_actual_price);
            packer.AddField("comm_qty", 'D', comm_qty);
            packer.AddField("comm_batch_no", 'I', comm_batch_no);
            packer.AddField("comm_executor", 'I', comm_executor);
            packer.AddField("comm_limit_price", 'D', comm_limit_price);
            packer.AddField("price_type", 'I', price_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR,exch_crncy_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_INT,comm_dir);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT,limit_actual_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_QTY_FLOAT,comm_qty);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT,comm_batch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_EXECUTOR_INT,comm_executor);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_LIMIT_PRICE_FLOAT,comm_limit_price);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_INT,price_type);
            return fastMsg;
        }
   }

}
