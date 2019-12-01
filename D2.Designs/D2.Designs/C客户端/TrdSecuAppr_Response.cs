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
    public class tdsecuL_3_1_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_3_1_Response()
        {
            this.tdsecuL_3_1_InfoList = new ObservableCollection<tdsecuL_3_1_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_3_1_Info> tdsecuL_3_1_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_3_1_Info info = new tdsecuL_3_1_Info();
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
            tdsecuL_3_1_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_3_1_InfoList.Add((tdsecuL_3_1_Info)info);
        }
        #endregion

        //逻辑_交易证券_指令_新增指令
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_3_1_Info();
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
                tdsecuL_3_1_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_3_2_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_3_2_Response()
        {
            this.tdsecuL_3_2_InfoList = new ObservableCollection<tdsecuL_3_2_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_3_2_Info> tdsecuL_3_2_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_3_2_Info info = new tdsecuL_3_2_Info();
            tdsecuL_3_2_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_3_2_InfoList.Add((tdsecuL_3_2_Info)info);
        }
        #endregion

        //逻辑_交易证券_指令_撤销指令
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_3_2_Info();
                tdsecuL_3_2_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_3_3_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_3_3_Response()
        {
            this.tdsecuL_3_3_InfoList = new ObservableCollection<tdsecuL_3_3_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_3_3_Info> tdsecuL_3_3_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_3_3_Info info = new tdsecuL_3_3_Info();
            tdsecuL_3_3_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_3_3_InfoList.Add((tdsecuL_3_3_Info)info);
        }
        #endregion

        //逻辑_交易证券_指令_修改指令
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_3_3_Info();
                tdsecuL_3_3_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_3_4_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_3_4_Response()
        {
            this.tdsecuL_3_4_InfoList = new ObservableCollection<tdsecuL_3_4_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_3_4_Info> tdsecuL_3_4_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_3_4_Info info = new tdsecuL_3_4_Info();
            info.comm_status = unpacker.GetStr("comm_status");
            info.order_id = unpacker.GetInt64("order_id");
            tdsecuL_3_4_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_3_4_InfoList.Add((tdsecuL_3_4_Info)info);
        }
        #endregion

        //逻辑_交易证券_指令_审批指令
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_3_4_Info();
                info.comm_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_STATUS_STR);
                info.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                tdsecuL_3_4_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_3_5_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_3_5_Response()
        {
            this.tdsecuL_3_5_InfoList = new ObservableCollection<tdsecuL_3_5_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_3_5_Info> tdsecuL_3_5_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_3_5_Info info = new tdsecuL_3_5_Info();
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
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
            tdsecuL_3_5_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_3_5_InfoList.Add((tdsecuL_3_5_Info)info);
        }
        #endregion

        //逻辑_交易证券_指令_分发指令
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_3_5_Info();
                info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
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
                tdsecuL_3_5_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_3_6_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_3_6_Response()
        {
            this.tdsecuL_3_6_InfoList = new ObservableCollection<tdsecuL_3_6_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_3_6_Info> tdsecuL_3_6_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_3_6_Info info = new tdsecuL_3_6_Info();
            info.comm_id_str = unpacker.GetStr("comm_id_str");
            info.comm_appr_status_str = unpacker.GetStr("comm_appr_status_str");
            tdsecuL_3_6_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_3_6_InfoList.Add((tdsecuL_3_6_Info)info);
        }
        #endregion

        //逻辑_交易证券_指令_新增篮子批量指令
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_3_6_Info();
                info.comm_id_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_STR_STR);
                info.comm_appr_status_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_STATUS_STR_STR);
                tdsecuL_3_6_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_3_7_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_3_7_Response()
        {
            this.tdsecuL_3_7_InfoList = new ObservableCollection<tdsecuL_3_7_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_3_7_Info> tdsecuL_3_7_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_3_7_Info info = new tdsecuL_3_7_Info();
            tdsecuL_3_7_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_3_7_InfoList.Add((tdsecuL_3_7_Info)info);
        }
        #endregion

        //逻辑_交易证券_指令_批量分发指令
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_3_7_Info();
                tdsecuL_3_7_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_3_8_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_3_8_Response()
        {
            this.tdsecuL_3_8_InfoList = new ObservableCollection<tdsecuL_3_8_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_3_8_Info> tdsecuL_3_8_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_3_8_Info info = new tdsecuL_3_8_Info();
            info.comm_id_str = unpacker.GetStr("comm_id_str");
            info.comm_appr_status_str = unpacker.GetStr("comm_appr_status_str");
            tdsecuL_3_8_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_3_8_InfoList.Add((tdsecuL_3_8_Info)info);
        }
        #endregion

        //逻辑_交易证券_指令_新增调仓指令
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_3_8_Info();
                info.comm_id_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_STR_STR);
                info.comm_appr_status_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_STATUS_STR_STR);
                tdsecuL_3_8_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_3_9_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_3_9_Response()
        {
            this.tdsecuL_3_9_InfoList = new ObservableCollection<tdsecuL_3_9_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_3_9_Info> tdsecuL_3_9_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_3_9_Info info = new tdsecuL_3_9_Info();
            info.opor_no = unpacker.GetInt("opor_no");
            info.oper_statn = unpacker.GetStr("oper_statn");
            info.co_no = unpacker.GetInt("co_no");
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.order_date = unpacker.GetInt("order_date");
            info.order_id_str = unpacker.GetStr("order_id_str");
            info.order_status_str = unpacker.GetStr("order_status_str");
            info.compli_trig_id = unpacker.GetInt64("compli_trig_id");
            tdsecuL_3_9_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_3_9_InfoList.Add((tdsecuL_3_9_Info)info);
        }
        #endregion

        //逻辑_交易证券_指令_新增组合指令
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_3_9_Info();
                info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                info.oper_statn = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_STATN_STR);
                info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                info.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                info.order_id_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_STR_STR);
                info.order_status_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR_STR);
                info.compli_trig_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_TRIG_ID_INT64);
                tdsecuL_3_9_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_3_51_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_3_51_Response()
        {
            this.tdsecuL_3_51_InfoList = new ObservableCollection<tdsecuL_3_51_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_3_51_Info> tdsecuL_3_51_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_3_51_Info info = new tdsecuL_3_51_Info();
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
            info.exch_crncy_type = unpacker.GetStr("exch_crncy_type");
            info.strategy_capt_qty = unpacker.GetDouble("strategy_capt_qty");
            info.strategy_order_qty = unpacker.GetDouble("strategy_order_qty");
            info.combo_code = unpacker.GetStr("combo_code");
            info.contra_no = unpacker.GetStr("contra_no");
            info.disp_opor = unpacker.GetInt("disp_opor");
            info.disp_status = unpacker.GetInt("disp_status");
            info.read_flag = unpacker.GetInt("read_flag");
            info.update_times = unpacker.GetInt("update_times");
            info.comm_remark_info = unpacker.GetStr("comm_remark_info");
            tdsecuL_3_51_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_3_51_InfoList.Add((tdsecuL_3_51_Info)info);
        }
        #endregion

        //逻辑_交易证券_指令_查询指令
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_3_51_Info();
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
                    info.exch_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR);
                    info.strategy_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_CAPT_QTY_FLOAT);
                    info.strategy_order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_ORDER_QTY_FLOAT);
                    info.combo_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_CODE_STR);
                    info.contra_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRA_NO_STR);
                    info.disp_opor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DISP_OPOR_INT);
                    info.disp_status = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DISP_STATUS_INT);
                    info.read_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_READ_FLAG_INT);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    info.comm_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_REMARK_INFO_STR);
                    tdsecuL_3_51_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_3_52_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_3_52_Response()
        {
            this.tdsecuL_3_52_InfoList = new ObservableCollection<tdsecuL_3_52_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_3_52_Info> tdsecuL_3_52_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_3_52_Info info = new tdsecuL_3_52_Info();
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
            info.strategy_capt_qty = unpacker.GetDouble("strategy_capt_qty");
            info.strategy_order_qty = unpacker.GetDouble("strategy_order_qty");
            info.contra_no = unpacker.GetStr("contra_no");
            info.disp_opor = unpacker.GetInt("disp_opor");
            info.disp_status = unpacker.GetInt("disp_status");
            info.read_flag = unpacker.GetInt("read_flag");
            info.update_times = unpacker.GetInt("update_times");
            info.comm_remark_info = unpacker.GetStr("comm_remark_info");
            tdsecuL_3_52_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_3_52_InfoList.Add((tdsecuL_3_52_Info)info);
        }
        #endregion

        //逻辑_交易证券_指令_查询指令历史
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_3_52_Info();
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
                    info.strategy_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_CAPT_QTY_FLOAT);
                    info.strategy_order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_ORDER_QTY_FLOAT);
                    info.contra_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRA_NO_STR);
                    info.disp_opor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DISP_OPOR_INT);
                    info.disp_status = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DISP_STATUS_INT);
                    info.read_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_READ_FLAG_INT);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    info.comm_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_REMARK_INFO_STR);
                    tdsecuL_3_52_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_3_53_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_3_53_Response()
        {
            this.tdsecuL_3_53_InfoList = new ObservableCollection<tdsecuL_3_53_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_3_53_Info> tdsecuL_3_53_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_3_53_Info info = new tdsecuL_3_53_Info();
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
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.asset_type = unpacker.GetInt("asset_type");
            info.stock_type = unpacker.GetInt("stock_type");
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
            info.exter_comm_flag = unpacker.GetInt("exter_comm_flag");
            info.update_times = unpacker.GetInt("update_times");
            tdsecuL_3_53_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_3_53_InfoList.Add((tdsecuL_3_53_Info)info);
        }
        #endregion

        //逻辑_交易证券_指令_查询指令分发
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_3_53_Info();
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
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
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
                    info.exter_comm_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXTER_COMM_FLAG_INT);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdsecuL_3_53_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_3_54_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_3_54_Response()
        {
            this.tdsecuL_3_54_InfoList = new ObservableCollection<tdsecuL_3_54_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_3_54_Info> tdsecuL_3_54_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_3_54_Info info = new tdsecuL_3_54_Info();
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
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.asset_type = unpacker.GetInt("asset_type");
            info.stock_type = unpacker.GetInt("stock_type");
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
            info.exter_comm_flag = unpacker.GetInt("exter_comm_flag");
            info.update_times = unpacker.GetInt("update_times");
            tdsecuL_3_54_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_3_54_InfoList.Add((tdsecuL_3_54_Info)info);
        }
        #endregion

        //逻辑_交易证券_指令_查询指令分发历史
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_3_54_Info();
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
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
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
                    info.exter_comm_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXTER_COMM_FLAG_INT);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdsecuL_3_54_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_3_55_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_3_55_Response()
        {
            this.tdsecuL_3_55_InfoList = new ObservableCollection<tdsecuL_3_55_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_3_55_Info> tdsecuL_3_55_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_3_55_Info info = new tdsecuL_3_55_Info();
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
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_type = unpacker.GetInt("stock_type");
            info.asset_type = unpacker.GetInt("asset_type");
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
            info.exter_comm_flag = unpacker.GetInt("exter_comm_flag");
            info.update_times = unpacker.GetInt("update_times");
            tdsecuL_3_55_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_3_55_InfoList.Add((tdsecuL_3_55_Info)info);
        }
        #endregion

        //逻辑_交易证券_指令_查询指令审批
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_3_55_Info();
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
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
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
                    info.exter_comm_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXTER_COMM_FLAG_INT);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdsecuL_3_55_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_3_56_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_3_56_Response()
        {
            this.tdsecuL_3_56_InfoList = new ObservableCollection<tdsecuL_3_56_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_3_56_Info> tdsecuL_3_56_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_3_56_Info info = new tdsecuL_3_56_Info();
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
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_type = unpacker.GetInt("stock_type");
            info.asset_type = unpacker.GetInt("asset_type");
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
            info.exter_comm_flag = unpacker.GetInt("exter_comm_flag");
            info.update_times = unpacker.GetInt("update_times");
            tdsecuL_3_56_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_3_56_InfoList.Add((tdsecuL_3_56_Info)info);
        }
        #endregion

        //逻辑_交易证券_指令_查询指令审批历史
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_3_56_Info();
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
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
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
                    info.exter_comm_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXTER_COMM_FLAG_INT);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdsecuL_3_56_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_3_57_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_3_57_Response()
        {
            this.tdsecuL_3_57_InfoList = new ObservableCollection<tdsecuL_3_57_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_3_57_Info> tdsecuL_3_57_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_3_57_Info info = new tdsecuL_3_57_Info();
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
            info.read_flag = unpacker.GetInt("read_flag");
            info.acco_concat_info = unpacker.GetStr("acco_concat_info");
            tdsecuL_3_57_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_3_57_InfoList.Add((tdsecuL_3_57_Info)info);
        }
        #endregion

        //逻辑_交易证券_指令_查询汇总指令
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_3_57_Info();
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
                    info.read_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_READ_FLAG_INT);
                    info.acco_concat_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_CONCAT_INFO_STR);
                    tdsecuL_3_57_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_3_58_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_3_58_Response()
        {
            this.tdsecuL_3_58_InfoList = new ObservableCollection<tdsecuL_3_58_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_3_58_Info> tdsecuL_3_58_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_3_58_Info info = new tdsecuL_3_58_Info();
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
            info.update_times = unpacker.GetInt("update_times");
            info.comm_remark_info = unpacker.GetStr("comm_remark_info");
            info.read_flag = unpacker.GetInt("read_flag");
            info.acco_concat_info = unpacker.GetStr("acco_concat_info");
            tdsecuL_3_58_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_3_58_InfoList.Add((tdsecuL_3_58_Info)info);
        }
        #endregion

        //逻辑_交易证券_指令_查询汇总指令历史
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_3_58_Info();
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
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    info.comm_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_REMARK_INFO_STR);
                    info.read_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_READ_FLAG_INT);
                    info.acco_concat_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_CONCAT_INFO_STR);
                    tdsecuL_3_58_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_3_59_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_3_59_Response()
        {
            this.tdsecuL_3_59_InfoList = new ObservableCollection<tdsecuL_3_59_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_3_59_Info> tdsecuL_3_59_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_3_59_Info info = new tdsecuL_3_59_Info();
            tdsecuL_3_59_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_3_59_InfoList.Add((tdsecuL_3_59_Info)info);
        }
        #endregion

        //逻辑_交易证券_指令_暂停明细指令
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_3_59_Info();
                tdsecuL_3_59_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_3_60_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_3_60_Response()
        {
            this.tdsecuL_3_60_InfoList = new ObservableCollection<tdsecuL_3_60_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_3_60_Info> tdsecuL_3_60_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_3_60_Info info = new tdsecuL_3_60_Info();
            tdsecuL_3_60_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_3_60_InfoList.Add((tdsecuL_3_60_Info)info);
        }
        #endregion

        //逻辑_交易证券_指令_暂停汇总指令
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_3_60_Info();
                tdsecuL_3_60_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_3_61_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_3_61_Response()
        {
            this.tdsecuL_3_61_InfoList = new ObservableCollection<tdsecuL_3_61_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_3_61_Info> tdsecuL_3_61_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_3_61_Info info = new tdsecuL_3_61_Info();
            tdsecuL_3_61_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_3_61_InfoList.Add((tdsecuL_3_61_Info)info);
        }
        #endregion

        //逻辑_交易证券_指令_启动明细指令
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_3_61_Info();
                tdsecuL_3_61_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_3_62_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_3_62_Response()
        {
            this.tdsecuL_3_62_InfoList = new ObservableCollection<tdsecuL_3_62_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_3_62_Info> tdsecuL_3_62_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_3_62_Info info = new tdsecuL_3_62_Info();
            tdsecuL_3_62_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_3_62_InfoList.Add((tdsecuL_3_62_Info)info);
        }
        #endregion

        //逻辑_交易证券_指令_启动汇总指令
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_3_62_Info();
                tdsecuL_3_62_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_3_63_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_3_63_Response()
        {
            this.tdsecuL_3_63_InfoList = new ObservableCollection<tdsecuL_3_63_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_3_63_Info> tdsecuL_3_63_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_3_63_Info info = new tdsecuL_3_63_Info();
            tdsecuL_3_63_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_3_63_InfoList.Add((tdsecuL_3_63_Info)info);
        }
        #endregion

        //逻辑_交易证券_指令_分发待审批指令
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_3_63_Info();
                tdsecuL_3_63_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_3_64_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_3_64_Response()
        {
            this.tdsecuL_3_64_InfoList = new ObservableCollection<tdsecuL_3_64_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_3_64_Info> tdsecuL_3_64_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_3_64_Info info = new tdsecuL_3_64_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.comm_id = unpacker.GetInt64("comm_id");
            tdsecuL_3_64_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_3_64_InfoList.Add((tdsecuL_3_64_Info)info);
        }
        #endregion

        //逻辑_交易证券_指令_审批转发指令
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_3_64_Info();
                info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                info.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                tdsecuL_3_64_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_3_65_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_3_65_Response()
        {
            this.tdsecuL_3_65_InfoList = new ObservableCollection<tdsecuL_3_65_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_3_65_Info> tdsecuL_3_65_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_3_65_Info info = new tdsecuL_3_65_Info();
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
            info.exch_crncy_type = unpacker.GetStr("exch_crncy_type");
            info.comm_dispense_appr_status = unpacker.GetStr("comm_dispense_appr_status");
            info.comm_dispense_appr_opor = unpacker.GetInt("comm_dispense_appr_opor");
            info.comm_dispense_appr_date = unpacker.GetInt("comm_dispense_appr_date");
            info.comm_dispense_appr_time = unpacker.GetInt("comm_dispense_appr_time");
            info.comm_dispense_appr_remark = unpacker.GetStr("comm_dispense_appr_remark");
            info.disp_remark = unpacker.GetStr("disp_remark");
            info.before_comm_executor = unpacker.GetInt("before_comm_executor");
            info.is_withdraw = unpacker.GetInt("is_withdraw");
            tdsecuL_3_65_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_3_65_InfoList.Add((tdsecuL_3_65_Info)info);
        }
        #endregion

        //逻辑_交易证券_指令_查询转发审批指令
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_3_65_Info();
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
                    info.exch_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR);
                    info.comm_dispense_appr_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DISPENSE_APPR_STATUS_STR);
                    info.comm_dispense_appr_opor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DISPENSE_APPR_OPOR_INT);
                    info.comm_dispense_appr_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DISPENSE_APPR_DATE_INT);
                    info.comm_dispense_appr_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DISPENSE_APPR_TIME_INT);
                    info.comm_dispense_appr_remark = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DISPENSE_APPR_REMARK_STR);
                    info.disp_remark = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DISP_REMARK_STR);
                    info.before_comm_executor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEFORE_COMM_EXECUTOR_INT);
                    info.is_withdraw = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_WITHDRAW_INT);
                    tdsecuL_3_65_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_3_66_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_3_66_Response()
        {
            this.tdsecuL_3_66_InfoList = new ObservableCollection<tdsecuL_3_66_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_3_66_Info> tdsecuL_3_66_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_3_66_Info info = new tdsecuL_3_66_Info();
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
            tdsecuL_3_66_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_3_66_InfoList.Add((tdsecuL_3_66_Info)info);
        }
        #endregion

        //逻辑_交易证券_指令_融资融券新增指令
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_3_66_Info();
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
                tdsecuL_3_66_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_3_67_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_3_67_Response()
        {
            this.tdsecuL_3_67_InfoList = new ObservableCollection<tdsecuL_3_67_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_3_67_Info> tdsecuL_3_67_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_3_67_Info info = new tdsecuL_3_67_Info();
            tdsecuL_3_67_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_3_67_InfoList.Add((tdsecuL_3_67_Info)info);
        }
        #endregion

        //逻辑_交易证券_指令_融资融券撤销指令
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_3_67_Info();
                tdsecuL_3_67_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_3_68_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_3_68_Response()
        {
            this.tdsecuL_3_68_InfoList = new ObservableCollection<tdsecuL_3_68_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_3_68_Info> tdsecuL_3_68_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_3_68_Info info = new tdsecuL_3_68_Info();
            info.comm_status = unpacker.GetStr("comm_status");
            info.order_id = unpacker.GetInt64("order_id");
            tdsecuL_3_68_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_3_68_InfoList.Add((tdsecuL_3_68_Info)info);
        }
        #endregion

        //逻辑_交易证券_指令_融资融券审批指令
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_3_68_Info();
                info.comm_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_STATUS_STR);
                info.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                tdsecuL_3_68_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_3_69_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_3_69_Response()
        {
            this.tdsecuL_3_69_InfoList = new ObservableCollection<tdsecuL_3_69_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_3_69_Info> tdsecuL_3_69_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_3_69_Info info = new tdsecuL_3_69_Info();
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
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
            tdsecuL_3_69_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_3_69_InfoList.Add((tdsecuL_3_69_Info)info);
        }
        #endregion

        //逻辑_交易证券_指令_新分发指令
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_3_69_Info();
                info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
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
                tdsecuL_3_69_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_3_70_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_3_70_Response()
        {
            this.tdsecuL_3_70_InfoList = new ObservableCollection<tdsecuL_3_70_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_3_70_Info> tdsecuL_3_70_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_3_70_Info info = new tdsecuL_3_70_Info();
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
            tdsecuL_3_70_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_3_70_InfoList.Add((tdsecuL_3_70_Info)info);
        }
        #endregion

        //逻辑_交易证券_指令_新增组合策略指令
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_3_70_Info();
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
                tdsecuL_3_70_InfoList.Add(info);
            }
        }
    }

}
