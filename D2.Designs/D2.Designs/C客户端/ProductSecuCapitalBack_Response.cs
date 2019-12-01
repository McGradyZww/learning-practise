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
    public class pdsecuL_10_1_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_10_1_Response()
        {
            this.pdsecuL_10_1_InfoList = new ObservableCollection<pdsecuL_10_1_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_10_1_Info> pdsecuL_10_1_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_10_1_Info info = new pdsecuL_10_1_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.acco_curr_amt = unpacker.GetDouble("acco_curr_amt");
            info.acco_avail_amt = unpacker.GetDouble("acco_avail_amt");
            info.out_curr_amt = unpacker.GetDouble("out_curr_amt");
            info.out_enable_amt = unpacker.GetDouble("out_enable_amt");
            info.sys_avail_amt_diff = unpacker.GetDouble("sys_avail_amt_diff");
            info.acco_curr_amt_diff = unpacker.GetDouble("acco_curr_amt_diff");
            info.acco_avail_amt_diff = unpacker.GetDouble("acco_avail_amt_diff");
            info.total_payab_amt = unpacker.GetDouble("total_payab_amt");
            info.total_rece_amt = unpacker.GetDouble("total_rece_amt");
            info.out_total_payab_amt = unpacker.GetDouble("out_total_payab_amt");
            info.out_total_rece_amt = unpacker.GetDouble("out_total_rece_amt");
            info.acco_total_payab_amt_diff = unpacker.GetDouble("acco_total_payab_amt_diff");
            info.acco_total_rece_amt_diff = unpacker.GetDouble("acco_total_rece_amt_diff");
            info.deal_flag = unpacker.GetInt("deal_flag");
            info.asset_sync_flag = unpacker.GetInt("asset_sync_flag");
            info.remark_info = unpacker.GetStr("remark_info");
            pdsecuL_10_1_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_10_1_InfoList.Add((pdsecuL_10_1_Info)info);
        }
        #endregion

        //逻辑_产品证券_资金运维_查询资产账户内外资金差异记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdsecuL_10_1_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.acco_curr_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_CURR_AMT_FLOAT);
                    info.acco_avail_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_AVAIL_AMT_FLOAT);
                    info.out_curr_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_CURR_AMT_FLOAT);
                    info.out_enable_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ENABLE_AMT_FLOAT);
                    info.sys_avail_amt_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SYS_AVAIL_AMT_DIFF_FLOAT);
                    info.acco_curr_amt_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_CURR_AMT_DIFF_FLOAT);
                    info.acco_avail_amt_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_AVAIL_AMT_DIFF_FLOAT);
                    info.total_payab_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_PAYAB_AMT_FLOAT);
                    info.total_rece_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_RECE_AMT_FLOAT);
                    info.out_total_payab_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_TOTAL_PAYAB_AMT_FLOAT);
                    info.out_total_rece_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_TOTAL_RECE_AMT_FLOAT);
                    info.acco_total_payab_amt_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_TOTAL_PAYAB_AMT_DIFF_FLOAT);
                    info.acco_total_rece_amt_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_TOTAL_RECE_AMT_DIFF_FLOAT);
                    info.deal_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_FLAG_INT);
                    info.asset_sync_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_SYNC_FLAG_INT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    pdsecuL_10_1_InfoList.Add(info);
                }
            }
        }
    }

    public class pdsecuL_10_2_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_10_2_Response()
        {
            this.pdsecuL_10_2_InfoList = new ObservableCollection<pdsecuL_10_2_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_10_2_Info> pdsecuL_10_2_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_10_2_Info info = new pdsecuL_10_2_Info();
            info.co_no = unpacker.GetInt("co_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.out_acco = unpacker.GetStr("out_acco");
            pdsecuL_10_2_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_10_2_InfoList.Add((pdsecuL_10_2_Info)info);
        }
        #endregion

        //逻辑_产品证券_资金运维_处理资产账户内外资金差异记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdsecuL_10_2_Info();
                info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                pdsecuL_10_2_InfoList.Add(info);
            }
        }
    }

    public class pdsecuL_10_3_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_10_3_Response()
        {
            this.pdsecuL_10_3_InfoList = new ObservableCollection<pdsecuL_10_3_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_10_3_Info> pdsecuL_10_3_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_10_3_Info info = new pdsecuL_10_3_Info();
            pdsecuL_10_3_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_10_3_InfoList.Add((pdsecuL_10_3_Info)info);
        }
        #endregion

        //逻辑_产品证券_资金运维_转入估值外部资金
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdsecuL_10_3_Info();
                pdsecuL_10_3_InfoList.Add(info);
            }
        }
    }

    public class pdsecuL_10_4_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_10_4_Response()
        {
            this.pdsecuL_10_4_InfoList = new ObservableCollection<pdsecuL_10_4_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_10_4_Info> pdsecuL_10_4_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_10_4_Info info = new pdsecuL_10_4_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.update_date = unpacker.GetInt("update_date");
            info.update_time = unpacker.GetInt("update_time");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.out_curr_amt = unpacker.GetDouble("out_curr_amt");
            info.out_enable_amt = unpacker.GetDouble("out_enable_amt");
            info.out_frozen_amt = unpacker.GetDouble("out_frozen_amt");
            info.out_unfroz_amt = unpacker.GetDouble("out_unfroz_amt");
            pdsecuL_10_4_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_10_4_InfoList.Add((pdsecuL_10_4_Info)info);
        }
        #endregion

        //逻辑_产品证券_资金运维_查询估值外部资金
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdsecuL_10_4_Info();
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
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.out_curr_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_CURR_AMT_FLOAT);
                    info.out_enable_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ENABLE_AMT_FLOAT);
                    info.out_frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_FROZEN_AMT_FLOAT);
                    info.out_unfroz_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_UNFROZ_AMT_FLOAT);
                    pdsecuL_10_4_InfoList.Add(info);
                }
            }
        }
    }

    public class pdsecuL_10_5_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_10_5_Response()
        {
            this.pdsecuL_10_5_InfoList = new ObservableCollection<pdsecuL_10_5_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_10_5_Info> pdsecuL_10_5_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_10_5_Info info = new pdsecuL_10_5_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.update_date = unpacker.GetInt("update_date");
            info.update_time = unpacker.GetInt("update_time");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.out_curr_amt = unpacker.GetDouble("out_curr_amt");
            info.out_enable_amt = unpacker.GetDouble("out_enable_amt");
            info.out_frozen_amt = unpacker.GetDouble("out_frozen_amt");
            info.out_unfroz_amt = unpacker.GetDouble("out_unfroz_amt");
            info.out_total_payab_amt = unpacker.GetDouble("out_total_payab_amt");
            info.out_total_rece_amt = unpacker.GetDouble("out_total_rece_amt");
            pdsecuL_10_5_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_10_5_InfoList.Add((pdsecuL_10_5_Info)info);
        }
        #endregion

        //逻辑_产品证券_资金运维_查询外部资金
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdsecuL_10_5_Info();
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
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.out_curr_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_CURR_AMT_FLOAT);
                    info.out_enable_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ENABLE_AMT_FLOAT);
                    info.out_frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_FROZEN_AMT_FLOAT);
                    info.out_unfroz_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_UNFROZ_AMT_FLOAT);
                    info.out_total_payab_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_TOTAL_PAYAB_AMT_FLOAT);
                    info.out_total_rece_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_TOTAL_RECE_AMT_FLOAT);
                    pdsecuL_10_5_InfoList.Add(info);
                }
            }
        }
    }

    public class pdsecuL_10_6_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_10_6_Response()
        {
            this.pdsecuL_10_6_InfoList = new ObservableCollection<pdsecuL_10_6_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_10_6_Info> pdsecuL_10_6_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_10_6_Info info = new pdsecuL_10_6_Info();
            pdsecuL_10_6_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_10_6_InfoList.Add((pdsecuL_10_6_Info)info);
        }
        #endregion

        //逻辑_产品证券_资金运维_同步内外差异
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdsecuL_10_6_Info();
                pdsecuL_10_6_InfoList.Add(info);
            }
        }
    }

    public class pdsecuL_10_7_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_10_7_Response()
        {
            this.pdsecuL_10_7_InfoList = new ObservableCollection<pdsecuL_10_7_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_10_7_Info> pdsecuL_10_7_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_10_7_Info info = new pdsecuL_10_7_Info();
            pdsecuL_10_7_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_10_7_InfoList.Add((pdsecuL_10_7_Info)info);
        }
        #endregion

        //逻辑_产品证券_资金运维_清除外部资金记录差异记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdsecuL_10_7_Info();
                pdsecuL_10_7_InfoList.Add(info);
            }
        }
    }

    public class pdsecuL_10_8_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_10_8_Response()
        {
            this.pdsecuL_10_8_InfoList = new ObservableCollection<pdsecuL_10_8_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_10_8_Info> pdsecuL_10_8_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_10_8_Info info = new pdsecuL_10_8_Info();
            pdsecuL_10_8_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_10_8_InfoList.Add((pdsecuL_10_8_Info)info);
        }
        #endregion

        //逻辑_产品证券_资金运维_自动同步处理
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdsecuL_10_8_Info();
                pdsecuL_10_8_InfoList.Add(info);
            }
        }
    }

    public class pdsecuL_10_11_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_10_11_Response()
        {
            this.pdsecuL_10_11_InfoList = new ObservableCollection<pdsecuL_10_11_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_10_11_Info> pdsecuL_10_11_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_10_11_Info info = new pdsecuL_10_11_Info();
            pdsecuL_10_11_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_10_11_InfoList.Add((pdsecuL_10_11_Info)info);
        }
        #endregion

        //逻辑_产品证券_资金运维_更新产品交易组证券资产
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdsecuL_10_11_Info();
                pdsecuL_10_11_InfoList.Add(info);
            }
        }
    }

    public class pdsecuL_10_12_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_10_12_Response()
        {
            this.pdsecuL_10_12_InfoList = new ObservableCollection<pdsecuL_10_12_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_10_12_Info> pdsecuL_10_12_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_10_12_Info info = new pdsecuL_10_12_Info();
            pdsecuL_10_12_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_10_12_InfoList.Add((pdsecuL_10_12_Info)info);
        }
        #endregion

        //逻辑_产品证券_资金运维_更新产品交易组证券资产修改版
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdsecuL_10_12_Info();
                pdsecuL_10_12_InfoList.Add(info);
            }
        }
    }

    public class pdsecuL_10_13_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_10_13_Response()
        {
            this.pdsecuL_10_13_InfoList = new ObservableCollection<pdsecuL_10_13_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_10_13_Info> pdsecuL_10_13_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_10_13_Info info = new pdsecuL_10_13_Info();
            pdsecuL_10_13_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_10_13_InfoList.Add((pdsecuL_10_13_Info)info);
        }
        #endregion

        //逻辑_产品证券_资金运维_更新产品资产
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdsecuL_10_13_Info();
                pdsecuL_10_13_InfoList.Add(info);
            }
        }
    }

    public class pdsecuL_10_14_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_10_14_Response()
        {
            this.pdsecuL_10_14_InfoList = new ObservableCollection<pdsecuL_10_14_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_10_14_Info> pdsecuL_10_14_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_10_14_Info info = new pdsecuL_10_14_Info();
            pdsecuL_10_14_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_10_14_InfoList.Add((pdsecuL_10_14_Info)info);
        }
        #endregion

        //逻辑_产品证券_资金运维_更新交易组资产
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdsecuL_10_14_Info();
                pdsecuL_10_14_InfoList.Add(info);
            }
        }
    }

    public class pdsecuL_10_15_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_10_15_Response()
        {
            this.pdsecuL_10_15_InfoList = new ObservableCollection<pdsecuL_10_15_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_10_15_Info> pdsecuL_10_15_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_10_15_Info info = new pdsecuL_10_15_Info();
            pdsecuL_10_15_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_10_15_InfoList.Add((pdsecuL_10_15_Info)info);
        }
        #endregion

        //逻辑_产品证券_资金运维_更新证券资产
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdsecuL_10_15_Info();
                pdsecuL_10_15_InfoList.Add(info);
            }
        }
    }

    public class pdsecuL_10_16_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_10_16_Response()
        {
            this.pdsecuL_10_16_InfoList = new ObservableCollection<pdsecuL_10_16_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_10_16_Info> pdsecuL_10_16_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_10_16_Info info = new pdsecuL_10_16_Info();
            pdsecuL_10_16_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_10_16_InfoList.Add((pdsecuL_10_16_Info)info);
        }
        #endregion

        //逻辑_产品证券_资金运维_更新产品资产测试
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdsecuL_10_16_Info();
                pdsecuL_10_16_InfoList.Add(info);
            }
        }
    }

    public class pdsecuL_10_17_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_10_17_Response()
        {
            this.pdsecuL_10_17_InfoList = new ObservableCollection<pdsecuL_10_17_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_10_17_Info> pdsecuL_10_17_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_10_17_Info info = new pdsecuL_10_17_Info();
            pdsecuL_10_17_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_10_17_InfoList.Add((pdsecuL_10_17_Info)info);
        }
        #endregion

        //逻辑_产品证券_资金运维_更新证券资产测试版
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdsecuL_10_17_Info();
                pdsecuL_10_17_InfoList.Add(info);
            }
        }
    }

    public class pdsecuL_10_21_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_10_21_Response()
        {
            this.pdsecuL_10_21_InfoList = new ObservableCollection<pdsecuL_10_21_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_10_21_Info> pdsecuL_10_21_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_10_21_Info info = new pdsecuL_10_21_Info();
            pdsecuL_10_21_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_10_21_InfoList.Add((pdsecuL_10_21_Info)info);
        }
        #endregion

        //逻辑_产品证券_资金运维_自动处理内外资金差异记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdsecuL_10_21_Info();
                pdsecuL_10_21_InfoList.Add(info);
            }
        }
    }

    public class pdsecuL_10_22_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_10_22_Response()
        {
            this.pdsecuL_10_22_InfoList = new ObservableCollection<pdsecuL_10_22_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_10_22_Info> pdsecuL_10_22_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_10_22_Info info = new pdsecuL_10_22_Info();
            pdsecuL_10_22_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_10_22_InfoList.Add((pdsecuL_10_22_Info)info);
        }
        #endregion

        //逻辑_产品证券_资金运维_处理内外资金差异记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdsecuL_10_22_Info();
                pdsecuL_10_22_InfoList.Add(info);
            }
        }
    }

    public class pdsecuL_10_23_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_10_23_Response()
        {
            this.pdsecuL_10_23_InfoList = new ObservableCollection<pdsecuL_10_23_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_10_23_Info> pdsecuL_10_23_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_10_23_Info info = new pdsecuL_10_23_Info();
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
            info.frozen_amt = unpacker.GetDouble("frozen_amt");
            info.unfroz_amt = unpacker.GetDouble("unfroz_amt");
            info.pre_settle_amt = unpacker.GetDouble("pre_settle_amt");
            info.shsz_avail_change_amt = unpacker.GetDouble("shsz_avail_change_amt");
            info.hk_avail_change_amt = unpacker.GetDouble("hk_avail_change_amt");
            info.amt_check_diff = unpacker.GetDouble("amt_check_diff");
            info.T_hk_buy_total_amt = unpacker.GetDouble("T_hk_buy_total_amt");
            info.T_hk_sell_total_amt = unpacker.GetDouble("T_hk_sell_total_amt");
            info.T1_hk_buy_total_amt = unpacker.GetDouble("T1_hk_buy_total_amt");
            info.T1_hk_sell_total_amt = unpacker.GetDouble("T1_hk_sell_total_amt");
            info.total_rece_amt = unpacker.GetDouble("total_rece_amt");
            info.total_payab_amt = unpacker.GetDouble("total_payab_amt");
            info.total_change_amt = unpacker.GetDouble("total_change_amt");
            info.realize_pandl = unpacker.GetDouble("realize_pandl");
            info.intrst_rate = unpacker.GetDouble("intrst_rate");
            info.intrst_base_amt = unpacker.GetDouble("intrst_base_amt");
            info.pre_entry_intrst_amt = unpacker.GetDouble("pre_entry_intrst_amt");
            pdsecuL_10_23_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_10_23_InfoList.Add((pdsecuL_10_23_Info)info);
        }
        #endregion

        //逻辑_产品证券_资金运维_查询交易组资金
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdsecuL_10_23_Info();
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
                    info.frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_AMT_FLOAT);
                    info.unfroz_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_AMT_FLOAT);
                    info.pre_settle_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SETTLE_AMT_FLOAT);
                    info.shsz_avail_change_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SHSZ_AVAIL_CHANGE_AMT_FLOAT);
                    info.hk_avail_change_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HK_AVAIL_CHANGE_AMT_FLOAT);
                    info.amt_check_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_CHECK_DIFF_FLOAT);
                    info.T_hk_buy_total_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_T_HK_BUY_TOTAL_AMT_FLOAT);
                    info.T_hk_sell_total_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_T_HK_SELL_TOTAL_AMT_FLOAT);
                    info.T1_hk_buy_total_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_T1_HK_BUY_TOTAL_AMT_FLOAT);
                    info.T1_hk_sell_total_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_T1_HK_SELL_TOTAL_AMT_FLOAT);
                    info.total_rece_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_RECE_AMT_FLOAT);
                    info.total_payab_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_PAYAB_AMT_FLOAT);
                    info.total_change_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_CHANGE_AMT_FLOAT);
                    info.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    info.intrst_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_RATE_FLOAT);
                    info.intrst_base_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_BASE_AMT_FLOAT);
                    info.pre_entry_intrst_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ENTRY_INTRST_AMT_FLOAT);
                    pdsecuL_10_23_InfoList.Add(info);
                }
            }
        }
    }

    public class pdsecuL_10_24_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_10_24_Response()
        {
            this.pdsecuL_10_24_InfoList = new ObservableCollection<pdsecuL_10_24_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_10_24_Info> pdsecuL_10_24_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_10_24_Info info = new pdsecuL_10_24_Info();
            pdsecuL_10_24_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_10_24_InfoList.Add((pdsecuL_10_24_Info)info);
        }
        #endregion

        //逻辑_产品证券_资金运维_删除交易组资金
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdsecuL_10_24_Info();
                pdsecuL_10_24_InfoList.Add(info);
            }
        }
    }

    public class pdsecuL_10_25_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_10_25_Response()
        {
            this.pdsecuL_10_25_InfoList = new ObservableCollection<pdsecuL_10_25_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_10_25_Info> pdsecuL_10_25_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_10_25_Info info = new pdsecuL_10_25_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.acco_curr_amt = unpacker.GetDouble("acco_curr_amt");
            info.acco_avail_amt = unpacker.GetDouble("acco_avail_amt");
            info.out_curr_amt = unpacker.GetDouble("out_curr_amt");
            info.out_enable_amt = unpacker.GetDouble("out_enable_amt");
            info.sys_avail_amt_diff = unpacker.GetDouble("sys_avail_amt_diff");
            info.acco_curr_amt_diff = unpacker.GetDouble("acco_curr_amt_diff");
            info.acco_avail_amt_diff = unpacker.GetDouble("acco_avail_amt_diff");
            info.total_payab_amt = unpacker.GetDouble("total_payab_amt");
            info.total_rece_amt = unpacker.GetDouble("total_rece_amt");
            info.out_total_payab_amt = unpacker.GetDouble("out_total_payab_amt");
            info.out_total_rece_amt = unpacker.GetDouble("out_total_rece_amt");
            info.acco_total_payab_amt_diff = unpacker.GetDouble("acco_total_payab_amt_diff");
            info.acco_total_rece_amt_diff = unpacker.GetDouble("acco_total_rece_amt_diff");
            info.deal_flag = unpacker.GetInt("deal_flag");
            info.asset_sync_flag = unpacker.GetInt("asset_sync_flag");
            info.remark_info = unpacker.GetStr("remark_info");
            pdsecuL_10_25_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_10_25_InfoList.Add((pdsecuL_10_25_Info)info);
        }
        #endregion

        //逻辑_产品证券_资金运维_查询通道内外资金差异
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdsecuL_10_25_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.acco_curr_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_CURR_AMT_FLOAT);
                    info.acco_avail_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_AVAIL_AMT_FLOAT);
                    info.out_curr_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_CURR_AMT_FLOAT);
                    info.out_enable_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ENABLE_AMT_FLOAT);
                    info.sys_avail_amt_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SYS_AVAIL_AMT_DIFF_FLOAT);
                    info.acco_curr_amt_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_CURR_AMT_DIFF_FLOAT);
                    info.acco_avail_amt_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_AVAIL_AMT_DIFF_FLOAT);
                    info.total_payab_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_PAYAB_AMT_FLOAT);
                    info.total_rece_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_RECE_AMT_FLOAT);
                    info.out_total_payab_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_TOTAL_PAYAB_AMT_FLOAT);
                    info.out_total_rece_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_TOTAL_RECE_AMT_FLOAT);
                    info.acco_total_payab_amt_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_TOTAL_PAYAB_AMT_DIFF_FLOAT);
                    info.acco_total_rece_amt_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_TOTAL_RECE_AMT_DIFF_FLOAT);
                    info.deal_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_FLAG_INT);
                    info.asset_sync_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_SYNC_FLAG_INT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    pdsecuL_10_25_InfoList.Add(info);
                }
            }
        }
    }

    public class pdsecuL_10_26_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_10_26_Response()
        {
            this.pdsecuL_10_26_InfoList = new ObservableCollection<pdsecuL_10_26_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_10_26_Info> pdsecuL_10_26_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_10_26_Info info = new pdsecuL_10_26_Info();
            pdsecuL_10_26_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_10_26_InfoList.Add((pdsecuL_10_26_Info)info);
        }
        #endregion

        //逻辑_产品证券_资金运维_核对内部证券资金记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdsecuL_10_26_Info();
                pdsecuL_10_26_InfoList.Add(info);
            }
        }
    }

    public class pdsecuL_10_27_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_10_27_Response()
        {
            this.pdsecuL_10_27_InfoList = new ObservableCollection<pdsecuL_10_27_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_10_27_Info> pdsecuL_10_27_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_10_27_Info info = new pdsecuL_10_27_Info();
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
            pdsecuL_10_27_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_10_27_InfoList.Add((pdsecuL_10_27_Info)info);
        }
        #endregion

        //逻辑_产品证券_资金运维_查询资产账户资金流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdsecuL_10_27_Info();
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
                    pdsecuL_10_27_InfoList.Add(info);
                }
            }
        }
    }

    public class pdsecuL_10_28_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_10_28_Response()
        {
            this.pdsecuL_10_28_InfoList = new ObservableCollection<pdsecuL_10_28_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_10_28_Info> pdsecuL_10_28_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_10_28_Info info = new pdsecuL_10_28_Info();
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
            pdsecuL_10_28_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_10_28_InfoList.Add((pdsecuL_10_28_Info)info);
        }
        #endregion

        //逻辑_产品证券_资金运维_查询历史资产账户资金流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdsecuL_10_28_Info();
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
                    pdsecuL_10_28_InfoList.Add(info);
                }
            }
        }
    }

}
