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
    public class pdfofuL_2_8_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_2_8_Response()
        {
            this.pdfofuL_2_8_InfoList = new ObservableCollection<pdfofuL_2_8_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_2_8_Info> pdfofuL_2_8_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_2_8_Info info = new pdfofuL_2_8_Info();
            pdfofuL_2_8_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_2_8_InfoList.Add((pdfofuL_2_8_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_资金_分配产品资金
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfofuL_2_8_Info();
                pdfofuL_2_8_InfoList.Add(info);
            }
        }
    }

    public class pdfofuL_2_9_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_2_9_Response()
        {
            this.pdfofuL_2_9_InfoList = new ObservableCollection<pdfofuL_2_9_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_2_9_Info> pdfofuL_2_9_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_2_9_Info info = new pdfofuL_2_9_Info();
            pdfofuL_2_9_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_2_9_InfoList.Add((pdfofuL_2_9_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_资金_回收产品资金
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfofuL_2_9_Info();
                pdfofuL_2_9_InfoList.Add(info);
            }
        }
    }

    public class pdfofuL_2_10_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_2_10_Response()
        {
            this.pdfofuL_2_10_InfoList = new ObservableCollection<pdfofuL_2_10_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_2_10_Info> pdfofuL_2_10_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_2_10_Info info = new pdfofuL_2_10_Info();
            pdfofuL_2_10_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_2_10_InfoList.Add((pdfofuL_2_10_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_资金_授权产品资金
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfofuL_2_10_Info();
                pdfofuL_2_10_InfoList.Add(info);
            }
        }
    }

    public class pdfofuL_2_11_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_2_11_Response()
        {
            this.pdfofuL_2_11_InfoList = new ObservableCollection<pdfofuL_2_11_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_2_11_Info> pdfofuL_2_11_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_2_11_Info info = new pdfofuL_2_11_Info();
            pdfofuL_2_11_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_2_11_InfoList.Add((pdfofuL_2_11_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_资金_回收授权产品资金
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfofuL_2_11_Info();
                pdfofuL_2_11_InfoList.Add(info);
            }
        }
    }

    public class pdfofuL_2_32_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_2_32_Response()
        {
            this.pdfofuL_2_32_InfoList = new ObservableCollection<pdfofuL_2_32_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_2_32_Info> pdfofuL_2_32_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_2_32_Info info = new pdfofuL_2_32_Info();
            pdfofuL_2_32_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_2_32_InfoList.Add((pdfofuL_2_32_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_资金_冻结交易组资金
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfofuL_2_32_Info();
                pdfofuL_2_32_InfoList.Add(info);
            }
        }
    }

    public class pdfofuL_2_33_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_2_33_Response()
        {
            this.pdfofuL_2_33_InfoList = new ObservableCollection<pdfofuL_2_33_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_2_33_Info> pdfofuL_2_33_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_2_33_Info info = new pdfofuL_2_33_Info();
            pdfofuL_2_33_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_2_33_InfoList.Add((pdfofuL_2_33_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_资金_取消冻结交易组资金
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfofuL_2_33_Info();
                pdfofuL_2_33_InfoList.Add(info);
            }
        }
    }

    public class pdfofuL_2_34_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_2_34_Response()
        {
            this.pdfofuL_2_34_InfoList = new ObservableCollection<pdfofuL_2_34_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_2_34_Info> pdfofuL_2_34_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_2_34_Info info = new pdfofuL_2_34_Info();
            pdfofuL_2_34_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_2_34_InfoList.Add((pdfofuL_2_34_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_资金_解冻交易组资金
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfofuL_2_34_Info();
                pdfofuL_2_34_InfoList.Add(info);
            }
        }
    }

    public class pdfofuL_2_35_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_2_35_Response()
        {
            this.pdfofuL_2_35_InfoList = new ObservableCollection<pdfofuL_2_35_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_2_35_Info> pdfofuL_2_35_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_2_35_Info info = new pdfofuL_2_35_Info();
            pdfofuL_2_35_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_2_35_InfoList.Add((pdfofuL_2_35_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_资金_取消解冻交易组资金
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfofuL_2_35_Info();
                pdfofuL_2_35_InfoList.Add(info);
            }
        }
    }

    public class pdfofuL_2_36_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_2_36_Response()
        {
            this.pdfofuL_2_36_InfoList = new ObservableCollection<pdfofuL_2_36_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_2_36_Info> pdfofuL_2_36_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_2_36_Info info = new pdfofuL_2_36_Info();
            pdfofuL_2_36_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_2_36_InfoList.Add((pdfofuL_2_36_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_资金_修改交易组资金
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfofuL_2_36_Info();
                pdfofuL_2_36_InfoList.Add(info);
            }
        }
    }

    public class pdfofuL_2_37_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_2_37_Response()
        {
            this.pdfofuL_2_37_InfoList = new ObservableCollection<pdfofuL_2_37_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_2_37_Info> pdfofuL_2_37_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_2_37_Info info = new pdfofuL_2_37_Info();
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
            info.curr_amt = unpacker.GetDouble("curr_amt");
            info.capt_margin = unpacker.GetDouble("capt_margin");
            info.close_pandl = unpacker.GetDouble("close_pandl");
            info.marked_pandl = unpacker.GetDouble("marked_pandl");
            info.frozen_amt = unpacker.GetDouble("frozen_amt");
            info.unfroz_amt = unpacker.GetDouble("unfroz_amt");
            info.total_rece_amt = unpacker.GetDouble("total_rece_amt");
            info.total_payab_amt = unpacker.GetDouble("total_payab_amt");
            info.intrst_rate = unpacker.GetDouble("intrst_rate");
            info.intrst_base_amt = unpacker.GetDouble("intrst_base_amt");
            info.pre_entry_intrst_amt = unpacker.GetDouble("pre_entry_intrst_amt");
            pdfofuL_2_37_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_2_37_InfoList.Add((pdfofuL_2_37_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_资金_查询交易组资金
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdfofuL_2_37_Info();
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
                    info.curr_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_AMT_FLOAT);
                    info.capt_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CAPT_MARGIN_FLOAT);
                    info.close_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_PANDL_FLOAT);
                    info.marked_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKED_PANDL_FLOAT);
                    info.frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_AMT_FLOAT);
                    info.unfroz_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_AMT_FLOAT);
                    info.total_rece_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_RECE_AMT_FLOAT);
                    info.total_payab_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_PAYAB_AMT_FLOAT);
                    info.intrst_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_RATE_FLOAT);
                    info.intrst_base_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_BASE_AMT_FLOAT);
                    info.pre_entry_intrst_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ENTRY_INTRST_AMT_FLOAT);
                    pdfofuL_2_37_InfoList.Add(info);
                }
            }
        }
    }

    public class pdfofuL_2_38_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_2_38_Response()
        {
            this.pdfofuL_2_38_InfoList = new ObservableCollection<pdfofuL_2_38_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_2_38_Info> pdfofuL_2_38_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_2_38_Info info = new pdfofuL_2_38_Info();
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
            info.curr_amt = unpacker.GetDouble("curr_amt");
            info.capt_margin = unpacker.GetDouble("capt_margin");
            info.close_pandl = unpacker.GetDouble("close_pandl");
            info.marked_pandl = unpacker.GetDouble("marked_pandl");
            info.frozen_amt = unpacker.GetDouble("frozen_amt");
            info.unfroz_amt = unpacker.GetDouble("unfroz_amt");
            info.total_rece_amt = unpacker.GetDouble("total_rece_amt");
            info.total_payab_amt = unpacker.GetDouble("total_payab_amt");
            info.intrst_rate = unpacker.GetDouble("intrst_rate");
            info.intrst_base_amt = unpacker.GetDouble("intrst_base_amt");
            info.pre_entry_intrst_amt = unpacker.GetDouble("pre_entry_intrst_amt");
            pdfofuL_2_38_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_2_38_InfoList.Add((pdfofuL_2_38_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_资金_查询历史交易组资金
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdfofuL_2_38_Info();
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
                    info.curr_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_AMT_FLOAT);
                    info.capt_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CAPT_MARGIN_FLOAT);
                    info.close_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_PANDL_FLOAT);
                    info.marked_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKED_PANDL_FLOAT);
                    info.frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_AMT_FLOAT);
                    info.unfroz_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_AMT_FLOAT);
                    info.total_rece_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_RECE_AMT_FLOAT);
                    info.total_payab_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_PAYAB_AMT_FLOAT);
                    info.intrst_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_RATE_FLOAT);
                    info.intrst_base_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_BASE_AMT_FLOAT);
                    info.pre_entry_intrst_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ENTRY_INTRST_AMT_FLOAT);
                    pdfofuL_2_38_InfoList.Add(info);
                }
            }
        }
    }

    public class pdfofuL_2_39_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_2_39_Response()
        {
            this.pdfofuL_2_39_InfoList = new ObservableCollection<pdfofuL_2_39_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_2_39_Info> pdfofuL_2_39_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_2_39_Info info = new pdfofuL_2_39_Info();
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
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.busi_flag = unpacker.GetInt("busi_flag");
            info.occur_amt = unpacker.GetDouble("occur_amt");
            info.occur_end_amt = unpacker.GetDouble("occur_end_amt");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pdfofuL_2_39_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_2_39_InfoList.Add((pdfofuL_2_39_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_资金_查询交易组资金流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdfofuL_2_39_Info();
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
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.busi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT);
                    info.occur_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_AMT_FLOAT);
                    info.occur_end_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_END_AMT_FLOAT);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pdfofuL_2_39_InfoList.Add(info);
                }
            }
        }
    }

    public class pdfofuL_2_40_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_2_40_Response()
        {
            this.pdfofuL_2_40_InfoList = new ObservableCollection<pdfofuL_2_40_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_2_40_Info> pdfofuL_2_40_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_2_40_Info info = new pdfofuL_2_40_Info();
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
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.busi_flag = unpacker.GetInt("busi_flag");
            info.occur_amt = unpacker.GetDouble("occur_amt");
            info.occur_end_amt = unpacker.GetDouble("occur_end_amt");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pdfofuL_2_40_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_2_40_InfoList.Add((pdfofuL_2_40_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_资金_查询历史交易组资金流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdfofuL_2_40_Info();
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
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.busi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT);
                    info.occur_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_AMT_FLOAT);
                    info.occur_end_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_END_AMT_FLOAT);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pdfofuL_2_40_InfoList.Add(info);
                }
            }
        }
    }

    public class pdfofuL_2_41_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_2_41_Response()
        {
            this.pdfofuL_2_41_InfoList = new ObservableCollection<pdfofuL_2_41_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_2_41_Info> pdfofuL_2_41_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_2_41_Info info = new pdfofuL_2_41_Info();
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
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.frozen_type = unpacker.GetInt("frozen_type");
            info.occur_amt = unpacker.GetDouble("occur_amt");
            info.expire_date = unpacker.GetInt("expire_date");
            info.jour_status = unpacker.GetStr("jour_status");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pdfofuL_2_41_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_2_41_InfoList.Add((pdfofuL_2_41_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_资金_查询交易组资金冻结解冻流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdfofuL_2_41_Info();
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
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.frozen_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_TYPE_INT);
                    info.occur_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_AMT_FLOAT);
                    info.expire_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXPIRE_DATE_INT);
                    info.jour_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_STATUS_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pdfofuL_2_41_InfoList.Add(info);
                }
            }
        }
    }

    public class pdfofuL_2_42_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_2_42_Response()
        {
            this.pdfofuL_2_42_InfoList = new ObservableCollection<pdfofuL_2_42_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_2_42_Info> pdfofuL_2_42_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_2_42_Info info = new pdfofuL_2_42_Info();
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
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.frozen_type = unpacker.GetInt("frozen_type");
            info.occur_amt = unpacker.GetDouble("occur_amt");
            info.expire_date = unpacker.GetInt("expire_date");
            info.jour_status = unpacker.GetStr("jour_status");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pdfofuL_2_42_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_2_42_InfoList.Add((pdfofuL_2_42_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_资金_查询历史交易组资金冻结解冻流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdfofuL_2_42_Info();
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
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.frozen_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_TYPE_INT);
                    info.occur_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_AMT_FLOAT);
                    info.expire_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXPIRE_DATE_INT);
                    info.jour_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_STATUS_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pdfofuL_2_42_InfoList.Add(info);
                }
            }
        }
    }

    public class pdfofuL_2_51_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_2_51_Response()
        {
            this.pdfofuL_2_51_InfoList = new ObservableCollection<pdfofuL_2_51_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_2_51_Info> pdfofuL_2_51_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_2_51_Info info = new pdfofuL_2_51_Info();
            pdfofuL_2_51_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_2_51_InfoList.Add((pdfofuL_2_51_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_资金_红冲蓝补资产账户资金
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfofuL_2_51_Info();
                pdfofuL_2_51_InfoList.Add(info);
            }
        }
    }

    public class pdfofuL_2_52_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_2_52_Response()
        {
            this.pdfofuL_2_52_InfoList = new ObservableCollection<pdfofuL_2_52_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_2_52_Info> pdfofuL_2_52_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_2_52_Info info = new pdfofuL_2_52_Info();
            pdfofuL_2_52_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_2_52_InfoList.Add((pdfofuL_2_52_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_资金_冻结资产账户资金
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfofuL_2_52_Info();
                pdfofuL_2_52_InfoList.Add(info);
            }
        }
    }

    public class pdfofuL_2_53_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_2_53_Response()
        {
            this.pdfofuL_2_53_InfoList = new ObservableCollection<pdfofuL_2_53_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_2_53_Info> pdfofuL_2_53_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_2_53_Info info = new pdfofuL_2_53_Info();
            pdfofuL_2_53_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_2_53_InfoList.Add((pdfofuL_2_53_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_资金_取消冻结资产账户资金
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfofuL_2_53_Info();
                pdfofuL_2_53_InfoList.Add(info);
            }
        }
    }

    public class pdfofuL_2_54_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_2_54_Response()
        {
            this.pdfofuL_2_54_InfoList = new ObservableCollection<pdfofuL_2_54_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_2_54_Info> pdfofuL_2_54_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_2_54_Info info = new pdfofuL_2_54_Info();
            pdfofuL_2_54_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_2_54_InfoList.Add((pdfofuL_2_54_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_资金_解冻资产账户资金
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfofuL_2_54_Info();
                pdfofuL_2_54_InfoList.Add(info);
            }
        }
    }

    public class pdfofuL_2_55_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_2_55_Response()
        {
            this.pdfofuL_2_55_InfoList = new ObservableCollection<pdfofuL_2_55_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_2_55_Info> pdfofuL_2_55_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_2_55_Info info = new pdfofuL_2_55_Info();
            pdfofuL_2_55_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_2_55_InfoList.Add((pdfofuL_2_55_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_资金_取消解冻资产账户资金
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfofuL_2_55_Info();
                pdfofuL_2_55_InfoList.Add(info);
            }
        }
    }

    public class pdfofuL_2_56_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_2_56_Response()
        {
            this.pdfofuL_2_56_InfoList = new ObservableCollection<pdfofuL_2_56_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_2_56_Info> pdfofuL_2_56_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_2_56_Info info = new pdfofuL_2_56_Info();
            pdfofuL_2_56_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_2_56_InfoList.Add((pdfofuL_2_56_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_资金_修改资产账户资金
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfofuL_2_56_Info();
                pdfofuL_2_56_InfoList.Add(info);
            }
        }
    }

    public class pdfofuL_2_57_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_2_57_Response()
        {
            this.pdfofuL_2_57_InfoList = new ObservableCollection<pdfofuL_2_57_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_2_57_Info> pdfofuL_2_57_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_2_57_Info info = new pdfofuL_2_57_Info();
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
            info.curr_amt = unpacker.GetDouble("curr_amt");
            info.capt_margin = unpacker.GetDouble("capt_margin");
            info.close_pandl = unpacker.GetDouble("close_pandl");
            info.marked_pandl = unpacker.GetDouble("marked_pandl");
            info.frozen_amt = unpacker.GetDouble("frozen_amt");
            info.unfroz_amt = unpacker.GetDouble("unfroz_amt");
            info.total_rece_amt = unpacker.GetDouble("total_rece_amt");
            info.total_payab_amt = unpacker.GetDouble("total_payab_amt");
            info.intrst_rate = unpacker.GetDouble("intrst_rate");
            info.intrst_base_amt = unpacker.GetDouble("intrst_base_amt");
            info.pre_entry_intrst_amt = unpacker.GetDouble("pre_entry_intrst_amt");
            pdfofuL_2_57_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_2_57_InfoList.Add((pdfofuL_2_57_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_资金_查询资产账户资金
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdfofuL_2_57_Info();
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
                    info.curr_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_AMT_FLOAT);
                    info.capt_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CAPT_MARGIN_FLOAT);
                    info.close_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_PANDL_FLOAT);
                    info.marked_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKED_PANDL_FLOAT);
                    info.frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_AMT_FLOAT);
                    info.unfroz_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_AMT_FLOAT);
                    info.total_rece_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_RECE_AMT_FLOAT);
                    info.total_payab_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_PAYAB_AMT_FLOAT);
                    info.intrst_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_RATE_FLOAT);
                    info.intrst_base_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_BASE_AMT_FLOAT);
                    info.pre_entry_intrst_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ENTRY_INTRST_AMT_FLOAT);
                    pdfofuL_2_57_InfoList.Add(info);
                }
            }
        }
    }

    public class pdfofuL_2_58_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_2_58_Response()
        {
            this.pdfofuL_2_58_InfoList = new ObservableCollection<pdfofuL_2_58_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_2_58_Info> pdfofuL_2_58_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_2_58_Info info = new pdfofuL_2_58_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.update_date = unpacker.GetInt("update_date");
            info.update_time = unpacker.GetInt("update_time");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.begin_amt = unpacker.GetDouble("begin_amt");
            info.curr_amt = unpacker.GetDouble("curr_amt");
            info.capt_margin = unpacker.GetDouble("capt_margin");
            info.close_pandl = unpacker.GetDouble("close_pandl");
            info.marked_pandl = unpacker.GetDouble("marked_pandl");
            info.frozen_amt = unpacker.GetDouble("frozen_amt");
            info.unfroz_amt = unpacker.GetDouble("unfroz_amt");
            info.total_rece_amt = unpacker.GetDouble("total_rece_amt");
            info.total_payab_amt = unpacker.GetDouble("total_payab_amt");
            info.intrst_rate = unpacker.GetDouble("intrst_rate");
            info.intrst_base_amt = unpacker.GetDouble("intrst_base_amt");
            info.pre_entry_intrst_amt = unpacker.GetDouble("pre_entry_intrst_amt");
            pdfofuL_2_58_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_2_58_InfoList.Add((pdfofuL_2_58_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_资金_查询历史资产账户资金
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdfofuL_2_58_Info();
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
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.begin_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_AMT_FLOAT);
                    info.curr_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_AMT_FLOAT);
                    info.capt_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CAPT_MARGIN_FLOAT);
                    info.close_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_PANDL_FLOAT);
                    info.marked_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKED_PANDL_FLOAT);
                    info.frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_AMT_FLOAT);
                    info.unfroz_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_AMT_FLOAT);
                    info.total_rece_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_RECE_AMT_FLOAT);
                    info.total_payab_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_PAYAB_AMT_FLOAT);
                    info.intrst_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_RATE_FLOAT);
                    info.intrst_base_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_BASE_AMT_FLOAT);
                    info.pre_entry_intrst_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ENTRY_INTRST_AMT_FLOAT);
                    pdfofuL_2_58_InfoList.Add(info);
                }
            }
        }
    }

    public class pdfofuL_2_59_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_2_59_Response()
        {
            this.pdfofuL_2_59_InfoList = new ObservableCollection<pdfofuL_2_59_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_2_59_Info> pdfofuL_2_59_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_2_59_Info info = new pdfofuL_2_59_Info();
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
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.busi_flag = unpacker.GetInt("busi_flag");
            info.occur_amt = unpacker.GetDouble("occur_amt");
            info.occur_end_amt = unpacker.GetDouble("occur_end_amt");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pdfofuL_2_59_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_2_59_InfoList.Add((pdfofuL_2_59_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_资金_查询资产账户资金流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdfofuL_2_59_Info();
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
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.busi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT);
                    info.occur_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_AMT_FLOAT);
                    info.occur_end_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_END_AMT_FLOAT);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pdfofuL_2_59_InfoList.Add(info);
                }
            }
        }
    }

    public class pdfofuL_2_60_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_2_60_Response()
        {
            this.pdfofuL_2_60_InfoList = new ObservableCollection<pdfofuL_2_60_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_2_60_Info> pdfofuL_2_60_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_2_60_Info info = new pdfofuL_2_60_Info();
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
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.busi_flag = unpacker.GetInt("busi_flag");
            info.occur_amt = unpacker.GetDouble("occur_amt");
            info.occur_end_amt = unpacker.GetDouble("occur_end_amt");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pdfofuL_2_60_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_2_60_InfoList.Add((pdfofuL_2_60_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_资金_查询历史资产账户资金流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdfofuL_2_60_Info();
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
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.busi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT);
                    info.occur_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_AMT_FLOAT);
                    info.occur_end_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_END_AMT_FLOAT);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pdfofuL_2_60_InfoList.Add(info);
                }
            }
        }
    }

    public class pdfofuL_2_61_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_2_61_Response()
        {
            this.pdfofuL_2_61_InfoList = new ObservableCollection<pdfofuL_2_61_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_2_61_Info> pdfofuL_2_61_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_2_61_Info info = new pdfofuL_2_61_Info();
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
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.frozen_type = unpacker.GetInt("frozen_type");
            info.occur_amt = unpacker.GetDouble("occur_amt");
            info.expire_date = unpacker.GetInt("expire_date");
            info.jour_status = unpacker.GetStr("jour_status");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pdfofuL_2_61_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_2_61_InfoList.Add((pdfofuL_2_61_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_资金_查询资产账户资金冻结解冻流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdfofuL_2_61_Info();
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
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.frozen_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_TYPE_INT);
                    info.occur_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_AMT_FLOAT);
                    info.expire_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXPIRE_DATE_INT);
                    info.jour_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_STATUS_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pdfofuL_2_61_InfoList.Add(info);
                }
            }
        }
    }

    public class pdfofuL_2_62_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_2_62_Response()
        {
            this.pdfofuL_2_62_InfoList = new ObservableCollection<pdfofuL_2_62_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_2_62_Info> pdfofuL_2_62_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_2_62_Info info = new pdfofuL_2_62_Info();
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
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.frozen_type = unpacker.GetInt("frozen_type");
            info.occur_amt = unpacker.GetDouble("occur_amt");
            info.expire_date = unpacker.GetInt("expire_date");
            info.jour_status = unpacker.GetStr("jour_status");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pdfofuL_2_62_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_2_62_InfoList.Add((pdfofuL_2_62_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_资金_查询历史资产账户资金冻结解冻流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdfofuL_2_62_Info();
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
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.frozen_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_TYPE_INT);
                    info.occur_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_AMT_FLOAT);
                    info.expire_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXPIRE_DATE_INT);
                    info.jour_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_STATUS_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pdfofuL_2_62_InfoList.Add(info);
                }
            }
        }
    }

    public class pdfofuL_2_106_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_2_106_Response()
        {
            this.pdfofuL_2_106_InfoList = new ObservableCollection<pdfofuL_2_106_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_2_106_Info> pdfofuL_2_106_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_2_106_Info info = new pdfofuL_2_106_Info();
            pdfofuL_2_106_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_2_106_InfoList.Add((pdfofuL_2_106_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_资金_外部外盘期货资金流水记录处理
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfofuL_2_106_Info();
                pdfofuL_2_106_InfoList.Add(info);
            }
        }
    }

    public class pdfofuL_2_108_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_2_108_Response()
        {
            this.pdfofuL_2_108_InfoList = new ObservableCollection<pdfofuL_2_108_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_2_108_Info> pdfofuL_2_108_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_2_108_Info info = new pdfofuL_2_108_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.pass_money_jour_no = unpacker.GetInt64("pass_money_jour_no");
            info.busi_flag = unpacker.GetInt("busi_flag");
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.entry_amt = unpacker.GetDouble("entry_amt");
            info.entry_end_amt = unpacker.GetDouble("entry_end_amt");
            info.exch_no = unpacker.GetInt("exch_no");
            info.futu_acco = unpacker.GetStr("futu_acco");
            info.contrc_code = unpacker.GetStr("contrc_code");
            info.remark_info = unpacker.GetStr("remark_info");
            info.deal_flag = unpacker.GetInt("deal_flag");
            pdfofuL_2_108_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_2_108_InfoList.Add((pdfofuL_2_108_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_资金_查询外部外盘期货资金流水记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdfofuL_2_108_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.pass_money_jour_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_PASS_MONEY_JOUR_NO_INT64);
                    info.busi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT);
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.entry_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_AMT_FLOAT);
                    info.entry_end_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_END_AMT_FLOAT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.futu_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_STR);
                    info.contrc_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    info.deal_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_FLAG_INT);
                    pdfofuL_2_108_InfoList.Add(info);
                }
            }
        }
    }

    public class pdfofuL_2_201_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_2_201_Response()
        {
            this.pdfofuL_2_201_InfoList = new ObservableCollection<pdfofuL_2_201_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_2_201_Info> pdfofuL_2_201_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_2_201_Info info = new pdfofuL_2_201_Info();
            pdfofuL_2_201_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_2_201_InfoList.Add((pdfofuL_2_201_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_资金_清算资金数据统计
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfofuL_2_201_Info();
                pdfofuL_2_201_InfoList.Add(info);
            }
        }
    }

    public class pdfofuL_2_202_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_2_202_Response()
        {
            this.pdfofuL_2_202_InfoList = new ObservableCollection<pdfofuL_2_202_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_2_202_Info> pdfofuL_2_202_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_2_202_Info info = new pdfofuL_2_202_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.record_count = unpacker.GetInt("record_count");
            info.curr_amt = unpacker.GetDouble("curr_amt");
            pdfofuL_2_202_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_2_202_InfoList.Add((pdfofuL_2_202_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_资金_查询清算资金统计数据
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdfofuL_2_202_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.record_count = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RECORD_COUNT_INT);
                    info.curr_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_AMT_FLOAT);
                    pdfofuL_2_202_InfoList.Add(info);
                }
            }
        }
    }

}
