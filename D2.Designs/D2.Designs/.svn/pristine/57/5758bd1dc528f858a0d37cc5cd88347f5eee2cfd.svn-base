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
    public class clsecuL_1_21_Request : BaseRequest, IRequest<clsecuL_1_21_Response>
    {
        public clsecuL_1_21_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "clsecuL.1.21";
            }
        }

        public int init_date { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("init_date", 'I', init_date);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            return fastMsg;
        }
   }

    public class clsecuL_1_41_Request : BaseRequest, IRequest<clsecuL_1_41_Response>
    {
        public clsecuL_1_41_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "clsecuL.1.41";
            }
        }

        public int sett_redo_type { get; set; }
        public int clear_date { get; set; }
        public ulong clear_deal_id { get; set; }
        public int sett_date { get; set; }
        public ulong sett_deal_id { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("sett_redo_type", 'I', sett_redo_type);
            packer.AddField("clear_date", 'I', clear_date);
            packer.AddField("clear_deal_id", 'L', clear_deal_id);
            packer.AddField("sett_date", 'I', sett_date);
            packer.AddField("sett_deal_id", 'L', sett_deal_id);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SETT_REDO_TYPE_INT,sett_redo_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLEAR_DATE_INT,clear_date);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_CLEAR_DEAL_ID_INT64,clear_deal_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SETT_DATE_INT,sett_date);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_SETT_DEAL_ID_INT64,sett_deal_id);
            return fastMsg;
        }
   }

    public class clsecuL_1_42_Request : BaseRequest, IRequest<clsecuL_1_42_Response>
    {
        public clsecuL_1_42_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "clsecuL.1.42";
            }
        }

        public int sett_flow_step { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("sett_flow_step", 'I', sett_flow_step);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SETT_FLOW_STEP_INT,sett_flow_step);
            return fastMsg;
        }
   }

    public class clsecuL_1_43_Request : BaseRequest, IRequest<clsecuL_1_43_Response>
    {
        public clsecuL_1_43_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "clsecuL.1.43";
            }
        }

        public int init_date { get; set; }
        public int sett_flow_step { get; set; }
        public int exch_no { get; set; }
        public ulong row_id { get; set; }
        public int row_count { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("init_date", 'I', init_date);
            packer.AddField("sett_flow_step", 'I', sett_flow_step);
            packer.AddField("exch_no", 'I', exch_no);
            packer.AddField("row_id", 'L', row_id);
            packer.AddField("row_count", 'I', row_count);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SETT_FLOW_STEP_INT,sett_flow_step);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            return fastMsg;
        }
   }

    public class clsecuL_1_44_Request : BaseRequest, IRequest<clsecuL_1_44_Response>
    {
        public clsecuL_1_44_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "clsecuL.1.44";
            }
        }

        public int init_date { get; set; }
        public int sett_flow_step { get; set; }
        public int exch_no { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("init_date", 'I', init_date);
            packer.AddField("sett_flow_step", 'I', sett_flow_step);
            packer.AddField("exch_no", 'I', exch_no);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT,init_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SETT_FLOW_STEP_INT,sett_flow_step);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            return fastMsg;
        }
   }

    public class clsecuL_1_51_Request : BaseRequest, IRequest<clsecuL_1_51_Response>
    {
        public clsecuL_1_51_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "clsecuL.1.51";
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
