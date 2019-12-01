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
    public class tdsecuL_11_1_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_11_1_Response()
        {
            this.tdsecuL_11_1_InfoList = new ObservableCollection<tdsecuL_11_1_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_11_1_Info> tdsecuL_11_1_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_11_1_Info info = new tdsecuL_11_1_Info();
            info.strategy_plugin_status = unpacker.GetStr("strategy_plugin_status");
            tdsecuL_11_1_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_11_1_InfoList.Add((tdsecuL_11_1_Info)info);
        }
        #endregion

        //逻辑_交易证券_策略_策略插件上线
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_11_1_Info();
                info.strategy_plugin_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_PLUGIN_STATUS_STR);
                tdsecuL_11_1_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_11_2_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_11_2_Response()
        {
            this.tdsecuL_11_2_InfoList = new ObservableCollection<tdsecuL_11_2_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_11_2_Info> tdsecuL_11_2_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_11_2_Info info = new tdsecuL_11_2_Info();
            info.strategy_plugin_status = unpacker.GetStr("strategy_plugin_status");
            tdsecuL_11_2_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_11_2_InfoList.Add((tdsecuL_11_2_Info)info);
        }
        #endregion

        //逻辑_交易证券_策略_策略插件下线
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_11_2_Info();
                info.strategy_plugin_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_PLUGIN_STATUS_STR);
                tdsecuL_11_2_InfoList.Add(info);
            }
        }
    }

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
            info.strategy_id = unpacker.GetInt64("strategy_id");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.strategy_dir = unpacker.GetInt("strategy_dir");
            info.price_type = unpacker.GetInt("price_type");
            info.strategy_time = unpacker.GetInt("strategy_time");
            info.target_strategy_type = unpacker.GetStr("target_strategy_type");
            info.target_strategy_param = unpacker.GetStr("target_strategy_param");
            info.order_batch_no = unpacker.GetInt("order_batch_no");
            info.strategy_oper_way = unpacker.GetStr("strategy_oper_way");
            tdsecuL_11_11_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_11_11_InfoList.Add((tdsecuL_11_11_Info)info);
        }
        #endregion

        //逻辑_交易证券_策略_新增策略
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_11_11_Info();
                info.strategy_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_ID_INT64);
                info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                info.strategy_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_DIR_INT);
                info.price_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_INT);
                info.strategy_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_TIME_INT);
                info.target_strategy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_STRATEGY_TYPE_STR);
                info.target_strategy_param = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_STRATEGY_PARAM_STR);
                info.order_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT);
                info.strategy_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_OPER_WAY_STR);
                tdsecuL_11_11_InfoList.Add(info);
            }
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
            info.strategy_id = unpacker.GetInt64("strategy_id");
            info.orig_strategy_id = unpacker.GetInt64("orig_strategy_id");
            info.strategy_time = unpacker.GetInt("strategy_time");
            info.target_strategy_type = unpacker.GetStr("target_strategy_type");
            info.target_strategy_param = unpacker.GetStr("target_strategy_param");
            info.strategy_contr_comm = unpacker.GetStr("strategy_contr_comm");
            tdsecuL_11_12_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_11_12_InfoList.Add((tdsecuL_11_12_Info)info);
        }
        #endregion

        //逻辑_交易证券_策略_暂停策略
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_11_12_Info();
                info.strategy_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_ID_INT64);
                info.orig_strategy_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORIG_STRATEGY_ID_INT64);
                info.strategy_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_TIME_INT);
                info.target_strategy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_STRATEGY_TYPE_STR);
                info.target_strategy_param = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_STRATEGY_PARAM_STR);
                info.strategy_contr_comm = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_CONTR_COMM_STR);
                tdsecuL_11_12_InfoList.Add(info);
            }
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
            info.strategy_id = unpacker.GetInt64("strategy_id");
            info.orig_strategy_id = unpacker.GetInt64("orig_strategy_id");
            info.strategy_time = unpacker.GetInt("strategy_time");
            info.target_strategy_type = unpacker.GetStr("target_strategy_type");
            info.target_strategy_param = unpacker.GetStr("target_strategy_param");
            info.strategy_contr_comm = unpacker.GetStr("strategy_contr_comm");
            tdsecuL_11_13_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_11_13_InfoList.Add((tdsecuL_11_13_Info)info);
        }
        #endregion

        //逻辑_交易证券_策略_重启策略
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_11_13_Info();
                info.strategy_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_ID_INT64);
                info.orig_strategy_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORIG_STRATEGY_ID_INT64);
                info.strategy_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_TIME_INT);
                info.target_strategy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_STRATEGY_TYPE_STR);
                info.target_strategy_param = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_STRATEGY_PARAM_STR);
                info.strategy_contr_comm = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_CONTR_COMM_STR);
                tdsecuL_11_13_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_11_14_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_11_14_Response()
        {
            this.tdsecuL_11_14_InfoList = new ObservableCollection<tdsecuL_11_14_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_11_14_Info> tdsecuL_11_14_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_11_14_Info info = new tdsecuL_11_14_Info();
            info.strategy_id = unpacker.GetInt64("strategy_id");
            info.orig_strategy_id = unpacker.GetInt64("orig_strategy_id");
            info.strategy_time = unpacker.GetInt("strategy_time");
            info.target_strategy_type = unpacker.GetStr("target_strategy_type");
            info.target_strategy_param = unpacker.GetStr("target_strategy_param");
            tdsecuL_11_14_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_11_14_InfoList.Add((tdsecuL_11_14_Info)info);
        }
        #endregion

        //逻辑_交易证券_策略_撤销策略
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_11_14_Info();
                info.strategy_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_ID_INT64);
                info.orig_strategy_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORIG_STRATEGY_ID_INT64);
                info.strategy_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_TIME_INT);
                info.target_strategy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_STRATEGY_TYPE_STR);
                info.target_strategy_param = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_STRATEGY_PARAM_STR);
                tdsecuL_11_14_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_11_15_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_11_15_Response()
        {
            this.tdsecuL_11_15_InfoList = new ObservableCollection<tdsecuL_11_15_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_11_15_Info> tdsecuL_11_15_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_11_15_Info info = new tdsecuL_11_15_Info();
            info.strategy_id = unpacker.GetInt64("strategy_id");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.strategy_dir = unpacker.GetInt("strategy_dir");
            info.strategy_oper_way = unpacker.GetStr("strategy_oper_way");
            tdsecuL_11_15_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_11_15_InfoList.Add((tdsecuL_11_15_Info)info);
        }
        #endregion

        //逻辑_交易证券_策略_更新策略执行情况
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_11_15_Info();
                info.strategy_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_ID_INT64);
                info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                info.strategy_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_DIR_INT);
                info.strategy_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_OPER_WAY_STR);
                tdsecuL_11_15_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_11_16_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_11_16_Response()
        {
            this.tdsecuL_11_16_InfoList = new ObservableCollection<tdsecuL_11_16_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_11_16_Info> tdsecuL_11_16_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_11_16_Info info = new tdsecuL_11_16_Info();
            info.orig_strategy_id = unpacker.GetInt64("orig_strategy_id");
            info.strategy_id = unpacker.GetInt64("strategy_id");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.strategy_dir = unpacker.GetInt("strategy_dir");
            info.strategy_status = unpacker.GetStr("strategy_status");
            info.strategy_oper_way = unpacker.GetStr("strategy_oper_way");
            tdsecuL_11_16_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_11_16_InfoList.Add((tdsecuL_11_16_Info)info);
        }
        #endregion

        //逻辑_交易证券_策略_更新策略状态
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_11_16_Info();
                info.orig_strategy_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORIG_STRATEGY_ID_INT64);
                info.strategy_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_ID_INT64);
                info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                info.strategy_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_DIR_INT);
                info.strategy_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_STATUS_STR);
                info.strategy_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_OPER_WAY_STR);
                tdsecuL_11_16_InfoList.Add(info);
            }
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
            info.opor_no = unpacker.GetInt("opor_no");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.strategy_id = unpacker.GetInt64("strategy_id");
            info.orig_strategy_id = unpacker.GetInt64("orig_strategy_id");
            info.strategy_exec_broker = unpacker.GetStr("strategy_exec_broker");
            info.strategy_exec_kind = unpacker.GetInt("strategy_exec_kind");
            info.strategy_exec_comm_str = unpacker.GetStr("strategy_exec_comm_str");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_acco = unpacker.GetStr("stock_acco");
            info.stock_type = unpacker.GetInt("stock_type");
            info.asset_type = unpacker.GetInt("asset_type");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.strategy_dir = unpacker.GetInt("strategy_dir");
            info.strategy_qty = unpacker.GetDouble("strategy_qty");
            info.cash_strategy_qty = unpacker.GetDouble("cash_strategy_qty");
            info.strategy_price = unpacker.GetDouble("strategy_price");
            info.price_type = unpacker.GetInt("price_type");
            info.strategy_valid_type = unpacker.GetInt("strategy_valid_type");
            info.strategy_rule_way = unpacker.GetStr("strategy_rule_way");
            info.exch_crncy_type = unpacker.GetStr("exch_crncy_type");
            info.remark_info = unpacker.GetStr("remark_info");
            info.strategy_time = unpacker.GetInt("strategy_time");
            info.margin_trade_type = unpacker.GetInt("margin_trade_type");
            info.target_strategy_type = unpacker.GetStr("target_strategy_type");
            info.target_strategy_param = unpacker.GetStr("target_strategy_param");
            info.strategy_contr_comm = unpacker.GetStr("strategy_contr_comm");
            info.strategy_status = unpacker.GetStr("strategy_status");
            info.strategy_deal_status = unpacker.GetStr("strategy_deal_status");
            info.strategy_deal_kind = unpacker.GetInt("strategy_deal_kind");
            info.strategy_amt = unpacker.GetDouble("strategy_amt");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.order_amt = unpacker.GetDouble("order_amt");
            info.wtdraw_qty = unpacker.GetDouble("wtdraw_qty");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.external_no = unpacker.GetInt64("external_no");
            info.order_batch_no = unpacker.GetInt("order_batch_no");
            info.strategy_oper_way = unpacker.GetStr("strategy_oper_way");
            info.update_times = unpacker.GetInt("update_times");
            info.strategy_batch_no = unpacker.GetInt("strategy_batch_no");
            info.comm_batch_no = unpacker.GetInt("comm_batch_no");
            info.comm_id = unpacker.GetInt64("comm_id");
            tdsecuL_11_101_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_11_101_InfoList.Add((tdsecuL_11_101_Info)info);
        }
        #endregion

        //逻辑_交易证券_策略_查询策略
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
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    info.strategy_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_ID_INT64);
                    info.orig_strategy_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORIG_STRATEGY_ID_INT64);
                    info.strategy_exec_broker = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_EXEC_BROKER_STR);
                    info.strategy_exec_kind = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_EXEC_KIND_INT);
                    info.strategy_exec_comm_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_EXEC_COMM_STR_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.strategy_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_DIR_INT);
                    info.strategy_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_QTY_FLOAT);
                    info.cash_strategy_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_STRATEGY_QTY_FLOAT);
                    info.strategy_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_PRICE_FLOAT);
                    info.price_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_INT);
                    info.strategy_valid_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_VALID_TYPE_INT);
                    info.strategy_rule_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_RULE_WAY_STR);
                    info.exch_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    info.strategy_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_TIME_INT);
                    info.margin_trade_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MARGIN_TRADE_TYPE_INT);
                    info.target_strategy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_STRATEGY_TYPE_STR);
                    info.target_strategy_param = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_STRATEGY_PARAM_STR);
                    info.strategy_contr_comm = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_CONTR_COMM_STR);
                    info.strategy_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_STATUS_STR);
                    info.strategy_deal_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_DEAL_STATUS_STR);
                    info.strategy_deal_kind = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_DEAL_KIND_INT);
                    info.strategy_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_AMT_FLOAT);
                    info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    info.order_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_AMT_FLOAT);
                    info.wtdraw_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_QTY_FLOAT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    info.external_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64);
                    info.order_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT);
                    info.strategy_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_OPER_WAY_STR);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    info.strategy_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_BATCH_NO_INT);
                    info.comm_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT);
                    info.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                    tdsecuL_11_101_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_11_102_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_11_102_Response()
        {
            this.tdsecuL_11_102_InfoList = new ObservableCollection<tdsecuL_11_102_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_11_102_Info> tdsecuL_11_102_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_11_102_Info info = new tdsecuL_11_102_Info();
            info.comm_opor = unpacker.GetInt("comm_opor");
            info.opor_no = unpacker.GetInt("opor_no");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.strategy_id = unpacker.GetInt64("strategy_id");
            info.orig_strategy_id = unpacker.GetInt64("orig_strategy_id");
            info.strategy_exec_broker = unpacker.GetStr("strategy_exec_broker");
            info.strategy_exec_kind = unpacker.GetInt("strategy_exec_kind");
            info.strategy_exec_comm_str = unpacker.GetStr("strategy_exec_comm_str");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_acco = unpacker.GetStr("stock_acco");
            info.stock_type = unpacker.GetInt("stock_type");
            info.asset_type = unpacker.GetInt("asset_type");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.strategy_dir = unpacker.GetInt("strategy_dir");
            info.strategy_qty = unpacker.GetDouble("strategy_qty");
            info.cash_strategy_qty = unpacker.GetDouble("cash_strategy_qty");
            info.strategy_price = unpacker.GetDouble("strategy_price");
            info.price_type = unpacker.GetInt("price_type");
            info.strategy_valid_type = unpacker.GetInt("strategy_valid_type");
            info.strategy_rule_way = unpacker.GetStr("strategy_rule_way");
            info.exch_crncy_type = unpacker.GetStr("exch_crncy_type");
            info.remark_info = unpacker.GetStr("remark_info");
            info.strategy_time = unpacker.GetInt("strategy_time");
            info.margin_trade_type = unpacker.GetInt("margin_trade_type");
            info.target_strategy_type = unpacker.GetStr("target_strategy_type");
            info.target_strategy_param = unpacker.GetStr("target_strategy_param");
            info.strategy_contr_comm = unpacker.GetStr("strategy_contr_comm");
            info.strategy_status = unpacker.GetStr("strategy_status");
            info.strategy_deal_status = unpacker.GetStr("strategy_deal_status");
            info.strategy_deal_kind = unpacker.GetInt("strategy_deal_kind");
            info.strategy_amt = unpacker.GetDouble("strategy_amt");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.order_amt = unpacker.GetDouble("order_amt");
            info.wtdraw_qty = unpacker.GetDouble("wtdraw_qty");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.external_no = unpacker.GetInt64("external_no");
            info.order_batch_no = unpacker.GetInt("order_batch_no");
            info.strategy_oper_way = unpacker.GetStr("strategy_oper_way");
            info.comm_batch_no = unpacker.GetInt("comm_batch_no");
            info.comm_id = unpacker.GetInt64("comm_id");
            info.strategy_batch_no = unpacker.GetInt("strategy_batch_no");
            info.update_times = unpacker.GetInt("update_times");
            tdsecuL_11_102_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_11_102_InfoList.Add((tdsecuL_11_102_Info)info);
        }
        #endregion

        //逻辑_交易证券_策略_插件查询策略
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_11_102_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.comm_opor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPOR_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    info.strategy_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_ID_INT64);
                    info.orig_strategy_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORIG_STRATEGY_ID_INT64);
                    info.strategy_exec_broker = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_EXEC_BROKER_STR);
                    info.strategy_exec_kind = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_EXEC_KIND_INT);
                    info.strategy_exec_comm_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_EXEC_COMM_STR_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.strategy_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_DIR_INT);
                    info.strategy_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_QTY_FLOAT);
                    info.cash_strategy_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_STRATEGY_QTY_FLOAT);
                    info.strategy_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_PRICE_FLOAT);
                    info.price_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_INT);
                    info.strategy_valid_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_VALID_TYPE_INT);
                    info.strategy_rule_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_RULE_WAY_STR);
                    info.exch_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    info.strategy_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_TIME_INT);
                    info.margin_trade_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MARGIN_TRADE_TYPE_INT);
                    info.target_strategy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_STRATEGY_TYPE_STR);
                    info.target_strategy_param = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_STRATEGY_PARAM_STR);
                    info.strategy_contr_comm = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_CONTR_COMM_STR);
                    info.strategy_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_STATUS_STR);
                    info.strategy_deal_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_DEAL_STATUS_STR);
                    info.strategy_deal_kind = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_DEAL_KIND_INT);
                    info.strategy_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_AMT_FLOAT);
                    info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    info.order_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_AMT_FLOAT);
                    info.wtdraw_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_QTY_FLOAT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    info.external_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64);
                    info.order_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT);
                    info.strategy_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_OPER_WAY_STR);
                    info.comm_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT);
                    info.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                    info.strategy_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_BATCH_NO_INT);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdsecuL_11_102_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_11_103_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_11_103_Response()
        {
            this.tdsecuL_11_103_InfoList = new ObservableCollection<tdsecuL_11_103_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_11_103_Info> tdsecuL_11_103_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_11_103_Info info = new tdsecuL_11_103_Info();
            info.opor_no = unpacker.GetInt("opor_no");
            info.comm_opor = unpacker.GetInt("comm_opor");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.pass_no = unpacker.GetInt("pass_no");
            info.strategy_batch_no = unpacker.GetInt("strategy_batch_no");
            info.strategy_exec_broker = unpacker.GetStr("strategy_exec_broker");
            info.strategy_exec_kind = unpacker.GetInt("strategy_exec_kind");
            info.strategy_exec_comm_str = unpacker.GetStr("strategy_exec_comm_str");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_type = unpacker.GetInt("stock_type");
            info.asset_type = unpacker.GetInt("asset_type");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.strategy_dir = unpacker.GetInt("strategy_dir");
            info.strategy_qty = unpacker.GetDouble("strategy_qty");
            info.cash_strategy_qty = unpacker.GetDouble("cash_strategy_qty");
            info.strategy_price = unpacker.GetDouble("strategy_price");
            info.price_type = unpacker.GetInt("price_type");
            info.strategy_amt = unpacker.GetDouble("strategy_amt");
            info.strategy_valid_type = unpacker.GetInt("strategy_valid_type");
            info.strategy_rule_way = unpacker.GetStr("strategy_rule_way");
            info.exch_crncy_type = unpacker.GetStr("exch_crncy_type");
            info.remark_info = unpacker.GetStr("remark_info");
            info.strategy_date = unpacker.GetInt("strategy_date");
            info.margin_trade_type = unpacker.GetInt("margin_trade_type");
            info.target_strategy_type = unpacker.GetStr("target_strategy_type");
            info.target_strategy_param = unpacker.GetStr("target_strategy_param");
            info.strategy_contr_comm = unpacker.GetStr("strategy_contr_comm");
            info.strategy_sum_status = unpacker.GetStr("strategy_sum_status");
            info.strategy_deal_status = unpacker.GetStr("strategy_deal_status");
            info.strategy_deal_kind = unpacker.GetInt("strategy_deal_kind");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.valid_order_qty = unpacker.GetDouble("valid_order_qty");
            info.order_amt = unpacker.GetDouble("order_amt");
            info.wtdraw_qty = unpacker.GetDouble("wtdraw_qty");
            info.valid_wtdraw_qty = unpacker.GetDouble("valid_wtdraw_qty");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.cancel_qty = unpacker.GetDouble("cancel_qty");
            info.faild_qty = unpacker.GetDouble("faild_qty");
            info.external_no = unpacker.GetInt64("external_no");
            info.order_batch_no = unpacker.GetInt("order_batch_no");
            info.comm_batch_no = unpacker.GetInt("comm_batch_no");
            info.strategy_oper_way = unpacker.GetStr("strategy_oper_way");
            tdsecuL_11_103_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_11_103_InfoList.Add((tdsecuL_11_103_Info)info);
        }
        #endregion

        //逻辑_交易证券_策略_查询策略汇总
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_11_103_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.comm_opor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPOR_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.strategy_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_BATCH_NO_INT);
                    info.strategy_exec_broker = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_EXEC_BROKER_STR);
                    info.strategy_exec_kind = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_EXEC_KIND_INT);
                    info.strategy_exec_comm_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_EXEC_COMM_STR_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.strategy_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_DIR_INT);
                    info.strategy_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_QTY_FLOAT);
                    info.cash_strategy_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_STRATEGY_QTY_FLOAT);
                    info.strategy_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_PRICE_FLOAT);
                    info.price_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_INT);
                    info.strategy_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_AMT_FLOAT);
                    info.strategy_valid_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_VALID_TYPE_INT);
                    info.strategy_rule_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_RULE_WAY_STR);
                    info.exch_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    info.strategy_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_DATE_INT);
                    info.margin_trade_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MARGIN_TRADE_TYPE_INT);
                    info.target_strategy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_STRATEGY_TYPE_STR);
                    info.target_strategy_param = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_STRATEGY_PARAM_STR);
                    info.strategy_contr_comm = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_CONTR_COMM_STR);
                    info.strategy_sum_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_SUM_STATUS_STR);
                    info.strategy_deal_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_DEAL_STATUS_STR);
                    info.strategy_deal_kind = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_DEAL_KIND_INT);
                    info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    info.valid_order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VALID_ORDER_QTY_FLOAT);
                    info.order_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_AMT_FLOAT);
                    info.wtdraw_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_QTY_FLOAT);
                    info.valid_wtdraw_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VALID_WTDRAW_QTY_FLOAT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    info.cancel_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CANCEL_QTY_FLOAT);
                    info.faild_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FAILD_QTY_FLOAT);
                    info.external_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64);
                    info.order_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT);
                    info.comm_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT);
                    info.strategy_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_OPER_WAY_STR);
                    tdsecuL_11_103_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_11_104_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_11_104_Response()
        {
            this.tdsecuL_11_104_InfoList = new ObservableCollection<tdsecuL_11_104_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_11_104_Info> tdsecuL_11_104_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_11_104_Info info = new tdsecuL_11_104_Info();
            tdsecuL_11_104_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_11_104_InfoList.Add((tdsecuL_11_104_Info)info);
        }
        #endregion

        //逻辑_交易证券_策略_手工撤销策略
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_11_104_Info();
                tdsecuL_11_104_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_11_105_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_11_105_Response()
        {
            this.tdsecuL_11_105_InfoList = new ObservableCollection<tdsecuL_11_105_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_11_105_Info> tdsecuL_11_105_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_11_105_Info info = new tdsecuL_11_105_Info();
            tdsecuL_11_105_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_11_105_InfoList.Add((tdsecuL_11_105_Info)info);
        }
        #endregion

        //逻辑_交易证券_策略_重置指令策略数量
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_11_105_Info();
                tdsecuL_11_105_InfoList.Add(info);
            }
        }
    }

}
