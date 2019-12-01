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
    public class clsecuL_3_1_Response : IResponse
    {
        #region 构造函数
        public clsecuL_3_1_Response()
        {
            this.clsecuL_3_1_InfoList = new ObservableCollection<clsecuL_3_1_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_3_1_Info> clsecuL_3_1_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_3_1_Info info = new clsecuL_3_1_Info();
            clsecuL_3_1_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_3_1_InfoList.Add((clsecuL_3_1_Info)info);
        }
        #endregion

        //逻辑_清算证券_结算_增加公司行为记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new clsecuL_3_1_Info();
                clsecuL_3_1_InfoList.Add(info);
            }
        }
    }

    public class clsecuL_3_2_Response : IResponse
    {
        #region 构造函数
        public clsecuL_3_2_Response()
        {
            this.clsecuL_3_2_InfoList = new ObservableCollection<clsecuL_3_2_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_3_2_Info> clsecuL_3_2_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_3_2_Info info = new clsecuL_3_2_Info();
            clsecuL_3_2_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_3_2_InfoList.Add((clsecuL_3_2_Info)info);
        }
        #endregion

        //逻辑_清算证券_结算_修改公司行为记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new clsecuL_3_2_Info();
                clsecuL_3_2_InfoList.Add(info);
            }
        }
    }

    public class clsecuL_3_3_Response : IResponse
    {
        #region 构造函数
        public clsecuL_3_3_Response()
        {
            this.clsecuL_3_3_InfoList = new ObservableCollection<clsecuL_3_3_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_3_3_Info> clsecuL_3_3_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_3_3_Info info = new clsecuL_3_3_Info();
            clsecuL_3_3_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_3_3_InfoList.Add((clsecuL_3_3_Info)info);
        }
        #endregion

        //逻辑_清算证券_结算_删除公司行为记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new clsecuL_3_3_Info();
                clsecuL_3_3_InfoList.Add(info);
            }
        }
    }

    public class clsecuL_3_4_Response : IResponse
    {
        #region 构造函数
        public clsecuL_3_4_Response()
        {
            this.clsecuL_3_4_InfoList = new ObservableCollection<clsecuL_3_4_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_3_4_Info> clsecuL_3_4_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_3_4_Info info = new clsecuL_3_4_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_type = unpacker.GetInt("stock_type");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.divi_cacl_num = unpacker.GetInt("divi_cacl_num");
            info.divi_amt = unpacker.GetDouble("divi_amt");
            info.divi_qty = unpacker.GetDouble("divi_qty");
            info.equity_trans_qty = unpacker.GetDouble("equity_trans_qty");
            info.rights_issue_qty = unpacker.GetDouble("rights_issue_qty");
            info.placement_price = unpacker.GetDouble("placement_price");
            info.notice_date = unpacker.GetInt("notice_date");
            info.reg_date = unpacker.GetInt("reg_date");
            info.ex_date = unpacker.GetInt("ex_date");
            info.arrive_date = unpacker.GetInt("arrive_date");
            info.begin_trade_date = unpacker.GetInt("begin_trade_date");
            info.deal_flag = unpacker.GetInt("deal_flag");
            info.busi_flag = unpacker.GetInt("busi_flag");
            clsecuL_3_4_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_3_4_InfoList.Add((clsecuL_3_4_Info)info);
        }
        #endregion

        //逻辑_清算证券_结算_查询公司行为记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new clsecuL_3_4_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.divi_cacl_num = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DIVI_CACL_NUM_INT);
                    info.divi_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DIVI_AMT_FLOAT);
                    info.divi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DIVI_QTY_FLOAT);
                    info.equity_trans_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_EQUITY_TRANS_QTY_FLOAT);
                    info.rights_issue_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RIGHTS_ISSUE_QTY_FLOAT);
                    info.placement_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PLACEMENT_PRICE_FLOAT);
                    info.notice_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NOTICE_DATE_INT);
                    info.reg_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REG_DATE_INT);
                    info.ex_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EX_DATE_INT);
                    info.arrive_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ARRIVE_DATE_INT);
                    info.begin_trade_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TRADE_DATE_INT);
                    info.deal_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_FLAG_INT);
                    info.busi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT);
                    clsecuL_3_4_InfoList.Add(info);
                }
            }
        }
    }

    public class clsecuL_3_11_Response : IResponse
    {
        #region 构造函数
        public clsecuL_3_11_Response()
        {
            this.clsecuL_3_11_InfoList = new ObservableCollection<clsecuL_3_11_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_3_11_Info> clsecuL_3_11_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_3_11_Info info = new clsecuL_3_11_Info();
            clsecuL_3_11_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_3_11_InfoList.Add((clsecuL_3_11_Info)info);
        }
        #endregion

        //逻辑_清算证券_结算_增加机构税率记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new clsecuL_3_11_Info();
                clsecuL_3_11_InfoList.Add(info);
            }
        }
    }

    public class clsecuL_3_12_Response : IResponse
    {
        #region 构造函数
        public clsecuL_3_12_Response()
        {
            this.clsecuL_3_12_InfoList = new ObservableCollection<clsecuL_3_12_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_3_12_Info> clsecuL_3_12_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_3_12_Info info = new clsecuL_3_12_Info();
            clsecuL_3_12_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_3_12_InfoList.Add((clsecuL_3_12_Info)info);
        }
        #endregion

        //逻辑_清算证券_结算_修改机构税率记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new clsecuL_3_12_Info();
                clsecuL_3_12_InfoList.Add(info);
            }
        }
    }

    public class clsecuL_3_13_Response : IResponse
    {
        #region 构造函数
        public clsecuL_3_13_Response()
        {
            this.clsecuL_3_13_InfoList = new ObservableCollection<clsecuL_3_13_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_3_13_Info> clsecuL_3_13_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_3_13_Info info = new clsecuL_3_13_Info();
            clsecuL_3_13_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_3_13_InfoList.Add((clsecuL_3_13_Info)info);
        }
        #endregion

        //逻辑_清算证券_结算_删除机构税率记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new clsecuL_3_13_Info();
                clsecuL_3_13_InfoList.Add(info);
            }
        }
    }

    public class clsecuL_3_14_Response : IResponse
    {
        #region 构造函数
        public clsecuL_3_14_Response()
        {
            this.clsecuL_3_14_InfoList = new ObservableCollection<clsecuL_3_14_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_3_14_Info> clsecuL_3_14_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_3_14_Info info = new clsecuL_3_14_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.divi_tax_rate = unpacker.GetDouble("divi_tax_rate");
            clsecuL_3_14_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_3_14_InfoList.Add((clsecuL_3_14_Info)info);
        }
        #endregion

        //逻辑_清算证券_结算_查询机构税率记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new clsecuL_3_14_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.divi_tax_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DIVI_TAX_RATE_FLOAT);
                    clsecuL_3_14_InfoList.Add(info);
                }
            }
        }
    }

    public class clsecuL_3_16_Response : IResponse
    {
        #region 构造函数
        public clsecuL_3_16_Response()
        {
            this.clsecuL_3_16_InfoList = new ObservableCollection<clsecuL_3_16_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_3_16_Info> clsecuL_3_16_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_3_16_Info info = new clsecuL_3_16_Info();
            clsecuL_3_16_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_3_16_InfoList.Add((clsecuL_3_16_Info)info);
        }
        #endregion

        //逻辑_清算证券_结算_增加机构产品税率记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new clsecuL_3_16_Info();
                clsecuL_3_16_InfoList.Add(info);
            }
        }
    }

    public class clsecuL_3_17_Response : IResponse
    {
        #region 构造函数
        public clsecuL_3_17_Response()
        {
            this.clsecuL_3_17_InfoList = new ObservableCollection<clsecuL_3_17_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_3_17_Info> clsecuL_3_17_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_3_17_Info info = new clsecuL_3_17_Info();
            clsecuL_3_17_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_3_17_InfoList.Add((clsecuL_3_17_Info)info);
        }
        #endregion

        //逻辑_清算证券_结算_修改机构产品税率记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new clsecuL_3_17_Info();
                clsecuL_3_17_InfoList.Add(info);
            }
        }
    }

    public class clsecuL_3_18_Response : IResponse
    {
        #region 构造函数
        public clsecuL_3_18_Response()
        {
            this.clsecuL_3_18_InfoList = new ObservableCollection<clsecuL_3_18_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_3_18_Info> clsecuL_3_18_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_3_18_Info info = new clsecuL_3_18_Info();
            clsecuL_3_18_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_3_18_InfoList.Add((clsecuL_3_18_Info)info);
        }
        #endregion

        //逻辑_清算证券_结算_删除机构产品税率记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new clsecuL_3_18_Info();
                clsecuL_3_18_InfoList.Add(info);
            }
        }
    }

    public class clsecuL_3_19_Response : IResponse
    {
        #region 构造函数
        public clsecuL_3_19_Response()
        {
            this.clsecuL_3_19_InfoList = new ObservableCollection<clsecuL_3_19_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_3_19_Info> clsecuL_3_19_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_3_19_Info info = new clsecuL_3_19_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.divi_tax_rate = unpacker.GetDouble("divi_tax_rate");
            clsecuL_3_19_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_3_19_InfoList.Add((clsecuL_3_19_Info)info);
        }
        #endregion

        //逻辑_清算证券_结算_查询机构产品税率记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new clsecuL_3_19_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.divi_tax_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DIVI_TAX_RATE_FLOAT);
                    clsecuL_3_19_InfoList.Add(info);
                }
            }
        }
    }

    public class clsecuL_3_21_Response : IResponse
    {
        #region 构造函数
        public clsecuL_3_21_Response()
        {
            this.clsecuL_3_21_InfoList = new ObservableCollection<clsecuL_3_21_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_3_21_Info> clsecuL_3_21_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_3_21_Info info = new clsecuL_3_21_Info();
            clsecuL_3_21_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_3_21_InfoList.Add((clsecuL_3_21_Info)info);
        }
        #endregion

        //逻辑_清算证券_结算_转入新股中签记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new clsecuL_3_21_Info();
                clsecuL_3_21_InfoList.Add(info);
            }
        }
    }

    public class clsecuL_3_22_Response : IResponse
    {
        #region 构造函数
        public clsecuL_3_22_Response()
        {
            this.clsecuL_3_22_InfoList = new ObservableCollection<clsecuL_3_22_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_3_22_Info> clsecuL_3_22_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_3_22_Info info = new clsecuL_3_22_Info();
            clsecuL_3_22_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_3_22_InfoList.Add((clsecuL_3_22_Info)info);
        }
        #endregion

        //逻辑_清算证券_结算_修改新股中签记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new clsecuL_3_22_Info();
                clsecuL_3_22_InfoList.Add(info);
            }
        }
    }

    public class clsecuL_3_23_Response : IResponse
    {
        #region 构造函数
        public clsecuL_3_23_Response()
        {
            this.clsecuL_3_23_InfoList = new ObservableCollection<clsecuL_3_23_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_3_23_Info> clsecuL_3_23_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_3_23_Info info = new clsecuL_3_23_Info();
            clsecuL_3_23_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_3_23_InfoList.Add((clsecuL_3_23_Info)info);
        }
        #endregion

        //逻辑_清算证券_结算_删除新股中签记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new clsecuL_3_23_Info();
                clsecuL_3_23_InfoList.Add(info);
            }
        }
    }

    public class clsecuL_3_24_Response : IResponse
    {
        #region 构造函数
        public clsecuL_3_24_Response()
        {
            this.clsecuL_3_24_InfoList = new ObservableCollection<clsecuL_3_24_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_3_24_Info> clsecuL_3_24_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_3_24_Info info = new clsecuL_3_24_Info();
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_type = unpacker.GetInt("stock_type");
            info.strike_date = unpacker.GetInt("strike_date");
            info.strike_no = unpacker.GetStr("strike_no");
            info.order_dir = unpacker.GetInt("order_dir");
            info.strike_price = unpacker.GetDouble("strike_price");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            clsecuL_3_24_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_3_24_InfoList.Add((clsecuL_3_24_Info)info);
        }
        #endregion

        //逻辑_清算证券_结算_查询新股中签记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new clsecuL_3_24_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.strike_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT);
                    info.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_PRICE_FLOAT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    clsecuL_3_24_InfoList.Add(info);
                }
            }
        }
    }

    public class clsecuL_3_26_Response : IResponse
    {
        #region 构造函数
        public clsecuL_3_26_Response()
        {
            this.clsecuL_3_26_InfoList = new ObservableCollection<clsecuL_3_26_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_3_26_Info> clsecuL_3_26_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_3_26_Info info = new clsecuL_3_26_Info();
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_type = unpacker.GetInt("stock_type");
            info.strike_date = unpacker.GetInt("strike_date");
            info.strike_no = unpacker.GetStr("strike_no");
            info.order_dir = unpacker.GetInt("order_dir");
            info.strike_price = unpacker.GetDouble("strike_price");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            clsecuL_3_26_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_3_26_InfoList.Add((clsecuL_3_26_Info)info);
        }
        #endregion

        //逻辑_清算证券_结算_查询历史新股中签记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new clsecuL_3_26_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.strike_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT);
                    info.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_PRICE_FLOAT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    clsecuL_3_26_InfoList.Add(info);
                }
            }
        }
    }

    public class clsecuL_3_31_Response : IResponse
    {
        #region 构造函数
        public clsecuL_3_31_Response()
        {
            this.clsecuL_3_31_InfoList = new ObservableCollection<clsecuL_3_31_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_3_31_Info> clsecuL_3_31_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_3_31_Info info = new clsecuL_3_31_Info();
            info.record_count = unpacker.GetInt("record_count");
            info.deal_info = unpacker.GetStr("deal_info");
            clsecuL_3_31_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_3_31_InfoList.Add((clsecuL_3_31_Info)info);
        }
        #endregion

        //逻辑_清算证券_结算_转入新股申购记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new clsecuL_3_31_Info();
                info.record_count = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RECORD_COUNT_INT);
                info.deal_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_INFO_STR);
                clsecuL_3_31_InfoList.Add(info);
            }
        }
    }

    public class clsecuL_3_34_Response : IResponse
    {
        #region 构造函数
        public clsecuL_3_34_Response()
        {
            this.clsecuL_3_34_InfoList = new ObservableCollection<clsecuL_3_34_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_3_34_Info> clsecuL_3_34_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_3_34_Info info = new clsecuL_3_34_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.init_date = unpacker.GetInt("init_date");
            info.order_dir = unpacker.GetInt("order_dir");
            info.dist_qty = unpacker.GetInt("dist_qty");
            info.nav_asset = unpacker.GetDouble("nav_asset");
            info.deal_flag = unpacker.GetInt("deal_flag");
            info.trade_code_no = unpacker.GetInt("trade_code_no");
            info.target_code_no = unpacker.GetInt("target_code_no");
            clsecuL_3_34_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_3_34_InfoList.Add((clsecuL_3_34_Info)info);
        }
        #endregion

        //逻辑_清算证券_结算_查询新股申购记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new clsecuL_3_34_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.dist_qty = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DIST_QTY_INT);
                    info.nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT);
                    info.deal_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_FLAG_INT);
                    info.trade_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_NO_INT);
                    info.target_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_NO_INT);
                    clsecuL_3_34_InfoList.Add(info);
                }
            }
        }
    }

    public class clsecuL_3_36_Response : IResponse
    {
        #region 构造函数
        public clsecuL_3_36_Response()
        {
            this.clsecuL_3_36_InfoList = new ObservableCollection<clsecuL_3_36_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_3_36_Info> clsecuL_3_36_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_3_36_Info info = new clsecuL_3_36_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.order_dir = unpacker.GetInt("order_dir");
            info.dist_qty = unpacker.GetInt("dist_qty");
            info.nav_asset = unpacker.GetDouble("nav_asset");
            info.deal_flag = unpacker.GetInt("deal_flag");
            info.trade_code_no = unpacker.GetInt("trade_code_no");
            info.target_code_no = unpacker.GetInt("target_code_no");
            clsecuL_3_36_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_3_36_InfoList.Add((clsecuL_3_36_Info)info);
        }
        #endregion

        //逻辑_清算证券_结算_查询新股申购中签记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new clsecuL_3_36_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.dist_qty = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DIST_QTY_INT);
                    info.nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT);
                    info.deal_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_FLAG_INT);
                    info.trade_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_NO_INT);
                    info.target_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_NO_INT);
                    clsecuL_3_36_InfoList.Add(info);
                }
            }
        }
    }

    public class clsecuL_3_37_Response : IResponse
    {
        #region 构造函数
        public clsecuL_3_37_Response()
        {
            this.clsecuL_3_37_InfoList = new ObservableCollection<clsecuL_3_37_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_3_37_Info> clsecuL_3_37_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_3_37_Info info = new clsecuL_3_37_Info();
            clsecuL_3_37_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_3_37_InfoList.Add((clsecuL_3_37_Info)info);
        }
        #endregion

        //逻辑_清算证券_结算_转入可转债中签记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new clsecuL_3_37_Info();
                clsecuL_3_37_InfoList.Add(info);
            }
        }
    }

    public class clsecuL_3_38_Response : IResponse
    {
        #region 构造函数
        public clsecuL_3_38_Response()
        {
            this.clsecuL_3_38_InfoList = new ObservableCollection<clsecuL_3_38_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_3_38_Info> clsecuL_3_38_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_3_38_Info info = new clsecuL_3_38_Info();
            clsecuL_3_38_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_3_38_InfoList.Add((clsecuL_3_38_Info)info);
        }
        #endregion

        //逻辑_清算证券_结算_修改可转债中签记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new clsecuL_3_38_Info();
                clsecuL_3_38_InfoList.Add(info);
            }
        }
    }

    public class clsecuL_3_39_Response : IResponse
    {
        #region 构造函数
        public clsecuL_3_39_Response()
        {
            this.clsecuL_3_39_InfoList = new ObservableCollection<clsecuL_3_39_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_3_39_Info> clsecuL_3_39_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_3_39_Info info = new clsecuL_3_39_Info();
            clsecuL_3_39_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_3_39_InfoList.Add((clsecuL_3_39_Info)info);
        }
        #endregion

        //逻辑_清算证券_结算_删除可转债中签记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new clsecuL_3_39_Info();
                clsecuL_3_39_InfoList.Add(info);
            }
        }
    }

    public class clsecuL_3_40_Response : IResponse
    {
        #region 构造函数
        public clsecuL_3_40_Response()
        {
            this.clsecuL_3_40_InfoList = new ObservableCollection<clsecuL_3_40_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_3_40_Info> clsecuL_3_40_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_3_40_Info info = new clsecuL_3_40_Info();
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_type = unpacker.GetInt("stock_type");
            info.strike_date = unpacker.GetInt("strike_date");
            info.strike_no = unpacker.GetStr("strike_no");
            info.order_dir = unpacker.GetInt("order_dir");
            info.strike_price = unpacker.GetDouble("strike_price");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            clsecuL_3_40_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_3_40_InfoList.Add((clsecuL_3_40_Info)info);
        }
        #endregion

        //逻辑_清算证券_结算_查询可转债中签记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new clsecuL_3_40_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.strike_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT);
                    info.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_PRICE_FLOAT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    clsecuL_3_40_InfoList.Add(info);
                }
            }
        }
    }

    public class clsecuL_3_41_Response : IResponse
    {
        #region 构造函数
        public clsecuL_3_41_Response()
        {
            this.clsecuL_3_41_InfoList = new ObservableCollection<clsecuL_3_41_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_3_41_Info> clsecuL_3_41_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_3_41_Info info = new clsecuL_3_41_Info();
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_type = unpacker.GetInt("stock_type");
            info.strike_date = unpacker.GetInt("strike_date");
            info.strike_no = unpacker.GetStr("strike_no");
            info.order_dir = unpacker.GetInt("order_dir");
            info.strike_price = unpacker.GetDouble("strike_price");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            clsecuL_3_41_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_3_41_InfoList.Add((clsecuL_3_41_Info)info);
        }
        #endregion

        //逻辑_清算证券_结算_查询历史可转债中签记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new clsecuL_3_41_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.strike_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT);
                    info.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_PRICE_FLOAT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    clsecuL_3_41_InfoList.Add(info);
                }
            }
        }
    }

    public class clsecuL_3_44_Response : IResponse
    {
        #region 构造函数
        public clsecuL_3_44_Response()
        {
            this.clsecuL_3_44_InfoList = new ObservableCollection<clsecuL_3_44_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_3_44_Info> clsecuL_3_44_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_3_44_Info info = new clsecuL_3_44_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_type = unpacker.GetInt("stock_type");
            info.init_date = unpacker.GetInt("init_date");
            info.strike_date = unpacker.GetInt("strike_date");
            info.strike_no = unpacker.GetStr("strike_no");
            info.order_dir = unpacker.GetInt("order_dir");
            info.repo_qty = unpacker.GetDouble("repo_qty");
            info.repo_amt = unpacker.GetDouble("repo_amt");
            info.repo_rate = unpacker.GetDouble("repo_rate");
            info.repo_trade_date = unpacker.GetInt("repo_trade_date");
            info.repo_order_id = unpacker.GetInt64("repo_order_id");
            info.repo_strike_id = unpacker.GetInt64("repo_strike_id");
            info.intrst_days = unpacker.GetInt("intrst_days");
            info.repo_cale_days = unpacker.GetInt("repo_cale_days");
            info.repo_back_date = unpacker.GetInt("repo_back_date");
            info.repo_back_trade_date = unpacker.GetInt("repo_back_trade_date");
            info.repo_back_amt = unpacker.GetDouble("repo_back_amt");
            info.repo_back_intrst = unpacker.GetDouble("repo_back_intrst");
            info.repo_status = unpacker.GetStr("repo_status");
            info.busi_flag = unpacker.GetInt("busi_flag");
            info.trade_code_no = unpacker.GetInt("trade_code_no");
            info.target_code_no = unpacker.GetInt("target_code_no");
            clsecuL_3_44_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_3_44_InfoList.Add((clsecuL_3_44_Info)info);
        }
        #endregion

        //逻辑_清算证券_结算_查询回购记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new clsecuL_3_44_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.strike_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT);
                    info.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.repo_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPO_QTY_FLOAT);
                    info.repo_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPO_AMT_FLOAT);
                    info.repo_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPO_RATE_FLOAT);
                    info.repo_trade_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPO_TRADE_DATE_INT);
                    info.repo_order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_REPO_ORDER_ID_INT64);
                    info.repo_strike_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_REPO_STRIKE_ID_INT64);
                    info.intrst_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_DAYS_INT);
                    info.repo_cale_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPO_CALE_DAYS_INT);
                    info.repo_back_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPO_BACK_DATE_INT);
                    info.repo_back_trade_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPO_BACK_TRADE_DATE_INT);
                    info.repo_back_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPO_BACK_AMT_FLOAT);
                    info.repo_back_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPO_BACK_INTRST_FLOAT);
                    info.repo_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPO_STATUS_STR);
                    info.busi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT);
                    info.trade_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_NO_INT);
                    info.target_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_NO_INT);
                    clsecuL_3_44_InfoList.Add(info);
                }
            }
        }
    }

    public class clsecuL_3_50_Response : IResponse
    {
        #region 构造函数
        public clsecuL_3_50_Response()
        {
            this.clsecuL_3_50_InfoList = new ObservableCollection<clsecuL_3_50_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_3_50_Info> clsecuL_3_50_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_3_50_Info info = new clsecuL_3_50_Info();
            clsecuL_3_50_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_3_50_InfoList.Add((clsecuL_3_50_Info)info);
        }
        #endregion

        //逻辑_清算证券_结算_转入清算证券结算记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new clsecuL_3_50_Info();
                clsecuL_3_50_InfoList.Add(info);
            }
        }
    }

    public class clsecuL_3_86_Response : IResponse
    {
        #region 构造函数
        public clsecuL_3_86_Response()
        {
            this.clsecuL_3_86_InfoList = new ObservableCollection<clsecuL_3_86_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_3_86_Info> clsecuL_3_86_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_3_86_Info info = new clsecuL_3_86_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.pre_entry_qty = unpacker.GetDouble("pre_entry_qty");
            info.pre_entry_amt = unpacker.GetDouble("pre_entry_amt");
            info.bond_accr_intrst = unpacker.GetDouble("bond_accr_intrst");
            info.busi_flag = unpacker.GetInt("busi_flag");
            info.act_record_flag = unpacker.GetInt("act_record_flag");
            info.acco_entry_flag = unpacker.GetInt("acco_entry_flag");
            info.entry_status = unpacker.GetStr("entry_status");
            info.stock_type = unpacker.GetInt("stock_type");
            info.reg_date = unpacker.GetInt("reg_date");
            info.arrive_date = unpacker.GetInt("arrive_date");
            clsecuL_3_86_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_3_86_InfoList.Add((clsecuL_3_86_Info)info);
        }
        #endregion

        //逻辑_清算证券_结算_查询提前待入账记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new clsecuL_3_86_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.pre_entry_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ENTRY_QTY_FLOAT);
                    info.pre_entry_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ENTRY_AMT_FLOAT);
                    info.bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT);
                    info.busi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT);
                    info.act_record_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ACT_RECORD_FLAG_INT);
                    info.acco_entry_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_ENTRY_FLAG_INT);
                    info.entry_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_STATUS_STR);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.reg_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REG_DATE_INT);
                    info.arrive_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ARRIVE_DATE_INT);
                    clsecuL_3_86_InfoList.Add(info);
                }
            }
        }
    }

    public class clsecuL_3_87_Response : IResponse
    {
        #region 构造函数
        public clsecuL_3_87_Response()
        {
            this.clsecuL_3_87_InfoList = new ObservableCollection<clsecuL_3_87_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_3_87_Info> clsecuL_3_87_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_3_87_Info info = new clsecuL_3_87_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.strike_date = unpacker.GetInt("strike_date");
            info.strike_no = unpacker.GetStr("strike_no");
            info.order_dir = unpacker.GetInt("order_dir");
            info.strike_price = unpacker.GetDouble("strike_price");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.pre_entry_qty = unpacker.GetDouble("pre_entry_qty");
            info.pre_entry_amt = unpacker.GetDouble("pre_entry_amt");
            info.busi_flag = unpacker.GetInt("busi_flag");
            info.entry_status = unpacker.GetStr("entry_status");
            info.undo_status = unpacker.GetStr("undo_status");
            info.entry_money_jour_no = unpacker.GetInt64("entry_money_jour_no");
            info.entry_posi_jour_no = unpacker.GetInt64("entry_posi_jour_no");
            info.deli_jour_no = unpacker.GetInt64("deli_jour_no");
            info.stock_type = unpacker.GetInt("stock_type");
            info.trade_code_no = unpacker.GetInt("trade_code_no");
            info.target_code_no = unpacker.GetInt("target_code_no");
            info.intrst_days = unpacker.GetInt("intrst_days");
            info.bond_accr_intrst = unpacker.GetDouble("bond_accr_intrst");
            info.impawn_ratio = unpacker.GetDouble("impawn_ratio");
            info.repo_back_date = unpacker.GetInt("repo_back_date");
            clsecuL_3_87_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_3_87_InfoList.Add((clsecuL_3_87_Info)info);
        }
        #endregion

        //逻辑_清算证券_结算_查询待入账记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new clsecuL_3_87_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.strike_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT);
                    info.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_PRICE_FLOAT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    info.pre_entry_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ENTRY_QTY_FLOAT);
                    info.pre_entry_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ENTRY_AMT_FLOAT);
                    info.busi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT);
                    info.entry_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_STATUS_STR);
                    info.undo_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_UNDO_STATUS_STR);
                    info.entry_money_jour_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_MONEY_JOUR_NO_INT64);
                    info.entry_posi_jour_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_POSI_JOUR_NO_INT64);
                    info.deli_jour_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_DELI_JOUR_NO_INT64);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.trade_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_NO_INT);
                    info.target_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_NO_INT);
                    info.intrst_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_DAYS_INT);
                    info.bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT);
                    info.impawn_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_IMPAWN_RATIO_FLOAT);
                    info.repo_back_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPO_BACK_DATE_INT);
                    clsecuL_3_87_InfoList.Add(info);
                }
            }
        }
    }

    public class clsecuL_3_88_Response : IResponse
    {
        #region 构造函数
        public clsecuL_3_88_Response()
        {
            this.clsecuL_3_88_InfoList = new ObservableCollection<clsecuL_3_88_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_3_88_Info> clsecuL_3_88_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_3_88_Info info = new clsecuL_3_88_Info();
            info.record_count = unpacker.GetInt("record_count");
            info.deal_info = unpacker.GetStr("deal_info");
            clsecuL_3_88_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_3_88_InfoList.Add((clsecuL_3_88_Info)info);
        }
        #endregion

        //逻辑_清算证券_结算_入账处理
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new clsecuL_3_88_Info();
                info.record_count = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RECORD_COUNT_INT);
                info.deal_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_INFO_STR);
                clsecuL_3_88_InfoList.Add(info);
            }
        }
    }

    public class clsecuL_3_89_Response : IResponse
    {
        #region 构造函数
        public clsecuL_3_89_Response()
        {
            this.clsecuL_3_89_InfoList = new ObservableCollection<clsecuL_3_89_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_3_89_Info> clsecuL_3_89_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_3_89_Info info = new clsecuL_3_89_Info();
            clsecuL_3_89_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_3_89_InfoList.Add((clsecuL_3_89_Info)info);
        }
        #endregion

        //逻辑_清算证券_结算_入账回滚处理
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new clsecuL_3_89_Info();
                clsecuL_3_89_InfoList.Add(info);
            }
        }
    }

    public class clsecuL_3_90_Response : IResponse
    {
        #region 构造函数
        public clsecuL_3_90_Response()
        {
            this.clsecuL_3_90_InfoList = new ObservableCollection<clsecuL_3_90_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_3_90_Info> clsecuL_3_90_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_3_90_Info info = new clsecuL_3_90_Info();
            clsecuL_3_90_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_3_90_InfoList.Add((clsecuL_3_90_Info)info);
        }
        #endregion

        //逻辑_清算证券_结算_系统初始化
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new clsecuL_3_90_Info();
                clsecuL_3_90_InfoList.Add(info);
            }
        }
    }

    public class clsecuL_3_152_Response : IResponse
    {
        #region 构造函数
        public clsecuL_3_152_Response()
        {
            this.clsecuL_3_152_InfoList = new ObservableCollection<clsecuL_3_152_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_3_152_Info> clsecuL_3_152_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_3_152_Info info = new clsecuL_3_152_Info();
            info.task_strike_status = unpacker.GetStr("task_strike_status");
            clsecuL_3_152_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_3_152_InfoList.Add((clsecuL_3_152_Info)info);
        }
        #endregion

        //逻辑_清算证券_结算_结算处理定时任务
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new clsecuL_3_152_Info();
                info.task_strike_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STRIKE_STATUS_STR);
                clsecuL_3_152_InfoList.Add(info);
            }
        }
    }

    public class clsecuL_3_153_Response : IResponse
    {
        #region 构造函数
        public clsecuL_3_153_Response()
        {
            this.clsecuL_3_153_InfoList = new ObservableCollection<clsecuL_3_153_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_3_153_Info> clsecuL_3_153_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_3_153_Info info = new clsecuL_3_153_Info();
            info.task_strike_status = unpacker.GetStr("task_strike_status");
            clsecuL_3_153_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_3_153_InfoList.Add((clsecuL_3_153_Info)info);
        }
        #endregion

        //逻辑_清算证券_结算_入账定时任务
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new clsecuL_3_153_Info();
                info.task_strike_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STRIKE_STATUS_STR);
                clsecuL_3_153_InfoList.Add(info);
            }
        }
    }

    public class clsecuL_3_201_Response : IResponse
    {
        #region 构造函数
        public clsecuL_3_201_Response()
        {
            this.clsecuL_3_201_InfoList = new ObservableCollection<clsecuL_3_201_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_3_201_Info> clsecuL_3_201_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_3_201_Info info = new clsecuL_3_201_Info();
            clsecuL_3_201_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_3_201_InfoList.Add((clsecuL_3_201_Info)info);
        }
        #endregion

        //逻辑_清算证券_结算_数据统计
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new clsecuL_3_201_Info();
                clsecuL_3_201_InfoList.Add(info);
            }
        }
    }

    public class clsecuL_3_202_Response : IResponse
    {
        #region 构造函数
        public clsecuL_3_202_Response()
        {
            this.clsecuL_3_202_InfoList = new ObservableCollection<clsecuL_3_202_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_3_202_Info> clsecuL_3_202_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_3_202_Info info = new clsecuL_3_202_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.busi_flag = unpacker.GetInt("busi_flag");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.sett_num = unpacker.GetInt("sett_num");
            info.entry_qty = unpacker.GetDouble("entry_qty");
            info.entry_amt = unpacker.GetDouble("entry_amt");
            clsecuL_3_202_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_3_202_InfoList.Add((clsecuL_3_202_Info)info);
        }
        #endregion

        //逻辑_清算证券_结算_查询统计数据
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new clsecuL_3_202_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.busi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.sett_num = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SETT_NUM_INT);
                    info.entry_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_QTY_FLOAT);
                    info.entry_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_AMT_FLOAT);
                    clsecuL_3_202_InfoList.Add(info);
                }
            }
        }
    }

    public class clsecuL_3_203_Response : IResponse
    {
        #region 构造函数
        public clsecuL_3_203_Response()
        {
            this.clsecuL_3_203_InfoList = new ObservableCollection<clsecuL_3_203_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_3_203_Info> clsecuL_3_203_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_3_203_Info info = new clsecuL_3_203_Info();
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_type = unpacker.GetInt("stock_type");
            info.asset_type = unpacker.GetInt("asset_type");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.par_value = unpacker.GetDouble("par_value");
            info.divi_cacl_num = unpacker.GetInt("divi_cacl_num");
            info.divi_amt = unpacker.GetDouble("divi_amt");
            info.divi_qty = unpacker.GetDouble("divi_qty");
            info.equity_trans_qty = unpacker.GetDouble("equity_trans_qty");
            info.rights_issue_qty = unpacker.GetDouble("rights_issue_qty");
            info.notice_date = unpacker.GetInt("notice_date");
            info.reg_date = unpacker.GetInt("reg_date");
            info.ex_date = unpacker.GetInt("ex_date");
            info.arrive_date = unpacker.GetInt("arrive_date");
            info.begin_trade_date = unpacker.GetInt("begin_trade_date");
            info.deal_flag = unpacker.GetInt("deal_flag");
            clsecuL_3_203_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_3_203_InfoList.Add((clsecuL_3_203_Info)info);
        }
        #endregion

        //逻辑_清算证券_结算_查询公司行为表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new clsecuL_3_203_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.par_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_FLOAT);
                    info.divi_cacl_num = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DIVI_CACL_NUM_INT);
                    info.divi_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DIVI_AMT_FLOAT);
                    info.divi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DIVI_QTY_FLOAT);
                    info.equity_trans_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_EQUITY_TRANS_QTY_FLOAT);
                    info.rights_issue_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RIGHTS_ISSUE_QTY_FLOAT);
                    info.notice_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NOTICE_DATE_INT);
                    info.reg_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REG_DATE_INT);
                    info.ex_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EX_DATE_INT);
                    info.arrive_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ARRIVE_DATE_INT);
                    info.begin_trade_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TRADE_DATE_INT);
                    info.deal_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_FLAG_INT);
                    clsecuL_3_203_InfoList.Add(info);
                }
            }
        }
    }

    public class clsecuL_3_101_Response : IResponse
    {
        #region 构造函数
        public clsecuL_3_101_Response()
        {
            this.clsecuL_3_101_InfoList = new ObservableCollection<clsecuL_3_101_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_3_101_Info> clsecuL_3_101_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_3_101_Info info = new clsecuL_3_101_Info();
            clsecuL_3_101_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_3_101_InfoList.Add((clsecuL_3_101_Info)info);
        }
        #endregion

        //逻辑_清算证券_结算_自动增加公司行为记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new clsecuL_3_101_Info();
                clsecuL_3_101_InfoList.Add(info);
            }
        }
    }

    public class clsecuL_3_51_Response : IResponse
    {
        #region 构造函数
        public clsecuL_3_51_Response()
        {
            this.clsecuL_3_51_InfoList = new ObservableCollection<clsecuL_3_51_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_3_51_Info> clsecuL_3_51_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_3_51_Info info = new clsecuL_3_51_Info();
            clsecuL_3_51_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_3_51_InfoList.Add((clsecuL_3_51_Info)info);
        }
        #endregion

        //逻辑_清算证券_结算_新增新股中签记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new clsecuL_3_51_Info();
                clsecuL_3_51_InfoList.Add(info);
            }
        }
    }

    public class clsecuL_3_204_Response : IResponse
    {
        #region 构造函数
        public clsecuL_3_204_Response()
        {
            this.clsecuL_3_204_InfoList = new ObservableCollection<clsecuL_3_204_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_3_204_Info> clsecuL_3_204_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_3_204_Info info = new clsecuL_3_204_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.rights_issue_qty = unpacker.GetDouble("rights_issue_qty");
            info.placement_price = unpacker.GetDouble("placement_price");
            info.avail_pla_qty = unpacker.GetDouble("avail_pla_qty");
            info.frozen_qty = unpacker.GetDouble("frozen_qty");
            info.frozen_amt = unpacker.GetDouble("frozen_amt");
            info.reg_date = unpacker.GetInt("reg_date");
            info.ex_date = unpacker.GetInt("ex_date");
            info.arrive_date = unpacker.GetInt("arrive_date");
            info.begin_trade_date = unpacker.GetInt("begin_trade_date");
            info.placement_status = unpacker.GetStr("placement_status");
            clsecuL_3_204_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_3_204_InfoList.Add((clsecuL_3_204_Info)info);
        }
        #endregion

        //逻辑_清算证券_结算_查询配股登记信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new clsecuL_3_204_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.rights_issue_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RIGHTS_ISSUE_QTY_FLOAT);
                    info.placement_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PLACEMENT_PRICE_FLOAT);
                    info.avail_pla_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVAIL_PLA_QTY_FLOAT);
                    info.frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_QTY_FLOAT);
                    info.frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_AMT_FLOAT);
                    info.reg_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REG_DATE_INT);
                    info.ex_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EX_DATE_INT);
                    info.arrive_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ARRIVE_DATE_INT);
                    info.begin_trade_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TRADE_DATE_INT);
                    info.placement_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PLACEMENT_STATUS_STR);
                    clsecuL_3_204_InfoList.Add(info);
                }
            }
        }
    }

    public class clsecuL_3_205_Response : IResponse
    {
        #region 构造函数
        public clsecuL_3_205_Response()
        {
            this.clsecuL_3_205_InfoList = new ObservableCollection<clsecuL_3_205_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_3_205_Info> clsecuL_3_205_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_3_205_Info info = new clsecuL_3_205_Info();
            clsecuL_3_205_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_3_205_InfoList.Add((clsecuL_3_205_Info)info);
        }
        #endregion

        //逻辑_清算证券_结算_确认配股登记信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new clsecuL_3_205_Info();
                clsecuL_3_205_InfoList.Add(info);
            }
        }
    }

    public class clsecuL_3_206_Response : IResponse
    {
        #region 构造函数
        public clsecuL_3_206_Response()
        {
            this.clsecuL_3_206_InfoList = new ObservableCollection<clsecuL_3_206_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_3_206_Info> clsecuL_3_206_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_3_206_Info info = new clsecuL_3_206_Info();
            clsecuL_3_206_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_3_206_InfoList.Add((clsecuL_3_206_Info)info);
        }
        #endregion

        //逻辑_清算证券_结算_撤销配股登记
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new clsecuL_3_206_Info();
                clsecuL_3_206_InfoList.Add(info);
            }
        }
    }

}
