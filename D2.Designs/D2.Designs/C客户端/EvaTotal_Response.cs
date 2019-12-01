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
    public class evaL_3_1_Response : IResponse
    {
        #region 构造函数
        public evaL_3_1_Response()
        {
            this.evaL_3_1_InfoList = new ObservableCollection<evaL_3_1_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_3_1_Info> evaL_3_1_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_3_1_Info info = new evaL_3_1_Info();
            evaL_3_1_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_3_1_InfoList.Add((evaL_3_1_Info)info);
        }
        #endregion

        //逻辑_平台估值_估值汇总_生成估值产品资产信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_3_1_Info();
                evaL_3_1_InfoList.Add(info);
            }
        }
    }

    public class evaL_3_2_Response : IResponse
    {
        #region 构造函数
        public evaL_3_2_Response()
        {
            this.evaL_3_2_InfoList = new ObservableCollection<evaL_3_2_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_3_2_Info> evaL_3_2_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_3_2_Info info = new evaL_3_2_Info();
            evaL_3_2_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_3_2_InfoList.Add((evaL_3_2_Info)info);
        }
        #endregion

        //逻辑_平台估值_估值汇总_估值产品基础数据准备
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_3_2_Info();
                evaL_3_2_InfoList.Add(info);
            }
        }
    }

    public class evaL_3_3_Response : IResponse
    {
        #region 构造函数
        public evaL_3_3_Response()
        {
            this.evaL_3_3_InfoList = new ObservableCollection<evaL_3_3_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_3_3_Info> evaL_3_3_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_3_3_Info info = new evaL_3_3_Info();
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.pd_curr_share = unpacker.GetDouble("pd_curr_share");
            info.eva_pd_curr_share = unpacker.GetStr("eva_pd_curr_share");
            info.total_asset = unpacker.GetDouble("total_asset");
            info.nav_asset = unpacker.GetDouble("nav_asset");
            info.eva_nav_asset = unpacker.GetStr("eva_nav_asset");
            info.cash_bala = unpacker.GetDouble("cash_bala");
            info.acco_cash = unpacker.GetDouble("acco_cash");
            info.pre_acco_cash = unpacker.GetDouble("pre_acco_cash");
            info.stock_market_value = unpacker.GetDouble("stock_market_value");
            info.fund_asset = unpacker.GetDouble("fund_asset");
            info.bond_asset = unpacker.GetDouble("bond_asset");
            info.futu_asset = unpacker.GetDouble("futu_asset");
            info.option_asset = unpacker.GetDouble("option_asset");
            info.other_asset = unpacker.GetDouble("other_asset");
            info.accumulative_receivable = unpacker.GetDouble("accumulative_receivable");
            info.accumulative_payable = unpacker.GetDouble("accumulative_payable");
            info.apply_amt = unpacker.GetDouble("apply_amt");
            info.redemp_amt = unpacker.GetDouble("redemp_amt");
            info.unit_nav = unpacker.GetDouble("unit_nav");
            info.eva_unit_nav = unpacker.GetStr("eva_unit_nav");
            info.total_cash_divide = unpacker.GetDouble("total_cash_divide");
            info.total_unit_nav = unpacker.GetDouble("total_unit_nav");
            info.remark_info = unpacker.GetStr("remark_info");
            info.daily_pandl_ratio = unpacker.GetDouble("daily_pandl_ratio");
            info.update_date = unpacker.GetInt("update_date");
            info.update_time = unpacker.GetInt("update_time");
            evaL_3_3_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_3_3_InfoList.Add((evaL_3_3_Info)info);
        }
        #endregion

        //逻辑_平台估值_估值汇总_查询估值产品资产信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new evaL_3_3_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.pd_curr_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_CURR_SHARE_FLOAT);
                    info.eva_pd_curr_share = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EVA_PD_CURR_SHARE_STR);
                    info.total_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_ASSET_FLOAT);
                    info.nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT);
                    info.eva_nav_asset = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EVA_NAV_ASSET_STR);
                    info.cash_bala = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_BALA_FLOAT);
                    info.acco_cash = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_CASH_FLOAT);
                    info.pre_acco_cash = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ACCO_CASH_FLOAT);
                    info.stock_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_MARKET_VALUE_FLOAT);
                    info.fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_ASSET_FLOAT);
                    info.bond_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ASSET_FLOAT);
                    info.futu_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ASSET_FLOAT);
                    info.option_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPTION_ASSET_FLOAT);
                    info.other_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_ASSET_FLOAT);
                    info.accumulative_receivable = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCUMULATIVE_RECEIVABLE_FLOAT);
                    info.accumulative_payable = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCUMULATIVE_PAYABLE_FLOAT);
                    info.apply_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_APPLY_AMT_FLOAT);
                    info.redemp_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REDEMP_AMT_FLOAT);
                    info.unit_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_NAV_FLOAT);
                    info.eva_unit_nav = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EVA_UNIT_NAV_STR);
                    info.total_cash_divide = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_CASH_DIVIDE_FLOAT);
                    info.total_unit_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_UNIT_NAV_FLOAT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    info.daily_pandl_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DAILY_PANDL_RATIO_FLOAT);
                    info.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    info.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    evaL_3_3_InfoList.Add(info);
                }
            }
        }
    }

    public class evaL_3_4_Response : IResponse
    {
        #region 构造函数
        public evaL_3_4_Response()
        {
            this.evaL_3_4_InfoList = new ObservableCollection<evaL_3_4_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_3_4_Info> evaL_3_4_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_3_4_Info info = new evaL_3_4_Info();
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.pd_manage_fee = unpacker.GetDouble("pd_manage_fee");
            info.pd_trustee_fee = unpacker.GetDouble("pd_trustee_fee");
            info.pd_service_fee = unpacker.GetDouble("pd_service_fee");
            info.pd_cons_fee = unpacker.GetDouble("pd_cons_fee");
            info.pd_other_fee = unpacker.GetDouble("pd_other_fee");
            info.intrst_cacl_amt = unpacker.GetDouble("intrst_cacl_amt");
            info.intrst_base_amt = unpacker.GetDouble("intrst_base_amt");
            evaL_3_4_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_3_4_InfoList.Add((evaL_3_4_Info)info);
        }
        #endregion

        //逻辑_平台估值_估值汇总_查询估值产品应收应付汇总
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new evaL_3_4_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.pd_manage_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_MANAGE_FEE_FLOAT);
                    info.pd_trustee_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_TRUSTEE_FEE_FLOAT);
                    info.pd_service_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_SERVICE_FEE_FLOAT);
                    info.pd_cons_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_CONS_FEE_FLOAT);
                    info.pd_other_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_OTHER_FEE_FLOAT);
                    info.intrst_cacl_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_CACL_AMT_FLOAT);
                    info.intrst_base_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_BASE_AMT_FLOAT);
                    evaL_3_4_InfoList.Add(info);
                }
            }
        }
    }

    public class evaL_3_5_Response : IResponse
    {
        #region 构造函数
        public evaL_3_5_Response()
        {
            this.evaL_3_5_InfoList = new ObservableCollection<evaL_3_5_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_3_5_Info> evaL_3_5_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_3_5_Info info = new evaL_3_5_Info();
            evaL_3_5_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_3_5_InfoList.Add((evaL_3_5_Info)info);
        }
        #endregion

        //逻辑_平台估值_估值汇总_新增估值产品费用
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_3_5_Info();
                evaL_3_5_InfoList.Add(info);
            }
        }
    }

    public class evaL_3_6_Response : IResponse
    {
        #region 构造函数
        public evaL_3_6_Response()
        {
            this.evaL_3_6_InfoList = new ObservableCollection<evaL_3_6_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_3_6_Info> evaL_3_6_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_3_6_Info info = new evaL_3_6_Info();
            evaL_3_6_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_3_6_InfoList.Add((evaL_3_6_Info)info);
        }
        #endregion

        //逻辑_平台估值_估值汇总_修改估值产品费用
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_3_6_Info();
                evaL_3_6_InfoList.Add(info);
            }
        }
    }

    public class evaL_3_7_Response : IResponse
    {
        #region 构造函数
        public evaL_3_7_Response()
        {
            this.evaL_3_7_InfoList = new ObservableCollection<evaL_3_7_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_3_7_Info> evaL_3_7_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_3_7_Info info = new evaL_3_7_Info();
            evaL_3_7_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_3_7_InfoList.Add((evaL_3_7_Info)info);
        }
        #endregion

        //逻辑_平台估值_估值汇总_删除估值产品费用
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_3_7_Info();
                evaL_3_7_InfoList.Add(info);
            }
        }
    }

    public class evaL_3_8_Response : IResponse
    {
        #region 构造函数
        public evaL_3_8_Response()
        {
            this.evaL_3_8_InfoList = new ObservableCollection<evaL_3_8_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_3_8_Info> evaL_3_8_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_3_8_Info info = new evaL_3_8_Info();
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.pd_fee_type = unpacker.GetInt("pd_fee_type");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.begin_amt = unpacker.GetDouble("begin_amt");
            info.curr_amt = unpacker.GetDouble("curr_amt");
            info.pd_net_asset = unpacker.GetDouble("pd_net_asset");
            info.confirm_apply = unpacker.GetDouble("confirm_apply");
            info.remark_info = unpacker.GetStr("remark_info");
            info.manual_flag = unpacker.GetInt("manual_flag");
            evaL_3_8_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_3_8_InfoList.Add((evaL_3_8_Info)info);
        }
        #endregion

        //逻辑_平台估值_估值汇总_查询估值产品费用
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new evaL_3_8_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.pd_fee_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_FEE_TYPE_INT);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.begin_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_AMT_FLOAT);
                    info.curr_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_AMT_FLOAT);
                    info.pd_net_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_NET_ASSET_FLOAT);
                    info.confirm_apply = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CONFIRM_APPLY_FLOAT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    info.manual_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MANUAL_FLAG_INT);
                    evaL_3_8_InfoList.Add(info);
                }
            }
        }
    }

    public class evaL_3_9_Response : IResponse
    {
        #region 构造函数
        public evaL_3_9_Response()
        {
            this.evaL_3_9_InfoList = new ObservableCollection<evaL_3_9_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_3_9_Info> evaL_3_9_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_3_9_Info info = new evaL_3_9_Info();
            evaL_3_9_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_3_9_InfoList.Add((evaL_3_9_Info)info);
        }
        #endregion

        //逻辑_平台估值_估值汇总_新增估值产品利息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_3_9_Info();
                evaL_3_9_InfoList.Add(info);
            }
        }
    }

    public class evaL_3_10_Response : IResponse
    {
        #region 构造函数
        public evaL_3_10_Response()
        {
            this.evaL_3_10_InfoList = new ObservableCollection<evaL_3_10_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_3_10_Info> evaL_3_10_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_3_10_Info info = new evaL_3_10_Info();
            evaL_3_10_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_3_10_InfoList.Add((evaL_3_10_Info)info);
        }
        #endregion

        //逻辑_平台估值_估值汇总_修改估值产品利息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_3_10_Info();
                evaL_3_10_InfoList.Add(info);
            }
        }
    }

    public class evaL_3_11_Response : IResponse
    {
        #region 构造函数
        public evaL_3_11_Response()
        {
            this.evaL_3_11_InfoList = new ObservableCollection<evaL_3_11_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_3_11_Info> evaL_3_11_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_3_11_Info info = new evaL_3_11_Info();
            evaL_3_11_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_3_11_InfoList.Add((evaL_3_11_Info)info);
        }
        #endregion

        //逻辑_平台估值_估值汇总_删除估值产品利息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_3_11_Info();
                evaL_3_11_InfoList.Add(info);
            }
        }
    }

    public class evaL_3_12_Response : IResponse
    {
        #region 构造函数
        public evaL_3_12_Response()
        {
            this.evaL_3_12_InfoList = new ObservableCollection<evaL_3_12_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_3_12_Info> evaL_3_12_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_3_12_Info info = new evaL_3_12_Info();
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.pd_rate_type = unpacker.GetInt("pd_rate_type");
            info.asset_acco = unpacker.GetStr("asset_acco");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.begin_amt = unpacker.GetDouble("begin_amt");
            info.curr_amt = unpacker.GetDouble("curr_amt");
            info.intrst_base_amt = unpacker.GetDouble("intrst_base_amt");
            info.confirm_apply = unpacker.GetDouble("confirm_apply");
            info.remark_info = unpacker.GetStr("remark_info");
            info.manual_flag = unpacker.GetInt("manual_flag");
            evaL_3_12_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_3_12_InfoList.Add((evaL_3_12_Info)info);
        }
        #endregion

        //逻辑_平台估值_估值汇总_查询估值产品利息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new evaL_3_12_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.pd_rate_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_RATE_TYPE_INT);
                    info.asset_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STR);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.begin_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_AMT_FLOAT);
                    info.curr_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_AMT_FLOAT);
                    info.intrst_base_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_BASE_AMT_FLOAT);
                    info.confirm_apply = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CONFIRM_APPLY_FLOAT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    info.manual_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MANUAL_FLAG_INT);
                    evaL_3_12_InfoList.Add(info);
                }
            }
        }
    }

    public class evaL_3_13_Response : IResponse
    {
        #region 构造函数
        public evaL_3_13_Response()
        {
            this.evaL_3_13_InfoList = new ObservableCollection<evaL_3_13_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_3_13_Info> evaL_3_13_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_3_13_Info info = new evaL_3_13_Info();
            evaL_3_13_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_3_13_InfoList.Add((evaL_3_13_Info)info);
        }
        #endregion

        //逻辑_平台估值_估值汇总_生成估值产品历史资产信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_3_13_Info();
                evaL_3_13_InfoList.Add(info);
            }
        }
    }

    public class evaL_3_14_Response : IResponse
    {
        #region 构造函数
        public evaL_3_14_Response()
        {
            this.evaL_3_14_InfoList = new ObservableCollection<evaL_3_14_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_3_14_Info> evaL_3_14_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_3_14_Info info = new evaL_3_14_Info();
            evaL_3_14_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_3_14_InfoList.Add((evaL_3_14_Info)info);
        }
        #endregion

        //逻辑_平台估值_估值汇总_估值产品历史应收应付数据补算
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_3_14_Info();
                evaL_3_14_InfoList.Add(info);
            }
        }
    }

    public class evaL_3_15_Response : IResponse
    {
        #region 构造函数
        public evaL_3_15_Response()
        {
            this.evaL_3_15_InfoList = new ObservableCollection<evaL_3_15_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_3_15_Info> evaL_3_15_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_3_15_Info info = new evaL_3_15_Info();
            evaL_3_15_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_3_15_InfoList.Add((evaL_3_15_Info)info);
        }
        #endregion

        //逻辑_平台估值_估值汇总_估值产品历史数据重算
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_3_15_Info();
                evaL_3_15_InfoList.Add(info);
            }
        }
    }

    public class evaL_3_16_Response : IResponse
    {
        #region 构造函数
        public evaL_3_16_Response()
        {
            this.evaL_3_16_InfoList = new ObservableCollection<evaL_3_16_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_3_16_Info> evaL_3_16_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_3_16_Info info = new evaL_3_16_Info();
            evaL_3_16_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_3_16_InfoList.Add((evaL_3_16_Info)info);
        }
        #endregion

        //逻辑_平台估值_估值汇总_一键估值
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_3_16_Info();
                evaL_3_16_InfoList.Add(info);
            }
        }
    }

    public class evaL_3_17_Response : IResponse
    {
        #region 构造函数
        public evaL_3_17_Response()
        {
            this.evaL_3_17_InfoList = new ObservableCollection<evaL_3_17_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_3_17_Info> evaL_3_17_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_3_17_Info info = new evaL_3_17_Info();
            evaL_3_17_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_3_17_InfoList.Add((evaL_3_17_Info)info);
        }
        #endregion

        //逻辑_平台估值_估值汇总_新增估值产品费用流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_3_17_Info();
                evaL_3_17_InfoList.Add(info);
            }
        }
    }

    public class evaL_3_18_Response : IResponse
    {
        #region 构造函数
        public evaL_3_18_Response()
        {
            this.evaL_3_18_InfoList = new ObservableCollection<evaL_3_18_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_3_18_Info> evaL_3_18_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_3_18_Info info = new evaL_3_18_Info();
            evaL_3_18_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_3_18_InfoList.Add((evaL_3_18_Info)info);
        }
        #endregion

        //逻辑_平台估值_估值汇总_修改估值产品费用流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_3_18_Info();
                evaL_3_18_InfoList.Add(info);
            }
        }
    }

    public class evaL_3_19_Response : IResponse
    {
        #region 构造函数
        public evaL_3_19_Response()
        {
            this.evaL_3_19_InfoList = new ObservableCollection<evaL_3_19_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_3_19_Info> evaL_3_19_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_3_19_Info info = new evaL_3_19_Info();
            evaL_3_19_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_3_19_InfoList.Add((evaL_3_19_Info)info);
        }
        #endregion

        //逻辑_平台估值_估值汇总_删除估值产品费用流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_3_19_Info();
                evaL_3_19_InfoList.Add(info);
            }
        }
    }

    public class evaL_3_20_Response : IResponse
    {
        #region 构造函数
        public evaL_3_20_Response()
        {
            this.evaL_3_20_InfoList = new ObservableCollection<evaL_3_20_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_3_20_Info> evaL_3_20_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_3_20_Info info = new evaL_3_20_Info();
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.pd_fee_type = unpacker.GetInt("pd_fee_type");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.occur_amt = unpacker.GetDouble("occur_amt");
            info.remark_info = unpacker.GetStr("remark_info");
            evaL_3_20_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_3_20_InfoList.Add((evaL_3_20_Info)info);
        }
        #endregion

        //逻辑_平台估值_估值汇总_查询估值产品费用流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new evaL_3_20_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.pd_fee_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_FEE_TYPE_INT);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.occur_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_AMT_FLOAT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    evaL_3_20_InfoList.Add(info);
                }
            }
        }
    }

    public class evaL_3_21_Response : IResponse
    {
        #region 构造函数
        public evaL_3_21_Response()
        {
            this.evaL_3_21_InfoList = new ObservableCollection<evaL_3_21_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_3_21_Info> evaL_3_21_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_3_21_Info info = new evaL_3_21_Info();
            evaL_3_21_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_3_21_InfoList.Add((evaL_3_21_Info)info);
        }
        #endregion

        //逻辑_平台估值_估值汇总_新增估值产品利息流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_3_21_Info();
                evaL_3_21_InfoList.Add(info);
            }
        }
    }

    public class evaL_3_22_Response : IResponse
    {
        #region 构造函数
        public evaL_3_22_Response()
        {
            this.evaL_3_22_InfoList = new ObservableCollection<evaL_3_22_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_3_22_Info> evaL_3_22_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_3_22_Info info = new evaL_3_22_Info();
            evaL_3_22_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_3_22_InfoList.Add((evaL_3_22_Info)info);
        }
        #endregion

        //逻辑_平台估值_估值汇总_修改估值产品利息流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_3_22_Info();
                evaL_3_22_InfoList.Add(info);
            }
        }
    }

    public class evaL_3_23_Response : IResponse
    {
        #region 构造函数
        public evaL_3_23_Response()
        {
            this.evaL_3_23_InfoList = new ObservableCollection<evaL_3_23_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_3_23_Info> evaL_3_23_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_3_23_Info info = new evaL_3_23_Info();
            evaL_3_23_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_3_23_InfoList.Add((evaL_3_23_Info)info);
        }
        #endregion

        //逻辑_平台估值_估值汇总_删除估值产品利息流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_3_23_Info();
                evaL_3_23_InfoList.Add(info);
            }
        }
    }

    public class evaL_3_24_Response : IResponse
    {
        #region 构造函数
        public evaL_3_24_Response()
        {
            this.evaL_3_24_InfoList = new ObservableCollection<evaL_3_24_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_3_24_Info> evaL_3_24_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_3_24_Info info = new evaL_3_24_Info();
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.pd_rate_type = unpacker.GetInt("pd_rate_type");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.occur_amt = unpacker.GetDouble("occur_amt");
            info.remark_info = unpacker.GetStr("remark_info");
            evaL_3_24_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_3_24_InfoList.Add((evaL_3_24_Info)info);
        }
        #endregion

        //逻辑_平台估值_估值汇总_查询估值产品利息流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new evaL_3_24_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.pd_rate_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_RATE_TYPE_INT);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.occur_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_AMT_FLOAT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    evaL_3_24_InfoList.Add(info);
                }
            }
        }
    }

    public class evaL_3_25_Response : IResponse
    {
        #region 构造函数
        public evaL_3_25_Response()
        {
            this.evaL_3_25_InfoList = new ObservableCollection<evaL_3_25_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_3_25_Info> evaL_3_25_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_3_25_Info info = new evaL_3_25_Info();
            evaL_3_25_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_3_25_InfoList.Add((evaL_3_25_Info)info);
        }
        #endregion

        //逻辑_平台估值_估值汇总_新增外部估值科目数据
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_3_25_Info();
                evaL_3_25_InfoList.Add(info);
            }
        }
    }

    public class evaL_3_26_Response : IResponse
    {
        #region 构造函数
        public evaL_3_26_Response()
        {
            this.evaL_3_26_InfoList = new ObservableCollection<evaL_3_26_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_3_26_Info> evaL_3_26_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_3_26_Info info = new evaL_3_26_Info();
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.fina_acco_code = unpacker.GetStr("fina_acco_code");
            info.fina_acco_name = unpacker.GetStr("fina_acco_name");
            info.amount = unpacker.GetStr("amount");
            info.unit_cost = unpacker.GetStr("unit_cost");
            info.prime_cost = unpacker.GetStr("prime_cost");
            info.cost_net_ratio = unpacker.GetStr("cost_net_ratio");
            info.market_price = unpacker.GetStr("market_price");
            info.market_value = unpacker.GetStr("market_value");
            info.market_net_ratio = unpacker.GetStr("market_net_ratio");
            info.evalu_add_value = unpacker.GetDouble("evalu_add_value");
            info.evalu_add_str = unpacker.GetStr("evalu_add_str");
            info.stop_info = unpacker.GetStr("stop_info");
            info.rights_info = unpacker.GetStr("rights_info");
            evaL_3_26_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_3_26_InfoList.Add((evaL_3_26_Info)info);
        }
        #endregion

        //逻辑_平台估值_估值汇总_查询外部估值科目数据
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new evaL_3_26_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.fina_acco_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FINA_ACCO_CODE_STR);
                    info.fina_acco_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FINA_ACCO_NAME_STR);
                    info.amount = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_AMOUNT_STR);
                    info.unit_cost = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_COST_STR);
                    info.prime_cost = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PRIME_COST_STR);
                    info.cost_net_ratio = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COST_NET_RATIO_STR);
                    info.market_price = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_PRICE_STR);
                    info.market_value = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_VALUE_STR);
                    info.market_net_ratio = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_NET_RATIO_STR);
                    info.evalu_add_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_EVALU_ADD_VALUE_FLOAT);
                    info.evalu_add_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EVALU_ADD_STR_STR);
                    info.stop_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOP_INFO_STR);
                    info.rights_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RIGHTS_INFO_STR);
                    evaL_3_26_InfoList.Add(info);
                }
            }
        }
    }

    public class evaL_3_27_Response : IResponse
    {
        #region 构造函数
        public evaL_3_27_Response()
        {
            this.evaL_3_27_InfoList = new ObservableCollection<evaL_3_27_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_3_27_Info> evaL_3_27_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_3_27_Info info = new evaL_3_27_Info();
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.pd_curr_share = unpacker.GetDouble("pd_curr_share");
            info.pd_curr_share_std = unpacker.GetDouble("pd_curr_share_std");
            info.total_asset = unpacker.GetDouble("total_asset");
            info.total_asset_std = unpacker.GetDouble("total_asset_std");
            info.nav_asset = unpacker.GetDouble("nav_asset");
            info.nav_asset_std = unpacker.GetDouble("nav_asset_std");
            info.cash_bala = unpacker.GetDouble("cash_bala");
            info.cash_bala_std = unpacker.GetDouble("cash_bala_std");
            info.acco_cash = unpacker.GetDouble("acco_cash");
            info.acco_cash_std = unpacker.GetDouble("acco_cash_std");
            info.stock_market_value = unpacker.GetDouble("stock_market_value");
            info.stock_market_value_std = unpacker.GetDouble("stock_market_value_std");
            info.fund_asset = unpacker.GetDouble("fund_asset");
            info.fund_asset_std = unpacker.GetDouble("fund_asset_std");
            info.bond_asset = unpacker.GetDouble("bond_asset");
            info.bond_asset_std = unpacker.GetDouble("bond_asset_std");
            info.futu_asset = unpacker.GetDouble("futu_asset");
            info.futu_asset_std = unpacker.GetDouble("futu_asset_std");
            info.option_asset = unpacker.GetDouble("option_asset");
            info.option_asset_std = unpacker.GetDouble("option_asset_std");
            info.other_asset = unpacker.GetDouble("other_asset");
            info.other_asset_std = unpacker.GetDouble("other_asset_std");
            info.accumulative_receivable = unpacker.GetDouble("accumulative_receivable");
            info.accumulative_receivable_std = unpacker.GetDouble("accumulative_receivable_std");
            info.accumulative_payable = unpacker.GetDouble("accumulative_payable");
            info.accumulative_payable_std = unpacker.GetDouble("accumulative_payable_std");
            info.unit_nav = unpacker.GetDouble("unit_nav");
            info.unit_nav_std = unpacker.GetDouble("unit_nav_std");
            evaL_3_27_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_3_27_InfoList.Add((evaL_3_27_Info)info);
        }
        #endregion

        //逻辑_平台估值_估值汇总_查询外部估值数据核对结果
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new evaL_3_27_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.pd_curr_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_CURR_SHARE_FLOAT);
                    info.pd_curr_share_std = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_CURR_SHARE_STD_FLOAT);
                    info.total_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_ASSET_FLOAT);
                    info.total_asset_std = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_ASSET_STD_FLOAT);
                    info.nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT);
                    info.nav_asset_std = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_STD_FLOAT);
                    info.cash_bala = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_BALA_FLOAT);
                    info.cash_bala_std = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_BALA_STD_FLOAT);
                    info.acco_cash = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_CASH_FLOAT);
                    info.acco_cash_std = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_CASH_STD_FLOAT);
                    info.stock_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_MARKET_VALUE_FLOAT);
                    info.stock_market_value_std = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_MARKET_VALUE_STD_FLOAT);
                    info.fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_ASSET_FLOAT);
                    info.fund_asset_std = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_ASSET_STD_FLOAT);
                    info.bond_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ASSET_FLOAT);
                    info.bond_asset_std = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ASSET_STD_FLOAT);
                    info.futu_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ASSET_FLOAT);
                    info.futu_asset_std = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ASSET_STD_FLOAT);
                    info.option_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPTION_ASSET_FLOAT);
                    info.option_asset_std = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPTION_ASSET_STD_FLOAT);
                    info.other_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_ASSET_FLOAT);
                    info.other_asset_std = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_ASSET_STD_FLOAT);
                    info.accumulative_receivable = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCUMULATIVE_RECEIVABLE_FLOAT);
                    info.accumulative_receivable_std = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCUMULATIVE_RECEIVABLE_STD_FLOAT);
                    info.accumulative_payable = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCUMULATIVE_PAYABLE_FLOAT);
                    info.accumulative_payable_std = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCUMULATIVE_PAYABLE_STD_FLOAT);
                    info.unit_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_NAV_FLOAT);
                    info.unit_nav_std = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_NAV_STD_FLOAT);
                    evaL_3_27_InfoList.Add(info);
                }
            }
        }
    }

    public class evaL_3_28_Response : IResponse
    {
        #region 构造函数
        public evaL_3_28_Response()
        {
            this.evaL_3_28_InfoList = new ObservableCollection<evaL_3_28_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_3_28_Info> evaL_3_28_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_3_28_Info info = new evaL_3_28_Info();
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.pd_fee_type = unpacker.GetInt("pd_fee_type");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.curr_amt = unpacker.GetDouble("curr_amt");
            info.market_value = unpacker.GetStr("market_value");
            evaL_3_28_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_3_28_InfoList.Add((evaL_3_28_Info)info);
        }
        #endregion

        //逻辑_平台估值_估值汇总_查询外部估值费用核对结果
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new evaL_3_28_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.pd_fee_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_FEE_TYPE_INT);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.curr_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_AMT_FLOAT);
                    info.market_value = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_VALUE_STR);
                    evaL_3_28_InfoList.Add(info);
                }
            }
        }
    }

    public class evaL_3_29_Response : IResponse
    {
        #region 构造函数
        public evaL_3_29_Response()
        {
            this.evaL_3_29_InfoList = new ObservableCollection<evaL_3_29_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_3_29_Info> evaL_3_29_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_3_29_Info info = new evaL_3_29_Info();
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.asset_acco = unpacker.GetStr("asset_acco");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.curr_amt = unpacker.GetDouble("curr_amt");
            info.market_value = unpacker.GetStr("market_value");
            evaL_3_29_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_3_29_InfoList.Add((evaL_3_29_Info)info);
        }
        #endregion

        //逻辑_平台估值_估值汇总_查询外部估值利息核对结果
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new evaL_3_29_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.asset_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STR);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.curr_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_AMT_FLOAT);
                    info.market_value = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_VALUE_STR);
                    evaL_3_29_InfoList.Add(info);
                }
            }
        }
    }

    public class evaL_3_30_Response : IResponse
    {
        #region 构造函数
        public evaL_3_30_Response()
        {
            this.evaL_3_30_InfoList = new ObservableCollection<evaL_3_30_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_3_30_Info> evaL_3_30_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_3_30_Info info = new evaL_3_30_Info();
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.vat_loan = unpacker.GetDouble("vat_loan");
            info.calc_pay = unpacker.GetDouble("calc_pay");
            info.vat_pay_offset = unpacker.GetDouble("vat_pay_offset");
            info.vat_transfer = unpacker.GetDouble("vat_transfer");
            info.vat_pay_add = unpacker.GetDouble("vat_pay_add");
            info.calc_estimate = unpacker.GetDouble("calc_estimate");
            info.vat_estimate_offset = unpacker.GetDouble("vat_estimate_offset");
            info.vat_estimate = unpacker.GetDouble("vat_estimate");
            info.vat_estimate_add = unpacker.GetDouble("vat_estimate_add");
            evaL_3_30_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_3_30_InfoList.Add((evaL_3_30_Info)info);
        }
        #endregion

        //逻辑_平台估值_估值汇总_查询估值产品增值税明细
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new evaL_3_30_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.vat_loan = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VAT_LOAN_FLOAT);
                    info.calc_pay = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CALC_PAY_FLOAT);
                    info.vat_pay_offset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VAT_PAY_OFFSET_FLOAT);
                    info.vat_transfer = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VAT_TRANSFER_FLOAT);
                    info.vat_pay_add = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VAT_PAY_ADD_FLOAT);
                    info.calc_estimate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CALC_ESTIMATE_FLOAT);
                    info.vat_estimate_offset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VAT_ESTIMATE_OFFSET_FLOAT);
                    info.vat_estimate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VAT_ESTIMATE_FLOAT);
                    info.vat_estimate_add = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VAT_ESTIMATE_ADD_FLOAT);
                    evaL_3_30_InfoList.Add(info);
                }
            }
        }
    }

    public class evaL_3_31_Response : IResponse
    {
        #region 构造函数
        public evaL_3_31_Response()
        {
            this.evaL_3_31_InfoList = new ObservableCollection<evaL_3_31_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_3_31_Info> evaL_3_31_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_3_31_Info info = new evaL_3_31_Info();
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.eva_check_type = unpacker.GetInt("eva_check_type");
            info.fina_acco_code = unpacker.GetStr("fina_acco_code");
            info.fina_acco_name = unpacker.GetStr("fina_acco_name");
            info.market_value = unpacker.GetStr("market_value");
            info.curr_amt = unpacker.GetDouble("curr_amt");
            evaL_3_31_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_3_31_InfoList.Add((evaL_3_31_Info)info);
        }
        #endregion

        //逻辑_平台估值_估值汇总_查询产品估值核对数据
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new evaL_3_31_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.eva_check_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EVA_CHECK_TYPE_INT);
                    info.fina_acco_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FINA_ACCO_CODE_STR);
                    info.fina_acco_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FINA_ACCO_NAME_STR);
                    info.market_value = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_VALUE_STR);
                    info.curr_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_AMT_FLOAT);
                    evaL_3_31_InfoList.Add(info);
                }
            }
        }
    }

    public class evaL_3_32_Response : IResponse
    {
        #region 构造函数
        public evaL_3_32_Response()
        {
            this.evaL_3_32_InfoList = new ObservableCollection<evaL_3_32_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_3_32_Info> evaL_3_32_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_3_32_Info info = new evaL_3_32_Info();
            evaL_3_32_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_3_32_InfoList.Add((evaL_3_32_Info)info);
        }
        #endregion

        //逻辑_平台估值_估值汇总_更新估值产品核对数据
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_3_32_Info();
                evaL_3_32_InfoList.Add(info);
            }
        }
    }

    public class evaL_3_33_Response : IResponse
    {
        #region 构造函数
        public evaL_3_33_Response()
        {
            this.evaL_3_33_InfoList = new ObservableCollection<evaL_3_33_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_3_33_Info> evaL_3_33_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_3_33_Info info = new evaL_3_33_Info();
            evaL_3_33_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_3_33_InfoList.Add((evaL_3_33_Info)info);
        }
        #endregion

        //逻辑_平台估值_估值汇总_新增估值产品累计净值
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_3_33_Info();
                evaL_3_33_InfoList.Add(info);
            }
        }
    }

    public class evaL_3_34_Response : IResponse
    {
        #region 构造函数
        public evaL_3_34_Response()
        {
            this.evaL_3_34_InfoList = new ObservableCollection<evaL_3_34_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_3_34_Info> evaL_3_34_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_3_34_Info info = new evaL_3_34_Info();
            evaL_3_34_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_3_34_InfoList.Add((evaL_3_34_Info)info);
        }
        #endregion

        //逻辑_平台估值_估值汇总_修改估值产品累计净值
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_3_34_Info();
                evaL_3_34_InfoList.Add(info);
            }
        }
    }

    public class evaL_3_35_Response : IResponse
    {
        #region 构造函数
        public evaL_3_35_Response()
        {
            this.evaL_3_35_InfoList = new ObservableCollection<evaL_3_35_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_3_35_Info> evaL_3_35_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_3_35_Info info = new evaL_3_35_Info();
            evaL_3_35_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_3_35_InfoList.Add((evaL_3_35_Info)info);
        }
        #endregion

        //逻辑_平台估值_估值汇总_删除估值产品累计净值
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_3_35_Info();
                evaL_3_35_InfoList.Add(info);
            }
        }
    }

    public class evaL_3_36_Response : IResponse
    {
        #region 构造函数
        public evaL_3_36_Response()
        {
            this.evaL_3_36_InfoList = new ObservableCollection<evaL_3_36_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_3_36_Info> evaL_3_36_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_3_36_Info info = new evaL_3_36_Info();
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.nav_asset = unpacker.GetDouble("nav_asset");
            info.pd_curr_share = unpacker.GetDouble("pd_curr_share");
            info.unit_nav = unpacker.GetDouble("unit_nav");
            info.cash_coeffi = unpacker.GetDouble("cash_coeffi");
            info.share_coeffi = unpacker.GetDouble("share_coeffi");
            info.total_unit_nav = unpacker.GetDouble("total_unit_nav");
            info.net_prefee_coeffi = unpacker.GetDouble("net_prefee_coeffi");
            info.pre_fee_share_net_total = unpacker.GetDouble("pre_fee_share_net_total");
            evaL_3_36_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_3_36_InfoList.Add((evaL_3_36_Info)info);
        }
        #endregion

        //逻辑_平台估值_估值汇总_查询估值产品累计净值
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new evaL_3_36_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT);
                    info.pd_curr_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_CURR_SHARE_FLOAT);
                    info.unit_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_NAV_FLOAT);
                    info.cash_coeffi = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_COEFFI_FLOAT);
                    info.share_coeffi = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SHARE_COEFFI_FLOAT);
                    info.total_unit_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_UNIT_NAV_FLOAT);
                    info.net_prefee_coeffi = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NET_PREFEE_COEFFI_FLOAT);
                    info.pre_fee_share_net_total = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_FEE_SHARE_NET_TOTAL_FLOAT);
                    evaL_3_36_InfoList.Add(info);
                }
            }
        }
    }

    public class evaL_3_37_Response : IResponse
    {
        #region 构造函数
        public evaL_3_37_Response()
        {
            this.evaL_3_37_InfoList = new ObservableCollection<evaL_3_37_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_3_37_Info> evaL_3_37_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_3_37_Info info = new evaL_3_37_Info();
            evaL_3_37_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_3_37_InfoList.Add((evaL_3_37_Info)info);
        }
        #endregion

        //逻辑_平台估值_估值汇总_估值产品累计净值重算
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_3_37_Info();
                evaL_3_37_InfoList.Add(info);
            }
        }
    }

    public class evaL_3_38_Response : IResponse
    {
        #region 构造函数
        public evaL_3_38_Response()
        {
            this.evaL_3_38_InfoList = new ObservableCollection<evaL_3_38_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_3_38_Info> evaL_3_38_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_3_38_Info info = new evaL_3_38_Info();
            evaL_3_38_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_3_38_InfoList.Add((evaL_3_38_Info)info);
        }
        #endregion

        //逻辑_平台估值_估值汇总_导入产品增值税成交流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_3_38_Info();
                evaL_3_38_InfoList.Add(info);
            }
        }
    }

    public class evaL_3_39_Response : IResponse
    {
        #region 构造函数
        public evaL_3_39_Response()
        {
            this.evaL_3_39_InfoList = new ObservableCollection<evaL_3_39_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_3_39_Info> evaL_3_39_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_3_39_Info info = new evaL_3_39_Info();
            evaL_3_39_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_3_39_InfoList.Add((evaL_3_39_Info)info);
        }
        #endregion

        //逻辑_平台估值_估值汇总_删除产品增值税成交时间段
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_3_39_Info();
                evaL_3_39_InfoList.Add(info);
            }
        }
    }

    public class evaL_3_40_Response : IResponse
    {
        #region 构造函数
        public evaL_3_40_Response()
        {
            this.evaL_3_40_InfoList = new ObservableCollection<evaL_3_40_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_3_40_Info> evaL_3_40_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_3_40_Info info = new evaL_3_40_Info();
            evaL_3_40_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_3_40_InfoList.Add((evaL_3_40_Info)info);
        }
        #endregion

        //逻辑_平台估值_估值汇总_计算产品增值税
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_3_40_Info();
                evaL_3_40_InfoList.Add(info);
            }
        }
    }

    public class evaL_3_41_Response : IResponse
    {
        #region 构造函数
        public evaL_3_41_Response()
        {
            this.evaL_3_41_InfoList = new ObservableCollection<evaL_3_41_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_3_41_Info> evaL_3_41_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_3_41_Info info = new evaL_3_41_Info();
            evaL_3_41_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_3_41_InfoList.Add((evaL_3_41_Info)info);
        }
        #endregion

        //逻辑_平台估值_估值汇总_删除估值产品增值税成交流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_3_41_Info();
                evaL_3_41_InfoList.Add(info);
            }
        }
    }

    public class evaL_3_42_Response : IResponse
    {
        #region 构造函数
        public evaL_3_42_Response()
        {
            this.evaL_3_42_InfoList = new ObservableCollection<evaL_3_42_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_3_42_Info> evaL_3_42_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_3_42_Info info = new evaL_3_42_Info();
            evaL_3_42_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_3_42_InfoList.Add((evaL_3_42_Info)info);
        }
        #endregion

        //逻辑_平台估值_估值汇总_删除估值产品增值税成交明细
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_3_42_Info();
                evaL_3_42_InfoList.Add(info);
            }
        }
    }

    public class evaL_3_43_Response : IResponse
    {
        #region 构造函数
        public evaL_3_43_Response()
        {
            this.evaL_3_43_InfoList = new ObservableCollection<evaL_3_43_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_3_43_Info> evaL_3_43_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_3_43_Info info = new evaL_3_43_Info();
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.order_dir = unpacker.GetInt("order_dir");
            info.stock_code = unpacker.GetStr("stock_code");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.all_fee = unpacker.GetDouble("all_fee");
            info.cost_price = unpacker.GetDouble("cost_price");
            info.offset_qty = unpacker.GetDouble("offset_qty");
            info.realize_pandl = unpacker.GetDouble("realize_pandl");
            info.begin_qty = unpacker.GetDouble("begin_qty");
            info.deal_flag = unpacker.GetInt("deal_flag");
            evaL_3_43_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_3_43_InfoList.Add((evaL_3_43_Info)info);
        }
        #endregion

        //逻辑_平台估值_估值汇总_查询估值产品增值税成交汇总
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new evaL_3_43_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    info.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                    info.cost_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_PRICE_FLOAT);
                    info.offset_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OFFSET_QTY_FLOAT);
                    info.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    info.begin_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_QTY_FLOAT);
                    info.deal_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_FLAG_INT);
                    evaL_3_43_InfoList.Add(info);
                }
            }
        }
    }

    public class evaL_3_44_Response : IResponse
    {
        #region 构造函数
        public evaL_3_44_Response()
        {
            this.evaL_3_44_InfoList = new ObservableCollection<evaL_3_44_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_3_44_Info> evaL_3_44_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_3_44_Info info = new evaL_3_44_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.order_dir = unpacker.GetInt("order_dir");
            info.strike_no = unpacker.GetStr("strike_no");
            info.strike_time = unpacker.GetInt("strike_time");
            info.stock_code = unpacker.GetStr("stock_code");
            info.strike_price = unpacker.GetDouble("strike_price");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.all_fee = unpacker.GetDouble("all_fee");
            info.cost_price = unpacker.GetDouble("cost_price");
            info.offset_qty = unpacker.GetDouble("offset_qty");
            info.deal_flag = unpacker.GetInt("deal_flag");
            evaL_3_44_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_3_44_InfoList.Add((evaL_3_44_Info)info);
        }
        #endregion

        //逻辑_平台估值_估值汇总_查询估值产品增值税成交明细
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new evaL_3_44_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                    info.strike_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_TIME_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_PRICE_FLOAT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    info.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                    info.cost_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_PRICE_FLOAT);
                    info.offset_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OFFSET_QTY_FLOAT);
                    info.deal_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_FLAG_INT);
                    evaL_3_44_InfoList.Add(info);
                }
            }
        }
    }

    public class evaL_3_45_Response : IResponse
    {
        #region 构造函数
        public evaL_3_45_Response()
        {
            this.evaL_3_45_InfoList = new ObservableCollection<evaL_3_45_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_3_45_Info> evaL_3_45_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_3_45_Info info = new evaL_3_45_Info();
            evaL_3_45_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_3_45_InfoList.Add((evaL_3_45_Info)info);
        }
        #endregion

        //逻辑_平台估值_估值汇总_修改估值产品资产信息备注
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_3_45_Info();
                evaL_3_45_InfoList.Add(info);
            }
        }
    }

    public class evaL_3_46_Response : IResponse
    {
        #region 构造函数
        public evaL_3_46_Response()
        {
            this.evaL_3_46_InfoList = new ObservableCollection<evaL_3_46_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_3_46_Info> evaL_3_46_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_3_46_Info info = new evaL_3_46_Info();
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.fina_acco_code = unpacker.GetStr("fina_acco_code");
            info.fina_acco_name = unpacker.GetStr("fina_acco_name");
            info.amount = unpacker.GetStr("amount");
            info.unit_cost = unpacker.GetStr("unit_cost");
            info.prime_cost = unpacker.GetStr("prime_cost");
            info.cost_net_ratio = unpacker.GetStr("cost_net_ratio");
            info.market_price = unpacker.GetStr("market_price");
            info.market_value = unpacker.GetStr("market_value");
            info.market_net_ratio = unpacker.GetStr("market_net_ratio");
            info.evalu_add_value = unpacker.GetDouble("evalu_add_value");
            info.stop_info = unpacker.GetStr("stop_info");
            info.rights_info = unpacker.GetStr("rights_info");
            evaL_3_46_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_3_46_InfoList.Add((evaL_3_46_Info)info);
        }
        #endregion

        //逻辑_平台估值_估值汇总_查询产品估值表单位净值
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new evaL_3_46_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.fina_acco_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FINA_ACCO_CODE_STR);
                    info.fina_acco_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FINA_ACCO_NAME_STR);
                    info.amount = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_AMOUNT_STR);
                    info.unit_cost = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_COST_STR);
                    info.prime_cost = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PRIME_COST_STR);
                    info.cost_net_ratio = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COST_NET_RATIO_STR);
                    info.market_price = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_PRICE_STR);
                    info.market_value = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_VALUE_STR);
                    info.market_net_ratio = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_NET_RATIO_STR);
                    info.evalu_add_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_EVALU_ADD_VALUE_FLOAT);
                    info.stop_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOP_INFO_STR);
                    info.rights_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RIGHTS_INFO_STR);
                    evaL_3_46_InfoList.Add(info);
                }
            }
        }
    }

    public class evaL_3_47_Response : IResponse
    {
        #region 构造函数
        public evaL_3_47_Response()
        {
            this.evaL_3_47_InfoList = new ObservableCollection<evaL_3_47_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_3_47_Info> evaL_3_47_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_3_47_Info info = new evaL_3_47_Info();
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.pd_curr_share = unpacker.GetDouble("pd_curr_share");
            info.total_asset = unpacker.GetDouble("total_asset");
            info.nav_asset = unpacker.GetDouble("nav_asset");
            info.cash_bala = unpacker.GetDouble("cash_bala");
            info.acco_cash = unpacker.GetDouble("acco_cash");
            info.stock_market_value = unpacker.GetDouble("stock_market_value");
            info.fund_asset = unpacker.GetDouble("fund_asset");
            info.bond_asset = unpacker.GetDouble("bond_asset");
            info.futu_asset = unpacker.GetDouble("futu_asset");
            info.option_asset = unpacker.GetDouble("option_asset");
            info.other_asset = unpacker.GetDouble("other_asset");
            info.accumulative_receivable = unpacker.GetDouble("accumulative_receivable");
            info.accumulative_payable = unpacker.GetDouble("accumulative_payable");
            info.apply_amt = unpacker.GetDouble("apply_amt");
            info.redemp_amt = unpacker.GetDouble("redemp_amt");
            info.unit_nav = unpacker.GetDouble("unit_nav");
            info.total_cash_divide = unpacker.GetDouble("total_cash_divide");
            info.total_unit_nav = unpacker.GetDouble("total_unit_nav");
            info.remark_info = unpacker.GetStr("remark_info");
            info.daily_pandl_ratio = unpacker.GetDouble("daily_pandl_ratio");
            info.update_date = unpacker.GetInt("update_date");
            info.update_time = unpacker.GetInt("update_time");
            evaL_3_47_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_3_47_InfoList.Add((evaL_3_47_Info)info);
        }
        #endregion

        //逻辑_平台估值_估值汇总_查询估值产品交易组资产信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new evaL_3_47_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.pd_curr_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_CURR_SHARE_FLOAT);
                    info.total_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_ASSET_FLOAT);
                    info.nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT);
                    info.cash_bala = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_BALA_FLOAT);
                    info.acco_cash = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_CASH_FLOAT);
                    info.stock_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_MARKET_VALUE_FLOAT);
                    info.fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_ASSET_FLOAT);
                    info.bond_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ASSET_FLOAT);
                    info.futu_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ASSET_FLOAT);
                    info.option_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPTION_ASSET_FLOAT);
                    info.other_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_ASSET_FLOAT);
                    info.accumulative_receivable = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCUMULATIVE_RECEIVABLE_FLOAT);
                    info.accumulative_payable = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCUMULATIVE_PAYABLE_FLOAT);
                    info.apply_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_APPLY_AMT_FLOAT);
                    info.redemp_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REDEMP_AMT_FLOAT);
                    info.unit_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_NAV_FLOAT);
                    info.total_cash_divide = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_CASH_DIVIDE_FLOAT);
                    info.total_unit_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_UNIT_NAV_FLOAT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    info.daily_pandl_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DAILY_PANDL_RATIO_FLOAT);
                    info.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    info.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    evaL_3_47_InfoList.Add(info);
                }
            }
        }
    }

    public class evaL_3_48_Response : IResponse
    {
        #region 构造函数
        public evaL_3_48_Response()
        {
            this.evaL_3_48_InfoList = new ObservableCollection<evaL_3_48_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_3_48_Info> evaL_3_48_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_3_48_Info info = new evaL_3_48_Info();
            evaL_3_48_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_3_48_InfoList.Add((evaL_3_48_Info)info);
        }
        #endregion

        //逻辑_平台估值_估值汇总_新增估值产品交易组费用
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_3_48_Info();
                evaL_3_48_InfoList.Add(info);
            }
        }
    }

    public class evaL_3_49_Response : IResponse
    {
        #region 构造函数
        public evaL_3_49_Response()
        {
            this.evaL_3_49_InfoList = new ObservableCollection<evaL_3_49_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_3_49_Info> evaL_3_49_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_3_49_Info info = new evaL_3_49_Info();
            evaL_3_49_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_3_49_InfoList.Add((evaL_3_49_Info)info);
        }
        #endregion

        //逻辑_平台估值_估值汇总_修改估值产品交易组费用
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_3_49_Info();
                evaL_3_49_InfoList.Add(info);
            }
        }
    }

    public class evaL_3_50_Response : IResponse
    {
        #region 构造函数
        public evaL_3_50_Response()
        {
            this.evaL_3_50_InfoList = new ObservableCollection<evaL_3_50_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_3_50_Info> evaL_3_50_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_3_50_Info info = new evaL_3_50_Info();
            evaL_3_50_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_3_50_InfoList.Add((evaL_3_50_Info)info);
        }
        #endregion

        //逻辑_平台估值_估值汇总_删除估值产品交易组费用
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_3_50_Info();
                evaL_3_50_InfoList.Add(info);
            }
        }
    }

    public class evaL_3_51_Response : IResponse
    {
        #region 构造函数
        public evaL_3_51_Response()
        {
            this.evaL_3_51_InfoList = new ObservableCollection<evaL_3_51_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_3_51_Info> evaL_3_51_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_3_51_Info info = new evaL_3_51_Info();
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.pd_fee_type = unpacker.GetInt("pd_fee_type");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.begin_amt = unpacker.GetDouble("begin_amt");
            info.curr_amt = unpacker.GetDouble("curr_amt");
            info.pd_net_asset = unpacker.GetDouble("pd_net_asset");
            info.confirm_apply = unpacker.GetDouble("confirm_apply");
            info.remark_info = unpacker.GetStr("remark_info");
            info.manual_flag = unpacker.GetInt("manual_flag");
            evaL_3_51_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_3_51_InfoList.Add((evaL_3_51_Info)info);
        }
        #endregion

        //逻辑_平台估值_估值汇总_查询估值产品交易组费用
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new evaL_3_51_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.pd_fee_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_FEE_TYPE_INT);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.begin_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_AMT_FLOAT);
                    info.curr_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_AMT_FLOAT);
                    info.pd_net_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_NET_ASSET_FLOAT);
                    info.confirm_apply = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CONFIRM_APPLY_FLOAT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    info.manual_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MANUAL_FLAG_INT);
                    evaL_3_51_InfoList.Add(info);
                }
            }
        }
    }

    public class evaL_3_52_Response : IResponse
    {
        #region 构造函数
        public evaL_3_52_Response()
        {
            this.evaL_3_52_InfoList = new ObservableCollection<evaL_3_52_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_3_52_Info> evaL_3_52_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_3_52_Info info = new evaL_3_52_Info();
            evaL_3_52_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_3_52_InfoList.Add((evaL_3_52_Info)info);
        }
        #endregion

        //逻辑_平台估值_估值汇总_新增估值产品交易组利息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_3_52_Info();
                evaL_3_52_InfoList.Add(info);
            }
        }
    }

    public class evaL_3_53_Response : IResponse
    {
        #region 构造函数
        public evaL_3_53_Response()
        {
            this.evaL_3_53_InfoList = new ObservableCollection<evaL_3_53_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_3_53_Info> evaL_3_53_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_3_53_Info info = new evaL_3_53_Info();
            evaL_3_53_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_3_53_InfoList.Add((evaL_3_53_Info)info);
        }
        #endregion

        //逻辑_平台估值_估值汇总_修改估值产品交易组利息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_3_53_Info();
                evaL_3_53_InfoList.Add(info);
            }
        }
    }

    public class evaL_3_54_Response : IResponse
    {
        #region 构造函数
        public evaL_3_54_Response()
        {
            this.evaL_3_54_InfoList = new ObservableCollection<evaL_3_54_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_3_54_Info> evaL_3_54_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_3_54_Info info = new evaL_3_54_Info();
            evaL_3_54_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_3_54_InfoList.Add((evaL_3_54_Info)info);
        }
        #endregion

        //逻辑_平台估值_估值汇总_删除估值产品交易组利息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_3_54_Info();
                evaL_3_54_InfoList.Add(info);
            }
        }
    }

    public class evaL_3_55_Response : IResponse
    {
        #region 构造函数
        public evaL_3_55_Response()
        {
            this.evaL_3_55_InfoList = new ObservableCollection<evaL_3_55_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_3_55_Info> evaL_3_55_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_3_55_Info info = new evaL_3_55_Info();
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.pd_rate_type = unpacker.GetInt("pd_rate_type");
            info.asset_acco = unpacker.GetStr("asset_acco");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.begin_amt = unpacker.GetDouble("begin_amt");
            info.curr_amt = unpacker.GetDouble("curr_amt");
            info.intrst_base_amt = unpacker.GetDouble("intrst_base_amt");
            info.confirm_apply = unpacker.GetDouble("confirm_apply");
            info.remark_info = unpacker.GetStr("remark_info");
            info.manual_flag = unpacker.GetInt("manual_flag");
            evaL_3_55_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_3_55_InfoList.Add((evaL_3_55_Info)info);
        }
        #endregion

        //逻辑_平台估值_估值汇总_查询估值产品交易组利息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new evaL_3_55_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.pd_rate_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_RATE_TYPE_INT);
                    info.asset_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STR);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.begin_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_AMT_FLOAT);
                    info.curr_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_AMT_FLOAT);
                    info.intrst_base_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_BASE_AMT_FLOAT);
                    info.confirm_apply = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CONFIRM_APPLY_FLOAT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    info.manual_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MANUAL_FLAG_INT);
                    evaL_3_55_InfoList.Add(info);
                }
            }
        }
    }

    public class evaL_3_101_Response : IResponse
    {
        #region 构造函数
        public evaL_3_101_Response()
        {
            this.evaL_3_101_InfoList = new ObservableCollection<evaL_3_101_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_3_101_Info> evaL_3_101_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_3_101_Info info = new evaL_3_101_Info();
            evaL_3_101_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_3_101_InfoList.Add((evaL_3_101_Info)info);
        }
        #endregion

        //逻辑_平台估值_估值汇总_估值系统数据归档
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_3_101_Info();
                evaL_3_101_InfoList.Add(info);
            }
        }
    }

    public class evaL_3_102_Response : IResponse
    {
        #region 构造函数
        public evaL_3_102_Response()
        {
            this.evaL_3_102_InfoList = new ObservableCollection<evaL_3_102_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_3_102_Info> evaL_3_102_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_3_102_Info info = new evaL_3_102_Info();
            evaL_3_102_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_3_102_InfoList.Add((evaL_3_102_Info)info);
        }
        #endregion

        //逻辑_平台估值_估值汇总_估值系统初始化
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_3_102_Info();
                evaL_3_102_InfoList.Add(info);
            }
        }
    }

    public class evaL_3_103_Response : IResponse
    {
        #region 构造函数
        public evaL_3_103_Response()
        {
            this.evaL_3_103_InfoList = new ObservableCollection<evaL_3_103_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_3_103_Info> evaL_3_103_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_3_103_Info info = new evaL_3_103_Info();
            evaL_3_103_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_3_103_InfoList.Add((evaL_3_103_Info)info);
        }
        #endregion

        //逻辑_平台估值_估值汇总_估值系统自动估值定时任务
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_3_103_Info();
                evaL_3_103_InfoList.Add(info);
            }
        }
    }

    public class evaL_3_104_Response : IResponse
    {
        #region 构造函数
        public evaL_3_104_Response()
        {
            this.evaL_3_104_InfoList = new ObservableCollection<evaL_3_104_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_3_104_Info> evaL_3_104_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_3_104_Info info = new evaL_3_104_Info();
            evaL_3_104_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_3_104_InfoList.Add((evaL_3_104_Info)info);
        }
        #endregion

        //逻辑_平台估值_估值汇总_单产品获取数据估值
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_3_104_Info();
                evaL_3_104_InfoList.Add(info);
            }
        }
    }

    public class evaL_3_105_Response : IResponse
    {
        #region 构造函数
        public evaL_3_105_Response()
        {
            this.evaL_3_105_InfoList = new ObservableCollection<evaL_3_105_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_3_105_Info> evaL_3_105_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_3_105_Info info = new evaL_3_105_Info();
            evaL_3_105_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_3_105_InfoList.Add((evaL_3_105_Info)info);
        }
        #endregion

        //逻辑_平台估值_估值汇总_估值系统节假日补算
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_3_105_Info();
                evaL_3_105_InfoList.Add(info);
            }
        }
    }

    public class evaL_3_106_Response : IResponse
    {
        #region 构造函数
        public evaL_3_106_Response()
        {
            this.evaL_3_106_InfoList = new ObservableCollection<evaL_3_106_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_3_106_Info> evaL_3_106_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_3_106_Info info = new evaL_3_106_Info();
            evaL_3_106_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_3_106_InfoList.Add((evaL_3_106_Info)info);
        }
        #endregion

        //逻辑_平台估值_估值汇总_产品校准
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_3_106_Info();
                evaL_3_106_InfoList.Add(info);
            }
        }
    }

}
