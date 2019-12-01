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
    public class pdfutuL_3_1_Response : IResponse
    {
        #region 构造函数
        public pdfutuL_3_1_Response()
        {
            this.pdfutuL_3_1_InfoList = new ObservableCollection<pdfutuL_3_1_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfutuL_3_1_Info> pdfutuL_3_1_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfutuL_3_1_Info info = new pdfutuL_3_1_Info();
            pdfutuL_3_1_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfutuL_3_1_InfoList.Add((pdfutuL_3_1_Info)info);
        }
        #endregion

        //逻辑_产品期货_持仓_红冲蓝补交易组持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfutuL_3_1_Info();
                pdfutuL_3_1_InfoList.Add(info);
            }
        }
    }

    public class pdfutuL_3_2_Response : IResponse
    {
        #region 构造函数
        public pdfutuL_3_2_Response()
        {
            this.pdfutuL_3_2_InfoList = new ObservableCollection<pdfutuL_3_2_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfutuL_3_2_Info> pdfutuL_3_2_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfutuL_3_2_Info info = new pdfutuL_3_2_Info();
            pdfutuL_3_2_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfutuL_3_2_InfoList.Add((pdfutuL_3_2_Info)info);
        }
        #endregion

        //逻辑_产品期货_持仓_冻结交易组持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfutuL_3_2_Info();
                pdfutuL_3_2_InfoList.Add(info);
            }
        }
    }

    public class pdfutuL_3_3_Response : IResponse
    {
        #region 构造函数
        public pdfutuL_3_3_Response()
        {
            this.pdfutuL_3_3_InfoList = new ObservableCollection<pdfutuL_3_3_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfutuL_3_3_Info> pdfutuL_3_3_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfutuL_3_3_Info info = new pdfutuL_3_3_Info();
            pdfutuL_3_3_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfutuL_3_3_InfoList.Add((pdfutuL_3_3_Info)info);
        }
        #endregion

        //逻辑_产品期货_持仓_取消冻结交易组持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfutuL_3_3_Info();
                pdfutuL_3_3_InfoList.Add(info);
            }
        }
    }

    public class pdfutuL_3_4_Response : IResponse
    {
        #region 构造函数
        public pdfutuL_3_4_Response()
        {
            this.pdfutuL_3_4_InfoList = new ObservableCollection<pdfutuL_3_4_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfutuL_3_4_Info> pdfutuL_3_4_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfutuL_3_4_Info info = new pdfutuL_3_4_Info();
            pdfutuL_3_4_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfutuL_3_4_InfoList.Add((pdfutuL_3_4_Info)info);
        }
        #endregion

        //逻辑_产品期货_持仓_解冻交易组持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfutuL_3_4_Info();
                pdfutuL_3_4_InfoList.Add(info);
            }
        }
    }

    public class pdfutuL_3_5_Response : IResponse
    {
        #region 构造函数
        public pdfutuL_3_5_Response()
        {
            this.pdfutuL_3_5_InfoList = new ObservableCollection<pdfutuL_3_5_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfutuL_3_5_Info> pdfutuL_3_5_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfutuL_3_5_Info info = new pdfutuL_3_5_Info();
            pdfutuL_3_5_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfutuL_3_5_InfoList.Add((pdfutuL_3_5_Info)info);
        }
        #endregion

        //逻辑_产品期货_持仓_取消解冻交易组持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfutuL_3_5_Info();
                pdfutuL_3_5_InfoList.Add(info);
            }
        }
    }

    public class pdfutuL_3_21_Response : IResponse
    {
        #region 构造函数
        public pdfutuL_3_21_Response()
        {
            this.pdfutuL_3_21_InfoList = new ObservableCollection<pdfutuL_3_21_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfutuL_3_21_Info> pdfutuL_3_21_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfutuL_3_21_Info info = new pdfutuL_3_21_Info();
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
            pdfutuL_3_21_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfutuL_3_21_InfoList.Add((pdfutuL_3_21_Info)info);
        }
        #endregion

        //逻辑_产品期货_持仓_查询交易组持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdfutuL_3_21_Info();
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
                    pdfutuL_3_21_InfoList.Add(info);
                }
            }
        }
    }

    public class pdfutuL_3_22_Response : IResponse
    {
        #region 构造函数
        public pdfutuL_3_22_Response()
        {
            this.pdfutuL_3_22_InfoList = new ObservableCollection<pdfutuL_3_22_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfutuL_3_22_Info> pdfutuL_3_22_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfutuL_3_22_Info info = new pdfutuL_3_22_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.update_date = unpacker.GetInt("update_date");
            info.update_time = unpacker.GetInt("update_time");
            info.init_date = unpacker.GetInt("init_date");
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
            pdfutuL_3_22_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfutuL_3_22_InfoList.Add((pdfutuL_3_22_Info)info);
        }
        #endregion

        //逻辑_产品期货_持仓_查询历史交易组持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdfutuL_3_22_Info();
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
                    pdfutuL_3_22_InfoList.Add(info);
                }
            }
        }
    }

    public class pdfutuL_3_31_Response : IResponse
    {
        #region 构造函数
        public pdfutuL_3_31_Response()
        {
            this.pdfutuL_3_31_InfoList = new ObservableCollection<pdfutuL_3_31_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfutuL_3_31_Info> pdfutuL_3_31_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfutuL_3_31_Info info = new pdfutuL_3_31_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.update_date = unpacker.GetInt("update_date");
            info.update_time = unpacker.GetInt("update_time");
            info.opor_co_no = unpacker.GetInt("opor_co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.oper_mac = unpacker.GetStr("oper_mac");
            info.oper_ip_addr = unpacker.GetStr("oper_ip_addr");
            info.oper_info = unpacker.GetStr("oper_info");
            info.oper_way = unpacker.GetStr("oper_way");
            info.oper_menu_no = unpacker.GetInt("oper_menu_no");
            info.oper_func_code = unpacker.GetStr("oper_func_code");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.futu_acco_no = unpacker.GetInt("futu_acco_no");
            info.contrc_code_no = unpacker.GetInt("contrc_code_no");
            info.lngsht_type = unpacker.GetInt("lngsht_type");
            info.hedge_type = unpacker.GetInt("hedge_type");
            info.busi_flag = unpacker.GetInt("busi_flag");
            info.occur_qty = unpacker.GetDouble("occur_qty");
            info.occur_end_qty = unpacker.GetDouble("occur_end_qty");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pdfutuL_3_31_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfutuL_3_31_InfoList.Add((pdfutuL_3_31_Info)info);
        }
        #endregion

        //逻辑_产品期货_持仓_查询交易组持仓流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdfutuL_3_31_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    info.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    info.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    info.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    info.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    info.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    info.oper_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MENU_NO_INT);
                    info.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.futu_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT);
                    info.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    info.lngsht_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT);
                    info.hedge_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT);
                    info.busi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT);
                    info.occur_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_QTY_FLOAT);
                    info.occur_end_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_END_QTY_FLOAT);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pdfutuL_3_31_InfoList.Add(info);
                }
            }
        }
    }

    public class pdfutuL_3_32_Response : IResponse
    {
        #region 构造函数
        public pdfutuL_3_32_Response()
        {
            this.pdfutuL_3_32_InfoList = new ObservableCollection<pdfutuL_3_32_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfutuL_3_32_Info> pdfutuL_3_32_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfutuL_3_32_Info info = new pdfutuL_3_32_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.update_date = unpacker.GetInt("update_date");
            info.update_time = unpacker.GetInt("update_time");
            info.opor_co_no = unpacker.GetInt("opor_co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.oper_mac = unpacker.GetStr("oper_mac");
            info.oper_ip_addr = unpacker.GetStr("oper_ip_addr");
            info.oper_info = unpacker.GetStr("oper_info");
            info.oper_way = unpacker.GetStr("oper_way");
            info.oper_menu_no = unpacker.GetInt("oper_menu_no");
            info.oper_func_code = unpacker.GetStr("oper_func_code");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.futu_acco_no = unpacker.GetInt("futu_acco_no");
            info.contrc_code_no = unpacker.GetInt("contrc_code_no");
            info.lngsht_type = unpacker.GetInt("lngsht_type");
            info.hedge_type = unpacker.GetInt("hedge_type");
            info.busi_flag = unpacker.GetInt("busi_flag");
            info.occur_qty = unpacker.GetDouble("occur_qty");
            info.occur_end_qty = unpacker.GetDouble("occur_end_qty");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pdfutuL_3_32_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfutuL_3_32_InfoList.Add((pdfutuL_3_32_Info)info);
        }
        #endregion

        //逻辑_产品期货_持仓_查询历史交易组持仓流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdfutuL_3_32_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    info.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    info.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    info.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    info.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    info.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    info.oper_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MENU_NO_INT);
                    info.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.futu_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT);
                    info.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    info.lngsht_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT);
                    info.hedge_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT);
                    info.busi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT);
                    info.occur_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_QTY_FLOAT);
                    info.occur_end_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_END_QTY_FLOAT);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pdfutuL_3_32_InfoList.Add(info);
                }
            }
        }
    }

    public class pdfutuL_3_34_Response : IResponse
    {
        #region 构造函数
        public pdfutuL_3_34_Response()
        {
            this.pdfutuL_3_34_InfoList = new ObservableCollection<pdfutuL_3_34_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfutuL_3_34_Info> pdfutuL_3_34_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfutuL_3_34_Info info = new pdfutuL_3_34_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.update_date = unpacker.GetInt("update_date");
            info.update_time = unpacker.GetInt("update_time");
            info.opor_co_no = unpacker.GetInt("opor_co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.oper_mac = unpacker.GetStr("oper_mac");
            info.oper_ip_addr = unpacker.GetStr("oper_ip_addr");
            info.oper_info = unpacker.GetStr("oper_info");
            info.oper_way = unpacker.GetStr("oper_way");
            info.oper_menu_no = unpacker.GetInt("oper_menu_no");
            info.oper_func_code = unpacker.GetStr("oper_func_code");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.futu_acco_no = unpacker.GetInt("futu_acco_no");
            info.contrc_code_no = unpacker.GetInt("contrc_code_no");
            info.lngsht_type = unpacker.GetInt("lngsht_type");
            info.hedge_type = unpacker.GetInt("hedge_type");
            info.frozen_type = unpacker.GetInt("frozen_type");
            info.occur_qty = unpacker.GetDouble("occur_qty");
            info.expire_date = unpacker.GetInt("expire_date");
            info.jour_status = unpacker.GetStr("jour_status");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pdfutuL_3_34_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfutuL_3_34_InfoList.Add((pdfutuL_3_34_Info)info);
        }
        #endregion

        //逻辑_产品期货_持仓_查询交易组持仓冻结解冻流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdfutuL_3_34_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    info.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    info.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    info.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    info.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    info.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    info.oper_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MENU_NO_INT);
                    info.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.futu_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT);
                    info.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    info.lngsht_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT);
                    info.hedge_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT);
                    info.frozen_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_TYPE_INT);
                    info.occur_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_QTY_FLOAT);
                    info.expire_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXPIRE_DATE_INT);
                    info.jour_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_STATUS_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pdfutuL_3_34_InfoList.Add(info);
                }
            }
        }
    }

    public class pdfutuL_3_35_Response : IResponse
    {
        #region 构造函数
        public pdfutuL_3_35_Response()
        {
            this.pdfutuL_3_35_InfoList = new ObservableCollection<pdfutuL_3_35_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfutuL_3_35_Info> pdfutuL_3_35_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfutuL_3_35_Info info = new pdfutuL_3_35_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.update_date = unpacker.GetInt("update_date");
            info.update_time = unpacker.GetInt("update_time");
            info.opor_co_no = unpacker.GetInt("opor_co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.oper_mac = unpacker.GetStr("oper_mac");
            info.oper_ip_addr = unpacker.GetStr("oper_ip_addr");
            info.oper_info = unpacker.GetStr("oper_info");
            info.oper_way = unpacker.GetStr("oper_way");
            info.oper_menu_no = unpacker.GetInt("oper_menu_no");
            info.oper_func_code = unpacker.GetStr("oper_func_code");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.futu_acco_no = unpacker.GetInt("futu_acco_no");
            info.contrc_code_no = unpacker.GetInt("contrc_code_no");
            info.lngsht_type = unpacker.GetInt("lngsht_type");
            info.hedge_type = unpacker.GetInt("hedge_type");
            info.frozen_type = unpacker.GetInt("frozen_type");
            info.occur_qty = unpacker.GetDouble("occur_qty");
            info.expire_date = unpacker.GetInt("expire_date");
            info.jour_status = unpacker.GetStr("jour_status");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pdfutuL_3_35_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfutuL_3_35_InfoList.Add((pdfutuL_3_35_Info)info);
        }
        #endregion

        //逻辑_产品期货_持仓_查询历史交易组持仓冻结解冻流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdfutuL_3_35_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    info.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    info.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    info.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    info.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    info.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    info.oper_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MENU_NO_INT);
                    info.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.futu_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT);
                    info.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    info.lngsht_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT);
                    info.hedge_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT);
                    info.frozen_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_TYPE_INT);
                    info.occur_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_QTY_FLOAT);
                    info.expire_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXPIRE_DATE_INT);
                    info.jour_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_STATUS_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pdfutuL_3_35_InfoList.Add(info);
                }
            }
        }
    }

    public class pdfutuL_3_51_Response : IResponse
    {
        #region 构造函数
        public pdfutuL_3_51_Response()
        {
            this.pdfutuL_3_51_InfoList = new ObservableCollection<pdfutuL_3_51_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfutuL_3_51_Info> pdfutuL_3_51_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfutuL_3_51_Info info = new pdfutuL_3_51_Info();
            pdfutuL_3_51_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfutuL_3_51_InfoList.Add((pdfutuL_3_51_Info)info);
        }
        #endregion

        //逻辑_产品期货_持仓_红冲蓝补资产账户持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfutuL_3_51_Info();
                pdfutuL_3_51_InfoList.Add(info);
            }
        }
    }

    public class pdfutuL_3_52_Response : IResponse
    {
        #region 构造函数
        public pdfutuL_3_52_Response()
        {
            this.pdfutuL_3_52_InfoList = new ObservableCollection<pdfutuL_3_52_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfutuL_3_52_Info> pdfutuL_3_52_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfutuL_3_52_Info info = new pdfutuL_3_52_Info();
            pdfutuL_3_52_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfutuL_3_52_InfoList.Add((pdfutuL_3_52_Info)info);
        }
        #endregion

        //逻辑_产品期货_持仓_冻结资产账户持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfutuL_3_52_Info();
                pdfutuL_3_52_InfoList.Add(info);
            }
        }
    }

    public class pdfutuL_3_53_Response : IResponse
    {
        #region 构造函数
        public pdfutuL_3_53_Response()
        {
            this.pdfutuL_3_53_InfoList = new ObservableCollection<pdfutuL_3_53_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfutuL_3_53_Info> pdfutuL_3_53_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfutuL_3_53_Info info = new pdfutuL_3_53_Info();
            pdfutuL_3_53_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfutuL_3_53_InfoList.Add((pdfutuL_3_53_Info)info);
        }
        #endregion

        //逻辑_产品期货_持仓_取消冻结资产账户持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfutuL_3_53_Info();
                pdfutuL_3_53_InfoList.Add(info);
            }
        }
    }

    public class pdfutuL_3_54_Response : IResponse
    {
        #region 构造函数
        public pdfutuL_3_54_Response()
        {
            this.pdfutuL_3_54_InfoList = new ObservableCollection<pdfutuL_3_54_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfutuL_3_54_Info> pdfutuL_3_54_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfutuL_3_54_Info info = new pdfutuL_3_54_Info();
            pdfutuL_3_54_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfutuL_3_54_InfoList.Add((pdfutuL_3_54_Info)info);
        }
        #endregion

        //逻辑_产品期货_持仓_解冻资产账户持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfutuL_3_54_Info();
                pdfutuL_3_54_InfoList.Add(info);
            }
        }
    }

    public class pdfutuL_3_55_Response : IResponse
    {
        #region 构造函数
        public pdfutuL_3_55_Response()
        {
            this.pdfutuL_3_55_InfoList = new ObservableCollection<pdfutuL_3_55_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfutuL_3_55_Info> pdfutuL_3_55_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfutuL_3_55_Info info = new pdfutuL_3_55_Info();
            pdfutuL_3_55_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfutuL_3_55_InfoList.Add((pdfutuL_3_55_Info)info);
        }
        #endregion

        //逻辑_产品期货_持仓_取消解冻资产账户持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfutuL_3_55_Info();
                pdfutuL_3_55_InfoList.Add(info);
            }
        }
    }

    public class pdfutuL_3_71_Response : IResponse
    {
        #region 构造函数
        public pdfutuL_3_71_Response()
        {
            this.pdfutuL_3_71_InfoList = new ObservableCollection<pdfutuL_3_71_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfutuL_3_71_Info> pdfutuL_3_71_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfutuL_3_71_Info info = new pdfutuL_3_71_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.update_date = unpacker.GetInt("update_date");
            info.update_time = unpacker.GetInt("update_time");
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
            pdfutuL_3_71_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfutuL_3_71_InfoList.Add((pdfutuL_3_71_Info)info);
        }
        #endregion

        //逻辑_产品期货_持仓_查询资产账户持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdfutuL_3_71_Info();
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
                    pdfutuL_3_71_InfoList.Add(info);
                }
            }
        }
    }

    public class pdfutuL_3_72_Response : IResponse
    {
        #region 构造函数
        public pdfutuL_3_72_Response()
        {
            this.pdfutuL_3_72_InfoList = new ObservableCollection<pdfutuL_3_72_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfutuL_3_72_Info> pdfutuL_3_72_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfutuL_3_72_Info info = new pdfutuL_3_72_Info();
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
            pdfutuL_3_72_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfutuL_3_72_InfoList.Add((pdfutuL_3_72_Info)info);
        }
        #endregion

        //逻辑_产品期货_持仓_查询历史资产账户持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdfutuL_3_72_Info();
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
                    pdfutuL_3_72_InfoList.Add(info);
                }
            }
        }
    }

    public class pdfutuL_3_81_Response : IResponse
    {
        #region 构造函数
        public pdfutuL_3_81_Response()
        {
            this.pdfutuL_3_81_InfoList = new ObservableCollection<pdfutuL_3_81_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfutuL_3_81_Info> pdfutuL_3_81_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfutuL_3_81_Info info = new pdfutuL_3_81_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.update_date = unpacker.GetInt("update_date");
            info.update_time = unpacker.GetInt("update_time");
            info.opor_co_no = unpacker.GetInt("opor_co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.oper_mac = unpacker.GetStr("oper_mac");
            info.oper_ip_addr = unpacker.GetStr("oper_ip_addr");
            info.oper_info = unpacker.GetStr("oper_info");
            info.oper_way = unpacker.GetStr("oper_way");
            info.oper_menu_no = unpacker.GetInt("oper_menu_no");
            info.oper_func_code = unpacker.GetStr("oper_func_code");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.futu_acco_no = unpacker.GetInt("futu_acco_no");
            info.contrc_code_no = unpacker.GetInt("contrc_code_no");
            info.lngsht_type = unpacker.GetInt("lngsht_type");
            info.hedge_type = unpacker.GetInt("hedge_type");
            info.busi_flag = unpacker.GetInt("busi_flag");
            info.occur_qty = unpacker.GetDouble("occur_qty");
            info.occur_end_qty = unpacker.GetDouble("occur_end_qty");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pdfutuL_3_81_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfutuL_3_81_InfoList.Add((pdfutuL_3_81_Info)info);
        }
        #endregion

        //逻辑_产品期货_持仓_查询资产账户持仓流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdfutuL_3_81_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    info.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    info.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    info.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    info.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    info.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    info.oper_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MENU_NO_INT);
                    info.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.futu_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT);
                    info.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    info.lngsht_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT);
                    info.hedge_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT);
                    info.busi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT);
                    info.occur_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_QTY_FLOAT);
                    info.occur_end_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_END_QTY_FLOAT);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pdfutuL_3_81_InfoList.Add(info);
                }
            }
        }
    }

    public class pdfutuL_3_82_Response : IResponse
    {
        #region 构造函数
        public pdfutuL_3_82_Response()
        {
            this.pdfutuL_3_82_InfoList = new ObservableCollection<pdfutuL_3_82_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfutuL_3_82_Info> pdfutuL_3_82_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfutuL_3_82_Info info = new pdfutuL_3_82_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.update_date = unpacker.GetInt("update_date");
            info.update_time = unpacker.GetInt("update_time");
            info.opor_co_no = unpacker.GetInt("opor_co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.oper_mac = unpacker.GetStr("oper_mac");
            info.oper_ip_addr = unpacker.GetStr("oper_ip_addr");
            info.oper_info = unpacker.GetStr("oper_info");
            info.oper_way = unpacker.GetStr("oper_way");
            info.oper_menu_no = unpacker.GetInt("oper_menu_no");
            info.oper_func_code = unpacker.GetStr("oper_func_code");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.futu_acco_no = unpacker.GetInt("futu_acco_no");
            info.contrc_code_no = unpacker.GetInt("contrc_code_no");
            info.lngsht_type = unpacker.GetInt("lngsht_type");
            info.hedge_type = unpacker.GetInt("hedge_type");
            info.busi_flag = unpacker.GetInt("busi_flag");
            info.occur_qty = unpacker.GetDouble("occur_qty");
            info.occur_end_qty = unpacker.GetDouble("occur_end_qty");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pdfutuL_3_82_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfutuL_3_82_InfoList.Add((pdfutuL_3_82_Info)info);
        }
        #endregion

        //逻辑_产品期货_持仓_查询历史资产账户持仓流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdfutuL_3_82_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    info.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    info.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    info.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    info.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    info.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    info.oper_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MENU_NO_INT);
                    info.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.futu_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT);
                    info.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    info.lngsht_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT);
                    info.hedge_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT);
                    info.busi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT);
                    info.occur_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_QTY_FLOAT);
                    info.occur_end_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_END_QTY_FLOAT);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pdfutuL_3_82_InfoList.Add(info);
                }
            }
        }
    }

    public class pdfutuL_3_84_Response : IResponse
    {
        #region 构造函数
        public pdfutuL_3_84_Response()
        {
            this.pdfutuL_3_84_InfoList = new ObservableCollection<pdfutuL_3_84_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfutuL_3_84_Info> pdfutuL_3_84_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfutuL_3_84_Info info = new pdfutuL_3_84_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.update_date = unpacker.GetInt("update_date");
            info.update_time = unpacker.GetInt("update_time");
            info.opor_co_no = unpacker.GetInt("opor_co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.oper_mac = unpacker.GetStr("oper_mac");
            info.oper_ip_addr = unpacker.GetStr("oper_ip_addr");
            info.oper_info = unpacker.GetStr("oper_info");
            info.oper_way = unpacker.GetStr("oper_way");
            info.oper_menu_no = unpacker.GetInt("oper_menu_no");
            info.oper_func_code = unpacker.GetStr("oper_func_code");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.futu_acco_no = unpacker.GetInt("futu_acco_no");
            info.contrc_code_no = unpacker.GetInt("contrc_code_no");
            info.lngsht_type = unpacker.GetInt("lngsht_type");
            info.hedge_type = unpacker.GetInt("hedge_type");
            info.frozen_type = unpacker.GetInt("frozen_type");
            info.occur_qty = unpacker.GetDouble("occur_qty");
            info.expire_date = unpacker.GetInt("expire_date");
            info.jour_status = unpacker.GetStr("jour_status");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pdfutuL_3_84_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfutuL_3_84_InfoList.Add((pdfutuL_3_84_Info)info);
        }
        #endregion

        //逻辑_产品期货_持仓_查询资产账户持仓冻结解冻流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdfutuL_3_84_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    info.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    info.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    info.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    info.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    info.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    info.oper_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MENU_NO_INT);
                    info.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.futu_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT);
                    info.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    info.lngsht_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT);
                    info.hedge_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT);
                    info.frozen_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_TYPE_INT);
                    info.occur_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_QTY_FLOAT);
                    info.expire_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXPIRE_DATE_INT);
                    info.jour_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_STATUS_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pdfutuL_3_84_InfoList.Add(info);
                }
            }
        }
    }

    public class pdfutuL_3_85_Response : IResponse
    {
        #region 构造函数
        public pdfutuL_3_85_Response()
        {
            this.pdfutuL_3_85_InfoList = new ObservableCollection<pdfutuL_3_85_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfutuL_3_85_Info> pdfutuL_3_85_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfutuL_3_85_Info info = new pdfutuL_3_85_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.update_date = unpacker.GetInt("update_date");
            info.update_time = unpacker.GetInt("update_time");
            info.opor_co_no = unpacker.GetInt("opor_co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.oper_mac = unpacker.GetStr("oper_mac");
            info.oper_ip_addr = unpacker.GetStr("oper_ip_addr");
            info.oper_info = unpacker.GetStr("oper_info");
            info.oper_way = unpacker.GetStr("oper_way");
            info.oper_menu_no = unpacker.GetInt("oper_menu_no");
            info.oper_func_code = unpacker.GetStr("oper_func_code");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.futu_acco_no = unpacker.GetInt("futu_acco_no");
            info.contrc_code_no = unpacker.GetInt("contrc_code_no");
            info.lngsht_type = unpacker.GetInt("lngsht_type");
            info.hedge_type = unpacker.GetInt("hedge_type");
            info.frozen_type = unpacker.GetInt("frozen_type");
            info.occur_qty = unpacker.GetDouble("occur_qty");
            info.expire_date = unpacker.GetInt("expire_date");
            info.jour_status = unpacker.GetStr("jour_status");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pdfutuL_3_85_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfutuL_3_85_InfoList.Add((pdfutuL_3_85_Info)info);
        }
        #endregion

        //逻辑_产品期货_持仓_查询历史资产账户持仓冻结解冻流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdfutuL_3_85_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    info.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    info.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    info.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    info.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    info.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    info.oper_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MENU_NO_INT);
                    info.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.futu_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT);
                    info.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    info.lngsht_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT);
                    info.hedge_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT);
                    info.frozen_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_TYPE_INT);
                    info.occur_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_QTY_FLOAT);
                    info.expire_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXPIRE_DATE_INT);
                    info.jour_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_STATUS_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pdfutuL_3_85_InfoList.Add(info);
                }
            }
        }
    }

    public class pdfutuL_3_171_Response : IResponse
    {
        #region 构造函数
        public pdfutuL_3_171_Response()
        {
            this.pdfutuL_3_171_InfoList = new ObservableCollection<pdfutuL_3_171_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfutuL_3_171_Info> pdfutuL_3_171_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfutuL_3_171_Info info = new pdfutuL_3_171_Info();
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            pdfutuL_3_171_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfutuL_3_171_InfoList.Add((pdfutuL_3_171_Info)info);
        }
        #endregion

        //逻辑_产品期货_持仓_转入外部期货持仓记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfutuL_3_171_Info();
                info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                pdfutuL_3_171_InfoList.Add(info);
            }
        }
    }

    public class pdfutuL_3_172_Response : IResponse
    {
        #region 构造函数
        public pdfutuL_3_172_Response()
        {
            this.pdfutuL_3_172_InfoList = new ObservableCollection<pdfutuL_3_172_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfutuL_3_172_Info> pdfutuL_3_172_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfutuL_3_172_Info info = new pdfutuL_3_172_Info();
            pdfutuL_3_172_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfutuL_3_172_InfoList.Add((pdfutuL_3_172_Info)info);
        }
        #endregion

        //逻辑_产品期货_持仓_清除外部转入记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfutuL_3_172_Info();
                pdfutuL_3_172_InfoList.Add(info);
            }
        }
    }

    public class pdfutuL_3_173_Response : IResponse
    {
        #region 构造函数
        public pdfutuL_3_173_Response()
        {
            this.pdfutuL_3_173_InfoList = new ObservableCollection<pdfutuL_3_173_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfutuL_3_173_Info> pdfutuL_3_173_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfutuL_3_173_Info info = new pdfutuL_3_173_Info();
            pdfutuL_3_173_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfutuL_3_173_InfoList.Add((pdfutuL_3_173_Info)info);
        }
        #endregion

        //逻辑_产品期货_持仓_清除外部持仓转入记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfutuL_3_173_Info();
                pdfutuL_3_173_InfoList.Add(info);
            }
        }
    }

}
