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
    public class pdfutuL_9_1_Response : IResponse
    {
        #region 构造函数
        public pdfutuL_9_1_Response()
        {
            this.pdfutuL_9_1_InfoList = new ObservableCollection<pdfutuL_9_1_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfutuL_9_1_Info> pdfutuL_9_1_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfutuL_9_1_Info info = new pdfutuL_9_1_Info();
            pdfutuL_9_1_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfutuL_9_1_InfoList.Add((pdfutuL_9_1_Info)info);
        }
        #endregion

        //逻辑_产品期货_持仓运维_核对内部期货持仓记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfutuL_9_1_Info();
                pdfutuL_9_1_InfoList.Add(info);
            }
        }
    }

    public class pdfutuL_9_2_Response : IResponse
    {
        #region 构造函数
        public pdfutuL_9_2_Response()
        {
            this.pdfutuL_9_2_InfoList = new ObservableCollection<pdfutuL_9_2_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfutuL_9_2_Info> pdfutuL_9_2_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfutuL_9_2_Info info = new pdfutuL_9_2_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.exch_no = unpacker.GetInt("exch_no");
            info.futu_acco_no = unpacker.GetInt("futu_acco_no");
            info.futu_acco = unpacker.GetStr("futu_acco");
            info.contrc_code_no = unpacker.GetInt("contrc_code_no");
            info.contrc_code = unpacker.GetStr("contrc_code");
            info.contrc_name = unpacker.GetStr("contrc_name");
            info.contrc_type = unpacker.GetInt("contrc_type");
            info.lngsht_type = unpacker.GetInt("lngsht_type");
            info.hedge_type = unpacker.GetInt("hedge_type");
            info.contrc_unit = unpacker.GetInt("contrc_unit");
            info.acco_curr_qty = unpacker.GetDouble("acco_curr_qty");
            info.acco_avail_qty = unpacker.GetDouble("acco_avail_qty");
            info.acco_rece_margin = unpacker.GetDouble("acco_rece_margin");
            info.out_curr_qty = unpacker.GetDouble("out_curr_qty");
            info.out_enable_qty = unpacker.GetDouble("out_enable_qty");
            info.out_rece_margin = unpacker.GetDouble("out_rece_margin");
            info.acco_curr_qty_diff = unpacker.GetDouble("acco_curr_qty_diff");
            info.acco_avail_qty_diff = unpacker.GetDouble("acco_avail_qty_diff");
            info.acco_rece_margin_diff = unpacker.GetDouble("acco_rece_margin_diff");
            info.deal_flag = unpacker.GetInt("deal_flag");
            info.asset_sync_flag = unpacker.GetInt("asset_sync_flag");
            info.remark_info = unpacker.GetStr("remark_info");
            pdfutuL_9_2_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfutuL_9_2_InfoList.Add((pdfutuL_9_2_Info)info);
        }
        #endregion

        //逻辑_产品期货_持仓运维_查询资产账户内外持仓差异记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdfutuL_9_2_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.futu_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT);
                    info.futu_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_STR);
                    info.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    info.contrc_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR);
                    info.contrc_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_NAME_STR);
                    info.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    info.lngsht_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT);
                    info.hedge_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT);
                    info.contrc_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_UNIT_INT);
                    info.acco_curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_CURR_QTY_FLOAT);
                    info.acco_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_AVAIL_QTY_FLOAT);
                    info.acco_rece_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_RECE_MARGIN_FLOAT);
                    info.out_curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_CURR_QTY_FLOAT);
                    info.out_enable_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ENABLE_QTY_FLOAT);
                    info.out_rece_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_RECE_MARGIN_FLOAT);
                    info.acco_curr_qty_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_CURR_QTY_DIFF_FLOAT);
                    info.acco_avail_qty_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_AVAIL_QTY_DIFF_FLOAT);
                    info.acco_rece_margin_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_RECE_MARGIN_DIFF_FLOAT);
                    info.deal_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_FLAG_INT);
                    info.asset_sync_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_SYNC_FLAG_INT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    pdfutuL_9_2_InfoList.Add(info);
                }
            }
        }
    }

    public class pdfutuL_9_3_Response : IResponse
    {
        #region 构造函数
        public pdfutuL_9_3_Response()
        {
            this.pdfutuL_9_3_InfoList = new ObservableCollection<pdfutuL_9_3_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfutuL_9_3_Info> pdfutuL_9_3_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfutuL_9_3_Info info = new pdfutuL_9_3_Info();
            info.co_no = unpacker.GetInt("co_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.out_acco = unpacker.GetStr("out_acco");
            pdfutuL_9_3_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfutuL_9_3_InfoList.Add((pdfutuL_9_3_Info)info);
        }
        #endregion

        //逻辑_产品期货_持仓运维_处理资产账户内外持仓差异记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfutuL_9_3_Info();
                info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                pdfutuL_9_3_InfoList.Add(info);
            }
        }
    }

    public class pdfutuL_9_71_Response : IResponse
    {
        #region 构造函数
        public pdfutuL_9_71_Response()
        {
            this.pdfutuL_9_71_InfoList = new ObservableCollection<pdfutuL_9_71_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfutuL_9_71_Info> pdfutuL_9_71_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfutuL_9_71_Info info = new pdfutuL_9_71_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.update_date = unpacker.GetInt("update_date");
            info.update_time = unpacker.GetInt("update_time");
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
            info.contrc_unit = unpacker.GetInt("contrc_unit");
            info.begin_qty = unpacker.GetDouble("begin_qty");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.frozen_qty = unpacker.GetDouble("frozen_qty");
            info.unfroz_qty = unpacker.GetDouble("unfroz_qty");
            info.pre_settle_price = unpacker.GetDouble("pre_settle_price");
            info.sett_price = unpacker.GetDouble("sett_price");
            info.rece_margin = unpacker.GetDouble("rece_margin");
            pdfutuL_9_71_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfutuL_9_71_InfoList.Add((pdfutuL_9_71_Info)info);
        }
        #endregion

        //逻辑_产品期货_持仓运维_查询资产账户持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdfutuL_9_71_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    info.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
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
                    info.contrc_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_UNIT_INT);
                    info.begin_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_QTY_FLOAT);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_QTY_FLOAT);
                    info.unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_QTY_FLOAT);
                    info.pre_settle_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SETTLE_PRICE_FLOAT);
                    info.sett_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SETT_PRICE_FLOAT);
                    info.rece_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RECE_MARGIN_FLOAT);
                    pdfutuL_9_71_InfoList.Add(info);
                }
            }
        }
    }

    public class pdfutuL_9_72_Response : IResponse
    {
        #region 构造函数
        public pdfutuL_9_72_Response()
        {
            this.pdfutuL_9_72_InfoList = new ObservableCollection<pdfutuL_9_72_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfutuL_9_72_Info> pdfutuL_9_72_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfutuL_9_72_Info info = new pdfutuL_9_72_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.update_date = unpacker.GetInt("update_date");
            info.update_time = unpacker.GetInt("update_time");
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
            info.contrc_unit = unpacker.GetInt("contrc_unit");
            info.begin_qty = unpacker.GetDouble("begin_qty");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.frozen_qty = unpacker.GetDouble("frozen_qty");
            info.unfroz_qty = unpacker.GetDouble("unfroz_qty");
            info.pre_settle_price = unpacker.GetDouble("pre_settle_price");
            info.sett_price = unpacker.GetDouble("sett_price");
            info.rece_margin = unpacker.GetDouble("rece_margin");
            pdfutuL_9_72_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfutuL_9_72_InfoList.Add((pdfutuL_9_72_Info)info);
        }
        #endregion

        //逻辑_产品期货_持仓运维_查询历史资产账户持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdfutuL_9_72_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    info.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
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
                    info.contrc_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_UNIT_INT);
                    info.begin_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_QTY_FLOAT);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_QTY_FLOAT);
                    info.unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_QTY_FLOAT);
                    info.pre_settle_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SETTLE_PRICE_FLOAT);
                    info.sett_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SETT_PRICE_FLOAT);
                    info.rece_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RECE_MARGIN_FLOAT);
                    pdfutuL_9_72_InfoList.Add(info);
                }
            }
        }
    }

    public class pdfutuL_9_8_Response : IResponse
    {
        #region 构造函数
        public pdfutuL_9_8_Response()
        {
            this.pdfutuL_9_8_InfoList = new ObservableCollection<pdfutuL_9_8_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfutuL_9_8_Info> pdfutuL_9_8_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfutuL_9_8_Info info = new pdfutuL_9_8_Info();
            pdfutuL_9_8_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfutuL_9_8_InfoList.Add((pdfutuL_9_8_Info)info);
        }
        #endregion

        //逻辑_产品期货_持仓运维_同步内外差异
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfutuL_9_8_Info();
                pdfutuL_9_8_InfoList.Add(info);
            }
        }
    }

    public class pdfutuL_9_9_Response : IResponse
    {
        #region 构造函数
        public pdfutuL_9_9_Response()
        {
            this.pdfutuL_9_9_InfoList = new ObservableCollection<pdfutuL_9_9_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfutuL_9_9_Info> pdfutuL_9_9_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfutuL_9_9_Info info = new pdfutuL_9_9_Info();
            pdfutuL_9_9_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfutuL_9_9_InfoList.Add((pdfutuL_9_9_Info)info);
        }
        #endregion

        //逻辑_产品期货_持仓运维_清除外部持仓记录差异记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfutuL_9_9_Info();
                pdfutuL_9_9_InfoList.Add(info);
            }
        }
    }

    public class pdfutuL_9_73_Response : IResponse
    {
        #region 构造函数
        public pdfutuL_9_73_Response()
        {
            this.pdfutuL_9_73_InfoList = new ObservableCollection<pdfutuL_9_73_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfutuL_9_73_Info> pdfutuL_9_73_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfutuL_9_73_Info info = new pdfutuL_9_73_Info();
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
            info.futu_acco_no = unpacker.GetInt("futu_acco_no");
            info.contrc_code_no = unpacker.GetInt("contrc_code_no");
            info.contrc_type = unpacker.GetInt("contrc_type");
            info.lngsht_type = unpacker.GetInt("lngsht_type");
            info.hedge_type = unpacker.GetInt("hedge_type");
            info.contrc_unit = unpacker.GetInt("contrc_unit");
            info.begin_qty = unpacker.GetDouble("begin_qty");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.frozen_qty = unpacker.GetDouble("frozen_qty");
            info.unfroz_qty = unpacker.GetDouble("unfroz_qty");
            info.pre_settle_price = unpacker.GetDouble("pre_settle_price");
            info.sett_price = unpacker.GetDouble("sett_price");
            info.rece_margin = unpacker.GetDouble("rece_margin");
            pdfutuL_9_73_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfutuL_9_73_InfoList.Add((pdfutuL_9_73_Info)info);
        }
        #endregion

        //逻辑_产品期货_持仓运维_查询交易组持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdfutuL_9_73_Info();
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
                    info.futu_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT);
                    info.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    info.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    info.lngsht_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT);
                    info.hedge_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT);
                    info.contrc_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_UNIT_INT);
                    info.begin_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_QTY_FLOAT);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_QTY_FLOAT);
                    info.unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_QTY_FLOAT);
                    info.pre_settle_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SETTLE_PRICE_FLOAT);
                    info.sett_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SETT_PRICE_FLOAT);
                    info.rece_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RECE_MARGIN_FLOAT);
                    pdfutuL_9_73_InfoList.Add(info);
                }
            }
        }
    }

}
