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
    public class evaL_1_1_Request : BaseRequest, IRequest<evaL_1_1_Response>
    {
        public evaL_1_1_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "evaL.1.1";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public String fina_acco_code { get; set; }
        public String fina_acco_name { get; set; }
        public int fina_acco_level { get; set; }
        public String exch_no_str { get; set; }
        public String pd_asset_type_str { get; set; }
        public String pd_fee_type_str { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("fina_acco_code", 'S', fina_acco_code);
            packer.AddField("fina_acco_name", 'S', fina_acco_name);
            packer.AddField("fina_acco_level", 'I', fina_acco_level);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("pd_asset_type_str", 'S', pd_asset_type_str);
            packer.AddField("pd_fee_type_str", 'S', pd_fee_type_str);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FINA_ACCO_CODE_STR,fina_acco_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FINA_ACCO_NAME_STR,fina_acco_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FINA_ACCO_LEVEL_INT,fina_acco_level);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_ASSET_TYPE_STR_STR,pd_asset_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_FEE_TYPE_STR_STR,pd_fee_type_str);
            return fastMsg;
        }
   }

    public class evaL_1_2_Request : BaseRequest, IRequest<evaL_1_2_Response>
    {
        public evaL_1_2_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "evaL.1.2";
            }
        }

        public ulong row_id { get; set; }
        public int co_no { get; set; }
        public String fina_acco_code { get; set; }
        public String fina_acco_name { get; set; }
        public int fina_acco_level { get; set; }
        public String exch_no_str { get; set; }
        public String pd_asset_type_str { get; set; }
        public String pd_fee_type_str { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("fina_acco_code", 'S', fina_acco_code);
            packer.AddField("fina_acco_name", 'S', fina_acco_name);
            packer.AddField("fina_acco_level", 'I', fina_acco_level);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("pd_asset_type_str", 'S', pd_asset_type_str);
            packer.AddField("pd_fee_type_str", 'S', pd_fee_type_str);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FINA_ACCO_CODE_STR,fina_acco_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FINA_ACCO_NAME_STR,fina_acco_name);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FINA_ACCO_LEVEL_INT,fina_acco_level);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_ASSET_TYPE_STR_STR,pd_asset_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_FEE_TYPE_STR_STR,pd_fee_type_str);
            return fastMsg;
        }
   }

    public class evaL_1_3_Request : BaseRequest, IRequest<evaL_1_3_Response>
    {
        public evaL_1_3_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "evaL.1.3";
            }
        }

        public ulong row_id { get; set; }
        public int co_no { get; set; }
        public String fina_acco_code { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("fina_acco_code", 'S', fina_acco_code);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FINA_ACCO_CODE_STR,fina_acco_code);
            return fastMsg;
        }
   }

    public class evaL_1_4_Request : BaseRequest, IRequest<evaL_1_4_Response>
    {
        public evaL_1_4_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "evaL.1.4";
            }
        }

        public int co_no { get; set; }
        public String fina_acco_code { get; set; }
        public String fina_acco_name { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("fina_acco_code", 'S', fina_acco_code);
            packer.AddField("fina_acco_name", 'S', fina_acco_name);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FINA_ACCO_CODE_STR,fina_acco_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FINA_ACCO_NAME_STR,fina_acco_name);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class evaL_1_11_Request : BaseRequest, IRequest<evaL_1_11_Response>
    {
        public evaL_1_11_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "evaL.1.11";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public double pd_begin_share { get; set; }
        public double pd_curr_share { get; set; }
        public String target_pd_code { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("pd_begin_share", 'D', pd_begin_share);
            packer.AddField("pd_curr_share", 'D', pd_curr_share);
            packer.AddField("target_pd_code", 'S', target_pd_code);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_BEGIN_SHARE_FLOAT,pd_begin_share);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_CURR_SHARE_FLOAT,pd_curr_share);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_PD_CODE_STR,target_pd_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class evaL_1_12_Request : BaseRequest, IRequest<evaL_1_12_Response>
    {
        public evaL_1_12_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "evaL.1.12";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public double pd_begin_share { get; set; }
        public double pd_curr_share { get; set; }
        public String target_pd_code { get; set; }
        public String task_status { get; set; }
        public String is_auto_push { get; set; }
        public int is_sync_netvalue { get; set; }
        public int unit_evalu { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("pd_begin_share", 'D', pd_begin_share);
            packer.AddField("pd_curr_share", 'D', pd_curr_share);
            packer.AddField("target_pd_code", 'S', target_pd_code);
            packer.AddField("task_status", 'S', task_status);
            packer.AddField("is_auto_push", 'S', is_auto_push);
            packer.AddField("is_sync_netvalue", 'I', is_sync_netvalue);
            packer.AddField("unit_evalu", 'I', unit_evalu);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_BEGIN_SHARE_FLOAT,pd_begin_share);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_CURR_SHARE_FLOAT,pd_curr_share);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_PD_CODE_STR,target_pd_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STATUS_STR,task_status);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_IS_AUTO_PUSH_STR,is_auto_push);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_SYNC_NETVALUE_INT,is_sync_netvalue);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_EVALU_INT,unit_evalu);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class evaL_1_13_Request : BaseRequest, IRequest<evaL_1_13_Response>
    {
        public evaL_1_13_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "evaL.1.13";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            return fastMsg;
        }
   }

    public class evaL_1_14_Request : BaseRequest, IRequest<evaL_1_14_Response>
    {
        public evaL_1_14_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "evaL.1.14";
            }
        }

        public int co_no { get; set; }
        public String pd_no_str { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no_str", 'S', pd_no_str);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_STR_STR,pd_no_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class evaL_1_15_Request : BaseRequest, IRequest<evaL_1_15_Response>
    {
        public evaL_1_15_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "evaL.1.15";
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

    public class evaL_1_21_Request : BaseRequest, IRequest<evaL_1_21_Response>
    {
        public evaL_1_21_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "evaL.1.21";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int pd_fee_type { get; set; }
        public double pd_fee_rate { get; set; }
        public int pd_fee_circle { get; set; }
        public double min_fee { get; set; }
        public String calc_fee_date_str { get; set; }
        public int eva_calc_type { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("pd_fee_type", 'I', pd_fee_type);
            packer.AddField("pd_fee_rate", 'D', pd_fee_rate);
            packer.AddField("pd_fee_circle", 'I', pd_fee_circle);
            packer.AddField("min_fee", 'D', min_fee);
            packer.AddField("calc_fee_date_str", 'S', calc_fee_date_str);
            packer.AddField("eva_calc_type", 'I', eva_calc_type);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_FEE_TYPE_INT,pd_fee_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_FEE_RATE_FLOAT,pd_fee_rate);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_FEE_CIRCLE_INT,pd_fee_circle);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_FEE_FLOAT,min_fee);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CALC_FEE_DATE_STR_STR,calc_fee_date_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EVA_CALC_TYPE_INT,eva_calc_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class evaL_1_22_Request : BaseRequest, IRequest<evaL_1_22_Response>
    {
        public evaL_1_22_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "evaL.1.22";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int pd_fee_type { get; set; }
        public double pd_fee_rate { get; set; }
        public int pd_fee_circle { get; set; }
        public double min_fee { get; set; }
        public String calc_fee_date_str { get; set; }
        public int eva_calc_type { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("pd_fee_type", 'I', pd_fee_type);
            packer.AddField("pd_fee_rate", 'D', pd_fee_rate);
            packer.AddField("pd_fee_circle", 'I', pd_fee_circle);
            packer.AddField("min_fee", 'D', min_fee);
            packer.AddField("calc_fee_date_str", 'S', calc_fee_date_str);
            packer.AddField("eva_calc_type", 'I', eva_calc_type);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_FEE_TYPE_INT,pd_fee_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_FEE_RATE_FLOAT,pd_fee_rate);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_FEE_CIRCLE_INT,pd_fee_circle);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_FEE_FLOAT,min_fee);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CALC_FEE_DATE_STR_STR,calc_fee_date_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EVA_CALC_TYPE_INT,eva_calc_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class evaL_1_23_Request : BaseRequest, IRequest<evaL_1_23_Response>
    {
        public evaL_1_23_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "evaL.1.23";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int pd_fee_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("pd_fee_type", 'I', pd_fee_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_FEE_TYPE_INT,pd_fee_type);
            return fastMsg;
        }
   }

    public class evaL_1_24_Request : BaseRequest, IRequest<evaL_1_24_Response>
    {
        public evaL_1_24_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "evaL.1.24";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int pd_fee_type { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("pd_fee_type", 'I', pd_fee_type);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_FEE_TYPE_INT,pd_fee_type);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class evaL_1_31_Request : BaseRequest, IRequest<evaL_1_31_Response>
    {
        public evaL_1_31_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "evaL.1.31";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int pd_rate_type { get; set; }
        public String asset_acco { get; set; }
        public double intrst_rate { get; set; }
        public int pd_fee_circle { get; set; }
        public double min_interest { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("pd_rate_type", 'I', pd_rate_type);
            packer.AddField("asset_acco", 'S', asset_acco);
            packer.AddField("intrst_rate", 'D', intrst_rate);
            packer.AddField("pd_fee_circle", 'I', pd_fee_circle);
            packer.AddField("min_interest", 'D', min_interest);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_RATE_TYPE_INT,pd_rate_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STR,asset_acco);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_RATE_FLOAT,intrst_rate);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_FEE_CIRCLE_INT,pd_fee_circle);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_INTEREST_FLOAT,min_interest);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class evaL_1_32_Request : BaseRequest, IRequest<evaL_1_32_Response>
    {
        public evaL_1_32_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "evaL.1.32";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int pd_rate_type { get; set; }
        public String asset_acco { get; set; }
        public double intrst_rate { get; set; }
        public int pd_fee_circle { get; set; }
        public double min_interest { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("pd_rate_type", 'I', pd_rate_type);
            packer.AddField("asset_acco", 'S', asset_acco);
            packer.AddField("intrst_rate", 'D', intrst_rate);
            packer.AddField("pd_fee_circle", 'I', pd_fee_circle);
            packer.AddField("min_interest", 'D', min_interest);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_RATE_TYPE_INT,pd_rate_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STR,asset_acco);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_RATE_FLOAT,intrst_rate);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_FEE_CIRCLE_INT,pd_fee_circle);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_INTEREST_FLOAT,min_interest);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class evaL_1_33_Request : BaseRequest, IRequest<evaL_1_33_Response>
    {
        public evaL_1_33_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "evaL.1.33";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int pd_rate_type { get; set; }
        public String asset_acco { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("pd_rate_type", 'I', pd_rate_type);
            packer.AddField("asset_acco", 'S', asset_acco);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_RATE_TYPE_INT,pd_rate_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STR,asset_acco);
            return fastMsg;
        }
   }

    public class evaL_1_34_Request : BaseRequest, IRequest<evaL_1_34_Response>
    {
        public evaL_1_34_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "evaL.1.34";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int pd_rate_type { get; set; }
        public String asset_acco { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("pd_rate_type", 'I', pd_rate_type);
            packer.AddField("asset_acco", 'S', asset_acco);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_RATE_TYPE_INT,pd_rate_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STR,asset_acco);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class evaL_1_41_Request : BaseRequest, IRequest<evaL_1_41_Response>
    {
        public evaL_1_41_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "evaL.1.41";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public double pd_curr_share { get; set; }
        public double pd_manage_fee { get; set; }
        public int manage_fee_circle { get; set; }
        public double pd_trustee_fee { get; set; }
        public int trustee_fee_circle { get; set; }
        public double pd_cons_fee { get; set; }
        public int cons_fee_circle { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("pd_curr_share", 'D', pd_curr_share);
            packer.AddField("pd_manage_fee", 'D', pd_manage_fee);
            packer.AddField("manage_fee_circle", 'I', manage_fee_circle);
            packer.AddField("pd_trustee_fee", 'D', pd_trustee_fee);
            packer.AddField("trustee_fee_circle", 'I', trustee_fee_circle);
            packer.AddField("pd_cons_fee", 'D', pd_cons_fee);
            packer.AddField("cons_fee_circle", 'I', cons_fee_circle);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_CURR_SHARE_FLOAT,pd_curr_share);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_MANAGE_FEE_FLOAT,pd_manage_fee);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MANAGE_FEE_CIRCLE_INT,manage_fee_circle);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_TRUSTEE_FEE_FLOAT,pd_trustee_fee);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRUSTEE_FEE_CIRCLE_INT,trustee_fee_circle);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_CONS_FEE_FLOAT,pd_cons_fee);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONS_FEE_CIRCLE_INT,cons_fee_circle);
            return fastMsg;
        }
   }

    public class evaL_1_42_Request : BaseRequest, IRequest<evaL_1_42_Response>
    {
        public evaL_1_42_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "evaL.1.42";
            }
        }

        public int init_date { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int share_oper { get; set; }
        public double occur_share { get; set; }
        public double occur_amt { get; set; }
        public int arrive_date { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("init_date", 'I', init_date);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("share_oper", 'I', share_oper);
            packer.AddField("occur_share", 'D', occur_share);
            packer.AddField("occur_amt", 'D', occur_amt);
            packer.AddField("arrive_date", 'I', arrive_date);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SHARE_OPER_INT,share_oper);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_SHARE_FLOAT,occur_share);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_AMT_FLOAT,occur_amt);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ARRIVE_DATE_INT,arrive_date);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class evaL_1_43_Request : BaseRequest, IRequest<evaL_1_43_Response>
    {
        public evaL_1_43_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "evaL.1.43";
            }
        }

        public ulong row_id { get; set; }
        public int init_date { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int share_oper { get; set; }
        public double occur_share { get; set; }
        public double occur_amt { get; set; }
        public int arrive_date { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("init_date", 'I', init_date);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("share_oper", 'I', share_oper);
            packer.AddField("occur_share", 'D', occur_share);
            packer.AddField("occur_amt", 'D', occur_amt);
            packer.AddField("arrive_date", 'I', arrive_date);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SHARE_OPER_INT,share_oper);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_SHARE_FLOAT,occur_share);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_AMT_FLOAT,occur_amt);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ARRIVE_DATE_INT,arrive_date);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class evaL_1_44_Request : BaseRequest, IRequest<evaL_1_44_Response>
    {
        public evaL_1_44_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "evaL.1.44";
            }
        }

        public ulong row_id { get; set; }
        public int init_date { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int share_oper { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("init_date", 'I', init_date);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("share_oper", 'I', share_oper);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SHARE_OPER_INT,share_oper);
            return fastMsg;
        }
   }

    public class evaL_1_45_Request : BaseRequest, IRequest<evaL_1_45_Response>
    {
        public evaL_1_45_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "evaL.1.45";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int begin_date { get; set; }
        public int end_date { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT,end_date);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class evaL_1_51_Request : BaseRequest, IRequest<evaL_1_51_Response>
    {
        public evaL_1_51_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "evaL.1.51";
            }
        }

        public int init_date { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int divide_type { get; set; }
        public double pd_curr_share { get; set; }
        public double divi_amt { get; set; }
        public double unit_divi_amt { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("init_date", 'I', init_date);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("divide_type", 'I', divide_type);
            packer.AddField("pd_curr_share", 'D', pd_curr_share);
            packer.AddField("divi_amt", 'D', divi_amt);
            packer.AddField("unit_divi_amt", 'D', unit_divi_amt);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DIVIDE_TYPE_INT,divide_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_CURR_SHARE_FLOAT,pd_curr_share);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DIVI_AMT_FLOAT,divi_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_DIVI_AMT_FLOAT,unit_divi_amt);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class evaL_1_52_Request : BaseRequest, IRequest<evaL_1_52_Response>
    {
        public evaL_1_52_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "evaL.1.52";
            }
        }

        public ulong row_id { get; set; }
        public int init_date { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int divide_type { get; set; }
        public double pd_curr_share { get; set; }
        public double divi_amt { get; set; }
        public double unit_divi_amt { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("init_date", 'I', init_date);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("divide_type", 'I', divide_type);
            packer.AddField("pd_curr_share", 'D', pd_curr_share);
            packer.AddField("divi_amt", 'D', divi_amt);
            packer.AddField("unit_divi_amt", 'D', unit_divi_amt);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DIVIDE_TYPE_INT,divide_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_CURR_SHARE_FLOAT,pd_curr_share);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DIVI_AMT_FLOAT,divi_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_DIVI_AMT_FLOAT,unit_divi_amt);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class evaL_1_53_Request : BaseRequest, IRequest<evaL_1_53_Response>
    {
        public evaL_1_53_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "evaL.1.53";
            }
        }

        public ulong row_id { get; set; }
        public int init_date { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int divide_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("init_date", 'I', init_date);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("divide_type", 'I', divide_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DIVIDE_TYPE_INT,divide_type);
            return fastMsg;
        }
   }

    public class evaL_1_54_Request : BaseRequest, IRequest<evaL_1_54_Response>
    {
        public evaL_1_54_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "evaL.1.54";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int divide_type { get; set; }
        public int begin_date { get; set; }
        public int end_date { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("divide_type", 'I', divide_type);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DIVIDE_TYPE_INT,divide_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT,end_date);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class evaL_1_55_Request : BaseRequest, IRequest<evaL_1_55_Response>
    {
        public evaL_1_55_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "evaL.1.55";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public double vat_rate { get; set; }
        public double vat_add_rate { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("vat_rate", 'D', vat_rate);
            packer.AddField("vat_add_rate", 'D', vat_add_rate);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VAT_RATE_FLOAT,vat_rate);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VAT_ADD_RATE_FLOAT,vat_add_rate);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class evaL_1_56_Request : BaseRequest, IRequest<evaL_1_56_Response>
    {
        public evaL_1_56_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "evaL.1.56";
            }
        }

        public ulong row_id { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public double vat_rate { get; set; }
        public double vat_add_rate { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("vat_rate", 'D', vat_rate);
            packer.AddField("vat_add_rate", 'D', vat_add_rate);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VAT_RATE_FLOAT,vat_rate);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VAT_ADD_RATE_FLOAT,vat_add_rate);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class evaL_1_57_Request : BaseRequest, IRequest<evaL_1_57_Response>
    {
        public evaL_1_57_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "evaL.1.57";
            }
        }

        public ulong row_id { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            return fastMsg;
        }
   }

    public class evaL_1_58_Request : BaseRequest, IRequest<evaL_1_58_Response>
    {
        public evaL_1_58_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "evaL.1.58";
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

}
