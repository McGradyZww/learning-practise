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
    public class pubL_28_101_Response : IResponse
    {
        #region 构造函数
        public pubL_28_101_Response()
        {
            this.pubL_28_101_InfoList = new ObservableCollection<pubL_28_101_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_28_101_Info> pubL_28_101_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_28_101_Info info = new pubL_28_101_Info();
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_name = unpacker.GetStr("stock_name");
            info.trade_code = unpacker.GetStr("trade_code");
            info.target_code = unpacker.GetStr("target_code");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.trade_code_no = unpacker.GetInt("trade_code_no");
            info.target_code_no = unpacker.GetInt("target_code_no");
            info.apply_date = unpacker.GetInt("apply_date");
            info.apply_limit = unpacker.GetDouble("apply_limit");
            info.begin_trade_date = unpacker.GetInt("begin_trade_date");
            info.issue_price = unpacker.GetDouble("issue_price");
            pubL_28_101_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_28_101_InfoList.Add((pubL_28_101_Info)info);
        }
        #endregion

        //逻辑_公共_基础数据同步_查询新股信息表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_28_101_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    info.trade_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_STR);
                    info.target_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_STR);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.trade_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_NO_INT);
                    info.target_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_NO_INT);
                    info.apply_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_APPLY_DATE_INT);
                    info.apply_limit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_APPLY_LIMIT_FLOAT);
                    info.begin_trade_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TRADE_DATE_INT);
                    info.issue_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ISSUE_PRICE_FLOAT);
                    pubL_28_101_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_28_102_Response : IResponse
    {
        #region 构造函数
        public pubL_28_102_Response()
        {
            this.pubL_28_102_InfoList = new ObservableCollection<pubL_28_102_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_28_102_Info> pubL_28_102_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_28_102_Info info = new pubL_28_102_Info();
            pubL_28_102_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_28_102_InfoList.Add((pubL_28_102_Info)info);
        }
        #endregion

        //逻辑_公共_基础数据同步_更新新股信息表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_28_102_Info();
                pubL_28_102_InfoList.Add(info);
            }
        }
    }

    public class pubL_28_111_Response : IResponse
    {
        #region 构造函数
        public pubL_28_111_Response()
        {
            this.pubL_28_111_InfoList = new ObservableCollection<pubL_28_111_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_28_111_Info> pubL_28_111_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_28_111_Info info = new pubL_28_111_Info();
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_name = unpacker.GetStr("stock_name");
            info.pinyin_short = unpacker.GetStr("pinyin_short");
            info.stock_type = unpacker.GetInt("stock_type");
            info.asset_type = unpacker.GetInt("asset_type");
            info.par_value = unpacker.GetDouble("par_value");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.exch_crncy_type = unpacker.GetStr("exch_crncy_type");
            info.total_stock_issue = unpacker.GetDouble("total_stock_issue");
            info.circl_stock_capit = unpacker.GetDouble("circl_stock_capit");
            info.capit_reback_days = unpacker.GetInt("capit_reback_days");
            info.posi_reback_days = unpacker.GetInt("posi_reback_days");
            info.type_unit = unpacker.GetInt("type_unit");
            info.report_unit = unpacker.GetInt("report_unit");
            info.min_unit = unpacker.GetInt("min_unit");
            info.max_qty = unpacker.GetDouble("max_qty");
            info.min_qty = unpacker.GetDouble("min_qty");
            info.is_order_dir_flag = unpacker.GetInt("is_order_dir_flag");
            info.price_up = unpacker.GetDouble("price_up");
            info.price_down = unpacker.GetDouble("price_down");
            info.step_price = unpacker.GetDouble("step_price");
            info.fair_price = unpacker.GetDouble("fair_price");
            info.stop_status = unpacker.GetStr("stop_status");
            info.hk_stock_flag = unpacker.GetInt("hk_stock_flag");
            info.time_stamp = unpacker.GetInt("time_stamp");
            pubL_28_111_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_28_111_InfoList.Add((pubL_28_111_Info)info);
        }
        #endregion

        //逻辑_公共_基础数据同步_查询证券代码信息表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_28_111_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    info.pinyin_short = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PINYIN_SHORT_STR);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    info.par_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_FLOAT);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.exch_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR);
                    info.total_stock_issue = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_STOCK_ISSUE_FLOAT);
                    info.circl_stock_capit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CIRCL_STOCK_CAPIT_FLOAT);
                    info.capit_reback_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CAPIT_REBACK_DAYS_INT);
                    info.posi_reback_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_POSI_REBACK_DAYS_INT);
                    info.type_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TYPE_UNIT_INT);
                    info.report_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_UNIT_INT);
                    info.min_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MIN_UNIT_INT);
                    info.max_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_QTY_FLOAT);
                    info.min_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_QTY_FLOAT);
                    info.is_order_dir_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_ORDER_DIR_FLAG_INT);
                    info.price_up = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_UP_FLOAT);
                    info.price_down = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_DOWN_FLOAT);
                    info.step_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STEP_PRICE_FLOAT);
                    info.fair_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FAIR_PRICE_FLOAT);
                    info.stop_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOP_STATUS_STR);
                    info.hk_stock_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HK_STOCK_FLAG_INT);
                    info.time_stamp = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT);
                    pubL_28_111_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_28_112_Response : IResponse
    {
        #region 构造函数
        public pubL_28_112_Response()
        {
            this.pubL_28_112_InfoList = new ObservableCollection<pubL_28_112_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_28_112_Info> pubL_28_112_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_28_112_Info info = new pubL_28_112_Info();
            pubL_28_112_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_28_112_InfoList.Add((pubL_28_112_Info)info);
        }
        #endregion

        //逻辑_公共_基础数据同步_更新证券代码信息表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_28_112_Info();
                pubL_28_112_InfoList.Add(info);
            }
        }
    }

    public class pubL_28_121_Response : IResponse
    {
        #region 构造函数
        public pubL_28_121_Response()
        {
            this.pubL_28_121_InfoList = new ObservableCollection<pubL_28_121_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_28_121_Info> pubL_28_121_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_28_121_Info info = new pubL_28_121_Info();
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.trade_code = unpacker.GetStr("trade_code");
            info.target_code = unpacker.GetStr("target_code");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.trade_code_no = unpacker.GetInt("trade_code_no");
            info.target_code_no = unpacker.GetInt("target_code_no");
            info.stock_name = unpacker.GetStr("stock_name");
            info.issue_date = unpacker.GetInt("issue_date");
            info.end_date = unpacker.GetInt("end_date");
            info.value_date = unpacker.GetInt("value_date");
            info.next_value_date = unpacker.GetInt("next_value_date");
            info.begin_trade_date = unpacker.GetInt("begin_trade_date");
            info.bond_limit = unpacker.GetDouble("bond_limit");
            info.issue_price = unpacker.GetDouble("issue_price");
            info.par_value = unpacker.GetDouble("par_value");
            info.intrst_ratio = unpacker.GetDouble("intrst_ratio");
            info.intrst_days = unpacker.GetInt("intrst_days");
            info.pay_inteval = unpacker.GetInt("pay_inteval");
            info.bond_accr_intrst = unpacker.GetDouble("bond_accr_intrst");
            info.bond_rate_type = unpacker.GetInt("bond_rate_type");
            info.inteval_days = unpacker.GetInt("inteval_days");
            info.net_price_flag = unpacker.GetInt("net_price_flag");
            info.last_trade_date = unpacker.GetInt("last_trade_date");
            info.rights_type = unpacker.GetInt("rights_type");
            info.trans_begin_date = unpacker.GetInt("trans_begin_date");
            info.trans_end_date = unpacker.GetInt("trans_end_date");
            info.exec_begin_date = unpacker.GetInt("exec_begin_date");
            info.exec_end_date = unpacker.GetInt("exec_end_date");
            info.impawn_ratio = unpacker.GetDouble("impawn_ratio");
            info.pay_intrst_flag = unpacker.GetInt("pay_intrst_flag");
            info.time_stamp = unpacker.GetInt("time_stamp");
            pubL_28_121_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_28_121_InfoList.Add((pubL_28_121_Info)info);
        }
        #endregion

        //逻辑_公共_基础数据同步_查询债券属性信息表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_28_121_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.trade_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_STR);
                    info.target_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_STR);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.trade_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_NO_INT);
                    info.target_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_NO_INT);
                    info.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    info.issue_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ISSUE_DATE_INT);
                    info.end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT);
                    info.value_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_VALUE_DATE_INT);
                    info.next_value_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NEXT_VALUE_DATE_INT);
                    info.begin_trade_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TRADE_DATE_INT);
                    info.bond_limit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_LIMIT_FLOAT);
                    info.issue_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ISSUE_PRICE_FLOAT);
                    info.par_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_FLOAT);
                    info.intrst_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_RATIO_FLOAT);
                    info.intrst_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_DAYS_INT);
                    info.pay_inteval = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PAY_INTEVAL_INT);
                    info.bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT);
                    info.bond_rate_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BOND_RATE_TYPE_INT);
                    info.inteval_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INTEVAL_DAYS_INT);
                    info.net_price_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLAG_INT);
                    info.last_trade_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LAST_TRADE_DATE_INT);
                    info.rights_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RIGHTS_TYPE_INT);
                    info.trans_begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_BEGIN_DATE_INT);
                    info.trans_end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_END_DATE_INT);
                    info.exec_begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_BEGIN_DATE_INT);
                    info.exec_end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_END_DATE_INT);
                    info.impawn_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_IMPAWN_RATIO_FLOAT);
                    info.pay_intrst_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PAY_INTRST_FLAG_INT);
                    info.time_stamp = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT);
                    pubL_28_121_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_28_122_Response : IResponse
    {
        #region 构造函数
        public pubL_28_122_Response()
        {
            this.pubL_28_122_InfoList = new ObservableCollection<pubL_28_122_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_28_122_Info> pubL_28_122_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_28_122_Info info = new pubL_28_122_Info();
            pubL_28_122_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_28_122_InfoList.Add((pubL_28_122_Info)info);
        }
        #endregion

        //逻辑_公共_基础数据同步_更新债券属性信息表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_28_122_Info();
                pubL_28_122_InfoList.Add(info);
            }
        }
    }

    public class pubL_28_131_Response : IResponse
    {
        #region 构造函数
        public pubL_28_131_Response()
        {
            this.pubL_28_131_InfoList = new ObservableCollection<pubL_28_131_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_28_131_Info> pubL_28_131_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_28_131_Info info = new pubL_28_131_Info();
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_name = unpacker.GetStr("stock_name");
            info.up_limit_price = unpacker.GetDouble("up_limit_price");
            info.down_limit_price = unpacker.GetDouble("down_limit_price");
            info.last_price = unpacker.GetDouble("last_price");
            info.pre_close_price = unpacker.GetDouble("pre_close_price");
            info.today_open_price = unpacker.GetDouble("today_open_price");
            info.today_close_price = unpacker.GetDouble("today_close_price");
            info.today_max_price = unpacker.GetDouble("today_max_price");
            info.today_min_price = unpacker.GetDouble("today_min_price");
            info.buy_price_1 = unpacker.GetDouble("buy_price_1");
            info.buy_qty_1 = unpacker.GetDouble("buy_qty_1");
            info.buy_price_2 = unpacker.GetDouble("buy_price_2");
            info.buy_qty_2 = unpacker.GetDouble("buy_qty_2");
            info.buy_price_3 = unpacker.GetDouble("buy_price_3");
            info.buy_qty_3 = unpacker.GetDouble("buy_qty_3");
            info.buy_price_4 = unpacker.GetDouble("buy_price_4");
            info.buy_qty_4 = unpacker.GetDouble("buy_qty_4");
            info.buy_price_5 = unpacker.GetDouble("buy_price_5");
            info.buy_qty_5 = unpacker.GetDouble("buy_qty_5");
            info.sell_price_1 = unpacker.GetDouble("sell_price_1");
            info.sell_qty_1 = unpacker.GetDouble("sell_qty_1");
            info.sell_price_2 = unpacker.GetDouble("sell_price_2");
            info.sell_qty_2 = unpacker.GetDouble("sell_qty_2");
            info.sell_price_3 = unpacker.GetDouble("sell_price_3");
            info.sell_qty_3 = unpacker.GetDouble("sell_qty_3");
            info.sell_price_4 = unpacker.GetDouble("sell_price_4");
            info.sell_qty_4 = unpacker.GetDouble("sell_qty_4");
            info.sell_price_5 = unpacker.GetDouble("sell_price_5");
            info.sell_qty_5 = unpacker.GetDouble("sell_qty_5");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.pe_ratio = unpacker.GetDouble("pe_ratio");
            info.time_stamp = unpacker.GetInt("time_stamp");
            pubL_28_131_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_28_131_InfoList.Add((pubL_28_131_Info)info);
        }
        #endregion

        //逻辑_公共_基础数据同步_查询证券行情表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_28_131_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    info.up_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UP_LIMIT_PRICE_FLOAT);
                    info.down_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DOWN_LIMIT_PRICE_FLOAT);
                    info.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    info.pre_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_CLOSE_PRICE_FLOAT);
                    info.today_open_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_OPEN_PRICE_FLOAT);
                    info.today_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_CLOSE_PRICE_FLOAT);
                    info.today_max_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_MAX_PRICE_FLOAT);
                    info.today_min_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_MIN_PRICE_FLOAT);
                    info.buy_price_1 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_PRICE_1_FLOAT);
                    info.buy_qty_1 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_QTY_1_FLOAT);
                    info.buy_price_2 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_PRICE_2_FLOAT);
                    info.buy_qty_2 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_QTY_2_FLOAT);
                    info.buy_price_3 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_PRICE_3_FLOAT);
                    info.buy_qty_3 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_QTY_3_FLOAT);
                    info.buy_price_4 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_PRICE_4_FLOAT);
                    info.buy_qty_4 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_QTY_4_FLOAT);
                    info.buy_price_5 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_PRICE_5_FLOAT);
                    info.buy_qty_5 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_QTY_5_FLOAT);
                    info.sell_price_1 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_PRICE_1_FLOAT);
                    info.sell_qty_1 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_QTY_1_FLOAT);
                    info.sell_price_2 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_PRICE_2_FLOAT);
                    info.sell_qty_2 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_QTY_2_FLOAT);
                    info.sell_price_3 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_PRICE_3_FLOAT);
                    info.sell_qty_3 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_QTY_3_FLOAT);
                    info.sell_price_4 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_PRICE_4_FLOAT);
                    info.sell_qty_4 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_QTY_4_FLOAT);
                    info.sell_price_5 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_PRICE_5_FLOAT);
                    info.sell_qty_5 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_QTY_5_FLOAT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    info.pe_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PE_RATIO_FLOAT);
                    info.time_stamp = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT);
                    pubL_28_131_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_28_132_Response : IResponse
    {
        #region 构造函数
        public pubL_28_132_Response()
        {
            this.pubL_28_132_InfoList = new ObservableCollection<pubL_28_132_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_28_132_Info> pubL_28_132_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_28_132_Info info = new pubL_28_132_Info();
            pubL_28_132_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_28_132_InfoList.Add((pubL_28_132_Info)info);
        }
        #endregion

        //逻辑_公共_基础数据同步_更新证券行情表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_28_132_Info();
                pubL_28_132_InfoList.Add(info);
            }
        }
    }

    public class pubL_28_141_Response : IResponse
    {
        #region 构造函数
        public pubL_28_141_Response()
        {
            this.pubL_28_141_InfoList = new ObservableCollection<pubL_28_141_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_28_141_Info> pubL_28_141_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_28_141_Info info = new pubL_28_141_Info();
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.exch_no = unpacker.GetInt("exch_no");
            info.trade_code = unpacker.GetStr("trade_code");
            info.target_code = unpacker.GetStr("target_code");
            info.time_stamp = unpacker.GetInt("time_stamp");
            pubL_28_141_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_28_141_InfoList.Add((pubL_28_141_Info)info);
        }
        #endregion

        //逻辑_公共_基础数据同步_查询代码映射表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_28_141_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.trade_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_STR);
                    info.target_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_STR);
                    info.time_stamp = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT);
                    pubL_28_141_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_28_142_Response : IResponse
    {
        #region 构造函数
        public pubL_28_142_Response()
        {
            this.pubL_28_142_InfoList = new ObservableCollection<pubL_28_142_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_28_142_Info> pubL_28_142_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_28_142_Info info = new pubL_28_142_Info();
            pubL_28_142_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_28_142_InfoList.Add((pubL_28_142_Info)info);
        }
        #endregion

        //逻辑_公共_基础数据同步_更新代码映射表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_28_142_Info();
                pubL_28_142_InfoList.Add(info);
            }
        }
    }

    public class pubL_28_151_Response : IResponse
    {
        #region 构造函数
        public pubL_28_151_Response()
        {
            this.pubL_28_151_InfoList = new ObservableCollection<pubL_28_151_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_28_151_Info> pubL_28_151_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_28_151_Info info = new pubL_28_151_Info();
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.order_dir = unpacker.GetInt("order_dir");
            info.cash_frozen_type = unpacker.GetInt("cash_frozen_type");
            info.order_split_flag = unpacker.GetInt("order_split_flag");
            info.min_unit = unpacker.GetInt("min_unit");
            info.max_qty = unpacker.GetDouble("max_qty");
            info.min_qty = unpacker.GetDouble("min_qty");
            info.time_stamp = unpacker.GetInt("time_stamp");
            pubL_28_151_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_28_151_InfoList.Add((pubL_28_151_Info)info);
        }
        #endregion

        //逻辑_公共_基础数据同步_查询证券代码订单方向表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_28_151_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.cash_frozen_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CASH_FROZEN_TYPE_INT);
                    info.order_split_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_SPLIT_FLAG_INT);
                    info.min_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MIN_UNIT_INT);
                    info.max_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_QTY_FLOAT);
                    info.min_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_QTY_FLOAT);
                    info.time_stamp = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT);
                    pubL_28_151_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_28_152_Response : IResponse
    {
        #region 构造函数
        public pubL_28_152_Response()
        {
            this.pubL_28_152_InfoList = new ObservableCollection<pubL_28_152_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_28_152_Info> pubL_28_152_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_28_152_Info info = new pubL_28_152_Info();
            pubL_28_152_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_28_152_InfoList.Add((pubL_28_152_Info)info);
        }
        #endregion

        //逻辑_公共_基础数据同步_更新证券代码订单方向表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_28_152_Info();
                pubL_28_152_InfoList.Add(info);
            }
        }
    }

    public class pubL_28_161_Response : IResponse
    {
        #region 构造函数
        public pubL_28_161_Response()
        {
            this.pubL_28_161_InfoList = new ObservableCollection<pubL_28_161_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_28_161_Info> pubL_28_161_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_28_161_Info info = new pubL_28_161_Info();
            info.init_date = unpacker.GetInt("init_date");
            info.exch_no = unpacker.GetInt("exch_no");
            info.for_crncy_type = unpacker.GetStr("for_crncy_type");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.buy_ref_rate = unpacker.GetDouble("buy_ref_rate");
            info.sell_ref_rate = unpacker.GetDouble("sell_ref_rate");
            info.settle_buy_rate = unpacker.GetDouble("settle_buy_rate");
            info.settle_sell_rate = unpacker.GetDouble("settle_sell_rate");
            info.pboc_rate = unpacker.GetDouble("pboc_rate");
            pubL_28_161_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_28_161_InfoList.Add((pubL_28_161_Info)info);
        }
        #endregion

        //逻辑_公共_基础数据同步_查询港股通汇率表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_28_161_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.for_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FOR_CRNCY_TYPE_STR);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.buy_ref_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_REF_RATE_FLOAT);
                    info.sell_ref_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_REF_RATE_FLOAT);
                    info.settle_buy_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SETTLE_BUY_RATE_FLOAT);
                    info.settle_sell_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SETTLE_SELL_RATE_FLOAT);
                    info.pboc_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PBOC_RATE_FLOAT);
                    pubL_28_161_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_28_162_Response : IResponse
    {
        #region 构造函数
        public pubL_28_162_Response()
        {
            this.pubL_28_162_InfoList = new ObservableCollection<pubL_28_162_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_28_162_Info> pubL_28_162_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_28_162_Info info = new pubL_28_162_Info();
            pubL_28_162_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_28_162_InfoList.Add((pubL_28_162_Info)info);
        }
        #endregion

        //逻辑_公共_基础数据同步_更新港股通汇率表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_28_162_Info();
                pubL_28_162_InfoList.Add(info);
            }
        }
    }

    public class pubL_28_171_Response : IResponse
    {
        #region 构造函数
        public pubL_28_171_Response()
        {
            this.pubL_28_171_InfoList = new ObservableCollection<pubL_28_171_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_28_171_Info> pubL_28_171_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_28_171_Info info = new pubL_28_171_Info();
            pubL_28_171_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_28_171_InfoList.Add((pubL_28_171_Info)info);
        }
        #endregion

        //逻辑_公共_基础数据同步_更新A股股本信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_28_171_Info();
                pubL_28_171_InfoList.Add(info);
            }
        }
    }

    public class pubL_28_172_Response : IResponse
    {
        #region 构造函数
        public pubL_28_172_Response()
        {
            this.pubL_28_172_InfoList = new ObservableCollection<pubL_28_172_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_28_172_Info> pubL_28_172_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_28_172_Info info = new pubL_28_172_Info();
            pubL_28_172_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_28_172_InfoList.Add((pubL_28_172_Info)info);
        }
        #endregion

        //逻辑_公共_基础数据同步_更新新股信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_28_172_Info();
                pubL_28_172_InfoList.Add(info);
            }
        }
    }

    public class pubL_28_173_Response : IResponse
    {
        #region 构造函数
        public pubL_28_173_Response()
        {
            this.pubL_28_173_InfoList = new ObservableCollection<pubL_28_173_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_28_173_Info> pubL_28_173_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_28_173_Info info = new pubL_28_173_Info();
            pubL_28_173_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_28_173_InfoList.Add((pubL_28_173_Info)info);
        }
        #endregion

        //逻辑_公共_基础数据同步_更新可转债发行信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_28_173_Info();
                pubL_28_173_InfoList.Add(info);
            }
        }
    }

    public class pubL_28_174_Response : IResponse
    {
        #region 构造函数
        public pubL_28_174_Response()
        {
            this.pubL_28_174_InfoList = new ObservableCollection<pubL_28_174_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_28_174_Info> pubL_28_174_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_28_174_Info info = new pubL_28_174_Info();
            pubL_28_174_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_28_174_InfoList.Add((pubL_28_174_Info)info);
        }
        #endregion

        //逻辑_公共_基础数据同步_更新基金信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_28_174_Info();
                pubL_28_174_InfoList.Add(info);
            }
        }
    }

    public class pubL_28_175_Response : IResponse
    {
        #region 构造函数
        public pubL_28_175_Response()
        {
            this.pubL_28_175_InfoList = new ObservableCollection<pubL_28_175_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_28_175_Info> pubL_28_175_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_28_175_Info info = new pubL_28_175_Info();
            pubL_28_175_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_28_175_InfoList.Add((pubL_28_175_Info)info);
        }
        #endregion

        //逻辑_公共_基础数据同步_更新债券信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_28_175_Info();
                pubL_28_175_InfoList.Add(info);
            }
        }
    }

    public class pubL_28_201_Response : IResponse
    {
        #region 构造函数
        public pubL_28_201_Response()
        {
            this.pubL_28_201_InfoList = new ObservableCollection<pubL_28_201_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_28_201_Info> pubL_28_201_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_28_201_Info info = new pubL_28_201_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.auto_sync_type = unpacker.GetInt("auto_sync_type");
            info.capital_batch_deal_range = unpacker.GetInt("capital_batch_deal_range");
            info.posi_batch_deal_range = unpacker.GetInt("posi_batch_deal_range");
            info.begin_time = unpacker.GetInt("begin_time");
            info.end_time = unpacker.GetInt("end_time");
            info.is_batch_deal = unpacker.GetInt("is_batch_deal");
            info.auto_sync_deal_flag = unpacker.GetInt("auto_sync_deal_flag");
            info.is_inner_check = unpacker.GetInt("is_inner_check");
            info.remark_info = unpacker.GetStr("remark_info");
            pubL_28_201_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_28_201_InfoList.Add((pubL_28_201_Info)info);
        }
        #endregion

        //逻辑_公共_基础数据同步_查询自动同步设置表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_28_201_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.auto_sync_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_AUTO_SYNC_TYPE_INT);
                    info.capital_batch_deal_range = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CAPITAL_BATCH_DEAL_RANGE_INT);
                    info.posi_batch_deal_range = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_POSI_BATCH_DEAL_RANGE_INT);
                    info.begin_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TIME_INT);
                    info.end_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_TIME_INT);
                    info.is_batch_deal = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_BATCH_DEAL_INT);
                    info.auto_sync_deal_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_AUTO_SYNC_DEAL_FLAG_INT);
                    info.is_inner_check = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_INNER_CHECK_INT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    pubL_28_201_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_28_202_Response : IResponse
    {
        #region 构造函数
        public pubL_28_202_Response()
        {
            this.pubL_28_202_InfoList = new ObservableCollection<pubL_28_202_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_28_202_Info> pubL_28_202_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_28_202_Info info = new pubL_28_202_Info();
            pubL_28_202_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_28_202_InfoList.Add((pubL_28_202_Info)info);
        }
        #endregion

        //逻辑_公共_基础数据同步_新增自动同步设置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_28_202_Info();
                pubL_28_202_InfoList.Add(info);
            }
        }
    }

    public class pubL_28_203_Response : IResponse
    {
        #region 构造函数
        public pubL_28_203_Response()
        {
            this.pubL_28_203_InfoList = new ObservableCollection<pubL_28_203_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_28_203_Info> pubL_28_203_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_28_203_Info info = new pubL_28_203_Info();
            pubL_28_203_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_28_203_InfoList.Add((pubL_28_203_Info)info);
        }
        #endregion

        //逻辑_公共_基础数据同步_修改自动同步设置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_28_203_Info();
                pubL_28_203_InfoList.Add(info);
            }
        }
    }

    public class pubL_28_204_Response : IResponse
    {
        #region 构造函数
        public pubL_28_204_Response()
        {
            this.pubL_28_204_InfoList = new ObservableCollection<pubL_28_204_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_28_204_Info> pubL_28_204_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_28_204_Info info = new pubL_28_204_Info();
            pubL_28_204_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_28_204_InfoList.Add((pubL_28_204_Info)info);
        }
        #endregion

        //逻辑_公共_基础数据同步_删除自动同步设置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_28_204_Info();
                pubL_28_204_InfoList.Add(info);
            }
        }
    }

    public class pubL_28_205_Response : IResponse
    {
        #region 构造函数
        public pubL_28_205_Response()
        {
            this.pubL_28_205_InfoList = new ObservableCollection<pubL_28_205_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_28_205_Info> pubL_28_205_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_28_205_Info info = new pubL_28_205_Info();
            pubL_28_205_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_28_205_InfoList.Add((pubL_28_205_Info)info);
        }
        #endregion

        //逻辑_公共_基础数据同步_更新自动同步处理标志
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_28_205_Info();
                pubL_28_205_InfoList.Add(info);
            }
        }
    }

    public class pubL_28_106_Response : IResponse
    {
        #region 构造函数
        public pubL_28_106_Response()
        {
            this.pubL_28_106_InfoList = new ObservableCollection<pubL_28_106_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_28_106_Info> pubL_28_106_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_28_106_Info info = new pubL_28_106_Info();
            info.co_no = unpacker.GetInt("co_no");
            info.process_type_name = unpacker.GetStr("process_type_name");
            info.process_name = unpacker.GetStr("process_name");
            info.event_msg_content = unpacker.GetStr("event_msg_content");
            info.remark_info = unpacker.GetStr("remark_info");
            pubL_28_106_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_28_106_InfoList.Add((pubL_28_106_Info)info);
        }
        #endregion

        //逻辑_公共_基础数据同步_查询自动同步日志表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_28_106_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.process_type_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PROCESS_TYPE_NAME_STR);
                    info.process_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PROCESS_NAME_STR);
                    info.event_msg_content = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EVENT_MSG_CONTENT_STR);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    pubL_28_106_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_28_107_Response : IResponse
    {
        #region 构造函数
        public pubL_28_107_Response()
        {
            this.pubL_28_107_InfoList = new ObservableCollection<pubL_28_107_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_28_107_Info> pubL_28_107_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_28_107_Info info = new pubL_28_107_Info();
            pubL_28_107_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_28_107_InfoList.Add((pubL_28_107_Info)info);
        }
        #endregion

        //逻辑_公共_基础数据同步_新增自动同步日志
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_28_107_Info();
                pubL_28_107_InfoList.Add(info);
            }
        }
    }

    public class pubL_28_108_Response : IResponse
    {
        #region 构造函数
        public pubL_28_108_Response()
        {
            this.pubL_28_108_InfoList = new ObservableCollection<pubL_28_108_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_28_108_Info> pubL_28_108_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_28_108_Info info = new pubL_28_108_Info();
            pubL_28_108_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_28_108_InfoList.Add((pubL_28_108_Info)info);
        }
        #endregion

        //逻辑_公共_基础数据同步_清空自动同步日志
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_28_108_Info();
                pubL_28_108_InfoList.Add(info);
            }
        }
    }

}
