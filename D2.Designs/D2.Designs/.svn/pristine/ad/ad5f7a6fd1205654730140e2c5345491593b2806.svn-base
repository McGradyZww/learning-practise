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
    public class clsecuL_4_101_Response : IResponse
    {
        #region 构造函数
        public clsecuL_4_101_Response()
        {
            this.clsecuL_4_101_InfoList = new ObservableCollection<clsecuL_4_101_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_4_101_Info> clsecuL_4_101_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_4_101_Info info = new clsecuL_4_101_Info();
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
            info.placement_price = unpacker.GetDouble("placement_price");
            info.notice_date = unpacker.GetInt("notice_date");
            info.reg_date = unpacker.GetInt("reg_date");
            info.ex_date = unpacker.GetInt("ex_date");
            info.arrive_date = unpacker.GetInt("arrive_date");
            info.begin_trade_date = unpacker.GetInt("begin_trade_date");
            info.deal_flag = unpacker.GetInt("deal_flag");
            info.busi_flag = unpacker.GetInt("busi_flag");
            clsecuL_4_101_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_4_101_InfoList.Add((clsecuL_4_101_Info)info);
        }
        #endregion

        //逻辑_清算证券_基础数据同步_查询公司行为表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new clsecuL_4_101_Info();
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
                    info.placement_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PLACEMENT_PRICE_FLOAT);
                    info.notice_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NOTICE_DATE_INT);
                    info.reg_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REG_DATE_INT);
                    info.ex_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EX_DATE_INT);
                    info.arrive_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ARRIVE_DATE_INT);
                    info.begin_trade_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TRADE_DATE_INT);
                    info.deal_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_FLAG_INT);
                    info.busi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT);
                    clsecuL_4_101_InfoList.Add(info);
                }
            }
        }
    }

    public class clsecuL_4_102_Response : IResponse
    {
        #region 构造函数
        public clsecuL_4_102_Response()
        {
            this.clsecuL_4_102_InfoList = new ObservableCollection<clsecuL_4_102_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_4_102_Info> clsecuL_4_102_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_4_102_Info info = new clsecuL_4_102_Info();
            clsecuL_4_102_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_4_102_InfoList.Add((clsecuL_4_102_Info)info);
        }
        #endregion

        //逻辑_清算证券_基础数据同步_更新公司行为表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new clsecuL_4_102_Info();
                clsecuL_4_102_InfoList.Add(info);
            }
        }
    }

    public class clsecuL_4_103_Response : IResponse
    {
        #region 构造函数
        public clsecuL_4_103_Response()
        {
            this.clsecuL_4_103_InfoList = new ObservableCollection<clsecuL_4_103_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_4_103_Info> clsecuL_4_103_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_4_103_Info info = new clsecuL_4_103_Info();
            clsecuL_4_103_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_4_103_InfoList.Add((clsecuL_4_103_Info)info);
        }
        #endregion

        //逻辑_清算证券_基础数据同步_更新公司行为信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new clsecuL_4_103_Info();
                clsecuL_4_103_InfoList.Add(info);
            }
        }
    }

    public class clsecuL_4_104_Response : IResponse
    {
        #region 构造函数
        public clsecuL_4_104_Response()
        {
            this.clsecuL_4_104_InfoList = new ObservableCollection<clsecuL_4_104_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_4_104_Info> clsecuL_4_104_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_4_104_Info info = new clsecuL_4_104_Info();
            clsecuL_4_104_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_4_104_InfoList.Add((clsecuL_4_104_Info)info);
        }
        #endregion

        //逻辑_清算证券_基础数据同步_更新债券兑付信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new clsecuL_4_104_Info();
                clsecuL_4_104_InfoList.Add(info);
            }
        }
    }

    public class clsecuL_4_105_Response : IResponse
    {
        #region 构造函数
        public clsecuL_4_105_Response()
        {
            this.clsecuL_4_105_InfoList = new ObservableCollection<clsecuL_4_105_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_4_105_Info> clsecuL_4_105_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_4_105_Info info = new clsecuL_4_105_Info();
            clsecuL_4_105_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_4_105_InfoList.Add((clsecuL_4_105_Info)info);
        }
        #endregion

        //逻辑_清算证券_基础数据同步_更新债券兑息信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new clsecuL_4_105_Info();
                clsecuL_4_105_InfoList.Add(info);
            }
        }
    }

}
