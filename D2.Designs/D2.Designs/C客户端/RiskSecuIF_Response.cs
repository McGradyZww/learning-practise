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
    public class rksecuL_5_16_Response : IResponse
    {
        #region 构造函数
        public rksecuL_5_16_Response()
        {
            this.rksecuL_5_16_InfoList = new ObservableCollection<rksecuL_5_16_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_5_16_Info> rksecuL_5_16_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_5_16_Info info = new rksecuL_5_16_Info();
            rksecuL_5_16_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_5_16_InfoList.Add((rksecuL_5_16_Info)info);
        }
        #endregion

        //逻辑_风控证券_接口_计算更新证券风险监控数据
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rksecuL_5_16_Info();
                rksecuL_5_16_InfoList.Add(info);
            }
        }
    }

    public class rksecuL_5_17_Response : IResponse
    {
        #region 构造函数
        public rksecuL_5_17_Response()
        {
            this.rksecuL_5_17_InfoList = new ObservableCollection<rksecuL_5_17_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_5_17_Info> rksecuL_5_17_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_5_17_Info info = new rksecuL_5_17_Info();
            rksecuL_5_17_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_5_17_InfoList.Add((rksecuL_5_17_Info)info);
        }
        #endregion

        //逻辑_风控证券_接口_计算更新账户风险监控数据
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rksecuL_5_17_Info();
                rksecuL_5_17_InfoList.Add(info);
            }
        }
    }

    public class rksecuL_5_18_Response : IResponse
    {
        #region 构造函数
        public rksecuL_5_18_Response()
        {
            this.rksecuL_5_18_InfoList = new ObservableCollection<rksecuL_5_18_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_5_18_Info> rksecuL_5_18_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_5_18_Info info = new rksecuL_5_18_Info();
            rksecuL_5_18_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_5_18_InfoList.Add((rksecuL_5_18_Info)info);
        }
        #endregion

        //逻辑_风控证券_接口_计算t0操作员阀值
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rksecuL_5_18_Info();
                rksecuL_5_18_InfoList.Add(info);
            }
        }
    }

    public class rksecuL_5_19_Response : IResponse
    {
        #region 构造函数
        public rksecuL_5_19_Response()
        {
            this.rksecuL_5_19_InfoList = new ObservableCollection<rksecuL_5_19_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_5_19_Info> rksecuL_5_19_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_5_19_Info info = new rksecuL_5_19_Info();
            rksecuL_5_19_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_5_19_InfoList.Add((rksecuL_5_19_Info)info);
        }
        #endregion

        //逻辑_风控证券_接口_计算t0操作员汇总阀值
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rksecuL_5_19_Info();
                rksecuL_5_19_InfoList.Add(info);
            }
        }
    }

    public class rksecuL_5_20_Response : IResponse
    {
        #region 构造函数
        public rksecuL_5_20_Response()
        {
            this.rksecuL_5_20_InfoList = new ObservableCollection<rksecuL_5_20_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_5_20_Info> rksecuL_5_20_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_5_20_Info info = new rksecuL_5_20_Info();
            rksecuL_5_20_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_5_20_InfoList.Add((rksecuL_5_20_Info)info);
        }
        #endregion

        //逻辑_风控证券_接口_计算更新操作员风险监控数据
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rksecuL_5_20_Info();
                rksecuL_5_20_InfoList.Add(info);
            }
        }
    }

    public class rksecuL_5_21_Response : IResponse
    {
        #region 构造函数
        public rksecuL_5_21_Response()
        {
            this.rksecuL_5_21_InfoList = new ObservableCollection<rksecuL_5_21_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_5_21_Info> rksecuL_5_21_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_5_21_Info info = new rksecuL_5_21_Info();
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.total_cash_asset = unpacker.GetDouble("total_cash_asset");
            info.stock_cash_asset = unpacker.GetDouble("stock_cash_asset");
            info.futu_cash_asset = unpacker.GetDouble("futu_cash_asset");
            info.stock_asset = unpacker.GetDouble("stock_asset");
            info.fund_asset = unpacker.GetDouble("fund_asset");
            info.money_fund_asset = unpacker.GetDouble("money_fund_asset");
            info.not_money_fund_asset = unpacker.GetDouble("not_money_fund_asset");
            info.bond_asset = unpacker.GetDouble("bond_asset");
            info.futu_asset = unpacker.GetDouble("futu_asset");
            info.repo_asset = unpacker.GetDouble("repo_asset");
            info.hk_thrgh_stock_asset = unpacker.GetDouble("hk_thrgh_stock_asset");
            info.futu_long_market_value = unpacker.GetDouble("futu_long_market_value");
            info.futu_short_market_value = unpacker.GetDouble("futu_short_market_value");
            rksecuL_5_21_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_5_21_InfoList.Add((rksecuL_5_21_Info)info);
        }
        #endregion

        //逻辑_风控证券_接口_查询风控服务器资产账户资产
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rksecuL_5_21_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.total_cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_CASH_ASSET_FLOAT);
                    info.stock_cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CASH_ASSET_FLOAT);
                    info.futu_cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_CASH_ASSET_FLOAT);
                    info.stock_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_FLOAT);
                    info.fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_ASSET_FLOAT);
                    info.money_fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MONEY_FUND_ASSET_FLOAT);
                    info.not_money_fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NOT_MONEY_FUND_ASSET_FLOAT);
                    info.bond_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ASSET_FLOAT);
                    info.futu_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ASSET_FLOAT);
                    info.repo_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPO_ASSET_FLOAT);
                    info.hk_thrgh_stock_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HK_THRGH_STOCK_ASSET_FLOAT);
                    info.futu_long_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_LONG_MARKET_VALUE_FLOAT);
                    info.futu_short_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_SHORT_MARKET_VALUE_FLOAT);
                    rksecuL_5_21_InfoList.Add(info);
                }
            }
        }
    }

    public class rksecuL_5_22_Response : IResponse
    {
        #region 构造函数
        public rksecuL_5_22_Response()
        {
            this.rksecuL_5_22_InfoList = new ObservableCollection<rksecuL_5_22_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_5_22_Info> rksecuL_5_22_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_5_22_Info info = new rksecuL_5_22_Info();
            info.compli_trig_id = unpacker.GetInt64("compli_trig_id");
            rksecuL_5_22_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_5_22_InfoList.Add((rksecuL_5_22_Info)info);
        }
        #endregion

        //逻辑_风控证券_接口_单条检查客户风险
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rksecuL_5_22_Info();
                info.compli_trig_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_TRIG_ID_INT64);
                rksecuL_5_22_InfoList.Add(info);
            }
        }
    }

}
