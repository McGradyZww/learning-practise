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
    public class evaL_2_1_Response : IResponse
    {
        #region 构造函数
        public evaL_2_1_Response()
        {
            this.evaL_2_1_InfoList = new ObservableCollection<evaL_2_1_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_2_1_Info> evaL_2_1_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_2_1_Info info = new evaL_2_1_Info();
            evaL_2_1_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_2_1_InfoList.Add((evaL_2_1_Info)info);
        }
        #endregion

        //逻辑_平台估值_业务数据_同步估值产品证券资产
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_2_1_Info();
                evaL_2_1_InfoList.Add(info);
            }
        }
    }

    public class evaL_2_11_Response : IResponse
    {
        #region 构造函数
        public evaL_2_11_Response()
        {
            this.evaL_2_11_InfoList = new ObservableCollection<evaL_2_11_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_2_11_Info> evaL_2_11_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_2_11_Info info = new evaL_2_11_Info();
            evaL_2_11_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_2_11_InfoList.Add((evaL_2_11_Info)info);
        }
        #endregion

        //逻辑_平台估值_业务数据_新增估值产品证券持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_2_11_Info();
                evaL_2_11_InfoList.Add(info);
            }
        }
    }

    public class evaL_2_12_Response : IResponse
    {
        #region 构造函数
        public evaL_2_12_Response()
        {
            this.evaL_2_12_InfoList = new ObservableCollection<evaL_2_12_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_2_12_Info> evaL_2_12_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_2_12_Info info = new evaL_2_12_Info();
            evaL_2_12_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_2_12_InfoList.Add((evaL_2_12_Info)info);
        }
        #endregion

        //逻辑_平台估值_业务数据_修改估值产品证券持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_2_12_Info();
                evaL_2_12_InfoList.Add(info);
            }
        }
    }

    public class evaL_2_13_Response : IResponse
    {
        #region 构造函数
        public evaL_2_13_Response()
        {
            this.evaL_2_13_InfoList = new ObservableCollection<evaL_2_13_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_2_13_Info> evaL_2_13_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_2_13_Info info = new evaL_2_13_Info();
            evaL_2_13_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_2_13_InfoList.Add((evaL_2_13_Info)info);
        }
        #endregion

        //逻辑_平台估值_业务数据_删除估值产品证券持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_2_13_Info();
                evaL_2_13_InfoList.Add(info);
            }
        }
    }

    public class evaL_2_14_Response : IResponse
    {
        #region 构造函数
        public evaL_2_14_Response()
        {
            this.evaL_2_14_InfoList = new ObservableCollection<evaL_2_14_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_2_14_Info> evaL_2_14_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_2_14_Info info = new evaL_2_14_Info();
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.asset_acco = unpacker.GetStr("asset_acco");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco = unpacker.GetStr("stock_acco");
            info.stock_type = unpacker.GetInt("stock_type");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_name = unpacker.GetStr("stock_name");
            info.invest_type = unpacker.GetInt("invest_type");
            info.begin_qty = unpacker.GetDouble("begin_qty");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.frozen_qty = unpacker.GetDouble("frozen_qty");
            info.unfroz_qty = unpacker.GetDouble("unfroz_qty");
            info.curr_cost_amt = unpacker.GetDouble("curr_cost_amt");
            info.last_price = unpacker.GetDouble("last_price");
            info.exch_rate = unpacker.GetDouble("exch_rate");
            info.realize_pandl = unpacker.GetDouble("realize_pandl");
            info.intrst_cost_amt = unpacker.GetDouble("intrst_cost_amt");
            info.intrst_pandl = unpacker.GetDouble("intrst_pandl");
            info.evalu_data_source = unpacker.GetInt("evalu_data_source");
            evaL_2_14_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_2_14_InfoList.Add((evaL_2_14_Info)info);
        }
        #endregion

        //逻辑_平台估值_业务数据_查询估值产品证券持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new evaL_2_14_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.asset_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    info.invest_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INVEST_TYPE_INT);
                    info.begin_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_QTY_FLOAT);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_QTY_FLOAT);
                    info.unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_QTY_FLOAT);
                    info.curr_cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_COST_AMT_FLOAT);
                    info.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    info.exch_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_RATE_FLOAT);
                    info.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    info.intrst_cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_COST_AMT_FLOAT);
                    info.intrst_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_PANDL_FLOAT);
                    info.evalu_data_source = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EVALU_DATA_SOURCE_INT);
                    evaL_2_14_InfoList.Add(info);
                }
            }
        }
    }

    public class evaL_2_15_Response : IResponse
    {
        #region 构造函数
        public evaL_2_15_Response()
        {
            this.evaL_2_15_InfoList = new ObservableCollection<evaL_2_15_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_2_15_Info> evaL_2_15_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_2_15_Info info = new evaL_2_15_Info();
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.asset_acco = unpacker.GetStr("asset_acco");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco = unpacker.GetStr("stock_acco");
            info.stock_type = unpacker.GetInt("stock_type");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_name = unpacker.GetStr("stock_name");
            info.invest_type = unpacker.GetInt("invest_type");
            info.begin_qty = unpacker.GetDouble("begin_qty");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.frozen_qty = unpacker.GetDouble("frozen_qty");
            info.unfroz_qty = unpacker.GetDouble("unfroz_qty");
            info.curr_cost_amt = unpacker.GetDouble("curr_cost_amt");
            info.last_price = unpacker.GetDouble("last_price");
            info.exch_rate = unpacker.GetDouble("exch_rate");
            info.realize_pandl = unpacker.GetDouble("realize_pandl");
            info.intrst_cost_amt = unpacker.GetDouble("intrst_cost_amt");
            info.intrst_pandl = unpacker.GetDouble("intrst_pandl");
            evaL_2_15_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_2_15_InfoList.Add((evaL_2_15_Info)info);
        }
        #endregion

        //逻辑_平台估值_业务数据_查询估值产品交易组证券持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new evaL_2_15_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.asset_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STR);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    info.invest_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INVEST_TYPE_INT);
                    info.begin_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_QTY_FLOAT);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_QTY_FLOAT);
                    info.unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_QTY_FLOAT);
                    info.curr_cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_COST_AMT_FLOAT);
                    info.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    info.exch_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_RATE_FLOAT);
                    info.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    info.intrst_cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_COST_AMT_FLOAT);
                    info.intrst_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_PANDL_FLOAT);
                    evaL_2_15_InfoList.Add(info);
                }
            }
        }
    }

    public class evaL_2_16_Response : IResponse
    {
        #region 构造函数
        public evaL_2_16_Response()
        {
            this.evaL_2_16_InfoList = new ObservableCollection<evaL_2_16_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_2_16_Info> evaL_2_16_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_2_16_Info info = new evaL_2_16_Info();
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.futu_acco_no = unpacker.GetInt("futu_acco_no");
            info.contrc_code_no = unpacker.GetInt("contrc_code_no");
            info.contrc_type = unpacker.GetInt("contrc_type");
            info.lngsht_type = unpacker.GetInt("lngsht_type");
            info.hedge_type = unpacker.GetInt("hedge_type");
            info.comb_code = unpacker.GetStr("comb_code");
            info.contrc_unit = unpacker.GetInt("contrc_unit");
            info.begin_qty = unpacker.GetDouble("begin_qty");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.frozen_qty = unpacker.GetDouble("frozen_qty");
            info.unfroz_qty = unpacker.GetDouble("unfroz_qty");
            info.pre_settle_price = unpacker.GetDouble("pre_settle_price");
            info.sett_price = unpacker.GetDouble("sett_price");
            info.rece_margin = unpacker.GetDouble("rece_margin");
            info.open_amount = unpacker.GetDouble("open_amount");
            info.realize_pandl = unpacker.GetDouble("realize_pandl");
            info.close_pandl = unpacker.GetDouble("close_pandl");
            info.today_posi_flag = unpacker.GetInt("today_posi_flag");
            info.evalu_data_source = unpacker.GetInt("evalu_data_source");
            evaL_2_16_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_2_16_InfoList.Add((evaL_2_16_Info)info);
        }
        #endregion

        //逻辑_平台估值_业务数据_查询估值产品期货持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new evaL_2_16_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.futu_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT);
                    info.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    info.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    info.lngsht_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT);
                    info.hedge_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT);
                    info.comb_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMB_CODE_STR);
                    info.contrc_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_UNIT_INT);
                    info.begin_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_QTY_FLOAT);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_QTY_FLOAT);
                    info.unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_QTY_FLOAT);
                    info.pre_settle_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SETTLE_PRICE_FLOAT);
                    info.sett_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SETT_PRICE_FLOAT);
                    info.rece_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RECE_MARGIN_FLOAT);
                    info.open_amount = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_AMOUNT_FLOAT);
                    info.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    info.close_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_PANDL_FLOAT);
                    info.today_posi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_POSI_FLAG_INT);
                    info.evalu_data_source = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EVALU_DATA_SOURCE_INT);
                    evaL_2_16_InfoList.Add(info);
                }
            }
        }
    }

    public class evaL_2_21_Response : IResponse
    {
        #region 构造函数
        public evaL_2_21_Response()
        {
            this.evaL_2_21_InfoList = new ObservableCollection<evaL_2_21_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_2_21_Info> evaL_2_21_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_2_21_Info info = new evaL_2_21_Info();
            evaL_2_21_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_2_21_InfoList.Add((evaL_2_21_Info)info);
        }
        #endregion

        //逻辑_平台估值_业务数据_新增估值产品账户资金
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_2_21_Info();
                evaL_2_21_InfoList.Add(info);
            }
        }
    }

    public class evaL_2_22_Response : IResponse
    {
        #region 构造函数
        public evaL_2_22_Response()
        {
            this.evaL_2_22_InfoList = new ObservableCollection<evaL_2_22_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_2_22_Info> evaL_2_22_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_2_22_Info info = new evaL_2_22_Info();
            evaL_2_22_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_2_22_InfoList.Add((evaL_2_22_Info)info);
        }
        #endregion

        //逻辑_平台估值_业务数据_修改估值产品账户资金
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_2_22_Info();
                evaL_2_22_InfoList.Add(info);
            }
        }
    }

    public class evaL_2_23_Response : IResponse
    {
        #region 构造函数
        public evaL_2_23_Response()
        {
            this.evaL_2_23_InfoList = new ObservableCollection<evaL_2_23_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_2_23_Info> evaL_2_23_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_2_23_Info info = new evaL_2_23_Info();
            evaL_2_23_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_2_23_InfoList.Add((evaL_2_23_Info)info);
        }
        #endregion

        //逻辑_平台估值_业务数据_删除估值产品账户资金
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_2_23_Info();
                evaL_2_23_InfoList.Add(info);
            }
        }
    }

    public class evaL_2_24_Response : IResponse
    {
        #region 构造函数
        public evaL_2_24_Response()
        {
            this.evaL_2_24_InfoList = new ObservableCollection<evaL_2_24_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_2_24_Info> evaL_2_24_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_2_24_Info info = new evaL_2_24_Info();
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.pd_acco_type = unpacker.GetInt("pd_acco_type");
            info.asset_acco = unpacker.GetStr("asset_acco");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.begin_amt = unpacker.GetDouble("begin_amt");
            info.curr_amt = unpacker.GetDouble("curr_amt");
            info.frozen_amt = unpacker.GetDouble("frozen_amt");
            info.unfroz_amt = unpacker.GetDouble("unfroz_amt");
            info.intrst_base_amt = unpacker.GetDouble("intrst_base_amt");
            info.intrst_cacl_amt = unpacker.GetDouble("intrst_cacl_amt");
            info.evalu_data_source = unpacker.GetInt("evalu_data_source");
            evaL_2_24_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_2_24_InfoList.Add((evaL_2_24_Info)info);
        }
        #endregion

        //逻辑_平台估值_业务数据_查询估值产品账户资金
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new evaL_2_24_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.pd_acco_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_ACCO_TYPE_INT);
                    info.asset_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STR);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.begin_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_AMT_FLOAT);
                    info.curr_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_AMT_FLOAT);
                    info.frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_AMT_FLOAT);
                    info.unfroz_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_AMT_FLOAT);
                    info.intrst_base_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_BASE_AMT_FLOAT);
                    info.intrst_cacl_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_CACL_AMT_FLOAT);
                    info.evalu_data_source = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EVALU_DATA_SOURCE_INT);
                    evaL_2_24_InfoList.Add(info);
                }
            }
        }
    }

    public class evaL_2_25_Response : IResponse
    {
        #region 构造函数
        public evaL_2_25_Response()
        {
            this.evaL_2_25_InfoList = new ObservableCollection<evaL_2_25_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_2_25_Info> evaL_2_25_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_2_25_Info info = new evaL_2_25_Info();
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.pd_acco_type = unpacker.GetInt("pd_acco_type");
            info.asset_acco = unpacker.GetStr("asset_acco");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.begin_amt = unpacker.GetDouble("begin_amt");
            info.curr_amt = unpacker.GetDouble("curr_amt");
            info.frozen_amt = unpacker.GetDouble("frozen_amt");
            info.unfroz_amt = unpacker.GetDouble("unfroz_amt");
            info.intrst_base_amt = unpacker.GetDouble("intrst_base_amt");
            info.intrst_cacl_amt = unpacker.GetDouble("intrst_cacl_amt");
            evaL_2_25_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_2_25_InfoList.Add((evaL_2_25_Info)info);
        }
        #endregion

        //逻辑_平台估值_业务数据_查询估值产品交易组账户资金
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new evaL_2_25_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.pd_acco_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_ACCO_TYPE_INT);
                    info.asset_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STR);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.begin_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_AMT_FLOAT);
                    info.curr_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_AMT_FLOAT);
                    info.frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_AMT_FLOAT);
                    info.unfroz_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_AMT_FLOAT);
                    info.intrst_base_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_BASE_AMT_FLOAT);
                    info.intrst_cacl_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_CACL_AMT_FLOAT);
                    evaL_2_25_InfoList.Add(info);
                }
            }
        }
    }

    public class evaL_2_31_Response : IResponse
    {
        #region 构造函数
        public evaL_2_31_Response()
        {
            this.evaL_2_31_InfoList = new ObservableCollection<evaL_2_31_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_2_31_Info> evaL_2_31_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_2_31_Info info = new evaL_2_31_Info();
            evaL_2_31_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_2_31_InfoList.Add((evaL_2_31_Info)info);
        }
        #endregion

        //逻辑_平台估值_业务数据_导入估值产品证券持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_2_31_Info();
                evaL_2_31_InfoList.Add(info);
            }
        }
    }

    public class evaL_2_41_Response : IResponse
    {
        #region 构造函数
        public evaL_2_41_Response()
        {
            this.evaL_2_41_InfoList = new ObservableCollection<evaL_2_41_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_2_41_Info> evaL_2_41_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_2_41_Info info = new evaL_2_41_Info();
            evaL_2_41_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_2_41_InfoList.Add((evaL_2_41_Info)info);
        }
        #endregion

        //逻辑_平台估值_业务数据_新增估值产品银行流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_2_41_Info();
                evaL_2_41_InfoList.Add(info);
            }
        }
    }

    public class evaL_2_42_Response : IResponse
    {
        #region 构造函数
        public evaL_2_42_Response()
        {
            this.evaL_2_42_InfoList = new ObservableCollection<evaL_2_42_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_2_42_Info> evaL_2_42_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_2_42_Info info = new evaL_2_42_Info();
            evaL_2_42_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_2_42_InfoList.Add((evaL_2_42_Info)info);
        }
        #endregion

        //逻辑_平台估值_业务数据_修改估值产品银行流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_2_42_Info();
                evaL_2_42_InfoList.Add(info);
            }
        }
    }

    public class evaL_2_43_Response : IResponse
    {
        #region 构造函数
        public evaL_2_43_Response()
        {
            this.evaL_2_43_InfoList = new ObservableCollection<evaL_2_43_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_2_43_Info> evaL_2_43_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_2_43_Info info = new evaL_2_43_Info();
            evaL_2_43_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_2_43_InfoList.Add((evaL_2_43_Info)info);
        }
        #endregion

        //逻辑_平台估值_业务数据_删除估值产品银行流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_2_43_Info();
                evaL_2_43_InfoList.Add(info);
            }
        }
    }

    public class evaL_2_44_Response : IResponse
    {
        #region 构造函数
        public evaL_2_44_Response()
        {
            this.evaL_2_44_InfoList = new ObservableCollection<evaL_2_44_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_2_44_Info> evaL_2_44_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_2_44_Info info = new evaL_2_44_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.init_date = unpacker.GetInt("init_date");
            info.asset_acco = unpacker.GetStr("asset_acco");
            info.occur_dir = unpacker.GetInt("occur_dir");
            info.occur_amt = unpacker.GetDouble("occur_amt");
            info.remark_info = unpacker.GetStr("remark_info");
            evaL_2_44_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_2_44_InfoList.Add((evaL_2_44_Info)info);
        }
        #endregion

        //逻辑_平台估值_业务数据_查询估值产品银行流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new evaL_2_44_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.asset_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STR);
                    info.occur_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_DIR_INT);
                    info.occur_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_AMT_FLOAT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    evaL_2_44_InfoList.Add(info);
                }
            }
        }
    }

    public class evaL_2_51_Response : IResponse
    {
        #region 构造函数
        public evaL_2_51_Response()
        {
            this.evaL_2_51_InfoList = new ObservableCollection<evaL_2_51_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_2_51_Info> evaL_2_51_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_2_51_Info info = new evaL_2_51_Info();
            evaL_2_51_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_2_51_InfoList.Add((evaL_2_51_Info)info);
        }
        #endregion

        //逻辑_平台估值_业务数据_新增估值产品场外交易
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_2_51_Info();
                evaL_2_51_InfoList.Add(info);
            }
        }
    }

    public class evaL_2_52_Response : IResponse
    {
        #region 构造函数
        public evaL_2_52_Response()
        {
            this.evaL_2_52_InfoList = new ObservableCollection<evaL_2_52_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_2_52_Info> evaL_2_52_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_2_52_Info info = new evaL_2_52_Info();
            evaL_2_52_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_2_52_InfoList.Add((evaL_2_52_Info)info);
        }
        #endregion

        //逻辑_平台估值_业务数据_修改估值产品场外交易
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_2_52_Info();
                evaL_2_52_InfoList.Add(info);
            }
        }
    }

    public class evaL_2_53_Response : IResponse
    {
        #region 构造函数
        public evaL_2_53_Response()
        {
            this.evaL_2_53_InfoList = new ObservableCollection<evaL_2_53_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_2_53_Info> evaL_2_53_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_2_53_Info info = new evaL_2_53_Info();
            evaL_2_53_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_2_53_InfoList.Add((evaL_2_53_Info)info);
        }
        #endregion

        //逻辑_平台估值_业务数据_删除估值产品场外交易
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new evaL_2_53_Info();
                evaL_2_53_InfoList.Add(info);
            }
        }
    }

    public class evaL_2_54_Response : IResponse
    {
        #region 构造函数
        public evaL_2_54_Response()
        {
            this.evaL_2_54_InfoList = new ObservableCollection<evaL_2_54_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<evaL_2_54_Info> evaL_2_54_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            evaL_2_54_Info info = new evaL_2_54_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_type = unpacker.GetInt("stock_type");
            info.stock_code = unpacker.GetStr("stock_code");
            info.order_dir = unpacker.GetInt("order_dir");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.strike_price = unpacker.GetDouble("strike_price");
            info.expire_date = unpacker.GetInt("expire_date");
            info.remark_info = unpacker.GetStr("remark_info");
            evaL_2_54_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            evaL_2_54_InfoList.Add((evaL_2_54_Info)info);
        }
        #endregion

        //逻辑_平台估值_业务数据_查询估值产品场外交易
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new evaL_2_54_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_PRICE_FLOAT);
                    info.expire_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXPIRE_DATE_INT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    evaL_2_54_InfoList.Add(info);
                }
            }
        }
    }

}
