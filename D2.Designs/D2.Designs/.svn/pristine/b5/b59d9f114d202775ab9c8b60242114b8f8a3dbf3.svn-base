using LdNet.ClientSdk.Model;
using LdNet.ClientCore.Sdk;
using LdNet.Communication;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using LDsdkDefineEx;

namespace LdNet.ClientSdk.Response
{
    public class clfutuL_1_21_Response : IResponse
    {
        #region 构造函数
        public clfutuL_1_21_Response()
        {
            this.clfutuL_1_21_InfoList = new ObservableCollection<clfutuL_1_21_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clfutuL_1_21_Info> clfutuL_1_21_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clfutuL_1_21_Info info = new clfutuL_1_21_Info();
            clfutuL_1_21_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clfutuL_1_21_InfoList.Add((clfutuL_1_21_Info)info);
        }
        #endregion

        //逻辑_清算期货_公用_数据归历史
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new clfutuL_1_21_Info();
                clfutuL_1_21_InfoList.Add(info);
            }
        }
    }

}
