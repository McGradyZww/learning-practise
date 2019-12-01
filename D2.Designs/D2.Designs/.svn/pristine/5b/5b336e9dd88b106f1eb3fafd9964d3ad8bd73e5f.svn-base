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
    public class rkfutuL_3_1_Request : BaseRequest, IRequest<rkfutuL_3_1_Response>
    {
        public rkfutuL_3_1_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rkfutuL.3.1";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public ulong model_id { get; set; }
        public int risk_item_id { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("model_id", 'L', model_id);
            packer.AddField("risk_item_id", 'I', risk_item_id);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_MODEL_ID_INT64,model_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_ITEM_ID_INT,risk_item_id);
            return fastMsg;
        }
   }

    public class rkfutuL_3_2_Request : BaseRequest, IRequest<rkfutuL_3_2_Response>
    {
        public rkfutuL_3_2_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rkfutuL.3.2";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public ulong model_id { get; set; }
        public String risk_item_id_str { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("model_id", 'L', model_id);
            packer.AddField("risk_item_id_str", 'S', risk_item_id_str);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_MODEL_ID_INT64,model_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_ITEM_ID_STR_STR,risk_item_id_str);
            return fastMsg;
        }
   }

    public class rkfutuL_3_3_Request : BaseRequest, IRequest<rkfutuL_3_3_Response>
    {
        public rkfutuL_3_3_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rkfutuL.3.3";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public ulong model_id { get; set; }
        public String risk_item_id_str { get; set; }
        public int exch_no { get; set; }
        public int contrc_type { get; set; }
        public String order_dir_str { get; set; }
        public int risk_rule_id { get; set; }
        public String risk_rule_type_str { get; set; }
        public String risk_rule_name { get; set; }
        public String corrsp_plug { get; set; }
        public int rule_flag { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("model_id", 'L', model_id);
            packer.AddField("risk_item_id_str", 'S', risk_item_id_str);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("contrc_type", 'I', contrc_type);
            packer.AddField("order_dir_str", 'S', order_dir_str);
            packer.AddField("risk_rule_id", 'I', risk_rule_id);
            packer.AddField("risk_rule_type_str", 'S', risk_rule_type_str);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_MODEL_ID_INT64,model_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_ITEM_ID_STR_STR,risk_item_id_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT,contrc_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR,order_dir_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_ID_INT,risk_rule_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_TYPE_STR_STR,risk_rule_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_NAME_STR,risk_rule_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CORRSP_PLUG_STR,corrsp_plug);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RULE_FLAG_INT,rule_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class rkfutuL_3_4_Request : BaseRequest, IRequest<rkfutuL_3_4_Response>
    {
        public rkfutuL_3_4_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rkfutuL.3.4";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public int exch_no { get; set; }
        public int contrc_type { get; set; }
        public String order_dir_str { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("contrc_type", 'I', contrc_type);
            packer.AddField("order_dir_str", 'S', order_dir_str);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT,contrc_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR,order_dir_str);
            return fastMsg;
        }
   }

    public class rkfutuL_3_5_Request : BaseRequest, IRequest<rkfutuL_3_5_Response>
    {
        public rkfutuL_3_5_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rkfutuL.3.5";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public int exch_no { get; set; }
        public int hedge_type { get; set; }
        public String comb_code { get; set; }
        public int lngsht_type { get; set; }
        public int contrc_type { get; set; }
        public String contrc_code { get; set; }
        public int order_dir { get; set; }
        public int contrc_dir { get; set; }
        public double all_fee { get; set; }
        public double rece_margin { get; set; }
        public double order_qty { get; set; }
        public int contrc_unit { get; set; }
        public double order_price { get; set; }
        public int trig_stage_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("hedge_type", 'I', hedge_type);
            packer.AddField("comb_code", 'S', comb_code);
            packer.AddField("lngsht_type", 'I', lngsht_type);
            packer.AddField("contrc_type", 'I', contrc_type);
            packer.AddField("contrc_code", 'S', contrc_code);
            packer.AddField("order_dir", 'I', order_dir);
            packer.AddField("contrc_dir", 'I', contrc_dir);
            packer.AddField("all_fee", 'D', all_fee);
            packer.AddField("rece_margin", 'D', rece_margin);
            packer.AddField("order_qty", 'D', order_qty);
            packer.AddField("contrc_unit", 'I', contrc_unit);
            packer.AddField("order_price", 'D', order_price);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT,hedge_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMB_CODE_STR,comb_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT,lngsht_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT,contrc_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR,contrc_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT,order_dir);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_DIR_INT,contrc_dir);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT,all_fee);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RECE_MARGIN_FLOAT,rece_margin);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT,order_qty);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_UNIT_INT,contrc_unit);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT,order_price);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_STAGE_TYPE_INT,trig_stage_type);
            return fastMsg;
        }
   }

    public class rkfutuL_3_6_Request : BaseRequest, IRequest<rkfutuL_3_6_Response>
    {
        public rkfutuL_3_6_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rkfutuL.3.6";
            }
        }

        public int create_date { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public String risk_rule_action { get; set; }
        public int risk_rule_type { get; set; }
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class rkfutuL_3_7_Request : BaseRequest, IRequest<rkfutuL_3_7_Response>
    {
        public rkfutuL_3_7_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rkfutuL.3.7";
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

    public class rkfutuL_3_8_Request : BaseRequest, IRequest<rkfutuL_3_8_Response>
    {
        public rkfutuL_3_8_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rkfutuL.3.8";
            }
        }

        public int begin_date { get; set; }
        public int end_date { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
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
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_ACTION_STR,risk_rule_action);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_TYPE_INT,risk_rule_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class rkfutuL_3_9_Request : BaseRequest, IRequest<rkfutuL_3_9_Response>
    {
        public rkfutuL_3_9_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "rkfutuL.3.9";
            }
        }

        public int co_no { get; set; }
        public String pd_no_str { get; set; }
        public String exch_group_no_str { get; set; }
        public String asset_acco_no_str { get; set; }
        public String exch_no_str { get; set; }
        public String hedge_type_str { get; set; }
        public String comb_code_str { get; set; }
        public String lngsht_type_str { get; set; }
        public String contrc_type_str { get; set; }
        public String contrc_code_str { get; set; }
        public String order_dir_str { get; set; }
        public String contrc_dir_str { get; set; }
        public String all_fee_str { get; set; }
        public String rece_margin_str { get; set; }
        public String order_qty_str { get; set; }
        public String contrc_unit_str { get; set; }
        public String order_price_str { get; set; }
        public int trig_stage_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no_str", 'S', pd_no_str);
            packer.AddField("exch_group_no_str", 'S', exch_group_no_str);
            packer.AddField("asset_acco_no_str", 'S', asset_acco_no_str);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("hedge_type_str", 'S', hedge_type_str);
            packer.AddField("comb_code_str", 'S', comb_code_str);
            packer.AddField("lngsht_type_str", 'S', lngsht_type_str);
            packer.AddField("contrc_type_str", 'S', contrc_type_str);
            packer.AddField("contrc_code_str", 'S', contrc_code_str);
            packer.AddField("order_dir_str", 'S', order_dir_str);
            packer.AddField("contrc_dir_str", 'S', contrc_dir_str);
            packer.AddField("all_fee_str", 'S', all_fee_str);
            packer.AddField("rece_margin_str", 'S', rece_margin_str);
            packer.AddField("order_qty_str", 'S', order_qty_str);
            packer.AddField("contrc_unit_str", 'S', contrc_unit_str);
            packer.AddField("order_price_str", 'S', order_price_str);
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
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_STR_STR,hedge_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMB_CODE_STR_STR,comb_code_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_STR_STR,lngsht_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_STR_STR,contrc_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR_STR,contrc_code_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR,order_dir_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_DIR_STR_STR,contrc_dir_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_STR_STR,all_fee_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RECE_MARGIN_STR_STR,rece_margin_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_STR_STR,order_qty_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_UNIT_STR_STR,contrc_unit_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_STR_STR,order_price_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_STAGE_TYPE_INT,trig_stage_type);
            return fastMsg;
        }
   }

}
