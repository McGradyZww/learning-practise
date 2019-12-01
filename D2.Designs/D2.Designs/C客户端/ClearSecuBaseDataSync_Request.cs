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
    public class clsecuL_4_101_Request : BaseRequest, IRequest<clsecuL_4_101_Response>
    {
        public clsecuL_4_101_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "clsecuL.4.101";
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

    public class clsecuL_4_102_Request : BaseRequest, IRequest<clsecuL_4_102_Response>
    {
        public clsecuL_4_102_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "clsecuL.4.102";
            }
        }

        public int exch_no { get; set; }
        public String stock_code { get; set; }
        public int stock_code_no { get; set; }
        public int stock_type { get; set; }
        public int asset_type { get; set; }
        public String crncy_type { get; set; }
        public double par_value { get; set; }
        public int divi_cacl_num { get; set; }
        public double divi_amt { get; set; }
        public double divi_qty { get; set; }
        public double equity_trans_qty { get; set; }
        public double rights_issue_qty { get; set; }
        public double placement_price { get; set; }
        public int notice_date { get; set; }
        public int reg_date { get; set; }
        public int ex_date { get; set; }
        public int arrive_date { get; set; }
        public int begin_trade_date { get; set; }
        public int deal_flag { get; set; }
        public int busi_flag { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("stock_code", 'S', stock_code);
            packer.AddField("stock_code_no", 'I', stock_code_no);
            packer.AddField("stock_type", 'I', stock_type);
            packer.AddField("asset_type", 'I', asset_type);
            packer.AddField("crncy_type", 'S', crncy_type);
            packer.AddField("par_value", 'D', par_value);
            packer.AddField("divi_cacl_num", 'I', divi_cacl_num);
            packer.AddField("divi_amt", 'D', divi_amt);
            packer.AddField("divi_qty", 'D', divi_qty);
            packer.AddField("equity_trans_qty", 'D', equity_trans_qty);
            packer.AddField("rights_issue_qty", 'D', rights_issue_qty);
            packer.AddField("placement_price", 'D', placement_price);
            packer.AddField("notice_date", 'I', notice_date);
            packer.AddField("reg_date", 'I', reg_date);
            packer.AddField("ex_date", 'I', ex_date);
            packer.AddField("arrive_date", 'I', arrive_date);
            packer.AddField("begin_trade_date", 'I', begin_trade_date);
            packer.AddField("deal_flag", 'I', deal_flag);
            packer.AddField("busi_flag", 'I', busi_flag);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT,stock_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT,asset_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_FLOAT,par_value);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DIVI_CACL_NUM_INT,divi_cacl_num);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DIVI_AMT_FLOAT,divi_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DIVI_QTY_FLOAT,divi_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_EQUITY_TRANS_QTY_FLOAT,equity_trans_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RIGHTS_ISSUE_QTY_FLOAT,rights_issue_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PLACEMENT_PRICE_FLOAT,placement_price);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NOTICE_DATE_INT,notice_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REG_DATE_INT,reg_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EX_DATE_INT,ex_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ARRIVE_DATE_INT,arrive_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TRADE_DATE_INT,begin_trade_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_FLAG_INT,deal_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT,busi_flag);
            return fastMsg;
        }
   }

    public class clsecuL_4_103_Request : BaseRequest, IRequest<clsecuL_4_103_Response>
    {
        public clsecuL_4_103_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "clsecuL.4.103";
            }
        }

        public String exch_no_str { get; set; }
        public String stock_code_str { get; set; }
        public String stock_name_str { get; set; }
        public String divi_amt_str { get; set; }
        public String divi_qty_str { get; set; }
        public String equity_trans_qty_str { get; set; }
        public String notice_date_str { get; set; }
        public String reg_date_str { get; set; }
        public String ex_date_str { get; set; }
        public String arrive_date_str { get; set; }
        public String begin_trade_date_str { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_code_str", 'S', stock_code_str);
            packer.AddField("stock_name_str", 'S', stock_name_str);
            packer.AddField("divi_amt_str", 'S', divi_amt_str);
            packer.AddField("divi_qty_str", 'S', divi_qty_str);
            packer.AddField("equity_trans_qty_str", 'S', equity_trans_qty_str);
            packer.AddField("notice_date_str", 'S', notice_date_str);
            packer.AddField("reg_date_str", 'S', reg_date_str);
            packer.AddField("ex_date_str", 'S', ex_date_str);
            packer.AddField("arrive_date_str", 'S', arrive_date_str);
            packer.AddField("begin_trade_date_str", 'S', begin_trade_date_str);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR_STR,stock_code_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR_STR,stock_name_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_DIVI_AMT_STR_STR,divi_amt_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_DIVI_QTY_STR_STR,divi_qty_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EQUITY_TRANS_QTY_STR_STR,equity_trans_qty_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_NOTICE_DATE_STR_STR,notice_date_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REG_DATE_STR_STR,reg_date_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EX_DATE_STR_STR,ex_date_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ARRIVE_DATE_STR_STR,arrive_date_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TRADE_DATE_STR_STR,begin_trade_date_str);
            return fastMsg;
        }
   }

    public class clsecuL_4_104_Request : BaseRequest, IRequest<clsecuL_4_104_Response>
    {
        public clsecuL_4_104_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "clsecuL.4.104";
            }
        }

        public String exch_no_str { get; set; }
        public String stock_code_str { get; set; }
        public String stock_name_str { get; set; }
        public String redem_start_date_str { get; set; }
        public String redem_pay_price_str { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_code_str", 'S', stock_code_str);
            packer.AddField("stock_name_str", 'S', stock_name_str);
            packer.AddField("redem_start_date_str", 'S', redem_start_date_str);
            packer.AddField("redem_pay_price_str", 'S', redem_pay_price_str);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR_STR,stock_code_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR_STR,stock_name_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REDEM_START_DATE_STR_STR,redem_start_date_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_REDEM_PAY_PRICE_STR_STR,redem_pay_price_str);
            return fastMsg;
        }
   }

    public class clsecuL_4_105_Request : BaseRequest, IRequest<clsecuL_4_105_Response>
    {
        public clsecuL_4_105_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "clsecuL.4.105";
            }
        }

        public String exch_no_str { get; set; }
        public String stock_code_str { get; set; }
        public String stock_name_str { get; set; }
        public String intere_start_date_str { get; set; }
        public String interest_str { get; set; }
        public String interest_taxed_str { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("exch_no_str", 'S', exch_no_str);
            packer.AddField("stock_code_str", 'S', stock_code_str);
            packer.AddField("stock_name_str", 'S', stock_name_str);
            packer.AddField("intere_start_date_str", 'S', intere_start_date_str);
            packer.AddField("interest_str", 'S', interest_str);
            packer.AddField("interest_taxed_str", 'S', interest_taxed_str);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR_STR,stock_code_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR_STR,stock_name_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_INTERE_START_DATE_STR_STR,intere_start_date_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_INTEREST_STR_STR,interest_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_INTEREST_TAXED_STR_STR,interest_taxed_str);
            return fastMsg;
        }
   }

}
