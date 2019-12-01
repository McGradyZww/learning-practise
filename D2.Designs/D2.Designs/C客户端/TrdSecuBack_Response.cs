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
    public class tdsecuL_10_31_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_10_31_Response()
        {
            this.tdsecuL_10_31_InfoList = new ObservableCollection<tdsecuL_10_31_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_10_31_Info> tdsecuL_10_31_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_10_31_Info info = new tdsecuL_10_31_Info();
            info.opor_co_no = unpacker.GetInt("opor_co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.oper_mac = unpacker.GetStr("oper_mac");
            info.oper_ip_addr = unpacker.GetStr("oper_ip_addr");
            info.oper_info = unpacker.GetStr("oper_info");
            info.oper_way = unpacker.GetStr("oper_way");
            info.oper_func_code = unpacker.GetStr("oper_func_code");
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.asset_type = unpacker.GetInt("asset_type");
            info.stock_type = unpacker.GetInt("stock_type");
            info.comm_opor = unpacker.GetInt("comm_opor");
            info.comm_executor = unpacker.GetInt("comm_executor");
            info.comm_id = unpacker.GetInt64("comm_id");
            info.comm_date = unpacker.GetInt("comm_date");
            info.comm_time = unpacker.GetInt("comm_time");
            info.comm_batch_no = unpacker.GetInt("comm_batch_no");
            info.comm_dir = unpacker.GetInt("comm_dir");
            info.comm_limit_price = unpacker.GetDouble("comm_limit_price");
            info.limit_actual_price = unpacker.GetDouble("limit_actual_price");
            info.comm_qty = unpacker.GetDouble("comm_qty");
            info.comm_amt = unpacker.GetDouble("comm_amt");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.comm_cancel_qty = unpacker.GetDouble("comm_cancel_qty");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.comm_frozen_amt = unpacker.GetDouble("comm_frozen_amt");
            info.comm_frozen_qty = unpacker.GetDouble("comm_frozen_qty");
            info.net_price_flag = unpacker.GetInt("net_price_flag");
            info.par_value = unpacker.GetDouble("par_value");
            info.bond_accr_intrst = unpacker.GetDouble("bond_accr_intrst");
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
            info.basket_id = unpacker.GetInt64("basket_id");
            info.comm_oper_way = unpacker.GetStr("comm_oper_way");
            info.exter_comm_flag = unpacker.GetInt("exter_comm_flag");
            info.comm_comple_flag = unpacker.GetInt("comm_comple_flag");
            info.update_times = unpacker.GetInt("update_times");
            tdsecuL_10_31_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_10_31_InfoList.Add((tdsecuL_10_31_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易运维_查询指令
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_10_31_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    info.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    info.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    info.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    info.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.comm_opor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPOR_INT);
                    info.comm_executor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_EXECUTOR_INT);
                    info.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                    info.comm_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DATE_INT);
                    info.comm_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_TIME_INT);
                    info.comm_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT);
                    info.comm_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_INT);
                    info.comm_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_LIMIT_PRICE_FLOAT);
                    info.limit_actual_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT);
                    info.comm_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_QTY_FLOAT);
                    info.comm_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_AMT_FLOAT);
                    info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    info.comm_cancel_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_CANCEL_QTY_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.comm_frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_FROZEN_AMT_FLOAT);
                    info.comm_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_FROZEN_QTY_FLOAT);
                    info.net_price_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLAG_INT);
                    info.par_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_FLOAT);
                    info.bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT);
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
                    info.basket_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_ID_INT64);
                    info.comm_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPER_WAY_STR);
                    info.exter_comm_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXTER_COMM_FLAG_INT);
                    info.comm_comple_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_COMPLE_FLAG_INT);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdsecuL_10_31_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_10_32_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_10_32_Response()
        {
            this.tdsecuL_10_32_InfoList = new ObservableCollection<tdsecuL_10_32_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_10_32_Info> tdsecuL_10_32_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_10_32_Info info = new tdsecuL_10_32_Info();
            info.opor_co_no = unpacker.GetInt("opor_co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.oper_mac = unpacker.GetStr("oper_mac");
            info.oper_ip_addr = unpacker.GetStr("oper_ip_addr");
            info.oper_info = unpacker.GetStr("oper_info");
            info.oper_way = unpacker.GetStr("oper_way");
            info.oper_func_code = unpacker.GetStr("oper_func_code");
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.asset_type = unpacker.GetInt("asset_type");
            info.stock_type = unpacker.GetInt("stock_type");
            info.comm_opor = unpacker.GetInt("comm_opor");
            info.comm_executor = unpacker.GetInt("comm_executor");
            info.comm_id = unpacker.GetInt64("comm_id");
            info.comm_date = unpacker.GetInt("comm_date");
            info.comm_time = unpacker.GetInt("comm_time");
            info.comm_batch_no = unpacker.GetInt("comm_batch_no");
            info.comm_dir = unpacker.GetInt("comm_dir");
            info.comm_limit_price = unpacker.GetDouble("comm_limit_price");
            info.limit_actual_price = unpacker.GetDouble("limit_actual_price");
            info.comm_qty = unpacker.GetDouble("comm_qty");
            info.comm_amt = unpacker.GetDouble("comm_amt");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.comm_cancel_qty = unpacker.GetDouble("comm_cancel_qty");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.comm_frozen_amt = unpacker.GetDouble("comm_frozen_amt");
            info.comm_frozen_qty = unpacker.GetDouble("comm_frozen_qty");
            info.net_price_flag = unpacker.GetInt("net_price_flag");
            info.par_value = unpacker.GetDouble("par_value");
            info.bond_accr_intrst = unpacker.GetDouble("bond_accr_intrst");
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
            info.basket_id = unpacker.GetInt64("basket_id");
            info.comm_oper_way = unpacker.GetStr("comm_oper_way");
            info.exter_comm_flag = unpacker.GetInt("exter_comm_flag");
            info.comm_comple_flag = unpacker.GetInt("comm_comple_flag");
            info.update_times = unpacker.GetInt("update_times");
            tdsecuL_10_32_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_10_32_InfoList.Add((tdsecuL_10_32_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易运维_查询指令历史
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_10_32_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    info.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    info.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    info.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    info.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.comm_opor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPOR_INT);
                    info.comm_executor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_EXECUTOR_INT);
                    info.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                    info.comm_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DATE_INT);
                    info.comm_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_TIME_INT);
                    info.comm_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT);
                    info.comm_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_INT);
                    info.comm_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_LIMIT_PRICE_FLOAT);
                    info.limit_actual_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT);
                    info.comm_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_QTY_FLOAT);
                    info.comm_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_AMT_FLOAT);
                    info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    info.comm_cancel_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_CANCEL_QTY_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.comm_frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_FROZEN_AMT_FLOAT);
                    info.comm_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_FROZEN_QTY_FLOAT);
                    info.net_price_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLAG_INT);
                    info.par_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_FLOAT);
                    info.bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT);
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
                    info.basket_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_ID_INT64);
                    info.comm_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPER_WAY_STR);
                    info.exter_comm_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXTER_COMM_FLAG_INT);
                    info.comm_comple_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_COMPLE_FLAG_INT);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdsecuL_10_32_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_10_41_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_10_41_Response()
        {
            this.tdsecuL_10_41_InfoList = new ObservableCollection<tdsecuL_10_41_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_10_41_Info> tdsecuL_10_41_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_10_41_Info info = new tdsecuL_10_41_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.opor_co_no = unpacker.GetInt("opor_co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.oper_mac = unpacker.GetStr("oper_mac");
            info.oper_ip_addr = unpacker.GetStr("oper_ip_addr");
            info.oper_info = unpacker.GetStr("oper_info");
            info.oper_way = unpacker.GetStr("oper_way");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.asset_type = unpacker.GetInt("asset_type");
            info.stock_type = unpacker.GetInt("stock_type");
            info.comm_opor = unpacker.GetInt("comm_opor");
            info.external_no = unpacker.GetInt64("external_no");
            info.comm_id = unpacker.GetInt64("comm_id");
            info.report_date = unpacker.GetInt("report_date");
            info.report_time = unpacker.GetInt("report_time");
            info.report_no = unpacker.GetStr("report_no");
            info.order_batch_no = unpacker.GetInt("order_batch_no");
            info.order_id = unpacker.GetInt64("order_id");
            info.comm_batch_no = unpacker.GetInt("comm_batch_no");
            info.order_date = unpacker.GetInt("order_date");
            info.order_time = unpacker.GetInt("order_time");
            info.order_dir = unpacker.GetInt("order_dir");
            info.price_type = unpacker.GetInt("price_type");
            info.order_price = unpacker.GetDouble("order_price");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.order_status = unpacker.GetStr("order_status");
            info.wtdraw_qty = unpacker.GetDouble("wtdraw_qty");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.strike_qty = unpacker.GetDouble("strike_qty");
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
            info.order_frozen_amt = unpacker.GetDouble("order_frozen_amt");
            info.order_frozen_qty = unpacker.GetDouble("order_frozen_qty");
            info.rsp_info = unpacker.GetStr("rsp_info");
            info.compli_trig_id = unpacker.GetInt64("compli_trig_id");
            info.remark_info = unpacker.GetStr("remark_info");
            info.order_oper_way = unpacker.GetStr("order_oper_way");
            info.update_times = unpacker.GetInt("update_times");
            tdsecuL_10_41_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_10_41_InfoList.Add((tdsecuL_10_41_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易运维_查询订单
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_10_41_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    info.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    info.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    info.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.comm_opor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPOR_INT);
                    info.external_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64);
                    info.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                    info.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                    info.report_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_TIME_INT);
                    info.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    info.order_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT);
                    info.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                    info.comm_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT);
                    info.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    info.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.price_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_INT);
                    info.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    info.order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR);
                    info.wtdraw_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_QTY_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
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
                    info.order_frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_FROZEN_AMT_FLOAT);
                    info.order_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_FROZEN_QTY_FLOAT);
                    info.rsp_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RSP_INFO_STR);
                    info.compli_trig_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_TRIG_ID_INT64);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    info.order_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdsecuL_10_41_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_10_42_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_10_42_Response()
        {
            this.tdsecuL_10_42_InfoList = new ObservableCollection<tdsecuL_10_42_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_10_42_Info> tdsecuL_10_42_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_10_42_Info info = new tdsecuL_10_42_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.opor_co_no = unpacker.GetInt("opor_co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.oper_mac = unpacker.GetStr("oper_mac");
            info.oper_ip_addr = unpacker.GetStr("oper_ip_addr");
            info.oper_info = unpacker.GetStr("oper_info");
            info.oper_way = unpacker.GetStr("oper_way");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.asset_type = unpacker.GetInt("asset_type");
            info.stock_type = unpacker.GetInt("stock_type");
            info.comm_opor = unpacker.GetInt("comm_opor");
            info.external_no = unpacker.GetInt64("external_no");
            info.comm_id = unpacker.GetInt64("comm_id");
            info.comm_batch_no = unpacker.GetInt("comm_batch_no");
            info.report_date = unpacker.GetInt("report_date");
            info.report_time = unpacker.GetInt("report_time");
            info.report_no = unpacker.GetStr("report_no");
            info.order_batch_no = unpacker.GetInt("order_batch_no");
            info.order_id = unpacker.GetInt64("order_id");
            info.order_date = unpacker.GetInt("order_date");
            info.order_time = unpacker.GetInt("order_time");
            info.order_dir = unpacker.GetInt("order_dir");
            info.price_type = unpacker.GetInt("price_type");
            info.order_price = unpacker.GetDouble("order_price");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.order_status = unpacker.GetStr("order_status");
            info.wtdraw_qty = unpacker.GetDouble("wtdraw_qty");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.strike_qty = unpacker.GetDouble("strike_qty");
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
            info.order_frozen_amt = unpacker.GetDouble("order_frozen_amt");
            info.order_frozen_qty = unpacker.GetDouble("order_frozen_qty");
            info.rsp_info = unpacker.GetStr("rsp_info");
            info.compli_trig_id = unpacker.GetInt64("compli_trig_id");
            info.remark_info = unpacker.GetStr("remark_info");
            info.order_oper_way = unpacker.GetStr("order_oper_way");
            info.update_times = unpacker.GetInt("update_times");
            tdsecuL_10_42_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_10_42_InfoList.Add((tdsecuL_10_42_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易运维_查询订单历史
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_10_42_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    info.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    info.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    info.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.comm_opor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPOR_INT);
                    info.external_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64);
                    info.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                    info.comm_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT);
                    info.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                    info.report_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_TIME_INT);
                    info.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    info.order_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT);
                    info.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                    info.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    info.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.price_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_INT);
                    info.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    info.order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR);
                    info.wtdraw_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_QTY_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
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
                    info.order_frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_FROZEN_AMT_FLOAT);
                    info.order_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_FROZEN_QTY_FLOAT);
                    info.rsp_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RSP_INFO_STR);
                    info.compli_trig_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_TRIG_ID_INT64);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    info.order_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdsecuL_10_42_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_10_51_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_10_51_Response()
        {
            this.tdsecuL_10_51_InfoList = new ObservableCollection<tdsecuL_10_51_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_10_51_Info> tdsecuL_10_51_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_10_51_Info info = new tdsecuL_10_51_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.init_date = unpacker.GetInt("init_date");
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco = unpacker.GetStr("stock_acco");
            info.stock_code = unpacker.GetStr("stock_code");
            info.report_date = unpacker.GetInt("report_date");
            info.report_time = unpacker.GetInt("report_time");
            info.report_no = unpacker.GetStr("report_no");
            info.order_date = unpacker.GetInt("order_date");
            info.order_id = unpacker.GetInt64("order_id");
            info.order_dir = unpacker.GetInt("order_dir");
            info.order_price = unpacker.GetDouble("order_price");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.price_type = unpacker.GetInt("price_type");
            info.order_rsp_status = unpacker.GetStr("order_rsp_status");
            info.rsp_info = unpacker.GetStr("rsp_info");
            info.deal_status = unpacker.GetStr("deal_status");
            info.update_times = unpacker.GetInt("update_times");
            tdsecuL_10_51_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_10_51_InfoList.Add((tdsecuL_10_51_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易运维_查询订单回报
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_10_51_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                    info.report_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_TIME_INT);
                    info.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    info.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    info.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    info.price_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_INT);
                    info.order_rsp_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_RSP_STATUS_STR);
                    info.rsp_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RSP_INFO_STR);
                    info.deal_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_STATUS_STR);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdsecuL_10_51_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_10_52_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_10_52_Response()
        {
            this.tdsecuL_10_52_InfoList = new ObservableCollection<tdsecuL_10_52_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_10_52_Info> tdsecuL_10_52_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_10_52_Info info = new tdsecuL_10_52_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.init_date = unpacker.GetInt("init_date");
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco = unpacker.GetStr("stock_acco");
            info.stock_code = unpacker.GetStr("stock_code");
            info.strike_date = unpacker.GetInt("strike_date");
            info.strike_time = unpacker.GetInt("strike_time");
            info.strike_no = unpacker.GetStr("strike_no");
            info.report_no = unpacker.GetStr("report_no");
            info.order_dir = unpacker.GetInt("order_dir");
            info.strike_price = unpacker.GetDouble("strike_price");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.strike_deal_type = unpacker.GetInt("strike_deal_type");
            info.rsp_info = unpacker.GetStr("rsp_info");
            info.deal_status = unpacker.GetStr("deal_status");
            info.update_times = unpacker.GetInt("update_times");
            info.report_date = unpacker.GetInt("report_date");
            tdsecuL_10_52_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_10_52_InfoList.Add((tdsecuL_10_52_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易运维_查询成交回报
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_10_52_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.strike_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT);
                    info.strike_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_TIME_INT);
                    info.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                    info.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_PRICE_FLOAT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    info.strike_deal_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DEAL_TYPE_INT);
                    info.rsp_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RSP_INFO_STR);
                    info.deal_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_STATUS_STR);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    info.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                    tdsecuL_10_52_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_10_53_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_10_53_Response()
        {
            this.tdsecuL_10_53_InfoList = new ObservableCollection<tdsecuL_10_53_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_10_53_Info> tdsecuL_10_53_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_10_53_Info info = new tdsecuL_10_53_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_type = unpacker.GetInt("stock_type");
            info.comm_id = unpacker.GetInt64("comm_id");
            info.comm_batch_no = unpacker.GetInt("comm_batch_no");
            info.strike_date = unpacker.GetInt("strike_date");
            info.strike_time = unpacker.GetInt("strike_time");
            info.strike_no = unpacker.GetStr("strike_no");
            info.report_date = unpacker.GetInt("report_date");
            info.report_no = unpacker.GetStr("report_no");
            info.order_date = unpacker.GetInt("order_date");
            info.order_time = unpacker.GetInt("order_time");
            info.order_id = unpacker.GetInt64("order_id");
            info.order_dir = unpacker.GetInt("order_dir");
            info.order_price = unpacker.GetDouble("order_price");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.strike_price = unpacker.GetDouble("strike_price");
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
            info.strike_bond_accr_intrst = unpacker.GetDouble("strike_bond_accr_intrst");
            info.net_price_flag = unpacker.GetInt("net_price_flag");
            info.order_oper_way = unpacker.GetStr("order_oper_way");
            info.exter_comm_flag = unpacker.GetInt("exter_comm_flag");
            info.record_valid_flag = unpacker.GetInt("record_valid_flag");
            info.update_times = unpacker.GetInt("update_times");
            tdsecuL_10_53_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_10_53_InfoList.Add((tdsecuL_10_53_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易运维_查询成交明细
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_10_53_Info();
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
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                    info.comm_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT);
                    info.strike_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT);
                    info.strike_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_TIME_INT);
                    info.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                    info.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                    info.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    info.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    info.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                    info.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_PRICE_FLOAT);
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
                    info.strike_bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_BOND_ACCR_INTRST_FLOAT);
                    info.net_price_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLAG_INT);
                    info.order_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR);
                    info.exter_comm_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXTER_COMM_FLAG_INT);
                    info.record_valid_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RECORD_VALID_FLAG_INT);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdsecuL_10_53_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_10_54_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_10_54_Response()
        {
            this.tdsecuL_10_54_InfoList = new ObservableCollection<tdsecuL_10_54_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_10_54_Info> tdsecuL_10_54_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_10_54_Info info = new tdsecuL_10_54_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_type = unpacker.GetInt("stock_type");
            info.comm_id = unpacker.GetInt64("comm_id");
            info.comm_batch_no = unpacker.GetInt("comm_batch_no");
            info.strike_date = unpacker.GetInt("strike_date");
            info.strike_time = unpacker.GetInt("strike_time");
            info.strike_no = unpacker.GetStr("strike_no");
            info.report_date = unpacker.GetInt("report_date");
            info.report_no = unpacker.GetStr("report_no");
            info.order_date = unpacker.GetInt("order_date");
            info.order_time = unpacker.GetInt("order_time");
            info.order_id = unpacker.GetInt64("order_id");
            info.order_dir = unpacker.GetInt("order_dir");
            info.order_price = unpacker.GetDouble("order_price");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.strike_price = unpacker.GetDouble("strike_price");
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
            info.strike_bond_accr_intrst = unpacker.GetDouble("strike_bond_accr_intrst");
            info.order_oper_way = unpacker.GetStr("order_oper_way");
            info.exter_comm_flag = unpacker.GetInt("exter_comm_flag");
            info.record_valid_flag = unpacker.GetInt("record_valid_flag");
            info.update_times = unpacker.GetInt("update_times");
            tdsecuL_10_54_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_10_54_InfoList.Add((tdsecuL_10_54_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易运维_查询成交明细历史
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_10_54_Info();
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
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                    info.comm_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT);
                    info.strike_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT);
                    info.strike_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_TIME_INT);
                    info.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                    info.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                    info.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    info.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    info.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                    info.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_PRICE_FLOAT);
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
                    info.strike_bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_BOND_ACCR_INTRST_FLOAT);
                    info.order_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR);
                    info.exter_comm_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXTER_COMM_FLAG_INT);
                    info.record_valid_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RECORD_VALID_FLAG_INT);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdsecuL_10_54_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_10_55_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_10_55_Response()
        {
            this.tdsecuL_10_55_InfoList = new ObservableCollection<tdsecuL_10_55_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_10_55_Info> tdsecuL_10_55_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_10_55_Info info = new tdsecuL_10_55_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.order_status = unpacker.GetStr("order_status");
            info.order_oper_way = unpacker.GetStr("order_oper_way");
            tdsecuL_10_55_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_10_55_InfoList.Add((tdsecuL_10_55_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易运维_查询机构统计订单
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_10_55_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR);
                    info.order_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR);
                    tdsecuL_10_55_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_10_56_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_10_56_Response()
        {
            this.tdsecuL_10_56_InfoList = new ObservableCollection<tdsecuL_10_56_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_10_56_Info> tdsecuL_10_56_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_10_56_Info info = new tdsecuL_10_56_Info();
            tdsecuL_10_56_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_10_56_InfoList.Add((tdsecuL_10_56_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易运维_计算资产账户持仓数量同步产品库
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_10_56_Info();
                tdsecuL_10_56_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_10_57_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_10_57_Response()
        {
            this.tdsecuL_10_57_InfoList = new ObservableCollection<tdsecuL_10_57_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_10_57_Info> tdsecuL_10_57_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_10_57_Info info = new tdsecuL_10_57_Info();
            tdsecuL_10_57_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_10_57_InfoList.Add((tdsecuL_10_57_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易运维_计算资产账户资金可用同步产品库
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_10_57_Info();
                tdsecuL_10_57_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_10_58_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_10_58_Response()
        {
            this.tdsecuL_10_58_InfoList = new ObservableCollection<tdsecuL_10_58_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_10_58_Info> tdsecuL_10_58_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_10_58_Info info = new tdsecuL_10_58_Info();
            tdsecuL_10_58_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_10_58_InfoList.Add((tdsecuL_10_58_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易运维_计算债券质押同步产品库
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_10_58_Info();
                tdsecuL_10_58_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_10_59_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_10_59_Response()
        {
            this.tdsecuL_10_59_InfoList = new ObservableCollection<tdsecuL_10_59_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_10_59_Info> tdsecuL_10_59_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_10_59_Info info = new tdsecuL_10_59_Info();
            tdsecuL_10_59_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_10_59_InfoList.Add((tdsecuL_10_59_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易运维_补单关联订单
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_10_59_Info();
                tdsecuL_10_59_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_10_60_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_10_60_Response()
        {
            this.tdsecuL_10_60_InfoList = new ObservableCollection<tdsecuL_10_60_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_10_60_Info> tdsecuL_10_60_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_10_60_Info info = new tdsecuL_10_60_Info();
            info.co_no = unpacker.GetInt("co_no");
            info.no_report_cnt = unpacker.GetInt("no_report_cnt");
            info.already_report_cnt = unpacker.GetInt("already_report_cnt");
            info.wait_report_cnt = unpacker.GetInt("wait_report_cnt");
            info.wait_report_except_cnt = unpacker.GetInt("wait_report_except_cnt");
            info.in_report_cnt = unpacker.GetInt("in_report_cnt");
            info.in_report_except_cnt = unpacker.GetInt("in_report_except_cnt");
            info.wait_cancel_cnt = unpacker.GetInt("wait_cancel_cnt");
            info.wait_cancel_except_cnt = unpacker.GetInt("wait_cancel_except_cnt");
            info.part_cancel_cnt = unpacker.GetInt("part_cancel_cnt");
            info.all_cancel_cnt = unpacker.GetInt("all_cancel_cnt");
            info.part_strike_cnt = unpacker.GetInt("part_strike_cnt");
            info.all_strike_cnt = unpacker.GetInt("all_strike_cnt");
            info.abolish_cnt = unpacker.GetInt("abolish_cnt");
            tdsecuL_10_60_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_10_60_InfoList.Add((tdsecuL_10_60_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易运维_查询机构统计异常订单
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_10_60_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.no_report_cnt = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NO_REPORT_CNT_INT);
                    info.already_report_cnt = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ALREADY_REPORT_CNT_INT);
                    info.wait_report_cnt = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WAIT_REPORT_CNT_INT);
                    info.wait_report_except_cnt = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WAIT_REPORT_EXCEPT_CNT_INT);
                    info.in_report_cnt = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IN_REPORT_CNT_INT);
                    info.in_report_except_cnt = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IN_REPORT_EXCEPT_CNT_INT);
                    info.wait_cancel_cnt = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WAIT_CANCEL_CNT_INT);
                    info.wait_cancel_except_cnt = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WAIT_CANCEL_EXCEPT_CNT_INT);
                    info.part_cancel_cnt = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PART_CANCEL_CNT_INT);
                    info.all_cancel_cnt = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ALL_CANCEL_CNT_INT);
                    info.part_strike_cnt = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PART_STRIKE_CNT_INT);
                    info.all_strike_cnt = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ALL_STRIKE_CNT_INT);
                    info.abolish_cnt = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ABOLISH_CNT_INT);
                    tdsecuL_10_60_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_10_61_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_10_61_Response()
        {
            this.tdsecuL_10_61_InfoList = new ObservableCollection<tdsecuL_10_61_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_10_61_Info> tdsecuL_10_61_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_10_61_Info info = new tdsecuL_10_61_Info();
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
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.asset_type = unpacker.GetInt("asset_type");
            info.stock_type = unpacker.GetInt("stock_type");
            info.comm_opor = unpacker.GetInt("comm_opor");
            info.comm_executor = unpacker.GetInt("comm_executor");
            info.comm_date = unpacker.GetInt("comm_date");
            info.comm_time = unpacker.GetInt("comm_time");
            info.comm_batch_no = unpacker.GetInt("comm_batch_no");
            info.comm_dir = unpacker.GetInt("comm_dir");
            info.comm_limit_price = unpacker.GetDouble("comm_limit_price");
            info.limit_actual_price = unpacker.GetDouble("limit_actual_price");
            info.comm_qty = unpacker.GetDouble("comm_qty");
            info.comm_amt = unpacker.GetDouble("comm_amt");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.comm_cancel_qty = unpacker.GetDouble("comm_cancel_qty");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.net_price_flag = unpacker.GetInt("net_price_flag");
            info.par_value = unpacker.GetDouble("par_value");
            info.bond_accr_intrst = unpacker.GetDouble("bond_accr_intrst");
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
            info.basket_id = unpacker.GetInt64("basket_id");
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
            info.exter_comm_flag = unpacker.GetInt("exter_comm_flag");
            info.exch_crncy_type = unpacker.GetStr("exch_crncy_type");
            info.valid_aver_price = unpacker.GetDouble("valid_aver_price");
            info.valid_aver_price_allday = unpacker.GetDouble("valid_aver_price_allday");
            info.exec_price_diff = unpacker.GetDouble("exec_price_diff");
            info.exec_price_diff_allday = unpacker.GetDouble("exec_price_diff_allday");
            info.valid_ratio = unpacker.GetDouble("valid_ratio");
            info.valid_ratio_allday = unpacker.GetDouble("valid_ratio_allday");
            info.valid_qty = unpacker.GetDouble("valid_qty");
            info.valid_qty_allday = unpacker.GetDouble("valid_qty_allday");
            info.update_times = unpacker.GetInt("update_times");
            info.comm_remark_info = unpacker.GetStr("comm_remark_info");
            tdsecuL_10_61_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_10_61_InfoList.Add((tdsecuL_10_61_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易运维_查询指令汇总考核
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_10_61_Info();
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
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.comm_opor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPOR_INT);
                    info.comm_executor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_EXECUTOR_INT);
                    info.comm_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DATE_INT);
                    info.comm_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_TIME_INT);
                    info.comm_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT);
                    info.comm_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_INT);
                    info.comm_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_LIMIT_PRICE_FLOAT);
                    info.limit_actual_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT);
                    info.comm_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_QTY_FLOAT);
                    info.comm_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_AMT_FLOAT);
                    info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    info.comm_cancel_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_CANCEL_QTY_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.net_price_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLAG_INT);
                    info.par_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_FLOAT);
                    info.bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT);
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
                    info.basket_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_ID_INT64);
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
                    info.exter_comm_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXTER_COMM_FLAG_INT);
                    info.exch_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR);
                    info.valid_aver_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VALID_AVER_PRICE_FLOAT);
                    info.valid_aver_price_allday = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VALID_AVER_PRICE_ALLDAY_FLOAT);
                    info.exec_price_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_PRICE_DIFF_FLOAT);
                    info.exec_price_diff_allday = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_PRICE_DIFF_ALLDAY_FLOAT);
                    info.valid_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VALID_RATIO_FLOAT);
                    info.valid_ratio_allday = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VALID_RATIO_ALLDAY_FLOAT);
                    info.valid_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VALID_QTY_FLOAT);
                    info.valid_qty_allday = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VALID_QTY_ALLDAY_FLOAT);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    info.comm_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_REMARK_INFO_STR);
                    tdsecuL_10_61_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_10_62_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_10_62_Response()
        {
            this.tdsecuL_10_62_InfoList = new ObservableCollection<tdsecuL_10_62_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_10_62_Info> tdsecuL_10_62_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_10_62_Info info = new tdsecuL_10_62_Info();
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
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.asset_type = unpacker.GetInt("asset_type");
            info.stock_type = unpacker.GetInt("stock_type");
            info.comm_opor = unpacker.GetInt("comm_opor");
            info.comm_executor = unpacker.GetInt("comm_executor");
            info.comm_date = unpacker.GetInt("comm_date");
            info.comm_time = unpacker.GetInt("comm_time");
            info.comm_batch_no = unpacker.GetInt("comm_batch_no");
            info.comm_dir = unpacker.GetInt("comm_dir");
            info.comm_limit_price = unpacker.GetDouble("comm_limit_price");
            info.limit_actual_price = unpacker.GetDouble("limit_actual_price");
            info.comm_qty = unpacker.GetDouble("comm_qty");
            info.comm_amt = unpacker.GetDouble("comm_amt");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.comm_cancel_qty = unpacker.GetDouble("comm_cancel_qty");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.net_price_flag = unpacker.GetInt("net_price_flag");
            info.par_value = unpacker.GetDouble("par_value");
            info.bond_accr_intrst = unpacker.GetDouble("bond_accr_intrst");
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
            info.basket_id = unpacker.GetInt64("basket_id");
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
            info.exter_comm_flag = unpacker.GetInt("exter_comm_flag");
            info.valid_aver_price = unpacker.GetDouble("valid_aver_price");
            info.valid_aver_price_allday = unpacker.GetDouble("valid_aver_price_allday");
            info.exec_price_diff = unpacker.GetDouble("exec_price_diff");
            info.exec_price_diff_allday = unpacker.GetDouble("exec_price_diff_allday");
            info.valid_ratio = unpacker.GetDouble("valid_ratio");
            info.valid_ratio_allday = unpacker.GetDouble("valid_ratio_allday");
            info.valid_qty = unpacker.GetDouble("valid_qty");
            info.valid_qty_allday = unpacker.GetDouble("valid_qty_allday");
            info.update_times = unpacker.GetInt("update_times");
            info.comm_remark_info = unpacker.GetStr("comm_remark_info");
            tdsecuL_10_62_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_10_62_InfoList.Add((tdsecuL_10_62_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易运维_查询指令汇总考核历史
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_10_62_Info();
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
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.comm_opor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPOR_INT);
                    info.comm_executor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_EXECUTOR_INT);
                    info.comm_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DATE_INT);
                    info.comm_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_TIME_INT);
                    info.comm_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT);
                    info.comm_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_INT);
                    info.comm_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_LIMIT_PRICE_FLOAT);
                    info.limit_actual_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT);
                    info.comm_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_QTY_FLOAT);
                    info.comm_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_AMT_FLOAT);
                    info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    info.comm_cancel_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_CANCEL_QTY_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.net_price_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLAG_INT);
                    info.par_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_FLOAT);
                    info.bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT);
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
                    info.basket_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_ID_INT64);
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
                    info.exter_comm_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXTER_COMM_FLAG_INT);
                    info.valid_aver_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VALID_AVER_PRICE_FLOAT);
                    info.valid_aver_price_allday = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VALID_AVER_PRICE_ALLDAY_FLOAT);
                    info.exec_price_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_PRICE_DIFF_FLOAT);
                    info.exec_price_diff_allday = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_PRICE_DIFF_ALLDAY_FLOAT);
                    info.valid_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VALID_RATIO_FLOAT);
                    info.valid_ratio_allday = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VALID_RATIO_ALLDAY_FLOAT);
                    info.valid_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VALID_QTY_FLOAT);
                    info.valid_qty_allday = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VALID_QTY_ALLDAY_FLOAT);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    info.comm_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_REMARK_INFO_STR);
                    tdsecuL_10_62_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_10_63_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_10_63_Response()
        {
            this.tdsecuL_10_63_InfoList = new ObservableCollection<tdsecuL_10_63_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_10_63_Info> tdsecuL_10_63_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_10_63_Info info = new tdsecuL_10_63_Info();
            tdsecuL_10_63_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_10_63_InfoList.Add((tdsecuL_10_63_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易运维_更新查询指令汇总考核
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_10_63_Info();
                tdsecuL_10_63_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_10_64_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_10_64_Response()
        {
            this.tdsecuL_10_64_InfoList = new ObservableCollection<tdsecuL_10_64_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_10_64_Info> tdsecuL_10_64_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_10_64_Info info = new tdsecuL_10_64_Info();
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
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.asset_type = unpacker.GetInt("asset_type");
            info.stock_type = unpacker.GetInt("stock_type");
            info.comm_opor = unpacker.GetInt("comm_opor");
            info.comm_executor = unpacker.GetInt("comm_executor");
            info.comm_date = unpacker.GetInt("comm_date");
            info.comm_time = unpacker.GetInt("comm_time");
            info.comm_batch_no = unpacker.GetInt("comm_batch_no");
            info.comm_dir = unpacker.GetInt("comm_dir");
            info.comm_limit_price = unpacker.GetDouble("comm_limit_price");
            info.limit_actual_price = unpacker.GetDouble("limit_actual_price");
            info.comm_qty = unpacker.GetDouble("comm_qty");
            info.comm_amt = unpacker.GetDouble("comm_amt");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.comm_cancel_qty = unpacker.GetDouble("comm_cancel_qty");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.net_price_flag = unpacker.GetInt("net_price_flag");
            info.par_value = unpacker.GetDouble("par_value");
            info.bond_accr_intrst = unpacker.GetDouble("bond_accr_intrst");
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
            info.basket_id = unpacker.GetInt64("basket_id");
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
            info.exter_comm_flag = unpacker.GetInt("exter_comm_flag");
            info.exch_crncy_type = unpacker.GetStr("exch_crncy_type");
            info.update_times = unpacker.GetInt("update_times");
            info.comm_remark_info = unpacker.GetStr("comm_remark_info");
            tdsecuL_10_64_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_10_64_InfoList.Add((tdsecuL_10_64_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易运维_查询所有指令汇总
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_10_64_Info();
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
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.comm_opor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPOR_INT);
                    info.comm_executor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_EXECUTOR_INT);
                    info.comm_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DATE_INT);
                    info.comm_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_TIME_INT);
                    info.comm_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT);
                    info.comm_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_INT);
                    info.comm_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_LIMIT_PRICE_FLOAT);
                    info.limit_actual_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT);
                    info.comm_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_QTY_FLOAT);
                    info.comm_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_AMT_FLOAT);
                    info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    info.comm_cancel_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_CANCEL_QTY_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.net_price_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLAG_INT);
                    info.par_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_FLOAT);
                    info.bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT);
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
                    info.basket_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_ID_INT64);
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
                    info.exter_comm_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXTER_COMM_FLAG_INT);
                    info.exch_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    info.comm_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_REMARK_INFO_STR);
                    tdsecuL_10_64_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_10_65_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_10_65_Response()
        {
            this.tdsecuL_10_65_InfoList = new ObservableCollection<tdsecuL_10_65_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_10_65_Info> tdsecuL_10_65_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_10_65_Info info = new tdsecuL_10_65_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.init_date = unpacker.GetInt("init_date");
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco = unpacker.GetStr("stock_acco");
            info.stock_code = unpacker.GetStr("stock_code");
            info.report_date = unpacker.GetInt("report_date");
            info.report_time = unpacker.GetInt("report_time");
            info.report_no = unpacker.GetStr("report_no");
            info.order_date = unpacker.GetInt("order_date");
            info.order_id = unpacker.GetInt64("order_id");
            info.order_dir = unpacker.GetInt("order_dir");
            info.order_price = unpacker.GetDouble("order_price");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.price_type = unpacker.GetInt("price_type");
            info.order_rsp_status = unpacker.GetStr("order_rsp_status");
            info.rsp_info = unpacker.GetStr("rsp_info");
            info.deal_status = unpacker.GetStr("deal_status");
            info.update_times = unpacker.GetInt("update_times");
            tdsecuL_10_65_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_10_65_InfoList.Add((tdsecuL_10_65_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易运维_查询运维订单回报
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_10_65_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                    info.report_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_TIME_INT);
                    info.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    info.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    info.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    info.price_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_INT);
                    info.order_rsp_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_RSP_STATUS_STR);
                    info.rsp_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RSP_INFO_STR);
                    info.deal_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_STATUS_STR);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdsecuL_10_65_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_10_66_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_10_66_Response()
        {
            this.tdsecuL_10_66_InfoList = new ObservableCollection<tdsecuL_10_66_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_10_66_Info> tdsecuL_10_66_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_10_66_Info info = new tdsecuL_10_66_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.init_date = unpacker.GetInt("init_date");
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco = unpacker.GetStr("stock_acco");
            info.stock_code = unpacker.GetStr("stock_code");
            info.strike_date = unpacker.GetInt("strike_date");
            info.strike_time = unpacker.GetInt("strike_time");
            info.strike_no = unpacker.GetStr("strike_no");
            info.report_no = unpacker.GetStr("report_no");
            info.order_dir = unpacker.GetInt("order_dir");
            info.strike_price = unpacker.GetDouble("strike_price");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.strike_deal_type = unpacker.GetInt("strike_deal_type");
            info.rsp_info = unpacker.GetStr("rsp_info");
            info.deal_status = unpacker.GetStr("deal_status");
            info.update_times = unpacker.GetInt("update_times");
            info.report_date = unpacker.GetInt("report_date");
            tdsecuL_10_66_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_10_66_InfoList.Add((tdsecuL_10_66_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易运维_查询运维成交回报
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_10_66_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.strike_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT);
                    info.strike_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_TIME_INT);
                    info.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                    info.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_PRICE_FLOAT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    info.strike_deal_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DEAL_TYPE_INT);
                    info.rsp_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RSP_INFO_STR);
                    info.deal_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_STATUS_STR);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    info.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                    tdsecuL_10_66_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_10_67_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_10_67_Response()
        {
            this.tdsecuL_10_67_InfoList = new ObservableCollection<tdsecuL_10_67_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_10_67_Info> tdsecuL_10_67_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_10_67_Info info = new tdsecuL_10_67_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_type = unpacker.GetInt("stock_type");
            info.comm_id = unpacker.GetInt64("comm_id");
            info.comm_batch_no = unpacker.GetInt("comm_batch_no");
            info.strike_date = unpacker.GetInt("strike_date");
            info.strike_time = unpacker.GetInt("strike_time");
            info.strike_no = unpacker.GetStr("strike_no");
            info.report_date = unpacker.GetInt("report_date");
            info.report_no = unpacker.GetStr("report_no");
            info.order_date = unpacker.GetInt("order_date");
            info.order_time = unpacker.GetInt("order_time");
            info.order_id = unpacker.GetInt64("order_id");
            info.order_dir = unpacker.GetInt("order_dir");
            info.order_price = unpacker.GetDouble("order_price");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.strike_price = unpacker.GetDouble("strike_price");
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
            info.strike_bond_accr_intrst = unpacker.GetDouble("strike_bond_accr_intrst");
            info.net_price_flag = unpacker.GetInt("net_price_flag");
            info.order_oper_way = unpacker.GetStr("order_oper_way");
            info.exter_comm_flag = unpacker.GetInt("exter_comm_flag");
            info.record_valid_flag = unpacker.GetInt("record_valid_flag");
            info.update_times = unpacker.GetInt("update_times");
            tdsecuL_10_67_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_10_67_InfoList.Add((tdsecuL_10_67_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易运维_查询运维成交明细
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_10_67_Info();
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
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                    info.comm_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT);
                    info.strike_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT);
                    info.strike_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_TIME_INT);
                    info.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                    info.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                    info.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    info.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    info.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                    info.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_PRICE_FLOAT);
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
                    info.strike_bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_BOND_ACCR_INTRST_FLOAT);
                    info.net_price_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLAG_INT);
                    info.order_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR);
                    info.exter_comm_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXTER_COMM_FLAG_INT);
                    info.record_valid_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RECORD_VALID_FLAG_INT);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdsecuL_10_67_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_10_68_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_10_68_Response()
        {
            this.tdsecuL_10_68_InfoList = new ObservableCollection<tdsecuL_10_68_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_10_68_Info> tdsecuL_10_68_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_10_68_Info info = new tdsecuL_10_68_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.pass_no = unpacker.GetInt("pass_no");
            info.offer_type = unpacker.GetStr("offer_type");
            info.offer_name = unpacker.GetStr("offer_name");
            info.offer_server_name = unpacker.GetStr("offer_server_name");
            info.offer_server_ip = unpacker.GetStr("offer_server_ip");
            info.offer_server_port = unpacker.GetInt("offer_server_port");
            tdsecuL_10_68_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_10_68_InfoList.Add((tdsecuL_10_68_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易运维_查询报盘信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_10_68_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.offer_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OFFER_TYPE_STR);
                    info.offer_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OFFER_NAME_STR);
                    info.offer_server_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OFFER_SERVER_NAME_STR);
                    info.offer_server_ip = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OFFER_SERVER_IP_STR);
                    info.offer_server_port = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OFFER_SERVER_PORT_INT);
                    tdsecuL_10_68_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_10_69_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_10_69_Response()
        {
            this.tdsecuL_10_69_InfoList = new ObservableCollection<tdsecuL_10_69_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_10_69_Info> tdsecuL_10_69_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_10_69_Info info = new tdsecuL_10_69_Info();
            info.row_id = unpacker.GetInt64("row_id");
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
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_acco = unpacker.GetStr("stock_acco");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.external_no = unpacker.GetInt64("external_no");
            info.wtdraw_batch_no = unpacker.GetInt("wtdraw_batch_no");
            info.wtdraw_date = unpacker.GetInt("wtdraw_date");
            info.wtdraw_time = unpacker.GetInt("wtdraw_time");
            info.order_date = unpacker.GetInt("order_date");
            info.order_id = unpacker.GetInt64("order_id");
            info.report_date = unpacker.GetInt("report_date");
            info.report_time = unpacker.GetInt("report_time");
            info.report_no = unpacker.GetStr("report_no");
            info.wtdraw_status = unpacker.GetStr("wtdraw_status");
            info.wtdraw_qty = unpacker.GetDouble("wtdraw_qty");
            info.wtdraw_remark = unpacker.GetStr("wtdraw_remark");
            info.order_price = unpacker.GetDouble("order_price");
            info.update_times = unpacker.GetInt("update_times");
            tdsecuL_10_69_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_10_69_InfoList.Add((tdsecuL_10_69_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易运维_查询运维撤单流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_10_69_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
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
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.external_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64);
                    info.wtdraw_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_BATCH_NO_INT);
                    info.wtdraw_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_DATE_INT);
                    info.wtdraw_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_TIME_INT);
                    info.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    info.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                    info.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                    info.report_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_TIME_INT);
                    info.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    info.wtdraw_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_STATUS_STR);
                    info.wtdraw_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_QTY_FLOAT);
                    info.wtdraw_remark = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_REMARK_STR);
                    info.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdsecuL_10_69_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_10_70_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_10_70_Response()
        {
            this.tdsecuL_10_70_InfoList = new ObservableCollection<tdsecuL_10_70_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_10_70_Info> tdsecuL_10_70_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_10_70_Info info = new tdsecuL_10_70_Info();
            tdsecuL_10_70_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_10_70_InfoList.Add((tdsecuL_10_70_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易运维_同步场外基金成交回报表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_10_70_Info();
                tdsecuL_10_70_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_10_71_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_10_71_Response()
        {
            this.tdsecuL_10_71_InfoList = new ObservableCollection<tdsecuL_10_71_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_10_71_Info> tdsecuL_10_71_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_10_71_Info info = new tdsecuL_10_71_Info();
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco = unpacker.GetStr("stock_acco");
            info.stock_code = unpacker.GetStr("stock_code");
            info.report_date = unpacker.GetInt("report_date");
            info.report_no = unpacker.GetStr("report_no");
            info.strike_date = unpacker.GetInt("strike_date");
            info.strike_time = unpacker.GetInt("strike_time");
            info.strike_no = unpacker.GetStr("strike_no");
            info.order_dir = unpacker.GetInt("order_dir");
            info.strike_price = unpacker.GetDouble("strike_price");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.strike_deal_type = unpacker.GetInt("strike_deal_type");
            info.rsp_info = unpacker.GetStr("rsp_info");
            tdsecuL_10_71_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_10_71_InfoList.Add((tdsecuL_10_71_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易运维_查询场外基金成交回报表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_10_71_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                    info.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    info.strike_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT);
                    info.strike_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_TIME_INT);
                    info.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_PRICE_FLOAT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    info.strike_deal_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DEAL_TYPE_INT);
                    info.rsp_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RSP_INFO_STR);
                    tdsecuL_10_71_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_10_72_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_10_72_Response()
        {
            this.tdsecuL_10_72_InfoList = new ObservableCollection<tdsecuL_10_72_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_10_72_Info> tdsecuL_10_72_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_10_72_Info info = new tdsecuL_10_72_Info();
            tdsecuL_10_72_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_10_72_InfoList.Add((tdsecuL_10_72_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易运维_错单修改成交回溯
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_10_72_Info();
                tdsecuL_10_72_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_10_73_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_10_73_Response()
        {
            this.tdsecuL_10_73_InfoList = new ObservableCollection<tdsecuL_10_73_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_10_73_Info> tdsecuL_10_73_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_10_73_Info info = new tdsecuL_10_73_Info();
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
            info.begin_qty = unpacker.GetDouble("begin_qty");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.frozen_qty = unpacker.GetDouble("frozen_qty");
            info.unfroz_qty = unpacker.GetDouble("unfroz_qty");
            info.comm_frozen_qty = unpacker.GetDouble("comm_frozen_qty");
            info.comm_unfroz_qty = unpacker.GetDouble("comm_unfroz_qty");
            info.comm_capt_qty = unpacker.GetDouble("comm_capt_qty");
            info.comm_releas_qty = unpacker.GetDouble("comm_releas_qty");
            info.trade_frozen_qty = unpacker.GetDouble("trade_frozen_qty");
            info.trade_unfroz_qty = unpacker.GetDouble("trade_unfroz_qty");
            info.trade_capt_qty = unpacker.GetDouble("trade_capt_qty");
            info.trade_releas_qty = unpacker.GetDouble("trade_releas_qty");
            info.strike_capt_qty = unpacker.GetDouble("strike_capt_qty");
            info.strike_releas_qty = unpacker.GetDouble("strike_releas_qty");
            info.strike_frozen_qty = unpacker.GetDouble("strike_frozen_qty");
            info.strike_unfroz_qty = unpacker.GetDouble("strike_unfroz_qty");
            info.cost_amt = unpacker.GetDouble("cost_amt");
            info.intrst_cost_amt = unpacker.GetDouble("intrst_cost_amt");
            info.update_times = unpacker.GetInt("update_times");
            info.realize_pandl = unpacker.GetDouble("realize_pandl");
            info.intrst_pandl = unpacker.GetDouble("intrst_pandl");
            tdsecuL_10_73_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_10_73_InfoList.Add((tdsecuL_10_73_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易运维_查询所有交易组持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_10_73_Info();
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
                    info.begin_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_QTY_FLOAT);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_QTY_FLOAT);
                    info.unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_QTY_FLOAT);
                    info.comm_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_FROZEN_QTY_FLOAT);
                    info.comm_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_UNFROZ_QTY_FLOAT);
                    info.comm_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_CAPT_QTY_FLOAT);
                    info.comm_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_RELEAS_QTY_FLOAT);
                    info.trade_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_FROZEN_QTY_FLOAT);
                    info.trade_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_UNFROZ_QTY_FLOAT);
                    info.trade_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CAPT_QTY_FLOAT);
                    info.trade_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_RELEAS_QTY_FLOAT);
                    info.strike_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_CAPT_QTY_FLOAT);
                    info.strike_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_QTY_FLOAT);
                    info.strike_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_FROZEN_QTY_FLOAT);
                    info.strike_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_UNFROZ_QTY_FLOAT);
                    info.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                    info.intrst_cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_COST_AMT_FLOAT);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    info.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    info.intrst_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_PANDL_FLOAT);
                    tdsecuL_10_73_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_10_74_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_10_74_Response()
        {
            this.tdsecuL_10_74_InfoList = new ObservableCollection<tdsecuL_10_74_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_10_74_Info> tdsecuL_10_74_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_10_74_Info info = new tdsecuL_10_74_Info();
            tdsecuL_10_74_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_10_74_InfoList.Add((tdsecuL_10_74_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易运维_错单修改撤单回退
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_10_74_Info();
                tdsecuL_10_74_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_10_75_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_10_75_Response()
        {
            this.tdsecuL_10_75_InfoList = new ObservableCollection<tdsecuL_10_75_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_10_75_Info> tdsecuL_10_75_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_10_75_Info info = new tdsecuL_10_75_Info();
            tdsecuL_10_75_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_10_75_InfoList.Add((tdsecuL_10_75_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易运维_错单修改废单回退
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_10_75_Info();
                tdsecuL_10_75_InfoList.Add(info);
            }
        }
    }

}
