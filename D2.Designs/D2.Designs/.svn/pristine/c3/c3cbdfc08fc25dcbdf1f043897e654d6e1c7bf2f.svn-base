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
    public class pubL_24_1_Request : BaseRequest, IRequest<pubL_24_1_Response>
    {
        public pubL_24_1_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.24.1";
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

    public class pubL_24_2_Request : BaseRequest, IRequest<pubL_24_2_Response>
    {
        public pubL_24_2_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "pubL.24.2";
            }
        }

        public String busi_ctrl_str { get; set; }
        public void InitParams(ILdPacker packer)
        {
            InitCommomParams(packer,FunctionNo);
            packer.AddField("busi_ctrl_str", 'S', busi_ctrl_str);
        }

         public LDFastMessageAdapter CreateFastMessage()
         {
                var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(FunctionNo, 0);
                InitCommomParams(fastMsg,FunctionNo);

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_CTRL_STR_STR,busi_ctrl_str);
            return fastMsg;
        }
   }

}
