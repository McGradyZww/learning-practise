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
    public class tdsecuL_6_1_Request : BaseRequest, IRequest<tdsecuL_6_1_Response>
    {
        public tdsecuL_6_1_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.6.1";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public String stock_code { get; set; }
        public int exch_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("exch_no", 'I', exch_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            return fastMsg;
        }
   }

    public class tdsecuL_6_111_Request : BaseRequest, IRequest<tdsecuL_6_111_Response>
    {
        public tdsecuL_6_111_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.6.111";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public String stock_code { get; set; }
        public int exch_no { get; set; }
        public int begin_date { get; set; }
        public int end_date { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT,end_date);
            return fastMsg;
        }
   }

    public class tdsecuL_6_2_Request : BaseRequest, IRequest<tdsecuL_6_2_Response>
    {
        public tdsecuL_6_2_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.6.2";
            }
        }

        public String opor_no_str { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public String posi_status { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("opor_no_str", 'S', opor_no_str);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("posi_status", 'S', posi_status);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_STR_STR,opor_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_POSI_STATUS_STR,posi_status);
            return fastMsg;
        }
   }

    public class tdsecuL_6_201_Request : BaseRequest, IRequest<tdsecuL_6_201_Response>
    {
        public tdsecuL_6_201_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.6.201";
            }
        }

        public String opor_no_str { get; set; }
        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public String posi_status { get; set; }
        public int begin_date { get; set; }
        public int end_date { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("opor_no_str", 'S', opor_no_str);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("posi_status", 'S', posi_status);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_STR_STR,opor_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_POSI_STATUS_STR,posi_status);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT,end_date);
            return fastMsg;
        }
   }

    public class tdsecuL_6_3_Request : BaseRequest, IRequest<tdsecuL_6_3_Response>
    {
        public tdsecuL_6_3_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.6.3";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            return fastMsg;
        }
   }

    public class tdsecuL_6_4_Request : BaseRequest, IRequest<tdsecuL_6_4_Response>
    {
        public tdsecuL_6_4_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.6.4";
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

    public class tdsecuL_6_5_Request : BaseRequest, IRequest<tdsecuL_6_5_Response>
    {
        public tdsecuL_6_5_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.6.5";
            }
        }

        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public int exch_no { get; set; }
        public int stock_code_no { get; set; }
        public int init_date { get; set; }
        public int query_opor_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("init_date", 'I', init_date);
            packer.AddField("query_opor_no", 'I', query_opor_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_OPOR_NO_INT,query_opor_no);
            return fastMsg;
        }
   }

    public class tdsecuL_6_6_Request : BaseRequest, IRequest<tdsecuL_6_6_Response>
    {
        public tdsecuL_6_6_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.6.6";
            }
        }

        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public int begin_date { get; set; }
        public int end_date { get; set; }
        public int query_opor_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("query_opor_no", 'I', query_opor_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT,end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_OPOR_NO_INT,query_opor_no);
            return fastMsg;
        }
   }

    public class tdsecuL_6_9_Request : BaseRequest, IRequest<tdsecuL_6_9_Response>
    {
        public tdsecuL_6_9_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.6.9";
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

    public class tdsecuL_6_10_Request : BaseRequest, IRequest<tdsecuL_6_10_Response>
    {
        public tdsecuL_6_10_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.6.10";
            }
        }

        public int busi_opor_no { get; set; }
        public String opor_name { get; set; }
        public String target_opor_pwd { get; set; }
        public String conta_addr { get; set; }
        public String phone_number { get; set; }
        public String email { get; set; }
        public double curr_amt { get; set; }
        public double frozen_amt { get; set; }
        public double opor_warn_tshold { get; set; }
        public double opor_stop_tshold { get; set; }
        public int order_limit_time { get; set; }
        public double per_secu_posi_ratio { get; set; }
        public int posi_limit_time { get; set; }
        public double order_ctrl_qty { get; set; }
        public double order_ctrl_amt { get; set; }
        public double stock_warn_ratio { get; set; }
        public double stock_stop_ratio { get; set; }
        public double stock_warn_amt { get; set; }
        public double stock_stop_amt { get; set; }
        public int trig_oper_type { get; set; }
        public int open_close_permission { get; set; }
        public int risk_oper { get; set; }
        public int fee_calc_type { get; set; }
        public int permit_margin_trade { get; set; }
        public double buy_fee_ratio { get; set; }
        public double sell_fee_ratio { get; set; }
        public double buy_min_fee { get; set; }
        public double sell_min_fee { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("busi_opor_no", 'I', busi_opor_no);
            packer.AddField("opor_name", 'S', opor_name);
            packer.AddField("target_opor_pwd", 'S', target_opor_pwd);
            packer.AddField("conta_addr", 'S', conta_addr);
            packer.AddField("phone_number", 'S', phone_number);
            packer.AddField("email", 'S', email);
            packer.AddField("curr_amt", 'D', curr_amt);
            packer.AddField("frozen_amt", 'D', frozen_amt);
            packer.AddField("opor_warn_tshold", 'D', opor_warn_tshold);
            packer.AddField("opor_stop_tshold", 'D', opor_stop_tshold);
            packer.AddField("order_limit_time", 'I', order_limit_time);
            packer.AddField("per_secu_posi_ratio", 'D', per_secu_posi_ratio);
            packer.AddField("posi_limit_time", 'I', posi_limit_time);
            packer.AddField("order_ctrl_qty", 'D', order_ctrl_qty);
            packer.AddField("order_ctrl_amt", 'D', order_ctrl_amt);
            packer.AddField("stock_warn_ratio", 'D', stock_warn_ratio);
            packer.AddField("stock_stop_ratio", 'D', stock_stop_ratio);
            packer.AddField("stock_warn_amt", 'D', stock_warn_amt);
            packer.AddField("stock_stop_amt", 'D', stock_stop_amt);
            packer.AddField("trig_oper_type", 'I', trig_oper_type);
            packer.AddField("open_close_permission", 'I', open_close_permission);
            packer.AddField("risk_oper", 'I', risk_oper);
            packer.AddField("fee_calc_type", 'I', fee_calc_type);
            packer.AddField("permit_margin_trade", 'I', permit_margin_trade);
            packer.AddField("buy_fee_ratio", 'D', buy_fee_ratio);
            packer.AddField("sell_fee_ratio", 'D', sell_fee_ratio);
            packer.AddField("buy_min_fee", 'D', buy_min_fee);
            packer.AddField("sell_min_fee", 'D', sell_min_fee);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT,busi_opor_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NAME_STR,opor_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_OPOR_PWD_STR,target_opor_pwd);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTA_ADDR_STR,conta_addr);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PHONE_NUMBER_STR,phone_number);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EMAIL_STR,email);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_AMT_FLOAT,curr_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_AMT_FLOAT,frozen_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_WARN_TSHOLD_FLOAT,opor_warn_tshold);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_STOP_TSHOLD_FLOAT,opor_stop_tshold);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_LIMIT_TIME_INT,order_limit_time);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PER_SECU_POSI_RATIO_FLOAT,per_secu_posi_ratio);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_POSI_LIMIT_TIME_INT,posi_limit_time);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_CTRL_QTY_FLOAT,order_ctrl_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_CTRL_AMT_FLOAT,order_ctrl_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_WARN_RATIO_FLOAT,stock_warn_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_STOP_RATIO_FLOAT,stock_stop_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_WARN_AMT_FLOAT,stock_warn_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_STOP_AMT_FLOAT,stock_stop_amt);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_OPER_TYPE_INT,trig_oper_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_CLOSE_PERMISSION_INT,open_close_permission);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_OPER_INT,risk_oper);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_CALC_TYPE_INT,fee_calc_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PERMIT_MARGIN_TRADE_INT,permit_margin_trade);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_FEE_RATIO_FLOAT,buy_fee_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_FEE_RATIO_FLOAT,sell_fee_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_MIN_FEE_FLOAT,buy_min_fee);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_MIN_FEE_FLOAT,sell_min_fee);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class tdsecuL_6_101_Request : BaseRequest, IRequest<tdsecuL_6_101_Response>
    {
        public tdsecuL_6_101_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.6.101";
            }
        }

        public int busi_opor_no { get; set; }
        public String opor_name { get; set; }
        public String target_opor_pwd { get; set; }
        public String conta_addr { get; set; }
        public String phone_number { get; set; }
        public String email { get; set; }
        public double curr_amt { get; set; }
        public double frozen_amt { get; set; }
        public double opor_warn_tshold { get; set; }
        public double opor_stop_tshold { get; set; }
        public int order_limit_time { get; set; }
        public double per_secu_posi_ratio { get; set; }
        public int posi_limit_time { get; set; }
        public double order_ctrl_qty { get; set; }
        public double order_ctrl_amt { get; set; }
        public double stock_warn_ratio { get; set; }
        public double stock_stop_ratio { get; set; }
        public double stock_warn_amt { get; set; }
        public double stock_stop_amt { get; set; }
        public int trig_oper_type { get; set; }
        public int open_close_permission { get; set; }
        public int risk_oper { get; set; }
        public int fee_calc_type { get; set; }
        public int permit_margin_trade { get; set; }
        public double buy_fee_ratio { get; set; }
        public double sell_fee_ratio { get; set; }
        public double buy_min_fee { get; set; }
        public double sell_min_fee { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("busi_opor_no", 'I', busi_opor_no);
            packer.AddField("opor_name", 'S', opor_name);
            packer.AddField("target_opor_pwd", 'S', target_opor_pwd);
            packer.AddField("conta_addr", 'S', conta_addr);
            packer.AddField("phone_number", 'S', phone_number);
            packer.AddField("email", 'S', email);
            packer.AddField("curr_amt", 'D', curr_amt);
            packer.AddField("frozen_amt", 'D', frozen_amt);
            packer.AddField("opor_warn_tshold", 'D', opor_warn_tshold);
            packer.AddField("opor_stop_tshold", 'D', opor_stop_tshold);
            packer.AddField("order_limit_time", 'I', order_limit_time);
            packer.AddField("per_secu_posi_ratio", 'D', per_secu_posi_ratio);
            packer.AddField("posi_limit_time", 'I', posi_limit_time);
            packer.AddField("order_ctrl_qty", 'D', order_ctrl_qty);
            packer.AddField("order_ctrl_amt", 'D', order_ctrl_amt);
            packer.AddField("stock_warn_ratio", 'D', stock_warn_ratio);
            packer.AddField("stock_stop_ratio", 'D', stock_stop_ratio);
            packer.AddField("stock_warn_amt", 'D', stock_warn_amt);
            packer.AddField("stock_stop_amt", 'D', stock_stop_amt);
            packer.AddField("trig_oper_type", 'I', trig_oper_type);
            packer.AddField("open_close_permission", 'I', open_close_permission);
            packer.AddField("risk_oper", 'I', risk_oper);
            packer.AddField("fee_calc_type", 'I', fee_calc_type);
            packer.AddField("permit_margin_trade", 'I', permit_margin_trade);
            packer.AddField("buy_fee_ratio", 'D', buy_fee_ratio);
            packer.AddField("sell_fee_ratio", 'D', sell_fee_ratio);
            packer.AddField("buy_min_fee", 'D', buy_min_fee);
            packer.AddField("sell_min_fee", 'D', sell_min_fee);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT,busi_opor_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NAME_STR,opor_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_OPOR_PWD_STR,target_opor_pwd);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTA_ADDR_STR,conta_addr);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PHONE_NUMBER_STR,phone_number);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EMAIL_STR,email);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_AMT_FLOAT,curr_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_AMT_FLOAT,frozen_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_WARN_TSHOLD_FLOAT,opor_warn_tshold);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_STOP_TSHOLD_FLOAT,opor_stop_tshold);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_LIMIT_TIME_INT,order_limit_time);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PER_SECU_POSI_RATIO_FLOAT,per_secu_posi_ratio);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_POSI_LIMIT_TIME_INT,posi_limit_time);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_CTRL_QTY_FLOAT,order_ctrl_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_CTRL_AMT_FLOAT,order_ctrl_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_WARN_RATIO_FLOAT,stock_warn_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_STOP_RATIO_FLOAT,stock_stop_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_WARN_AMT_FLOAT,stock_warn_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_STOP_AMT_FLOAT,stock_stop_amt);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_OPER_TYPE_INT,trig_oper_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_CLOSE_PERMISSION_INT,open_close_permission);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_OPER_INT,risk_oper);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_CALC_TYPE_INT,fee_calc_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PERMIT_MARGIN_TRADE_INT,permit_margin_trade);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_FEE_RATIO_FLOAT,buy_fee_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_FEE_RATIO_FLOAT,sell_fee_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_MIN_FEE_FLOAT,buy_min_fee);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_MIN_FEE_FLOAT,sell_min_fee);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class tdsecuL_6_11_Request : BaseRequest, IRequest<tdsecuL_6_11_Response>
    {
        public tdsecuL_6_11_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.6.11";
            }
        }

        public int query_opor_no { get; set; }
        public int exch_no { get; set; }
        public int stock_code_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("query_opor_no", 'I', query_opor_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code_no", 'I', stock_code_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_OPOR_NO_INT,query_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            return fastMsg;
        }
   }

    public class tdsecuL_6_12_Request : BaseRequest, IRequest<tdsecuL_6_12_Response>
    {
        public tdsecuL_6_12_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.6.12";
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

    public class tdsecuL_6_13_Request : BaseRequest, IRequest<tdsecuL_6_13_Response>
    {
        public tdsecuL_6_13_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.6.13";
            }
        }

        public int query_opor_no { get; set; }
        public int exch_no { get; set; }
        public int stock_code_no { get; set; }
        public int begin_date { get; set; }
        public int end_date { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("query_opor_no", 'I', query_opor_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_OPOR_NO_INT,query_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT,end_date);
            return fastMsg;
        }
   }

    public class tdsecuL_6_14_Request : BaseRequest, IRequest<tdsecuL_6_14_Response>
    {
        public tdsecuL_6_14_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.6.14";
            }
        }

        public int co_no { get; set; }
        public int busi_opor_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public int stock_acco_no { get; set; }
        public String stock_code { get; set; }
        public int exch_no { get; set; }
        public double source_stock_qty { get; set; }
        public double single_limit_qty { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("busi_opor_no", 'I', busi_opor_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("stock_acco_no", 'I', stock_acco_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("source_stock_qty", 'D', source_stock_qty);
            packer.AddField("single_limit_qty", 'D', single_limit_qty);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT,busi_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT,stock_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SOURCE_STOCK_QTY_FLOAT,source_stock_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SINGLE_LIMIT_QTY_FLOAT,single_limit_qty);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class tdsecuL_6_15_Request : BaseRequest, IRequest<tdsecuL_6_15_Response>
    {
        public tdsecuL_6_15_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.6.15";
            }
        }

        public int co_no { get; set; }
        public int query_opor_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public int stock_acco_no { get; set; }
        public String stock_code { get; set; }
        public int exch_no { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public String co_no_str { get; set; }
        public String pd_no_str { get; set; }
        public String exch_group_no_str { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("query_opor_no", 'I', query_opor_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("stock_acco_no", 'I', stock_acco_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
            packer.AddField("co_no_str", 'S', co_no_str);
            packer.AddField("pd_no_str", 'S', pd_no_str);
            packer.AddField("exch_group_no_str", 'S', exch_group_no_str);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_OPOR_NO_INT,query_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT,stock_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_STR_STR,co_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_STR_STR,pd_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_STR_STR,exch_group_no_str);
            return fastMsg;
        }
   }

    public class tdsecuL_6_16_Request : BaseRequest, IRequest<tdsecuL_6_16_Response>
    {
        public tdsecuL_6_16_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.6.16";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public ulong row_id { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("row_id", 'L', row_id);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            return fastMsg;
        }
   }

    public class tdsecuL_6_17_Request : BaseRequest, IRequest<tdsecuL_6_17_Response>
    {
        public tdsecuL_6_17_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.6.17";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public ulong row_id { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("row_id", 'L', row_id);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            return fastMsg;
        }
   }

    public class tdsecuL_6_18_Request : BaseRequest, IRequest<tdsecuL_6_18_Response>
    {
        public tdsecuL_6_18_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.6.18";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public ulong row_id { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("row_id", 'L', row_id);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            return fastMsg;
        }
   }

    public class tdsecuL_6_19_Request : BaseRequest, IRequest<tdsecuL_6_19_Response>
    {
        public tdsecuL_6_19_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.6.19";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public ulong row_id { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("row_id", 'L', row_id);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            return fastMsg;
        }
   }

    public class tdsecuL_6_20_Request : BaseRequest, IRequest<tdsecuL_6_20_Response>
    {
        public tdsecuL_6_20_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.6.20";
            }
        }

        public int query_opor_no { get; set; }
        public ulong config_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("query_opor_no", 'I', query_opor_no);
            packer.AddField("config_no", 'L', config_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_OPOR_NO_INT,query_opor_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_NO_INT64,config_no);
            return fastMsg;
        }
   }

    public class tdsecuL_6_21_Request : BaseRequest, IRequest<tdsecuL_6_21_Response>
    {
        public tdsecuL_6_21_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.6.21";
            }
        }

        public int busi_opor_no { get; set; }
        public ulong config_no { get; set; }
        public String config_value { get; set; }
        public String config_name { get; set; }
        public String config_memo { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("busi_opor_no", 'I', busi_opor_no);
            packer.AddField("config_no", 'L', config_no);
            packer.AddField("config_value", 'S', config_value);
            packer.AddField("config_name", 'S', config_name);
            packer.AddField("config_memo", 'S', config_memo);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT,busi_opor_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_NO_INT64,config_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_VALUE_STR,config_value);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_NAME_STR,config_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_MEMO_STR,config_memo);
            return fastMsg;
        }
   }

    public class tdsecuL_6_22_Request : BaseRequest, IRequest<tdsecuL_6_22_Response>
    {
        public tdsecuL_6_22_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.6.22";
            }
        }

        public int busi_opor_no { get; set; }
        public ulong config_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("busi_opor_no", 'I', busi_opor_no);
            packer.AddField("config_no", 'L', config_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT,busi_opor_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_NO_INT64,config_no);
            return fastMsg;
        }
   }

    public class tdsecuL_6_23_Request : BaseRequest, IRequest<tdsecuL_6_23_Response>
    {
        public tdsecuL_6_23_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.6.23";
            }
        }

        public int co_no { get; set; }
        public int busi_opor_no { get; set; }
        public String pd_no_str { get; set; }
        public String exch_group_no_str { get; set; }
        public String asset_acco_no_str { get; set; }
        public String stock_acco_no_str { get; set; }
        public String stock_code_str { get; set; }
        public String exch_no_str { get; set; }
        public String source_stock_qty_str { get; set; }
        public String single_limit_qty_str { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("busi_opor_no", 'I', busi_opor_no);
            packer.AddField("pd_no_str", 'S', pd_no_str);
            packer.AddField("exch_group_no_str", 'S', exch_group_no_str);
            packer.AddField("asset_acco_no_str", 'S', asset_acco_no_str);
            packer.AddField("stock_acco_no_str", 'S', stock_acco_no_str);
            packer.AddField("stock_code_str", 'S', stock_code_str);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("source_stock_qty_str", 'S', source_stock_qty_str);
            packer.AddField("single_limit_qty_str", 'S', single_limit_qty_str);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT,busi_opor_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_STR_STR,pd_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_STR_STR,exch_group_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_STR_STR,asset_acco_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_STR_STR,stock_acco_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR_STR,stock_code_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_SOURCE_STOCK_QTY_STR_STR,source_stock_qty_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_SINGLE_LIMIT_QTY_STR_STR,single_limit_qty_str);
            return fastMsg;
        }
   }

    public class tdsecuL_6_90_Request : BaseRequest, IRequest<tdsecuL_6_90_Response>
    {
        public tdsecuL_6_90_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.6.90";
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

    public class tdsecuL_6_92_Request : BaseRequest, IRequest<tdsecuL_6_92_Response>
    {
        public tdsecuL_6_92_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.6.92";
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

    public class tdsecuL_6_93_Request : BaseRequest, IRequest<tdsecuL_6_93_Response>
    {
        public tdsecuL_6_93_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.6.93";
            }
        }

        public int busi_opor_no { get; set; }
        public double curr_amt { get; set; }
        public double frozen_amt { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("busi_opor_no", 'I', busi_opor_no);
            packer.AddField("curr_amt", 'D', curr_amt);
            packer.AddField("frozen_amt", 'D', frozen_amt);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT,busi_opor_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_AMT_FLOAT,curr_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_AMT_FLOAT,frozen_amt);
            return fastMsg;
        }
   }

    public class tdsecuL_6_94_Request : BaseRequest, IRequest<tdsecuL_6_94_Response>
    {
        public tdsecuL_6_94_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.6.94";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public int busi_opor_no { get; set; }
        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("busi_opor_no", 'I', busi_opor_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT,busi_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            return fastMsg;
        }
   }

    public class tdsecuL_6_95_Request : BaseRequest, IRequest<tdsecuL_6_95_Response>
    {
        public tdsecuL_6_95_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.6.95";
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

    public class tdsecuL_6_96_Request : BaseRequest, IRequest<tdsecuL_6_96_Response>
    {
        public tdsecuL_6_96_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.6.96";
            }
        }

        public int co_no { get; set; }
        public int busi_opor_no { get; set; }
        public int open_close_permission { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("busi_opor_no", 'I', busi_opor_no);
            packer.AddField("open_close_permission", 'I', open_close_permission);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT,busi_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_CLOSE_PERMISSION_INT,open_close_permission);
            return fastMsg;
        }
   }

    public class tdsecuL_6_97_Request : BaseRequest, IRequest<tdsecuL_6_97_Response>
    {
        public tdsecuL_6_97_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.6.97";
            }
        }

        public ulong row_id { get; set; }
        public int target_opor_no { get; set; }
        public double occur_qty { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("target_opor_no", 'I', target_opor_no);
            packer.AddField("occur_qty", 'D', occur_qty);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_OPOR_NO_INT,target_opor_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_QTY_FLOAT,occur_qty);
            return fastMsg;
        }
   }

    public class tdsecuL_6_98_Request : BaseRequest, IRequest<tdsecuL_6_98_Response>
    {
        public tdsecuL_6_98_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.6.98";
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

    public class tdsecuL_6_99_Request : BaseRequest, IRequest<tdsecuL_6_99_Response>
    {
        public tdsecuL_6_99_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.6.99";
            }
        }

        public int co_no { get; set; }
        public int query_opor_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public int stock_acco_no { get; set; }
        public String stock_code { get; set; }
        public int exch_no { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("query_opor_no", 'I', query_opor_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("stock_acco_no", 'I', stock_acco_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_OPOR_NO_INT,query_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT,stock_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class tdsecuL_6_102_Request : BaseRequest, IRequest<tdsecuL_6_102_Response>
    {
        public tdsecuL_6_102_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.6.102";
            }
        }

        public int co_no { get; set; }
        public int query_opor_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public int stock_acco_no { get; set; }
        public String stock_code { get; set; }
        public int exch_no { get; set; }
        public int begin_date { get; set; }
        public int end_date { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("query_opor_no", 'I', query_opor_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("stock_acco_no", 'I', stock_acco_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("exch_no", 'I', exch_no);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_OPOR_NO_INT,query_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT,stock_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT,end_date);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class tdsecuL_6_30_Request : BaseRequest, IRequest<tdsecuL_6_30_Response>
    {
        public tdsecuL_6_30_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.6.30";
            }
        }

        public ulong row_id { get; set; }
        public double close_posi_price { get; set; }
        public double close_posi_qty { get; set; }
        public int lngsht_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("close_posi_price", 'D', close_posi_price);
            packer.AddField("close_posi_qty", 'D', close_posi_qty);
            packer.AddField("lngsht_type", 'I', lngsht_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_PRICE_FLOAT,close_posi_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_QTY_FLOAT,close_posi_qty);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT,lngsht_type);
            return fastMsg;
        }
   }

    public class tdsecuL_6_31_Request : BaseRequest, IRequest<tdsecuL_6_31_Response>
    {
        public tdsecuL_6_31_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.6.31";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public int busi_opor_no { get; set; }
        public String exch_crncy_type { get; set; }
        public double curr_amt { get; set; }
        public double frozen_amt { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("busi_opor_no", 'I', busi_opor_no);
            packer.AddField("exch_crncy_type", 'S', exch_crncy_type);
            packer.AddField("curr_amt", 'D', curr_amt);
            packer.AddField("frozen_amt", 'D', frozen_amt);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT,busi_opor_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR,exch_crncy_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_AMT_FLOAT,curr_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_AMT_FLOAT,frozen_amt);
            return fastMsg;
        }
   }

    public class tdsecuL_6_32_Request : BaseRequest, IRequest<tdsecuL_6_32_Response>
    {
        public tdsecuL_6_32_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.6.32";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public int busi_opor_no { get; set; }
        public String exch_crncy_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("busi_opor_no", 'I', busi_opor_no);
            packer.AddField("exch_crncy_type", 'S', exch_crncy_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT,busi_opor_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR,exch_crncy_type);
            return fastMsg;
        }
   }

    public class tdsecuL_6_33_Request : BaseRequest, IRequest<tdsecuL_6_33_Response>
    {
        public tdsecuL_6_33_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.6.33";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public int busi_opor_no { get; set; }
        public String exch_crncy_type { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("busi_opor_no", 'I', busi_opor_no);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT,busi_opor_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR,exch_crncy_type);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class tdsecuL_6_34_Request : BaseRequest, IRequest<tdsecuL_6_34_Response>
    {
        public tdsecuL_6_34_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.6.34";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public int query_opor_no { get; set; }
        public int busi_opor_no { get; set; }
        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public int waste_date { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public int sort_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("query_opor_no", 'I', query_opor_no);
            packer.AddField("busi_opor_no", 'I', busi_opor_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("waste_date", 'I', waste_date);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
            packer.AddField("sort_type", 'I', sort_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_OPOR_NO_INT,query_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT,busi_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WASTE_DATE_INT,waste_date);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SORT_TYPE_INT,sort_type);
            return fastMsg;
        }
   }

    public class tdsecuL_6_35_Request : BaseRequest, IRequest<tdsecuL_6_35_Response>
    {
        public tdsecuL_6_35_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.6.35";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public int query_opor_no { get; set; }
        public int busi_opor_no { get; set; }
        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public int waste_date { get; set; }
        public int begin_date { get; set; }
        public int end_date { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public int sort_type { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("query_opor_no", 'I', query_opor_no);
            packer.AddField("busi_opor_no", 'I', busi_opor_no);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("waste_date", 'I', waste_date);
            packer.AddField("begin_date", 'I', begin_date);
            packer.AddField("end_date", 'I', end_date);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
            packer.AddField("sort_type", 'I', sort_type);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_OPOR_NO_INT,query_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT,busi_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WASTE_DATE_INT,waste_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT,end_date);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SORT_TYPE_INT,sort_type);
            return fastMsg;
        }
   }

    public class tdsecuL_6_36_Request : BaseRequest, IRequest<tdsecuL_6_36_Response>
    {
        public tdsecuL_6_36_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.6.36";
            }
        }

        public int busi_opor_no { get; set; }
        public double max_posi_market_value { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("busi_opor_no", 'I', busi_opor_no);
            packer.AddField("max_posi_market_value", 'D', max_posi_market_value);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT,busi_opor_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_POSI_MARKET_VALUE_FLOAT,max_posi_market_value);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

    public class tdsecuL_6_37_Request : BaseRequest, IRequest<tdsecuL_6_37_Response>
    {
        public tdsecuL_6_37_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.6.37";
            }
        }

        public ulong row_id { get; set; }
        public int busi_opor_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("busi_opor_no", 'I', busi_opor_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT,busi_opor_no);
            return fastMsg;
        }
   }

    public class tdsecuL_6_38_Request : BaseRequest, IRequest<tdsecuL_6_38_Response>
    {
        public tdsecuL_6_38_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.6.38";
            }
        }

        public int co_no { get; set; }
        public int busi_opor_no { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("busi_opor_no", 'I', busi_opor_no);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT,busi_opor_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class tdsecuL_6_110_Request : BaseRequest, IRequest<tdsecuL_6_110_Response>
    {
        public tdsecuL_6_110_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.6.110";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public String stock_code { get; set; }
        public int exch_no { get; set; }
        public int target_co_no { get; set; }
        public int target_opor_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("target_co_no", 'I', target_co_no);
            packer.AddField("target_opor_no", 'I', target_opor_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CO_NO_INT,target_co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_OPOR_NO_INT,target_opor_no);
            return fastMsg;
        }
   }

    public class tdsecuL_6_113_Request : BaseRequest, IRequest<tdsecuL_6_113_Response>
    {
        public tdsecuL_6_113_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.6.113";
            }
        }

        public int co_no { get; set; }
        public int target_opor_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("target_opor_no", 'I', target_opor_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_OPOR_NO_INT,target_opor_no);
            return fastMsg;
        }
   }

    public class tdsecuL_6_112_Request : BaseRequest, IRequest<tdsecuL_6_112_Response>
    {
        public tdsecuL_6_112_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.6.112";
            }
        }

        public int co_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public int busi_opor_no { get; set; }
        public String exch_crncy_type { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public int target_opor_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("busi_opor_no", 'I', busi_opor_no);
            packer.AddField("exch_crncy_type", 'S', exch_crncy_type);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
            packer.AddField("target_opor_no", 'I', target_opor_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT,busi_opor_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR,exch_crncy_type);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_OPOR_NO_INT,target_opor_no);
            return fastMsg;
        }
   }

    public class tdsecuL_6_114_Request : BaseRequest, IRequest<tdsecuL_6_114_Response>
    {
        public tdsecuL_6_114_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.6.114";
            }
        }

        public int target_co_no { get; set; }
        public int target_opor_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("target_co_no", 'I', target_co_no);
            packer.AddField("target_opor_no", 'I', target_opor_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CO_NO_INT,target_co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_OPOR_NO_INT,target_opor_no);
            return fastMsg;
        }
   }

    public class tdsecuL_6_115_Request : BaseRequest, IRequest<tdsecuL_6_115_Response>
    {
        public tdsecuL_6_115_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.6.115";
            }
        }

        public int co_no { get; set; }
        public int busi_opor_no { get; set; }
        public double sum_realize_pandl { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("busi_opor_no", 'I', busi_opor_no);
            packer.AddField("sum_realize_pandl", 'D', sum_realize_pandl);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT,busi_opor_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SUM_REALIZE_PANDL_FLOAT,sum_realize_pandl);
            return fastMsg;
        }
   }

    public class tdsecuL_6_116_Request : BaseRequest, IRequest<tdsecuL_6_116_Response>
    {
        public tdsecuL_6_116_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "tdsecuL.6.116";
            }
        }

        public int co_no { get; set; }
        public int busi_opor_no { get; set; }
        public int pd_no { get; set; }
        public int exch_group_no { get; set; }
        public int asset_acco_no { get; set; }
        public int stock_acco_no { get; set; }
        public int stock_code_no { get; set; }
        public int t0_buy_type { get; set; }
        public String remark_info { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("co_no", 'I', co_no);
            packer.AddField("busi_opor_no", 'I', busi_opor_no);
            packer.AddField("pd_no", 'I', pd_no);
            packer.AddField("exch_group_no", 'I', exch_group_no);
            packer.AddField("asset_acco_no", 'I', asset_acco_no);
            packer.AddField("stock_acco_no", 'I', stock_acco_no);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("t0_buy_type", 'I', t0_buy_type);
            packer.AddField("remark_info", 'S', remark_info);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT,busi_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT,stock_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_T0_BUY_TYPE_INT,t0_buy_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR,remark_info);
            return fastMsg;
        }
   }

}
