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
    public class pdfutuL_7_1_Response : IResponse
    {
        #region 构造函数
        public pdfutuL_7_1_Response()
        {
            this.pdfutuL_7_1_InfoList = new ObservableCollection<pdfutuL_7_1_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfutuL_7_1_Info> pdfutuL_7_1_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfutuL_7_1_Info info = new pdfutuL_7_1_Info();
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.futu_acco_no = unpacker.GetInt("futu_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.futu_acco = unpacker.GetStr("futu_acco");
            info.futu_acco_name = unpacker.GetStr("futu_acco_name");
            info.futu_acco_status = unpacker.GetStr("futu_acco_status");
            pdfutuL_7_1_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfutuL_7_1_InfoList.Add((pdfutuL_7_1_Info)info);
        }
        #endregion

        //逻辑_产品期货_账户运维_查询全部期货账户
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdfutuL_7_1_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.futu_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.futu_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_STR);
                    info.futu_acco_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NAME_STR);
                    info.futu_acco_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_STATUS_STR);
                    pdfutuL_7_1_InfoList.Add(info);
                }
            }
        }
    }

    public class pdfutuL_7_11_Response : IResponse
    {
        #region 构造函数
        public pdfutuL_7_11_Response()
        {
            this.pdfutuL_7_11_InfoList = new ObservableCollection<pdfutuL_7_11_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfutuL_7_11_Info> pdfutuL_7_11_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfutuL_7_11_Info info = new pdfutuL_7_11_Info();
            pdfutuL_7_11_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfutuL_7_11_InfoList.Add((pdfutuL_7_11_Info)info);
        }
        #endregion

        //逻辑_产品期货_账户运维_归档产品期货数据
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfutuL_7_11_Info();
                pdfutuL_7_11_InfoList.Add(info);
            }
        }
    }

    public class pdfutuL_7_2_Response : IResponse
    {
        #region 构造函数
        public pdfutuL_7_2_Response()
        {
            this.pdfutuL_7_2_InfoList = new ObservableCollection<pdfutuL_7_2_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfutuL_7_2_Info> pdfutuL_7_2_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfutuL_7_2_Info info = new pdfutuL_7_2_Info();
            info.futu_acco_no = unpacker.GetInt("futu_acco_no");
            pdfutuL_7_2_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfutuL_7_2_InfoList.Add((pdfutuL_7_2_Info)info);
        }
        #endregion

        //逻辑_产品期货_账户运维_新增期货账户信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfutuL_7_2_Info();
                info.futu_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT);
                pdfutuL_7_2_InfoList.Add(info);
            }
        }
    }

    public class pdfutuL_7_3_Response : IResponse
    {
        #region 构造函数
        public pdfutuL_7_3_Response()
        {
            this.pdfutuL_7_3_InfoList = new ObservableCollection<pdfutuL_7_3_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfutuL_7_3_Info> pdfutuL_7_3_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfutuL_7_3_Info info = new pdfutuL_7_3_Info();
            pdfutuL_7_3_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfutuL_7_3_InfoList.Add((pdfutuL_7_3_Info)info);
        }
        #endregion

        //逻辑_产品期货_账户运维_修改期货账户信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfutuL_7_3_Info();
                pdfutuL_7_3_InfoList.Add(info);
            }
        }
    }

    public class pdfutuL_7_4_Response : IResponse
    {
        #region 构造函数
        public pdfutuL_7_4_Response()
        {
            this.pdfutuL_7_4_InfoList = new ObservableCollection<pdfutuL_7_4_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfutuL_7_4_Info> pdfutuL_7_4_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfutuL_7_4_Info info = new pdfutuL_7_4_Info();
            pdfutuL_7_4_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfutuL_7_4_InfoList.Add((pdfutuL_7_4_Info)info);
        }
        #endregion

        //逻辑_产品期货_账户运维_删除期货账户信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfutuL_7_4_Info();
                pdfutuL_7_4_InfoList.Add(info);
            }
        }
    }

    public class pdfutuL_7_5_Response : IResponse
    {
        #region 构造函数
        public pdfutuL_7_5_Response()
        {
            this.pdfutuL_7_5_InfoList = new ObservableCollection<pdfutuL_7_5_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfutuL_7_5_Info> pdfutuL_7_5_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfutuL_7_5_Info info = new pdfutuL_7_5_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.update_date = unpacker.GetInt("update_date");
            info.update_time = unpacker.GetInt("update_time");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.futu_acco_no = unpacker.GetInt("futu_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.futu_acco = unpacker.GetStr("futu_acco");
            info.futu_acco_name = unpacker.GetStr("futu_acco_name");
            info.futu_acco_status = unpacker.GetStr("futu_acco_status");
            info.hedge_type = unpacker.GetInt("hedge_type");
            info.allow_contrc_type = unpacker.GetStr("allow_contrc_type");
            info.remark_info = unpacker.GetStr("remark_info");
            pdfutuL_7_5_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfutuL_7_5_InfoList.Add((pdfutuL_7_5_Info)info);
        }
        #endregion

        //逻辑_产品期货_账户运维_查询期货账户信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdfutuL_7_5_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    info.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.futu_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.futu_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_STR);
                    info.futu_acco_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NAME_STR);
                    info.futu_acco_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_STATUS_STR);
                    info.hedge_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT);
                    info.allow_contrc_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_CONTRC_TYPE_STR);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    pdfutuL_7_5_InfoList.Add(info);
                }
            }
        }
    }

    public class pdfutuL_7_6_Response : IResponse
    {
        #region 构造函数
        public pdfutuL_7_6_Response()
        {
            this.pdfutuL_7_6_InfoList = new ObservableCollection<pdfutuL_7_6_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfutuL_7_6_Info> pdfutuL_7_6_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfutuL_7_6_Info info = new pdfutuL_7_6_Info();
            pdfutuL_7_6_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfutuL_7_6_InfoList.Add((pdfutuL_7_6_Info)info);
        }
        #endregion

        //逻辑_产品期货_账户运维_冻结期货账户
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfutuL_7_6_Info();
                pdfutuL_7_6_InfoList.Add(info);
            }
        }
    }

    public class pdfutuL_7_7_Response : IResponse
    {
        #region 构造函数
        public pdfutuL_7_7_Response()
        {
            this.pdfutuL_7_7_InfoList = new ObservableCollection<pdfutuL_7_7_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfutuL_7_7_Info> pdfutuL_7_7_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfutuL_7_7_Info info = new pdfutuL_7_7_Info();
            pdfutuL_7_7_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfutuL_7_7_InfoList.Add((pdfutuL_7_7_Info)info);
        }
        #endregion

        //逻辑_产品期货_账户运维_恢复期货账户
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfutuL_7_7_Info();
                pdfutuL_7_7_InfoList.Add(info);
            }
        }
    }

    public class pdfutuL_7_8_Response : IResponse
    {
        #region 构造函数
        public pdfutuL_7_8_Response()
        {
            this.pdfutuL_7_8_InfoList = new ObservableCollection<pdfutuL_7_8_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfutuL_7_8_Info> pdfutuL_7_8_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfutuL_7_8_Info info = new pdfutuL_7_8_Info();
            pdfutuL_7_8_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfutuL_7_8_InfoList.Add((pdfutuL_7_8_Info)info);
        }
        #endregion

        //逻辑_产品期货_账户运维_注销期货账户
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfutuL_7_8_Info();
                pdfutuL_7_8_InfoList.Add(info);
            }
        }
    }

}
