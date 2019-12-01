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
    public class pdsecuL_21_1_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_21_1_Response()
        {
            this.pdsecuL_21_1_InfoList = new ObservableCollection<pdsecuL_21_1_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_21_1_Info> pdsecuL_21_1_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_21_1_Info info = new pdsecuL_21_1_Info();
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
            info.invest_type = unpacker.GetInt("invest_type");
            info.stock_type = unpacker.GetInt("stock_type");
            info.asset_type = unpacker.GetInt("asset_type");
            info.debt_type = unpacker.GetInt("debt_type");
            info.begin_debt_qty = unpacker.GetDouble("begin_debt_qty");
            info.curr_debt_qty = unpacker.GetDouble("curr_debt_qty");
            info.posi_qty_check_diff = unpacker.GetDouble("posi_qty_check_diff");
            info.begin_debt_amt = unpacker.GetDouble("begin_debt_amt");
            info.curr_debt_amt = unpacker.GetDouble("curr_debt_amt");
            info.debt_interest_amt = unpacker.GetDouble("debt_interest_amt");
            info.debt_return_amt = unpacker.GetDouble("debt_return_amt");
            info.debt_return_qty = unpacker.GetDouble("debt_return_qty");
            info.return_interest_amt = unpacker.GetDouble("return_interest_amt");
            pdsecuL_21_1_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_21_1_InfoList.Add((pdsecuL_21_1_Info)info);
        }
        #endregion

        //逻辑_产品证券_融资融券_查询资产账户持仓负债
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdsecuL_21_1_Info();
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
                    info.invest_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INVEST_TYPE_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    info.debt_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_TYPE_INT);
                    info.begin_debt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DEBT_QTY_FLOAT);
                    info.curr_debt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_DEBT_QTY_FLOAT);
                    info.posi_qty_check_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_CHECK_DIFF_FLOAT);
                    info.begin_debt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DEBT_AMT_FLOAT);
                    info.curr_debt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_DEBT_AMT_FLOAT);
                    info.debt_interest_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_INTEREST_AMT_FLOAT);
                    info.debt_return_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_RETURN_AMT_FLOAT);
                    info.debt_return_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_RETURN_QTY_FLOAT);
                    info.return_interest_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RETURN_INTEREST_AMT_FLOAT);
                    pdsecuL_21_1_InfoList.Add(info);
                }
            }
        }
    }

    public class pdsecuL_21_2_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_21_2_Response()
        {
            this.pdsecuL_21_2_InfoList = new ObservableCollection<pdsecuL_21_2_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_21_2_Info> pdsecuL_21_2_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_21_2_Info info = new pdsecuL_21_2_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.update_date = unpacker.GetInt("update_date");
            info.update_time = unpacker.GetInt("update_time");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.invest_type = unpacker.GetInt("invest_type");
            info.stock_type = unpacker.GetInt("stock_type");
            info.asset_type = unpacker.GetInt("asset_type");
            info.debt_type = unpacker.GetInt("debt_type");
            info.begin_debt_qty = unpacker.GetDouble("begin_debt_qty");
            info.curr_debt_qty = unpacker.GetDouble("curr_debt_qty");
            info.posi_qty_check_diff = unpacker.GetDouble("posi_qty_check_diff");
            info.begin_debt_amt = unpacker.GetDouble("begin_debt_amt");
            info.curr_debt_amt = unpacker.GetDouble("curr_debt_amt");
            info.debt_interest_amt = unpacker.GetDouble("debt_interest_amt");
            info.debt_return_amt = unpacker.GetDouble("debt_return_amt");
            info.debt_return_qty = unpacker.GetDouble("debt_return_qty");
            info.return_interest_amt = unpacker.GetDouble("return_interest_amt");
            pdsecuL_21_2_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_21_2_InfoList.Add((pdsecuL_21_2_Info)info);
        }
        #endregion

        //逻辑_产品证券_融资融券_查询交易组持仓负债
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdsecuL_21_2_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    info.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.invest_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INVEST_TYPE_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    info.debt_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_TYPE_INT);
                    info.begin_debt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DEBT_QTY_FLOAT);
                    info.curr_debt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_DEBT_QTY_FLOAT);
                    info.posi_qty_check_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_CHECK_DIFF_FLOAT);
                    info.begin_debt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DEBT_AMT_FLOAT);
                    info.curr_debt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_DEBT_AMT_FLOAT);
                    info.debt_interest_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_INTEREST_AMT_FLOAT);
                    info.debt_return_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_RETURN_AMT_FLOAT);
                    info.debt_return_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_RETURN_QTY_FLOAT);
                    info.return_interest_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RETURN_INTEREST_AMT_FLOAT);
                    pdsecuL_21_2_InfoList.Add(info);
                }
            }
        }
    }

    public class pdsecuL_21_3_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_21_3_Response()
        {
            this.pdsecuL_21_3_InfoList = new ObservableCollection<pdsecuL_21_3_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_21_3_Info> pdsecuL_21_3_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_21_3_Info info = new pdsecuL_21_3_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.update_date = unpacker.GetInt("update_date");
            info.update_time = unpacker.GetInt("update_time");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.begin_amt = unpacker.GetDouble("begin_amt");
            info.loan_sell_amt = unpacker.GetDouble("loan_sell_amt");
            info.debt_interest_amt = unpacker.GetDouble("debt_interest_amt");
            pdsecuL_21_3_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_21_3_InfoList.Add((pdsecuL_21_3_Info)info);
        }
        #endregion

        //逻辑_产品证券_融资融券_查询交易组资金负债
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdsecuL_21_3_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    info.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.begin_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_AMT_FLOAT);
                    info.loan_sell_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_SELL_AMT_FLOAT);
                    info.debt_interest_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_INTEREST_AMT_FLOAT);
                    pdsecuL_21_3_InfoList.Add(info);
                }
            }
        }
    }

    public class pdsecuL_21_4_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_21_4_Response()
        {
            this.pdsecuL_21_4_InfoList = new ObservableCollection<pdsecuL_21_4_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_21_4_Info> pdsecuL_21_4_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_21_4_Info info = new pdsecuL_21_4_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.update_date = unpacker.GetInt("update_date");
            info.update_time = unpacker.GetInt("update_time");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.begin_amt = unpacker.GetDouble("begin_amt");
            info.loan_sell_amt = unpacker.GetDouble("loan_sell_amt");
            info.debt_interest_amt = unpacker.GetDouble("debt_interest_amt");
            pdsecuL_21_4_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_21_4_InfoList.Add((pdsecuL_21_4_Info)info);
        }
        #endregion

        //逻辑_产品证券_融资融券_查询资产账户资金负债
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdsecuL_21_4_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    info.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.begin_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_AMT_FLOAT);
                    info.loan_sell_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_SELL_AMT_FLOAT);
                    info.debt_interest_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_INTEREST_AMT_FLOAT);
                    pdsecuL_21_4_InfoList.Add(info);
                }
            }
        }
    }

    public class pdsecuL_21_5_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_21_5_Response()
        {
            this.pdsecuL_21_5_InfoList = new ObservableCollection<pdsecuL_21_5_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_21_5_Info> pdsecuL_21_5_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_21_5_Info info = new pdsecuL_21_5_Info();
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
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_type = unpacker.GetInt("stock_type");
            info.asset_type = unpacker.GetInt("asset_type");
            info.debt_type = unpacker.GetInt("debt_type");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.strike_fee = unpacker.GetDouble("strike_fee");
            info.order_no = unpacker.GetInt("order_no");
            info.report_no = unpacker.GetStr("report_no");
            info.order_date = unpacker.GetInt("order_date");
            info.order_time = unpacker.GetInt("order_time");
            info.order_dir = unpacker.GetInt("order_dir");
            info.order_price = unpacker.GetDouble("order_price");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.debt_intrst_rate = unpacker.GetDouble("debt_intrst_rate");
            info.begin_debt_amt = unpacker.GetDouble("begin_debt_amt");
            info.begin_debt_qty = unpacker.GetDouble("begin_debt_qty");
            info.debt_amt = unpacker.GetDouble("debt_amt");
            info.debt_qty = unpacker.GetDouble("debt_qty");
            info.debt_fee = unpacker.GetDouble("debt_fee");
            info.debt_interest = unpacker.GetDouble("debt_interest");
            info.intrst_base_amt = unpacker.GetDouble("intrst_base_amt");
            info.debt_return_amt = unpacker.GetDouble("debt_return_amt");
            info.debt_return_qty = unpacker.GetDouble("debt_return_qty");
            info.return_interest_amt = unpacker.GetDouble("return_interest_amt");
            info.interest_update_date = unpacker.GetInt("interest_update_date");
            info.debt_end_date = unpacker.GetInt("debt_end_date");
            info.orign_debt_end_date = unpacker.GetInt("orign_debt_end_date");
            info.defer_times = unpacker.GetInt("defer_times");
            info.debt_return_date = unpacker.GetInt("debt_return_date");
            info.debt_status = unpacker.GetInt("debt_status");
            info.remark_info = unpacker.GetStr("remark_info");
            pdsecuL_21_5_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_21_5_InfoList.Add((pdsecuL_21_5_Info)info);
        }
        #endregion

        //逻辑_产品证券_融资融券_查询资产账户负债明细
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdsecuL_21_5_Info();
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
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    info.debt_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_TYPE_INT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    info.strike_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_FEE_FLOAT);
                    info.order_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_NO_INT);
                    info.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    info.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    info.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    info.debt_intrst_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_INTRST_RATE_FLOAT);
                    info.begin_debt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DEBT_AMT_FLOAT);
                    info.begin_debt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DEBT_QTY_FLOAT);
                    info.debt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_AMT_FLOAT);
                    info.debt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_QTY_FLOAT);
                    info.debt_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_FEE_FLOAT);
                    info.debt_interest = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_INTEREST_FLOAT);
                    info.intrst_base_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_BASE_AMT_FLOAT);
                    info.debt_return_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_RETURN_AMT_FLOAT);
                    info.debt_return_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_RETURN_QTY_FLOAT);
                    info.return_interest_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RETURN_INTEREST_AMT_FLOAT);
                    info.interest_update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INTEREST_UPDATE_DATE_INT);
                    info.debt_end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_END_DATE_INT);
                    info.orign_debt_end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORIGN_DEBT_END_DATE_INT);
                    info.defer_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEFER_TIMES_INT);
                    info.debt_return_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_RETURN_DATE_INT);
                    info.debt_status = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_STATUS_INT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    pdsecuL_21_5_InfoList.Add(info);
                }
            }
        }
    }

    public class pdsecuL_21_6_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_21_6_Response()
        {
            this.pdsecuL_21_6_InfoList = new ObservableCollection<pdsecuL_21_6_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_21_6_Info> pdsecuL_21_6_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_21_6_Info info = new pdsecuL_21_6_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.update_date = unpacker.GetInt("update_date");
            info.update_time = unpacker.GetInt("update_time");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_type = unpacker.GetInt("stock_type");
            info.asset_type = unpacker.GetInt("asset_type");
            info.debt_type = unpacker.GetInt("debt_type");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.strike_fee = unpacker.GetDouble("strike_fee");
            info.order_no = unpacker.GetInt("order_no");
            info.report_no = unpacker.GetStr("report_no");
            info.order_date = unpacker.GetInt("order_date");
            info.order_time = unpacker.GetInt("order_time");
            info.order_dir = unpacker.GetInt("order_dir");
            info.order_price = unpacker.GetDouble("order_price");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.debt_intrst_rate = unpacker.GetDouble("debt_intrst_rate");
            info.begin_debt_amt = unpacker.GetDouble("begin_debt_amt");
            info.begin_debt_qty = unpacker.GetDouble("begin_debt_qty");
            info.debt_amt = unpacker.GetDouble("debt_amt");
            info.debt_qty = unpacker.GetDouble("debt_qty");
            info.debt_fee = unpacker.GetDouble("debt_fee");
            info.debt_interest = unpacker.GetDouble("debt_interest");
            info.intrst_base_amt = unpacker.GetDouble("intrst_base_amt");
            info.debt_return_amt = unpacker.GetDouble("debt_return_amt");
            info.debt_return_qty = unpacker.GetDouble("debt_return_qty");
            info.return_interest_amt = unpacker.GetDouble("return_interest_amt");
            info.interest_update_date = unpacker.GetInt("interest_update_date");
            info.debt_end_date = unpacker.GetInt("debt_end_date");
            info.orign_debt_end_date = unpacker.GetInt("orign_debt_end_date");
            info.defer_times = unpacker.GetInt("defer_times");
            info.debt_return_date = unpacker.GetInt("debt_return_date");
            info.debt_status = unpacker.GetInt("debt_status");
            info.remark_info = unpacker.GetStr("remark_info");
            pdsecuL_21_6_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_21_6_InfoList.Add((pdsecuL_21_6_Info)info);
        }
        #endregion

        //逻辑_产品证券_融资融券_查询交易组负债明细
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdsecuL_21_6_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    info.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    info.debt_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_TYPE_INT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    info.strike_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_FEE_FLOAT);
                    info.order_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_NO_INT);
                    info.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    info.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    info.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    info.debt_intrst_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_INTRST_RATE_FLOAT);
                    info.begin_debt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DEBT_AMT_FLOAT);
                    info.begin_debt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DEBT_QTY_FLOAT);
                    info.debt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_AMT_FLOAT);
                    info.debt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_QTY_FLOAT);
                    info.debt_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_FEE_FLOAT);
                    info.debt_interest = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_INTEREST_FLOAT);
                    info.intrst_base_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_BASE_AMT_FLOAT);
                    info.debt_return_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_RETURN_AMT_FLOAT);
                    info.debt_return_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_RETURN_QTY_FLOAT);
                    info.return_interest_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RETURN_INTEREST_AMT_FLOAT);
                    info.interest_update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INTEREST_UPDATE_DATE_INT);
                    info.debt_end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_END_DATE_INT);
                    info.orign_debt_end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORIGN_DEBT_END_DATE_INT);
                    info.defer_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEFER_TIMES_INT);
                    info.debt_return_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_RETURN_DATE_INT);
                    info.debt_status = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_STATUS_INT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    pdsecuL_21_6_InfoList.Add(info);
                }
            }
        }
    }

    public class pdsecuL_21_21_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_21_21_Response()
        {
            this.pdsecuL_21_21_InfoList = new ObservableCollection<pdsecuL_21_21_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_21_21_Info> pdsecuL_21_21_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_21_21_Info info = new pdsecuL_21_21_Info();
            pdsecuL_21_21_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_21_21_InfoList.Add((pdsecuL_21_21_Info)info);
        }
        #endregion

        //逻辑_产品证券_融资融券_归档产品证券融资融券数据
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdsecuL_21_21_Info();
                pdsecuL_21_21_InfoList.Add(info);
            }
        }
    }

    public class pdsecuL_21_22_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_21_22_Response()
        {
            this.pdsecuL_21_22_InfoList = new ObservableCollection<pdsecuL_21_22_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_21_22_Info> pdsecuL_21_22_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_21_22_Info info = new pdsecuL_21_22_Info();
            pdsecuL_21_22_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_21_22_InfoList.Add((pdsecuL_21_22_Info)info);
        }
        #endregion

        //逻辑_产品证券_融资融券_初始化融资融券数据
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdsecuL_21_22_Info();
                pdsecuL_21_22_InfoList.Add(info);
            }
        }
    }

    public class pdsecuL_21_7_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_21_7_Response()
        {
            this.pdsecuL_21_7_InfoList = new ObservableCollection<pdsecuL_21_7_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_21_7_Info> pdsecuL_21_7_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_21_7_Info info = new pdsecuL_21_7_Info();
            pdsecuL_21_7_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_21_7_InfoList.Add((pdsecuL_21_7_Info)info);
        }
        #endregion

        //逻辑_产品证券_融资融券_红冲蓝补交易组持仓负债
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdsecuL_21_7_Info();
                pdsecuL_21_7_InfoList.Add(info);
            }
        }
    }

}
