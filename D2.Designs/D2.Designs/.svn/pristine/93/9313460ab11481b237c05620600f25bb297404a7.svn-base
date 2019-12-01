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
    public class rptL_2_1_Response : IResponse
    {
        #region 构造函数
        public rptL_2_1_Response()
        {
            this.rptL_2_1_InfoList = new ObservableCollection<rptL_2_1_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_1_Info> rptL_2_1_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_1_Info info = new rptL_2_1_Info();
            rptL_2_1_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_1_InfoList.Add((rptL_2_1_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_更新报表产品信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_1_Info();
                rptL_2_1_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_2_Response : IResponse
    {
        #region 构造函数
        public rptL_2_2_Response()
        {
            this.rptL_2_2_InfoList = new ObservableCollection<rptL_2_2_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_2_Info> rptL_2_2_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_2_Info info = new rptL_2_2_Info();
            info.init_date = unpacker.GetInt("init_date");
            info.pd_no = unpacker.GetInt("pd_no");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_manager = unpacker.GetStr("pd_manager");
            info.found_date = unpacker.GetInt("found_date");
            info.pd_type = unpacker.GetInt("pd_type");
            info.apply_currency = unpacker.GetStr("apply_currency");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.first_asset = unpacker.GetDouble("first_asset");
            info.first_amt = unpacker.GetDouble("first_amt");
            info.pd_all_share = unpacker.GetDouble("pd_all_share");
            info.curr_share = unpacker.GetDouble("curr_share");
            info.pre_share = unpacker.GetDouble("pre_share");
            info.his_max_per_nav = unpacker.GetDouble("his_max_per_nav");
            info.pre_nav = unpacker.GetDouble("pre_nav");
            info.coust_full_name = unpacker.GetStr("coust_full_name");
            info.coust_acco = unpacker.GetStr("coust_acco");
            info.coust_acco_name = unpacker.GetStr("coust_acco_name");
            info.pd_status = unpacker.GetStr("pd_status");
            info.remark_info = unpacker.GetStr("remark_info");
            info.cost_calc_type = unpacker.GetInt("cost_calc_type");
            info.risk_free_interest_rate = unpacker.GetDouble("risk_free_interest_rate");
            info.allow_exch = unpacker.GetStr("allow_exch");
            info.borker_no = unpacker.GetInt("borker_no");
            info.borker_name = unpacker.GetStr("borker_name");
            info.commis_ratio = unpacker.GetDouble("commis_ratio");
            info.broker_my_type = unpacker.GetInt("broker_my_type");
            rptL_2_2_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_2_InfoList.Add((rptL_2_2_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_查询报表产品信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_2_2_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_manager = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_MANAGER_STR);
                    info.found_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FOUND_DATE_INT);
                    info.pd_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_TYPE_INT);
                    info.apply_currency = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_APPLY_CURRENCY_STR);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.first_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FIRST_ASSET_FLOAT);
                    info.first_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FIRST_AMT_FLOAT);
                    info.pd_all_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_ALL_SHARE_FLOAT);
                    info.curr_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_SHARE_FLOAT);
                    info.pre_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SHARE_FLOAT);
                    info.his_max_per_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HIS_MAX_PER_NAV_FLOAT);
                    info.pre_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_NAV_FLOAT);
                    info.coust_full_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COUST_FULL_NAME_STR);
                    info.coust_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COUST_ACCO_STR);
                    info.coust_acco_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COUST_ACCO_NAME_STR);
                    info.pd_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_STATUS_STR);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    info.cost_calc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COST_CALC_TYPE_INT);
                    info.risk_free_interest_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RISK_FREE_INTEREST_RATE_FLOAT);
                    info.allow_exch = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_EXCH_STR);
                    info.borker_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BORKER_NO_INT);
                    info.borker_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BORKER_NAME_STR);
                    info.commis_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMMIS_RATIO_FLOAT);
                    info.broker_my_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BROKER_MY_TYPE_INT);
                    rptL_2_2_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_2_3_Response : IResponse
    {
        #region 构造函数
        public rptL_2_3_Response()
        {
            this.rptL_2_3_InfoList = new ObservableCollection<rptL_2_3_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_3_Info> rptL_2_3_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_3_Info info = new rptL_2_3_Info();
            rptL_2_3_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_3_InfoList.Add((rptL_2_3_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_修改报表产品信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_3_Info();
                rptL_2_3_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_4_Response : IResponse
    {
        #region 构造函数
        public rptL_2_4_Response()
        {
            this.rptL_2_4_InfoList = new ObservableCollection<rptL_2_4_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_4_Info> rptL_2_4_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_4_Info info = new rptL_2_4_Info();
            rptL_2_4_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_4_InfoList.Add((rptL_2_4_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_更新报表产品资产
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_4_Info();
                rptL_2_4_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_5_Response : IResponse
    {
        #region 构造函数
        public rptL_2_5_Response()
        {
            this.rptL_2_5_InfoList = new ObservableCollection<rptL_2_5_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_5_Info> rptL_2_5_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_5_Info info = new rptL_2_5_Info();
            rptL_2_5_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_5_InfoList.Add((rptL_2_5_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_更新报表产品持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_5_Info();
                rptL_2_5_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_6_Response : IResponse
    {
        #region 构造函数
        public rptL_2_6_Response()
        {
            this.rptL_2_6_InfoList = new ObservableCollection<rptL_2_6_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_6_Info> rptL_2_6_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_6_Info info = new rptL_2_6_Info();
            rptL_2_6_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_6_InfoList.Add((rptL_2_6_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_计算单产品收益率
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_6_Info();
                rptL_2_6_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_7_Response : IResponse
    {
        #region 构造函数
        public rptL_2_7_Response()
        {
            this.rptL_2_7_InfoList = new ObservableCollection<rptL_2_7_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_7_Info> rptL_2_7_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_7_Info info = new rptL_2_7_Info();
            rptL_2_7_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_7_InfoList.Add((rptL_2_7_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_计算产品收益率分析
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_7_Info();
                rptL_2_7_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_8_Response : IResponse
    {
        #region 构造函数
        public rptL_2_8_Response()
        {
            this.rptL_2_8_InfoList = new ObservableCollection<rptL_2_8_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_8_Info> rptL_2_8_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_8_Info info = new rptL_2_8_Info();
            rptL_2_8_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_8_InfoList.Add((rptL_2_8_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_增加交易周信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_8_Info();
                rptL_2_8_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_9_Response : IResponse
    {
        #region 构造函数
        public rptL_2_9_Response()
        {
            this.rptL_2_9_InfoList = new ObservableCollection<rptL_2_9_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_9_Info> rptL_2_9_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_9_Info info = new rptL_2_9_Info();
            rptL_2_9_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_9_InfoList.Add((rptL_2_9_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_同步资管产品账户表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_9_Info();
                rptL_2_9_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_10_Response : IResponse
    {
        #region 构造函数
        public rptL_2_10_Response()
        {
            this.rptL_2_10_InfoList = new ObservableCollection<rptL_2_10_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_10_Info> rptL_2_10_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_10_Info info = new rptL_2_10_Info();
            rptL_2_10_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_10_InfoList.Add((rptL_2_10_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_同步资管历史产品账户表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_10_Info();
                rptL_2_10_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_11_Response : IResponse
    {
        #region 构造函数
        public rptL_2_11_Response()
        {
            this.rptL_2_11_InfoList = new ObservableCollection<rptL_2_11_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_11_Info> rptL_2_11_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_11_Info info = new rptL_2_11_Info();
            rptL_2_11_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_11_InfoList.Add((rptL_2_11_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_同步资管产品持仓表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_11_Info();
                rptL_2_11_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_12_Response : IResponse
    {
        #region 构造函数
        public rptL_2_12_Response()
        {
            this.rptL_2_12_InfoList = new ObservableCollection<rptL_2_12_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_12_Info> rptL_2_12_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_12_Info info = new rptL_2_12_Info();
            rptL_2_12_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_12_InfoList.Add((rptL_2_12_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_同步资管历史产品持仓表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_12_Info();
                rptL_2_12_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_13_Response : IResponse
    {
        #region 构造函数
        public rptL_2_13_Response()
        {
            this.rptL_2_13_InfoList = new ObservableCollection<rptL_2_13_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_13_Info> rptL_2_13_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_13_Info info = new rptL_2_13_Info();
            rptL_2_13_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_13_InfoList.Add((rptL_2_13_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_同步资管产品单元资金表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_13_Info();
                rptL_2_13_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_14_Response : IResponse
    {
        #region 构造函数
        public rptL_2_14_Response()
        {
            this.rptL_2_14_InfoList = new ObservableCollection<rptL_2_14_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_14_Info> rptL_2_14_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_14_Info info = new rptL_2_14_Info();
            rptL_2_14_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_14_InfoList.Add((rptL_2_14_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_同步资管历史产品单元资金表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_14_Info();
                rptL_2_14_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_15_Response : IResponse
    {
        #region 构造函数
        public rptL_2_15_Response()
        {
            this.rptL_2_15_InfoList = new ObservableCollection<rptL_2_15_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_15_Info> rptL_2_15_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_15_Info info = new rptL_2_15_Info();
            rptL_2_15_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_15_InfoList.Add((rptL_2_15_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_同步资管证券行情表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_15_Info();
                rptL_2_15_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_16_Response : IResponse
    {
        #region 构造函数
        public rptL_2_16_Response()
        {
            this.rptL_2_16_InfoList = new ObservableCollection<rptL_2_16_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_16_Info> rptL_2_16_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_16_Info info = new rptL_2_16_Info();
            rptL_2_16_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_16_InfoList.Add((rptL_2_16_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_同步资管历史证券行情表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_16_Info();
                rptL_2_16_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_17_Response : IResponse
    {
        #region 构造函数
        public rptL_2_17_Response()
        {
            this.rptL_2_17_InfoList = new ObservableCollection<rptL_2_17_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_17_Info> rptL_2_17_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_17_Info info = new rptL_2_17_Info();
            rptL_2_17_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_17_InfoList.Add((rptL_2_17_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_同步资管证券订单表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_17_Info();
                rptL_2_17_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_18_Response : IResponse
    {
        #region 构造函数
        public rptL_2_18_Response()
        {
            this.rptL_2_18_InfoList = new ObservableCollection<rptL_2_18_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_18_Info> rptL_2_18_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_18_Info info = new rptL_2_18_Info();
            rptL_2_18_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_18_InfoList.Add((rptL_2_18_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_同步资管证券成交表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_18_Info();
                rptL_2_18_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_19_Response : IResponse
    {
        #region 构造函数
        public rptL_2_19_Response()
        {
            this.rptL_2_19_InfoList = new ObservableCollection<rptL_2_19_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_19_Info> rptL_2_19_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_19_Info info = new rptL_2_19_Info();
            rptL_2_19_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_19_InfoList.Add((rptL_2_19_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_新增报表产品信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_19_Info();
                rptL_2_19_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_21_Response : IResponse
    {
        #region 构造函数
        public rptL_2_21_Response()
        {
            this.rptL_2_21_InfoList = new ObservableCollection<rptL_2_21_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_21_Info> rptL_2_21_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_21_Info info = new rptL_2_21_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.industry_id = unpacker.GetInt("industry_id");
            info.industry_code = unpacker.GetStr("industry_code");
            info.indu_name = unpacker.GetStr("indu_name");
            info.industry_classification = unpacker.GetInt("industry_classification");
            info.parent_industry_id = unpacker.GetInt("parent_industry_id");
            info.industry_std = unpacker.GetInt("industry_std");
            info.first_indu_code = unpacker.GetStr("first_indu_code");
            info.first_industry_name = unpacker.GetStr("first_industry_name");
            info.second_industry_code = unpacker.GetStr("second_industry_code");
            info.second_industry_name = unpacker.GetStr("second_industry_name");
            info.third_industry_code = unpacker.GetStr("third_industry_code");
            info.third_industry_name = unpacker.GetStr("third_industry_name");
            info.remark_info = unpacker.GetStr("remark_info");
            rptL_2_21_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_21_InfoList.Add((rptL_2_21_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_查询行业类别表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_2_21_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.industry_id = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDUSTRY_ID_INT);
                    info.industry_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_INDUSTRY_CODE_STR);
                    info.indu_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_INDU_NAME_STR);
                    info.industry_classification = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDUSTRY_CLASSIFICATION_INT);
                    info.parent_industry_id = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PARENT_INDUSTRY_ID_INT);
                    info.industry_std = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDUSTRY_STD_INT);
                    info.first_indu_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FIRST_INDU_CODE_STR);
                    info.first_industry_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FIRST_INDUSTRY_NAME_STR);
                    info.second_industry_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_SECOND_INDUSTRY_CODE_STR);
                    info.second_industry_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_SECOND_INDUSTRY_NAME_STR);
                    info.third_industry_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_THIRD_INDUSTRY_CODE_STR);
                    info.third_industry_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_THIRD_INDUSTRY_NAME_STR);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    rptL_2_21_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_2_22_Response : IResponse
    {
        #region 构造函数
        public rptL_2_22_Response()
        {
            this.rptL_2_22_InfoList = new ObservableCollection<rptL_2_22_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_22_Info> rptL_2_22_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_22_Info info = new rptL_2_22_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_name = unpacker.GetStr("stock_name");
            info.stock_type = unpacker.GetInt("stock_type");
            info.asset_type = unpacker.GetInt("asset_type");
            info.industry_std = unpacker.GetInt("industry_std");
            info.industry_id = unpacker.GetInt("industry_id");
            info.industry_code = unpacker.GetStr("industry_code");
            info.indu_name = unpacker.GetStr("indu_name");
            info.first_indu_code = unpacker.GetStr("first_indu_code");
            info.first_industry_name = unpacker.GetStr("first_industry_name");
            info.second_industry_code = unpacker.GetStr("second_industry_code");
            info.second_industry_name = unpacker.GetStr("second_industry_name");
            info.third_industry_code = unpacker.GetStr("third_industry_code");
            info.third_industry_name = unpacker.GetStr("third_industry_name");
            info.fourth_industry_code = unpacker.GetStr("fourth_industry_code");
            info.fourth_industry_name = unpacker.GetStr("fourth_industry_name");
            info.remark_info = unpacker.GetStr("remark_info");
            rptL_2_22_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_22_InfoList.Add((rptL_2_22_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_查询行业证券表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_2_22_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    info.industry_std = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDUSTRY_STD_INT);
                    info.industry_id = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDUSTRY_ID_INT);
                    info.industry_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_INDUSTRY_CODE_STR);
                    info.indu_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_INDU_NAME_STR);
                    info.first_indu_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FIRST_INDU_CODE_STR);
                    info.first_industry_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FIRST_INDUSTRY_NAME_STR);
                    info.second_industry_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_SECOND_INDUSTRY_CODE_STR);
                    info.second_industry_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_SECOND_INDUSTRY_NAME_STR);
                    info.third_industry_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_THIRD_INDUSTRY_CODE_STR);
                    info.third_industry_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_THIRD_INDUSTRY_NAME_STR);
                    info.fourth_industry_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FOURTH_INDUSTRY_CODE_STR);
                    info.fourth_industry_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FOURTH_INDUSTRY_NAME_STR);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    rptL_2_22_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_2_50_Response : IResponse
    {
        #region 构造函数
        public rptL_2_50_Response()
        {
            this.rptL_2_50_InfoList = new ObservableCollection<rptL_2_50_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_50_Info> rptL_2_50_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_50_Info info = new rptL_2_50_Info();
            info.task_strike_status = unpacker.GetStr("task_strike_status");
            rptL_2_50_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_50_InfoList.Add((rptL_2_50_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_初始化产品初始化定时任务
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_50_Info();
                info.task_strike_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STRIKE_STATUS_STR);
                rptL_2_50_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_51_Response : IResponse
    {
        #region 构造函数
        public rptL_2_51_Response()
        {
            this.rptL_2_51_InfoList = new ObservableCollection<rptL_2_51_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_51_Info> rptL_2_51_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_51_Info info = new rptL_2_51_Info();
            rptL_2_51_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_51_InfoList.Add((rptL_2_51_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_备份数据产品资产表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_51_Info();
                rptL_2_51_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_52_Response : IResponse
    {
        #region 构造函数
        public rptL_2_52_Response()
        {
            this.rptL_2_52_InfoList = new ObservableCollection<rptL_2_52_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_52_Info> rptL_2_52_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_52_Info info = new rptL_2_52_Info();
            rptL_2_52_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_52_InfoList.Add((rptL_2_52_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_备份数据产品持仓表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_52_Info();
                rptL_2_52_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_53_Response : IResponse
    {
        #region 构造函数
        public rptL_2_53_Response()
        {
            this.rptL_2_53_InfoList = new ObservableCollection<rptL_2_53_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_53_Info> rptL_2_53_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_53_Info info = new rptL_2_53_Info();
            rptL_2_53_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_53_InfoList.Add((rptL_2_53_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_每日计算产品持仓市值
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_53_Info();
                rptL_2_53_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_54_Response : IResponse
    {
        #region 构造函数
        public rptL_2_54_Response()
        {
            this.rptL_2_54_InfoList = new ObservableCollection<rptL_2_54_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_54_Info> rptL_2_54_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_54_Info info = new rptL_2_54_Info();
            rptL_2_54_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_54_InfoList.Add((rptL_2_54_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_备份数据产品订单表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_54_Info();
                rptL_2_54_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_55_Response : IResponse
    {
        #region 构造函数
        public rptL_2_55_Response()
        {
            this.rptL_2_55_InfoList = new ObservableCollection<rptL_2_55_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_55_Info> rptL_2_55_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_55_Info info = new rptL_2_55_Info();
            rptL_2_55_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_55_InfoList.Add((rptL_2_55_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_备份数据产品成交表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_55_Info();
                rptL_2_55_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_56_Response : IResponse
    {
        #region 构造函数
        public rptL_2_56_Response()
        {
            this.rptL_2_56_InfoList = new ObservableCollection<rptL_2_56_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_56_Info> rptL_2_56_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_56_Info info = new rptL_2_56_Info();
            rptL_2_56_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_56_InfoList.Add((rptL_2_56_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_备份数据产品自定义资产
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_56_Info();
                rptL_2_56_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_61_Response : IResponse
    {
        #region 构造函数
        public rptL_2_61_Response()
        {
            this.rptL_2_61_InfoList = new ObservableCollection<rptL_2_61_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_61_Info> rptL_2_61_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_61_Info info = new rptL_2_61_Info();
            info.co_no = unpacker.GetInt("co_no");
            info.def_asset_type = unpacker.GetInt("def_asset_type");
            info.def_asset_type_no = unpacker.GetStr("def_asset_type_no");
            info.def_asset_name = unpacker.GetStr("def_asset_name");
            info.parent_def_asset_type = unpacker.GetInt("parent_def_asset_type");
            info.def_type = unpacker.GetInt("def_type");
            info.show_order = unpacker.GetInt("show_order");
            info.calc_type = unpacker.GetInt("calc_type");
            info.remark_info = unpacker.GetStr("remark_info");
            rptL_2_61_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_61_InfoList.Add((rptL_2_61_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_查询机构自定义资产类型
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_2_61_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.def_asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEF_ASSET_TYPE_INT);
                    info.def_asset_type_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DEF_ASSET_TYPE_NO_STR);
                    info.def_asset_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DEF_ASSET_NAME_STR);
                    info.parent_def_asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PARENT_DEF_ASSET_TYPE_INT);
                    info.def_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEF_TYPE_INT);
                    info.show_order = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SHOW_ORDER_INT);
                    info.calc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CALC_TYPE_INT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    rptL_2_61_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_2_62_Response : IResponse
    {
        #region 构造函数
        public rptL_2_62_Response()
        {
            this.rptL_2_62_InfoList = new ObservableCollection<rptL_2_62_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_62_Info> rptL_2_62_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_62_Info info = new rptL_2_62_Info();
            rptL_2_62_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_62_InfoList.Add((rptL_2_62_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_修改产品自定义资产
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_62_Info();
                rptL_2_62_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_63_Response : IResponse
    {
        #region 构造函数
        public rptL_2_63_Response()
        {
            this.rptL_2_63_InfoList = new ObservableCollection<rptL_2_63_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_63_Info> rptL_2_63_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_63_Info info = new rptL_2_63_Info();
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.def_asset_type = unpacker.GetInt("def_asset_type");
            info.def_asset_name = unpacker.GetStr("def_asset_name");
            info.def_asset_field = unpacker.GetInt("def_asset_field");
            info.asset_value = unpacker.GetDouble("asset_value");
            rptL_2_63_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_63_InfoList.Add((rptL_2_63_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_查询产品自定义资产
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_2_63_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.def_asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEF_ASSET_TYPE_INT);
                    info.def_asset_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DEF_ASSET_NAME_STR);
                    info.def_asset_field = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEF_ASSET_FIELD_INT);
                    info.asset_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_VALUE_FLOAT);
                    rptL_2_63_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_2_64_Response : IResponse
    {
        #region 构造函数
        public rptL_2_64_Response()
        {
            this.rptL_2_64_InfoList = new ObservableCollection<rptL_2_64_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_64_Info> rptL_2_64_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_64_Info info = new rptL_2_64_Info();
            rptL_2_64_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_64_InfoList.Add((rptL_2_64_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_计算产品自定义资产
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_64_Info();
                rptL_2_64_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_65_Response : IResponse
    {
        #region 构造函数
        public rptL_2_65_Response()
        {
            this.rptL_2_65_InfoList = new ObservableCollection<rptL_2_65_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_65_Info> rptL_2_65_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_65_Info info = new rptL_2_65_Info();
            rptL_2_65_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_65_InfoList.Add((rptL_2_65_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_定时任务计算产品自定义资产
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_65_Info();
                rptL_2_65_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_66_Response : IResponse
    {
        #region 构造函数
        public rptL_2_66_Response()
        {
            this.rptL_2_66_InfoList = new ObservableCollection<rptL_2_66_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_66_Info> rptL_2_66_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_66_Info info = new rptL_2_66_Info();
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.pd_code = unpacker.GetStr("pd_code");
            info.pd_name = unpacker.GetStr("pd_name");
            info.dbgrid_x_field = unpacker.GetStr("dbgrid_x_field");
            info.dbgrid_x_field_no = unpacker.GetInt("dbgrid_x_field_no");
            info.dbgrid_x_field_name = unpacker.GetStr("dbgrid_x_field_name");
            info.def_type = unpacker.GetInt("def_type");
            rptL_2_66_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_66_InfoList.Add((rptL_2_66_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_查询机构自定义资产字段列表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_2_66_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    info.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    info.dbgrid_x_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DBGRID_X_FIELD_STR);
                    info.dbgrid_x_field_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DBGRID_X_FIELD_NO_INT);
                    info.dbgrid_x_field_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DBGRID_X_FIELD_NAME_STR);
                    info.def_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEF_TYPE_INT);
                    rptL_2_66_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_2_67_Response : IResponse
    {
        #region 构造函数
        public rptL_2_67_Response()
        {
            this.rptL_2_67_InfoList = new ObservableCollection<rptL_2_67_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_67_Info> rptL_2_67_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_67_Info info = new rptL_2_67_Info();
            rptL_2_67_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_67_InfoList.Add((rptL_2_67_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_产品执行SQL
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_67_Info();
                rptL_2_67_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_68_Response : IResponse
    {
        #region 构造函数
        public rptL_2_68_Response()
        {
            this.rptL_2_68_InfoList = new ObservableCollection<rptL_2_68_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_68_Info> rptL_2_68_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_68_Info info = new rptL_2_68_Info();
            info.ip_addr = unpacker.GetStr("ip_addr");
            info.ip_port = unpacker.GetStr("ip_port");
            info.user_name = unpacker.GetStr("user_name");
            info.user_password = unpacker.GetStr("user_password");
            info.cmd_id = unpacker.GetInt("cmd_id");
            info.cmd_type = unpacker.GetInt("cmd_type");
            info.cmd_content = unpacker.GetStr("cmd_content");
            info.remark_info = unpacker.GetStr("remark_info");
            rptL_2_68_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_68_InfoList.Add((rptL_2_68_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_查询调用命令表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_2_68_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_IP_ADDR_STR);
                    info.ip_port = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_IP_PORT_STR);
                    info.user_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_USER_NAME_STR);
                    info.user_password = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_USER_PASSWORD_STR);
                    info.cmd_id = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CMD_ID_INT);
                    info.cmd_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CMD_TYPE_INT);
                    info.cmd_content = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CMD_CONTENT_STR);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    rptL_2_68_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_2_69_Response : IResponse
    {
        #region 构造函数
        public rptL_2_69_Response()
        {
            this.rptL_2_69_InfoList = new ObservableCollection<rptL_2_69_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_69_Info> rptL_2_69_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_69_Info info = new rptL_2_69_Info();
            info.sync_no = unpacker.GetInt("sync_no");
            info.sync_name = unpacker.GetStr("sync_name");
            info.target_db_name = unpacker.GetStr("target_db_name");
            info.target_table_name = unpacker.GetStr("target_table_name");
            info.source_db_name = unpacker.GetStr("source_db_name");
            info.source_table_name = unpacker.GetStr("source_table_name");
            info.src_last_update_time = unpacker.GetStr("src_last_update_time");
            info.src_max_updatetimes = unpacker.GetInt("src_max_updatetimes");
            info.src_table_rows = unpacker.GetInt("src_table_rows");
            info.tgt_last_update_time = unpacker.GetStr("tgt_last_update_time");
            info.tgt_max_updatetimes = unpacker.GetInt("tgt_max_updatetimes");
            info.tgt_table_rows = unpacker.GetInt("tgt_table_rows");
            info.sync_type = unpacker.GetInt("sync_type");
            info.sync_status = unpacker.GetInt("sync_status");
            info.remark_info = unpacker.GetStr("remark_info");
            info.begin_date = unpacker.GetInt("begin_date");
            info.begin_time = unpacker.GetInt("begin_time");
            info.end_date = unpacker.GetInt("end_date");
            info.end_time = unpacker.GetInt("end_time");
            info.deal_count = unpacker.GetInt("deal_count");
            rptL_2_69_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_69_InfoList.Add((rptL_2_69_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_查询同步状态表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_2_69_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.sync_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SYNC_NO_INT);
                    info.sync_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_SYNC_NAME_STR);
                    info.target_db_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_DB_NAME_STR);
                    info.target_table_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_TABLE_NAME_STR);
                    info.source_db_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_SOURCE_DB_NAME_STR);
                    info.source_table_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_SOURCE_TABLE_NAME_STR);
                    info.src_last_update_time = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_SRC_LAST_UPDATE_TIME_STR);
                    info.src_max_updatetimes = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SRC_MAX_UPDATETIMES_INT);
                    info.src_table_rows = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SRC_TABLE_ROWS_INT);
                    info.tgt_last_update_time = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TGT_LAST_UPDATE_TIME_STR);
                    info.tgt_max_updatetimes = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TGT_MAX_UPDATETIMES_INT);
                    info.tgt_table_rows = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TGT_TABLE_ROWS_INT);
                    info.sync_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SYNC_TYPE_INT);
                    info.sync_status = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SYNC_STATUS_INT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    info.begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT);
                    info.begin_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TIME_INT);
                    info.end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT);
                    info.end_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_TIME_INT);
                    info.deal_count = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_COUNT_INT);
                    rptL_2_69_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_2_100_Response : IResponse
    {
        #region 构造函数
        public rptL_2_100_Response()
        {
            this.rptL_2_100_InfoList = new ObservableCollection<rptL_2_100_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_100_Info> rptL_2_100_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_100_Info info = new rptL_2_100_Info();
            rptL_2_100_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_100_InfoList.Add((rptL_2_100_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_同步并计算产品所有信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_100_Info();
                rptL_2_100_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_101_Response : IResponse
    {
        #region 构造函数
        public rptL_2_101_Response()
        {
            this.rptL_2_101_InfoList = new ObservableCollection<rptL_2_101_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_101_Info> rptL_2_101_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_101_Info info = new rptL_2_101_Info();
            rptL_2_101_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_101_InfoList.Add((rptL_2_101_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_修改交易组附加属性
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_101_Info();
                rptL_2_101_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_151_Response : IResponse
    {
        #region 构造函数
        public rptL_2_151_Response()
        {
            this.rptL_2_151_InfoList = new ObservableCollection<rptL_2_151_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_151_Info> rptL_2_151_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_151_Info info = new rptL_2_151_Info();
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.curr_month = unpacker.GetInt("curr_month");
            info.region_type = unpacker.GetInt("region_type");
            info.region_type_name = unpacker.GetStr("region_type_name");
            info.begin_date = unpacker.GetInt("begin_date");
            info.end_date = unpacker.GetInt("end_date");
            info.stat_days = unpacker.GetInt("stat_days");
            info.rise_days = unpacker.GetInt("rise_days");
            info.fall_days = unpacker.GetInt("fall_days");
            info.max_cont_rise_days = unpacker.GetInt("max_cont_rise_days");
            info.max_cont_fall_days = unpacker.GetInt("max_cont_fall_days");
            info.day_win_ratio = unpacker.GetDouble("day_win_ratio");
            info.week_cnt = unpacker.GetInt("week_cnt");
            info.rise_weeks = unpacker.GetInt("rise_weeks");
            info.fall_weeks = unpacker.GetInt("fall_weeks");
            info.week_win_ratio = unpacker.GetDouble("week_win_ratio");
            info.begin_share_net_total = unpacker.GetDouble("begin_share_net_total");
            info.end_share_net_total = unpacker.GetDouble("end_share_net_total");
            rptL_2_151_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_151_InfoList.Add((rptL_2_151_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_查询产品区间统计
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_2_151_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.curr_month = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONTH_INT);
                    info.region_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REGION_TYPE_INT);
                    info.region_type_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REGION_TYPE_NAME_STR);
                    info.begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT);
                    info.end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT);
                    info.stat_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STAT_DAYS_INT);
                    info.rise_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISE_DAYS_INT);
                    info.fall_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FALL_DAYS_INT);
                    info.max_cont_rise_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MAX_CONT_RISE_DAYS_INT);
                    info.max_cont_fall_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MAX_CONT_FALL_DAYS_INT);
                    info.day_win_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DAY_WIN_RATIO_FLOAT);
                    info.week_cnt = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WEEK_CNT_INT);
                    info.rise_weeks = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISE_WEEKS_INT);
                    info.fall_weeks = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FALL_WEEKS_INT);
                    info.week_win_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WEEK_WIN_RATIO_FLOAT);
                    info.begin_share_net_total = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_SHARE_NET_TOTAL_FLOAT);
                    info.end_share_net_total = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_END_SHARE_NET_TOTAL_FLOAT);
                    rptL_2_151_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_2_152_Response : IResponse
    {
        #region 构造函数
        public rptL_2_152_Response()
        {
            this.rptL_2_152_InfoList = new ObservableCollection<rptL_2_152_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_152_Info> rptL_2_152_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_152_Info info = new rptL_2_152_Info();
            rptL_2_152_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_152_InfoList.Add((rptL_2_152_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_查询指数区间统计
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_2_152_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    rptL_2_152_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_2_153_Response : IResponse
    {
        #region 构造函数
        public rptL_2_153_Response()
        {
            this.rptL_2_153_InfoList = new ObservableCollection<rptL_2_153_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_153_Info> rptL_2_153_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_153_Info info = new rptL_2_153_Info();
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.curr_month = unpacker.GetInt("curr_month");
            info.region_type = unpacker.GetInt("region_type");
            info.region_type_name = unpacker.GetStr("region_type_name");
            info.begin_date = unpacker.GetInt("begin_date");
            info.end_date = unpacker.GetInt("end_date");
            info.stat_days = unpacker.GetInt("stat_days");
            info.rise_days = unpacker.GetInt("rise_days");
            info.fall_days = unpacker.GetInt("fall_days");
            info.max_cont_rise_days = unpacker.GetInt("max_cont_rise_days");
            info.max_cont_fall_days = unpacker.GetInt("max_cont_fall_days");
            info.day_win_ratio = unpacker.GetDouble("day_win_ratio");
            info.week_cnt = unpacker.GetInt("week_cnt");
            info.rise_weeks = unpacker.GetInt("rise_weeks");
            info.fall_weeks = unpacker.GetInt("fall_weeks");
            info.week_win_ratio = unpacker.GetDouble("week_win_ratio");
            info.begin_share_net_total = unpacker.GetDouble("begin_share_net_total");
            info.end_share_net_total = unpacker.GetDouble("end_share_net_total");
            rptL_2_153_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_153_InfoList.Add((rptL_2_153_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_查询产品指数区间统计
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_2_153_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.curr_month = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONTH_INT);
                    info.region_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REGION_TYPE_INT);
                    info.region_type_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REGION_TYPE_NAME_STR);
                    info.begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT);
                    info.end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT);
                    info.stat_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STAT_DAYS_INT);
                    info.rise_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISE_DAYS_INT);
                    info.fall_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FALL_DAYS_INT);
                    info.max_cont_rise_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MAX_CONT_RISE_DAYS_INT);
                    info.max_cont_fall_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MAX_CONT_FALL_DAYS_INT);
                    info.day_win_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DAY_WIN_RATIO_FLOAT);
                    info.week_cnt = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WEEK_CNT_INT);
                    info.rise_weeks = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISE_WEEKS_INT);
                    info.fall_weeks = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FALL_WEEKS_INT);
                    info.week_win_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WEEK_WIN_RATIO_FLOAT);
                    info.begin_share_net_total = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_SHARE_NET_TOTAL_FLOAT);
                    info.end_share_net_total = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_END_SHARE_NET_TOTAL_FLOAT);
                    rptL_2_153_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_2_154_Response : IResponse
    {
        #region 构造函数
        public rptL_2_154_Response()
        {
            this.rptL_2_154_InfoList = new ObservableCollection<rptL_2_154_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_154_Info> rptL_2_154_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_154_Info info = new rptL_2_154_Info();
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.curr_month = unpacker.GetInt("curr_month");
            info.region_type = unpacker.GetInt("region_type");
            info.region_type_name = unpacker.GetStr("region_type_name");
            info.begin_date = unpacker.GetInt("begin_date");
            info.end_date = unpacker.GetInt("end_date");
            info.indicator_id = unpacker.GetInt("indicator_id");
            info.indicator_name = unpacker.GetStr("indicator_name");
            info.indicator_value = unpacker.GetDouble("indicator_value");
            info.remark_info = unpacker.GetStr("remark_info");
            rptL_2_154_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_154_InfoList.Add((rptL_2_154_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_查询产品区间指标
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_2_154_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.curr_month = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONTH_INT);
                    info.region_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REGION_TYPE_INT);
                    info.region_type_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REGION_TYPE_NAME_STR);
                    info.begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT);
                    info.end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT);
                    info.indicator_id = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDICATOR_ID_INT);
                    info.indicator_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_INDICATOR_NAME_STR);
                    info.indicator_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INDICATOR_VALUE_FLOAT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    rptL_2_154_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_2_155_Response : IResponse
    {
        #region 构造函数
        public rptL_2_155_Response()
        {
            this.rptL_2_155_InfoList = new ObservableCollection<rptL_2_155_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_155_Info> rptL_2_155_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_155_Info info = new rptL_2_155_Info();
            rptL_2_155_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_155_InfoList.Add((rptL_2_155_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_查询指数区间指标
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_2_155_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    rptL_2_155_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_2_156_Response : IResponse
    {
        #region 构造函数
        public rptL_2_156_Response()
        {
            this.rptL_2_156_InfoList = new ObservableCollection<rptL_2_156_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_156_Info> rptL_2_156_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_156_Info info = new rptL_2_156_Info();
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.curr_month = unpacker.GetInt("curr_month");
            info.region_type = unpacker.GetInt("region_type");
            info.region_type_name = unpacker.GetStr("region_type_name");
            info.begin_date = unpacker.GetInt("begin_date");
            info.end_date = unpacker.GetInt("end_date");
            info.indicator_id = unpacker.GetInt("indicator_id");
            info.indicator_name = unpacker.GetStr("indicator_name");
            info.indicator_value = unpacker.GetDouble("indicator_value");
            info.remark_info = unpacker.GetStr("remark_info");
            info.achi_compa_crite = unpacker.GetInt("achi_compa_crite");
            info.achi_crite_value = unpacker.GetDouble("achi_crite_value");
            info.cmp_value = unpacker.GetDouble("cmp_value");
            info.indicator_memo = unpacker.GetStr("indicator_memo");
            rptL_2_156_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_156_InfoList.Add((rptL_2_156_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_查询产品业绩基准区间指标
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_2_156_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.curr_month = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONTH_INT);
                    info.region_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REGION_TYPE_INT);
                    info.region_type_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REGION_TYPE_NAME_STR);
                    info.begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT);
                    info.end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT);
                    info.indicator_id = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDICATOR_ID_INT);
                    info.indicator_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_INDICATOR_NAME_STR);
                    info.indicator_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INDICATOR_VALUE_FLOAT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    info.achi_compa_crite = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ACHI_COMPA_CRITE_INT);
                    info.achi_crite_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACHI_CRITE_VALUE_FLOAT);
                    info.cmp_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CMP_VALUE_FLOAT);
                    info.indicator_memo = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_INDICATOR_MEMO_STR);
                    rptL_2_156_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_2_157_Response : IResponse
    {
        #region 构造函数
        public rptL_2_157_Response()
        {
            this.rptL_2_157_InfoList = new ObservableCollection<rptL_2_157_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_157_Info> rptL_2_157_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_157_Info info = new rptL_2_157_Info();
            rptL_2_157_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_157_InfoList.Add((rptL_2_157_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_新增产品日净值
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_157_Info();
                rptL_2_157_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_158_Response : IResponse
    {
        #region 构造函数
        public rptL_2_158_Response()
        {
            this.rptL_2_158_InfoList = new ObservableCollection<rptL_2_158_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_158_Info> rptL_2_158_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_158_Info info = new rptL_2_158_Info();
            rptL_2_158_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_158_InfoList.Add((rptL_2_158_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_删除产品日净值
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_158_Info();
                rptL_2_158_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_159_Response : IResponse
    {
        #region 构造函数
        public rptL_2_159_Response()
        {
            this.rptL_2_159_InfoList = new ObservableCollection<rptL_2_159_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_159_Info> rptL_2_159_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_159_Info info = new rptL_2_159_Info();
            rptL_2_159_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_159_InfoList.Add((rptL_2_159_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_修改产品日净值
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_159_Info();
                rptL_2_159_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_160_Response : IResponse
    {
        #region 构造函数
        public rptL_2_160_Response()
        {
            this.rptL_2_160_InfoList = new ObservableCollection<rptL_2_160_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_160_Info> rptL_2_160_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_160_Info info = new rptL_2_160_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.share_net = unpacker.GetDouble("share_net");
            info.last_share_net = unpacker.GetDouble("last_share_net");
            info.share_net_total = unpacker.GetDouble("share_net_total");
            info.pre_share_net_total = unpacker.GetDouble("pre_share_net_total");
            info.net_change = unpacker.GetDouble("net_change");
            info.net_growth_rate = unpacker.GetDouble("net_growth_rate");
            info.grp_row = unpacker.GetInt64("grp_row");
            info.nav_asset = unpacker.GetDouble("nav_asset");
            info.asset_market_value = unpacker.GetDouble("asset_market_value");
            info.fund_share_total = unpacker.GetDouble("fund_share_total");
            info.fund_asset_net = unpacker.GetDouble("fund_asset_net");
            info.pd_nav_day_ratio = unpacker.GetDouble("pd_nav_day_ratio");
            info.pd_nav_month_ratio = unpacker.GetDouble("pd_nav_month_ratio");
            info.total_realiz_pandl_ratio = unpacker.GetDouble("total_realiz_pandl_ratio");
            info.pre_fee_share_net_total = unpacker.GetDouble("pre_fee_share_net_total");
            info.post_fee_share_net_total = unpacker.GetDouble("post_fee_share_net_total");
            info.achieve_performance = unpacker.GetDouble("achieve_performance");
            info.recover_param = unpacker.GetDouble("recover_param");
            info.last_init_date = unpacker.GetInt("last_init_date");
            rptL_2_160_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_160_InfoList.Add((rptL_2_160_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_查询产品日净值
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_2_160_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.share_net = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SHARE_NET_FLOAT);
                    info.last_share_net = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_SHARE_NET_FLOAT);
                    info.share_net_total = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SHARE_NET_TOTAL_FLOAT);
                    info.pre_share_net_total = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SHARE_NET_TOTAL_FLOAT);
                    info.net_change = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NET_CHANGE_FLOAT);
                    info.net_growth_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NET_GROWTH_RATE_FLOAT);
                    info.grp_row = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_GRP_ROW_INT64);
                    info.nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT);
                    info.asset_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_MARKET_VALUE_FLOAT);
                    info.fund_share_total = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_SHARE_TOTAL_FLOAT);
                    info.fund_asset_net = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_ASSET_NET_FLOAT);
                    info.pd_nav_day_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAV_DAY_RATIO_FLOAT);
                    info.pd_nav_month_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAV_MONTH_RATIO_FLOAT);
                    info.total_realiz_pandl_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_REALIZ_PANDL_RATIO_FLOAT);
                    info.pre_fee_share_net_total = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_FEE_SHARE_NET_TOTAL_FLOAT);
                    info.post_fee_share_net_total = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POST_FEE_SHARE_NET_TOTAL_FLOAT);
                    info.achieve_performance = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACHIEVE_PERFORMANCE_FLOAT);
                    info.recover_param = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RECOVER_PARAM_FLOAT);
                    info.last_init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LAST_INIT_DATE_INT);
                    rptL_2_160_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_2_161_Response : IResponse
    {
        #region 构造函数
        public rptL_2_161_Response()
        {
            this.rptL_2_161_InfoList = new ObservableCollection<rptL_2_161_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_161_Info> rptL_2_161_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_161_Info info = new rptL_2_161_Info();
            rptL_2_161_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_161_InfoList.Add((rptL_2_161_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_初始化产品日收益率
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_161_Info();
                rptL_2_161_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_162_Response : IResponse
    {
        #region 构造函数
        public rptL_2_162_Response()
        {
            this.rptL_2_162_InfoList = new ObservableCollection<rptL_2_162_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_162_Info> rptL_2_162_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_162_Info info = new rptL_2_162_Info();
            rptL_2_162_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_162_InfoList.Add((rptL_2_162_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_初始化指数日收益率
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_162_Info();
                rptL_2_162_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_163_Response : IResponse
    {
        #region 构造函数
        public rptL_2_163_Response()
        {
            this.rptL_2_163_InfoList = new ObservableCollection<rptL_2_163_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_163_Info> rptL_2_163_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_163_Info info = new rptL_2_163_Info();
            rptL_2_163_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_163_InfoList.Add((rptL_2_163_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_初始化产品周收益率
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_163_Info();
                rptL_2_163_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_164_Response : IResponse
    {
        #region 构造函数
        public rptL_2_164_Response()
        {
            this.rptL_2_164_InfoList = new ObservableCollection<rptL_2_164_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_164_Info> rptL_2_164_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_164_Info info = new rptL_2_164_Info();
            rptL_2_164_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_164_InfoList.Add((rptL_2_164_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_初始化指数周收益率
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_164_Info();
                rptL_2_164_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_165_Response : IResponse
    {
        #region 构造函数
        public rptL_2_165_Response()
        {
            this.rptL_2_165_InfoList = new ObservableCollection<rptL_2_165_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_165_Info> rptL_2_165_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_165_Info info = new rptL_2_165_Info();
            rptL_2_165_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_165_InfoList.Add((rptL_2_165_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_初始化产品月收益率
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_165_Info();
                rptL_2_165_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_166_Response : IResponse
    {
        #region 构造函数
        public rptL_2_166_Response()
        {
            this.rptL_2_166_InfoList = new ObservableCollection<rptL_2_166_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_166_Info> rptL_2_166_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_166_Info info = new rptL_2_166_Info();
            rptL_2_166_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_166_InfoList.Add((rptL_2_166_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_初始化指数月收益率
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_166_Info();
                rptL_2_166_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_181_Response : IResponse
    {
        #region 构造函数
        public rptL_2_181_Response()
        {
            this.rptL_2_181_InfoList = new ObservableCollection<rptL_2_181_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_181_Info> rptL_2_181_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_181_Info info = new rptL_2_181_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.share_net = unpacker.GetDouble("share_net");
            info.last_share_net = unpacker.GetDouble("last_share_net");
            info.share_net_total = unpacker.GetDouble("share_net_total");
            info.pre_share_net_total = unpacker.GetDouble("pre_share_net_total");
            info.net_change = unpacker.GetDouble("net_change");
            info.net_growth_rate = unpacker.GetDouble("net_growth_rate");
            info.grp_row = unpacker.GetInt64("grp_row");
            info.asset_market_value = unpacker.GetDouble("asset_market_value");
            info.fund_share_total = unpacker.GetDouble("fund_share_total");
            info.fund_asset_net = unpacker.GetDouble("fund_asset_net");
            info.pd_nav_day_ratio = unpacker.GetDouble("pd_nav_day_ratio");
            info.pd_nav_month_ratio = unpacker.GetDouble("pd_nav_month_ratio");
            info.total_realiz_pandl_ratio = unpacker.GetDouble("total_realiz_pandl_ratio");
            info.pre_fee_share_net_total = unpacker.GetDouble("pre_fee_share_net_total");
            info.post_fee_share_net_total = unpacker.GetDouble("post_fee_share_net_total");
            rptL_2_181_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_181_InfoList.Add((rptL_2_181_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_查询产品日收益率
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_2_181_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.share_net = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SHARE_NET_FLOAT);
                    info.last_share_net = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_SHARE_NET_FLOAT);
                    info.share_net_total = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SHARE_NET_TOTAL_FLOAT);
                    info.pre_share_net_total = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SHARE_NET_TOTAL_FLOAT);
                    info.net_change = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NET_CHANGE_FLOAT);
                    info.net_growth_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NET_GROWTH_RATE_FLOAT);
                    info.grp_row = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_GRP_ROW_INT64);
                    info.asset_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_MARKET_VALUE_FLOAT);
                    info.fund_share_total = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_SHARE_TOTAL_FLOAT);
                    info.fund_asset_net = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_ASSET_NET_FLOAT);
                    info.pd_nav_day_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAV_DAY_RATIO_FLOAT);
                    info.pd_nav_month_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAV_MONTH_RATIO_FLOAT);
                    info.total_realiz_pandl_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_REALIZ_PANDL_RATIO_FLOAT);
                    info.pre_fee_share_net_total = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_FEE_SHARE_NET_TOTAL_FLOAT);
                    info.post_fee_share_net_total = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POST_FEE_SHARE_NET_TOTAL_FLOAT);
                    rptL_2_181_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_2_182_Response : IResponse
    {
        #region 构造函数
        public rptL_2_182_Response()
        {
            this.rptL_2_182_InfoList = new ObservableCollection<rptL_2_182_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_182_Info> rptL_2_182_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_182_Info info = new rptL_2_182_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_name = unpacker.GetStr("stock_name");
            info.today_close_price = unpacker.GetDouble("today_close_price");
            info.pre_close_price = unpacker.GetDouble("pre_close_price");
            info.price_change = unpacker.GetDouble("price_change");
            info.price_growth_rate = unpacker.GetDouble("price_growth_rate");
            info.grp_row = unpacker.GetInt64("grp_row");
            rptL_2_182_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_182_InfoList.Add((rptL_2_182_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_查询指数日收益率
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_2_182_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    info.today_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_CLOSE_PRICE_FLOAT);
                    info.pre_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_CLOSE_PRICE_FLOAT);
                    info.price_change = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_CHANGE_FLOAT);
                    info.price_growth_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_GROWTH_RATE_FLOAT);
                    info.grp_row = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_GRP_ROW_INT64);
                    rptL_2_182_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_2_183_Response : IResponse
    {
        #region 构造函数
        public rptL_2_183_Response()
        {
            this.rptL_2_183_InfoList = new ObservableCollection<rptL_2_183_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_183_Info> rptL_2_183_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_183_Info info = new rptL_2_183_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.curr_year = unpacker.GetInt("curr_year");
            info.week_no = unpacker.GetInt("week_no");
            info.share_net = unpacker.GetDouble("share_net");
            info.share_net_total = unpacker.GetDouble("share_net_total");
            info.pre_share_net_total = unpacker.GetDouble("pre_share_net_total");
            info.net_change = unpacker.GetDouble("net_change");
            info.net_growth_rate = unpacker.GetDouble("net_growth_rate");
            info.stat_days = unpacker.GetInt("stat_days");
            info.begin_date = unpacker.GetInt("begin_date");
            info.end_date = unpacker.GetInt("end_date");
            info.grp_row = unpacker.GetInt64("grp_row");
            info.pre_fee_share_net_total = unpacker.GetDouble("pre_fee_share_net_total");
            info.post_fee_share_net_total = unpacker.GetDouble("post_fee_share_net_total");
            rptL_2_183_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_183_InfoList.Add((rptL_2_183_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_查询产品周收益率
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_2_183_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.curr_year = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CURR_YEAR_INT);
                    info.week_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WEEK_NO_INT);
                    info.share_net = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SHARE_NET_FLOAT);
                    info.share_net_total = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SHARE_NET_TOTAL_FLOAT);
                    info.pre_share_net_total = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SHARE_NET_TOTAL_FLOAT);
                    info.net_change = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NET_CHANGE_FLOAT);
                    info.net_growth_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NET_GROWTH_RATE_FLOAT);
                    info.stat_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STAT_DAYS_INT);
                    info.begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT);
                    info.end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT);
                    info.grp_row = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_GRP_ROW_INT64);
                    info.pre_fee_share_net_total = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_FEE_SHARE_NET_TOTAL_FLOAT);
                    info.post_fee_share_net_total = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POST_FEE_SHARE_NET_TOTAL_FLOAT);
                    rptL_2_183_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_2_184_Response : IResponse
    {
        #region 构造函数
        public rptL_2_184_Response()
        {
            this.rptL_2_184_InfoList = new ObservableCollection<rptL_2_184_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_184_Info> rptL_2_184_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_184_Info info = new rptL_2_184_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_name = unpacker.GetStr("stock_name");
            info.curr_year = unpacker.GetInt("curr_year");
            info.week_no = unpacker.GetInt("week_no");
            info.today_close_price = unpacker.GetDouble("today_close_price");
            info.pre_close_price = unpacker.GetDouble("pre_close_price");
            info.price_change = unpacker.GetDouble("price_change");
            info.price_growth_rate = unpacker.GetDouble("price_growth_rate");
            info.begin_date = unpacker.GetInt("begin_date");
            info.end_date = unpacker.GetInt("end_date");
            info.remark_info = unpacker.GetStr("remark_info");
            info.grp_row = unpacker.GetInt64("grp_row");
            rptL_2_184_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_184_InfoList.Add((rptL_2_184_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_查询指数周收益率
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_2_184_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    info.curr_year = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CURR_YEAR_INT);
                    info.week_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WEEK_NO_INT);
                    info.today_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_CLOSE_PRICE_FLOAT);
                    info.pre_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_CLOSE_PRICE_FLOAT);
                    info.price_change = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_CHANGE_FLOAT);
                    info.price_growth_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_GROWTH_RATE_FLOAT);
                    info.begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT);
                    info.end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    info.grp_row = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_GRP_ROW_INT64);
                    rptL_2_184_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_2_185_Response : IResponse
    {
        #region 构造函数
        public rptL_2_185_Response()
        {
            this.rptL_2_185_InfoList = new ObservableCollection<rptL_2_185_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_185_Info> rptL_2_185_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_185_Info info = new rptL_2_185_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.curr_month = unpacker.GetInt("curr_month");
            info.share_net = unpacker.GetDouble("share_net");
            info.share_net_total = unpacker.GetDouble("share_net_total");
            info.pre_share_net_total = unpacker.GetDouble("pre_share_net_total");
            info.stat_days = unpacker.GetInt("stat_days");
            info.rise_days = unpacker.GetInt("rise_days");
            info.fall_days = unpacker.GetInt("fall_days");
            info.max_cont_rise_days = unpacker.GetInt("max_cont_rise_days");
            info.max_cont_fall_days = unpacker.GetInt("max_cont_fall_days");
            info.net_change = unpacker.GetDouble("net_change");
            info.net_growth_rate = unpacker.GetDouble("net_growth_rate");
            info.begin_date = unpacker.GetInt("begin_date");
            info.end_date = unpacker.GetInt("end_date");
            info.remark_info = unpacker.GetStr("remark_info");
            info.grp_row = unpacker.GetInt64("grp_row");
            info.pre_fee_share_net_total = unpacker.GetDouble("pre_fee_share_net_total");
            info.post_fee_share_net_total = unpacker.GetDouble("post_fee_share_net_total");
            rptL_2_185_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_185_InfoList.Add((rptL_2_185_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_查询产品月收益率
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_2_185_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.curr_month = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONTH_INT);
                    info.share_net = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SHARE_NET_FLOAT);
                    info.share_net_total = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SHARE_NET_TOTAL_FLOAT);
                    info.pre_share_net_total = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SHARE_NET_TOTAL_FLOAT);
                    info.stat_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STAT_DAYS_INT);
                    info.rise_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISE_DAYS_INT);
                    info.fall_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FALL_DAYS_INT);
                    info.max_cont_rise_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MAX_CONT_RISE_DAYS_INT);
                    info.max_cont_fall_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MAX_CONT_FALL_DAYS_INT);
                    info.net_change = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NET_CHANGE_FLOAT);
                    info.net_growth_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NET_GROWTH_RATE_FLOAT);
                    info.begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT);
                    info.end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    info.grp_row = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_GRP_ROW_INT64);
                    info.pre_fee_share_net_total = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_FEE_SHARE_NET_TOTAL_FLOAT);
                    info.post_fee_share_net_total = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POST_FEE_SHARE_NET_TOTAL_FLOAT);
                    rptL_2_185_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_2_186_Response : IResponse
    {
        #region 构造函数
        public rptL_2_186_Response()
        {
            this.rptL_2_186_InfoList = new ObservableCollection<rptL_2_186_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_186_Info> rptL_2_186_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_186_Info info = new rptL_2_186_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_name = unpacker.GetStr("stock_name");
            info.curr_month = unpacker.GetInt("curr_month");
            info.today_close_price = unpacker.GetDouble("today_close_price");
            info.pre_close_price = unpacker.GetDouble("pre_close_price");
            info.stat_days = unpacker.GetInt("stat_days");
            info.rise_days = unpacker.GetInt("rise_days");
            info.fall_days = unpacker.GetInt("fall_days");
            info.max_cont_rise_days = unpacker.GetInt("max_cont_rise_days");
            info.max_cont_fall_days = unpacker.GetInt("max_cont_fall_days");
            info.price_change = unpacker.GetDouble("price_change");
            info.price_growth_rate = unpacker.GetDouble("price_growth_rate");
            info.begin_date = unpacker.GetInt("begin_date");
            info.end_date = unpacker.GetInt("end_date");
            info.remark_info = unpacker.GetStr("remark_info");
            info.grp_row = unpacker.GetInt64("grp_row");
            rptL_2_186_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_186_InfoList.Add((rptL_2_186_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_查询指数月收益率
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_2_186_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    info.curr_month = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONTH_INT);
                    info.today_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_CLOSE_PRICE_FLOAT);
                    info.pre_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_CLOSE_PRICE_FLOAT);
                    info.stat_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STAT_DAYS_INT);
                    info.rise_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISE_DAYS_INT);
                    info.fall_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FALL_DAYS_INT);
                    info.max_cont_rise_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MAX_CONT_RISE_DAYS_INT);
                    info.max_cont_fall_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MAX_CONT_FALL_DAYS_INT);
                    info.price_change = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_CHANGE_FLOAT);
                    info.price_growth_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_GROWTH_RATE_FLOAT);
                    info.begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT);
                    info.end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    info.grp_row = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_GRP_ROW_INT64);
                    rptL_2_186_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_2_201_Response : IResponse
    {
        #region 构造函数
        public rptL_2_201_Response()
        {
            this.rptL_2_201_InfoList = new ObservableCollection<rptL_2_201_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_201_Info> rptL_2_201_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_201_Info info = new rptL_2_201_Info();
            rptL_2_201_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_201_InfoList.Add((rptL_2_201_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_月报处理产品收益率
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_201_Info();
                rptL_2_201_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_202_Response : IResponse
    {
        #region 构造函数
        public rptL_2_202_Response()
        {
            this.rptL_2_202_InfoList = new ObservableCollection<rptL_2_202_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_202_Info> rptL_2_202_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_202_Info info = new rptL_2_202_Info();
            rptL_2_202_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_202_InfoList.Add((rptL_2_202_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_月报处理指数收益率
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_202_Info();
                rptL_2_202_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_203_Response : IResponse
    {
        #region 构造函数
        public rptL_2_203_Response()
        {
            this.rptL_2_203_InfoList = new ObservableCollection<rptL_2_203_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_203_Info> rptL_2_203_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_203_Info info = new rptL_2_203_Info();
            rptL_2_203_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_203_InfoList.Add((rptL_2_203_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_月报处理产品最大回撤
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_203_Info();
                rptL_2_203_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_204_Response : IResponse
    {
        #region 构造函数
        public rptL_2_204_Response()
        {
            this.rptL_2_204_InfoList = new ObservableCollection<rptL_2_204_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_204_Info> rptL_2_204_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_204_Info info = new rptL_2_204_Info();
            rptL_2_204_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_204_InfoList.Add((rptL_2_204_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_月报处理指数最大回撤
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_204_Info();
                rptL_2_204_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_205_Response : IResponse
    {
        #region 构造函数
        public rptL_2_205_Response()
        {
            this.rptL_2_205_InfoList = new ObservableCollection<rptL_2_205_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_205_Info> rptL_2_205_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_205_Info info = new rptL_2_205_Info();
            rptL_2_205_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_205_InfoList.Add((rptL_2_205_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_月报处理产品夏普比率
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_205_Info();
                rptL_2_205_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_206_Response : IResponse
    {
        #region 构造函数
        public rptL_2_206_Response()
        {
            this.rptL_2_206_InfoList = new ObservableCollection<rptL_2_206_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_206_Info> rptL_2_206_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_206_Info info = new rptL_2_206_Info();
            rptL_2_206_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_206_InfoList.Add((rptL_2_206_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_月报处理指数夏普比率
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_206_Info();
                rptL_2_206_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_207_Response : IResponse
    {
        #region 构造函数
        public rptL_2_207_Response()
        {
            this.rptL_2_207_InfoList = new ObservableCollection<rptL_2_207_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_207_Info> rptL_2_207_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_207_Info info = new rptL_2_207_Info();
            rptL_2_207_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_207_InfoList.Add((rptL_2_207_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_月报处理产品日胜率
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_207_Info();
                rptL_2_207_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_208_Response : IResponse
    {
        #region 构造函数
        public rptL_2_208_Response()
        {
            this.rptL_2_208_InfoList = new ObservableCollection<rptL_2_208_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_208_Info> rptL_2_208_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_208_Info info = new rptL_2_208_Info();
            rptL_2_208_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_208_InfoList.Add((rptL_2_208_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_月报处理指数日胜率
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_208_Info();
                rptL_2_208_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_209_Response : IResponse
    {
        #region 构造函数
        public rptL_2_209_Response()
        {
            this.rptL_2_209_InfoList = new ObservableCollection<rptL_2_209_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_209_Info> rptL_2_209_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_209_Info info = new rptL_2_209_Info();
            rptL_2_209_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_209_InfoList.Add((rptL_2_209_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_月报处理产品周胜率
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_209_Info();
                rptL_2_209_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_210_Response : IResponse
    {
        #region 构造函数
        public rptL_2_210_Response()
        {
            this.rptL_2_210_InfoList = new ObservableCollection<rptL_2_210_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_210_Info> rptL_2_210_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_210_Info info = new rptL_2_210_Info();
            rptL_2_210_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_210_InfoList.Add((rptL_2_210_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_月报处理指数周胜率
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_210_Info();
                rptL_2_210_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_211_Response : IResponse
    {
        #region 构造函数
        public rptL_2_211_Response()
        {
            this.rptL_2_211_InfoList = new ObservableCollection<rptL_2_211_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_211_Info> rptL_2_211_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_211_Info info = new rptL_2_211_Info();
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.fund_manager_no = unpacker.GetInt("fund_manager_no");
            info.fund_manager_name = unpacker.GetStr("fund_manager_name");
            info.trader_no = unpacker.GetInt("trader_no");
            info.trader_name = unpacker.GetStr("trader_name");
            info.show_order = unpacker.GetInt("show_order");
            info.remark_info = unpacker.GetStr("remark_info");
            rptL_2_211_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_211_InfoList.Add((rptL_2_211_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_查询基金经理与交易员关系
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_2_211_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.fund_manager_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_NO_INT);
                    info.fund_manager_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_NAME_STR);
                    info.trader_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRADER_NO_INT);
                    info.trader_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TRADER_NAME_STR);
                    info.show_order = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SHOW_ORDER_INT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    rptL_2_211_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_2_301_Response : IResponse
    {
        #region 构造函数
        public rptL_2_301_Response()
        {
            this.rptL_2_301_InfoList = new ObservableCollection<rptL_2_301_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_301_Info> rptL_2_301_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_301_Info info = new rptL_2_301_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.runtime = unpacker.GetInt("runtime");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.begin_NAV = unpacker.GetDouble("begin_NAV");
            info.nav_asset = unpacker.GetDouble("nav_asset");
            info.total_asset = unpacker.GetDouble("total_asset");
            info.stock_asset = unpacker.GetDouble("stock_asset");
            info.futu_asset = unpacker.GetDouble("futu_asset");
            info.option_asset = unpacker.GetDouble("option_asset");
            info.warrant_asset = unpacker.GetDouble("warrant_asset");
            info.fund_asset = unpacker.GetDouble("fund_asset");
            info.cash_asset = unpacker.GetDouble("cash_asset");
            info.repo_asset = unpacker.GetDouble("repo_asset");
            info.bond_asset = unpacker.GetDouble("bond_asset");
            info.other_asset = unpacker.GetDouble("other_asset");
            info.acco_cash = unpacker.GetDouble("acco_cash");
            info.cash_bala = unpacker.GetDouble("cash_bala");
            info.apply_amt = unpacker.GetDouble("apply_amt");
            info.redemp_amt = unpacker.GetDouble("redemp_amt");
            info.total_cash_divide = unpacker.GetDouble("total_cash_divide");
            info.money_fund_asset = unpacker.GetDouble("money_fund_asset");
            info.unit_nav = unpacker.GetDouble("unit_nav");
            info.pre_pd_unit_nav = unpacker.GetDouble("pre_pd_unit_nav");
            info.total_unit_nav = unpacker.GetDouble("total_unit_nav");
            info.last_week_pd_nav = unpacker.GetDouble("last_week_pd_nav");
            info.last_month_pd_nav = unpacker.GetDouble("last_month_pd_nav");
            info.last_quarter_pd_nav = unpacker.GetDouble("last_quarter_pd_nav");
            info.last_year_pd_nav = unpacker.GetDouble("last_year_pd_nav");
            info.pd_all_share = unpacker.GetDouble("pd_all_share");
            info.curr_share = unpacker.GetDouble("curr_share");
            info.pre_share = unpacker.GetDouble("pre_share");
            info.total_payab_amt = unpacker.GetDouble("total_payab_amt");
            info.total_rece_amt = unpacker.GetDouble("total_rece_amt");
            info.product_unit_nav_ration = unpacker.GetDouble("product_unit_nav_ration");
            info.buy_amt = unpacker.GetDouble("buy_amt");
            info.sellout_amt = unpacker.GetDouble("sellout_amt");
            info.remark_info = unpacker.GetStr("remark_info");
            rptL_2_301_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_301_InfoList.Add((rptL_2_301_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_查询产品资产
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_2_301_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.runtime = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RUNTIME_INT);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.begin_NAV = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_NAV_FLOAT);
                    info.nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT);
                    info.total_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_ASSET_FLOAT);
                    info.stock_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_FLOAT);
                    info.futu_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ASSET_FLOAT);
                    info.option_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPTION_ASSET_FLOAT);
                    info.warrant_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WARRANT_ASSET_FLOAT);
                    info.fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_ASSET_FLOAT);
                    info.cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_ASSET_FLOAT);
                    info.repo_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPO_ASSET_FLOAT);
                    info.bond_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ASSET_FLOAT);
                    info.other_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_ASSET_FLOAT);
                    info.acco_cash = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_CASH_FLOAT);
                    info.cash_bala = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_BALA_FLOAT);
                    info.apply_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_APPLY_AMT_FLOAT);
                    info.redemp_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REDEMP_AMT_FLOAT);
                    info.total_cash_divide = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_CASH_DIVIDE_FLOAT);
                    info.money_fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MONEY_FUND_ASSET_FLOAT);
                    info.unit_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_NAV_FLOAT);
                    info.pre_pd_unit_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_PD_UNIT_NAV_FLOAT);
                    info.total_unit_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_UNIT_NAV_FLOAT);
                    info.last_week_pd_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_WEEK_PD_NAV_FLOAT);
                    info.last_month_pd_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_MONTH_PD_NAV_FLOAT);
                    info.last_quarter_pd_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_QUARTER_PD_NAV_FLOAT);
                    info.last_year_pd_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_YEAR_PD_NAV_FLOAT);
                    info.pd_all_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_ALL_SHARE_FLOAT);
                    info.curr_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_SHARE_FLOAT);
                    info.pre_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SHARE_FLOAT);
                    info.total_payab_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_PAYAB_AMT_FLOAT);
                    info.total_rece_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_RECE_AMT_FLOAT);
                    info.product_unit_nav_ration = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRODUCT_UNIT_NAV_RATION_FLOAT);
                    info.buy_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_AMT_FLOAT);
                    info.sellout_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELLOUT_AMT_FLOAT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    rptL_2_301_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_2_302_Response : IResponse
    {
        #region 构造函数
        public rptL_2_302_Response()
        {
            this.rptL_2_302_InfoList = new ObservableCollection<rptL_2_302_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_302_Info> rptL_2_302_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_302_Info info = new rptL_2_302_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_name = unpacker.GetStr("stock_name");
            info.asset_acco = unpacker.GetStr("asset_acco");
            info.stock_acco = unpacker.GetStr("stock_acco");
            info.invest_type = unpacker.GetInt("invest_type");
            info.stock_type = unpacker.GetInt("stock_type");
            info.asset_type = unpacker.GetInt("asset_type");
            info.asset_kind = unpacker.GetInt("asset_kind");
            info.begin_qty = unpacker.GetDouble("begin_qty");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.frozen_qty = unpacker.GetDouble("frozen_qty");
            info.unfroz_qty = unpacker.GetDouble("unfroz_qty");
            info.cost_amt = unpacker.GetDouble("cost_amt");
            info.realize_pandl = unpacker.GetDouble("realize_pandl");
            info.intrst_cost_amt = unpacker.GetDouble("intrst_cost_amt");
            info.intrst_pandl = unpacker.GetDouble("intrst_pandl");
            info.last_price = unpacker.GetDouble("last_price");
            info.stock_asset_value = unpacker.GetDouble("stock_asset_value");
            info.value_dirty_price = unpacker.GetDouble("value_dirty_price");
            info.value_net_price = unpacker.GetDouble("value_net_price");
            info.buy_qty = unpacker.GetDouble("buy_qty");
            info.buy_amt = unpacker.GetDouble("buy_amt");
            info.sell_qty = unpacker.GetDouble("sell_qty");
            info.sellout_amt = unpacker.GetDouble("sellout_amt");
            rptL_2_302_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_302_InfoList.Add((rptL_2_302_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_查询产品持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_2_302_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    info.asset_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STR);
                    info.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                    info.invest_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INVEST_TYPE_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    info.asset_kind = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_KIND_INT);
                    info.begin_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_QTY_FLOAT);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_QTY_FLOAT);
                    info.unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_QTY_FLOAT);
                    info.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                    info.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    info.intrst_cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_COST_AMT_FLOAT);
                    info.intrst_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_PANDL_FLOAT);
                    info.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    info.stock_asset_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_VALUE_FLOAT);
                    info.value_dirty_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VALUE_DIRTY_PRICE_FLOAT);
                    info.value_net_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VALUE_NET_PRICE_FLOAT);
                    info.buy_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_QTY_FLOAT);
                    info.buy_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_AMT_FLOAT);
                    info.sell_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_QTY_FLOAT);
                    info.sellout_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELLOUT_AMT_FLOAT);
                    rptL_2_302_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_2_303_Response : IResponse
    {
        #region 构造函数
        public rptL_2_303_Response()
        {
            this.rptL_2_303_InfoList = new ObservableCollection<rptL_2_303_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_303_Info> rptL_2_303_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_303_Info info = new rptL_2_303_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.pd_no = unpacker.GetInt("pd_no");
            info.co_no = unpacker.GetInt("co_no");
            info.industry_std = unpacker.GetInt("industry_std");
            info.industry_classification = unpacker.GetInt("industry_classification");
            info.industry_id = unpacker.GetInt("industry_id");
            info.industry_code = unpacker.GetStr("industry_code");
            info.indu_name = unpacker.GetStr("indu_name");
            info.basket_qty = unpacker.GetDouble("basket_qty");
            info.cost_amt = unpacker.GetDouble("cost_amt");
            info.posi_market_value = unpacker.GetDouble("posi_market_value");
            info.weight_ratio = unpacker.GetDouble("weight_ratio");
            info.float_pandl = unpacker.GetDouble("float_pandl");
            info.realize_pandl = unpacker.GetDouble("realize_pandl");
            info.remark_info = unpacker.GetStr("remark_info");
            rptL_2_303_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_303_InfoList.Add((rptL_2_303_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_查询产品行业
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_2_303_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.industry_std = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDUSTRY_STD_INT);
                    info.industry_classification = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDUSTRY_CLASSIFICATION_INT);
                    info.industry_id = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDUSTRY_ID_INT);
                    info.industry_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_INDUSTRY_CODE_STR);
                    info.indu_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_INDU_NAME_STR);
                    info.basket_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_QTY_FLOAT);
                    info.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                    info.posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_MARKET_VALUE_FLOAT);
                    info.weight_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WEIGHT_RATIO_FLOAT);
                    info.float_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FLOAT_PANDL_FLOAT);
                    info.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    rptL_2_303_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_2_304_Response : IResponse
    {
        #region 构造函数
        public rptL_2_304_Response()
        {
            this.rptL_2_304_InfoList = new ObservableCollection<rptL_2_304_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_304_Info> rptL_2_304_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_304_Info info = new rptL_2_304_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.begin_date = unpacker.GetInt("begin_date");
            info.end_date = unpacker.GetInt("end_date");
            info.pd_no = unpacker.GetInt("pd_no");
            info.co_no = unpacker.GetInt("co_no");
            info.industry_std = unpacker.GetInt("industry_std");
            info.industry_classification = unpacker.GetInt("industry_classification");
            info.industry_id = unpacker.GetInt("industry_id");
            info.industry_code = unpacker.GetStr("industry_code");
            info.indu_name = unpacker.GetStr("indu_name");
            info.begin_qty = unpacker.GetDouble("begin_qty");
            info.begin_cost_amt = unpacker.GetDouble("begin_cost_amt");
            info.begin_posi_market_value = unpacker.GetDouble("begin_posi_market_value");
            info.begin_realize_pandl = unpacker.GetDouble("begin_realize_pandl");
            info.end_cur_qty = unpacker.GetInt("end_cur_qty");
            info.end_cost_amt = unpacker.GetDouble("end_cost_amt");
            info.end_posi_market_value = unpacker.GetDouble("end_posi_market_value");
            info.end_realize_pandl = unpacker.GetDouble("end_realize_pandl");
            info.float_pandl = unpacker.GetDouble("float_pandl");
            info.interval_realize_pandl = unpacker.GetDouble("interval_realize_pandl");
            info.interval_pandl = unpacker.GetDouble("interval_pandl");
            rptL_2_304_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_304_InfoList.Add((rptL_2_304_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_查询产品行业区间盈亏
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_2_304_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT);
                    info.end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.industry_std = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDUSTRY_STD_INT);
                    info.industry_classification = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDUSTRY_CLASSIFICATION_INT);
                    info.industry_id = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDUSTRY_ID_INT);
                    info.industry_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_INDUSTRY_CODE_STR);
                    info.indu_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_INDU_NAME_STR);
                    info.begin_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_QTY_FLOAT);
                    info.begin_cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_COST_AMT_FLOAT);
                    info.begin_posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_POSI_MARKET_VALUE_FLOAT);
                    info.begin_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_REALIZE_PANDL_FLOAT);
                    info.end_cur_qty = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_CUR_QTY_INT);
                    info.end_cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_END_COST_AMT_FLOAT);
                    info.end_posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_END_POSI_MARKET_VALUE_FLOAT);
                    info.end_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_END_REALIZE_PANDL_FLOAT);
                    info.float_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FLOAT_PANDL_FLOAT);
                    info.interval_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTERVAL_REALIZE_PANDL_FLOAT);
                    info.interval_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTERVAL_PANDL_FLOAT);
                    rptL_2_304_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_2_305_Response : IResponse
    {
        #region 构造函数
        public rptL_2_305_Response()
        {
            this.rptL_2_305_InfoList = new ObservableCollection<rptL_2_305_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_305_Info> rptL_2_305_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_305_Info info = new rptL_2_305_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_type = unpacker.GetInt("stock_type");
            info.asset_type = unpacker.GetInt("asset_type");
            info.order_price = unpacker.GetDouble("order_price");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.strike_price = unpacker.GetDouble("strike_price");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.buy_qty = unpacker.GetDouble("buy_qty");
            info.buy_amt = unpacker.GetDouble("buy_amt");
            info.buy_strike_price = unpacker.GetDouble("buy_strike_price");
            info.sell_qty = unpacker.GetDouble("sell_qty");
            info.sellout_amt = unpacker.GetDouble("sellout_amt");
            info.sell_strike_price = unpacker.GetDouble("sell_strike_price");
            info.diff_qty = unpacker.GetDouble("diff_qty");
            info.buy_begin_time = unpacker.GetInt("buy_begin_time");
            info.buy_end_time = unpacker.GetInt("buy_end_time");
            info.sell_begin_time = unpacker.GetInt("sell_begin_time");
            info.sell_end_time = unpacker.GetInt("sell_end_time");
            rptL_2_305_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_305_InfoList.Add((rptL_2_305_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_查询汇总机构证券买卖成交
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_2_305_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    info.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_PRICE_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    info.buy_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_QTY_FLOAT);
                    info.buy_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_AMT_FLOAT);
                    info.buy_strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_STRIKE_PRICE_FLOAT);
                    info.sell_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_QTY_FLOAT);
                    info.sellout_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELLOUT_AMT_FLOAT);
                    info.sell_strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_STRIKE_PRICE_FLOAT);
                    info.diff_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DIFF_QTY_FLOAT);
                    info.buy_begin_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUY_BEGIN_TIME_INT);
                    info.buy_end_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUY_END_TIME_INT);
                    info.sell_begin_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SELL_BEGIN_TIME_INT);
                    info.sell_end_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SELL_END_TIME_INT);
                    rptL_2_305_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_2_306_Response : IResponse
    {
        #region 构造函数
        public rptL_2_306_Response()
        {
            this.rptL_2_306_InfoList = new ObservableCollection<rptL_2_306_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_306_Info> rptL_2_306_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_306_Info info = new rptL_2_306_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_type = unpacker.GetInt("stock_type");
            info.asset_type = unpacker.GetInt("asset_type");
            info.order_price = unpacker.GetDouble("order_price");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.strike_price = unpacker.GetDouble("strike_price");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.buy_qty = unpacker.GetDouble("buy_qty");
            info.buy_amt = unpacker.GetDouble("buy_amt");
            info.buy_strike_price = unpacker.GetDouble("buy_strike_price");
            info.sell_qty = unpacker.GetDouble("sell_qty");
            info.sellout_amt = unpacker.GetDouble("sellout_amt");
            info.sell_strike_price = unpacker.GetDouble("sell_strike_price");
            info.diff_qty = unpacker.GetDouble("diff_qty");
            info.buy_begin_time = unpacker.GetInt("buy_begin_time");
            info.buy_end_time = unpacker.GetInt("buy_end_time");
            info.sell_begin_time = unpacker.GetInt("sell_begin_time");
            info.sell_end_time = unpacker.GetInt("sell_end_time");
            rptL_2_306_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_306_InfoList.Add((rptL_2_306_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_查询汇总产品证券买卖成交
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_2_306_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    info.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_PRICE_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    info.buy_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_QTY_FLOAT);
                    info.buy_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_AMT_FLOAT);
                    info.buy_strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_STRIKE_PRICE_FLOAT);
                    info.sell_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_QTY_FLOAT);
                    info.sellout_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELLOUT_AMT_FLOAT);
                    info.sell_strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_STRIKE_PRICE_FLOAT);
                    info.diff_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DIFF_QTY_FLOAT);
                    info.buy_begin_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUY_BEGIN_TIME_INT);
                    info.buy_end_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUY_END_TIME_INT);
                    info.sell_begin_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SELL_BEGIN_TIME_INT);
                    info.sell_end_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SELL_END_TIME_INT);
                    rptL_2_306_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_2_307_Response : IResponse
    {
        #region 构造函数
        public rptL_2_307_Response()
        {
            this.rptL_2_307_InfoList = new ObservableCollection<rptL_2_307_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_307_Info> rptL_2_307_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_307_Info info = new rptL_2_307_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.asset_acco = unpacker.GetStr("asset_acco");
            info.stock_acco = unpacker.GetStr("stock_acco");
            info.exch_no = unpacker.GetInt("exch_no");
            info.invest_type = unpacker.GetInt("invest_type");
            info.stock_type = unpacker.GetInt("stock_type");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.strike_aver_price = unpacker.GetDouble("strike_aver_price");
            info.order_dir = unpacker.GetInt("order_dir");
            info.order_price = unpacker.GetDouble("order_price");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.all_fee = unpacker.GetDouble("all_fee");
            info.stamp_tax = unpacker.GetDouble("stamp_tax");
            info.trans_fee = unpacker.GetDouble("trans_fee");
            info.brkage_fee = unpacker.GetDouble("brkage_fee");
            info.SEC_charges = unpacker.GetDouble("SEC_charges");
            info.other_fee = unpacker.GetDouble("other_fee");
            info.trade_commis = unpacker.GetDouble("trade_commis");
            info.other_commis = unpacker.GetDouble("other_commis");
            info.bond_accr_intrst = unpacker.GetDouble("bond_accr_intrst");
            info.net_price_flag = unpacker.GetInt("net_price_flag");
            info.bank_ib_member = unpacker.GetStr("bank_ib_member");
            info.last_price = unpacker.GetDouble("last_price");
            info.quot_strike_qty = unpacker.GetDouble("quot_strike_qty");
            info.quot_strike_amt = unpacker.GetDouble("quot_strike_amt");
            info.remark_info = unpacker.GetStr("remark_info");
            info.src_data_type = unpacker.GetInt("src_data_type");
            rptL_2_307_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_307_InfoList.Add((rptL_2_307_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_查询汇总产品证券成交
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_2_307_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.asset_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STR);
                    info.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.invest_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INVEST_TYPE_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.strike_aver_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AVER_PRICE_FLOAT);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    info.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                    info.stamp_tax = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STAMP_TAX_FLOAT);
                    info.trans_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_FEE_FLOAT);
                    info.brkage_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BRKAGE_FEE_FLOAT);
                    info.SEC_charges = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SEC_CHARGES_FLOAT);
                    info.other_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_FEE_FLOAT);
                    info.trade_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_COMMIS_FLOAT);
                    info.other_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_COMMIS_FLOAT);
                    info.bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT);
                    info.net_price_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLAG_INT);
                    info.bank_ib_member = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BANK_IB_MEMBER_STR);
                    info.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    info.quot_strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_QUOT_STRIKE_QTY_FLOAT);
                    info.quot_strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_QUOT_STRIKE_AMT_FLOAT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    info.src_data_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SRC_DATA_TYPE_INT);
                    rptL_2_307_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_2_308_Response : IResponse
    {
        #region 构造函数
        public rptL_2_308_Response()
        {
            this.rptL_2_308_InfoList = new ObservableCollection<rptL_2_308_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_308_Info> rptL_2_308_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_308_Info info = new rptL_2_308_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.begin_date = unpacker.GetInt("begin_date");
            info.end_date = unpacker.GetInt("end_date");
            info.stat_days = unpacker.GetInt("stat_days");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.asset_acco = unpacker.GetStr("asset_acco");
            info.stock_acco = unpacker.GetStr("stock_acco");
            info.exch_no = unpacker.GetInt("exch_no");
            info.invest_type = unpacker.GetInt("invest_type");
            info.stock_type = unpacker.GetInt("stock_type");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.order_dir = unpacker.GetInt("order_dir");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.all_fee = unpacker.GetDouble("all_fee");
            info.stamp_tax = unpacker.GetDouble("stamp_tax");
            info.trans_fee = unpacker.GetDouble("trans_fee");
            info.brkage_fee = unpacker.GetDouble("brkage_fee");
            info.SEC_charges = unpacker.GetDouble("SEC_charges");
            info.other_fee = unpacker.GetDouble("other_fee");
            info.trade_commis = unpacker.GetDouble("trade_commis");
            info.other_commis = unpacker.GetDouble("other_commis");
            info.bond_accr_intrst = unpacker.GetDouble("bond_accr_intrst");
            info.quot_strike_qty = unpacker.GetDouble("quot_strike_qty");
            info.quot_strike_amt = unpacker.GetDouble("quot_strike_amt");
            rptL_2_308_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_308_InfoList.Add((rptL_2_308_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_查询区间汇总产品证券成交
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_2_308_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT);
                    info.end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT);
                    info.stat_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STAT_DAYS_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.asset_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STR);
                    info.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.invest_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INVEST_TYPE_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    info.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                    info.stamp_tax = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STAMP_TAX_FLOAT);
                    info.trans_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_FEE_FLOAT);
                    info.brkage_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BRKAGE_FEE_FLOAT);
                    info.SEC_charges = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SEC_CHARGES_FLOAT);
                    info.other_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_FEE_FLOAT);
                    info.trade_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_COMMIS_FLOAT);
                    info.other_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_COMMIS_FLOAT);
                    info.bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT);
                    info.quot_strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_QUOT_STRIKE_QTY_FLOAT);
                    info.quot_strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_QUOT_STRIKE_AMT_FLOAT);
                    rptL_2_308_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_2_309_Response : IResponse
    {
        #region 构造函数
        public rptL_2_309_Response()
        {
            this.rptL_2_309_InfoList = new ObservableCollection<rptL_2_309_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_309_Info> rptL_2_309_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_309_Info info = new rptL_2_309_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.busi_flag = unpacker.GetInt("busi_flag");
            info.occur_amt = unpacker.GetDouble("occur_amt");
            rptL_2_309_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_309_InfoList.Add((rptL_2_309_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_查询汇总产品资金流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_2_309_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.busi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT);
                    info.occur_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_AMT_FLOAT);
                    rptL_2_309_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_2_310_Response : IResponse
    {
        #region 构造函数
        public rptL_2_310_Response()
        {
            this.rptL_2_310_InfoList = new ObservableCollection<rptL_2_310_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_310_Info> rptL_2_310_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_310_Info info = new rptL_2_310_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.begin_date = unpacker.GetInt("begin_date");
            info.end_date = unpacker.GetInt("end_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.busi_flag = unpacker.GetInt("busi_flag");
            info.occur_amt = unpacker.GetDouble("occur_amt");
            rptL_2_310_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_310_InfoList.Add((rptL_2_310_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_查询区间汇总产品资金流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_2_310_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT);
                    info.end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.busi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT);
                    info.occur_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_AMT_FLOAT);
                    rptL_2_310_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_2_311_Response : IResponse
    {
        #region 构造函数
        public rptL_2_311_Response()
        {
            this.rptL_2_311_InfoList = new ObservableCollection<rptL_2_311_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_311_Info> rptL_2_311_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_311_Info info = new rptL_2_311_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.curr_month = unpacker.GetInt("curr_month");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.begin_NAV = unpacker.GetDouble("begin_NAV");
            info.end_nav_asset = unpacker.GetDouble("end_nav_asset");
            info.avg_nav_asset = unpacker.GetDouble("avg_nav_asset");
            info.avg_total_asset = unpacker.GetDouble("avg_total_asset");
            info.avg_stock_asset = unpacker.GetDouble("avg_stock_asset");
            info.avg_futu_asset = unpacker.GetDouble("avg_futu_asset");
            info.avg_option_asset = unpacker.GetDouble("avg_option_asset");
            info.avg_warrant_asset = unpacker.GetDouble("avg_warrant_asset");
            info.avg_fund_asset = unpacker.GetDouble("avg_fund_asset");
            info.avg_cash_asset = unpacker.GetDouble("avg_cash_asset");
            info.avg_repo_asset = unpacker.GetDouble("avg_repo_asset");
            info.avg_bond_asset = unpacker.GetDouble("avg_bond_asset");
            info.avg_money_fund_asset = unpacker.GetDouble("avg_money_fund_asset");
            info.pd_begin_unit_nav = unpacker.GetDouble("pd_begin_unit_nav");
            info.end_unit_nav = unpacker.GetDouble("end_unit_nav");
            info.avg_pd_all_share = unpacker.GetDouble("avg_pd_all_share");
            info.buy_amt = unpacker.GetDouble("buy_amt");
            info.sellout_amt = unpacker.GetDouble("sellout_amt");
            info.begin_date = unpacker.GetInt("begin_date");
            info.end_date = unpacker.GetInt("end_date");
            info.stat_days = unpacker.GetInt("stat_days");
            info.month_apply_amt = unpacker.GetDouble("month_apply_amt");
            info.trade_deduct_amt = unpacker.GetDouble("trade_deduct_amt");
            info.remark_info = unpacker.GetStr("remark_info");
            rptL_2_311_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_311_InfoList.Add((rptL_2_311_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_查询月汇总产品持仓成交
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_2_311_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.curr_month = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONTH_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.begin_NAV = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_NAV_FLOAT);
                    info.end_nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_END_NAV_ASSET_FLOAT);
                    info.avg_nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVG_NAV_ASSET_FLOAT);
                    info.avg_total_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVG_TOTAL_ASSET_FLOAT);
                    info.avg_stock_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVG_STOCK_ASSET_FLOAT);
                    info.avg_futu_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVG_FUTU_ASSET_FLOAT);
                    info.avg_option_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVG_OPTION_ASSET_FLOAT);
                    info.avg_warrant_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVG_WARRANT_ASSET_FLOAT);
                    info.avg_fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVG_FUND_ASSET_FLOAT);
                    info.avg_cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVG_CASH_ASSET_FLOAT);
                    info.avg_repo_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVG_REPO_ASSET_FLOAT);
                    info.avg_bond_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVG_BOND_ASSET_FLOAT);
                    info.avg_money_fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVG_MONEY_FUND_ASSET_FLOAT);
                    info.pd_begin_unit_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_BEGIN_UNIT_NAV_FLOAT);
                    info.end_unit_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_END_UNIT_NAV_FLOAT);
                    info.avg_pd_all_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVG_PD_ALL_SHARE_FLOAT);
                    info.buy_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_AMT_FLOAT);
                    info.sellout_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELLOUT_AMT_FLOAT);
                    info.begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT);
                    info.end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT);
                    info.stat_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STAT_DAYS_INT);
                    info.month_apply_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MONTH_APPLY_AMT_FLOAT);
                    info.trade_deduct_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_DEDUCT_AMT_FLOAT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    rptL_2_311_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_2_312_Response : IResponse
    {
        #region 构造函数
        public rptL_2_312_Response()
        {
            this.rptL_2_312_InfoList = new ObservableCollection<rptL_2_312_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_312_Info> rptL_2_312_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_312_Info info = new rptL_2_312_Info();
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
            info.trade_code_no = unpacker.GetInt("trade_code_no");
            info.target_code_no = unpacker.GetInt("target_code_no");
            info.stock_type = unpacker.GetInt("stock_type");
            info.asset_type = unpacker.GetInt("asset_type");
            info.pre_entry_qty = unpacker.GetDouble("pre_entry_qty");
            info.pre_entry_amt = unpacker.GetDouble("pre_entry_amt");
            info.impawn_ratio = unpacker.GetDouble("impawn_ratio");
            info.bond_accr_intrst = unpacker.GetDouble("bond_accr_intrst");
            info.busi_flag = unpacker.GetInt("busi_flag");
            info.act_record_flag = unpacker.GetInt("act_record_flag");
            info.acco_entry_flag = unpacker.GetInt("acco_entry_flag");
            info.entry_money_jour_no = unpacker.GetInt64("entry_money_jour_no");
            info.entry_status = unpacker.GetStr("entry_status");
            info.reg_date = unpacker.GetInt("reg_date");
            info.arrive_date = unpacker.GetInt("arrive_date");
            info.begin_trade_date = unpacker.GetInt("begin_trade_date");
            info.remark_info = unpacker.GetStr("remark_info");
            info.src_data_type = unpacker.GetInt("src_data_type");
            rptL_2_312_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_312_InfoList.Add((rptL_2_312_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_查询结算提前待入账记录表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_2_312_Info();
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
                    info.trade_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_NO_INT);
                    info.target_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_NO_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    info.pre_entry_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ENTRY_QTY_FLOAT);
                    info.pre_entry_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ENTRY_AMT_FLOAT);
                    info.impawn_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_IMPAWN_RATIO_FLOAT);
                    info.bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT);
                    info.busi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT);
                    info.act_record_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ACT_RECORD_FLAG_INT);
                    info.acco_entry_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_ENTRY_FLAG_INT);
                    info.entry_money_jour_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_MONEY_JOUR_NO_INT64);
                    info.entry_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_STATUS_STR);
                    info.reg_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REG_DATE_INT);
                    info.arrive_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ARRIVE_DATE_INT);
                    info.begin_trade_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TRADE_DATE_INT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    info.src_data_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SRC_DATA_TYPE_INT);
                    rptL_2_312_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_2_313_Response : IResponse
    {
        #region 构造函数
        public rptL_2_313_Response()
        {
            this.rptL_2_313_InfoList = new ObservableCollection<rptL_2_313_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_313_Info> rptL_2_313_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_313_Info info = new rptL_2_313_Info();
            rptL_2_313_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_313_InfoList.Add((rptL_2_313_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_修改统计基金经理资产
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_313_Info();
                rptL_2_313_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_314_Response : IResponse
    {
        #region 构造函数
        public rptL_2_314_Response()
        {
            this.rptL_2_314_InfoList = new ObservableCollection<rptL_2_314_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_314_Info> rptL_2_314_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_314_Info info = new rptL_2_314_Info();
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.fund_manager_no = unpacker.GetInt("fund_manager_no");
            info.fund_manager_name = unpacker.GetStr("fund_manager_name");
            info.total_count = unpacker.GetInt("total_count");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.begin_NAV = unpacker.GetDouble("begin_NAV");
            info.nav_asset = unpacker.GetDouble("nav_asset");
            info.total_asset = unpacker.GetDouble("total_asset");
            info.stock_asset = unpacker.GetDouble("stock_asset");
            info.futu_asset = unpacker.GetDouble("futu_asset");
            info.option_asset = unpacker.GetDouble("option_asset");
            info.warrant_asset = unpacker.GetDouble("warrant_asset");
            info.fund_asset = unpacker.GetDouble("fund_asset");
            info.cash_asset = unpacker.GetDouble("cash_asset");
            info.repo_asset = unpacker.GetDouble("repo_asset");
            info.bond_asset = unpacker.GetDouble("bond_asset");
            info.other_asset = unpacker.GetDouble("other_asset");
            info.acco_cash = unpacker.GetDouble("acco_cash");
            info.total_cash_divide = unpacker.GetDouble("total_cash_divide");
            info.money_fund_asset = unpacker.GetDouble("money_fund_asset");
            info.unit_nav = unpacker.GetDouble("unit_nav");
            info.pd_all_share = unpacker.GetDouble("pd_all_share");
            info.curr_share = unpacker.GetDouble("curr_share");
            info.total_payab_amt = unpacker.GetDouble("total_payab_amt");
            info.total_rece_amt = unpacker.GetDouble("total_rece_amt");
            info.buy_amt = unpacker.GetDouble("buy_amt");
            info.sellout_amt = unpacker.GetDouble("sellout_amt");
            info.remark_info = unpacker.GetStr("remark_info");
            rptL_2_314_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_314_InfoList.Add((rptL_2_314_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_查询统计基金经理资产
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_2_314_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.fund_manager_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_NO_INT);
                    info.fund_manager_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_NAME_STR);
                    info.total_count = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_COUNT_INT);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.begin_NAV = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_NAV_FLOAT);
                    info.nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT);
                    info.total_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_ASSET_FLOAT);
                    info.stock_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_FLOAT);
                    info.futu_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ASSET_FLOAT);
                    info.option_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPTION_ASSET_FLOAT);
                    info.warrant_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WARRANT_ASSET_FLOAT);
                    info.fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_ASSET_FLOAT);
                    info.cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_ASSET_FLOAT);
                    info.repo_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPO_ASSET_FLOAT);
                    info.bond_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ASSET_FLOAT);
                    info.other_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_ASSET_FLOAT);
                    info.acco_cash = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_CASH_FLOAT);
                    info.total_cash_divide = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_CASH_DIVIDE_FLOAT);
                    info.money_fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MONEY_FUND_ASSET_FLOAT);
                    info.unit_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_NAV_FLOAT);
                    info.pd_all_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_ALL_SHARE_FLOAT);
                    info.curr_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_SHARE_FLOAT);
                    info.total_payab_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_PAYAB_AMT_FLOAT);
                    info.total_rece_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_RECE_AMT_FLOAT);
                    info.buy_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_AMT_FLOAT);
                    info.sellout_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELLOUT_AMT_FLOAT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    rptL_2_314_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_2_315_Response : IResponse
    {
        #region 构造函数
        public rptL_2_315_Response()
        {
            this.rptL_2_315_InfoList = new ObservableCollection<rptL_2_315_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_315_Info> rptL_2_315_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_315_Info info = new rptL_2_315_Info();
            rptL_2_315_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_315_InfoList.Add((rptL_2_315_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_修改统计基金经理持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_315_Info();
                rptL_2_315_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_316_Response : IResponse
    {
        #region 构造函数
        public rptL_2_316_Response()
        {
            this.rptL_2_316_InfoList = new ObservableCollection<rptL_2_316_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_316_Info> rptL_2_316_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_316_Info info = new rptL_2_316_Info();
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.fund_manager_no = unpacker.GetInt("fund_manager_no");
            info.fund_manager_name = unpacker.GetStr("fund_manager_name");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.total_count = unpacker.GetInt("total_count");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_name = unpacker.GetStr("stock_name");
            info.stock_type = unpacker.GetInt("stock_type");
            info.asset_type = unpacker.GetInt("asset_type");
            info.begin_qty = unpacker.GetDouble("begin_qty");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.frozen_qty = unpacker.GetDouble("frozen_qty");
            info.unfroz_qty = unpacker.GetDouble("unfroz_qty");
            info.total_stock_issue = unpacker.GetDouble("total_stock_issue");
            info.circl_stock_capit = unpacker.GetDouble("circl_stock_capit");
            info.cost_amt = unpacker.GetDouble("cost_amt");
            info.realize_pandl = unpacker.GetDouble("realize_pandl");
            info.intrst_cost_amt = unpacker.GetDouble("intrst_cost_amt");
            info.intrst_pandl = unpacker.GetDouble("intrst_pandl");
            info.last_price = unpacker.GetDouble("last_price");
            info.posi_market_value = unpacker.GetDouble("posi_market_value");
            info.buy_qty = unpacker.GetDouble("buy_qty");
            info.buy_amt = unpacker.GetDouble("buy_amt");
            info.sell_qty = unpacker.GetDouble("sell_qty");
            info.sellout_amt = unpacker.GetDouble("sellout_amt");
            info.quot_strike_qty = unpacker.GetDouble("quot_strike_qty");
            info.quot_strike_amt = unpacker.GetDouble("quot_strike_amt");
            info.remark_info = unpacker.GetStr("remark_info");
            rptL_2_316_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_316_InfoList.Add((rptL_2_316_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_查询统计基金经理持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_2_316_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.fund_manager_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_NO_INT);
                    info.fund_manager_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_NAME_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.total_count = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_COUNT_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    info.begin_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_QTY_FLOAT);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_QTY_FLOAT);
                    info.unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_QTY_FLOAT);
                    info.total_stock_issue = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_STOCK_ISSUE_FLOAT);
                    info.circl_stock_capit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CIRCL_STOCK_CAPIT_FLOAT);
                    info.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                    info.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    info.intrst_cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_COST_AMT_FLOAT);
                    info.intrst_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_PANDL_FLOAT);
                    info.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    info.posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_MARKET_VALUE_FLOAT);
                    info.buy_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_QTY_FLOAT);
                    info.buy_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_AMT_FLOAT);
                    info.sell_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_QTY_FLOAT);
                    info.sellout_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELLOUT_AMT_FLOAT);
                    info.quot_strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_QUOT_STRIKE_QTY_FLOAT);
                    info.quot_strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_QUOT_STRIKE_AMT_FLOAT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    rptL_2_316_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_2_401_Response : IResponse
    {
        #region 构造函数
        public rptL_2_401_Response()
        {
            this.rptL_2_401_InfoList = new ObservableCollection<rptL_2_401_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_401_Info> rptL_2_401_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_401_Info info = new rptL_2_401_Info();
            rptL_2_401_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_401_InfoList.Add((rptL_2_401_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_新增机构业绩报告配置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_401_Info();
                rptL_2_401_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_402_Response : IResponse
    {
        #region 构造函数
        public rptL_2_402_Response()
        {
            this.rptL_2_402_InfoList = new ObservableCollection<rptL_2_402_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_402_Info> rptL_2_402_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_402_Info info = new rptL_2_402_Info();
            rptL_2_402_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_402_InfoList.Add((rptL_2_402_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_删除机构业绩报告配置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_402_Info();
                rptL_2_402_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_403_Response : IResponse
    {
        #region 构造函数
        public rptL_2_403_Response()
        {
            this.rptL_2_403_InfoList = new ObservableCollection<rptL_2_403_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_403_Info> rptL_2_403_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_403_Info info = new rptL_2_403_Info();
            rptL_2_403_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_403_InfoList.Add((rptL_2_403_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_修改机构业绩报告配置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_403_Info();
                rptL_2_403_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_404_Response : IResponse
    {
        #region 构造函数
        public rptL_2_404_Response()
        {
            this.rptL_2_404_InfoList = new ObservableCollection<rptL_2_404_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_404_Info> rptL_2_404_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_404_Info info = new rptL_2_404_Info();
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.config_no = unpacker.GetInt64("config_no");
            info.config_name = unpacker.GetStr("config_name");
            info.show_order = unpacker.GetInt("show_order");
            info.remark_info = unpacker.GetStr("remark_info");
            rptL_2_404_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_404_InfoList.Add((rptL_2_404_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_查询机构业绩报告配置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_2_404_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.config_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_NO_INT64);
                    info.config_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_NAME_STR);
                    info.show_order = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SHOW_ORDER_INT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    rptL_2_404_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_2_406_Response : IResponse
    {
        #region 构造函数
        public rptL_2_406_Response()
        {
            this.rptL_2_406_InfoList = new ObservableCollection<rptL_2_406_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_406_Info> rptL_2_406_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_406_Info info = new rptL_2_406_Info();
            rptL_2_406_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_406_InfoList.Add((rptL_2_406_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_新增产品业绩报告附加信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_406_Info();
                rptL_2_406_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_407_Response : IResponse
    {
        #region 构造函数
        public rptL_2_407_Response()
        {
            this.rptL_2_407_InfoList = new ObservableCollection<rptL_2_407_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_407_Info> rptL_2_407_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_407_Info info = new rptL_2_407_Info();
            rptL_2_407_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_407_InfoList.Add((rptL_2_407_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_删除产品业绩报告附加信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_407_Info();
                rptL_2_407_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_408_Response : IResponse
    {
        #region 构造函数
        public rptL_2_408_Response()
        {
            this.rptL_2_408_InfoList = new ObservableCollection<rptL_2_408_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_408_Info> rptL_2_408_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_408_Info info = new rptL_2_408_Info();
            rptL_2_408_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_408_InfoList.Add((rptL_2_408_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_修改产品业绩报告附加信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_408_Info();
                rptL_2_408_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_409_Response : IResponse
    {
        #region 构造函数
        public rptL_2_409_Response()
        {
            this.rptL_2_409_InfoList = new ObservableCollection<rptL_2_409_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_409_Info> rptL_2_409_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_409_Info info = new rptL_2_409_Info();
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.rpt_add_info = unpacker.GetStr("rpt_add_info");
            rptL_2_409_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_409_InfoList.Add((rptL_2_409_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_查询产品业绩报告附加信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_2_409_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.rpt_add_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RPT_ADD_INFO_STR);
                    rptL_2_409_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_2_411_Response : IResponse
    {
        #region 构造函数
        public rptL_2_411_Response()
        {
            this.rptL_2_411_InfoList = new ObservableCollection<rptL_2_411_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_411_Info> rptL_2_411_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_411_Info info = new rptL_2_411_Info();
            rptL_2_411_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_411_InfoList.Add((rptL_2_411_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_新增基金经理信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_411_Info();
                rptL_2_411_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_412_Response : IResponse
    {
        #region 构造函数
        public rptL_2_412_Response()
        {
            this.rptL_2_412_InfoList = new ObservableCollection<rptL_2_412_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_412_Info> rptL_2_412_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_412_Info info = new rptL_2_412_Info();
            rptL_2_412_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_412_InfoList.Add((rptL_2_412_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_删除基金经理信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_412_Info();
                rptL_2_412_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_413_Response : IResponse
    {
        #region 构造函数
        public rptL_2_413_Response()
        {
            this.rptL_2_413_InfoList = new ObservableCollection<rptL_2_413_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_413_Info> rptL_2_413_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_413_Info info = new rptL_2_413_Info();
            rptL_2_413_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_413_InfoList.Add((rptL_2_413_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_修改基金经理信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_413_Info();
                rptL_2_413_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_414_Response : IResponse
    {
        #region 构造函数
        public rptL_2_414_Response()
        {
            this.rptL_2_414_InfoList = new ObservableCollection<rptL_2_414_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_414_Info> rptL_2_414_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_414_Info info = new rptL_2_414_Info();
            info.co_no = unpacker.GetInt("co_no");
            info.fund_manager_no = unpacker.GetInt("fund_manager_no");
            info.fund_manager_name = unpacker.GetStr("fund_manager_name");
            info.opor_no = unpacker.GetInt("opor_no");
            info.remark_info = unpacker.GetStr("remark_info");
            rptL_2_414_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_414_InfoList.Add((rptL_2_414_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_查询基金经理信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_2_414_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.fund_manager_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_NO_INT);
                    info.fund_manager_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_NAME_STR);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    rptL_2_414_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_2_416_Response : IResponse
    {
        #region 构造函数
        public rptL_2_416_Response()
        {
            this.rptL_2_416_InfoList = new ObservableCollection<rptL_2_416_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_416_Info> rptL_2_416_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_416_Info info = new rptL_2_416_Info();
            rptL_2_416_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_416_InfoList.Add((rptL_2_416_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_新增交易员信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_416_Info();
                rptL_2_416_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_417_Response : IResponse
    {
        #region 构造函数
        public rptL_2_417_Response()
        {
            this.rptL_2_417_InfoList = new ObservableCollection<rptL_2_417_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_417_Info> rptL_2_417_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_417_Info info = new rptL_2_417_Info();
            rptL_2_417_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_417_InfoList.Add((rptL_2_417_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_删除交易员信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_417_Info();
                rptL_2_417_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_418_Response : IResponse
    {
        #region 构造函数
        public rptL_2_418_Response()
        {
            this.rptL_2_418_InfoList = new ObservableCollection<rptL_2_418_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_418_Info> rptL_2_418_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_418_Info info = new rptL_2_418_Info();
            rptL_2_418_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_418_InfoList.Add((rptL_2_418_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_修改交易员信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_418_Info();
                rptL_2_418_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_419_Response : IResponse
    {
        #region 构造函数
        public rptL_2_419_Response()
        {
            this.rptL_2_419_InfoList = new ObservableCollection<rptL_2_419_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_419_Info> rptL_2_419_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_419_Info info = new rptL_2_419_Info();
            info.co_no = unpacker.GetInt("co_no");
            info.fund_manager_no = unpacker.GetInt("fund_manager_no");
            info.fund_manager_name = unpacker.GetStr("fund_manager_name");
            info.opor_no = unpacker.GetInt("opor_no");
            info.remark_info = unpacker.GetStr("remark_info");
            rptL_2_419_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_419_InfoList.Add((rptL_2_419_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_查询交易员信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_2_419_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.fund_manager_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_NO_INT);
                    info.fund_manager_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_NAME_STR);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    rptL_2_419_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_2_421_Response : IResponse
    {
        #region 构造函数
        public rptL_2_421_Response()
        {
            this.rptL_2_421_InfoList = new ObservableCollection<rptL_2_421_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_421_Info> rptL_2_421_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_421_Info info = new rptL_2_421_Info();
            rptL_2_421_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_421_InfoList.Add((rptL_2_421_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_新增产品基金经理与交易员
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_421_Info();
                rptL_2_421_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_422_Response : IResponse
    {
        #region 构造函数
        public rptL_2_422_Response()
        {
            this.rptL_2_422_InfoList = new ObservableCollection<rptL_2_422_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_422_Info> rptL_2_422_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_422_Info info = new rptL_2_422_Info();
            rptL_2_422_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_422_InfoList.Add((rptL_2_422_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_删除产品基金经理与交易员
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_422_Info();
                rptL_2_422_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_423_Response : IResponse
    {
        #region 构造函数
        public rptL_2_423_Response()
        {
            this.rptL_2_423_InfoList = new ObservableCollection<rptL_2_423_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_423_Info> rptL_2_423_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_423_Info info = new rptL_2_423_Info();
            rptL_2_423_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_423_InfoList.Add((rptL_2_423_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_修改产品基金经理与交易员
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_423_Info();
                rptL_2_423_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_424_Response : IResponse
    {
        #region 构造函数
        public rptL_2_424_Response()
        {
            this.rptL_2_424_InfoList = new ObservableCollection<rptL_2_424_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_424_Info> rptL_2_424_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_424_Info info = new rptL_2_424_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.fund_manager_no = unpacker.GetInt("fund_manager_no");
            info.fund_manager_name = unpacker.GetStr("fund_manager_name");
            info.opor_no = unpacker.GetInt("opor_no");
            info.remark_info = unpacker.GetStr("remark_info");
            rptL_2_424_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_424_InfoList.Add((rptL_2_424_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_查询产品基金经理与交易员
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_2_424_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.fund_manager_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_NO_INT);
                    info.fund_manager_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_NAME_STR);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    rptL_2_424_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_2_425_Response : IResponse
    {
        #region 构造函数
        public rptL_2_425_Response()
        {
            this.rptL_2_425_InfoList = new ObservableCollection<rptL_2_425_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_425_Info> rptL_2_425_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_425_Info info = new rptL_2_425_Info();
            rptL_2_425_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_425_InfoList.Add((rptL_2_425_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_新增产品持仓导入外部交割流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_425_Info();
                rptL_2_425_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_426_Response : IResponse
    {
        #region 构造函数
        public rptL_2_426_Response()
        {
            this.rptL_2_426_InfoList = new ObservableCollection<rptL_2_426_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_426_Info> rptL_2_426_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_426_Info info = new rptL_2_426_Info();
            rptL_2_426_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_426_InfoList.Add((rptL_2_426_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_删除产品持仓导入外部交割流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_426_Info();
                rptL_2_426_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_428_Response : IResponse
    {
        #region 构造函数
        public rptL_2_428_Response()
        {
            this.rptL_2_428_InfoList = new ObservableCollection<rptL_2_428_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_428_Info> rptL_2_428_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_428_Info info = new rptL_2_428_Info();
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.pass_deli_jour_no = unpacker.GetInt64("pass_deli_jour_no");
            info.strike_date = unpacker.GetInt("strike_date");
            info.strike_time = unpacker.GetInt("strike_time");
            info.strike_no = unpacker.GetStr("strike_no");
            info.report_date = unpacker.GetInt("report_date");
            info.report_time = unpacker.GetInt("report_time");
            info.report_no = unpacker.GetStr("report_no");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco = unpacker.GetStr("stock_acco");
            info.stock_code = unpacker.GetStr("stock_code");
            info.order_dir = unpacker.GetInt("order_dir");
            info.order_price = unpacker.GetDouble("order_price");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.strike_price = unpacker.GetDouble("strike_price");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.strike_num = unpacker.GetInt("strike_num");
            info.entry_end_qty = unpacker.GetDouble("entry_end_qty");
            info.entry_end_amt = unpacker.GetDouble("entry_end_amt");
            info.out_all_fee = unpacker.GetDouble("out_all_fee");
            info.out_stamp_tax = unpacker.GetDouble("out_stamp_tax");
            info.out_trans_fee = unpacker.GetDouble("out_trans_fee");
            info.out_brkage = unpacker.GetDouble("out_brkage");
            info.out_SEC_charges = unpacker.GetDouble("out_SEC_charges");
            info.out_other_fee = unpacker.GetDouble("out_other_fee");
            info.out_brkage_commis = unpacker.GetDouble("out_brkage_commis");
            info.out_chann_commis = unpacker.GetDouble("out_chann_commis");
            info.out_divi_commis = unpacker.GetDouble("out_divi_commis");
            info.out_other_commis = unpacker.GetDouble("out_other_commis");
            info.busi_flag = unpacker.GetInt("busi_flag");
            info.remark_info = unpacker.GetStr("remark_info");
            rptL_2_428_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_428_InfoList.Add((rptL_2_428_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_查询产品持仓导入外部交割流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_2_428_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    info.pass_deli_jour_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_PASS_DELI_JOUR_NO_INT64);
                    info.strike_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT);
                    info.strike_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_TIME_INT);
                    info.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                    info.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                    info.report_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_TIME_INT);
                    info.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    info.strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_PRICE_FLOAT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    info.strike_num = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NUM_INT);
                    info.entry_end_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_END_QTY_FLOAT);
                    info.entry_end_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_END_AMT_FLOAT);
                    info.out_all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ALL_FEE_FLOAT);
                    info.out_stamp_tax = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_STAMP_TAX_FLOAT);
                    info.out_trans_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_TRANS_FEE_FLOAT);
                    info.out_brkage = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_BRKAGE_FLOAT);
                    info.out_SEC_charges = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_SEC_CHARGES_FLOAT);
                    info.out_other_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_OTHER_FEE_FLOAT);
                    info.out_brkage_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_BRKAGE_COMMIS_FLOAT);
                    info.out_chann_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_CHANN_COMMIS_FLOAT);
                    info.out_divi_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_DIVI_COMMIS_FLOAT);
                    info.out_other_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_OTHER_COMMIS_FLOAT);
                    info.busi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    rptL_2_428_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_2_429_Response : IResponse
    {
        #region 构造函数
        public rptL_2_429_Response()
        {
            this.rptL_2_429_InfoList = new ObservableCollection<rptL_2_429_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_429_Info> rptL_2_429_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_429_Info info = new rptL_2_429_Info();
            rptL_2_429_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_429_InfoList.Add((rptL_2_429_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_处理产品持仓导入外部交割流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_429_Info();
                rptL_2_429_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_431_Response : IResponse
    {
        #region 构造函数
        public rptL_2_431_Response()
        {
            this.rptL_2_431_InfoList = new ObservableCollection<rptL_2_431_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_431_Info> rptL_2_431_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_431_Info info = new rptL_2_431_Info();
            rptL_2_431_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_431_InfoList.Add((rptL_2_431_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_修改月汇总产品持仓成交
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_431_Info();
                rptL_2_431_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_436_Response : IResponse
    {
        #region 构造函数
        public rptL_2_436_Response()
        {
            this.rptL_2_436_InfoList = new ObservableCollection<rptL_2_436_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_436_Info> rptL_2_436_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_436_Info info = new rptL_2_436_Info();
            rptL_2_436_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_436_InfoList.Add((rptL_2_436_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_新增汇总产品证券成交
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_436_Info();
                rptL_2_436_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_437_Response : IResponse
    {
        #region 构造函数
        public rptL_2_437_Response()
        {
            this.rptL_2_437_InfoList = new ObservableCollection<rptL_2_437_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_437_Info> rptL_2_437_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_437_Info info = new rptL_2_437_Info();
            rptL_2_437_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_437_InfoList.Add((rptL_2_437_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_删除汇总产品证券成交
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_437_Info();
                rptL_2_437_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_438_Response : IResponse
    {
        #region 构造函数
        public rptL_2_438_Response()
        {
            this.rptL_2_438_InfoList = new ObservableCollection<rptL_2_438_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_438_Info> rptL_2_438_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_438_Info info = new rptL_2_438_Info();
            rptL_2_438_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_438_InfoList.Add((rptL_2_438_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_修改汇总产品证券成交
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_438_Info();
                rptL_2_438_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_441_Response : IResponse
    {
        #region 构造函数
        public rptL_2_441_Response()
        {
            this.rptL_2_441_InfoList = new ObservableCollection<rptL_2_441_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_441_Info> rptL_2_441_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_441_Info info = new rptL_2_441_Info();
            rptL_2_441_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_441_InfoList.Add((rptL_2_441_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_新增结算提前待入账记录表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_441_Info();
                rptL_2_441_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_442_Response : IResponse
    {
        #region 构造函数
        public rptL_2_442_Response()
        {
            this.rptL_2_442_InfoList = new ObservableCollection<rptL_2_442_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_442_Info> rptL_2_442_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_442_Info info = new rptL_2_442_Info();
            rptL_2_442_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_442_InfoList.Add((rptL_2_442_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_删除结算提前待入账记录表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_442_Info();
                rptL_2_442_InfoList.Add(info);
            }
        }
    }

    public class rptL_2_443_Response : IResponse
    {
        #region 构造函数
        public rptL_2_443_Response()
        {
            this.rptL_2_443_InfoList = new ObservableCollection<rptL_2_443_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_2_443_Info> rptL_2_443_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_2_443_Info info = new rptL_2_443_Info();
            rptL_2_443_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_2_443_InfoList.Add((rptL_2_443_Info)info);
        }
        #endregion

        //逻辑_报表_报表数据_修改结算提前待入账记录表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_2_443_Info();
                rptL_2_443_InfoList.Add(info);
            }
        }
    }

}
