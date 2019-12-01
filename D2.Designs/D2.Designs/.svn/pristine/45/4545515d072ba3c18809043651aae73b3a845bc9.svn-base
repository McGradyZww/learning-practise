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
    public class tdsecuL_2_1_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_2_1_Response()
        {
            this.tdsecuL_2_1_InfoList = new ObservableCollection<tdsecuL_2_1_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_2_1_Info> tdsecuL_2_1_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_2_1_Info info = new tdsecuL_2_1_Info();
            info.comm_avail_amt = unpacker.GetDouble("comm_avail_amt");
            info.trade_avail_amt = unpacker.GetDouble("trade_avail_amt");
            info.static_avail_amt = unpacker.GetDouble("static_avail_amt");
            tdsecuL_2_1_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_2_1_InfoList.Add((tdsecuL_2_1_Info)info);
        }
        #endregion

        //逻辑_交易证券_账户_计算交易组资金可用
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_2_1_Info();
                info.comm_avail_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_AVAIL_AMT_FLOAT);
                info.trade_avail_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_AVAIL_AMT_FLOAT);
                info.static_avail_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STATIC_AVAIL_AMT_FLOAT);
                tdsecuL_2_1_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_2_2_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_2_2_Response()
        {
            this.tdsecuL_2_2_InfoList = new ObservableCollection<tdsecuL_2_2_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_2_2_Info> tdsecuL_2_2_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_2_2_Info info = new tdsecuL_2_2_Info();
            info.comm_avail_amt = unpacker.GetDouble("comm_avail_amt");
            info.trade_avail_amt = unpacker.GetDouble("trade_avail_amt");
            info.static_avail_amt = unpacker.GetDouble("static_avail_amt");
            tdsecuL_2_2_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_2_2_InfoList.Add((tdsecuL_2_2_Info)info);
        }
        #endregion

        //逻辑_交易证券_账户_计算资产账户资金可用
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_2_2_Info();
                info.comm_avail_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_AVAIL_AMT_FLOAT);
                info.trade_avail_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_AVAIL_AMT_FLOAT);
                info.static_avail_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STATIC_AVAIL_AMT_FLOAT);
                tdsecuL_2_2_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_2_3_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_2_3_Response()
        {
            this.tdsecuL_2_3_InfoList = new ObservableCollection<tdsecuL_2_3_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_2_3_Info> tdsecuL_2_3_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_2_3_Info info = new tdsecuL_2_3_Info();
            info.comm_avail_qty = unpacker.GetDouble("comm_avail_qty");
            info.trade_avail_qty = unpacker.GetDouble("trade_avail_qty");
            info.static_avail_qty = unpacker.GetDouble("static_avail_qty");
            tdsecuL_2_3_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_2_3_InfoList.Add((tdsecuL_2_3_Info)info);
        }
        #endregion

        //逻辑_交易证券_账户_计算交易组持仓可用
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_2_3_Info();
                info.comm_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_AVAIL_QTY_FLOAT);
                info.trade_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_AVAIL_QTY_FLOAT);
                info.static_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STATIC_AVAIL_QTY_FLOAT);
                tdsecuL_2_3_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_2_4_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_2_4_Response()
        {
            this.tdsecuL_2_4_InfoList = new ObservableCollection<tdsecuL_2_4_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_2_4_Info> tdsecuL_2_4_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_2_4_Info info = new tdsecuL_2_4_Info();
            info.comm_avail_qty = unpacker.GetDouble("comm_avail_qty");
            info.trade_avail_qty = unpacker.GetDouble("trade_avail_qty");
            info.static_avail_qty = unpacker.GetDouble("static_avail_qty");
            tdsecuL_2_4_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_2_4_InfoList.Add((tdsecuL_2_4_Info)info);
        }
        #endregion

        //逻辑_交易证券_账户_计算资产账户持仓可用
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_2_4_Info();
                info.comm_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_AVAIL_QTY_FLOAT);
                info.trade_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_AVAIL_QTY_FLOAT);
                info.static_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STATIC_AVAIL_QTY_FLOAT);
                tdsecuL_2_4_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_2_51_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_2_51_Response()
        {
            this.tdsecuL_2_51_InfoList = new ObservableCollection<tdsecuL_2_51_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_2_51_Info> tdsecuL_2_51_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_2_51_Info info = new tdsecuL_2_51_Info();
            tdsecuL_2_51_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_2_51_InfoList.Add((tdsecuL_2_51_Info)info);
        }
        #endregion

        //逻辑_交易证券_账户_调整组合成本
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_2_51_Info();
                tdsecuL_2_51_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_2_52_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_2_52_Response()
        {
            this.tdsecuL_2_52_InfoList = new ObservableCollection<tdsecuL_2_52_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_2_52_Info> tdsecuL_2_52_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_2_52_Info info = new tdsecuL_2_52_Info();
            tdsecuL_2_52_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_2_52_InfoList.Add((tdsecuL_2_52_Info)info);
        }
        #endregion

        //逻辑_交易证券_账户_组合持仓划转
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_2_52_Info();
                tdsecuL_2_52_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_2_53_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_2_53_Response()
        {
            this.tdsecuL_2_53_InfoList = new ObservableCollection<tdsecuL_2_53_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_2_53_Info> tdsecuL_2_53_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_2_53_Info info = new tdsecuL_2_53_Info();
            tdsecuL_2_53_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_2_53_InfoList.Add((tdsecuL_2_53_Info)info);
        }
        #endregion

        //逻辑_交易证券_账户_场外基金组合持仓划转
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_2_53_Info();
                tdsecuL_2_53_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_2_54_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_2_54_Response()
        {
            this.tdsecuL_2_54_InfoList = new ObservableCollection<tdsecuL_2_54_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_2_54_Info> tdsecuL_2_54_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_2_54_Info info = new tdsecuL_2_54_Info();
            tdsecuL_2_54_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_2_54_InfoList.Add((tdsecuL_2_54_Info)info);
        }
        #endregion

        //逻辑_交易证券_账户_N天期内赎回费率提示
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_2_54_Info();
                tdsecuL_2_54_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_2_5_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_2_5_Response()
        {
            this.tdsecuL_2_5_InfoList = new ObservableCollection<tdsecuL_2_5_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_2_5_Info> tdsecuL_2_5_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_2_5_Info info = new tdsecuL_2_5_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.update_date = unpacker.GetInt("update_date");
            info.update_time = unpacker.GetInt("update_time");
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
            info.trade_frozen_amt = unpacker.GetDouble("trade_frozen_amt");
            info.trade_unfroz_amt = unpacker.GetDouble("trade_unfroz_amt");
            info.trade_capt_amt = unpacker.GetDouble("trade_capt_amt");
            info.trade_releas_amt = unpacker.GetDouble("trade_releas_amt");
            info.strike_capt_amt = unpacker.GetDouble("strike_capt_amt");
            info.strike_releas_amt = unpacker.GetDouble("strike_releas_amt");
            info.update_times = unpacker.GetInt("update_times");
            tdsecuL_2_5_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_2_5_InfoList.Add((tdsecuL_2_5_Info)info);
        }
        #endregion

        //逻辑_交易证券_账户_查询交易组资金
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_2_5_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    info.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
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
                    info.trade_frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_FROZEN_AMT_FLOAT);
                    info.trade_unfroz_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_UNFROZ_AMT_FLOAT);
                    info.trade_capt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CAPT_AMT_FLOAT);
                    info.trade_releas_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_RELEAS_AMT_FLOAT);
                    info.strike_capt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_CAPT_AMT_FLOAT);
                    info.strike_releas_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_AMT_FLOAT);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdsecuL_2_5_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_2_6_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_2_6_Response()
        {
            this.tdsecuL_2_6_InfoList = new ObservableCollection<tdsecuL_2_6_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_2_6_Info> tdsecuL_2_6_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_2_6_Info info = new tdsecuL_2_6_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.update_date = unpacker.GetInt("update_date");
            info.update_time = unpacker.GetInt("update_time");
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
            info.trade_frozen_amt = unpacker.GetDouble("trade_frozen_amt");
            info.trade_unfroz_amt = unpacker.GetDouble("trade_unfroz_amt");
            info.trade_capt_amt = unpacker.GetDouble("trade_capt_amt");
            info.trade_releas_amt = unpacker.GetDouble("trade_releas_amt");
            info.strike_capt_amt = unpacker.GetDouble("strike_capt_amt");
            info.strike_releas_amt = unpacker.GetDouble("strike_releas_amt");
            info.update_times = unpacker.GetInt("update_times");
            tdsecuL_2_6_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_2_6_InfoList.Add((tdsecuL_2_6_Info)info);
        }
        #endregion

        //逻辑_交易证券_账户_查询资产账户资金
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_2_6_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    info.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
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
                    info.trade_frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_FROZEN_AMT_FLOAT);
                    info.trade_unfroz_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_UNFROZ_AMT_FLOAT);
                    info.trade_capt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CAPT_AMT_FLOAT);
                    info.trade_releas_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_RELEAS_AMT_FLOAT);
                    info.strike_capt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_CAPT_AMT_FLOAT);
                    info.strike_releas_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_AMT_FLOAT);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdsecuL_2_6_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_2_7_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_2_7_Response()
        {
            this.tdsecuL_2_7_InfoList = new ObservableCollection<tdsecuL_2_7_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_2_7_Info> tdsecuL_2_7_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_2_7_Info info = new tdsecuL_2_7_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.update_date = unpacker.GetInt("update_date");
            info.update_time = unpacker.GetInt("update_time");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.begin_qty = unpacker.GetDouble("begin_qty");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.frozen_qty = unpacker.GetDouble("frozen_qty");
            info.unfroz_qty = unpacker.GetDouble("unfroz_qty");
            info.comm_frozen_qty = unpacker.GetDouble("comm_frozen_qty");
            info.comm_unfroz_qty = unpacker.GetDouble("comm_unfroz_qty");
            info.comm_capt_qty = unpacker.GetDouble("comm_capt_qty");
            info.comm_releas_qty = unpacker.GetDouble("comm_releas_qty");
            info.trade_frozen_qty = unpacker.GetDouble("trade_frozen_qty");
            info.trade_unfroz_qty = unpacker.GetDouble("trade_unfroz_qty");
            info.trade_capt_qty = unpacker.GetDouble("trade_capt_qty");
            info.trade_releas_qty = unpacker.GetDouble("trade_releas_qty");
            info.strike_capt_qty = unpacker.GetDouble("strike_capt_qty");
            info.strike_releas_qty = unpacker.GetDouble("strike_releas_qty");
            info.strike_frozen_qty = unpacker.GetDouble("strike_frozen_qty");
            info.strike_unfroz_qty = unpacker.GetDouble("strike_unfroz_qty");
            info.cost_amt = unpacker.GetDouble("cost_amt");
            info.intrst_cost_amt = unpacker.GetDouble("intrst_cost_amt");
            info.update_times = unpacker.GetInt("update_times");
            info.realize_pandl = unpacker.GetDouble("realize_pandl");
            info.intrst_pandl = unpacker.GetDouble("intrst_pandl");
            tdsecuL_2_7_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_2_7_InfoList.Add((tdsecuL_2_7_Info)info);
        }
        #endregion

        //逻辑_交易证券_账户_查询交易组持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_2_7_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    info.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.begin_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_QTY_FLOAT);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_QTY_FLOAT);
                    info.unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_QTY_FLOAT);
                    info.comm_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_FROZEN_QTY_FLOAT);
                    info.comm_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_UNFROZ_QTY_FLOAT);
                    info.comm_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_CAPT_QTY_FLOAT);
                    info.comm_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_RELEAS_QTY_FLOAT);
                    info.trade_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_FROZEN_QTY_FLOAT);
                    info.trade_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_UNFROZ_QTY_FLOAT);
                    info.trade_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CAPT_QTY_FLOAT);
                    info.trade_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_RELEAS_QTY_FLOAT);
                    info.strike_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_CAPT_QTY_FLOAT);
                    info.strike_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_QTY_FLOAT);
                    info.strike_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_FROZEN_QTY_FLOAT);
                    info.strike_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_UNFROZ_QTY_FLOAT);
                    info.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                    info.intrst_cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_COST_AMT_FLOAT);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    info.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    info.intrst_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_PANDL_FLOAT);
                    tdsecuL_2_7_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_2_8_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_2_8_Response()
        {
            this.tdsecuL_2_8_InfoList = new ObservableCollection<tdsecuL_2_8_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_2_8_Info> tdsecuL_2_8_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_2_8_Info info = new tdsecuL_2_8_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.update_date = unpacker.GetInt("update_date");
            info.update_time = unpacker.GetInt("update_time");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.begin_qty = unpacker.GetDouble("begin_qty");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.frozen_qty = unpacker.GetDouble("frozen_qty");
            info.unfroz_qty = unpacker.GetDouble("unfroz_qty");
            info.comm_frozen_qty = unpacker.GetDouble("comm_frozen_qty");
            info.comm_unfroz_qty = unpacker.GetDouble("comm_unfroz_qty");
            info.comm_capt_qty = unpacker.GetDouble("comm_capt_qty");
            info.comm_releas_qty = unpacker.GetDouble("comm_releas_qty");
            info.trade_frozen_qty = unpacker.GetDouble("trade_frozen_qty");
            info.trade_unfroz_qty = unpacker.GetDouble("trade_unfroz_qty");
            info.trade_capt_qty = unpacker.GetDouble("trade_capt_qty");
            info.trade_releas_qty = unpacker.GetDouble("trade_releas_qty");
            info.strike_capt_qty = unpacker.GetDouble("strike_capt_qty");
            info.strike_releas_qty = unpacker.GetDouble("strike_releas_qty");
            info.strike_frozen_qty = unpacker.GetDouble("strike_frozen_qty");
            info.strike_unfroz_qty = unpacker.GetDouble("strike_unfroz_qty");
            info.cost_amt = unpacker.GetDouble("cost_amt");
            info.intrst_cost_amt = unpacker.GetDouble("intrst_cost_amt");
            info.update_times = unpacker.GetInt("update_times");
            info.realize_pandl = unpacker.GetDouble("realize_pandl");
            info.intrst_pandl = unpacker.GetDouble("intrst_pandl");
            tdsecuL_2_8_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_2_8_InfoList.Add((tdsecuL_2_8_Info)info);
        }
        #endregion

        //逻辑_交易证券_账户_查询资产账户持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_2_8_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    info.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.begin_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_QTY_FLOAT);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_QTY_FLOAT);
                    info.unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_QTY_FLOAT);
                    info.comm_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_FROZEN_QTY_FLOAT);
                    info.comm_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_UNFROZ_QTY_FLOAT);
                    info.comm_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_CAPT_QTY_FLOAT);
                    info.comm_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_RELEAS_QTY_FLOAT);
                    info.trade_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_FROZEN_QTY_FLOAT);
                    info.trade_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_UNFROZ_QTY_FLOAT);
                    info.trade_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CAPT_QTY_FLOAT);
                    info.trade_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_RELEAS_QTY_FLOAT);
                    info.strike_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_CAPT_QTY_FLOAT);
                    info.strike_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_QTY_FLOAT);
                    info.strike_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_FROZEN_QTY_FLOAT);
                    info.strike_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_UNFROZ_QTY_FLOAT);
                    info.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                    info.intrst_cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_COST_AMT_FLOAT);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    info.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    info.intrst_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_PANDL_FLOAT);
                    tdsecuL_2_8_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_2_33_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_2_33_Response()
        {
            this.tdsecuL_2_33_InfoList = new ObservableCollection<tdsecuL_2_33_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_2_33_Info> tdsecuL_2_33_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_2_33_Info info = new tdsecuL_2_33_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.begin_qty = unpacker.GetDouble("begin_qty");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.put_impawn_qty = unpacker.GetDouble("put_impawn_qty");
            info.get_impawn_qty = unpacker.GetDouble("get_impawn_qty");
            info.update_times = unpacker.GetInt("update_times");
            tdsecuL_2_33_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_2_33_InfoList.Add((tdsecuL_2_33_Info)info);
        }
        #endregion

        //逻辑_交易证券_账户_查询交易组债券质押
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_2_33_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.begin_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_QTY_FLOAT);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.put_impawn_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PUT_IMPAWN_QTY_FLOAT);
                    info.get_impawn_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_GET_IMPAWN_QTY_FLOAT);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdsecuL_2_33_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_2_34_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_2_34_Response()
        {
            this.tdsecuL_2_34_InfoList = new ObservableCollection<tdsecuL_2_34_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_2_34_Info> tdsecuL_2_34_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_2_34_Info info = new tdsecuL_2_34_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.begin_qty = unpacker.GetDouble("begin_qty");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.put_impawn_qty = unpacker.GetDouble("put_impawn_qty");
            info.get_impawn_qty = unpacker.GetDouble("get_impawn_qty");
            info.update_times = unpacker.GetInt("update_times");
            tdsecuL_2_34_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_2_34_InfoList.Add((tdsecuL_2_34_Info)info);
        }
        #endregion

        //逻辑_交易证券_账户_查询资产账户债券质押
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_2_34_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.begin_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_QTY_FLOAT);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.put_impawn_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PUT_IMPAWN_QTY_FLOAT);
                    info.get_impawn_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_GET_IMPAWN_QTY_FLOAT);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdsecuL_2_34_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_2_36_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_2_36_Response()
        {
            this.tdsecuL_2_36_InfoList = new ObservableCollection<tdsecuL_2_36_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_2_36_Info> tdsecuL_2_36_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_2_36_Info info = new tdsecuL_2_36_Info();
            tdsecuL_2_36_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_2_36_InfoList.Add((tdsecuL_2_36_Info)info);
        }
        #endregion

        //逻辑_交易证券_账户_更新债券质押标准券数量
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_2_36_Info();
                tdsecuL_2_36_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_2_37_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_2_37_Response()
        {
            this.tdsecuL_2_37_InfoList = new ObservableCollection<tdsecuL_2_37_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_2_37_Info> tdsecuL_2_37_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_2_37_Info info = new tdsecuL_2_37_Info();
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.comm_reback_avail_qty = unpacker.GetDouble("comm_reback_avail_qty");
            info.trade_reback_avail_qty = unpacker.GetDouble("trade_reback_avail_qty");
            tdsecuL_2_37_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_2_37_InfoList.Add((tdsecuL_2_37_Info)info);
        }
        #endregion

        //逻辑_交易证券_账户_查询交易组债券质押转回可用
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_2_37_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.comm_reback_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_REBACK_AVAIL_QTY_FLOAT);
                    info.trade_reback_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_REBACK_AVAIL_QTY_FLOAT);
                    tdsecuL_2_37_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_2_42_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_2_42_Response()
        {
            this.tdsecuL_2_42_InfoList = new ObservableCollection<tdsecuL_2_42_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_2_42_Info> tdsecuL_2_42_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_2_42_Info info = new tdsecuL_2_42_Info();
            tdsecuL_2_42_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_2_42_InfoList.Add((tdsecuL_2_42_Info)info);
        }
        #endregion

        //逻辑_交易证券_账户_债券回购处理
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_2_42_Info();
                tdsecuL_2_42_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_2_43_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_2_43_Response()
        {
            this.tdsecuL_2_43_InfoList = new ObservableCollection<tdsecuL_2_43_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_2_43_Info> tdsecuL_2_43_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_2_43_Info info = new tdsecuL_2_43_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.exch_crncy_type = unpacker.GetStr("exch_crncy_type");
            info.exch_rate = unpacker.GetDouble("exch_rate");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.target_code_no = unpacker.GetInt("target_code_no");
            info.comm_id = unpacker.GetInt64("comm_id");
            info.order_dir = unpacker.GetInt("order_dir");
            info.repo_qty = unpacker.GetDouble("repo_qty");
            info.repo_amt = unpacker.GetDouble("repo_amt");
            info.repo_rate = unpacker.GetDouble("repo_rate");
            info.repo_trade_date = unpacker.GetInt("repo_trade_date");
            info.repo_order_id = unpacker.GetInt64("repo_order_id");
            info.repo_strike_id = unpacker.GetInt64("repo_strike_id");
            info.repo_days = unpacker.GetInt("repo_days");
            info.repo_cale_days = unpacker.GetInt("repo_cale_days");
            info.repo_back_date = unpacker.GetInt("repo_back_date");
            info.repo_back_amt = unpacker.GetDouble("repo_back_amt");
            info.repo_back_intrst = unpacker.GetDouble("repo_back_intrst");
            info.repo_back_trade_date = unpacker.GetInt("repo_back_trade_date");
            info.repo_status = unpacker.GetStr("repo_status");
            info.update_times = unpacker.GetInt("update_times");
            tdsecuL_2_43_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_2_43_InfoList.Add((tdsecuL_2_43_Info)info);
        }
        #endregion

        //逻辑_交易证券_账户_查询交易组债券回购
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_2_43_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.exch_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR);
                    info.exch_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_RATE_FLOAT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.target_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_NO_INT);
                    info.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.repo_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPO_QTY_FLOAT);
                    info.repo_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPO_AMT_FLOAT);
                    info.repo_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPO_RATE_FLOAT);
                    info.repo_trade_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPO_TRADE_DATE_INT);
                    info.repo_order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_REPO_ORDER_ID_INT64);
                    info.repo_strike_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_REPO_STRIKE_ID_INT64);
                    info.repo_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPO_DAYS_INT);
                    info.repo_cale_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPO_CALE_DAYS_INT);
                    info.repo_back_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPO_BACK_DATE_INT);
                    info.repo_back_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPO_BACK_AMT_FLOAT);
                    info.repo_back_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPO_BACK_INTRST_FLOAT);
                    info.repo_back_trade_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPO_BACK_TRADE_DATE_INT);
                    info.repo_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPO_STATUS_STR);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdsecuL_2_43_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_2_44_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_2_44_Response()
        {
            this.tdsecuL_2_44_InfoList = new ObservableCollection<tdsecuL_2_44_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_2_44_Info> tdsecuL_2_44_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_2_44_Info info = new tdsecuL_2_44_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.combo_code = unpacker.GetStr("combo_code");
            info.stock_code = unpacker.GetStr("stock_code");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.open_posi_date = unpacker.GetInt("open_posi_date");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.posi_qty = unpacker.GetDouble("posi_qty");
            info.frozen_qty = unpacker.GetDouble("frozen_qty");
            info.unfroz_qty = unpacker.GetDouble("unfroz_qty");
            info.pre_settle_qty = unpacker.GetDouble("pre_settle_qty");
            info.trade_frozen_qty = unpacker.GetDouble("trade_frozen_qty");
            info.trade_unfroz_qty = unpacker.GetDouble("trade_unfroz_qty");
            info.trade_capt_qty = unpacker.GetDouble("trade_capt_qty");
            info.trade_releas_qty = unpacker.GetDouble("trade_releas_qty");
            info.strike_capt_qty = unpacker.GetDouble("strike_capt_qty");
            info.strike_releas_qty = unpacker.GetDouble("strike_releas_qty");
            info.strike_frozen_qty = unpacker.GetDouble("strike_frozen_qty");
            info.strike_unfroz_qty = unpacker.GetDouble("strike_unfroz_qty");
            info.realize_pandl = unpacker.GetDouble("realize_pandl");
            info.cost_amt = unpacker.GetDouble("cost_amt");
            info.intrst_cost_amt = unpacker.GetDouble("intrst_cost_amt");
            info.intrst_pandl = unpacker.GetDouble("intrst_pandl");
            info.update_times = unpacker.GetInt("update_times");
            tdsecuL_2_44_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_2_44_InfoList.Add((tdsecuL_2_44_Info)info);
        }
        #endregion

        //逻辑_交易证券_账户_查询组合持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_2_44_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.combo_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_CODE_STR);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.open_posi_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_DATE_INT);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    info.frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_QTY_FLOAT);
                    info.unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_QTY_FLOAT);
                    info.pre_settle_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SETTLE_QTY_FLOAT);
                    info.trade_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_FROZEN_QTY_FLOAT);
                    info.trade_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_UNFROZ_QTY_FLOAT);
                    info.trade_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CAPT_QTY_FLOAT);
                    info.trade_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_RELEAS_QTY_FLOAT);
                    info.strike_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_CAPT_QTY_FLOAT);
                    info.strike_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_QTY_FLOAT);
                    info.strike_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_FROZEN_QTY_FLOAT);
                    info.strike_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_UNFROZ_QTY_FLOAT);
                    info.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    info.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                    info.intrst_cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_COST_AMT_FLOAT);
                    info.intrst_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_PANDL_FLOAT);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdsecuL_2_44_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_2_45_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_2_45_Response()
        {
            this.tdsecuL_2_45_InfoList = new ObservableCollection<tdsecuL_2_45_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_2_45_Info> tdsecuL_2_45_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_2_45_Info info = new tdsecuL_2_45_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.combo_code = unpacker.GetStr("combo_code");
            info.stock_code = unpacker.GetStr("stock_code");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.open_posi_date = unpacker.GetInt("open_posi_date");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.posi_qty = unpacker.GetDouble("posi_qty");
            info.frozen_qty = unpacker.GetDouble("frozen_qty");
            info.unfroz_qty = unpacker.GetDouble("unfroz_qty");
            info.pre_settle_qty = unpacker.GetDouble("pre_settle_qty");
            info.trade_frozen_qty = unpacker.GetDouble("trade_frozen_qty");
            info.trade_unfroz_qty = unpacker.GetDouble("trade_unfroz_qty");
            info.trade_capt_qty = unpacker.GetDouble("trade_capt_qty");
            info.trade_releas_qty = unpacker.GetDouble("trade_releas_qty");
            info.strike_capt_qty = unpacker.GetDouble("strike_capt_qty");
            info.strike_releas_qty = unpacker.GetDouble("strike_releas_qty");
            info.strike_frozen_qty = unpacker.GetDouble("strike_frozen_qty");
            info.strike_unfroz_qty = unpacker.GetDouble("strike_unfroz_qty");
            info.realize_pandl = unpacker.GetDouble("realize_pandl");
            info.cost_amt = unpacker.GetDouble("cost_amt");
            info.intrst_cost_amt = unpacker.GetDouble("intrst_cost_amt");
            info.intrst_pandl = unpacker.GetDouble("intrst_pandl");
            info.update_times = unpacker.GetInt("update_times");
            tdsecuL_2_45_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_2_45_InfoList.Add((tdsecuL_2_45_Info)info);
        }
        #endregion

        //逻辑_交易证券_账户_查询历史组合持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_2_45_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.combo_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_CODE_STR);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.open_posi_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_DATE_INT);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    info.frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_QTY_FLOAT);
                    info.unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_QTY_FLOAT);
                    info.pre_settle_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SETTLE_QTY_FLOAT);
                    info.trade_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_FROZEN_QTY_FLOAT);
                    info.trade_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_UNFROZ_QTY_FLOAT);
                    info.trade_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CAPT_QTY_FLOAT);
                    info.trade_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_RELEAS_QTY_FLOAT);
                    info.strike_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_CAPT_QTY_FLOAT);
                    info.strike_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_QTY_FLOAT);
                    info.strike_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_FROZEN_QTY_FLOAT);
                    info.strike_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_UNFROZ_QTY_FLOAT);
                    info.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    info.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                    info.intrst_cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_COST_AMT_FLOAT);
                    info.intrst_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_PANDL_FLOAT);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdsecuL_2_45_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_2_46_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_2_46_Response()
        {
            this.tdsecuL_2_46_InfoList = new ObservableCollection<tdsecuL_2_46_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_2_46_Info> tdsecuL_2_46_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_2_46_Info info = new tdsecuL_2_46_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.open_posi_date = unpacker.GetInt("open_posi_date");
            info.combo_code = unpacker.GetStr("combo_code");
            info.combo_copies = unpacker.GetDouble("combo_copies");
            info.combo_status = unpacker.GetStr("combo_status");
            info.combo_cost = unpacker.GetDouble("combo_cost");
            info.combo_market_value = unpacker.GetDouble("combo_market_value");
            info.realize_pandl = unpacker.GetDouble("realize_pandl");
            info.sum_realize_pandl = unpacker.GetDouble("sum_realize_pandl");
            info.update_times = unpacker.GetInt("update_times");
            tdsecuL_2_46_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_2_46_InfoList.Add((tdsecuL_2_46_Info)info);
        }
        #endregion

        //逻辑_交易证券_账户_查询组合收益
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_2_46_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.open_posi_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_DATE_INT);
                    info.combo_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_CODE_STR);
                    info.combo_copies = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_COPIES_FLOAT);
                    info.combo_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_STATUS_STR);
                    info.combo_cost = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_COST_FLOAT);
                    info.combo_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_MARKET_VALUE_FLOAT);
                    info.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    info.sum_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SUM_REALIZE_PANDL_FLOAT);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdsecuL_2_46_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_2_47_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_2_47_Response()
        {
            this.tdsecuL_2_47_InfoList = new ObservableCollection<tdsecuL_2_47_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_2_47_Info> tdsecuL_2_47_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_2_47_Info info = new tdsecuL_2_47_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.open_posi_date = unpacker.GetInt("open_posi_date");
            info.combo_code = unpacker.GetStr("combo_code");
            info.combo_copies = unpacker.GetDouble("combo_copies");
            info.combo_status = unpacker.GetStr("combo_status");
            info.combo_cost = unpacker.GetDouble("combo_cost");
            info.combo_market_value = unpacker.GetDouble("combo_market_value");
            info.realize_pandl = unpacker.GetDouble("realize_pandl");
            info.sum_realize_pandl = unpacker.GetDouble("sum_realize_pandl");
            info.update_times = unpacker.GetInt("update_times");
            tdsecuL_2_47_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_2_47_InfoList.Add((tdsecuL_2_47_Info)info);
        }
        #endregion

        //逻辑_交易证券_账户_查询历史组合收益
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_2_47_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.open_posi_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_DATE_INT);
                    info.combo_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_CODE_STR);
                    info.combo_copies = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_COPIES_FLOAT);
                    info.combo_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_STATUS_STR);
                    info.combo_cost = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_COST_FLOAT);
                    info.combo_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_MARKET_VALUE_FLOAT);
                    info.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    info.sum_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SUM_REALIZE_PANDL_FLOAT);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdsecuL_2_47_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_2_48_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_2_48_Response()
        {
            this.tdsecuL_2_48_InfoList = new ObservableCollection<tdsecuL_2_48_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_2_48_Info> tdsecuL_2_48_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_2_48_Info info = new tdsecuL_2_48_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.combo_code = unpacker.GetStr("combo_code");
            info.stock_code = unpacker.GetStr("stock_code");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.posi_qty = unpacker.GetDouble("posi_qty");
            info.frozen_qty = unpacker.GetDouble("frozen_qty");
            info.unfroz_qty = unpacker.GetDouble("unfroz_qty");
            info.pre_settle_qty = unpacker.GetDouble("pre_settle_qty");
            info.trade_frozen_qty = unpacker.GetDouble("trade_frozen_qty");
            info.trade_unfroz_qty = unpacker.GetDouble("trade_unfroz_qty");
            info.trade_capt_qty = unpacker.GetDouble("trade_capt_qty");
            info.trade_releas_qty = unpacker.GetDouble("trade_releas_qty");
            info.strike_capt_qty = unpacker.GetDouble("strike_capt_qty");
            info.strike_releas_qty = unpacker.GetDouble("strike_releas_qty");
            info.strike_frozen_qty = unpacker.GetDouble("strike_frozen_qty");
            info.strike_unfroz_qty = unpacker.GetDouble("strike_unfroz_qty");
            info.realize_pandl = unpacker.GetDouble("realize_pandl");
            info.cost_amt = unpacker.GetDouble("cost_amt");
            info.intrst_cost_amt = unpacker.GetDouble("intrst_cost_amt");
            info.intrst_pandl = unpacker.GetDouble("intrst_pandl");
            info.update_times = unpacker.GetInt("update_times");
            tdsecuL_2_48_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_2_48_InfoList.Add((tdsecuL_2_48_Info)info);
        }
        #endregion

        //逻辑_交易证券_账户_查询组合持仓汇总
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_2_48_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.combo_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_CODE_STR);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    info.frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_QTY_FLOAT);
                    info.unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_QTY_FLOAT);
                    info.pre_settle_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SETTLE_QTY_FLOAT);
                    info.trade_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_FROZEN_QTY_FLOAT);
                    info.trade_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_UNFROZ_QTY_FLOAT);
                    info.trade_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CAPT_QTY_FLOAT);
                    info.trade_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_RELEAS_QTY_FLOAT);
                    info.strike_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_CAPT_QTY_FLOAT);
                    info.strike_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_QTY_FLOAT);
                    info.strike_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_FROZEN_QTY_FLOAT);
                    info.strike_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_UNFROZ_QTY_FLOAT);
                    info.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    info.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                    info.intrst_cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_COST_AMT_FLOAT);
                    info.intrst_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_PANDL_FLOAT);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdsecuL_2_48_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_2_49_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_2_49_Response()
        {
            this.tdsecuL_2_49_InfoList = new ObservableCollection<tdsecuL_2_49_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_2_49_Info> tdsecuL_2_49_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_2_49_Info info = new tdsecuL_2_49_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.combo_code = unpacker.GetStr("combo_code");
            info.stock_code = unpacker.GetStr("stock_code");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.posi_qty = unpacker.GetDouble("posi_qty");
            info.frozen_qty = unpacker.GetDouble("frozen_qty");
            info.unfroz_qty = unpacker.GetDouble("unfroz_qty");
            info.pre_settle_qty = unpacker.GetDouble("pre_settle_qty");
            info.trade_frozen_qty = unpacker.GetDouble("trade_frozen_qty");
            info.trade_unfroz_qty = unpacker.GetDouble("trade_unfroz_qty");
            info.trade_capt_qty = unpacker.GetDouble("trade_capt_qty");
            info.trade_releas_qty = unpacker.GetDouble("trade_releas_qty");
            info.strike_capt_qty = unpacker.GetDouble("strike_capt_qty");
            info.strike_releas_qty = unpacker.GetDouble("strike_releas_qty");
            info.strike_frozen_qty = unpacker.GetDouble("strike_frozen_qty");
            info.strike_unfroz_qty = unpacker.GetDouble("strike_unfroz_qty");
            info.realize_pandl = unpacker.GetDouble("realize_pandl");
            info.cost_amt = unpacker.GetDouble("cost_amt");
            info.intrst_cost_amt = unpacker.GetDouble("intrst_cost_amt");
            info.intrst_pandl = unpacker.GetDouble("intrst_pandl");
            info.update_times = unpacker.GetInt("update_times");
            tdsecuL_2_49_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_2_49_InfoList.Add((tdsecuL_2_49_Info)info);
        }
        #endregion

        //逻辑_交易证券_账户_查询历史组合持仓汇总
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_2_49_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.combo_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_CODE_STR);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    info.frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_QTY_FLOAT);
                    info.unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_QTY_FLOAT);
                    info.pre_settle_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SETTLE_QTY_FLOAT);
                    info.trade_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_FROZEN_QTY_FLOAT);
                    info.trade_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_UNFROZ_QTY_FLOAT);
                    info.trade_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CAPT_QTY_FLOAT);
                    info.trade_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_RELEAS_QTY_FLOAT);
                    info.strike_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_CAPT_QTY_FLOAT);
                    info.strike_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_QTY_FLOAT);
                    info.strike_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_FROZEN_QTY_FLOAT);
                    info.strike_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_UNFROZ_QTY_FLOAT);
                    info.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    info.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                    info.intrst_cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_COST_AMT_FLOAT);
                    info.intrst_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_PANDL_FLOAT);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdsecuL_2_49_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_2_50_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_2_50_Response()
        {
            this.tdsecuL_2_50_InfoList = new ObservableCollection<tdsecuL_2_50_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_2_50_Info> tdsecuL_2_50_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_2_50_Info info = new tdsecuL_2_50_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.combo_code = unpacker.GetStr("combo_code");
            info.combo_copies = unpacker.GetDouble("combo_copies");
            info.combo_status = unpacker.GetStr("combo_status");
            info.combo_cost = unpacker.GetDouble("combo_cost");
            info.combo_market_value = unpacker.GetDouble("combo_market_value");
            info.realize_pandl = unpacker.GetDouble("realize_pandl");
            info.sum_realize_pandl = unpacker.GetDouble("sum_realize_pandl");
            info.update_times = unpacker.GetInt("update_times");
            tdsecuL_2_50_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_2_50_InfoList.Add((tdsecuL_2_50_Info)info);
        }
        #endregion

        //逻辑_交易证券_账户_查询组合收益汇总
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_2_50_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.combo_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_CODE_STR);
                    info.combo_copies = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_COPIES_FLOAT);
                    info.combo_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_STATUS_STR);
                    info.combo_cost = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_COST_FLOAT);
                    info.combo_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_MARKET_VALUE_FLOAT);
                    info.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    info.sum_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SUM_REALIZE_PANDL_FLOAT);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdsecuL_2_50_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_2_60_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_2_60_Response()
        {
            this.tdsecuL_2_60_InfoList = new ObservableCollection<tdsecuL_2_60_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_2_60_Info> tdsecuL_2_60_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_2_60_Info info = new tdsecuL_2_60_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.combo_code = unpacker.GetStr("combo_code");
            info.combo_copies = unpacker.GetDouble("combo_copies");
            info.combo_status = unpacker.GetStr("combo_status");
            info.combo_cost = unpacker.GetDouble("combo_cost");
            info.combo_market_value = unpacker.GetDouble("combo_market_value");
            info.realize_pandl = unpacker.GetDouble("realize_pandl");
            info.sum_realize_pandl = unpacker.GetDouble("sum_realize_pandl");
            info.update_times = unpacker.GetInt("update_times");
            tdsecuL_2_60_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_2_60_InfoList.Add((tdsecuL_2_60_Info)info);
        }
        #endregion

        //逻辑_交易证券_账户_查询历史组合收益汇总
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_2_60_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.combo_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_CODE_STR);
                    info.combo_copies = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_COPIES_FLOAT);
                    info.combo_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_STATUS_STR);
                    info.combo_cost = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_COST_FLOAT);
                    info.combo_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_MARKET_VALUE_FLOAT);
                    info.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    info.sum_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SUM_REALIZE_PANDL_FLOAT);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdsecuL_2_60_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_2_61_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_2_61_Response()
        {
            this.tdsecuL_2_61_InfoList = new ObservableCollection<tdsecuL_2_61_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_2_61_Info> tdsecuL_2_61_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_2_61_Info info = new tdsecuL_2_61_Info();
            info.stat_qty = unpacker.GetDouble("stat_qty");
            tdsecuL_2_61_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_2_61_InfoList.Add((tdsecuL_2_61_Info)info);
        }
        #endregion

        //逻辑_交易证券_账户_查询N天期内可赎回数量
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_2_61_Info();
                info.stat_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STAT_QTY_FLOAT);
                tdsecuL_2_61_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_2_62_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_2_62_Response()
        {
            this.tdsecuL_2_62_InfoList = new ObservableCollection<tdsecuL_2_62_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_2_62_Info> tdsecuL_2_62_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_2_62_Info info = new tdsecuL_2_62_Info();
            tdsecuL_2_62_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_2_62_InfoList.Add((tdsecuL_2_62_Info)info);
        }
        #endregion

        //逻辑_交易证券_账户_新增银证转账记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_2_62_Info();
                tdsecuL_2_62_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_2_63_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_2_63_Response()
        {
            this.tdsecuL_2_63_InfoList = new ObservableCollection<tdsecuL_2_63_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_2_63_Info> tdsecuL_2_63_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_2_63_Info info = new tdsecuL_2_63_Info();
            tdsecuL_2_63_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_2_63_InfoList.Add((tdsecuL_2_63_Info)info);
        }
        #endregion

        //逻辑_交易证券_账户_批量调整交易组持仓成本
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_2_63_Info();
                tdsecuL_2_63_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_2_64_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_2_64_Response()
        {
            this.tdsecuL_2_64_InfoList = new ObservableCollection<tdsecuL_2_64_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_2_64_Info> tdsecuL_2_64_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_2_64_Info info = new tdsecuL_2_64_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.converted_margin = unpacker.GetDouble("converted_margin");
            info.fina_converted_pandl = unpacker.GetDouble("fina_converted_pandl");
            info.loan_converted_pandl = unpacker.GetDouble("loan_converted_pandl");
            info.fina_capt_margin = unpacker.GetDouble("fina_capt_margin");
            info.loan_capt_margin = unpacker.GetDouble("loan_capt_margin");
            info.keep_guarantee_ratio = unpacker.GetDouble("keep_guarantee_ratio");
            info.update_times = unpacker.GetInt("update_times");
            tdsecuL_2_64_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_2_64_InfoList.Add((tdsecuL_2_64_Info)info);
        }
        #endregion

        //逻辑_交易证券_账户_查询交易组融资融券保证金计算结果集
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_2_64_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.converted_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CONVERTED_MARGIN_FLOAT);
                    info.fina_converted_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_CONVERTED_PANDL_FLOAT);
                    info.loan_converted_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_CONVERTED_PANDL_FLOAT);
                    info.fina_capt_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_CAPT_MARGIN_FLOAT);
                    info.loan_capt_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_CAPT_MARGIN_FLOAT);
                    info.keep_guarantee_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_KEEP_GUARANTEE_RATIO_FLOAT);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdsecuL_2_64_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_2_65_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_2_65_Response()
        {
            this.tdsecuL_2_65_InfoList = new ObservableCollection<tdsecuL_2_65_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_2_65_Info> tdsecuL_2_65_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_2_65_Info info = new tdsecuL_2_65_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.converted_margin = unpacker.GetDouble("converted_margin");
            info.fina_converted_pandl = unpacker.GetDouble("fina_converted_pandl");
            info.loan_converted_pandl = unpacker.GetDouble("loan_converted_pandl");
            info.fina_capt_margin = unpacker.GetDouble("fina_capt_margin");
            info.loan_capt_margin = unpacker.GetDouble("loan_capt_margin");
            info.keep_guarantee_ratio = unpacker.GetDouble("keep_guarantee_ratio");
            info.update_times = unpacker.GetInt("update_times");
            tdsecuL_2_65_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_2_65_InfoList.Add((tdsecuL_2_65_Info)info);
        }
        #endregion

        //逻辑_交易证券_账户_查询资产账户融资融券保证金计算结果集
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_2_65_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.converted_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CONVERTED_MARGIN_FLOAT);
                    info.fina_converted_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_CONVERTED_PANDL_FLOAT);
                    info.loan_converted_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_CONVERTED_PANDL_FLOAT);
                    info.fina_capt_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_CAPT_MARGIN_FLOAT);
                    info.loan_capt_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_CAPT_MARGIN_FLOAT);
                    info.keep_guarantee_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_KEEP_GUARANTEE_RATIO_FLOAT);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdsecuL_2_65_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_2_66_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_2_66_Response()
        {
            this.tdsecuL_2_66_InfoList = new ObservableCollection<tdsecuL_2_66_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_2_66_Info> tdsecuL_2_66_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_2_66_Info info = new tdsecuL_2_66_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.debt_loan_sell_strike_amt = unpacker.GetDouble("debt_loan_sell_strike_amt");
            info.debt_strike_fee = unpacker.GetDouble("debt_strike_fee");
            info.loan_return_strike_amt = unpacker.GetDouble("loan_return_strike_amt");
            info.loan_return_order_amt = unpacker.GetDouble("loan_return_order_amt");
            info.loan_return_comm_amt = unpacker.GetDouble("loan_return_comm_amt");
            info.return_strike_fee = unpacker.GetDouble("return_strike_fee");
            info.update_times = unpacker.GetInt("update_times");
            tdsecuL_2_66_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_2_66_InfoList.Add((tdsecuL_2_66_Info)info);
        }
        #endregion

        //逻辑_交易证券_账户_查询交易组业务资金负债结果集
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_2_66_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.debt_loan_sell_strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_LOAN_SELL_STRIKE_AMT_FLOAT);
                    info.debt_strike_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_STRIKE_FEE_FLOAT);
                    info.loan_return_strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_RETURN_STRIKE_AMT_FLOAT);
                    info.loan_return_order_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_RETURN_ORDER_AMT_FLOAT);
                    info.loan_return_comm_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_RETURN_COMM_AMT_FLOAT);
                    info.return_strike_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RETURN_STRIKE_FEE_FLOAT);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdsecuL_2_66_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_2_67_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_2_67_Response()
        {
            this.tdsecuL_2_67_InfoList = new ObservableCollection<tdsecuL_2_67_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_2_67_Info> tdsecuL_2_67_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_2_67_Info info = new tdsecuL_2_67_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.debt_loan_sell_strike_amt = unpacker.GetDouble("debt_loan_sell_strike_amt");
            info.debt_strike_fee = unpacker.GetDouble("debt_strike_fee");
            info.loan_return_strike_amt = unpacker.GetDouble("loan_return_strike_amt");
            info.loan_return_order_amt = unpacker.GetDouble("loan_return_order_amt");
            info.loan_return_comm_amt = unpacker.GetDouble("loan_return_comm_amt");
            info.return_strike_fee = unpacker.GetDouble("return_strike_fee");
            info.update_times = unpacker.GetInt("update_times");
            tdsecuL_2_67_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_2_67_InfoList.Add((tdsecuL_2_67_Info)info);
        }
        #endregion

        //逻辑_交易证券_账户_查询资产账户业务资金负债结果集
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_2_67_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.debt_loan_sell_strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_LOAN_SELL_STRIKE_AMT_FLOAT);
                    info.debt_strike_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_STRIKE_FEE_FLOAT);
                    info.loan_return_strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_RETURN_STRIKE_AMT_FLOAT);
                    info.loan_return_order_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_RETURN_ORDER_AMT_FLOAT);
                    info.loan_return_comm_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_RETURN_COMM_AMT_FLOAT);
                    info.return_strike_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RETURN_STRIKE_FEE_FLOAT);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdsecuL_2_67_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_2_68_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_2_68_Response()
        {
            this.tdsecuL_2_68_InfoList = new ObservableCollection<tdsecuL_2_68_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_2_68_Info> tdsecuL_2_68_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_2_68_Info info = new tdsecuL_2_68_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_type = unpacker.GetInt("stock_type");
            info.asset_type = unpacker.GetInt("asset_type");
            info.invest_type = unpacker.GetInt("invest_type");
            info.debt_type = unpacker.GetInt("debt_type");
            info.debt_fina_buy_strike_qty = unpacker.GetDouble("debt_fina_buy_strike_qty");
            info.fina_return_strike_qty = unpacker.GetDouble("fina_return_strike_qty");
            info.debt_loan_sell_strike_qty = unpacker.GetDouble("debt_loan_sell_strike_qty");
            info.loan_return_strike_qty = unpacker.GetDouble("loan_return_strike_qty");
            info.debt_fina_buy_order_qty = unpacker.GetDouble("debt_fina_buy_order_qty");
            info.fina_return_order_qty = unpacker.GetDouble("fina_return_order_qty");
            info.debt_loan_sell_order_qty = unpacker.GetDouble("debt_loan_sell_order_qty");
            info.loan_return_order_qty = unpacker.GetDouble("loan_return_order_qty");
            info.debt_fina_buy_comm_qty = unpacker.GetDouble("debt_fina_buy_comm_qty");
            info.fina_return_comm_qty = unpacker.GetDouble("fina_return_comm_qty");
            info.debt_loan_sell_comm_qty = unpacker.GetDouble("debt_loan_sell_comm_qty");
            info.loan_return_comm_qty = unpacker.GetDouble("loan_return_comm_qty");
            info.debt_fina_buy_strike_amt = unpacker.GetDouble("debt_fina_buy_strike_amt");
            info.fina_return_strike_amt = unpacker.GetDouble("fina_return_strike_amt");
            info.debt_loan_sell_strike_amt = unpacker.GetDouble("debt_loan_sell_strike_amt");
            info.loan_return_strike_amt = unpacker.GetDouble("loan_return_strike_amt");
            info.debt_fina_buy_order_amt = unpacker.GetDouble("debt_fina_buy_order_amt");
            info.fina_return_order_amt = unpacker.GetDouble("fina_return_order_amt");
            info.debt_loan_sell_order_amt = unpacker.GetDouble("debt_loan_sell_order_amt");
            info.loan_return_order_amt = unpacker.GetDouble("loan_return_order_amt");
            info.debt_fina_buy_comm_amt = unpacker.GetDouble("debt_fina_buy_comm_amt");
            info.fina_return_comm_amt = unpacker.GetDouble("fina_return_comm_amt");
            info.debt_loan_sell_comm_amt = unpacker.GetDouble("debt_loan_sell_comm_amt");
            info.loan_return_comm_amt = unpacker.GetDouble("loan_return_comm_amt");
            info.debt_strike_fee = unpacker.GetDouble("debt_strike_fee");
            info.return_strike_fee = unpacker.GetDouble("return_strike_fee");
            info.debt_interest = unpacker.GetDouble("debt_interest");
            info.return_interest_amt = unpacker.GetDouble("return_interest_amt");
            info.update_times = unpacker.GetInt("update_times");
            tdsecuL_2_68_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_2_68_InfoList.Add((tdsecuL_2_68_Info)info);
        }
        #endregion

        //逻辑_交易证券_账户_查询交易组业务持仓负债结果集
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_2_68_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    info.invest_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INVEST_TYPE_INT);
                    info.debt_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_TYPE_INT);
                    info.debt_fina_buy_strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_FINA_BUY_STRIKE_QTY_FLOAT);
                    info.fina_return_strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_RETURN_STRIKE_QTY_FLOAT);
                    info.debt_loan_sell_strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_LOAN_SELL_STRIKE_QTY_FLOAT);
                    info.loan_return_strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_RETURN_STRIKE_QTY_FLOAT);
                    info.debt_fina_buy_order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_FINA_BUY_ORDER_QTY_FLOAT);
                    info.fina_return_order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_RETURN_ORDER_QTY_FLOAT);
                    info.debt_loan_sell_order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_LOAN_SELL_ORDER_QTY_FLOAT);
                    info.loan_return_order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_RETURN_ORDER_QTY_FLOAT);
                    info.debt_fina_buy_comm_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_FINA_BUY_COMM_QTY_FLOAT);
                    info.fina_return_comm_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_RETURN_COMM_QTY_FLOAT);
                    info.debt_loan_sell_comm_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_LOAN_SELL_COMM_QTY_FLOAT);
                    info.loan_return_comm_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_RETURN_COMM_QTY_FLOAT);
                    info.debt_fina_buy_strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_FINA_BUY_STRIKE_AMT_FLOAT);
                    info.fina_return_strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_RETURN_STRIKE_AMT_FLOAT);
                    info.debt_loan_sell_strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_LOAN_SELL_STRIKE_AMT_FLOAT);
                    info.loan_return_strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_RETURN_STRIKE_AMT_FLOAT);
                    info.debt_fina_buy_order_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_FINA_BUY_ORDER_AMT_FLOAT);
                    info.fina_return_order_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_RETURN_ORDER_AMT_FLOAT);
                    info.debt_loan_sell_order_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_LOAN_SELL_ORDER_AMT_FLOAT);
                    info.loan_return_order_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_RETURN_ORDER_AMT_FLOAT);
                    info.debt_fina_buy_comm_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_FINA_BUY_COMM_AMT_FLOAT);
                    info.fina_return_comm_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_RETURN_COMM_AMT_FLOAT);
                    info.debt_loan_sell_comm_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_LOAN_SELL_COMM_AMT_FLOAT);
                    info.loan_return_comm_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_RETURN_COMM_AMT_FLOAT);
                    info.debt_strike_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_STRIKE_FEE_FLOAT);
                    info.return_strike_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RETURN_STRIKE_FEE_FLOAT);
                    info.debt_interest = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_INTEREST_FLOAT);
                    info.return_interest_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RETURN_INTEREST_AMT_FLOAT);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdsecuL_2_68_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_2_69_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_2_69_Response()
        {
            this.tdsecuL_2_69_InfoList = new ObservableCollection<tdsecuL_2_69_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_2_69_Info> tdsecuL_2_69_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_2_69_Info info = new tdsecuL_2_69_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_type = unpacker.GetInt("stock_type");
            info.asset_type = unpacker.GetInt("asset_type");
            info.invest_type = unpacker.GetInt("invest_type");
            info.debt_type = unpacker.GetInt("debt_type");
            info.debt_fina_buy_strike_qty = unpacker.GetDouble("debt_fina_buy_strike_qty");
            info.fina_return_strike_qty = unpacker.GetDouble("fina_return_strike_qty");
            info.debt_loan_sell_strike_qty = unpacker.GetDouble("debt_loan_sell_strike_qty");
            info.loan_return_strike_qty = unpacker.GetDouble("loan_return_strike_qty");
            info.debt_fina_buy_order_qty = unpacker.GetDouble("debt_fina_buy_order_qty");
            info.fina_return_order_qty = unpacker.GetDouble("fina_return_order_qty");
            info.debt_loan_sell_order_qty = unpacker.GetDouble("debt_loan_sell_order_qty");
            info.loan_return_order_qty = unpacker.GetDouble("loan_return_order_qty");
            info.debt_fina_buy_comm_qty = unpacker.GetDouble("debt_fina_buy_comm_qty");
            info.fina_return_comm_qty = unpacker.GetDouble("fina_return_comm_qty");
            info.debt_loan_sell_comm_qty = unpacker.GetDouble("debt_loan_sell_comm_qty");
            info.loan_return_comm_qty = unpacker.GetDouble("loan_return_comm_qty");
            info.debt_fina_buy_strike_amt = unpacker.GetDouble("debt_fina_buy_strike_amt");
            info.fina_return_strike_amt = unpacker.GetDouble("fina_return_strike_amt");
            info.debt_loan_sell_strike_amt = unpacker.GetDouble("debt_loan_sell_strike_amt");
            info.loan_return_strike_amt = unpacker.GetDouble("loan_return_strike_amt");
            info.debt_fina_buy_order_amt = unpacker.GetDouble("debt_fina_buy_order_amt");
            info.fina_return_order_amt = unpacker.GetDouble("fina_return_order_amt");
            info.debt_loan_sell_order_amt = unpacker.GetDouble("debt_loan_sell_order_amt");
            info.loan_return_order_amt = unpacker.GetDouble("loan_return_order_amt");
            info.debt_fina_buy_comm_amt = unpacker.GetDouble("debt_fina_buy_comm_amt");
            info.fina_return_comm_amt = unpacker.GetDouble("fina_return_comm_amt");
            info.debt_loan_sell_comm_amt = unpacker.GetDouble("debt_loan_sell_comm_amt");
            info.loan_return_comm_amt = unpacker.GetDouble("loan_return_comm_amt");
            info.debt_strike_fee = unpacker.GetDouble("debt_strike_fee");
            info.return_strike_fee = unpacker.GetDouble("return_strike_fee");
            info.debt_interest = unpacker.GetDouble("debt_interest");
            info.return_interest_amt = unpacker.GetDouble("return_interest_amt");
            info.update_times = unpacker.GetInt("update_times");
            tdsecuL_2_69_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_2_69_InfoList.Add((tdsecuL_2_69_Info)info);
        }
        #endregion

        //逻辑_交易证券_账户_查询资产账户业务持仓负债结果集
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_2_69_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    info.invest_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INVEST_TYPE_INT);
                    info.debt_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_TYPE_INT);
                    info.debt_fina_buy_strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_FINA_BUY_STRIKE_QTY_FLOAT);
                    info.fina_return_strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_RETURN_STRIKE_QTY_FLOAT);
                    info.debt_loan_sell_strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_LOAN_SELL_STRIKE_QTY_FLOAT);
                    info.loan_return_strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_RETURN_STRIKE_QTY_FLOAT);
                    info.debt_fina_buy_order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_FINA_BUY_ORDER_QTY_FLOAT);
                    info.fina_return_order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_RETURN_ORDER_QTY_FLOAT);
                    info.debt_loan_sell_order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_LOAN_SELL_ORDER_QTY_FLOAT);
                    info.loan_return_order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_RETURN_ORDER_QTY_FLOAT);
                    info.debt_fina_buy_comm_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_FINA_BUY_COMM_QTY_FLOAT);
                    info.fina_return_comm_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_RETURN_COMM_QTY_FLOAT);
                    info.debt_loan_sell_comm_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_LOAN_SELL_COMM_QTY_FLOAT);
                    info.loan_return_comm_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_RETURN_COMM_QTY_FLOAT);
                    info.debt_fina_buy_strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_FINA_BUY_STRIKE_AMT_FLOAT);
                    info.fina_return_strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_RETURN_STRIKE_AMT_FLOAT);
                    info.debt_loan_sell_strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_LOAN_SELL_STRIKE_AMT_FLOAT);
                    info.loan_return_strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_RETURN_STRIKE_AMT_FLOAT);
                    info.debt_fina_buy_order_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_FINA_BUY_ORDER_AMT_FLOAT);
                    info.fina_return_order_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_RETURN_ORDER_AMT_FLOAT);
                    info.debt_loan_sell_order_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_LOAN_SELL_ORDER_AMT_FLOAT);
                    info.loan_return_order_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_RETURN_ORDER_AMT_FLOAT);
                    info.debt_fina_buy_comm_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_FINA_BUY_COMM_AMT_FLOAT);
                    info.fina_return_comm_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_RETURN_COMM_AMT_FLOAT);
                    info.debt_loan_sell_comm_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_LOAN_SELL_COMM_AMT_FLOAT);
                    info.loan_return_comm_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_RETURN_COMM_AMT_FLOAT);
                    info.debt_strike_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_STRIKE_FEE_FLOAT);
                    info.return_strike_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RETURN_STRIKE_FEE_FLOAT);
                    info.debt_interest = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_INTEREST_FLOAT);
                    info.return_interest_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RETURN_INTEREST_AMT_FLOAT);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdsecuL_2_69_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_2_70_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_2_70_Response()
        {
            this.tdsecuL_2_70_InfoList = new ObservableCollection<tdsecuL_2_70_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_2_70_Info> tdsecuL_2_70_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_2_70_Info info = new tdsecuL_2_70_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_type = unpacker.GetInt("stock_type");
            info.asset_type = unpacker.GetInt("asset_type");
            info.debt_type = unpacker.GetInt("debt_type");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.strike_fee = unpacker.GetDouble("strike_fee");
            info.debt_order_no = unpacker.GetInt("debt_order_no");
            info.report_no = unpacker.GetStr("report_no");
            info.order_date = unpacker.GetInt("order_date");
            info.order_time = unpacker.GetInt("order_time");
            info.order_dir = unpacker.GetInt("order_dir");
            info.order_price = unpacker.GetDouble("order_price");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.debt_amt = unpacker.GetDouble("debt_amt");
            info.debt_qty = unpacker.GetDouble("debt_qty");
            info.debt_fee = unpacker.GetDouble("debt_fee");
            info.debt_interest = unpacker.GetDouble("debt_interest");
            info.intrst_base_amt = unpacker.GetDouble("intrst_base_amt");
            info.debt_return_amt = unpacker.GetDouble("debt_return_amt");
            info.debt_return_qty = unpacker.GetDouble("debt_return_qty");
            info.return_interest_amt = unpacker.GetDouble("return_interest_amt");
            info.debt_status = unpacker.GetInt("debt_status");
            info.remark_info = unpacker.GetStr("remark_info");
            info.update_times = unpacker.GetInt("update_times");
            tdsecuL_2_70_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_2_70_InfoList.Add((tdsecuL_2_70_Info)info);
        }
        #endregion

        //逻辑_交易证券_账户_查询交易组负债明细结果集
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_2_70_Info();
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
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    info.debt_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_TYPE_INT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    info.strike_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_FEE_FLOAT);
                    info.debt_order_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_ORDER_NO_INT);
                    info.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    info.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    info.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    info.debt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_AMT_FLOAT);
                    info.debt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_QTY_FLOAT);
                    info.debt_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_FEE_FLOAT);
                    info.debt_interest = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_INTEREST_FLOAT);
                    info.intrst_base_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_BASE_AMT_FLOAT);
                    info.debt_return_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_RETURN_AMT_FLOAT);
                    info.debt_return_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_RETURN_QTY_FLOAT);
                    info.return_interest_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RETURN_INTEREST_AMT_FLOAT);
                    info.debt_status = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_STATUS_INT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdsecuL_2_70_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_2_90_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_2_90_Response()
        {
            this.tdsecuL_2_90_InfoList = new ObservableCollection<tdsecuL_2_90_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_2_90_Info> tdsecuL_2_90_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_2_90_Info info = new tdsecuL_2_90_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.update_date = unpacker.GetInt("update_date");
            info.update_time = unpacker.GetInt("update_time");
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
            info.trade_frozen_amt = unpacker.GetDouble("trade_frozen_amt");
            info.trade_unfroz_amt = unpacker.GetDouble("trade_unfroz_amt");
            info.trade_capt_amt = unpacker.GetDouble("trade_capt_amt");
            info.trade_releas_amt = unpacker.GetDouble("trade_releas_amt");
            info.strike_capt_amt = unpacker.GetDouble("strike_capt_amt");
            info.strike_releas_amt = unpacker.GetDouble("strike_releas_amt");
            info.update_times = unpacker.GetInt("update_times");
            tdsecuL_2_90_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_2_90_InfoList.Add((tdsecuL_2_90_Info)info);
        }
        #endregion

        //逻辑_交易证券_账户_根据操作员查询交易组资金
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_2_90_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    info.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
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
                    info.trade_frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_FROZEN_AMT_FLOAT);
                    info.trade_unfroz_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_UNFROZ_AMT_FLOAT);
                    info.trade_capt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CAPT_AMT_FLOAT);
                    info.trade_releas_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_RELEAS_AMT_FLOAT);
                    info.strike_capt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_CAPT_AMT_FLOAT);
                    info.strike_releas_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_AMT_FLOAT);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdsecuL_2_90_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_2_91_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_2_91_Response()
        {
            this.tdsecuL_2_91_InfoList = new ObservableCollection<tdsecuL_2_91_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_2_91_Info> tdsecuL_2_91_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_2_91_Info info = new tdsecuL_2_91_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.update_date = unpacker.GetInt("update_date");
            info.update_time = unpacker.GetInt("update_time");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.begin_qty = unpacker.GetDouble("begin_qty");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.frozen_qty = unpacker.GetDouble("frozen_qty");
            info.unfroz_qty = unpacker.GetDouble("unfroz_qty");
            info.comm_frozen_qty = unpacker.GetDouble("comm_frozen_qty");
            info.comm_unfroz_qty = unpacker.GetDouble("comm_unfroz_qty");
            info.comm_capt_qty = unpacker.GetDouble("comm_capt_qty");
            info.comm_releas_qty = unpacker.GetDouble("comm_releas_qty");
            info.trade_frozen_qty = unpacker.GetDouble("trade_frozen_qty");
            info.trade_unfroz_qty = unpacker.GetDouble("trade_unfroz_qty");
            info.trade_capt_qty = unpacker.GetDouble("trade_capt_qty");
            info.trade_releas_qty = unpacker.GetDouble("trade_releas_qty");
            info.strike_capt_qty = unpacker.GetDouble("strike_capt_qty");
            info.strike_releas_qty = unpacker.GetDouble("strike_releas_qty");
            info.strike_frozen_qty = unpacker.GetDouble("strike_frozen_qty");
            info.strike_unfroz_qty = unpacker.GetDouble("strike_unfroz_qty");
            info.cost_amt = unpacker.GetDouble("cost_amt");
            info.intrst_cost_amt = unpacker.GetDouble("intrst_cost_amt");
            info.update_times = unpacker.GetInt("update_times");
            info.realize_pandl = unpacker.GetDouble("realize_pandl");
            info.intrst_pandl = unpacker.GetDouble("intrst_pandl");
            tdsecuL_2_91_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_2_91_InfoList.Add((tdsecuL_2_91_Info)info);
        }
        #endregion

        //逻辑_交易证券_账户_根据操作员查询交易组持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_2_91_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    info.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.begin_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_QTY_FLOAT);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_QTY_FLOAT);
                    info.unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_QTY_FLOAT);
                    info.comm_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_FROZEN_QTY_FLOAT);
                    info.comm_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_UNFROZ_QTY_FLOAT);
                    info.comm_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_CAPT_QTY_FLOAT);
                    info.comm_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_RELEAS_QTY_FLOAT);
                    info.trade_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_FROZEN_QTY_FLOAT);
                    info.trade_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_UNFROZ_QTY_FLOAT);
                    info.trade_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CAPT_QTY_FLOAT);
                    info.trade_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_RELEAS_QTY_FLOAT);
                    info.strike_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_CAPT_QTY_FLOAT);
                    info.strike_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_QTY_FLOAT);
                    info.strike_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_FROZEN_QTY_FLOAT);
                    info.strike_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_UNFROZ_QTY_FLOAT);
                    info.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                    info.intrst_cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_COST_AMT_FLOAT);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    info.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    info.intrst_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_PANDL_FLOAT);
                    tdsecuL_2_91_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_2_92_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_2_92_Response()
        {
            this.tdsecuL_2_92_InfoList = new ObservableCollection<tdsecuL_2_92_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_2_92_Info> tdsecuL_2_92_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_2_92_Info info = new tdsecuL_2_92_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_type = unpacker.GetInt("stock_type");
            info.asset_type = unpacker.GetInt("asset_type");
            info.debt_type = unpacker.GetInt("debt_type");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.strike_fee = unpacker.GetDouble("strike_fee");
            info.debt_order_no = unpacker.GetInt("debt_order_no");
            info.report_no = unpacker.GetStr("report_no");
            info.order_date = unpacker.GetInt("order_date");
            info.order_time = unpacker.GetInt("order_time");
            info.order_dir = unpacker.GetInt("order_dir");
            info.order_price = unpacker.GetDouble("order_price");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.debt_amt = unpacker.GetDouble("debt_amt");
            info.debt_qty = unpacker.GetDouble("debt_qty");
            info.debt_fee = unpacker.GetDouble("debt_fee");
            info.debt_interest = unpacker.GetDouble("debt_interest");
            info.intrst_base_amt = unpacker.GetDouble("intrst_base_amt");
            info.debt_return_amt = unpacker.GetDouble("debt_return_amt");
            info.debt_return_qty = unpacker.GetDouble("debt_return_qty");
            info.return_interest_amt = unpacker.GetDouble("return_interest_amt");
            info.debt_status = unpacker.GetInt("debt_status");
            info.remark_info = unpacker.GetStr("remark_info");
            info.update_times = unpacker.GetInt("update_times");
            tdsecuL_2_92_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_2_92_InfoList.Add((tdsecuL_2_92_Info)info);
        }
        #endregion

        //逻辑_交易证券_账户_查询资产账户负债明细结果集
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_2_92_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    info.debt_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_TYPE_INT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    info.strike_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_FEE_FLOAT);
                    info.debt_order_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_ORDER_NO_INT);
                    info.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    info.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    info.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    info.debt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_AMT_FLOAT);
                    info.debt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_QTY_FLOAT);
                    info.debt_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_FEE_FLOAT);
                    info.debt_interest = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_INTEREST_FLOAT);
                    info.intrst_base_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_BASE_AMT_FLOAT);
                    info.debt_return_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_RETURN_AMT_FLOAT);
                    info.debt_return_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_RETURN_QTY_FLOAT);
                    info.return_interest_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RETURN_INTEREST_AMT_FLOAT);
                    info.debt_status = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_STATUS_INT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdsecuL_2_92_InfoList.Add(info);
                }
            }
        }
    }

}
