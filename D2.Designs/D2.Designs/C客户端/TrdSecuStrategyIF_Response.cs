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
    public class tdsecuL_11_11_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_11_11_Response()
        {
            this.tdsecuL_11_11_InfoList = new ObservableCollection<tdsecuL_11_11_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_11_11_Info> tdsecuL_11_11_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_11_11_Info info = new tdsecuL_11_11_Info();
            tdsecuL_11_11_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_11_11_InfoList.Add((tdsecuL_11_11_Info)info);
        }
        #endregion

        //逻辑_交易证券_策略接口_新增母单
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_11_11_Info();
                tdsecuL_11_11_InfoList.Add(info);
            }
            return FunctdsecuL_11_11Models;
        }
    }

    public class tdsecuL_11_12_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_11_12_Response()
        {
            this.tdsecuL_11_12_InfoList = new ObservableCollection<tdsecuL_11_12_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_11_12_Info> tdsecuL_11_12_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_11_12_Info info = new tdsecuL_11_12_Info();
            tdsecuL_11_12_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_11_12_InfoList.Add((tdsecuL_11_12_Info)info);
        }
        #endregion

        //逻辑_交易证券_策略接口_修改母单
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_11_12_Info();
                tdsecuL_11_12_InfoList.Add(info);
            }
            return FunctdsecuL_11_12Models;
        }
    }

    public class tdsecuL_11_13_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_11_13_Response()
        {
            this.tdsecuL_11_13_InfoList = new ObservableCollection<tdsecuL_11_13_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_11_13_Info> tdsecuL_11_13_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_11_13_Info info = new tdsecuL_11_13_Info();
            tdsecuL_11_13_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_11_13_InfoList.Add((tdsecuL_11_13_Info)info);
        }
        #endregion

        //逻辑_交易证券_策略接口_撤销母单
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_11_13_Info();
                tdsecuL_11_13_InfoList.Add(info);
            }
            return FunctdsecuL_11_13Models;
        }
    }

    public class tdsecuL_11_101_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_11_101_Response()
        {
            this.tdsecuL_11_101_InfoList = new ObservableCollection<tdsecuL_11_101_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_11_101_Info> tdsecuL_11_101_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_11_101_Info info = new tdsecuL_11_101_Info();
            info.comm_opor = unpacker.GetInt("comm_opor");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.algo_order_id = unpacker.GetInt64("algo_order_id");
            info.seco_algo_order_id = unpacker.GetInt64("seco_algo_order_id");
            info.algo_exec_broker = unpacker.GetStr("algo_exec_broker");
            info.algo_exec_comm_str = unpacker.GetStr("algo_exec_comm_str");
            info.algo_exec_kind = unpacker.GetInt("algo_exec_kind");
            info.exch_no = unpacker.GetInt("exch_no");
            info.algo_busi_type = unpacker.GetStr("algo_busi_type");
            info.stock_code = unpacker.GetStr("stock_code");
            info.order_dir = unpacker.GetInt("order_dir");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.cash_order_qty = unpacker.GetDouble("cash_order_qty");
            info.order_price = unpacker.GetDouble("order_price");
            info.price_type = unpacker.GetInt("price_type");
            info.algo_valid_type = unpacker.GetInt("algo_valid_type");
            info.algo_rule_way = unpacker.GetStr("algo_rule_way");
            info.exch_crncy_type = unpacker.GetStr("exch_crncy_type");
            info.remark_info = unpacker.GetStr("remark_info");
            info.algo_order_time = unpacker.GetInt("algo_order_time");
            info.co_no = unpacker.GetInt("co_no");
            info.busi_opor_no = unpacker.GetInt("busi_opor_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.margin_trade_type = unpacker.GetInt("margin_trade_type");
            info.target_strategy_type = unpacker.GetStr("target_strategy_type");
            info.target_strategy_param = unpacker.GetStr("target_strategy_param");
            info.external_no = unpacker.GetInt("external_no");
            info.comm_id = unpacker.GetInt64("comm_id");
            info.order_batch_no = unpacker.GetInt("order_batch_no");
            info.order_oper_way = unpacker.GetStr("order_oper_way");
            tdsecuL_11_101_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_11_101_InfoList.Add((tdsecuL_11_101_Info)info);
        }
        #endregion

        //逻辑_交易证券_策略接口_查询母单
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_11_101_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.comm_opor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPOR_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.algo_order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ALGO_ORDER_ID_INT64);
                    info.seco_algo_order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_SECO_ALGO_ORDER_ID_INT64);
                    info.algo_exec_broker = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ALGO_EXEC_BROKER_STR);
                    info.algo_exec_comm_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ALGO_EXEC_COMM_STR_STR);
                    info.algo_exec_kind = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ALGO_EXEC_KIND_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.algo_busi_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ALGO_BUSI_TYPE_STR);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    info.cash_order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_ORDER_QTY_FLOAT);
                    info.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    info.price_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_INT);
                    info.algo_valid_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ALGO_VALID_TYPE_INT);
                    info.algo_rule_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ALGO_RULE_WAY_STR);
                    info.exch_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    info.algo_order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ALGO_ORDER_TIME_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.busi_opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.margin_trade_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MARGIN_TRADE_TYPE_INT);
                    info.target_strategy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_STRATEGY_TYPE_STR);
                    info.target_strategy_param = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_STRATEGY_PARAM_STR);
                    info.external_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT);
                    info.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                    info.order_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT);
                    info.order_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR);
                    tdsecuL_11_101_InfoList.Add(info);
                }
            }
            return FunctdsecuL_11_101Models;
        }
    }

}
