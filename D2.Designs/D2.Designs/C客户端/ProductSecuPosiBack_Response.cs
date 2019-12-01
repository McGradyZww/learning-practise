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
    public class pdsecuL_9_1_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_9_1_Response()
        {
            this.pdsecuL_9_1_InfoList = new ObservableCollection<pdsecuL_9_1_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_9_1_Info> pdsecuL_9_1_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_9_1_Info info = new pdsecuL_9_1_Info();
            pdsecuL_9_1_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_9_1_InfoList.Add((pdsecuL_9_1_Info)info);
        }
        #endregion

        //逻辑_产品证券_持仓运维_核对内部证券持仓记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdsecuL_9_1_Info();
                pdsecuL_9_1_InfoList.Add(info);
            }
        }
    }

    public class pdsecuL_9_2_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_9_2_Response()
        {
            this.pdsecuL_9_2_InfoList = new ObservableCollection<pdsecuL_9_2_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_9_2_Info> pdsecuL_9_2_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_9_2_Info info = new pdsecuL_9_2_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_acco = unpacker.GetStr("stock_acco");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_name = unpacker.GetStr("stock_name");
            info.out_cost_price = unpacker.GetDouble("out_cost_price");
            info.acco_curr_qty = unpacker.GetDouble("acco_curr_qty");
            info.acco_avail_qty = unpacker.GetDouble("acco_avail_qty");
            info.out_curr_qty = unpacker.GetDouble("out_curr_qty");
            info.out_enable_qty = unpacker.GetDouble("out_enable_qty");
            info.acco_curr_qty_diff = unpacker.GetDouble("acco_curr_qty_diff");
            info.acco_avail_qty_diff = unpacker.GetDouble("acco_avail_qty_diff");
            info.out_impawn_qty = unpacker.GetDouble("out_impawn_qty");
            info.deal_flag = unpacker.GetInt("deal_flag");
            info.asset_sync_flag = unpacker.GetInt("asset_sync_flag");
            info.remark_info = unpacker.GetStr("remark_info");
            pdsecuL_9_2_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_9_2_InfoList.Add((pdsecuL_9_2_Info)info);
        }
        #endregion

        //逻辑_产品证券_持仓运维_查询资产账户内外持仓差异记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdsecuL_9_2_Info();
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
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    info.out_cost_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_COST_PRICE_FLOAT);
                    info.acco_curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_CURR_QTY_FLOAT);
                    info.acco_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_AVAIL_QTY_FLOAT);
                    info.out_curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_CURR_QTY_FLOAT);
                    info.out_enable_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ENABLE_QTY_FLOAT);
                    info.acco_curr_qty_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_CURR_QTY_DIFF_FLOAT);
                    info.acco_avail_qty_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_AVAIL_QTY_DIFF_FLOAT);
                    info.out_impawn_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_IMPAWN_QTY_FLOAT);
                    info.deal_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_FLAG_INT);
                    info.asset_sync_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_SYNC_FLAG_INT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    pdsecuL_9_2_InfoList.Add(info);
                }
            }
        }
    }

    public class pdsecuL_9_3_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_9_3_Response()
        {
            this.pdsecuL_9_3_InfoList = new ObservableCollection<pdsecuL_9_3_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_9_3_Info> pdsecuL_9_3_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_9_3_Info info = new pdsecuL_9_3_Info();
            info.co_no = unpacker.GetInt("co_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.out_acco = unpacker.GetStr("out_acco");
            pdsecuL_9_3_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_9_3_InfoList.Add((pdsecuL_9_3_Info)info);
        }
        #endregion

        //逻辑_产品证券_持仓运维_处理资产账户内外持仓差异记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdsecuL_9_3_Info();
                info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                pdsecuL_9_3_InfoList.Add(info);
            }
        }
    }

    public class pdsecuL_9_5_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_9_5_Response()
        {
            this.pdsecuL_9_5_InfoList = new ObservableCollection<pdsecuL_9_5_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_9_5_Info> pdsecuL_9_5_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_9_5_Info info = new pdsecuL_9_5_Info();
            pdsecuL_9_5_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_9_5_InfoList.Add((pdsecuL_9_5_Info)info);
        }
        #endregion

        //逻辑_产品证券_持仓运维_转入估值外部证券持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdsecuL_9_5_Info();
                pdsecuL_9_5_InfoList.Add(info);
            }
        }
    }

    public class pdsecuL_9_6_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_9_6_Response()
        {
            this.pdsecuL_9_6_InfoList = new ObservableCollection<pdsecuL_9_6_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_9_6_Info> pdsecuL_9_6_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_9_6_Info info = new pdsecuL_9_6_Info();
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
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_acco = unpacker.GetStr("stock_acco");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_name = unpacker.GetStr("stock_name");
            info.out_cost_price = unpacker.GetDouble("out_cost_price");
            info.out_curr_qty = unpacker.GetDouble("out_curr_qty");
            info.out_enable_qty = unpacker.GetDouble("out_enable_qty");
            info.out_frozen_qty = unpacker.GetDouble("out_frozen_qty");
            info.out_unfroz_qty = unpacker.GetDouble("out_unfroz_qty");
            pdsecuL_9_6_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_9_6_InfoList.Add((pdsecuL_9_6_Info)info);
        }
        #endregion

        //逻辑_产品证券_持仓运维_查询估值外部证券持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdsecuL_9_6_Info();
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
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    info.out_cost_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_COST_PRICE_FLOAT);
                    info.out_curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_CURR_QTY_FLOAT);
                    info.out_enable_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ENABLE_QTY_FLOAT);
                    info.out_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_FROZEN_QTY_FLOAT);
                    info.out_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_UNFROZ_QTY_FLOAT);
                    pdsecuL_9_6_InfoList.Add(info);
                }
            }
        }
    }

    public class pdsecuL_9_7_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_9_7_Response()
        {
            this.pdsecuL_9_7_InfoList = new ObservableCollection<pdsecuL_9_7_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_9_7_Info> pdsecuL_9_7_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_9_7_Info info = new pdsecuL_9_7_Info();
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
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_acco = unpacker.GetStr("stock_acco");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_name = unpacker.GetStr("stock_name");
            info.out_cost_price = unpacker.GetDouble("out_cost_price");
            info.out_curr_qty = unpacker.GetDouble("out_curr_qty");
            info.out_enable_qty = unpacker.GetDouble("out_enable_qty");
            info.out_frozen_qty = unpacker.GetDouble("out_frozen_qty");
            info.out_unfroz_qty = unpacker.GetDouble("out_unfroz_qty");
            pdsecuL_9_7_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_9_7_InfoList.Add((pdsecuL_9_7_Info)info);
        }
        #endregion

        //逻辑_产品证券_持仓运维_查询外部证券持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdsecuL_9_7_Info();
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
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    info.out_cost_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_COST_PRICE_FLOAT);
                    info.out_curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_CURR_QTY_FLOAT);
                    info.out_enable_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ENABLE_QTY_FLOAT);
                    info.out_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_FROZEN_QTY_FLOAT);
                    info.out_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_UNFROZ_QTY_FLOAT);
                    pdsecuL_9_7_InfoList.Add(info);
                }
            }
        }
    }

    public class pdsecuL_9_8_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_9_8_Response()
        {
            this.pdsecuL_9_8_InfoList = new ObservableCollection<pdsecuL_9_8_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_9_8_Info> pdsecuL_9_8_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_9_8_Info info = new pdsecuL_9_8_Info();
            pdsecuL_9_8_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_9_8_InfoList.Add((pdsecuL_9_8_Info)info);
        }
        #endregion

        //逻辑_产品证券_持仓运维_同步内外差异
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdsecuL_9_8_Info();
                pdsecuL_9_8_InfoList.Add(info);
            }
        }
    }

    public class pdsecuL_9_9_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_9_9_Response()
        {
            this.pdsecuL_9_9_InfoList = new ObservableCollection<pdsecuL_9_9_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_9_9_Info> pdsecuL_9_9_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_9_9_Info info = new pdsecuL_9_9_Info();
            pdsecuL_9_9_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_9_9_InfoList.Add((pdsecuL_9_9_Info)info);
        }
        #endregion

        //逻辑_产品证券_持仓运维_同步债券质押差异数据
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdsecuL_9_9_Info();
                pdsecuL_9_9_InfoList.Add(info);
            }
        }
    }

    public class pdsecuL_9_10_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_9_10_Response()
        {
            this.pdsecuL_9_10_InfoList = new ObservableCollection<pdsecuL_9_10_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_9_10_Info> pdsecuL_9_10_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_9_10_Info info = new pdsecuL_9_10_Info();
            pdsecuL_9_10_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_9_10_InfoList.Add((pdsecuL_9_10_Info)info);
        }
        #endregion

        //逻辑_产品证券_持仓运维_清除外部持仓记录差异记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdsecuL_9_10_Info();
                pdsecuL_9_10_InfoList.Add(info);
            }
        }
    }

    public class pdsecuL_9_11_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_9_11_Response()
        {
            this.pdsecuL_9_11_InfoList = new ObservableCollection<pdsecuL_9_11_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_9_11_Info> pdsecuL_9_11_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_9_11_Info info = new pdsecuL_9_11_Info();
            pdsecuL_9_11_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_9_11_InfoList.Add((pdsecuL_9_11_Info)info);
        }
        #endregion

        //逻辑_产品证券_持仓运维_核对内部债券质押记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdsecuL_9_11_Info();
                pdsecuL_9_11_InfoList.Add(info);
            }
        }
    }

    public class pdsecuL_9_12_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_9_12_Response()
        {
            this.pdsecuL_9_12_InfoList = new ObservableCollection<pdsecuL_9_12_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_9_12_Info> pdsecuL_9_12_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_9_12_Info info = new pdsecuL_9_12_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_acco = unpacker.GetStr("stock_acco");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_name = unpacker.GetStr("stock_name");
            info.acco_curr_qty = unpacker.GetDouble("acco_curr_qty");
            info.acco_avail_qty = unpacker.GetDouble("acco_avail_qty");
            info.out_begin_qty = unpacker.GetDouble("out_begin_qty");
            info.out_curr_qty = unpacker.GetDouble("out_curr_qty");
            info.out_enable_qty = unpacker.GetDouble("out_enable_qty");
            info.acco_avail_qty_diff = unpacker.GetDouble("acco_avail_qty_diff");
            info.deal_flag = unpacker.GetInt("deal_flag");
            info.asset_sync_flag = unpacker.GetInt("asset_sync_flag");
            info.remark_info = unpacker.GetStr("remark_info");
            pdsecuL_9_12_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_9_12_InfoList.Add((pdsecuL_9_12_Info)info);
        }
        #endregion

        //逻辑_产品证券_持仓运维_查询资产账户内外债券质押差异记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdsecuL_9_12_Info();
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
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    info.acco_curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_CURR_QTY_FLOAT);
                    info.acco_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_AVAIL_QTY_FLOAT);
                    info.out_begin_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_BEGIN_QTY_FLOAT);
                    info.out_curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_CURR_QTY_FLOAT);
                    info.out_enable_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ENABLE_QTY_FLOAT);
                    info.acco_avail_qty_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_AVAIL_QTY_DIFF_FLOAT);
                    info.deal_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_FLAG_INT);
                    info.asset_sync_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_SYNC_FLAG_INT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    pdsecuL_9_12_InfoList.Add(info);
                }
            }
        }
    }

    public class pdsecuL_9_13_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_9_13_Response()
        {
            this.pdsecuL_9_13_InfoList = new ObservableCollection<pdsecuL_9_13_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_9_13_Info> pdsecuL_9_13_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_9_13_Info info = new pdsecuL_9_13_Info();
            info.co_no = unpacker.GetInt("co_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.out_acco = unpacker.GetStr("out_acco");
            pdsecuL_9_13_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_9_13_InfoList.Add((pdsecuL_9_13_Info)info);
        }
        #endregion

        //逻辑_产品证券_持仓运维_处理资产账户内外债券质押差异记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdsecuL_9_13_Info();
                info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                pdsecuL_9_13_InfoList.Add(info);
            }
        }
    }

    public class pdsecuL_9_31_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_9_31_Response()
        {
            this.pdsecuL_9_31_InfoList = new ObservableCollection<pdsecuL_9_31_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_9_31_Info> pdsecuL_9_31_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_9_31_Info info = new pdsecuL_9_31_Info();
            pdsecuL_9_31_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_9_31_InfoList.Add((pdsecuL_9_31_Info)info);
        }
        #endregion

        //逻辑_产品证券_持仓运维_重算债券质押标准券数量
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdsecuL_9_31_Info();
                pdsecuL_9_31_InfoList.Add(info);
            }
        }
    }

    public class pdsecuL_9_71_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_9_71_Response()
        {
            this.pdsecuL_9_71_InfoList = new ObservableCollection<pdsecuL_9_71_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_9_71_Info> pdsecuL_9_71_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_9_71_Info info = new pdsecuL_9_71_Info();
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
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.invest_type = unpacker.GetInt("invest_type");
            info.begin_qty = unpacker.GetDouble("begin_qty");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.frozen_qty = unpacker.GetDouble("frozen_qty");
            info.unfroz_qty = unpacker.GetDouble("unfroz_qty");
            info.cost_amt = unpacker.GetDouble("cost_amt");
            info.realize_pandl = unpacker.GetDouble("realize_pandl");
            info.intrst_cost_amt = unpacker.GetDouble("intrst_cost_amt");
            info.intrst_pandl = unpacker.GetDouble("intrst_pandl");
            info.pre_settle_qty = unpacker.GetDouble("pre_settle_qty");
            pdsecuL_9_71_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_9_71_InfoList.Add((pdsecuL_9_71_Info)info);
        }
        #endregion

        //逻辑_产品证券_持仓运维_查询资产账户持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdsecuL_9_71_Info();
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
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.invest_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INVEST_TYPE_INT);
                    info.begin_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_QTY_FLOAT);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_QTY_FLOAT);
                    info.unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_QTY_FLOAT);
                    info.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                    info.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    info.intrst_cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_COST_AMT_FLOAT);
                    info.intrst_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_PANDL_FLOAT);
                    info.pre_settle_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SETTLE_QTY_FLOAT);
                    pdsecuL_9_71_InfoList.Add(info);
                }
            }
        }
    }

    public class pdsecuL_9_72_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_9_72_Response()
        {
            this.pdsecuL_9_72_InfoList = new ObservableCollection<pdsecuL_9_72_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_9_72_Info> pdsecuL_9_72_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_9_72_Info info = new pdsecuL_9_72_Info();
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
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.invest_type = unpacker.GetInt("invest_type");
            info.begin_qty = unpacker.GetDouble("begin_qty");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.frozen_qty = unpacker.GetDouble("frozen_qty");
            info.unfroz_qty = unpacker.GetDouble("unfroz_qty");
            info.cost_amt = unpacker.GetDouble("cost_amt");
            info.realize_pandl = unpacker.GetDouble("realize_pandl");
            info.intrst_cost_amt = unpacker.GetDouble("intrst_cost_amt");
            info.intrst_pandl = unpacker.GetDouble("intrst_pandl");
            pdsecuL_9_72_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_9_72_InfoList.Add((pdsecuL_9_72_Info)info);
        }
        #endregion

        //逻辑_产品证券_持仓运维_查询历史资产账户持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdsecuL_9_72_Info();
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
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.invest_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INVEST_TYPE_INT);
                    info.begin_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_QTY_FLOAT);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_QTY_FLOAT);
                    info.unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_QTY_FLOAT);
                    info.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                    info.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    info.intrst_cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_COST_AMT_FLOAT);
                    info.intrst_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_PANDL_FLOAT);
                    pdsecuL_9_72_InfoList.Add(info);
                }
            }
        }
    }

    public class pdsecuL_9_81_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_9_81_Response()
        {
            this.pdsecuL_9_81_InfoList = new ObservableCollection<pdsecuL_9_81_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_9_81_Info> pdsecuL_9_81_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_9_81_Info info = new pdsecuL_9_81_Info();
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
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.busi_flag = unpacker.GetInt("busi_flag");
            info.occur_qty = unpacker.GetDouble("occur_qty");
            info.occur_end_qty = unpacker.GetDouble("occur_end_qty");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pdsecuL_9_81_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_9_81_InfoList.Add((pdsecuL_9_81_Info)info);
        }
        #endregion

        //逻辑_产品证券_持仓运维_查询资产账户持仓流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdsecuL_9_81_Info();
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
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.busi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT);
                    info.occur_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_QTY_FLOAT);
                    info.occur_end_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_END_QTY_FLOAT);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pdsecuL_9_81_InfoList.Add(info);
                }
            }
        }
    }

    public class pdsecuL_9_82_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_9_82_Response()
        {
            this.pdsecuL_9_82_InfoList = new ObservableCollection<pdsecuL_9_82_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_9_82_Info> pdsecuL_9_82_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_9_82_Info info = new pdsecuL_9_82_Info();
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
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.busi_flag = unpacker.GetInt("busi_flag");
            info.occur_qty = unpacker.GetDouble("occur_qty");
            info.occur_end_qty = unpacker.GetDouble("occur_end_qty");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pdsecuL_9_82_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_9_82_InfoList.Add((pdsecuL_9_82_Info)info);
        }
        #endregion

        //逻辑_产品证券_持仓运维_查询历史资产账户持仓流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdsecuL_9_82_Info();
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
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.busi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT);
                    info.occur_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_QTY_FLOAT);
                    info.occur_end_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_END_QTY_FLOAT);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pdsecuL_9_82_InfoList.Add(info);
                }
            }
        }
    }

    public class pdsecuL_9_90_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_9_90_Response()
        {
            this.pdsecuL_9_90_InfoList = new ObservableCollection<pdsecuL_9_90_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_9_90_Info> pdsecuL_9_90_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_9_90_Info info = new pdsecuL_9_90_Info();
            pdsecuL_9_90_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_9_90_InfoList.Add((pdsecuL_9_90_Info)info);
        }
        #endregion

        //逻辑_产品证券_持仓运维_自动处理内外持仓差异记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdsecuL_9_90_Info();
                pdsecuL_9_90_InfoList.Add(info);
            }
        }
    }

    public class pdsecuL_9_91_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_9_91_Response()
        {
            this.pdsecuL_9_91_InfoList = new ObservableCollection<pdsecuL_9_91_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_9_91_Info> pdsecuL_9_91_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_9_91_Info info = new pdsecuL_9_91_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_acco = unpacker.GetStr("stock_acco");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_name = unpacker.GetStr("stock_name");
            info.out_cost_price = unpacker.GetDouble("out_cost_price");
            info.acco_curr_qty = unpacker.GetDouble("acco_curr_qty");
            info.acco_avail_qty = unpacker.GetDouble("acco_avail_qty");
            info.out_curr_qty = unpacker.GetDouble("out_curr_qty");
            info.out_enable_qty = unpacker.GetDouble("out_enable_qty");
            info.acco_curr_qty_diff = unpacker.GetDouble("acco_curr_qty_diff");
            info.acco_avail_qty_diff = unpacker.GetDouble("acco_avail_qty_diff");
            info.sys_avail_qty_diff = unpacker.GetDouble("sys_avail_qty_diff");
            info.out_impawn_qty = unpacker.GetDouble("out_impawn_qty");
            info.deal_flag = unpacker.GetInt("deal_flag");
            info.asset_sync_flag = unpacker.GetInt("asset_sync_flag");
            info.remark_info = unpacker.GetStr("remark_info");
            pdsecuL_9_91_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_9_91_InfoList.Add((pdsecuL_9_91_Info)info);
        }
        #endregion

        //逻辑_产品证券_持仓运维_查询通道内外持仓差异记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdsecuL_9_91_Info();
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
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    info.out_cost_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_COST_PRICE_FLOAT);
                    info.acco_curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_CURR_QTY_FLOAT);
                    info.acco_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_AVAIL_QTY_FLOAT);
                    info.out_curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_CURR_QTY_FLOAT);
                    info.out_enable_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ENABLE_QTY_FLOAT);
                    info.acco_curr_qty_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_CURR_QTY_DIFF_FLOAT);
                    info.acco_avail_qty_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_AVAIL_QTY_DIFF_FLOAT);
                    info.sys_avail_qty_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SYS_AVAIL_QTY_DIFF_FLOAT);
                    info.out_impawn_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_IMPAWN_QTY_FLOAT);
                    info.deal_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_FLAG_INT);
                    info.asset_sync_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_SYNC_FLAG_INT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    pdsecuL_9_91_InfoList.Add(info);
                }
            }
        }
    }

    public class pdsecuL_9_92_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_9_92_Response()
        {
            this.pdsecuL_9_92_InfoList = new ObservableCollection<pdsecuL_9_92_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_9_92_Info> pdsecuL_9_92_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_9_92_Info info = new pdsecuL_9_92_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.update_date = unpacker.GetInt("update_date");
            info.update_time = unpacker.GetInt("update_time");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_type = unpacker.GetInt("stock_type");
            info.invest_type = unpacker.GetInt("invest_type");
            info.begin_qty = unpacker.GetDouble("begin_qty");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.pre_settle_qty = unpacker.GetDouble("pre_settle_qty");
            info.frozen_qty = unpacker.GetDouble("frozen_qty");
            info.unfroz_qty = unpacker.GetDouble("unfroz_qty");
            info.posi_qty_check_diff = unpacker.GetDouble("posi_qty_check_diff");
            info.cost_amt = unpacker.GetDouble("cost_amt");
            info.realize_pandl = unpacker.GetDouble("realize_pandl");
            info.intrst_cost_amt = unpacker.GetDouble("intrst_cost_amt");
            info.intrst_pandl = unpacker.GetDouble("intrst_pandl");
            pdsecuL_9_92_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_9_92_InfoList.Add((pdsecuL_9_92_Info)info);
        }
        #endregion

        //逻辑_产品证券_持仓运维_查询所有交易组持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdsecuL_9_92_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    info.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.invest_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INVEST_TYPE_INT);
                    info.begin_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_QTY_FLOAT);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.pre_settle_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SETTLE_QTY_FLOAT);
                    info.frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_QTY_FLOAT);
                    info.unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_QTY_FLOAT);
                    info.posi_qty_check_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_CHECK_DIFF_FLOAT);
                    info.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                    info.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    info.intrst_cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_COST_AMT_FLOAT);
                    info.intrst_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_PANDL_FLOAT);
                    pdsecuL_9_92_InfoList.Add(info);
                }
            }
        }
    }

    public class pdsecuL_9_93_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_9_93_Response()
        {
            this.pdsecuL_9_93_InfoList = new ObservableCollection<pdsecuL_9_93_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_9_93_Info> pdsecuL_9_93_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_9_93_Info info = new pdsecuL_9_93_Info();
            pdsecuL_9_93_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_9_93_InfoList.Add((pdsecuL_9_93_Info)info);
        }
        #endregion

        //逻辑_产品证券_持仓运维_调整资产账户持仓成本
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdsecuL_9_93_Info();
                pdsecuL_9_93_InfoList.Add(info);
            }
        }
    }

    public class pdsecuL_9_94_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_9_94_Response()
        {
            this.pdsecuL_9_94_InfoList = new ObservableCollection<pdsecuL_9_94_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_9_94_Info> pdsecuL_9_94_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_9_94_Info info = new pdsecuL_9_94_Info();
            pdsecuL_9_94_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_9_94_InfoList.Add((pdsecuL_9_94_Info)info);
        }
        #endregion

        //逻辑_产品证券_持仓运维_冻结资产账户持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdsecuL_9_94_Info();
                pdsecuL_9_94_InfoList.Add(info);
            }
        }
    }

    public class pdsecuL_9_95_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_9_95_Response()
        {
            this.pdsecuL_9_95_InfoList = new ObservableCollection<pdsecuL_9_95_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_9_95_Info> pdsecuL_9_95_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_9_95_Info info = new pdsecuL_9_95_Info();
            pdsecuL_9_95_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_9_95_InfoList.Add((pdsecuL_9_95_Info)info);
        }
        #endregion

        //逻辑_产品证券_持仓运维_解冻资产账户持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdsecuL_9_95_Info();
                pdsecuL_9_95_InfoList.Add(info);
            }
        }
    }

    public class pdsecuL_9_96_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_9_96_Response()
        {
            this.pdsecuL_9_96_InfoList = new ObservableCollection<pdsecuL_9_96_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_9_96_Info> pdsecuL_9_96_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_9_96_Info info = new pdsecuL_9_96_Info();
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
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.frozen_type = unpacker.GetInt("frozen_type");
            info.occur_qty = unpacker.GetDouble("occur_qty");
            info.expire_date = unpacker.GetInt("expire_date");
            info.jour_status = unpacker.GetStr("jour_status");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pdsecuL_9_96_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_9_96_InfoList.Add((pdsecuL_9_96_Info)info);
        }
        #endregion

        //逻辑_产品证券_持仓运维_查询资产账户持仓冻结解冻流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdsecuL_9_96_Info();
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
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.frozen_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_TYPE_INT);
                    info.occur_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_QTY_FLOAT);
                    info.expire_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXPIRE_DATE_INT);
                    info.jour_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_STATUS_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pdsecuL_9_96_InfoList.Add(info);
                }
            }
        }
    }

    public class pdsecuL_9_97_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_9_97_Response()
        {
            this.pdsecuL_9_97_InfoList = new ObservableCollection<pdsecuL_9_97_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_9_97_Info> pdsecuL_9_97_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_9_97_Info info = new pdsecuL_9_97_Info();
            pdsecuL_9_97_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_9_97_InfoList.Add((pdsecuL_9_97_Info)info);
        }
        #endregion

        //逻辑_产品证券_持仓运维_取消冻结资产账户持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdsecuL_9_97_Info();
                pdsecuL_9_97_InfoList.Add(info);
            }
        }
    }

    public class pdsecuL_9_98_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_9_98_Response()
        {
            this.pdsecuL_9_98_InfoList = new ObservableCollection<pdsecuL_9_98_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_9_98_Info> pdsecuL_9_98_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_9_98_Info info = new pdsecuL_9_98_Info();
            pdsecuL_9_98_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_9_98_InfoList.Add((pdsecuL_9_98_Info)info);
        }
        #endregion

        //逻辑_产品证券_持仓运维_取消解冻资产账户持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdsecuL_9_98_Info();
                pdsecuL_9_98_InfoList.Add(info);
            }
        }
    }

}
