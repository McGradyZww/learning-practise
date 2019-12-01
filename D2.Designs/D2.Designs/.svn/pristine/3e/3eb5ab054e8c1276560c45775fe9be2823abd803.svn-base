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
    public class pubL_17_8_Response : IResponse
    {
        #region 构造函数
        public pubL_17_8_Response()
        {
            this.pubL_17_8_InfoList = new ObservableCollection<pubL_17_8_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_17_8_Info> pubL_17_8_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_17_8_Info info = new pubL_17_8_Info();
            info.mach_date = unpacker.GetInt("mach_date");
            info.mach_time = unpacker.GetInt("mach_time");
            pubL_17_8_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_17_8_InfoList.Add((pubL_17_8_Info)info);
        }
        #endregion

        //逻辑_公共_基础客户端_获取机器日期时间
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_17_8_Info();
                info.mach_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MACH_DATE_INT);
                info.mach_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MACH_TIME_INT);
                pubL_17_8_InfoList.Add(info);
            }
        }
    }

    public class pubL_17_12_Response : IResponse
    {
        #region 构造函数
        public pubL_17_12_Response()
        {
            this.pubL_17_12_InfoList = new ObservableCollection<pubL_17_12_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_17_12_Info> pubL_17_12_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_17_12_Info info = new pubL_17_12_Info();
            pubL_17_12_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_17_12_InfoList.Add((pubL_17_12_Info)info);
        }
        #endregion

        //逻辑_公共_基础客户端_修改机构信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_17_12_Info();
                pubL_17_12_InfoList.Add(info);
            }
        }
    }

    public class pubL_17_13_Response : IResponse
    {
        #region 构造函数
        public pubL_17_13_Response()
        {
            this.pubL_17_13_InfoList = new ObservableCollection<pubL_17_13_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_17_13_Info> pubL_17_13_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_17_13_Info info = new pubL_17_13_Info();
            pubL_17_13_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_17_13_InfoList.Add((pubL_17_13_Info)info);
        }
        #endregion

        //逻辑_公共_基础客户端_修改机构业务控制配置串
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_17_13_Info();
                pubL_17_13_InfoList.Add(info);
            }
        }
    }

    public class pubL_17_18_Response : IResponse
    {
        #region 构造函数
        public pubL_17_18_Response()
        {
            this.pubL_17_18_InfoList = new ObservableCollection<pubL_17_18_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_17_18_Info> pubL_17_18_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_17_18_Info info = new pubL_17_18_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.co_name = unpacker.GetStr("co_name");
            info.co_type = unpacker.GetInt("co_type");
            info.create_date = unpacker.GetInt("create_date");
            info.conta_addr = unpacker.GetStr("conta_addr");
            info.conta_name = unpacker.GetStr("conta_name");
            info.phone_number = unpacker.GetStr("phone_number");
            info.pd_qty_max = unpacker.GetInt("pd_qty_max");
            info.max_acco_count = unpacker.GetInt("max_acco_count");
            info.opor_qty_max = unpacker.GetInt("opor_qty_max");
            info.co_status = unpacker.GetStr("co_status");
            info.allow_exch = unpacker.GetStr("allow_exch");
            info.allow_stock_type = unpacker.GetStr("allow_stock_type");
            info.busi_config_str = unpacker.GetStr("busi_config_str");
            info.comm_appr_oper = unpacker.GetInt("comm_appr_oper");
            info.market_price_ratio = unpacker.GetDouble("market_price_ratio");
            info.mul_acco_trd_assign_set = unpacker.GetStr("mul_acco_trd_assign_set");
            info.mul_acco_trd_choice = unpacker.GetInt("mul_acco_trd_choice");
            info.mul_acco_trd_qty_set = unpacker.GetStr("mul_acco_trd_qty_set");
            info.genus_algo_strategy_set = unpacker.GetStr("genus_algo_strategy_set");
            info.base_crncy_type = unpacker.GetStr("base_crncy_type");
            pubL_17_18_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_17_18_InfoList.Add((pubL_17_18_Info)info);
        }
        #endregion

        //逻辑_公共_基础客户端_查询机构信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_17_18_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.co_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CO_NAME_STR);
                    info.co_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_TYPE_INT);
                    info.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    info.conta_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTA_ADDR_STR);
                    info.conta_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTA_NAME_STR);
                    info.phone_number = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PHONE_NUMBER_STR);
                    info.pd_qty_max = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_QTY_MAX_INT);
                    info.max_acco_count = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MAX_ACCO_COUNT_INT);
                    info.opor_qty_max = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_QTY_MAX_INT);
                    info.co_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CO_STATUS_STR);
                    info.allow_exch = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_EXCH_STR);
                    info.allow_stock_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_STOCK_TYPE_STR);
                    info.busi_config_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_CONFIG_STR_STR);
                    info.comm_appr_oper = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_OPER_INT);
                    info.market_price_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_PRICE_RATIO_FLOAT);
                    info.mul_acco_trd_assign_set = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MUL_ACCO_TRD_ASSIGN_SET_STR);
                    info.mul_acco_trd_choice = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MUL_ACCO_TRD_CHOICE_INT);
                    info.mul_acco_trd_qty_set = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MUL_ACCO_TRD_QTY_SET_STR);
                    info.genus_algo_strategy_set = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_GENUS_ALGO_STRATEGY_SET_STR);
                    info.base_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BASE_CRNCY_TYPE_STR);
                    pubL_17_18_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_17_32_Response : IResponse
    {
        #region 构造函数
        public pubL_17_32_Response()
        {
            this.pubL_17_32_InfoList = new ObservableCollection<pubL_17_32_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_17_32_Info> pubL_17_32_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_17_32_Info info = new pubL_17_32_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.config_no = unpacker.GetInt64("config_no");
            info.config_name = unpacker.GetStr("config_name");
            info.config_choice_type = unpacker.GetInt("config_choice_type");
            info.config_value = unpacker.GetStr("config_value");
            info.dict_field_name = unpacker.GetStr("dict_field_name");
            info.config_memo = unpacker.GetStr("config_memo");
            pubL_17_32_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_17_32_InfoList.Add((pubL_17_32_Info)info);
        }
        #endregion

        //逻辑_公共_基础客户端_查询系统配置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_17_32_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.config_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_NO_INT64);
                    info.config_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_NAME_STR);
                    info.config_choice_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_CHOICE_TYPE_INT);
                    info.config_value = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_VALUE_STR);
                    info.dict_field_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DICT_FIELD_NAME_STR);
                    info.config_memo = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_MEMO_STR);
                    pubL_17_32_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_17_38_Response : IResponse
    {
        #region 构造函数
        public pubL_17_38_Response()
        {
            this.pubL_17_38_InfoList = new ObservableCollection<pubL_17_38_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_17_38_Info> pubL_17_38_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_17_38_Info info = new pubL_17_38_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.for_crncy_type = unpacker.GetStr("for_crncy_type");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.buy_exch_rate = unpacker.GetDouble("buy_exch_rate");
            info.sale_exch_rate = unpacker.GetDouble("sale_exch_rate");
            pubL_17_38_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_17_38_InfoList.Add((pubL_17_38_Info)info);
        }
        #endregion

        //逻辑_公共_基础客户端_查询机构汇率
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_17_38_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.for_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FOR_CRNCY_TYPE_STR);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.buy_exch_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_EXCH_RATE_FLOAT);
                    info.sale_exch_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SALE_EXCH_RATE_FLOAT);
                    pubL_17_38_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_17_154_Response : IResponse
    {
        #region 构造函数
        public pubL_17_154_Response()
        {
            this.pubL_17_154_InfoList = new ObservableCollection<pubL_17_154_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_17_154_Info> pubL_17_154_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_17_154_Info info = new pubL_17_154_Info();
            info.pass_no = unpacker.GetInt("pass_no");
            pubL_17_154_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_17_154_InfoList.Add((pubL_17_154_Info)info);
        }
        #endregion

        //逻辑_公共_基础客户端_上线通道
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_17_154_Info();
                info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                pubL_17_154_InfoList.Add(info);
            }
        }
    }

    public class pubL_17_155_Response : IResponse
    {
        #region 构造函数
        public pubL_17_155_Response()
        {
            this.pubL_17_155_InfoList = new ObservableCollection<pubL_17_155_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_17_155_Info> pubL_17_155_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_17_155_Info info = new pubL_17_155_Info();
            info.pass_no = unpacker.GetInt("pass_no");
            pubL_17_155_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_17_155_InfoList.Add((pubL_17_155_Info)info);
        }
        #endregion

        //逻辑_公共_基础客户端_下线通道
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_17_155_Info();
                info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                pubL_17_155_InfoList.Add(info);
            }
        }
    }

    public class pubL_17_117_Response : IResponse
    {
        #region 构造函数
        public pubL_17_117_Response()
        {
            this.pubL_17_117_InfoList = new ObservableCollection<pubL_17_117_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_17_117_Info> pubL_17_117_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_17_117_Info info = new pubL_17_117_Info();
            info.sh_hk_buy_ref_rate = unpacker.GetDouble("sh_hk_buy_ref_rate");
            info.sh_hk_sell_ref_rate = unpacker.GetDouble("sh_hk_sell_ref_rate");
            info.sh_hk_settle_buy_rate = unpacker.GetDouble("sh_hk_settle_buy_rate");
            info.sh_hk_settle_sell_rate = unpacker.GetDouble("sh_hk_settle_sell_rate");
            info.sz_hk_buy_ref_rate = unpacker.GetDouble("sz_hk_buy_ref_rate");
            info.sz_hk_sell_ref_rate = unpacker.GetDouble("sz_hk_sell_ref_rate");
            info.sz_hk_settle_buy_rate = unpacker.GetDouble("sz_hk_settle_buy_rate");
            info.sz_hksettle_sell_rate = unpacker.GetDouble("sz_hksettle_sell_rate");
            pubL_17_117_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_17_117_InfoList.Add((pubL_17_117_Info)info);
        }
        #endregion

        //逻辑_公共_基础客户端_获取港股通汇率信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_17_117_Info();
                info.sh_hk_buy_ref_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SH_HK_BUY_REF_RATE_FLOAT);
                info.sh_hk_sell_ref_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SH_HK_SELL_REF_RATE_FLOAT);
                info.sh_hk_settle_buy_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SH_HK_SETTLE_BUY_RATE_FLOAT);
                info.sh_hk_settle_sell_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SH_HK_SETTLE_SELL_RATE_FLOAT);
                info.sz_hk_buy_ref_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SZ_HK_BUY_REF_RATE_FLOAT);
                info.sz_hk_sell_ref_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SZ_HK_SELL_REF_RATE_FLOAT);
                info.sz_hk_settle_buy_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SZ_HK_SETTLE_BUY_RATE_FLOAT);
                info.sz_hksettle_sell_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SZ_HKSETTLE_SELL_RATE_FLOAT);
                pubL_17_117_InfoList.Add(info);
            }
        }
    }

    public class pubL_17_118_Response : IResponse
    {
        #region 构造函数
        public pubL_17_118_Response()
        {
            this.pubL_17_118_InfoList = new ObservableCollection<pubL_17_118_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_17_118_Info> pubL_17_118_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_17_118_Info info = new pubL_17_118_Info();
            info.update_times = unpacker.GetInt("update_times");
            pubL_17_118_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_17_118_InfoList.Add((pubL_17_118_Info)info);
        }
        #endregion

        //逻辑_公共_基础客户端_更新港股通额度信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_17_118_Info();
                info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                pubL_17_118_InfoList.Add(info);
            }
        }
    }

    public class pubL_17_119_Response : IResponse
    {
        #region 构造函数
        public pubL_17_119_Response()
        {
            this.pubL_17_119_InfoList = new ObservableCollection<pubL_17_119_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_17_119_Info> pubL_17_119_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_17_119_Info info = new pubL_17_119_Info();
            info.exch_no = unpacker.GetInt("exch_no");
            info.begin_limit = unpacker.GetDouble("begin_limit");
            info.remain_limit = unpacker.GetDouble("remain_limit");
            info.limit_status = unpacker.GetInt("limit_status");
            info.remark_info = unpacker.GetStr("remark_info");
            info.update_times = unpacker.GetInt("update_times");
            pubL_17_119_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_17_119_InfoList.Add((pubL_17_119_Info)info);
        }
        #endregion

        //逻辑_公共_基础客户端_查询港股通额度信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_17_119_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.begin_limit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_LIMIT_FLOAT);
                    info.remain_limit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REMAIN_LIMIT_FLOAT);
                    info.limit_status = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LIMIT_STATUS_INT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    pubL_17_119_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_17_180_Response : IResponse
    {
        #region 构造函数
        public pubL_17_180_Response()
        {
            this.pubL_17_180_InfoList = new ObservableCollection<pubL_17_180_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_17_180_Info> pubL_17_180_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_17_180_Info info = new pubL_17_180_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.dict_no = unpacker.GetInt("dict_no");
            info.dict_name = unpacker.GetStr("dict_name");
            info.dict_field_name = unpacker.GetStr("dict_field_name");
            info.dict_item_name = unpacker.GetStr("dict_item_name");
            info.dict_item_value = unpacker.GetStr("dict_item_value");
            info.time_stamp = unpacker.GetInt("time_stamp");
            pubL_17_180_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_17_180_InfoList.Add((pubL_17_180_Info)info);
        }
        #endregion

        //逻辑_公共_基础客户端_查询数据字典
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_17_180_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.dict_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DICT_NO_INT);
                    info.dict_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DICT_NAME_STR);
                    info.dict_field_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DICT_FIELD_NAME_STR);
                    info.dict_item_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DICT_ITEM_NAME_STR);
                    info.dict_item_value = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DICT_ITEM_VALUE_STR);
                    info.time_stamp = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT);
                    pubL_17_180_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_17_181_Response : IResponse
    {
        #region 构造函数
        public pubL_17_181_Response()
        {
            this.pubL_17_181_InfoList = new ObservableCollection<pubL_17_181_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_17_181_Info> pubL_17_181_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_17_181_Info info = new pubL_17_181_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.busi_type = unpacker.GetInt("busi_type");
            info.busi_sub_type = unpacker.GetInt("busi_sub_type");
            info.busi_flag = unpacker.GetInt("busi_flag");
            info.busi_name = unpacker.GetStr("busi_name");
            info.time_stamp = unpacker.GetInt("time_stamp");
            pubL_17_181_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_17_181_InfoList.Add((pubL_17_181_Info)info);
        }
        #endregion

        //逻辑_公共_基础客户端_查询业务标志
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_17_181_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.busi_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_TYPE_INT);
                    info.busi_sub_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_SUB_TYPE_INT);
                    info.busi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT);
                    info.busi_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_NAME_STR);
                    info.time_stamp = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT);
                    pubL_17_181_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_17_182_Response : IResponse
    {
        #region 构造函数
        public pubL_17_182_Response()
        {
            this.pubL_17_182_InfoList = new ObservableCollection<pubL_17_182_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_17_182_Info> pubL_17_182_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_17_182_Info info = new pubL_17_182_Info();
            info.up_limit_price = unpacker.GetDouble("up_limit_price");
            info.down_limit_price = unpacker.GetDouble("down_limit_price");
            info.last_price = unpacker.GetDouble("last_price");
            pubL_17_182_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_17_182_InfoList.Add((pubL_17_182_Info)info);
        }
        #endregion

        //逻辑_公共_基础客户端_获取基础证券行情
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_17_182_Info();
                info.up_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UP_LIMIT_PRICE_FLOAT);
                info.down_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DOWN_LIMIT_PRICE_FLOAT);
                info.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                pubL_17_182_InfoList.Add(info);
            }
        }
    }

    public class pubL_17_120_Response : IResponse
    {
        #region 构造函数
        public pubL_17_120_Response()
        {
            this.pubL_17_120_InfoList = new ObservableCollection<pubL_17_120_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_17_120_Info> pubL_17_120_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_17_120_Info info = new pubL_17_120_Info();
            info.sh_hk_buy_ref_rate = unpacker.GetDouble("sh_hk_buy_ref_rate");
            info.sh_hk_sell_ref_rate = unpacker.GetDouble("sh_hk_sell_ref_rate");
            info.sh_hk_settle_buy_rate = unpacker.GetDouble("sh_hk_settle_buy_rate");
            info.sh_hk_settle_sell_rate = unpacker.GetDouble("sh_hk_settle_sell_rate");
            info.sz_hk_buy_ref_rate = unpacker.GetDouble("sz_hk_buy_ref_rate");
            info.sz_hk_sell_ref_rate = unpacker.GetDouble("sz_hk_sell_ref_rate");
            info.sz_hk_settle_buy_rate = unpacker.GetDouble("sz_hk_settle_buy_rate");
            info.sz_hksettle_sell_rate = unpacker.GetDouble("sz_hksettle_sell_rate");
            info.busin_date = unpacker.GetInt("busin_date");
            info.pboc_rate = unpacker.GetDouble("pboc_rate");
            pubL_17_120_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_17_120_InfoList.Add((pubL_17_120_Info)info);
        }
        #endregion

        //逻辑_公共_基础客户端_获取所需港股通汇率信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_17_120_Info();
                info.sh_hk_buy_ref_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SH_HK_BUY_REF_RATE_FLOAT);
                info.sh_hk_sell_ref_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SH_HK_SELL_REF_RATE_FLOAT);
                info.sh_hk_settle_buy_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SH_HK_SETTLE_BUY_RATE_FLOAT);
                info.sh_hk_settle_sell_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SH_HK_SETTLE_SELL_RATE_FLOAT);
                info.sz_hk_buy_ref_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SZ_HK_BUY_REF_RATE_FLOAT);
                info.sz_hk_sell_ref_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SZ_HK_SELL_REF_RATE_FLOAT);
                info.sz_hk_settle_buy_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SZ_HK_SETTLE_BUY_RATE_FLOAT);
                info.sz_hksettle_sell_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SZ_HKSETTLE_SELL_RATE_FLOAT);
                info.busin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSIN_DATE_INT);
                info.pboc_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PBOC_RATE_FLOAT);
                pubL_17_120_InfoList.Add(info);
            }
        }
    }

    public class pubL_17_121_Response : IResponse
    {
        #region 构造函数
        public pubL_17_121_Response()
        {
            this.pubL_17_121_InfoList = new ObservableCollection<pubL_17_121_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_17_121_Info> pubL_17_121_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_17_121_Info info = new pubL_17_121_Info();
            pubL_17_121_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_17_121_InfoList.Add((pubL_17_121_Info)info);
        }
        #endregion

        //逻辑_公共_基础客户端_新增所需港股通汇率信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_17_121_Info();
                pubL_17_121_InfoList.Add(info);
            }
        }
    }

    public class pubL_17_122_Response : IResponse
    {
        #region 构造函数
        public pubL_17_122_Response()
        {
            this.pubL_17_122_InfoList = new ObservableCollection<pubL_17_122_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_17_122_Info> pubL_17_122_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_17_122_Info info = new pubL_17_122_Info();
            pubL_17_122_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_17_122_InfoList.Add((pubL_17_122_Info)info);
        }
        #endregion

        //逻辑_公共_基础客户端_修改所需港股通汇率信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_17_122_Info();
                pubL_17_122_InfoList.Add(info);
            }
        }
    }

    public class pubL_17_123_Response : IResponse
    {
        #region 构造函数
        public pubL_17_123_Response()
        {
            this.pubL_17_123_InfoList = new ObservableCollection<pubL_17_123_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_17_123_Info> pubL_17_123_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_17_123_Info info = new pubL_17_123_Info();
            pubL_17_123_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_17_123_InfoList.Add((pubL_17_123_Info)info);
        }
        #endregion

        //逻辑_公共_基础客户端_修改新股代码信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_17_123_Info();
                pubL_17_123_InfoList.Add(info);
            }
        }
    }

    public class pubL_17_124_Response : IResponse
    {
        #region 构造函数
        public pubL_17_124_Response()
        {
            this.pubL_17_124_InfoList = new ObservableCollection<pubL_17_124_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_17_124_Info> pubL_17_124_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_17_124_Info info = new pubL_17_124_Info();
            pubL_17_124_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_17_124_InfoList.Add((pubL_17_124_Info)info);
        }
        #endregion

        //逻辑_公共_基础客户端_修改可转债代码信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_17_124_Info();
                pubL_17_124_InfoList.Add(info);
            }
        }
    }

    public class pubL_17_125_Response : IResponse
    {
        #region 构造函数
        public pubL_17_125_Response()
        {
            this.pubL_17_125_InfoList = new ObservableCollection<pubL_17_125_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_17_125_Info> pubL_17_125_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_17_125_Info info = new pubL_17_125_Info();
            pubL_17_125_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_17_125_InfoList.Add((pubL_17_125_Info)info);
        }
        #endregion

        //逻辑_公共_基础客户端_新增对冲篮子信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_17_125_Info();
                pubL_17_125_InfoList.Add(info);
            }
        }
    }

    public class pubL_17_126_Response : IResponse
    {
        #region 构造函数
        public pubL_17_126_Response()
        {
            this.pubL_17_126_InfoList = new ObservableCollection<pubL_17_126_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_17_126_Info> pubL_17_126_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_17_126_Info info = new pubL_17_126_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.record_batch_no = unpacker.GetInt("record_batch_no");
            info.comm_trd_type = unpacker.GetInt("comm_trd_type");
            info.basket_id = unpacker.GetInt64("basket_id");
            info.basket_name = unpacker.GetStr("basket_name");
            info.futu_qty = unpacker.GetDouble("futu_qty");
            info.spot_qty = unpacker.GetDouble("spot_qty");
            info.basket_copies = unpacker.GetDouble("basket_copies");
            info.remain_copies = unpacker.GetDouble("remain_copies");
            info.cash_replace_amt = unpacker.GetDouble("cash_replace_amt");
            info.hedging_pankou = unpacker.GetDouble("hedging_pankou");
            info.name_base_diff = unpacker.GetDouble("name_base_diff");
            info.basket_base_diff = unpacker.GetDouble("basket_base_diff");
            info.track_base_diff = unpacker.GetDouble("track_base_diff");
            info.update_times = unpacker.GetInt("update_times");
            pubL_17_126_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_17_126_InfoList.Add((pubL_17_126_Info)info);
        }
        #endregion

        //逻辑_公共_基础客户端_查询对冲篮子信息结果集
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_17_126_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.record_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RECORD_BATCH_NO_INT);
                    info.comm_trd_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_TRD_TYPE_INT);
                    info.basket_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_ID_INT64);
                    info.basket_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_NAME_STR);
                    info.futu_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_QTY_FLOAT);
                    info.spot_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SPOT_QTY_FLOAT);
                    info.basket_copies = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_COPIES_FLOAT);
                    info.remain_copies = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REMAIN_COPIES_FLOAT);
                    info.cash_replace_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_REPLACE_AMT_FLOAT);
                    info.hedging_pankou = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HEDGING_PANKOU_FLOAT);
                    info.name_base_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAME_BASE_DIFF_FLOAT);
                    info.basket_base_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_BASE_DIFF_FLOAT);
                    info.track_base_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRACK_BASE_DIFF_FLOAT);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    pubL_17_126_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_17_127_Response : IResponse
    {
        #region 构造函数
        public pubL_17_127_Response()
        {
            this.pubL_17_127_InfoList = new ObservableCollection<pubL_17_127_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_17_127_Info> pubL_17_127_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_17_127_Info info = new pubL_17_127_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.record_batch_no = unpacker.GetInt("record_batch_no");
            info.comm_trd_type = unpacker.GetInt("comm_trd_type");
            info.basket_id = unpacker.GetInt64("basket_id");
            info.basket_name = unpacker.GetStr("basket_name");
            info.futu_qty = unpacker.GetDouble("futu_qty");
            info.spot_qty = unpacker.GetDouble("spot_qty");
            info.basket_copies = unpacker.GetDouble("basket_copies");
            info.remain_copies = unpacker.GetDouble("remain_copies");
            info.cash_replace_amt = unpacker.GetDouble("cash_replace_amt");
            info.hedging_pankou = unpacker.GetDouble("hedging_pankou");
            info.name_base_diff = unpacker.GetDouble("name_base_diff");
            info.basket_base_diff = unpacker.GetDouble("basket_base_diff");
            info.track_base_diff = unpacker.GetDouble("track_base_diff");
            info.update_times = unpacker.GetInt("update_times");
            pubL_17_127_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_17_127_InfoList.Add((pubL_17_127_Info)info);
        }
        #endregion

        //逻辑_公共_基础客户端_查询历史对冲篮子信息结果集
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_17_127_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.record_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RECORD_BATCH_NO_INT);
                    info.comm_trd_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_TRD_TYPE_INT);
                    info.basket_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_ID_INT64);
                    info.basket_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_NAME_STR);
                    info.futu_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_QTY_FLOAT);
                    info.spot_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SPOT_QTY_FLOAT);
                    info.basket_copies = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_COPIES_FLOAT);
                    info.remain_copies = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REMAIN_COPIES_FLOAT);
                    info.cash_replace_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_REPLACE_AMT_FLOAT);
                    info.hedging_pankou = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HEDGING_PANKOU_FLOAT);
                    info.name_base_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAME_BASE_DIFF_FLOAT);
                    info.basket_base_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_BASE_DIFF_FLOAT);
                    info.track_base_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRACK_BASE_DIFF_FLOAT);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    pubL_17_127_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_17_128_Response : IResponse
    {
        #region 构造函数
        public pubL_17_128_Response()
        {
            this.pubL_17_128_InfoList = new ObservableCollection<pubL_17_128_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_17_128_Info> pubL_17_128_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_17_128_Info info = new pubL_17_128_Info();
            pubL_17_128_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_17_128_InfoList.Add((pubL_17_128_Info)info);
        }
        #endregion

        //逻辑_公共_基础客户端_修改对冲篮子信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_17_128_Info();
                pubL_17_128_InfoList.Add(info);
            }
        }
    }

}
