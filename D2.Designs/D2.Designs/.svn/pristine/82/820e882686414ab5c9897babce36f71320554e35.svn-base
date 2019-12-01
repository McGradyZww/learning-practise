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
    public class pubL_41_1_Request : BaseRequest, IRequest<pubL_41_1_Response>
    {
        public pubL_41_1_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.41.1";
            }
        }

        public int cust_birth { get; set; }
        public int all_strike_cnt { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("cust_birth", 'I', cust_birth);
            packer.AddField("all_strike_cnt", 'I', all_strike_cnt);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CUST_BIRTH_INT,cust_birth);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ALL_STRIKE_CNT_INT,all_strike_cnt);
            return fastMsg;
        }
   }

    public class pubL_41_2_Request : BaseRequest, IRequest<pubL_41_2_Response>
    {
        public pubL_41_2_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.41.2";
            }
        }

        public int all_strike_cnt { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("all_strike_cnt", 'I', all_strike_cnt);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ALL_STRIKE_CNT_INT,all_strike_cnt);
            return fastMsg;
        }
   }

    public class pubL_41_3_Request : BaseRequest, IRequest<pubL_41_3_Response>
    {
        public pubL_41_3_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.41.3";
            }
        }

        public int cust_birth { get; set; }
        public int all_strike_cnt { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("cust_birth", 'I', cust_birth);
            packer.AddField("all_strike_cnt", 'I', all_strike_cnt);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CUST_BIRTH_INT,cust_birth);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ALL_STRIKE_CNT_INT,all_strike_cnt);
            return fastMsg;
        }
   }

    public class pubL_41_4_Request : BaseRequest, IRequest<pubL_41_4_Response>
    {
        public pubL_41_4_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.41.4";
            }
        }

        public int all_strike_cnt { get; set; }
        public int row_count { get; set; }
        public int cust_birth { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("all_strike_cnt", 'I', all_strike_cnt);
            packer.AddField("row_count", 'I', row_count);
            packer.AddField("cust_birth", 'I', cust_birth);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ALL_STRIKE_CNT_INT,all_strike_cnt);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CUST_BIRTH_INT,cust_birth);
            return fastMsg;
        }
   }

}
