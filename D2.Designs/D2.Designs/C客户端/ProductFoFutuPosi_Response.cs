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
    public class pdfofuL_3_1_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_3_1_Response()
        {
            this.pdfofuL_3_1_InfoList = new ObservableCollection<pdfofuL_3_1_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_3_1_Info> pdfofuL_3_1_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_3_1_Info info = new pdfofuL_3_1_Info();
            pdfofuL_3_1_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_3_1_InfoList.Add((pdfofuL_3_1_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_持仓_红冲蓝补交易组持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfofuL_3_1_Info();
                pdfofuL_3_1_InfoList.Add(info);
            }
        }
    }

    public class pdfofuL_3_2_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_3_2_Response()
        {
            this.pdfofuL_3_2_InfoList = new ObservableCollection<pdfofuL_3_2_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_3_2_Info> pdfofuL_3_2_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_3_2_Info info = new pdfofuL_3_2_Info();
            pdfofuL_3_2_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_3_2_InfoList.Add((pdfofuL_3_2_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_持仓_冻结交易组持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfofuL_3_2_Info();
                pdfofuL_3_2_InfoList.Add(info);
            }
        }
    }

    public class pdfofuL_3_3_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_3_3_Response()
        {
            this.pdfofuL_3_3_InfoList = new ObservableCollection<pdfofuL_3_3_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_3_3_Info> pdfofuL_3_3_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_3_3_Info info = new pdfofuL_3_3_Info();
            pdfofuL_3_3_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_3_3_InfoList.Add((pdfofuL_3_3_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_持仓_取消冻结交易组持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfofuL_3_3_Info();
                pdfofuL_3_3_InfoList.Add(info);
            }
        }
    }

    public class pdfofuL_3_4_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_3_4_Response()
        {
            this.pdfofuL_3_4_InfoList = new ObservableCollection<pdfofuL_3_4_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_3_4_Info> pdfofuL_3_4_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_3_4_Info info = new pdfofuL_3_4_Info();
            pdfofuL_3_4_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_3_4_InfoList.Add((pdfofuL_3_4_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_持仓_解冻交易组持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfofuL_3_4_Info();
                pdfofuL_3_4_InfoList.Add(info);
            }
        }
    }

    public class pdfofuL_3_5_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_3_5_Response()
        {
            this.pdfofuL_3_5_InfoList = new ObservableCollection<pdfofuL_3_5_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_3_5_Info> pdfofuL_3_5_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_3_5_Info info = new pdfofuL_3_5_Info();
            pdfofuL_3_5_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_3_5_InfoList.Add((pdfofuL_3_5_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_持仓_取消解冻交易组持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfofuL_3_5_Info();
                pdfofuL_3_5_InfoList.Add(info);
            }
        }
    }

    public class pdfofuL_3_21_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_3_21_Response()
        {
            this.pdfofuL_3_21_InfoList = new ObservableCollection<pdfofuL_3_21_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_3_21_Info> pdfofuL_3_21_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_3_21_Info info = new pdfofuL_3_21_Info();
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
            info.contrc_unit = unpacker.GetInt("contrc_unit");
            info.begin_qty = unpacker.GetDouble("begin_qty");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.frozen_qty = unpacker.GetDouble("frozen_qty");
            info.unfroz_qty = unpacker.GetDouble("unfroz_qty");
            info.sett_price = unpacker.GetDouble("sett_price");
            info.rece_margin = unpacker.GetDouble("rece_margin");
            info.realize_pandl = unpacker.GetDouble("realize_pandl");
            pdfofuL_3_21_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_3_21_InfoList.Add((pdfofuL_3_21_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_持仓_查询交易组持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdfofuL_3_21_Info();
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
                    info.contrc_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_UNIT_INT);
                    info.begin_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_QTY_FLOAT);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_QTY_FLOAT);
                    info.unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_QTY_FLOAT);
                    info.sett_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SETT_PRICE_FLOAT);
                    info.rece_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RECE_MARGIN_FLOAT);
                    info.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    pdfofuL_3_21_InfoList.Add(info);
                }
            }
        }
    }

    public class pdfofuL_3_22_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_3_22_Response()
        {
            this.pdfofuL_3_22_InfoList = new ObservableCollection<pdfofuL_3_22_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_3_22_Info> pdfofuL_3_22_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_3_22_Info info = new pdfofuL_3_22_Info();
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
            info.contrc_unit = unpacker.GetInt("contrc_unit");
            info.begin_qty = unpacker.GetDouble("begin_qty");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.frozen_qty = unpacker.GetDouble("frozen_qty");
            info.unfroz_qty = unpacker.GetDouble("unfroz_qty");
            info.sett_price = unpacker.GetDouble("sett_price");
            info.rece_margin = unpacker.GetDouble("rece_margin");
            info.realize_pandl = unpacker.GetDouble("realize_pandl");
            pdfofuL_3_22_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_3_22_InfoList.Add((pdfofuL_3_22_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_持仓_查询历史交易组持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdfofuL_3_22_Info();
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
                    info.contrc_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_UNIT_INT);
                    info.begin_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_QTY_FLOAT);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_QTY_FLOAT);
                    info.unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_QTY_FLOAT);
                    info.sett_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SETT_PRICE_FLOAT);
                    info.rece_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RECE_MARGIN_FLOAT);
                    info.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    pdfofuL_3_22_InfoList.Add(info);
                }
            }
        }
    }

    public class pdfofuL_3_31_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_3_31_Response()
        {
            this.pdfofuL_3_31_InfoList = new ObservableCollection<pdfofuL_3_31_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_3_31_Info> pdfofuL_3_31_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_3_31_Info info = new pdfofuL_3_31_Info();
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
            info.busi_flag = unpacker.GetInt("busi_flag");
            info.occur_qty = unpacker.GetDouble("occur_qty");
            info.occur_end_qty = unpacker.GetDouble("occur_end_qty");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pdfofuL_3_31_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_3_31_InfoList.Add((pdfofuL_3_31_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_持仓_查询交易组持仓流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdfofuL_3_31_Info();
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
                    info.busi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT);
                    info.occur_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_QTY_FLOAT);
                    info.occur_end_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_END_QTY_FLOAT);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pdfofuL_3_31_InfoList.Add(info);
                }
            }
        }
    }

    public class pdfofuL_3_32_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_3_32_Response()
        {
            this.pdfofuL_3_32_InfoList = new ObservableCollection<pdfofuL_3_32_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_3_32_Info> pdfofuL_3_32_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_3_32_Info info = new pdfofuL_3_32_Info();
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
            info.busi_flag = unpacker.GetInt("busi_flag");
            info.occur_qty = unpacker.GetDouble("occur_qty");
            info.occur_end_qty = unpacker.GetDouble("occur_end_qty");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pdfofuL_3_32_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_3_32_InfoList.Add((pdfofuL_3_32_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_持仓_查询历史交易组持仓流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdfofuL_3_32_Info();
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
                    info.busi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT);
                    info.occur_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_QTY_FLOAT);
                    info.occur_end_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_END_QTY_FLOAT);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pdfofuL_3_32_InfoList.Add(info);
                }
            }
        }
    }

    public class pdfofuL_3_34_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_3_34_Response()
        {
            this.pdfofuL_3_34_InfoList = new ObservableCollection<pdfofuL_3_34_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_3_34_Info> pdfofuL_3_34_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_3_34_Info info = new pdfofuL_3_34_Info();
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
            info.frozen_type = unpacker.GetInt("frozen_type");
            info.occur_qty = unpacker.GetDouble("occur_qty");
            info.expire_date = unpacker.GetInt("expire_date");
            info.jour_status = unpacker.GetStr("jour_status");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pdfofuL_3_34_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_3_34_InfoList.Add((pdfofuL_3_34_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_持仓_查询交易组持仓冻结解冻流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdfofuL_3_34_Info();
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
                    info.frozen_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_TYPE_INT);
                    info.occur_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_QTY_FLOAT);
                    info.expire_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXPIRE_DATE_INT);
                    info.jour_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_STATUS_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pdfofuL_3_34_InfoList.Add(info);
                }
            }
        }
    }

    public class pdfofuL_3_35_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_3_35_Response()
        {
            this.pdfofuL_3_35_InfoList = new ObservableCollection<pdfofuL_3_35_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_3_35_Info> pdfofuL_3_35_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_3_35_Info info = new pdfofuL_3_35_Info();
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
            info.frozen_type = unpacker.GetInt("frozen_type");
            info.occur_qty = unpacker.GetDouble("occur_qty");
            info.expire_date = unpacker.GetInt("expire_date");
            info.jour_status = unpacker.GetStr("jour_status");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pdfofuL_3_35_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_3_35_InfoList.Add((pdfofuL_3_35_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_持仓_查询历史交易组持仓冻结解冻流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdfofuL_3_35_Info();
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
                    info.frozen_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_TYPE_INT);
                    info.occur_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_QTY_FLOAT);
                    info.expire_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXPIRE_DATE_INT);
                    info.jour_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_STATUS_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pdfofuL_3_35_InfoList.Add(info);
                }
            }
        }
    }

    public class pdfofuL_3_51_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_3_51_Response()
        {
            this.pdfofuL_3_51_InfoList = new ObservableCollection<pdfofuL_3_51_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_3_51_Info> pdfofuL_3_51_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_3_51_Info info = new pdfofuL_3_51_Info();
            pdfofuL_3_51_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_3_51_InfoList.Add((pdfofuL_3_51_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_持仓_红冲蓝补资产账户持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfofuL_3_51_Info();
                pdfofuL_3_51_InfoList.Add(info);
            }
        }
    }

    public class pdfofuL_3_52_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_3_52_Response()
        {
            this.pdfofuL_3_52_InfoList = new ObservableCollection<pdfofuL_3_52_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_3_52_Info> pdfofuL_3_52_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_3_52_Info info = new pdfofuL_3_52_Info();
            pdfofuL_3_52_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_3_52_InfoList.Add((pdfofuL_3_52_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_持仓_冻结资产账户持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfofuL_3_52_Info();
                pdfofuL_3_52_InfoList.Add(info);
            }
        }
    }

    public class pdfofuL_3_53_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_3_53_Response()
        {
            this.pdfofuL_3_53_InfoList = new ObservableCollection<pdfofuL_3_53_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_3_53_Info> pdfofuL_3_53_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_3_53_Info info = new pdfofuL_3_53_Info();
            pdfofuL_3_53_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_3_53_InfoList.Add((pdfofuL_3_53_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_持仓_取消冻结资产账户持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfofuL_3_53_Info();
                pdfofuL_3_53_InfoList.Add(info);
            }
        }
    }

    public class pdfofuL_3_54_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_3_54_Response()
        {
            this.pdfofuL_3_54_InfoList = new ObservableCollection<pdfofuL_3_54_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_3_54_Info> pdfofuL_3_54_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_3_54_Info info = new pdfofuL_3_54_Info();
            pdfofuL_3_54_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_3_54_InfoList.Add((pdfofuL_3_54_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_持仓_解冻资产账户持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfofuL_3_54_Info();
                pdfofuL_3_54_InfoList.Add(info);
            }
        }
    }

    public class pdfofuL_3_55_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_3_55_Response()
        {
            this.pdfofuL_3_55_InfoList = new ObservableCollection<pdfofuL_3_55_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_3_55_Info> pdfofuL_3_55_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_3_55_Info info = new pdfofuL_3_55_Info();
            pdfofuL_3_55_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_3_55_InfoList.Add((pdfofuL_3_55_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_持仓_取消解冻资产账户持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfofuL_3_55_Info();
                pdfofuL_3_55_InfoList.Add(info);
            }
        }
    }

    public class pdfofuL_3_71_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_3_71_Response()
        {
            this.pdfofuL_3_71_InfoList = new ObservableCollection<pdfofuL_3_71_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_3_71_Info> pdfofuL_3_71_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_3_71_Info info = new pdfofuL_3_71_Info();
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
            info.contrc_unit = unpacker.GetInt("contrc_unit");
            info.begin_qty = unpacker.GetDouble("begin_qty");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.frozen_qty = unpacker.GetDouble("frozen_qty");
            info.unfroz_qty = unpacker.GetDouble("unfroz_qty");
            info.sett_price = unpacker.GetDouble("sett_price");
            info.rece_margin = unpacker.GetDouble("rece_margin");
            info.realize_pandl = unpacker.GetDouble("realize_pandl");
            pdfofuL_3_71_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_3_71_InfoList.Add((pdfofuL_3_71_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_持仓_查询资产账户持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdfofuL_3_71_Info();
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
                    info.contrc_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_UNIT_INT);
                    info.begin_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_QTY_FLOAT);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_QTY_FLOAT);
                    info.unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_QTY_FLOAT);
                    info.sett_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SETT_PRICE_FLOAT);
                    info.rece_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RECE_MARGIN_FLOAT);
                    info.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    pdfofuL_3_71_InfoList.Add(info);
                }
            }
        }
    }

    public class pdfofuL_3_72_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_3_72_Response()
        {
            this.pdfofuL_3_72_InfoList = new ObservableCollection<pdfofuL_3_72_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_3_72_Info> pdfofuL_3_72_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_3_72_Info info = new pdfofuL_3_72_Info();
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
            info.contrc_unit = unpacker.GetInt("contrc_unit");
            info.begin_qty = unpacker.GetDouble("begin_qty");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.frozen_qty = unpacker.GetDouble("frozen_qty");
            info.unfroz_qty = unpacker.GetDouble("unfroz_qty");
            info.sett_price = unpacker.GetDouble("sett_price");
            info.rece_margin = unpacker.GetDouble("rece_margin");
            info.realize_pandl = unpacker.GetDouble("realize_pandl");
            pdfofuL_3_72_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_3_72_InfoList.Add((pdfofuL_3_72_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_持仓_查询历史资产账户持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdfofuL_3_72_Info();
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
                    info.contrc_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_UNIT_INT);
                    info.begin_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_QTY_FLOAT);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_QTY_FLOAT);
                    info.unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_QTY_FLOAT);
                    info.sett_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SETT_PRICE_FLOAT);
                    info.rece_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RECE_MARGIN_FLOAT);
                    info.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    pdfofuL_3_72_InfoList.Add(info);
                }
            }
        }
    }

    public class pdfofuL_3_81_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_3_81_Response()
        {
            this.pdfofuL_3_81_InfoList = new ObservableCollection<pdfofuL_3_81_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_3_81_Info> pdfofuL_3_81_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_3_81_Info info = new pdfofuL_3_81_Info();
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
            info.busi_flag = unpacker.GetInt("busi_flag");
            info.occur_qty = unpacker.GetDouble("occur_qty");
            info.occur_end_qty = unpacker.GetDouble("occur_end_qty");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pdfofuL_3_81_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_3_81_InfoList.Add((pdfofuL_3_81_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_持仓_查询资产账户持仓流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdfofuL_3_81_Info();
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
                    info.busi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT);
                    info.occur_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_QTY_FLOAT);
                    info.occur_end_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_END_QTY_FLOAT);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pdfofuL_3_81_InfoList.Add(info);
                }
            }
        }
    }

    public class pdfofuL_3_82_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_3_82_Response()
        {
            this.pdfofuL_3_82_InfoList = new ObservableCollection<pdfofuL_3_82_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_3_82_Info> pdfofuL_3_82_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_3_82_Info info = new pdfofuL_3_82_Info();
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
            info.busi_flag = unpacker.GetInt("busi_flag");
            info.occur_qty = unpacker.GetDouble("occur_qty");
            info.occur_end_qty = unpacker.GetDouble("occur_end_qty");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pdfofuL_3_82_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_3_82_InfoList.Add((pdfofuL_3_82_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_持仓_查询历史资产账户持仓流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdfofuL_3_82_Info();
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
                    info.busi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT);
                    info.occur_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_QTY_FLOAT);
                    info.occur_end_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_END_QTY_FLOAT);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pdfofuL_3_82_InfoList.Add(info);
                }
            }
        }
    }

    public class pdfofuL_3_84_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_3_84_Response()
        {
            this.pdfofuL_3_84_InfoList = new ObservableCollection<pdfofuL_3_84_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_3_84_Info> pdfofuL_3_84_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_3_84_Info info = new pdfofuL_3_84_Info();
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
            info.frozen_type = unpacker.GetInt("frozen_type");
            info.occur_qty = unpacker.GetDouble("occur_qty");
            info.expire_date = unpacker.GetInt("expire_date");
            info.jour_status = unpacker.GetStr("jour_status");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pdfofuL_3_84_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_3_84_InfoList.Add((pdfofuL_3_84_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_持仓_查询资产账户持仓冻结解冻流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdfofuL_3_84_Info();
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
                    info.frozen_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_TYPE_INT);
                    info.occur_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_QTY_FLOAT);
                    info.expire_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXPIRE_DATE_INT);
                    info.jour_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_STATUS_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pdfofuL_3_84_InfoList.Add(info);
                }
            }
        }
    }

    public class pdfofuL_3_85_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_3_85_Response()
        {
            this.pdfofuL_3_85_InfoList = new ObservableCollection<pdfofuL_3_85_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_3_85_Info> pdfofuL_3_85_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_3_85_Info info = new pdfofuL_3_85_Info();
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
            info.frozen_type = unpacker.GetInt("frozen_type");
            info.occur_qty = unpacker.GetDouble("occur_qty");
            info.expire_date = unpacker.GetInt("expire_date");
            info.jour_status = unpacker.GetStr("jour_status");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pdfofuL_3_85_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_3_85_InfoList.Add((pdfofuL_3_85_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_持仓_查询历史资产账户持仓冻结解冻流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdfofuL_3_85_Info();
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
                    info.frozen_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_TYPE_INT);
                    info.occur_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_QTY_FLOAT);
                    info.expire_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXPIRE_DATE_INT);
                    info.jour_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_STATUS_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pdfofuL_3_85_InfoList.Add(info);
                }
            }
        }
    }

    public class pdfofuL_3_101_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_3_101_Response()
        {
            this.pdfofuL_3_101_InfoList = new ObservableCollection<pdfofuL_3_101_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_3_101_Info> pdfofuL_3_101_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_3_101_Info info = new pdfofuL_3_101_Info();
            pdfofuL_3_101_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_3_101_InfoList.Add((pdfofuL_3_101_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_持仓_转入外部持仓流水记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfofuL_3_101_Info();
                pdfofuL_3_101_InfoList.Add(info);
            }
        }
    }

    public class pdfofuL_3_105_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_3_105_Response()
        {
            this.pdfofuL_3_105_InfoList = new ObservableCollection<pdfofuL_3_105_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_3_105_Info> pdfofuL_3_105_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_3_105_Info info = new pdfofuL_3_105_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.exch_no = unpacker.GetInt("exch_no");
            info.futu_acco = unpacker.GetStr("futu_acco");
            info.contrc_code = unpacker.GetStr("contrc_code");
            info.pass_stock_jour_no = unpacker.GetInt("pass_stock_jour_no");
            info.busi_flag = unpacker.GetInt("busi_flag");
            info.sett_price = unpacker.GetDouble("sett_price");
            info.entry_qty = unpacker.GetDouble("entry_qty");
            info.entry_end_qty = unpacker.GetDouble("entry_end_qty");
            info.remark_info = unpacker.GetStr("remark_info");
            info.deal_flag = unpacker.GetInt("deal_flag");
            pdfofuL_3_105_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_3_105_InfoList.Add((pdfofuL_3_105_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_持仓_查询外部持仓流水记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdfofuL_3_105_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.futu_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_STR);
                    info.contrc_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR);
                    info.pass_stock_jour_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_STOCK_JOUR_NO_INT);
                    info.busi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT);
                    info.sett_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SETT_PRICE_FLOAT);
                    info.entry_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_QTY_FLOAT);
                    info.entry_end_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_END_QTY_FLOAT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    info.deal_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_FLAG_INT);
                    pdfofuL_3_105_InfoList.Add(info);
                }
            }
        }
    }

    public class pdfofuL_3_111_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_3_111_Response()
        {
            this.pdfofuL_3_111_InfoList = new ObservableCollection<pdfofuL_3_111_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_3_111_Info> pdfofuL_3_111_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_3_111_Info info = new pdfofuL_3_111_Info();
            pdfofuL_3_111_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_3_111_InfoList.Add((pdfofuL_3_111_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_持仓_转入外部订单记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfofuL_3_111_Info();
                pdfofuL_3_111_InfoList.Add(info);
            }
        }
    }

    public class pdfofuL_3_115_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_3_115_Response()
        {
            this.pdfofuL_3_115_InfoList = new ObservableCollection<pdfofuL_3_115_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_3_115_Info> pdfofuL_3_115_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_3_115_Info info = new pdfofuL_3_115_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.exch_no = unpacker.GetInt("exch_no");
            info.futu_acco = unpacker.GetStr("futu_acco");
            info.contrc_code = unpacker.GetStr("contrc_code");
            info.report_date = unpacker.GetInt("report_date");
            info.report_time = unpacker.GetInt("report_time");
            info.report_no = unpacker.GetStr("report_no");
            info.order_dir = unpacker.GetInt("order_dir");
            info.order_price = unpacker.GetDouble("order_price");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.strike_price = unpacker.GetDouble("strike_price");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            pdfofuL_3_115_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_3_115_InfoList.Add((pdfofuL_3_115_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_持仓_查询外部订单记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdfofuL_3_115_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.futu_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_STR);
                    info.contrc_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR);
                    info.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                    info.report_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_TIME_INT);
                    info.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    info.strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_PRICE_FLOAT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    pdfofuL_3_115_InfoList.Add(info);
                }
            }
        }
    }

    public class pdfofuL_3_121_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_3_121_Response()
        {
            this.pdfofuL_3_121_InfoList = new ObservableCollection<pdfofuL_3_121_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_3_121_Info> pdfofuL_3_121_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_3_121_Info info = new pdfofuL_3_121_Info();
            pdfofuL_3_121_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_3_121_InfoList.Add((pdfofuL_3_121_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_持仓_转入外部成交记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfofuL_3_121_Info();
                pdfofuL_3_121_InfoList.Add(info);
            }
        }
    }

    public class pdfofuL_3_125_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_3_125_Response()
        {
            this.pdfofuL_3_125_InfoList = new ObservableCollection<pdfofuL_3_125_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_3_125_Info> pdfofuL_3_125_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_3_125_Info info = new pdfofuL_3_125_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.exch_no = unpacker.GetInt("exch_no");
            info.futu_acco = unpacker.GetStr("futu_acco");
            info.contrc_code = unpacker.GetStr("contrc_code");
            info.strike_date = unpacker.GetInt("strike_date");
            info.strike_time = unpacker.GetInt("strike_time");
            info.strike_no = unpacker.GetStr("strike_no");
            info.report_date = unpacker.GetInt("report_date");
            info.report_time = unpacker.GetInt("report_time");
            info.report_no = unpacker.GetStr("report_no");
            info.order_dir = unpacker.GetInt("order_dir");
            info.strike_price = unpacker.GetDouble("strike_price");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.match_status = unpacker.GetStr("match_status");
            info.deal_flag = unpacker.GetInt("deal_flag");
            pdfofuL_3_125_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_3_125_InfoList.Add((pdfofuL_3_125_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_持仓_查询外部成交记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdfofuL_3_125_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.futu_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_STR);
                    info.contrc_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR);
                    info.strike_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT);
                    info.strike_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_TIME_INT);
                    info.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                    info.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                    info.report_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_TIME_INT);
                    info.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_PRICE_FLOAT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    info.match_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MATCH_STATUS_STR);
                    info.deal_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_FLAG_INT);
                    pdfofuL_3_125_InfoList.Add(info);
                }
            }
        }
    }

    public class pdfofuL_3_131_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_3_131_Response()
        {
            this.pdfofuL_3_131_InfoList = new ObservableCollection<pdfofuL_3_131_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_3_131_Info> pdfofuL_3_131_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_3_131_Info info = new pdfofuL_3_131_Info();
            pdfofuL_3_131_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_3_131_InfoList.Add((pdfofuL_3_131_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_持仓_转入外部交割流水记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfofuL_3_131_Info();
                pdfofuL_3_131_InfoList.Add(info);
            }
        }
    }

    public class pdfofuL_3_135_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_3_135_Response()
        {
            this.pdfofuL_3_135_InfoList = new ObservableCollection<pdfofuL_3_135_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_3_135_Info> pdfofuL_3_135_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_3_135_Info info = new pdfofuL_3_135_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.exch_no = unpacker.GetInt("exch_no");
            info.futu_acco = unpacker.GetStr("futu_acco");
            info.contrc_code = unpacker.GetStr("contrc_code");
            info.pass_deli_jour_no = unpacker.GetInt64("pass_deli_jour_no");
            info.strike_date = unpacker.GetInt("strike_date");
            info.strike_time = unpacker.GetInt("strike_time");
            info.strike_no = unpacker.GetStr("strike_no");
            info.report_date = unpacker.GetInt("report_date");
            info.report_time = unpacker.GetInt("report_time");
            info.report_no = unpacker.GetStr("report_no");
            info.order_dir = unpacker.GetInt("order_dir");
            info.order_price = unpacker.GetDouble("order_price");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.sett_price = unpacker.GetDouble("sett_price");
            info.strike_price = unpacker.GetDouble("strike_price");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.strike_num = unpacker.GetInt("strike_num");
            info.entry_end_qty = unpacker.GetDouble("entry_end_qty");
            info.entry_end_amt = unpacker.GetDouble("entry_end_amt");
            info.rece_margin = unpacker.GetDouble("rece_margin");
            info.out_all_fee = unpacker.GetDouble("out_all_fee");
            info.out_report_fee = unpacker.GetDouble("out_report_fee");
            info.out_cancel_fee = unpacker.GetDouble("out_cancel_fee");
            info.out_deli_fee = unpacker.GetDouble("out_deli_fee");
            info.out_other_fee = unpacker.GetDouble("out_other_fee");
            info.out_brkage_commis = unpacker.GetDouble("out_brkage_commis");
            info.out_other_commis = unpacker.GetDouble("out_other_commis");
            info.busi_flag = unpacker.GetInt("busi_flag");
            info.remark_info = unpacker.GetStr("remark_info");
            pdfofuL_3_135_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_3_135_InfoList.Add((pdfofuL_3_135_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_持仓_查询外部交割流水记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdfofuL_3_135_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.futu_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_STR);
                    info.contrc_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR);
                    info.pass_deli_jour_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_PASS_DELI_JOUR_NO_INT64);
                    info.strike_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT);
                    info.strike_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_TIME_INT);
                    info.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                    info.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                    info.report_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_TIME_INT);
                    info.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    info.sett_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SETT_PRICE_FLOAT);
                    info.strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_PRICE_FLOAT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    info.strike_num = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NUM_INT);
                    info.entry_end_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_END_QTY_FLOAT);
                    info.entry_end_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_END_AMT_FLOAT);
                    info.rece_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RECE_MARGIN_FLOAT);
                    info.out_all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ALL_FEE_FLOAT);
                    info.out_report_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_REPORT_FEE_FLOAT);
                    info.out_cancel_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_CANCEL_FEE_FLOAT);
                    info.out_deli_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_DELI_FEE_FLOAT);
                    info.out_other_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_OTHER_FEE_FLOAT);
                    info.out_brkage_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_BRKAGE_COMMIS_FLOAT);
                    info.out_other_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_OTHER_COMMIS_FLOAT);
                    info.busi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    pdfofuL_3_135_InfoList.Add(info);
                }
            }
        }
    }

    public class pdfofuL_3_145_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_3_145_Response()
        {
            this.pdfofuL_3_145_InfoList = new ObservableCollection<pdfofuL_3_145_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_3_145_Info> pdfofuL_3_145_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_3_145_Info info = new pdfofuL_3_145_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.exch_no = unpacker.GetInt("exch_no");
            info.futu_acco_no = unpacker.GetInt("futu_acco_no");
            info.contrc_code_no = unpacker.GetInt("contrc_code_no");
            info.contrc_type = unpacker.GetInt("contrc_type");
            info.entry_jour_no = unpacker.GetInt64("entry_jour_no");
            info.strike_date = unpacker.GetInt("strike_date");
            info.strike_time = unpacker.GetInt("strike_time");
            info.strike_no = unpacker.GetStr("strike_no");
            info.report_date = unpacker.GetInt("report_date");
            info.report_time = unpacker.GetInt("report_time");
            info.report_no = unpacker.GetStr("report_no");
            info.order_date = unpacker.GetInt("order_date");
            info.order_time = unpacker.GetInt("order_time");
            info.order_no = unpacker.GetInt("order_no");
            info.order_dir = unpacker.GetInt("order_dir");
            info.order_price = unpacker.GetDouble("order_price");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.sett_price = unpacker.GetDouble("sett_price");
            info.strike_price = unpacker.GetDouble("strike_price");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.strike_num = unpacker.GetInt("strike_num");
            info.entry_qty = unpacker.GetDouble("entry_qty");
            info.entry_amt = unpacker.GetDouble("entry_amt");
            info.rece_margin = unpacker.GetDouble("rece_margin");
            info.all_fee = unpacker.GetDouble("all_fee");
            info.report_fee = unpacker.GetDouble("report_fee");
            info.wtdraw_fee = unpacker.GetDouble("wtdraw_fee");
            info.deli_fee = unpacker.GetDouble("deli_fee");
            info.other_fee = unpacker.GetDouble("other_fee");
            info.trade_commis = unpacker.GetDouble("trade_commis");
            info.other_commis = unpacker.GetDouble("other_commis");
            info.out_all_fee = unpacker.GetDouble("out_all_fee");
            info.out_report_fee = unpacker.GetDouble("out_report_fee");
            info.out_cancel_fee = unpacker.GetDouble("out_cancel_fee");
            info.out_deli_fee = unpacker.GetDouble("out_deli_fee");
            info.out_other_fee = unpacker.GetDouble("out_other_fee");
            info.out_brkage_commis = unpacker.GetDouble("out_brkage_commis");
            info.out_other_commis = unpacker.GetDouble("out_other_commis");
            info.busi_flag = unpacker.GetInt("busi_flag");
            info.deli_status = unpacker.GetStr("deli_status");
            info.remark_info = unpacker.GetStr("remark_info");
            pdfofuL_3_145_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_3_145_InfoList.Add((pdfofuL_3_145_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_持仓_查询对账记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdfofuL_3_145_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.futu_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT);
                    info.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    info.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    info.entry_jour_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_JOUR_NO_INT64);
                    info.strike_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT);
                    info.strike_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_TIME_INT);
                    info.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                    info.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                    info.report_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_TIME_INT);
                    info.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    info.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    info.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                    info.order_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_NO_INT);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    info.sett_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SETT_PRICE_FLOAT);
                    info.strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_PRICE_FLOAT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    info.strike_num = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NUM_INT);
                    info.entry_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_QTY_FLOAT);
                    info.entry_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_AMT_FLOAT);
                    info.rece_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RECE_MARGIN_FLOAT);
                    info.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                    info.report_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_FEE_FLOAT);
                    info.wtdraw_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_FEE_FLOAT);
                    info.deli_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DELI_FEE_FLOAT);
                    info.other_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_FEE_FLOAT);
                    info.trade_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_COMMIS_FLOAT);
                    info.other_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_COMMIS_FLOAT);
                    info.out_all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ALL_FEE_FLOAT);
                    info.out_report_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_REPORT_FEE_FLOAT);
                    info.out_cancel_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_CANCEL_FEE_FLOAT);
                    info.out_deli_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_DELI_FEE_FLOAT);
                    info.out_other_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_OTHER_FEE_FLOAT);
                    info.out_brkage_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_BRKAGE_COMMIS_FLOAT);
                    info.out_other_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_OTHER_COMMIS_FLOAT);
                    info.busi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT);
                    info.deli_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DELI_STATUS_STR);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    pdfofuL_3_145_InfoList.Add(info);
                }
            }
        }
    }

    public class pdfofuL_3_146_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_3_146_Response()
        {
            this.pdfofuL_3_146_InfoList = new ObservableCollection<pdfofuL_3_146_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_3_146_Info> pdfofuL_3_146_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_3_146_Info info = new pdfofuL_3_146_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.exch_no = unpacker.GetInt("exch_no");
            info.futu_acco_no = unpacker.GetInt("futu_acco_no");
            info.contrc_code_no = unpacker.GetInt("contrc_code_no");
            info.contrc_type = unpacker.GetInt("contrc_type");
            info.entry_jour_no = unpacker.GetInt64("entry_jour_no");
            info.strike_date = unpacker.GetInt("strike_date");
            info.strike_time = unpacker.GetInt("strike_time");
            info.strike_no = unpacker.GetStr("strike_no");
            info.report_date = unpacker.GetInt("report_date");
            info.report_time = unpacker.GetInt("report_time");
            info.report_no = unpacker.GetStr("report_no");
            info.order_date = unpacker.GetInt("order_date");
            info.order_time = unpacker.GetInt("order_time");
            info.order_no = unpacker.GetInt("order_no");
            info.order_dir = unpacker.GetInt("order_dir");
            info.order_price = unpacker.GetDouble("order_price");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.sett_price = unpacker.GetDouble("sett_price");
            info.strike_price = unpacker.GetDouble("strike_price");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.strike_num = unpacker.GetInt("strike_num");
            info.entry_qty = unpacker.GetDouble("entry_qty");
            info.entry_amt = unpacker.GetDouble("entry_amt");
            info.rece_margin = unpacker.GetDouble("rece_margin");
            info.all_fee = unpacker.GetDouble("all_fee");
            info.report_fee = unpacker.GetDouble("report_fee");
            info.wtdraw_fee = unpacker.GetDouble("wtdraw_fee");
            info.deli_fee = unpacker.GetDouble("deli_fee");
            info.other_fee = unpacker.GetDouble("other_fee");
            info.trade_commis = unpacker.GetDouble("trade_commis");
            info.other_commis = unpacker.GetDouble("other_commis");
            info.out_all_fee = unpacker.GetDouble("out_all_fee");
            info.out_report_fee = unpacker.GetDouble("out_report_fee");
            info.out_cancel_fee = unpacker.GetDouble("out_cancel_fee");
            info.out_deli_fee = unpacker.GetDouble("out_deli_fee");
            info.out_other_fee = unpacker.GetDouble("out_other_fee");
            info.out_brkage_commis = unpacker.GetDouble("out_brkage_commis");
            info.out_other_commis = unpacker.GetDouble("out_other_commis");
            info.busi_flag = unpacker.GetInt("busi_flag");
            info.deli_status = unpacker.GetStr("deli_status");
            info.remark_info = unpacker.GetStr("remark_info");
            pdfofuL_3_146_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_3_146_InfoList.Add((pdfofuL_3_146_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_持仓_查询历史对账记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdfofuL_3_146_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.futu_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT);
                    info.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    info.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    info.entry_jour_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_JOUR_NO_INT64);
                    info.strike_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT);
                    info.strike_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_TIME_INT);
                    info.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                    info.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                    info.report_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_TIME_INT);
                    info.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    info.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    info.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                    info.order_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_NO_INT);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    info.sett_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SETT_PRICE_FLOAT);
                    info.strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_PRICE_FLOAT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    info.strike_num = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NUM_INT);
                    info.entry_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_QTY_FLOAT);
                    info.entry_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_AMT_FLOAT);
                    info.rece_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RECE_MARGIN_FLOAT);
                    info.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                    info.report_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_FEE_FLOAT);
                    info.wtdraw_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_FEE_FLOAT);
                    info.deli_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DELI_FEE_FLOAT);
                    info.other_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_FEE_FLOAT);
                    info.trade_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_COMMIS_FLOAT);
                    info.other_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_COMMIS_FLOAT);
                    info.out_all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ALL_FEE_FLOAT);
                    info.out_report_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_REPORT_FEE_FLOAT);
                    info.out_cancel_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_CANCEL_FEE_FLOAT);
                    info.out_deli_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_DELI_FEE_FLOAT);
                    info.out_other_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_OTHER_FEE_FLOAT);
                    info.out_brkage_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_BRKAGE_COMMIS_FLOAT);
                    info.out_other_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_OTHER_COMMIS_FLOAT);
                    info.busi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT);
                    info.deli_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DELI_STATUS_STR);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    pdfofuL_3_146_InfoList.Add(info);
                }
            }
        }
    }

}
