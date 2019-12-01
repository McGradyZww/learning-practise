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
    public class tdfutuL_3_1_Response : IResponse
    {
        #region 构造函数
        public tdfutuL_3_1_Response()
        {
            this.tdfutuL_3_1_InfoList = new ObservableCollection<tdfutuL_3_1_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdfutuL_3_1_Info> tdfutuL_3_1_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdfutuL_3_1_Info info = new tdfutuL_3_1_Info();
            info.comm_id = unpacker.GetInt64("comm_id");
            info.comm_batch_no = unpacker.GetInt("comm_batch_no");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.comm_dir = unpacker.GetInt("comm_dir");
            info.comm_limit_price = unpacker.GetDouble("comm_limit_price");
            info.comm_qty = unpacker.GetDouble("comm_qty");
            info.comm_amt = unpacker.GetDouble("comm_amt");
            info.comm_status = unpacker.GetStr("comm_status");
            info.comm_appr_status = unpacker.GetStr("comm_appr_status");
            tdfutuL_3_1_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdfutuL_3_1_InfoList.Add((tdfutuL_3_1_Info)info);
        }
        #endregion

        //逻辑_交易期货_指令_新增指令
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdfutuL_3_1_Info();
                info.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                info.comm_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT);
                info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                info.comm_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_INT);
                info.comm_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_LIMIT_PRICE_FLOAT);
                info.comm_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_QTY_FLOAT);
                info.comm_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_AMT_FLOAT);
                info.comm_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_STATUS_STR);
                info.comm_appr_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_STATUS_STR);
                tdfutuL_3_1_InfoList.Add(info);
            }
        }
    }

    public class tdfutuL_3_2_Response : IResponse
    {
        #region 构造函数
        public tdfutuL_3_2_Response()
        {
            this.tdfutuL_3_2_InfoList = new ObservableCollection<tdfutuL_3_2_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdfutuL_3_2_Info> tdfutuL_3_2_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdfutuL_3_2_Info info = new tdfutuL_3_2_Info();
            tdfutuL_3_2_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdfutuL_3_2_InfoList.Add((tdfutuL_3_2_Info)info);
        }
        #endregion

        //逻辑_交易期货_指令_撤销指令
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdfutuL_3_2_Info();
                tdfutuL_3_2_InfoList.Add(info);
            }
        }
    }

    public class tdfutuL_3_3_Response : IResponse
    {
        #region 构造函数
        public tdfutuL_3_3_Response()
        {
            this.tdfutuL_3_3_InfoList = new ObservableCollection<tdfutuL_3_3_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdfutuL_3_3_Info> tdfutuL_3_3_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdfutuL_3_3_Info info = new tdfutuL_3_3_Info();
            tdfutuL_3_3_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdfutuL_3_3_InfoList.Add((tdfutuL_3_3_Info)info);
        }
        #endregion

        //逻辑_交易期货_指令_修改指令
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdfutuL_3_3_Info();
                tdfutuL_3_3_InfoList.Add(info);
            }
        }
    }

    public class tdfutuL_3_4_Response : IResponse
    {
        #region 构造函数
        public tdfutuL_3_4_Response()
        {
            this.tdfutuL_3_4_InfoList = new ObservableCollection<tdfutuL_3_4_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdfutuL_3_4_Info> tdfutuL_3_4_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdfutuL_3_4_Info info = new tdfutuL_3_4_Info();
            info.comm_status = unpacker.GetStr("comm_status");
            info.order_id = unpacker.GetInt64("order_id");
            tdfutuL_3_4_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdfutuL_3_4_InfoList.Add((tdfutuL_3_4_Info)info);
        }
        #endregion

        //逻辑_交易期货_指令_审批指令
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdfutuL_3_4_Info();
                info.comm_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_STATUS_STR);
                info.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                tdfutuL_3_4_InfoList.Add(info);
            }
        }
    }

    public class tdfutuL_3_5_Response : IResponse
    {
        #region 构造函数
        public tdfutuL_3_5_Response()
        {
            this.tdfutuL_3_5_InfoList = new ObservableCollection<tdfutuL_3_5_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdfutuL_3_5_Info> tdfutuL_3_5_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdfutuL_3_5_Info info = new tdfutuL_3_5_Info();
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.comm_opor = unpacker.GetInt("comm_opor");
            info.comm_date = unpacker.GetInt("comm_date");
            info.comm_batch_no = unpacker.GetInt("comm_batch_no");
            info.comm_dir = unpacker.GetInt("comm_dir");
            info.comm_qty = unpacker.GetDouble("comm_qty");
            info.comm_amt = unpacker.GetDouble("comm_amt");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.comm_cancel_qty = unpacker.GetDouble("comm_cancel_qty");
            info.comm_status = unpacker.GetStr("comm_status");
            info.strike_status = unpacker.GetStr("strike_status");
            tdfutuL_3_5_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdfutuL_3_5_InfoList.Add((tdfutuL_3_5_Info)info);
        }
        #endregion

        //逻辑_交易期货_指令_分发指令
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdfutuL_3_5_Info();
                info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                info.comm_opor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPOR_INT);
                info.comm_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DATE_INT);
                info.comm_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT);
                info.comm_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_INT);
                info.comm_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_QTY_FLOAT);
                info.comm_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_AMT_FLOAT);
                info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                info.comm_cancel_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_CANCEL_QTY_FLOAT);
                info.comm_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_STATUS_STR);
                info.strike_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_STATUS_STR);
                tdfutuL_3_5_InfoList.Add(info);
            }
        }
    }

    public class tdfutuL_3_6_Response : IResponse
    {
        #region 构造函数
        public tdfutuL_3_6_Response()
        {
            this.tdfutuL_3_6_InfoList = new ObservableCollection<tdfutuL_3_6_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdfutuL_3_6_Info> tdfutuL_3_6_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdfutuL_3_6_Info info = new tdfutuL_3_6_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.opor_co_no = unpacker.GetInt("opor_co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.oper_mac = unpacker.GetStr("oper_mac");
            info.oper_ip_addr = unpacker.GetStr("oper_ip_addr");
            info.oper_info = unpacker.GetStr("oper_info");
            info.oper_way = unpacker.GetStr("oper_way");
            info.oper_func_code = unpacker.GetStr("oper_func_code");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.exch_crncy_type = unpacker.GetStr("exch_crncy_type");
            info.exch_no = unpacker.GetInt("exch_no");
            info.futu_acco_no = unpacker.GetInt("futu_acco_no");
            info.contrc_code_no = unpacker.GetInt("contrc_code_no");
            info.contrc_code = unpacker.GetStr("contrc_code");
            info.contrc_type = unpacker.GetInt("contrc_type");
            info.asset_type = unpacker.GetInt("asset_type");
            info.contrc_dir = unpacker.GetInt("contrc_dir");
            info.hedge_type = unpacker.GetInt("hedge_type");
            info.comm_date = unpacker.GetInt("comm_date");
            info.comm_time = unpacker.GetInt("comm_time");
            info.comm_batch_no = unpacker.GetInt("comm_batch_no");
            info.comm_opor = unpacker.GetInt("comm_opor");
            info.comm_executor = unpacker.GetInt("comm_executor");
            info.comm_dir = unpacker.GetInt("comm_dir");
            info.comm_limit_price = unpacker.GetDouble("comm_limit_price");
            info.limit_actual_price = unpacker.GetDouble("limit_actual_price");
            info.comm_qty = unpacker.GetDouble("comm_qty");
            info.comm_amt = unpacker.GetDouble("comm_amt");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.comm_cancel_qty = unpacker.GetDouble("comm_cancel_qty");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.comm_frozen_qty = unpacker.GetDouble("comm_frozen_qty");
            info.rece_margin = unpacker.GetDouble("rece_margin");
            info.capit_reback_days = unpacker.GetInt("capit_reback_days");
            info.posi_reback_days = unpacker.GetInt("posi_reback_days");
            info.strike_status = unpacker.GetStr("strike_status");
            info.comm_status = unpacker.GetStr("comm_status");
            info.comm_begin_date = unpacker.GetInt("comm_begin_date");
            info.comm_end_date = unpacker.GetInt("comm_end_date");
            info.comm_begin_time = unpacker.GetInt("comm_begin_time");
            info.comm_end_time = unpacker.GetInt("comm_end_time");
            info.comm_comple_date = unpacker.GetInt("comm_comple_date");
            info.comm_comple_time = unpacker.GetInt("comm_comple_time");
            info.comm_appr_date = unpacker.GetInt("comm_appr_date");
            info.comm_appr_time = unpacker.GetInt("comm_appr_time");
            info.comm_appr_status = unpacker.GetStr("comm_appr_status");
            info.comm_appr_oper_no = unpacker.GetInt("comm_appr_oper_no");
            info.comm_appr_oper = unpacker.GetInt("comm_appr_oper");
            info.comm_appr_remark = unpacker.GetStr("comm_appr_remark");
            info.external_no = unpacker.GetInt64("external_no");
            info.comb_code = unpacker.GetStr("comb_code");
            info.comm_oper_way = unpacker.GetStr("comm_oper_way");
            info.remark_info = unpacker.GetStr("remark_info");
            info.comm_comple_flag = unpacker.GetInt("comm_comple_flag");
            info.update_times = unpacker.GetInt("update_times");
            tdfutuL_3_6_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdfutuL_3_6_InfoList.Add((tdfutuL_3_6_Info)info);
        }
        #endregion

        //逻辑_交易期货_指令_查询指令结果集
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdfutuL_3_6_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    info.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    info.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    info.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    info.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    info.exch_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.futu_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT);
                    info.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    info.contrc_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR);
                    info.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    info.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    info.contrc_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_DIR_INT);
                    info.hedge_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT);
                    info.comm_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DATE_INT);
                    info.comm_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_TIME_INT);
                    info.comm_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT);
                    info.comm_opor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPOR_INT);
                    info.comm_executor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_EXECUTOR_INT);
                    info.comm_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_INT);
                    info.comm_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_LIMIT_PRICE_FLOAT);
                    info.limit_actual_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT);
                    info.comm_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_QTY_FLOAT);
                    info.comm_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_AMT_FLOAT);
                    info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    info.comm_cancel_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_CANCEL_QTY_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.comm_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_FROZEN_QTY_FLOAT);
                    info.rece_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RECE_MARGIN_FLOAT);
                    info.capit_reback_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CAPIT_REBACK_DAYS_INT);
                    info.posi_reback_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_POSI_REBACK_DAYS_INT);
                    info.strike_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_STATUS_STR);
                    info.comm_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_STATUS_STR);
                    info.comm_begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BEGIN_DATE_INT);
                    info.comm_end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_END_DATE_INT);
                    info.comm_begin_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BEGIN_TIME_INT);
                    info.comm_end_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_END_TIME_INT);
                    info.comm_comple_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_COMPLE_DATE_INT);
                    info.comm_comple_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_COMPLE_TIME_INT);
                    info.comm_appr_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_DATE_INT);
                    info.comm_appr_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_TIME_INT);
                    info.comm_appr_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_STATUS_STR);
                    info.comm_appr_oper_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_OPER_NO_INT);
                    info.comm_appr_oper = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_OPER_INT);
                    info.comm_appr_remark = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_REMARK_STR);
                    info.external_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64);
                    info.comb_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMB_CODE_STR);
                    info.comm_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPER_WAY_STR);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    info.comm_comple_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_COMPLE_FLAG_INT);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdfutuL_3_6_InfoList.Add(info);
                }
            }
        }
    }

    public class tdfutuL_3_7_Response : IResponse
    {
        #region 构造函数
        public tdfutuL_3_7_Response()
        {
            this.tdfutuL_3_7_InfoList = new ObservableCollection<tdfutuL_3_7_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdfutuL_3_7_Info> tdfutuL_3_7_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdfutuL_3_7_Info info = new tdfutuL_3_7_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.opor_co_no = unpacker.GetInt("opor_co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.oper_mac = unpacker.GetStr("oper_mac");
            info.oper_ip_addr = unpacker.GetStr("oper_ip_addr");
            info.oper_info = unpacker.GetStr("oper_info");
            info.oper_way = unpacker.GetStr("oper_way");
            info.oper_func_code = unpacker.GetStr("oper_func_code");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.exch_crncy_type = unpacker.GetStr("exch_crncy_type");
            info.exch_no = unpacker.GetInt("exch_no");
            info.futu_acco_no = unpacker.GetInt("futu_acco_no");
            info.contrc_code_no = unpacker.GetInt("contrc_code_no");
            info.contrc_code = unpacker.GetStr("contrc_code");
            info.contrc_type = unpacker.GetInt("contrc_type");
            info.asset_type = unpacker.GetInt("asset_type");
            info.contrc_dir = unpacker.GetInt("contrc_dir");
            info.hedge_type = unpacker.GetInt("hedge_type");
            info.comm_date = unpacker.GetInt("comm_date");
            info.comm_time = unpacker.GetInt("comm_time");
            info.comm_batch_no = unpacker.GetInt("comm_batch_no");
            info.comm_opor = unpacker.GetInt("comm_opor");
            info.comm_executor = unpacker.GetInt("comm_executor");
            info.comm_dir = unpacker.GetInt("comm_dir");
            info.comm_limit_price = unpacker.GetDouble("comm_limit_price");
            info.limit_actual_price = unpacker.GetDouble("limit_actual_price");
            info.comm_qty = unpacker.GetDouble("comm_qty");
            info.comm_amt = unpacker.GetDouble("comm_amt");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.comm_cancel_qty = unpacker.GetDouble("comm_cancel_qty");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.comm_frozen_qty = unpacker.GetDouble("comm_frozen_qty");
            info.rece_margin = unpacker.GetDouble("rece_margin");
            info.capit_reback_days = unpacker.GetInt("capit_reback_days");
            info.posi_reback_days = unpacker.GetInt("posi_reback_days");
            info.strike_status = unpacker.GetStr("strike_status");
            info.comm_status = unpacker.GetStr("comm_status");
            info.comm_begin_date = unpacker.GetInt("comm_begin_date");
            info.comm_end_date = unpacker.GetInt("comm_end_date");
            info.comm_begin_time = unpacker.GetInt("comm_begin_time");
            info.comm_end_time = unpacker.GetInt("comm_end_time");
            info.comm_comple_date = unpacker.GetInt("comm_comple_date");
            info.comm_comple_time = unpacker.GetInt("comm_comple_time");
            info.comm_appr_date = unpacker.GetInt("comm_appr_date");
            info.comm_appr_time = unpacker.GetInt("comm_appr_time");
            info.comm_appr_status = unpacker.GetStr("comm_appr_status");
            info.comm_appr_oper_no = unpacker.GetInt("comm_appr_oper_no");
            info.comm_appr_oper = unpacker.GetInt("comm_appr_oper");
            info.comm_appr_remark = unpacker.GetStr("comm_appr_remark");
            info.external_no = unpacker.GetInt64("external_no");
            info.comb_code = unpacker.GetStr("comb_code");
            info.comm_oper_way = unpacker.GetStr("comm_oper_way");
            info.remark_info = unpacker.GetStr("remark_info");
            info.comm_comple_flag = unpacker.GetInt("comm_comple_flag");
            info.update_times = unpacker.GetInt("update_times");
            tdfutuL_3_7_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdfutuL_3_7_InfoList.Add((tdfutuL_3_7_Info)info);
        }
        #endregion

        //逻辑_交易期货_指令_查询历史指令结果集
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdfutuL_3_7_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    info.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    info.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    info.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    info.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    info.exch_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.futu_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT);
                    info.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    info.contrc_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR);
                    info.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    info.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    info.contrc_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_DIR_INT);
                    info.hedge_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT);
                    info.comm_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DATE_INT);
                    info.comm_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_TIME_INT);
                    info.comm_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT);
                    info.comm_opor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPOR_INT);
                    info.comm_executor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_EXECUTOR_INT);
                    info.comm_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_INT);
                    info.comm_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_LIMIT_PRICE_FLOAT);
                    info.limit_actual_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT);
                    info.comm_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_QTY_FLOAT);
                    info.comm_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_AMT_FLOAT);
                    info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    info.comm_cancel_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_CANCEL_QTY_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.comm_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_FROZEN_QTY_FLOAT);
                    info.rece_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RECE_MARGIN_FLOAT);
                    info.capit_reback_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CAPIT_REBACK_DAYS_INT);
                    info.posi_reback_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_POSI_REBACK_DAYS_INT);
                    info.strike_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_STATUS_STR);
                    info.comm_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_STATUS_STR);
                    info.comm_begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BEGIN_DATE_INT);
                    info.comm_end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_END_DATE_INT);
                    info.comm_begin_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BEGIN_TIME_INT);
                    info.comm_end_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_END_TIME_INT);
                    info.comm_comple_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_COMPLE_DATE_INT);
                    info.comm_comple_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_COMPLE_TIME_INT);
                    info.comm_appr_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_DATE_INT);
                    info.comm_appr_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_TIME_INT);
                    info.comm_appr_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_STATUS_STR);
                    info.comm_appr_oper_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_OPER_NO_INT);
                    info.comm_appr_oper = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_OPER_INT);
                    info.comm_appr_remark = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_REMARK_STR);
                    info.external_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64);
                    info.comb_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMB_CODE_STR);
                    info.comm_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPER_WAY_STR);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    info.comm_comple_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_COMPLE_FLAG_INT);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdfutuL_3_7_InfoList.Add(info);
                }
            }
        }
    }

    public class tdfutuL_3_8_Response : IResponse
    {
        #region 构造函数
        public tdfutuL_3_8_Response()
        {
            this.tdfutuL_3_8_InfoList = new ObservableCollection<tdfutuL_3_8_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdfutuL_3_8_Info> tdfutuL_3_8_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdfutuL_3_8_Info info = new tdfutuL_3_8_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.opor_co_no = unpacker.GetInt("opor_co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.oper_mac = unpacker.GetStr("oper_mac");
            info.oper_ip_addr = unpacker.GetStr("oper_ip_addr");
            info.oper_info = unpacker.GetStr("oper_info");
            info.oper_way = unpacker.GetStr("oper_way");
            info.oper_func_code = unpacker.GetStr("oper_func_code");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.contrc_code_no = unpacker.GetInt("contrc_code_no");
            info.contrc_type = unpacker.GetInt("contrc_type");
            info.comm_date = unpacker.GetInt("comm_date");
            info.comm_id = unpacker.GetInt64("comm_id");
            info.comm_batch_no = unpacker.GetInt("comm_batch_no");
            info.comm_dir = unpacker.GetInt("comm_dir");
            info.comm_status = unpacker.GetStr("comm_status");
            info.comm_opor = unpacker.GetInt("comm_opor");
            info.disp_date = unpacker.GetInt("disp_date");
            info.disp_time = unpacker.GetInt("disp_time");
            info.before_comm_executor = unpacker.GetInt("before_comm_executor");
            info.comm_executor = unpacker.GetInt("comm_executor");
            info.is_withdraw = unpacker.GetInt("is_withdraw");
            info.disp_flag = unpacker.GetInt("disp_flag");
            info.disp_remark = unpacker.GetStr("disp_remark");
            info.update_times = unpacker.GetInt("update_times");
            tdfutuL_3_8_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdfutuL_3_8_InfoList.Add((tdfutuL_3_8_Info)info);
        }
        #endregion

        //逻辑_交易期货_指令_查询指令分发结果集
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdfutuL_3_8_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    info.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    info.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    info.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    info.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    info.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    info.comm_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DATE_INT);
                    info.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                    info.comm_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT);
                    info.comm_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_INT);
                    info.comm_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_STATUS_STR);
                    info.comm_opor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPOR_INT);
                    info.disp_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DISP_DATE_INT);
                    info.disp_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DISP_TIME_INT);
                    info.before_comm_executor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEFORE_COMM_EXECUTOR_INT);
                    info.comm_executor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_EXECUTOR_INT);
                    info.is_withdraw = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_WITHDRAW_INT);
                    info.disp_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DISP_FLAG_INT);
                    info.disp_remark = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DISP_REMARK_STR);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdfutuL_3_8_InfoList.Add(info);
                }
            }
        }
    }

    public class tdfutuL_3_9_Response : IResponse
    {
        #region 构造函数
        public tdfutuL_3_9_Response()
        {
            this.tdfutuL_3_9_InfoList = new ObservableCollection<tdfutuL_3_9_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdfutuL_3_9_Info> tdfutuL_3_9_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdfutuL_3_9_Info info = new tdfutuL_3_9_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.opor_co_no = unpacker.GetInt("opor_co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.oper_mac = unpacker.GetStr("oper_mac");
            info.oper_ip_addr = unpacker.GetStr("oper_ip_addr");
            info.oper_info = unpacker.GetStr("oper_info");
            info.oper_way = unpacker.GetStr("oper_way");
            info.oper_func_code = unpacker.GetStr("oper_func_code");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.contrc_code_no = unpacker.GetInt("contrc_code_no");
            info.contrc_type = unpacker.GetInt("contrc_type");
            info.comm_date = unpacker.GetInt("comm_date");
            info.comm_id = unpacker.GetInt64("comm_id");
            info.comm_batch_no = unpacker.GetInt("comm_batch_no");
            info.comm_dir = unpacker.GetInt("comm_dir");
            info.comm_status = unpacker.GetStr("comm_status");
            info.comm_opor = unpacker.GetInt("comm_opor");
            info.disp_date = unpacker.GetInt("disp_date");
            info.disp_time = unpacker.GetInt("disp_time");
            info.before_comm_executor = unpacker.GetInt("before_comm_executor");
            info.comm_executor = unpacker.GetInt("comm_executor");
            info.is_withdraw = unpacker.GetInt("is_withdraw");
            info.disp_flag = unpacker.GetInt("disp_flag");
            info.disp_remark = unpacker.GetStr("disp_remark");
            info.update_times = unpacker.GetInt("update_times");
            tdfutuL_3_9_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdfutuL_3_9_InfoList.Add((tdfutuL_3_9_Info)info);
        }
        #endregion

        //逻辑_交易期货_指令_查询历史指令分发结果集
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdfutuL_3_9_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    info.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    info.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    info.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    info.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    info.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    info.comm_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DATE_INT);
                    info.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                    info.comm_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT);
                    info.comm_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_INT);
                    info.comm_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_STATUS_STR);
                    info.comm_opor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPOR_INT);
                    info.disp_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DISP_DATE_INT);
                    info.disp_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DISP_TIME_INT);
                    info.before_comm_executor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEFORE_COMM_EXECUTOR_INT);
                    info.comm_executor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_EXECUTOR_INT);
                    info.is_withdraw = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_WITHDRAW_INT);
                    info.disp_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DISP_FLAG_INT);
                    info.disp_remark = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DISP_REMARK_STR);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdfutuL_3_9_InfoList.Add(info);
                }
            }
        }
    }

    public class tdfutuL_3_10_Response : IResponse
    {
        #region 构造函数
        public tdfutuL_3_10_Response()
        {
            this.tdfutuL_3_10_InfoList = new ObservableCollection<tdfutuL_3_10_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdfutuL_3_10_Info> tdfutuL_3_10_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdfutuL_3_10_Info info = new tdfutuL_3_10_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.opor_co_no = unpacker.GetInt("opor_co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.oper_mac = unpacker.GetStr("oper_mac");
            info.oper_ip_addr = unpacker.GetStr("oper_ip_addr");
            info.oper_info = unpacker.GetStr("oper_info");
            info.oper_way = unpacker.GetStr("oper_way");
            info.oper_func_code = unpacker.GetStr("oper_func_code");
            info.init_date = unpacker.GetInt("init_date");
            info.comm_appr_date = unpacker.GetInt("comm_appr_date");
            info.comm_appr_time = unpacker.GetInt("comm_appr_time");
            info.comm_appr_oper_no = unpacker.GetInt("comm_appr_oper_no");
            info.comm_appr_oper = unpacker.GetInt("comm_appr_oper");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.futu_acco_no = unpacker.GetInt("futu_acco_no");
            info.contrc_code_no = unpacker.GetInt("contrc_code_no");
            info.contrc_type = unpacker.GetInt("contrc_type");
            info.comm_date = unpacker.GetInt("comm_date");
            info.comm_id = unpacker.GetInt64("comm_id");
            info.comm_opor = unpacker.GetInt("comm_opor");
            info.comm_dir = unpacker.GetInt("comm_dir");
            info.comm_qty = unpacker.GetDouble("comm_qty");
            info.comm_limit_price = unpacker.GetDouble("comm_limit_price");
            info.limit_actual_price = unpacker.GetDouble("limit_actual_price");
            info.comm_begin_date = unpacker.GetInt("comm_begin_date");
            info.comm_end_date = unpacker.GetInt("comm_end_date");
            info.comm_begin_time = unpacker.GetInt("comm_begin_time");
            info.comm_end_time = unpacker.GetInt("comm_end_time");
            info.comm_appr_status = unpacker.GetStr("comm_appr_status");
            info.comm_appr_remark = unpacker.GetStr("comm_appr_remark");
            info.update_times = unpacker.GetInt("update_times");
            tdfutuL_3_10_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdfutuL_3_10_InfoList.Add((tdfutuL_3_10_Info)info);
        }
        #endregion

        //逻辑_交易期货_指令_查询指令审批结果集
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdfutuL_3_10_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    info.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    info.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    info.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    info.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.comm_appr_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_DATE_INT);
                    info.comm_appr_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_TIME_INT);
                    info.comm_appr_oper_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_OPER_NO_INT);
                    info.comm_appr_oper = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_OPER_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.futu_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT);
                    info.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    info.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    info.comm_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DATE_INT);
                    info.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                    info.comm_opor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPOR_INT);
                    info.comm_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_INT);
                    info.comm_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_QTY_FLOAT);
                    info.comm_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_LIMIT_PRICE_FLOAT);
                    info.limit_actual_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT);
                    info.comm_begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BEGIN_DATE_INT);
                    info.comm_end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_END_DATE_INT);
                    info.comm_begin_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BEGIN_TIME_INT);
                    info.comm_end_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_END_TIME_INT);
                    info.comm_appr_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_STATUS_STR);
                    info.comm_appr_remark = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_REMARK_STR);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdfutuL_3_10_InfoList.Add(info);
                }
            }
        }
    }

    public class tdfutuL_3_11_Response : IResponse
    {
        #region 构造函数
        public tdfutuL_3_11_Response()
        {
            this.tdfutuL_3_11_InfoList = new ObservableCollection<tdfutuL_3_11_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdfutuL_3_11_Info> tdfutuL_3_11_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdfutuL_3_11_Info info = new tdfutuL_3_11_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.opor_co_no = unpacker.GetInt("opor_co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.oper_mac = unpacker.GetStr("oper_mac");
            info.oper_ip_addr = unpacker.GetStr("oper_ip_addr");
            info.oper_info = unpacker.GetStr("oper_info");
            info.oper_way = unpacker.GetStr("oper_way");
            info.oper_func_code = unpacker.GetStr("oper_func_code");
            info.init_date = unpacker.GetInt("init_date");
            info.comm_appr_date = unpacker.GetInt("comm_appr_date");
            info.comm_appr_time = unpacker.GetInt("comm_appr_time");
            info.comm_appr_oper_no = unpacker.GetInt("comm_appr_oper_no");
            info.comm_appr_oper = unpacker.GetInt("comm_appr_oper");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.futu_acco_no = unpacker.GetInt("futu_acco_no");
            info.contrc_type = unpacker.GetInt("contrc_type");
            info.comm_date = unpacker.GetInt("comm_date");
            info.comm_id = unpacker.GetInt64("comm_id");
            info.comm_opor = unpacker.GetInt("comm_opor");
            info.comm_dir = unpacker.GetInt("comm_dir");
            info.comm_qty = unpacker.GetDouble("comm_qty");
            info.comm_limit_price = unpacker.GetDouble("comm_limit_price");
            info.limit_actual_price = unpacker.GetDouble("limit_actual_price");
            info.comm_begin_date = unpacker.GetInt("comm_begin_date");
            info.comm_end_date = unpacker.GetInt("comm_end_date");
            info.comm_begin_time = unpacker.GetInt("comm_begin_time");
            info.comm_end_time = unpacker.GetInt("comm_end_time");
            info.comm_appr_status = unpacker.GetStr("comm_appr_status");
            info.comm_appr_remark = unpacker.GetStr("comm_appr_remark");
            info.update_times = unpacker.GetInt("update_times");
            tdfutuL_3_11_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdfutuL_3_11_InfoList.Add((tdfutuL_3_11_Info)info);
        }
        #endregion

        //逻辑_交易期货_指令_查询历史指令审批结果集
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdfutuL_3_11_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    info.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    info.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    info.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    info.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.comm_appr_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_DATE_INT);
                    info.comm_appr_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_TIME_INT);
                    info.comm_appr_oper_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_OPER_NO_INT);
                    info.comm_appr_oper = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_OPER_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.futu_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT);
                    info.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    info.comm_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DATE_INT);
                    info.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                    info.comm_opor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPOR_INT);
                    info.comm_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_INT);
                    info.comm_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_QTY_FLOAT);
                    info.comm_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_LIMIT_PRICE_FLOAT);
                    info.limit_actual_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT);
                    info.comm_begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BEGIN_DATE_INT);
                    info.comm_end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_END_DATE_INT);
                    info.comm_begin_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BEGIN_TIME_INT);
                    info.comm_end_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_END_TIME_INT);
                    info.comm_appr_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_STATUS_STR);
                    info.comm_appr_remark = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_REMARK_STR);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdfutuL_3_11_InfoList.Add(info);
                }
            }
        }
    }

    public class tdfutuL_3_12_Response : IResponse
    {
        #region 构造函数
        public tdfutuL_3_12_Response()
        {
            this.tdfutuL_3_12_InfoList = new ObservableCollection<tdfutuL_3_12_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdfutuL_3_12_Info> tdfutuL_3_12_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdfutuL_3_12_Info info = new tdfutuL_3_12_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.opor_co_no = unpacker.GetInt("opor_co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.oper_mac = unpacker.GetStr("oper_mac");
            info.oper_ip_addr = unpacker.GetStr("oper_ip_addr");
            info.oper_info = unpacker.GetStr("oper_info");
            info.oper_way = unpacker.GetStr("oper_way");
            info.oper_func_code = unpacker.GetStr("oper_func_code");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.contrc_code_no = unpacker.GetInt("contrc_code_no");
            info.asset_type = unpacker.GetInt("asset_type");
            info.comm_opor = unpacker.GetInt("comm_opor");
            info.comm_executor = unpacker.GetInt("comm_executor");
            info.comm_date = unpacker.GetInt("comm_date");
            info.comm_time = unpacker.GetInt("comm_time");
            info.comm_batch_no = unpacker.GetInt("comm_batch_no");
            info.comm_dir = unpacker.GetInt("comm_dir");
            info.contrc_dir = unpacker.GetInt("contrc_dir");
            info.comm_limit_price = unpacker.GetDouble("comm_limit_price");
            info.limit_actual_price = unpacker.GetDouble("limit_actual_price");
            info.comm_qty = unpacker.GetDouble("comm_qty");
            info.comm_amt = unpacker.GetDouble("comm_amt");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.comm_cancel_qty = unpacker.GetDouble("comm_cancel_qty");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.strike_status = unpacker.GetStr("strike_status");
            info.comm_sum_status = unpacker.GetStr("comm_sum_status");
            info.comm_begin_date = unpacker.GetInt("comm_begin_date");
            info.comm_end_date = unpacker.GetInt("comm_end_date");
            info.comm_begin_time = unpacker.GetInt("comm_begin_time");
            info.comm_end_time = unpacker.GetInt("comm_end_time");
            info.comm_comple_date = unpacker.GetInt("comm_comple_date");
            info.comm_comple_time = unpacker.GetInt("comm_comple_time");
            info.max_comm_comple_date = unpacker.GetInt("max_comm_comple_date");
            info.max_comm_comple_time = unpacker.GetInt("max_comm_comple_time");
            info.comm_appr_date = unpacker.GetInt("comm_appr_date");
            info.comm_appr_time = unpacker.GetInt("comm_appr_time");
            info.comm_sum_approve_status = unpacker.GetStr("comm_sum_approve_status");
            info.buy_order_qty = unpacker.GetDouble("buy_order_qty");
            info.sell_order_qty = unpacker.GetDouble("sell_order_qty");
            info.buy_comm_qty = unpacker.GetDouble("buy_comm_qty");
            info.sell_comm_qty = unpacker.GetDouble("sell_comm_qty");
            info.buy_strike_qty = unpacker.GetDouble("buy_strike_qty");
            info.sell_strike_qty = unpacker.GetDouble("sell_strike_qty");
            info.buy_strike_amt = unpacker.GetDouble("buy_strike_amt");
            info.sell_strike_amt = unpacker.GetDouble("sell_strike_amt");
            info.buy_comm_amt = unpacker.GetDouble("buy_comm_amt");
            info.sell_comm_amt = unpacker.GetDouble("sell_comm_amt");
            info.comm_oper_way = unpacker.GetStr("comm_oper_way");
            info.exch_crncy_type = unpacker.GetStr("exch_crncy_type");
            info.rece_margin = unpacker.GetDouble("rece_margin");
            info.hedge_type = unpacker.GetInt("hedge_type");
            info.update_times = unpacker.GetInt("update_times");
            tdfutuL_3_12_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdfutuL_3_12_InfoList.Add((tdfutuL_3_12_Info)info);
        }
        #endregion

        //逻辑_交易期货_指令_查询汇总指令结果集
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdfutuL_3_12_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    info.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    info.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    info.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    info.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    info.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    info.comm_opor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPOR_INT);
                    info.comm_executor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_EXECUTOR_INT);
                    info.comm_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DATE_INT);
                    info.comm_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_TIME_INT);
                    info.comm_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT);
                    info.comm_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_INT);
                    info.contrc_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_DIR_INT);
                    info.comm_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_LIMIT_PRICE_FLOAT);
                    info.limit_actual_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT);
                    info.comm_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_QTY_FLOAT);
                    info.comm_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_AMT_FLOAT);
                    info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    info.comm_cancel_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_CANCEL_QTY_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.strike_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_STATUS_STR);
                    info.comm_sum_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_SUM_STATUS_STR);
                    info.comm_begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BEGIN_DATE_INT);
                    info.comm_end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_END_DATE_INT);
                    info.comm_begin_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BEGIN_TIME_INT);
                    info.comm_end_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_END_TIME_INT);
                    info.comm_comple_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_COMPLE_DATE_INT);
                    info.comm_comple_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_COMPLE_TIME_INT);
                    info.max_comm_comple_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MAX_COMM_COMPLE_DATE_INT);
                    info.max_comm_comple_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MAX_COMM_COMPLE_TIME_INT);
                    info.comm_appr_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_DATE_INT);
                    info.comm_appr_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_TIME_INT);
                    info.comm_sum_approve_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_SUM_APPROVE_STATUS_STR);
                    info.buy_order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_ORDER_QTY_FLOAT);
                    info.sell_order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_ORDER_QTY_FLOAT);
                    info.buy_comm_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_COMM_QTY_FLOAT);
                    info.sell_comm_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_COMM_QTY_FLOAT);
                    info.buy_strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_STRIKE_QTY_FLOAT);
                    info.sell_strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_STRIKE_QTY_FLOAT);
                    info.buy_strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_STRIKE_AMT_FLOAT);
                    info.sell_strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_STRIKE_AMT_FLOAT);
                    info.buy_comm_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_COMM_AMT_FLOAT);
                    info.sell_comm_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_COMM_AMT_FLOAT);
                    info.comm_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPER_WAY_STR);
                    info.exch_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR);
                    info.rece_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RECE_MARGIN_FLOAT);
                    info.hedge_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdfutuL_3_12_InfoList.Add(info);
                }
            }
        }
    }

    public class tdfutuL_3_13_Response : IResponse
    {
        #region 构造函数
        public tdfutuL_3_13_Response()
        {
            this.tdfutuL_3_13_InfoList = new ObservableCollection<tdfutuL_3_13_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdfutuL_3_13_Info> tdfutuL_3_13_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdfutuL_3_13_Info info = new tdfutuL_3_13_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.opor_co_no = unpacker.GetInt("opor_co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.oper_mac = unpacker.GetStr("oper_mac");
            info.oper_ip_addr = unpacker.GetStr("oper_ip_addr");
            info.oper_info = unpacker.GetStr("oper_info");
            info.oper_way = unpacker.GetStr("oper_way");
            info.oper_func_code = unpacker.GetStr("oper_func_code");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.contrc_code_no = unpacker.GetInt("contrc_code_no");
            info.asset_type = unpacker.GetInt("asset_type");
            info.comm_opor = unpacker.GetInt("comm_opor");
            info.comm_executor = unpacker.GetInt("comm_executor");
            info.comm_date = unpacker.GetInt("comm_date");
            info.comm_time = unpacker.GetInt("comm_time");
            info.comm_batch_no = unpacker.GetInt("comm_batch_no");
            info.comm_dir = unpacker.GetInt("comm_dir");
            info.contrc_dir = unpacker.GetInt("contrc_dir");
            info.comm_limit_price = unpacker.GetDouble("comm_limit_price");
            info.limit_actual_price = unpacker.GetDouble("limit_actual_price");
            info.comm_qty = unpacker.GetDouble("comm_qty");
            info.comm_amt = unpacker.GetDouble("comm_amt");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.comm_cancel_qty = unpacker.GetDouble("comm_cancel_qty");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.strike_status = unpacker.GetStr("strike_status");
            info.comm_sum_status = unpacker.GetStr("comm_sum_status");
            info.comm_begin_date = unpacker.GetInt("comm_begin_date");
            info.comm_end_date = unpacker.GetInt("comm_end_date");
            info.comm_begin_time = unpacker.GetInt("comm_begin_time");
            info.comm_end_time = unpacker.GetInt("comm_end_time");
            info.comm_comple_date = unpacker.GetInt("comm_comple_date");
            info.comm_comple_time = unpacker.GetInt("comm_comple_time");
            info.max_comm_comple_date = unpacker.GetInt("max_comm_comple_date");
            info.max_comm_comple_time = unpacker.GetInt("max_comm_comple_time");
            info.comm_appr_date = unpacker.GetInt("comm_appr_date");
            info.comm_appr_time = unpacker.GetInt("comm_appr_time");
            info.comm_sum_approve_status = unpacker.GetStr("comm_sum_approve_status");
            info.buy_order_qty = unpacker.GetDouble("buy_order_qty");
            info.sell_order_qty = unpacker.GetDouble("sell_order_qty");
            info.buy_comm_qty = unpacker.GetDouble("buy_comm_qty");
            info.sell_comm_qty = unpacker.GetDouble("sell_comm_qty");
            info.buy_strike_qty = unpacker.GetDouble("buy_strike_qty");
            info.sell_strike_qty = unpacker.GetDouble("sell_strike_qty");
            info.buy_strike_amt = unpacker.GetDouble("buy_strike_amt");
            info.sell_strike_amt = unpacker.GetDouble("sell_strike_amt");
            info.buy_comm_amt = unpacker.GetDouble("buy_comm_amt");
            info.sell_comm_amt = unpacker.GetDouble("sell_comm_amt");
            info.comm_oper_way = unpacker.GetStr("comm_oper_way");
            info.rece_margin = unpacker.GetDouble("rece_margin");
            info.hedge_type = unpacker.GetInt("hedge_type");
            info.update_times = unpacker.GetInt("update_times");
            tdfutuL_3_13_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdfutuL_3_13_InfoList.Add((tdfutuL_3_13_Info)info);
        }
        #endregion

        //逻辑_交易期货_指令_查询历史汇总指令结果集
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdfutuL_3_13_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    info.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    info.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    info.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    info.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    info.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    info.comm_opor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPOR_INT);
                    info.comm_executor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_EXECUTOR_INT);
                    info.comm_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DATE_INT);
                    info.comm_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_TIME_INT);
                    info.comm_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT);
                    info.comm_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_INT);
                    info.contrc_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_DIR_INT);
                    info.comm_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_LIMIT_PRICE_FLOAT);
                    info.limit_actual_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT);
                    info.comm_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_QTY_FLOAT);
                    info.comm_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_AMT_FLOAT);
                    info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    info.comm_cancel_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_CANCEL_QTY_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.strike_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_STATUS_STR);
                    info.comm_sum_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_SUM_STATUS_STR);
                    info.comm_begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BEGIN_DATE_INT);
                    info.comm_end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_END_DATE_INT);
                    info.comm_begin_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BEGIN_TIME_INT);
                    info.comm_end_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_END_TIME_INT);
                    info.comm_comple_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_COMPLE_DATE_INT);
                    info.comm_comple_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_COMPLE_TIME_INT);
                    info.max_comm_comple_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MAX_COMM_COMPLE_DATE_INT);
                    info.max_comm_comple_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MAX_COMM_COMPLE_TIME_INT);
                    info.comm_appr_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_DATE_INT);
                    info.comm_appr_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_TIME_INT);
                    info.comm_sum_approve_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_SUM_APPROVE_STATUS_STR);
                    info.buy_order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_ORDER_QTY_FLOAT);
                    info.sell_order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_ORDER_QTY_FLOAT);
                    info.buy_comm_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_COMM_QTY_FLOAT);
                    info.sell_comm_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_COMM_QTY_FLOAT);
                    info.buy_strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_STRIKE_QTY_FLOAT);
                    info.sell_strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_STRIKE_QTY_FLOAT);
                    info.buy_strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_STRIKE_AMT_FLOAT);
                    info.sell_strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_STRIKE_AMT_FLOAT);
                    info.buy_comm_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_COMM_AMT_FLOAT);
                    info.sell_comm_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_COMM_AMT_FLOAT);
                    info.comm_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPER_WAY_STR);
                    info.rece_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RECE_MARGIN_FLOAT);
                    info.hedge_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdfutuL_3_13_InfoList.Add(info);
                }
            }
        }
    }

}
