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
    public class dcsyncL_5_12_Request : BaseRequest, IRequest<dcsyncL_5_12_Response>
    {
        public dcsyncL_5_12_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "dcsyncL.5.12";
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

    public class dcsyncL_5_13_Request : BaseRequest, IRequest<dcsyncL_5_13_Response>
    {
        public dcsyncL_5_13_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "dcsyncL.5.13";
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

    public class dcsyncL_5_14_Request : BaseRequest, IRequest<dcsyncL_5_14_Response>
    {
        public dcsyncL_5_14_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "dcsyncL.5.14";
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

    public class dcsyncL_5_15_Request : BaseRequest, IRequest<dcsyncL_5_15_Response>
    {
        public dcsyncL_5_15_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "dcsyncL.5.15";
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

    public class dcsyncL_5_16_Request : BaseRequest, IRequest<dcsyncL_5_16_Response>
    {
        public dcsyncL_5_16_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "dcsyncL.5.16";
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

    public class dcsyncL_5_17_Request : BaseRequest, IRequest<dcsyncL_5_17_Response>
    {
        public dcsyncL_5_17_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "dcsyncL.5.17";
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

    public class dcsyncL_5_18_Request : BaseRequest, IRequest<dcsyncL_5_18_Response>
    {
        public dcsyncL_5_18_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "dcsyncL.5.18";
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

    public class dcsyncL_5_19_Request : BaseRequest, IRequest<dcsyncL_5_19_Response>
    {
        public dcsyncL_5_19_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "dcsyncL.5.19";
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

    public class dcsyncL_5_20_Request : BaseRequest, IRequest<dcsyncL_5_20_Response>
    {
        public dcsyncL_5_20_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "dcsyncL.5.20";
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

    public class dcsyncL_5_21_Request : BaseRequest, IRequest<dcsyncL_5_21_Response>
    {
        public dcsyncL_5_21_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "dcsyncL.5.21";
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

    public class dcsyncL_5_22_Request : BaseRequest, IRequest<dcsyncL_5_22_Response>
    {
        public dcsyncL_5_22_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "dcsyncL.5.22";
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

    public class dcsyncL_5_23_Request : BaseRequest, IRequest<dcsyncL_5_23_Response>
    {
        public dcsyncL_5_23_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "dcsyncL.5.23";
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

    public class dcsyncL_5_24_Request : BaseRequest, IRequest<dcsyncL_5_24_Response>
    {
        public dcsyncL_5_24_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "dcsyncL.5.24";
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

    public class dcsyncL_5_25_Request : BaseRequest, IRequest<dcsyncL_5_25_Response>
    {
        public dcsyncL_5_25_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "dcsyncL.5.25";
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

    public class dcsyncL_5_26_Request : BaseRequest, IRequest<dcsyncL_5_26_Response>
    {
        public dcsyncL_5_26_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "dcsyncL.5.26";
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

    public class dcsyncL_5_27_Request : BaseRequest, IRequest<dcsyncL_5_27_Response>
    {
        public dcsyncL_5_27_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "dcsyncL.5.27";
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

    public class dcsyncL_5_28_Request : BaseRequest, IRequest<dcsyncL_5_28_Response>
    {
        public dcsyncL_5_28_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "dcsyncL.5.28";
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

    public class dcsyncL_5_29_Request : BaseRequest, IRequest<dcsyncL_5_29_Response>
    {
        public dcsyncL_5_29_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "dcsyncL.5.29";
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

    public class dcsyncL_5_30_Request : BaseRequest, IRequest<dcsyncL_5_30_Response>
    {
        public dcsyncL_5_30_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "dcsyncL.5.30";
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

    public class dcsyncL_5_31_Request : BaseRequest, IRequest<dcsyncL_5_31_Response>
    {
        public dcsyncL_5_31_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "dcsyncL.5.31";
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

    public class dcsyncL_5_32_Request : BaseRequest, IRequest<dcsyncL_5_32_Response>
    {
        public dcsyncL_5_32_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "dcsyncL.5.32";
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

    public class dcsyncL_5_33_Request : BaseRequest, IRequest<dcsyncL_5_33_Response>
    {
        public dcsyncL_5_33_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "dcsyncL.5.33";
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

    public class dcsyncL_5_34_Request : BaseRequest, IRequest<dcsyncL_5_34_Response>
    {
        public dcsyncL_5_34_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "dcsyncL.5.34";
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

    public class dcsyncL_5_35_Request : BaseRequest, IRequest<dcsyncL_5_35_Response>
    {
        public dcsyncL_5_35_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "dcsyncL.5.35";
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

    public class dcsyncL_5_36_Request : BaseRequest, IRequest<dcsyncL_5_36_Response>
    {
        public dcsyncL_5_36_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "dcsyncL.5.36";
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

    public class dcsyncL_5_37_Request : BaseRequest, IRequest<dcsyncL_5_37_Response>
    {
        public dcsyncL_5_37_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "dcsyncL.5.37";
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

    public class dcsyncL_5_38_Request : BaseRequest, IRequest<dcsyncL_5_38_Response>
    {
        public dcsyncL_5_38_Request(ClientOperator CurrOpeartor) : base(CurrOpeartor)
        {

        }

        public string FunctionNo
        {
            get
            {
                return "dcsyncL.5.38";
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

}
