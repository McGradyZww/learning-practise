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
    public class clsecuL_2_1_Response : IResponse
    {
        #region 构造函数
        public clsecuL_2_1_Response()
        {
            this.clsecuL_2_1_InfoList = new ObservableCollection<clsecuL_2_1_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_2_1_Info> clsecuL_2_1_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_2_1_Info info = new clsecuL_2_1_Info();
            info.record_count = unpacker.GetInt("record_count");
            info.deal_info = unpacker.GetStr("deal_info");
            info.row_id = unpacker.GetInt64("row_id");
            clsecuL_2_1_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_2_1_InfoList.Add((clsecuL_2_1_Info)info);
        }
        #endregion

        //逻辑_清算证券_清算_转入成交记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new clsecuL_2_1_Info();
                info.record_count = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RECORD_COUNT_INT);
                info.deal_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_INFO_STR);
                info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                clsecuL_2_1_InfoList.Add(info);
            }
        }
    }

    public class clsecuL_2_2_Response : IResponse
    {
        #region 构造函数
        public clsecuL_2_2_Response()
        {
            this.clsecuL_2_2_InfoList = new ObservableCollection<clsecuL_2_2_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_2_2_Info> clsecuL_2_2_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_2_2_Info info = new clsecuL_2_2_Info();
            info.record_count = unpacker.GetInt("record_count");
            info.deal_info = unpacker.GetStr("deal_info");
            info.row_id = unpacker.GetInt64("row_id");
            clsecuL_2_2_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_2_2_InfoList.Add((clsecuL_2_2_Info)info);
        }
        #endregion

        //逻辑_清算证券_清算_转入基金交易记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new clsecuL_2_2_Info();
                info.record_count = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RECORD_COUNT_INT);
                info.deal_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_INFO_STR);
                info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                clsecuL_2_2_InfoList.Add(info);
            }
        }
    }

    public class clsecuL_2_3_Response : IResponse
    {
        #region 构造函数
        public clsecuL_2_3_Response()
        {
            this.clsecuL_2_3_InfoList = new ObservableCollection<clsecuL_2_3_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_2_3_Info> clsecuL_2_3_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_2_3_Info info = new clsecuL_2_3_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_rate = unpacker.GetDouble("exch_rate");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_type = unpacker.GetInt("stock_type");
            info.strike_date = unpacker.GetInt("strike_date");
            info.strike_time = unpacker.GetInt("strike_time");
            info.strike_no = unpacker.GetStr("strike_no");
            info.report_date = unpacker.GetInt("report_date");
            info.report_time = unpacker.GetInt("report_time");
            info.report_no = unpacker.GetStr("report_no");
            info.order_date = unpacker.GetInt("order_date");
            info.order_time = unpacker.GetInt("order_time");
            info.order_no = unpacker.GetInt("order_no");
            info.order_dir = unpacker.GetInt("order_dir");
            info.order_price = unpacker.GetDouble("order_price");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.strike_price = unpacker.GetDouble("strike_price");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.stamp_tax = unpacker.GetDouble("stamp_tax");
            info.trans_fee = unpacker.GetDouble("trans_fee");
            info.brkage_fee = unpacker.GetDouble("brkage_fee");
            info.SEC_charges = unpacker.GetDouble("SEC_charges");
            info.other_fee = unpacker.GetDouble("other_fee");
            info.trade_commis = unpacker.GetDouble("trade_commis");
            info.other_commis = unpacker.GetDouble("other_commis");
            info.trade_code_no = unpacker.GetInt("trade_code_no");
            info.target_code_no = unpacker.GetInt("target_code_no");
            info.capit_reback_days = unpacker.GetInt("capit_reback_days");
            info.posi_reback_days = unpacker.GetInt("posi_reback_days");
            info.net_price_flag = unpacker.GetInt("net_price_flag");
            info.intrst_days = unpacker.GetInt("intrst_days");
            info.par_value = unpacker.GetDouble("par_value");
            info.bond_accr_intrst = unpacker.GetDouble("bond_accr_intrst");
            info.impawn_ratio = unpacker.GetDouble("impawn_ratio");
            info.clear_entry_type = unpacker.GetInt("clear_entry_type");
            info.deal_flag = unpacker.GetInt("deal_flag");
            clsecuL_2_3_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_2_3_InfoList.Add((clsecuL_2_3_Info)info);
        }
        #endregion

        //逻辑_清算证券_清算_查询成交记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new clsecuL_2_3_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_RATE_FLOAT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.strike_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT);
                    info.strike_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_TIME_INT);
                    info.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                    info.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                    info.report_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_TIME_INT);
                    info.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    info.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    info.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                    info.order_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_NO_INT);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    info.strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_PRICE_FLOAT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    info.stamp_tax = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STAMP_TAX_FLOAT);
                    info.trans_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_FEE_FLOAT);
                    info.brkage_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BRKAGE_FEE_FLOAT);
                    info.SEC_charges = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SEC_CHARGES_FLOAT);
                    info.other_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_FEE_FLOAT);
                    info.trade_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_COMMIS_FLOAT);
                    info.other_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_COMMIS_FLOAT);
                    info.trade_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_NO_INT);
                    info.target_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_NO_INT);
                    info.capit_reback_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CAPIT_REBACK_DAYS_INT);
                    info.posi_reback_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_POSI_REBACK_DAYS_INT);
                    info.net_price_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLAG_INT);
                    info.intrst_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_DAYS_INT);
                    info.par_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_FLOAT);
                    info.bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT);
                    info.impawn_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_IMPAWN_RATIO_FLOAT);
                    info.clear_entry_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLEAR_ENTRY_TYPE_INT);
                    info.deal_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_FLAG_INT);
                    clsecuL_2_3_InfoList.Add(info);
                }
            }
        }
    }

    public class clsecuL_2_4_Response : IResponse
    {
        #region 构造函数
        public clsecuL_2_4_Response()
        {
            this.clsecuL_2_4_InfoList = new ObservableCollection<clsecuL_2_4_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_2_4_Info> clsecuL_2_4_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_2_4_Info info = new clsecuL_2_4_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco = unpacker.GetStr("stock_acco");
            info.stock_code = unpacker.GetStr("stock_code");
            info.strike_time = unpacker.GetInt("strike_time");
            info.strike_no = unpacker.GetStr("strike_no");
            info.report_time = unpacker.GetInt("report_time");
            info.report_no = unpacker.GetStr("report_no");
            info.order_dir = unpacker.GetInt("order_dir");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.sett_flag = unpacker.GetInt("sett_flag");
            info.remark_info = unpacker.GetStr("remark_info");
            clsecuL_2_4_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_2_4_InfoList.Add((clsecuL_2_4_Info)info);
        }
        #endregion

        //逻辑_清算证券_清算_查询转入成交记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new clsecuL_2_4_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.strike_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_TIME_INT);
                    info.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                    info.report_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_TIME_INT);
                    info.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.sett_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SETT_FLAG_INT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    clsecuL_2_4_InfoList.Add(info);
                }
            }
        }
    }

    public class clsecuL_2_11_Response : IResponse
    {
        #region 构造函数
        public clsecuL_2_11_Response()
        {
            this.clsecuL_2_11_InfoList = new ObservableCollection<clsecuL_2_11_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_2_11_Info> clsecuL_2_11_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_2_11_Info info = new clsecuL_2_11_Info();
            info.record_count = unpacker.GetInt("record_count");
            info.deal_info = unpacker.GetStr("deal_info");
            info.row_id = unpacker.GetInt64("row_id");
            clsecuL_2_11_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_2_11_InfoList.Add((clsecuL_2_11_Info)info);
        }
        #endregion

        //逻辑_清算证券_清算_清算处理
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new clsecuL_2_11_Info();
                info.record_count = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RECORD_COUNT_INT);
                info.deal_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_INFO_STR);
                info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                clsecuL_2_11_InfoList.Add(info);
            }
        }
    }

    public class clsecuL_2_13_Response : IResponse
    {
        #region 构造函数
        public clsecuL_2_13_Response()
        {
            this.clsecuL_2_13_InfoList = new ObservableCollection<clsecuL_2_13_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_2_13_Info> clsecuL_2_13_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_2_13_Info info = new clsecuL_2_13_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.pass_no = unpacker.GetInt("pass_no");
            info.exch_rate = unpacker.GetDouble("exch_rate");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.strike_date = unpacker.GetInt("strike_date");
            info.strike_time = unpacker.GetInt("strike_time");
            info.strike_no = unpacker.GetStr("strike_no");
            info.report_date = unpacker.GetInt("report_date");
            info.report_time = unpacker.GetInt("report_time");
            info.report_no = unpacker.GetStr("report_no");
            info.order_date = unpacker.GetInt("order_date");
            info.order_time = unpacker.GetInt("order_time");
            info.order_no = unpacker.GetInt("order_no");
            info.order_dir = unpacker.GetInt("order_dir");
            info.order_price = unpacker.GetDouble("order_price");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.strike_num = unpacker.GetInt("strike_num");
            info.strike_aver_price = unpacker.GetDouble("strike_aver_price");
            info.pre_entry_qty = unpacker.GetDouble("pre_entry_qty");
            info.pre_entry_amt = unpacker.GetDouble("pre_entry_amt");
            info.split_strike_qty = unpacker.GetDouble("split_strike_qty");
            info.split_strike_amt = unpacker.GetDouble("split_strike_amt");
            info.split_stamp_tax = unpacker.GetDouble("split_stamp_tax");
            info.split_trans_fee = unpacker.GetDouble("split_trans_fee");
            info.split_brkage = unpacker.GetDouble("split_brkage");
            info.split_SEC_charges = unpacker.GetDouble("split_SEC_charges");
            info.split_other_fee = unpacker.GetDouble("split_other_fee");
            info.split_brkage_commis = unpacker.GetDouble("split_brkage_commis");
            info.split_chann_commis = unpacker.GetDouble("split_chann_commis");
            info.split_divi_commis = unpacker.GetDouble("split_divi_commis");
            info.split_other_commis = unpacker.GetDouble("split_other_commis");
            info.stock_type = unpacker.GetInt("stock_type");
            info.trade_code_no = unpacker.GetInt("trade_code_no");
            info.target_code_no = unpacker.GetInt("target_code_no");
            info.capit_reback_days = unpacker.GetInt("capit_reback_days");
            info.posi_reback_days = unpacker.GetInt("posi_reback_days");
            info.net_price_flag = unpacker.GetInt("net_price_flag");
            info.intrst_days = unpacker.GetInt("intrst_days");
            info.par_value = unpacker.GetDouble("par_value");
            info.bond_accr_intrst = unpacker.GetDouble("bond_accr_intrst");
            info.impawn_ratio = unpacker.GetDouble("impawn_ratio");
            info.clear_entry_type = unpacker.GetInt("clear_entry_type");
            info.busi_flag = unpacker.GetInt("busi_flag");
            info.deal_flag = unpacker.GetInt("deal_flag");
            clsecuL_2_13_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_2_13_InfoList.Add((clsecuL_2_13_Info)info);
        }
        #endregion

        //逻辑_清算证券_清算_查询合并清算记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new clsecuL_2_13_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.exch_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_RATE_FLOAT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.strike_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT);
                    info.strike_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_TIME_INT);
                    info.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                    info.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                    info.report_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_TIME_INT);
                    info.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    info.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    info.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                    info.order_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_NO_INT);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    info.strike_num = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NUM_INT);
                    info.strike_aver_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AVER_PRICE_FLOAT);
                    info.pre_entry_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ENTRY_QTY_FLOAT);
                    info.pre_entry_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ENTRY_AMT_FLOAT);
                    info.split_strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SPLIT_STRIKE_QTY_FLOAT);
                    info.split_strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SPLIT_STRIKE_AMT_FLOAT);
                    info.split_stamp_tax = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SPLIT_STAMP_TAX_FLOAT);
                    info.split_trans_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SPLIT_TRANS_FEE_FLOAT);
                    info.split_brkage = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SPLIT_BRKAGE_FLOAT);
                    info.split_SEC_charges = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SPLIT_SEC_CHARGES_FLOAT);
                    info.split_other_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SPLIT_OTHER_FEE_FLOAT);
                    info.split_brkage_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SPLIT_BRKAGE_COMMIS_FLOAT);
                    info.split_chann_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SPLIT_CHANN_COMMIS_FLOAT);
                    info.split_divi_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SPLIT_DIVI_COMMIS_FLOAT);
                    info.split_other_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SPLIT_OTHER_COMMIS_FLOAT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.trade_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_NO_INT);
                    info.target_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_NO_INT);
                    info.capit_reback_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CAPIT_REBACK_DAYS_INT);
                    info.posi_reback_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_POSI_REBACK_DAYS_INT);
                    info.net_price_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLAG_INT);
                    info.intrst_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_DAYS_INT);
                    info.par_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_FLOAT);
                    info.bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT);
                    info.impawn_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_IMPAWN_RATIO_FLOAT);
                    info.clear_entry_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLEAR_ENTRY_TYPE_INT);
                    info.busi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT);
                    info.deal_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_FLAG_INT);
                    clsecuL_2_13_InfoList.Add(info);
                }
            }
        }
    }

    public class clsecuL_2_15_Response : IResponse
    {
        #region 构造函数
        public clsecuL_2_15_Response()
        {
            this.clsecuL_2_15_InfoList = new ObservableCollection<clsecuL_2_15_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_2_15_Info> clsecuL_2_15_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_2_15_Info info = new clsecuL_2_15_Info();
            info.record_count = unpacker.GetInt("record_count");
            info.deal_info = unpacker.GetStr("deal_info");
            info.row_id = unpacker.GetInt64("row_id");
            clsecuL_2_15_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_2_15_InfoList.Add((clsecuL_2_15_Info)info);
        }
        #endregion

        //逻辑_清算证券_清算_合并清算处理
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new clsecuL_2_15_Info();
                info.record_count = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RECORD_COUNT_INT);
                info.deal_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_INFO_STR);
                info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                clsecuL_2_15_InfoList.Add(info);
            }
        }
    }

    public class clsecuL_2_23_Response : IResponse
    {
        #region 构造函数
        public clsecuL_2_23_Response()
        {
            this.clsecuL_2_23_InfoList = new ObservableCollection<clsecuL_2_23_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_2_23_Info> clsecuL_2_23_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_2_23_Info info = new clsecuL_2_23_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_rate = unpacker.GetDouble("exch_rate");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.strike_date = unpacker.GetInt("strike_date");
            info.strike_time = unpacker.GetInt("strike_time");
            info.strike_no = unpacker.GetStr("strike_no");
            info.report_date = unpacker.GetInt("report_date");
            info.report_time = unpacker.GetInt("report_time");
            info.report_no = unpacker.GetStr("report_no");
            info.order_date = unpacker.GetInt("order_date");
            info.order_time = unpacker.GetInt("order_time");
            info.order_no = unpacker.GetInt("order_no");
            info.order_dir = unpacker.GetInt("order_dir");
            info.order_price = unpacker.GetDouble("order_price");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.strike_price = unpacker.GetDouble("strike_price");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.strike_num = unpacker.GetInt("strike_num");
            info.pre_entry_qty = unpacker.GetDouble("pre_entry_qty");
            info.pre_entry_amt = unpacker.GetDouble("pre_entry_amt");
            info.all_fee = unpacker.GetDouble("all_fee");
            info.stamp_tax = unpacker.GetDouble("stamp_tax");
            info.trans_fee = unpacker.GetDouble("trans_fee");
            info.brkage_fee = unpacker.GetDouble("brkage_fee");
            info.SEC_charges = unpacker.GetDouble("SEC_charges");
            info.other_fee = unpacker.GetDouble("other_fee");
            info.trade_commis = unpacker.GetDouble("trade_commis");
            info.other_commis = unpacker.GetDouble("other_commis");
            info.busi_flag = unpacker.GetInt("busi_flag");
            info.entry_status = unpacker.GetStr("entry_status");
            info.undo_status = unpacker.GetStr("undo_status");
            info.busi_jour_no = unpacker.GetInt64("busi_jour_no");
            info.entry_money_jour_no = unpacker.GetInt64("entry_money_jour_no");
            info.stock_type = unpacker.GetInt("stock_type");
            info.trade_code_no = unpacker.GetInt("trade_code_no");
            info.target_code_no = unpacker.GetInt("target_code_no");
            info.intrst_days = unpacker.GetInt("intrst_days");
            info.bond_accr_intrst = unpacker.GetDouble("bond_accr_intrst");
            info.impawn_ratio = unpacker.GetDouble("impawn_ratio");
            clsecuL_2_23_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_2_23_InfoList.Add((clsecuL_2_23_Info)info);
        }
        #endregion

        //逻辑_清算证券_清算_查询待入账记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new clsecuL_2_23_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_RATE_FLOAT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.strike_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT);
                    info.strike_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_TIME_INT);
                    info.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                    info.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                    info.report_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_TIME_INT);
                    info.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    info.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    info.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                    info.order_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_NO_INT);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    info.strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_PRICE_FLOAT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    info.strike_num = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NUM_INT);
                    info.pre_entry_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ENTRY_QTY_FLOAT);
                    info.pre_entry_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ENTRY_AMT_FLOAT);
                    info.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                    info.stamp_tax = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STAMP_TAX_FLOAT);
                    info.trans_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_FEE_FLOAT);
                    info.brkage_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BRKAGE_FEE_FLOAT);
                    info.SEC_charges = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SEC_CHARGES_FLOAT);
                    info.other_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_FEE_FLOAT);
                    info.trade_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_COMMIS_FLOAT);
                    info.other_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_COMMIS_FLOAT);
                    info.busi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT);
                    info.entry_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_STATUS_STR);
                    info.undo_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_UNDO_STATUS_STR);
                    info.busi_jour_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_JOUR_NO_INT64);
                    info.entry_money_jour_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_MONEY_JOUR_NO_INT64);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.trade_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_NO_INT);
                    info.target_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_NO_INT);
                    info.intrst_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_DAYS_INT);
                    info.bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT);
                    info.impawn_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_IMPAWN_RATIO_FLOAT);
                    clsecuL_2_23_InfoList.Add(info);
                }
            }
        }
    }

    public class clsecuL_2_24_Response : IResponse
    {
        #region 构造函数
        public clsecuL_2_24_Response()
        {
            this.clsecuL_2_24_InfoList = new ObservableCollection<clsecuL_2_24_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_2_24_Info> clsecuL_2_24_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_2_24_Info info = new clsecuL_2_24_Info();
            info.record_count = unpacker.GetInt("record_count");
            info.row_id = unpacker.GetInt64("row_id");
            clsecuL_2_24_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_2_24_InfoList.Add((clsecuL_2_24_Info)info);
        }
        #endregion

        //逻辑_清算证券_清算_入账处理
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new clsecuL_2_24_Info();
                info.record_count = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RECORD_COUNT_INT);
                info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                clsecuL_2_24_InfoList.Add(info);
            }
        }
    }

    public class clsecuL_2_25_Response : IResponse
    {
        #region 构造函数
        public clsecuL_2_25_Response()
        {
            this.clsecuL_2_25_InfoList = new ObservableCollection<clsecuL_2_25_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_2_25_Info> clsecuL_2_25_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_2_25_Info info = new clsecuL_2_25_Info();
            clsecuL_2_25_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_2_25_InfoList.Add((clsecuL_2_25_Info)info);
        }
        #endregion

        //逻辑_清算证券_清算_入账回滚处理
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new clsecuL_2_25_Info();
                clsecuL_2_25_InfoList.Add(info);
            }
        }
    }

    public class clsecuL_2_151_Response : IResponse
    {
        #region 构造函数
        public clsecuL_2_151_Response()
        {
            this.clsecuL_2_151_InfoList = new ObservableCollection<clsecuL_2_151_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_2_151_Info> clsecuL_2_151_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_2_151_Info info = new clsecuL_2_151_Info();
            info.task_strike_status = unpacker.GetStr("task_strike_status");
            info.qry_no = unpacker.GetInt("qry_no");
            clsecuL_2_151_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_2_151_InfoList.Add((clsecuL_2_151_Info)info);
        }
        #endregion

        //逻辑_清算证券_清算_成交转入定时任务
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new clsecuL_2_151_Info();
                info.task_strike_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STRIKE_STATUS_STR);
                info.qry_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_NO_INT);
                clsecuL_2_151_InfoList.Add(info);
            }
        }
    }

    public class clsecuL_2_153_Response : IResponse
    {
        #region 构造函数
        public clsecuL_2_153_Response()
        {
            this.clsecuL_2_153_InfoList = new ObservableCollection<clsecuL_2_153_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_2_153_Info> clsecuL_2_153_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_2_153_Info info = new clsecuL_2_153_Info();
            info.task_strike_status = unpacker.GetStr("task_strike_status");
            info.qry_no = unpacker.GetInt("qry_no");
            clsecuL_2_153_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_2_153_InfoList.Add((clsecuL_2_153_Info)info);
        }
        #endregion

        //逻辑_清算证券_清算_清算处理定时任务
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new clsecuL_2_153_Info();
                info.task_strike_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STRIKE_STATUS_STR);
                info.qry_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_NO_INT);
                clsecuL_2_153_InfoList.Add(info);
            }
        }
    }

    public class clsecuL_2_154_Response : IResponse
    {
        #region 构造函数
        public clsecuL_2_154_Response()
        {
            this.clsecuL_2_154_InfoList = new ObservableCollection<clsecuL_2_154_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_2_154_Info> clsecuL_2_154_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_2_154_Info info = new clsecuL_2_154_Info();
            info.task_strike_status = unpacker.GetStr("task_strike_status");
            clsecuL_2_154_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_2_154_InfoList.Add((clsecuL_2_154_Info)info);
        }
        #endregion

        //逻辑_清算证券_清算_入账处理定时任务
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new clsecuL_2_154_Info();
                info.task_strike_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STRIKE_STATUS_STR);
                clsecuL_2_154_InfoList.Add(info);
            }
        }
    }

    public class clsecuL_2_201_Response : IResponse
    {
        #region 构造函数
        public clsecuL_2_201_Response()
        {
            this.clsecuL_2_201_InfoList = new ObservableCollection<clsecuL_2_201_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_2_201_Info> clsecuL_2_201_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_2_201_Info info = new clsecuL_2_201_Info();
            clsecuL_2_201_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_2_201_InfoList.Add((clsecuL_2_201_Info)info);
        }
        #endregion

        //逻辑_清算证券_清算_数据统计
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new clsecuL_2_201_Info();
                clsecuL_2_201_InfoList.Add(info);
            }
        }
    }

    public class clsecuL_2_202_Response : IResponse
    {
        #region 构造函数
        public clsecuL_2_202_Response()
        {
            this.clsecuL_2_202_InfoList = new ObservableCollection<clsecuL_2_202_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_2_202_Info> clsecuL_2_202_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_2_202_Info info = new clsecuL_2_202_Info();
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
            info.clear_num = unpacker.GetInt("clear_num");
            info.order_dir = unpacker.GetInt("order_dir");
            info.strike_num = unpacker.GetInt("strike_num");
            info.strike_aver_price = unpacker.GetDouble("strike_aver_price");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.entry_qty = unpacker.GetDouble("entry_qty");
            info.entry_amt = unpacker.GetDouble("entry_amt");
            info.all_fee = unpacker.GetDouble("all_fee");
            info.stamp_tax = unpacker.GetDouble("stamp_tax");
            info.trans_fee = unpacker.GetDouble("trans_fee");
            info.brkage_fee = unpacker.GetDouble("brkage_fee");
            info.SEC_charges = unpacker.GetDouble("SEC_charges");
            info.other_fee = unpacker.GetDouble("other_fee");
            info.trade_commis = unpacker.GetDouble("trade_commis");
            info.chann_commis = unpacker.GetDouble("chann_commis");
            info.divi_commis = unpacker.GetDouble("divi_commis");
            info.other_commis = unpacker.GetDouble("other_commis");
            clsecuL_2_202_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_2_202_InfoList.Add((clsecuL_2_202_Info)info);
        }
        #endregion

        //逻辑_清算证券_清算_查询统计数据
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new clsecuL_2_202_Info();
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
                    info.clear_num = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLEAR_NUM_INT);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.strike_num = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NUM_INT);
                    info.strike_aver_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AVER_PRICE_FLOAT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    info.entry_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_QTY_FLOAT);
                    info.entry_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_AMT_FLOAT);
                    info.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                    info.stamp_tax = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STAMP_TAX_FLOAT);
                    info.trans_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_FEE_FLOAT);
                    info.brkage_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BRKAGE_FEE_FLOAT);
                    info.SEC_charges = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SEC_CHARGES_FLOAT);
                    info.other_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_FEE_FLOAT);
                    info.trade_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_COMMIS_FLOAT);
                    info.chann_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CHANN_COMMIS_FLOAT);
                    info.divi_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DIVI_COMMIS_FLOAT);
                    info.other_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_COMMIS_FLOAT);
                    clsecuL_2_202_InfoList.Add(info);
                }
            }
        }
    }

    public class clsecuL_2_203_Response : IResponse
    {
        #region 构造函数
        public clsecuL_2_203_Response()
        {
            this.clsecuL_2_203_InfoList = new ObservableCollection<clsecuL_2_203_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_2_203_Info> clsecuL_2_203_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_2_203_Info info = new clsecuL_2_203_Info();
            info.pre_switch_strike_qty = unpacker.GetDouble("pre_switch_strike_qty");
            info.alr_switch_strike_qty = unpacker.GetDouble("alr_switch_strike_qty");
            info.pre_clr_strike_qty = unpacker.GetDouble("pre_clr_strike_qty");
            info.alr_clr_strike_qty = unpacker.GetDouble("alr_clr_strike_qty");
            info.pre_entry_record_qty = unpacker.GetDouble("pre_entry_record_qty");
            info.alr_entry_record_qty = unpacker.GetDouble("alr_entry_record_qty");
            clsecuL_2_203_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_2_203_InfoList.Add((clsecuL_2_203_Info)info);
        }
        #endregion

        //逻辑_清算证券_清算_获取汇总统计值
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new clsecuL_2_203_Info();
                info.pre_switch_strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SWITCH_STRIKE_QTY_FLOAT);
                info.alr_switch_strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALR_SWITCH_STRIKE_QTY_FLOAT);
                info.pre_clr_strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_CLR_STRIKE_QTY_FLOAT);
                info.alr_clr_strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALR_CLR_STRIKE_QTY_FLOAT);
                info.pre_entry_record_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ENTRY_RECORD_QTY_FLOAT);
                info.alr_entry_record_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALR_ENTRY_RECORD_QTY_FLOAT);
                clsecuL_2_203_InfoList.Add(info);
            }
        }
    }

    public class clsecuL_2_204_Response : IResponse
    {
        #region 构造函数
        public clsecuL_2_204_Response()
        {
            this.clsecuL_2_204_InfoList = new ObservableCollection<clsecuL_2_204_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_2_204_Info> clsecuL_2_204_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_2_204_Info info = new clsecuL_2_204_Info();
            info.row_id = unpacker.GetInt64("row_id");
            clsecuL_2_204_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_2_204_InfoList.Add((clsecuL_2_204_Info)info);
        }
        #endregion

        //逻辑_清算证券_清算_查询成交记录序号
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new clsecuL_2_204_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    clsecuL_2_204_InfoList.Add(info);
                }
            }
        }
    }

    public class clsecuL_2_205_Response : IResponse
    {
        #region 构造函数
        public clsecuL_2_205_Response()
        {
            this.clsecuL_2_205_InfoList = new ObservableCollection<clsecuL_2_205_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_2_205_Info> clsecuL_2_205_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_2_205_Info info = new clsecuL_2_205_Info();
            info.row_id = unpacker.GetInt64("row_id");
            clsecuL_2_205_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_2_205_InfoList.Add((clsecuL_2_205_Info)info);
        }
        #endregion

        //逻辑_清算证券_清算_查询清算成交记录序号
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new clsecuL_2_205_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    clsecuL_2_205_InfoList.Add(info);
                }
            }
        }
    }

    public class clsecuL_2_206_Response : IResponse
    {
        #region 构造函数
        public clsecuL_2_206_Response()
        {
            this.clsecuL_2_206_InfoList = new ObservableCollection<clsecuL_2_206_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_2_206_Info> clsecuL_2_206_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_2_206_Info info = new clsecuL_2_206_Info();
            info.row_id = unpacker.GetInt64("row_id");
            clsecuL_2_206_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_2_206_InfoList.Add((clsecuL_2_206_Info)info);
        }
        #endregion

        //逻辑_清算证券_清算_查询合并清算记录序号
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new clsecuL_2_206_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    clsecuL_2_206_InfoList.Add(info);
                }
            }
        }
    }

    public class clsecuL_2_207_Response : IResponse
    {
        #region 构造函数
        public clsecuL_2_207_Response()
        {
            this.clsecuL_2_207_InfoList = new ObservableCollection<clsecuL_2_207_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_2_207_Info> clsecuL_2_207_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_2_207_Info info = new clsecuL_2_207_Info();
            info.row_id = unpacker.GetInt64("row_id");
            clsecuL_2_207_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_2_207_InfoList.Add((clsecuL_2_207_Info)info);
        }
        #endregion

        //逻辑_清算证券_清算_查询待入账记录序号
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new clsecuL_2_207_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    clsecuL_2_207_InfoList.Add(info);
                }
            }
        }
    }

    public class clsecuL_2_208_Response : IResponse
    {
        #region 构造函数
        public clsecuL_2_208_Response()
        {
            this.clsecuL_2_208_InfoList = new ObservableCollection<clsecuL_2_208_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_2_208_Info> clsecuL_2_208_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_2_208_Info info = new clsecuL_2_208_Info();
            clsecuL_2_208_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_2_208_InfoList.Add((clsecuL_2_208_Info)info);
        }
        #endregion

        //逻辑_清算证券_清算_A股入账前检查
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new clsecuL_2_208_Info();
                clsecuL_2_208_InfoList.Add(info);
            }
        }
    }

    public class clsecuL_2_209_Response : IResponse
    {
        #region 构造函数
        public clsecuL_2_209_Response()
        {
            this.clsecuL_2_209_InfoList = new ObservableCollection<clsecuL_2_209_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_2_209_Info> clsecuL_2_209_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_2_209_Info info = new clsecuL_2_209_Info();
            info.record_count = unpacker.GetInt("record_count");
            info.deal_info = unpacker.GetStr("deal_info");
            info.row_id = unpacker.GetInt64("row_id");
            clsecuL_2_209_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_2_209_InfoList.Add((clsecuL_2_209_Info)info);
        }
        #endregion

        //逻辑_清算证券_清算_批量转入成交记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new clsecuL_2_209_Info();
                info.record_count = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RECORD_COUNT_INT);
                info.deal_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_INFO_STR);
                info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                clsecuL_2_209_InfoList.Add(info);
            }
        }
    }

}
