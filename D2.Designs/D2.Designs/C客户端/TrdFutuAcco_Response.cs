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
    public class tdfutuL_2_1_Response : IResponse
    {
        #region 构造函数
        public tdfutuL_2_1_Response()
        {
            this.tdfutuL_2_1_InfoList = new ObservableCollection<tdfutuL_2_1_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdfutuL_2_1_Info> tdfutuL_2_1_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdfutuL_2_1_Info info = new tdfutuL_2_1_Info();
            info.comm_avail_amt = unpacker.GetDouble("comm_avail_amt");
            info.trade_avail_amt = unpacker.GetDouble("trade_avail_amt");
            info.static_avail_amt = unpacker.GetDouble("static_avail_amt");
            tdfutuL_2_1_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdfutuL_2_1_InfoList.Add((tdfutuL_2_1_Info)info);
        }
        #endregion

        //逻辑_交易期货_账户_计算交易组资金可用
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdfutuL_2_1_Info();
                info.comm_avail_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_AVAIL_AMT_FLOAT);
                info.trade_avail_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_AVAIL_AMT_FLOAT);
                info.static_avail_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STATIC_AVAIL_AMT_FLOAT);
                tdfutuL_2_1_InfoList.Add(info);
            }
        }
    }

    public class tdfutuL_2_2_Response : IResponse
    {
        #region 构造函数
        public tdfutuL_2_2_Response()
        {
            this.tdfutuL_2_2_InfoList = new ObservableCollection<tdfutuL_2_2_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdfutuL_2_2_Info> tdfutuL_2_2_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdfutuL_2_2_Info info = new tdfutuL_2_2_Info();
            info.comm_avail_amt = unpacker.GetDouble("comm_avail_amt");
            info.trade_avail_amt = unpacker.GetDouble("trade_avail_amt");
            info.static_avail_amt = unpacker.GetDouble("static_avail_amt");
            tdfutuL_2_2_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdfutuL_2_2_InfoList.Add((tdfutuL_2_2_Info)info);
        }
        #endregion

        //逻辑_交易期货_账户_计算资产账户资金可用
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdfutuL_2_2_Info();
                info.comm_avail_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_AVAIL_AMT_FLOAT);
                info.trade_avail_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_AVAIL_AMT_FLOAT);
                info.static_avail_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STATIC_AVAIL_AMT_FLOAT);
                tdfutuL_2_2_InfoList.Add(info);
            }
        }
    }

    public class tdfutuL_2_3_Response : IResponse
    {
        #region 构造函数
        public tdfutuL_2_3_Response()
        {
            this.tdfutuL_2_3_InfoList = new ObservableCollection<tdfutuL_2_3_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdfutuL_2_3_Info> tdfutuL_2_3_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdfutuL_2_3_Info info = new tdfutuL_2_3_Info();
            info.comm_avail_qty = unpacker.GetDouble("comm_avail_qty");
            info.trade_avail_qty = unpacker.GetDouble("trade_avail_qty");
            info.static_avail_qty = unpacker.GetDouble("static_avail_qty");
            tdfutuL_2_3_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdfutuL_2_3_InfoList.Add((tdfutuL_2_3_Info)info);
        }
        #endregion

        //逻辑_交易期货_账户_计算交易组持仓可用
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdfutuL_2_3_Info();
                info.comm_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_AVAIL_QTY_FLOAT);
                info.trade_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_AVAIL_QTY_FLOAT);
                info.static_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STATIC_AVAIL_QTY_FLOAT);
                tdfutuL_2_3_InfoList.Add(info);
            }
        }
    }

    public class tdfutuL_2_4_Response : IResponse
    {
        #region 构造函数
        public tdfutuL_2_4_Response()
        {
            this.tdfutuL_2_4_InfoList = new ObservableCollection<tdfutuL_2_4_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdfutuL_2_4_Info> tdfutuL_2_4_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdfutuL_2_4_Info info = new tdfutuL_2_4_Info();
            info.comm_avail_qty = unpacker.GetDouble("comm_avail_qty");
            info.trade_avail_qty = unpacker.GetDouble("trade_avail_qty");
            info.static_avail_qty = unpacker.GetDouble("static_avail_qty");
            tdfutuL_2_4_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdfutuL_2_4_InfoList.Add((tdfutuL_2_4_Info)info);
        }
        #endregion

        //逻辑_交易期货_账户_计算资产账户持仓可用
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdfutuL_2_4_Info();
                info.comm_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_AVAIL_QTY_FLOAT);
                info.trade_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_AVAIL_QTY_FLOAT);
                info.static_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STATIC_AVAIL_QTY_FLOAT);
                tdfutuL_2_4_InfoList.Add(info);
            }
        }
    }

    public class tdfutuL_2_5_Response : IResponse
    {
        #region 构造函数
        public tdfutuL_2_5_Response()
        {
            this.tdfutuL_2_5_InfoList = new ObservableCollection<tdfutuL_2_5_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdfutuL_2_5_Info> tdfutuL_2_5_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdfutuL_2_5_Info info = new tdfutuL_2_5_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_crncy_type = unpacker.GetStr("exch_crncy_type");
            info.begin_amt = unpacker.GetDouble("begin_amt");
            info.curr_amt = unpacker.GetDouble("curr_amt");
            info.frozen_amt = unpacker.GetDouble("frozen_amt");
            info.unfroz_amt = unpacker.GetDouble("unfroz_amt");
            info.comm_frozen_amt = unpacker.GetDouble("comm_frozen_amt");
            info.comm_unfroz_amt = unpacker.GetDouble("comm_unfroz_amt");
            info.comm_capt_amt = unpacker.GetDouble("comm_capt_amt");
            info.comm_releas_amt = unpacker.GetDouble("comm_releas_amt");
            info.trade_capt_amt = unpacker.GetDouble("trade_capt_amt");
            info.trade_releas_amt = unpacker.GetDouble("trade_releas_amt");
            info.strike_capt_amt = unpacker.GetDouble("strike_capt_amt");
            info.strike_releas_amt = unpacker.GetDouble("strike_releas_amt");
            info.capt_margin = unpacker.GetDouble("capt_margin");
            info.trade_fee = unpacker.GetDouble("trade_fee");
            info.strike_fee = unpacker.GetDouble("strike_fee");
            info.close_pandl = unpacker.GetDouble("close_pandl");
            info.marked_pandl = unpacker.GetDouble("marked_pandl");
            info.update_times = unpacker.GetInt("update_times");
            tdfutuL_2_5_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdfutuL_2_5_InfoList.Add((tdfutuL_2_5_Info)info);
        }
        #endregion

        //逻辑_交易期货_账户_查询交易组资金
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdfutuL_2_5_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR);
                    info.begin_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_AMT_FLOAT);
                    info.curr_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_AMT_FLOAT);
                    info.frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_AMT_FLOAT);
                    info.unfroz_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_AMT_FLOAT);
                    info.comm_frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_FROZEN_AMT_FLOAT);
                    info.comm_unfroz_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_UNFROZ_AMT_FLOAT);
                    info.comm_capt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_CAPT_AMT_FLOAT);
                    info.comm_releas_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_RELEAS_AMT_FLOAT);
                    info.trade_capt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CAPT_AMT_FLOAT);
                    info.trade_releas_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_RELEAS_AMT_FLOAT);
                    info.strike_capt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_CAPT_AMT_FLOAT);
                    info.strike_releas_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_AMT_FLOAT);
                    info.capt_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CAPT_MARGIN_FLOAT);
                    info.trade_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_FEE_FLOAT);
                    info.strike_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_FEE_FLOAT);
                    info.close_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_PANDL_FLOAT);
                    info.marked_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKED_PANDL_FLOAT);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdfutuL_2_5_InfoList.Add(info);
                }
            }
        }
    }

    public class tdfutuL_2_6_Response : IResponse
    {
        #region 构造函数
        public tdfutuL_2_6_Response()
        {
            this.tdfutuL_2_6_InfoList = new ObservableCollection<tdfutuL_2_6_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdfutuL_2_6_Info> tdfutuL_2_6_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdfutuL_2_6_Info info = new tdfutuL_2_6_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_crncy_type = unpacker.GetStr("exch_crncy_type");
            info.begin_amt = unpacker.GetDouble("begin_amt");
            info.curr_amt = unpacker.GetDouble("curr_amt");
            info.frozen_amt = unpacker.GetDouble("frozen_amt");
            info.unfroz_amt = unpacker.GetDouble("unfroz_amt");
            info.comm_frozen_amt = unpacker.GetDouble("comm_frozen_amt");
            info.comm_unfroz_amt = unpacker.GetDouble("comm_unfroz_amt");
            info.comm_capt_amt = unpacker.GetDouble("comm_capt_amt");
            info.comm_releas_amt = unpacker.GetDouble("comm_releas_amt");
            info.trade_capt_amt = unpacker.GetDouble("trade_capt_amt");
            info.trade_releas_amt = unpacker.GetDouble("trade_releas_amt");
            info.strike_capt_amt = unpacker.GetDouble("strike_capt_amt");
            info.strike_releas_amt = unpacker.GetDouble("strike_releas_amt");
            info.capt_margin = unpacker.GetDouble("capt_margin");
            info.trade_fee = unpacker.GetDouble("trade_fee");
            info.strike_fee = unpacker.GetDouble("strike_fee");
            info.close_pandl = unpacker.GetDouble("close_pandl");
            info.marked_pandl = unpacker.GetDouble("marked_pandl");
            info.update_times = unpacker.GetInt("update_times");
            tdfutuL_2_6_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdfutuL_2_6_InfoList.Add((tdfutuL_2_6_Info)info);
        }
        #endregion

        //逻辑_交易期货_账户_查询资产账户资金
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdfutuL_2_6_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR);
                    info.begin_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_AMT_FLOAT);
                    info.curr_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_AMT_FLOAT);
                    info.frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_AMT_FLOAT);
                    info.unfroz_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_AMT_FLOAT);
                    info.comm_frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_FROZEN_AMT_FLOAT);
                    info.comm_unfroz_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_UNFROZ_AMT_FLOAT);
                    info.comm_capt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_CAPT_AMT_FLOAT);
                    info.comm_releas_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_RELEAS_AMT_FLOAT);
                    info.trade_capt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CAPT_AMT_FLOAT);
                    info.trade_releas_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_RELEAS_AMT_FLOAT);
                    info.strike_capt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_CAPT_AMT_FLOAT);
                    info.strike_releas_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_AMT_FLOAT);
                    info.capt_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CAPT_MARGIN_FLOAT);
                    info.trade_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_FEE_FLOAT);
                    info.strike_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_FEE_FLOAT);
                    info.close_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_PANDL_FLOAT);
                    info.marked_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKED_PANDL_FLOAT);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdfutuL_2_6_InfoList.Add(info);
                }
            }
        }
    }

    public class tdfutuL_2_7_Response : IResponse
    {
        #region 构造函数
        public tdfutuL_2_7_Response()
        {
            this.tdfutuL_2_7_InfoList = new ObservableCollection<tdfutuL_2_7_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdfutuL_2_7_Info> tdfutuL_2_7_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdfutuL_2_7_Info info = new tdfutuL_2_7_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_crncy_type = unpacker.GetStr("exch_crncy_type");
            info.exch_no = unpacker.GetInt("exch_no");
            info.futu_acco_no = unpacker.GetInt("futu_acco_no");
            info.contrc_code_no = unpacker.GetInt("contrc_code_no");
            info.contrc_type = unpacker.GetInt("contrc_type");
            info.contrc_unit = unpacker.GetInt("contrc_unit");
            info.lngsht_type = unpacker.GetInt("lngsht_type");
            info.hedge_type = unpacker.GetInt("hedge_type");
            info.comb_code = unpacker.GetStr("comb_code");
            info.frozen_qty = unpacker.GetDouble("frozen_qty");
            info.unfroz_qty = unpacker.GetDouble("unfroz_qty");
            info.comm_releas_qty = unpacker.GetDouble("comm_releas_qty");
            info.trade_releas_qty = unpacker.GetDouble("trade_releas_qty");
            info.strike_releas_qty = unpacker.GetDouble("strike_releas_qty");
            info.pre_comm_capt_qty = unpacker.GetDouble("pre_comm_capt_qty");
            info.today_comm_capt_qty = unpacker.GetDouble("today_comm_capt_qty");
            info.old_trade_capt_qty = unpacker.GetDouble("old_trade_capt_qty");
            info.today_trade_capt_qty = unpacker.GetDouble("today_trade_capt_qty");
            info.pre_strike_capt_qty = unpacker.GetDouble("pre_strike_capt_qty");
            info.today_strike_capt_qty = unpacker.GetDouble("today_strike_capt_qty");
            info.rece_margin = unpacker.GetDouble("rece_margin");
            info.pre_settle_price = unpacker.GetDouble("pre_settle_price");
            info.realize_pandl = unpacker.GetDouble("realize_pandl");
            info.open_amount = unpacker.GetDouble("open_amount");
            info.update_times = unpacker.GetInt("update_times");
            tdfutuL_2_7_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdfutuL_2_7_InfoList.Add((tdfutuL_2_7_Info)info);
        }
        #endregion

        //逻辑_交易期货_账户_查询交易组持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdfutuL_2_7_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.futu_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT);
                    info.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    info.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    info.contrc_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_UNIT_INT);
                    info.lngsht_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT);
                    info.hedge_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT);
                    info.comb_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMB_CODE_STR);
                    info.frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_QTY_FLOAT);
                    info.unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_QTY_FLOAT);
                    info.comm_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_RELEAS_QTY_FLOAT);
                    info.trade_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_RELEAS_QTY_FLOAT);
                    info.strike_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_QTY_FLOAT);
                    info.pre_comm_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_COMM_CAPT_QTY_FLOAT);
                    info.today_comm_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_COMM_CAPT_QTY_FLOAT);
                    info.old_trade_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OLD_TRADE_CAPT_QTY_FLOAT);
                    info.today_trade_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_TRADE_CAPT_QTY_FLOAT);
                    info.pre_strike_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_STRIKE_CAPT_QTY_FLOAT);
                    info.today_strike_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_STRIKE_CAPT_QTY_FLOAT);
                    info.rece_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RECE_MARGIN_FLOAT);
                    info.pre_settle_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SETTLE_PRICE_FLOAT);
                    info.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    info.open_amount = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_AMOUNT_FLOAT);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdfutuL_2_7_InfoList.Add(info);
                }
            }
        }
    }

    public class tdfutuL_2_8_Response : IResponse
    {
        #region 构造函数
        public tdfutuL_2_8_Response()
        {
            this.tdfutuL_2_8_InfoList = new ObservableCollection<tdfutuL_2_8_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdfutuL_2_8_Info> tdfutuL_2_8_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdfutuL_2_8_Info info = new tdfutuL_2_8_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_crncy_type = unpacker.GetStr("exch_crncy_type");
            info.exch_no = unpacker.GetInt("exch_no");
            info.futu_acco_no = unpacker.GetInt("futu_acco_no");
            info.contrc_code_no = unpacker.GetInt("contrc_code_no");
            info.contrc_type = unpacker.GetInt("contrc_type");
            info.contrc_unit = unpacker.GetInt("contrc_unit");
            info.lngsht_type = unpacker.GetInt("lngsht_type");
            info.hedge_type = unpacker.GetInt("hedge_type");
            info.comb_code = unpacker.GetStr("comb_code");
            info.frozen_qty = unpacker.GetDouble("frozen_qty");
            info.unfroz_qty = unpacker.GetDouble("unfroz_qty");
            info.trade_releas_qty = unpacker.GetDouble("trade_releas_qty");
            info.strike_releas_qty = unpacker.GetDouble("strike_releas_qty");
            info.old_trade_capt_qty = unpacker.GetDouble("old_trade_capt_qty");
            info.today_trade_capt_qty = unpacker.GetDouble("today_trade_capt_qty");
            info.pre_strike_capt_qty = unpacker.GetDouble("pre_strike_capt_qty");
            info.today_strike_capt_qty = unpacker.GetDouble("today_strike_capt_qty");
            info.rece_margin = unpacker.GetDouble("rece_margin");
            info.pre_settle_price = unpacker.GetDouble("pre_settle_price");
            info.open_amount = unpacker.GetDouble("open_amount");
            info.update_times = unpacker.GetInt("update_times");
            tdfutuL_2_8_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdfutuL_2_8_InfoList.Add((tdfutuL_2_8_Info)info);
        }
        #endregion

        //逻辑_交易期货_账户_查询资产账户持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdfutuL_2_8_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.futu_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT);
                    info.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    info.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    info.contrc_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_UNIT_INT);
                    info.lngsht_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT);
                    info.hedge_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT);
                    info.comb_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMB_CODE_STR);
                    info.frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_QTY_FLOAT);
                    info.unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_QTY_FLOAT);
                    info.trade_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_RELEAS_QTY_FLOAT);
                    info.strike_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_QTY_FLOAT);
                    info.old_trade_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OLD_TRADE_CAPT_QTY_FLOAT);
                    info.today_trade_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_TRADE_CAPT_QTY_FLOAT);
                    info.pre_strike_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_STRIKE_CAPT_QTY_FLOAT);
                    info.today_strike_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_STRIKE_CAPT_QTY_FLOAT);
                    info.rece_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RECE_MARGIN_FLOAT);
                    info.pre_settle_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SETTLE_PRICE_FLOAT);
                    info.open_amount = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_AMOUNT_FLOAT);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdfutuL_2_8_InfoList.Add(info);
                }
            }
        }
    }

    public class tdfutuL_2_9_Response : IResponse
    {
        #region 构造函数
        public tdfutuL_2_9_Response()
        {
            this.tdfutuL_2_9_InfoList = new ObservableCollection<tdfutuL_2_9_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdfutuL_2_9_Info> tdfutuL_2_9_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdfutuL_2_9_Info info = new tdfutuL_2_9_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.detail_posi_id = unpacker.GetInt64("detail_posi_id");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.futu_acco_no = unpacker.GetInt("futu_acco_no");
            info.contrc_code_no = unpacker.GetInt("contrc_code_no");
            info.contrc_type = unpacker.GetInt("contrc_type");
            info.invest_type = unpacker.GetInt("invest_type");
            info.lngsht_type = unpacker.GetInt("lngsht_type");
            info.hedge_type = unpacker.GetInt("hedge_type");
            info.open_posi_date = unpacker.GetInt("open_posi_date");
            info.open_posi_time = unpacker.GetInt("open_posi_time");
            info.strike_no = unpacker.GetStr("strike_no");
            info.open_posi_price = unpacker.GetDouble("open_posi_price");
            info.open_posi_qty = unpacker.GetDouble("open_posi_qty");
            info.open_amount = unpacker.GetDouble("open_amount");
            info.trade_capt_qty = unpacker.GetDouble("trade_capt_qty");
            info.strike_capt_qty = unpacker.GetDouble("strike_capt_qty");
            info.open_posi_fee = unpacker.GetDouble("open_posi_fee");
            info.close_posi_fee = unpacker.GetDouble("close_posi_fee");
            info.marked_sett_price = unpacker.GetDouble("marked_sett_price");
            info.marked_pandl = unpacker.GetDouble("marked_pandl");
            info.close_pandl = unpacker.GetDouble("close_pandl");
            info.rece_margin = unpacker.GetDouble("rece_margin");
            info.update_times = unpacker.GetInt("update_times");
            tdfutuL_2_9_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdfutuL_2_9_InfoList.Add((tdfutuL_2_9_Info)info);
        }
        #endregion

        //逻辑_交易期货_账户_查询交易组持仓明细
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdfutuL_2_9_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.detail_posi_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_DETAIL_POSI_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.futu_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT);
                    info.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    info.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    info.invest_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INVEST_TYPE_INT);
                    info.lngsht_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT);
                    info.hedge_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT);
                    info.open_posi_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_DATE_INT);
                    info.open_posi_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_TIME_INT);
                    info.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                    info.open_posi_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_PRICE_FLOAT);
                    info.open_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_QTY_FLOAT);
                    info.open_amount = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_AMOUNT_FLOAT);
                    info.trade_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CAPT_QTY_FLOAT);
                    info.strike_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_CAPT_QTY_FLOAT);
                    info.open_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_FEE_FLOAT);
                    info.close_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_FEE_FLOAT);
                    info.marked_sett_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKED_SETT_PRICE_FLOAT);
                    info.marked_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKED_PANDL_FLOAT);
                    info.close_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_PANDL_FLOAT);
                    info.rece_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RECE_MARGIN_FLOAT);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdfutuL_2_9_InfoList.Add(info);
                }
            }
        }
    }

    public class tdfutuL_2_10_Response : IResponse
    {
        #region 构造函数
        public tdfutuL_2_10_Response()
        {
            this.tdfutuL_2_10_InfoList = new ObservableCollection<tdfutuL_2_10_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdfutuL_2_10_Info> tdfutuL_2_10_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdfutuL_2_10_Info info = new tdfutuL_2_10_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_crncy_type = unpacker.GetStr("exch_crncy_type");
            info.begin_amt = unpacker.GetDouble("begin_amt");
            info.curr_amt = unpacker.GetDouble("curr_amt");
            info.frozen_amt = unpacker.GetDouble("frozen_amt");
            info.unfroz_amt = unpacker.GetDouble("unfroz_amt");
            info.comm_frozen_amt = unpacker.GetDouble("comm_frozen_amt");
            info.comm_unfroz_amt = unpacker.GetDouble("comm_unfroz_amt");
            info.comm_capt_amt = unpacker.GetDouble("comm_capt_amt");
            info.comm_releas_amt = unpacker.GetDouble("comm_releas_amt");
            info.trade_capt_amt = unpacker.GetDouble("trade_capt_amt");
            info.trade_releas_amt = unpacker.GetDouble("trade_releas_amt");
            info.strike_capt_amt = unpacker.GetDouble("strike_capt_amt");
            info.strike_releas_amt = unpacker.GetDouble("strike_releas_amt");
            info.capt_margin = unpacker.GetDouble("capt_margin");
            info.trade_fee = unpacker.GetDouble("trade_fee");
            info.strike_fee = unpacker.GetDouble("strike_fee");
            info.close_pandl = unpacker.GetDouble("close_pandl");
            info.marked_pandl = unpacker.GetDouble("marked_pandl");
            info.update_times = unpacker.GetInt("update_times");
            tdfutuL_2_10_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdfutuL_2_10_InfoList.Add((tdfutuL_2_10_Info)info);
        }
        #endregion

        //逻辑_交易期货_账户_查询历史交易组业务资金
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdfutuL_2_10_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR);
                    info.begin_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_AMT_FLOAT);
                    info.curr_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_AMT_FLOAT);
                    info.frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_AMT_FLOAT);
                    info.unfroz_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_AMT_FLOAT);
                    info.comm_frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_FROZEN_AMT_FLOAT);
                    info.comm_unfroz_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_UNFROZ_AMT_FLOAT);
                    info.comm_capt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_CAPT_AMT_FLOAT);
                    info.comm_releas_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_RELEAS_AMT_FLOAT);
                    info.trade_capt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CAPT_AMT_FLOAT);
                    info.trade_releas_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_RELEAS_AMT_FLOAT);
                    info.strike_capt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_CAPT_AMT_FLOAT);
                    info.strike_releas_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_AMT_FLOAT);
                    info.capt_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CAPT_MARGIN_FLOAT);
                    info.trade_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_FEE_FLOAT);
                    info.strike_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_FEE_FLOAT);
                    info.close_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_PANDL_FLOAT);
                    info.marked_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKED_PANDL_FLOAT);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdfutuL_2_10_InfoList.Add(info);
                }
            }
        }
    }

}
