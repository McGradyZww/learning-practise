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
    public class pubL_13_112_Response : IResponse
    {
        #region 构造函数
        public pubL_13_112_Response()
        {
            this.pubL_13_112_InfoList = new ObservableCollection<pubL_13_112_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_13_112_Info> pubL_13_112_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_13_112_Info info = new pubL_13_112_Info();
            pubL_13_112_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_13_112_InfoList.Add((pubL_13_112_Info)info);
        }
        #endregion

        //逻辑_公共_期货基础数据_修改合约类型
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_13_112_Info();
                pubL_13_112_InfoList.Add(info);
            }
        }
    }

    public class pubL_13_114_Response : IResponse
    {
        #region 构造函数
        public pubL_13_114_Response()
        {
            this.pubL_13_114_InfoList = new ObservableCollection<pubL_13_114_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_13_114_Info> pubL_13_114_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_13_114_Info info = new pubL_13_114_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.exch_no = unpacker.GetInt("exch_no");
            info.contrc_type = unpacker.GetInt("contrc_type");
            info.contrc_type_name = unpacker.GetStr("contrc_type_name");
            info.asset_type = unpacker.GetInt("asset_type");
            info.par_value = unpacker.GetDouble("par_value");
            info.contrc_unit = unpacker.GetInt("contrc_unit");
            info.report_unit = unpacker.GetInt("report_unit");
            info.min_unit = unpacker.GetInt("min_unit");
            info.max_qty = unpacker.GetDouble("max_qty");
            info.min_qty = unpacker.GetDouble("min_qty");
            info.type_unit = unpacker.GetInt("type_unit");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.exch_crncy_type = unpacker.GetStr("exch_crncy_type");
            info.capit_reback_days = unpacker.GetInt("capit_reback_days");
            info.posi_reback_days = unpacker.GetInt("posi_reback_days");
            info.is_order_dir_flag = unpacker.GetInt("is_order_dir_flag");
            info.time_stamp = unpacker.GetInt("time_stamp");
            pubL_13_114_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_13_114_InfoList.Add((pubL_13_114_Info)info);
        }
        #endregion

        //逻辑_公共_期货基础数据_查询合约类型
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_13_114_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    info.contrc_type_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_NAME_STR);
                    info.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    info.par_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_FLOAT);
                    info.contrc_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_UNIT_INT);
                    info.report_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_UNIT_INT);
                    info.min_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MIN_UNIT_INT);
                    info.max_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_QTY_FLOAT);
                    info.min_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_QTY_FLOAT);
                    info.type_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TYPE_UNIT_INT);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.exch_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR);
                    info.capit_reback_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CAPIT_REBACK_DAYS_INT);
                    info.posi_reback_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_POSI_REBACK_DAYS_INT);
                    info.is_order_dir_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_ORDER_DIR_FLAG_INT);
                    info.time_stamp = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT);
                    pubL_13_114_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_13_115_Response : IResponse
    {
        #region 构造函数
        public pubL_13_115_Response()
        {
            this.pubL_13_115_InfoList = new ObservableCollection<pubL_13_115_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_13_115_Info> pubL_13_115_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_13_115_Info info = new pubL_13_115_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.opor_co_no = unpacker.GetInt("opor_co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.oper_mac = unpacker.GetStr("oper_mac");
            info.oper_ip_addr = unpacker.GetStr("oper_ip_addr");
            info.oper_info = unpacker.GetStr("oper_info");
            info.oper_way = unpacker.GetStr("oper_way");
            info.oper_menu_no = unpacker.GetInt("oper_menu_no");
            info.oper_func_code = unpacker.GetStr("oper_func_code");
            info.init_date = unpacker.GetInt("init_date");
            info.exch_no = unpacker.GetInt("exch_no");
            info.contrc_type = unpacker.GetInt("contrc_type");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pubL_13_115_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_13_115_InfoList.Add((pubL_13_115_Info)info);
        }
        #endregion

        //逻辑_公共_期货基础数据_查询合约类型流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_13_115_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    info.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    info.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    info.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    info.oper_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MENU_NO_INT);
                    info.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pubL_13_115_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_13_116_Response : IResponse
    {
        #region 构造函数
        public pubL_13_116_Response()
        {
            this.pubL_13_116_InfoList = new ObservableCollection<pubL_13_116_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_13_116_Info> pubL_13_116_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_13_116_Info info = new pubL_13_116_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.opor_co_no = unpacker.GetInt("opor_co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.oper_mac = unpacker.GetStr("oper_mac");
            info.oper_ip_addr = unpacker.GetStr("oper_ip_addr");
            info.oper_info = unpacker.GetStr("oper_info");
            info.oper_way = unpacker.GetStr("oper_way");
            info.oper_menu_no = unpacker.GetInt("oper_menu_no");
            info.oper_func_code = unpacker.GetStr("oper_func_code");
            info.init_date = unpacker.GetInt("init_date");
            info.exch_no = unpacker.GetInt("exch_no");
            info.contrc_type = unpacker.GetInt("contrc_type");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pubL_13_116_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_13_116_InfoList.Add((pubL_13_116_Info)info);
        }
        #endregion

        //逻辑_公共_期货基础数据_查询历史合约类型流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_13_116_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    info.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    info.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    info.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    info.oper_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MENU_NO_INT);
                    info.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pubL_13_116_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_13_124_Response : IResponse
    {
        #region 构造函数
        public pubL_13_124_Response()
        {
            this.pubL_13_124_InfoList = new ObservableCollection<pubL_13_124_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_13_124_Info> pubL_13_124_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_13_124_Info info = new pubL_13_124_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.exch_no = unpacker.GetInt("exch_no");
            info.contrc_type = unpacker.GetInt("contrc_type");
            info.order_dir = unpacker.GetInt("order_dir");
            info.cash_frozen_type = unpacker.GetInt("cash_frozen_type");
            info.order_split_flag = unpacker.GetInt("order_split_flag");
            info.min_unit = unpacker.GetInt("min_unit");
            info.min_qty = unpacker.GetDouble("min_qty");
            info.max_qty = unpacker.GetDouble("max_qty");
            info.time_stamp = unpacker.GetInt("time_stamp");
            pubL_13_124_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_13_124_InfoList.Add((pubL_13_124_Info)info);
        }
        #endregion

        //逻辑_公共_期货基础数据_查询合约类型订单方向
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_13_124_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.cash_frozen_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CASH_FROZEN_TYPE_INT);
                    info.order_split_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_SPLIT_FLAG_INT);
                    info.min_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MIN_UNIT_INT);
                    info.min_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_QTY_FLOAT);
                    info.max_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_QTY_FLOAT);
                    info.time_stamp = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT);
                    pubL_13_124_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_13_131_Response : IResponse
    {
        #region 构造函数
        public pubL_13_131_Response()
        {
            this.pubL_13_131_InfoList = new ObservableCollection<pubL_13_131_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_13_131_Info> pubL_13_131_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_13_131_Info info = new pubL_13_131_Info();
            info.row_id = unpacker.GetInt64("row_id");
            pubL_13_131_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_13_131_InfoList.Add((pubL_13_131_Info)info);
        }
        #endregion

        //逻辑_公共_期货基础数据_初始化期货代码信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_13_131_Info();
                info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                pubL_13_131_InfoList.Add(info);
            }
        }
    }

    public class pubL_13_132_Response : IResponse
    {
        #region 构造函数
        public pubL_13_132_Response()
        {
            this.pubL_13_132_InfoList = new ObservableCollection<pubL_13_132_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_13_132_Info> pubL_13_132_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_13_132_Info info = new pubL_13_132_Info();
            pubL_13_132_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_13_132_InfoList.Add((pubL_13_132_Info)info);
        }
        #endregion

        //逻辑_公共_期货基础数据_更新期货行情
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_13_132_Info();
                pubL_13_132_InfoList.Add(info);
            }
        }
    }

    public class pubL_13_133_Response : IResponse
    {
        #region 构造函数
        public pubL_13_133_Response()
        {
            this.pubL_13_133_InfoList = new ObservableCollection<pubL_13_133_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_13_133_Info> pubL_13_133_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_13_133_Info info = new pubL_13_133_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.contrc_code_no = unpacker.GetInt("contrc_code_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.contrc_code = unpacker.GetStr("contrc_code");
            info.contrc_name = unpacker.GetStr("contrc_name");
            info.pinyin_short = unpacker.GetStr("pinyin_short");
            info.contrc_type = unpacker.GetInt("contrc_type");
            info.asset_type = unpacker.GetInt("asset_type");
            info.par_value = unpacker.GetDouble("par_value");
            info.contrc_unit = unpacker.GetInt("contrc_unit");
            info.report_unit = unpacker.GetInt("report_unit");
            info.min_unit = unpacker.GetInt("min_unit");
            info.max_qty = unpacker.GetDouble("max_qty");
            info.min_qty = unpacker.GetDouble("min_qty");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.exch_crncy_type = unpacker.GetStr("exch_crncy_type");
            info.capit_reback_days = unpacker.GetInt("capit_reback_days");
            info.posi_reback_days = unpacker.GetInt("posi_reback_days");
            info.fee_set = unpacker.GetStr("fee_set");
            info.is_order_dir_flag = unpacker.GetInt("is_order_dir_flag");
            info.valid_flag = unpacker.GetInt("valid_flag");
            info.contrc_limit_flag = unpacker.GetInt("contrc_limit_flag");
            info.margin_pref = unpacker.GetInt("margin_pref");
            info.posi_type = unpacker.GetInt("posi_type");
            info.deli_year = unpacker.GetInt("deli_year");
            info.deli_month = unpacker.GetInt("deli_month");
            info.begin_trade_date = unpacker.GetInt("begin_trade_date");
            info.expire_date = unpacker.GetInt("expire_date");
            info.begin_deli_date = unpacker.GetInt("begin_deli_date");
            info.end_deli_date = unpacker.GetInt("end_deli_date");
            info.open_order_type = unpacker.GetInt("open_order_type");
            info.step_price = unpacker.GetDouble("step_price");
            info.hold_qty = unpacker.GetDouble("hold_qty");
            info.main_flag = unpacker.GetInt("main_flag");
            info.time_stamp = unpacker.GetInt("time_stamp");
            pubL_13_133_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_13_133_InfoList.Add((pubL_13_133_Info)info);
        }
        #endregion

        //逻辑_公共_期货基础数据_期货合约列表查询
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_13_133_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.contrc_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR);
                    info.contrc_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_NAME_STR);
                    info.pinyin_short = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PINYIN_SHORT_STR);
                    info.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    info.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    info.par_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_FLOAT);
                    info.contrc_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_UNIT_INT);
                    info.report_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_UNIT_INT);
                    info.min_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MIN_UNIT_INT);
                    info.max_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_QTY_FLOAT);
                    info.min_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_QTY_FLOAT);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.exch_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR);
                    info.capit_reback_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CAPIT_REBACK_DAYS_INT);
                    info.posi_reback_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_POSI_REBACK_DAYS_INT);
                    info.fee_set = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FEE_SET_STR);
                    info.is_order_dir_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_ORDER_DIR_FLAG_INT);
                    info.valid_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_VALID_FLAG_INT);
                    info.contrc_limit_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_LIMIT_FLAG_INT);
                    info.margin_pref = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MARGIN_PREF_INT);
                    info.posi_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_POSI_TYPE_INT);
                    info.deli_year = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DELI_YEAR_INT);
                    info.deli_month = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DELI_MONTH_INT);
                    info.begin_trade_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TRADE_DATE_INT);
                    info.expire_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXPIRE_DATE_INT);
                    info.begin_deli_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DELI_DATE_INT);
                    info.end_deli_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DELI_DATE_INT);
                    info.open_order_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_ORDER_TYPE_INT);
                    info.step_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STEP_PRICE_FLOAT);
                    info.hold_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HOLD_QTY_FLOAT);
                    info.main_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MAIN_FLAG_INT);
                    info.time_stamp = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT);
                    pubL_13_133_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_13_134_Response : IResponse
    {
        #region 构造函数
        public pubL_13_134_Response()
        {
            this.pubL_13_134_InfoList = new ObservableCollection<pubL_13_134_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_13_134_Info> pubL_13_134_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_13_134_Info info = new pubL_13_134_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.model_name = unpacker.GetStr("model_name");
            info.exch_no = unpacker.GetInt("exch_no");
            info.contrc_type = unpacker.GetInt("contrc_type");
            info.asset_type = unpacker.GetInt("asset_type");
            info.prefix_char = unpacker.GetStr("prefix_char");
            info.contrc_unit = unpacker.GetInt("contrc_unit");
            info.report_unit = unpacker.GetInt("report_unit");
            info.market_min_qty = unpacker.GetDouble("market_min_qty");
            info.market_max_qty = unpacker.GetDouble("market_max_qty");
            info.limit_min_qty = unpacker.GetDouble("limit_min_qty");
            info.limit_max_qty = unpacker.GetDouble("limit_max_qty");
            info.open_order_type = unpacker.GetInt("open_order_type");
            pubL_13_134_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_13_134_InfoList.Add((pubL_13_134_Info)info);
        }
        #endregion

        //逻辑_公共_期货基础数据_查询期货模板
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_13_134_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.model_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MODEL_NAME_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    info.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    info.prefix_char = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PREFIX_CHAR_STR);
                    info.contrc_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_UNIT_INT);
                    info.report_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_UNIT_INT);
                    info.market_min_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_MIN_QTY_FLOAT);
                    info.market_max_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_MAX_QTY_FLOAT);
                    info.limit_min_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LIMIT_MIN_QTY_FLOAT);
                    info.limit_max_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LIMIT_MAX_QTY_FLOAT);
                    info.open_order_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_ORDER_TYPE_INT);
                    pubL_13_134_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_13_141_Response : IResponse
    {
        #region 构造函数
        public pubL_13_141_Response()
        {
            this.pubL_13_141_InfoList = new ObservableCollection<pubL_13_141_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_13_141_Info> pubL_13_141_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_13_141_Info info = new pubL_13_141_Info();
            info.contrc_code_no = unpacker.GetInt("contrc_code_no");
            pubL_13_141_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_13_141_InfoList.Add((pubL_13_141_Info)info);
        }
        #endregion

        //逻辑_公共_期货基础数据_新增合约代码信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_13_141_Info();
                info.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                pubL_13_141_InfoList.Add(info);
            }
        }
    }

    public class pubL_13_142_Response : IResponse
    {
        #region 构造函数
        public pubL_13_142_Response()
        {
            this.pubL_13_142_InfoList = new ObservableCollection<pubL_13_142_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_13_142_Info> pubL_13_142_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_13_142_Info info = new pubL_13_142_Info();
            pubL_13_142_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_13_142_InfoList.Add((pubL_13_142_Info)info);
        }
        #endregion

        //逻辑_公共_期货基础数据_修改合约代码信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_13_142_Info();
                pubL_13_142_InfoList.Add(info);
            }
        }
    }

    public class pubL_13_144_Response : IResponse
    {
        #region 构造函数
        public pubL_13_144_Response()
        {
            this.pubL_13_144_InfoList = new ObservableCollection<pubL_13_144_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_13_144_Info> pubL_13_144_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_13_144_Info info = new pubL_13_144_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.contrc_code_no = unpacker.GetInt("contrc_code_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.contrc_code = unpacker.GetStr("contrc_code");
            info.contrc_name = unpacker.GetStr("contrc_name");
            info.pinyin_short = unpacker.GetStr("pinyin_short");
            info.contrc_type = unpacker.GetInt("contrc_type");
            info.asset_type = unpacker.GetInt("asset_type");
            info.par_value = unpacker.GetDouble("par_value");
            info.contrc_unit = unpacker.GetInt("contrc_unit");
            info.report_unit = unpacker.GetInt("report_unit");
            info.min_unit = unpacker.GetInt("min_unit");
            info.max_qty = unpacker.GetDouble("max_qty");
            info.min_qty = unpacker.GetDouble("min_qty");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.exch_crncy_type = unpacker.GetStr("exch_crncy_type");
            info.capit_reback_days = unpacker.GetInt("capit_reback_days");
            info.posi_reback_days = unpacker.GetInt("posi_reback_days");
            info.fee_set = unpacker.GetStr("fee_set");
            info.is_order_dir_flag = unpacker.GetInt("is_order_dir_flag");
            info.valid_flag = unpacker.GetInt("valid_flag");
            info.contrc_limit_flag = unpacker.GetInt("contrc_limit_flag");
            info.margin_pref = unpacker.GetInt("margin_pref");
            info.posi_type = unpacker.GetInt("posi_type");
            info.deli_year = unpacker.GetInt("deli_year");
            info.deli_month = unpacker.GetInt("deli_month");
            info.begin_trade_date = unpacker.GetInt("begin_trade_date");
            info.expire_date = unpacker.GetInt("expire_date");
            info.begin_deli_date = unpacker.GetInt("begin_deli_date");
            info.end_deli_date = unpacker.GetInt("end_deli_date");
            info.open_order_type = unpacker.GetInt("open_order_type");
            info.step_price = unpacker.GetDouble("step_price");
            info.hold_qty = unpacker.GetDouble("hold_qty");
            info.main_flag = unpacker.GetInt("main_flag");
            info.time_stamp = unpacker.GetInt("time_stamp");
            pubL_13_144_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_13_144_InfoList.Add((pubL_13_144_Info)info);
        }
        #endregion

        //逻辑_公共_期货基础数据_查询合约代码信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_13_144_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.contrc_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR);
                    info.contrc_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_NAME_STR);
                    info.pinyin_short = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PINYIN_SHORT_STR);
                    info.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    info.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    info.par_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_FLOAT);
                    info.contrc_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_UNIT_INT);
                    info.report_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_UNIT_INT);
                    info.min_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MIN_UNIT_INT);
                    info.max_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_QTY_FLOAT);
                    info.min_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_QTY_FLOAT);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.exch_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR);
                    info.capit_reback_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CAPIT_REBACK_DAYS_INT);
                    info.posi_reback_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_POSI_REBACK_DAYS_INT);
                    info.fee_set = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FEE_SET_STR);
                    info.is_order_dir_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_ORDER_DIR_FLAG_INT);
                    info.valid_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_VALID_FLAG_INT);
                    info.contrc_limit_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_LIMIT_FLAG_INT);
                    info.margin_pref = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MARGIN_PREF_INT);
                    info.posi_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_POSI_TYPE_INT);
                    info.deli_year = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DELI_YEAR_INT);
                    info.deli_month = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DELI_MONTH_INT);
                    info.begin_trade_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TRADE_DATE_INT);
                    info.expire_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXPIRE_DATE_INT);
                    info.begin_deli_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DELI_DATE_INT);
                    info.end_deli_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DELI_DATE_INT);
                    info.open_order_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_ORDER_TYPE_INT);
                    info.step_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STEP_PRICE_FLOAT);
                    info.hold_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HOLD_QTY_FLOAT);
                    info.main_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MAIN_FLAG_INT);
                    info.time_stamp = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT);
                    pubL_13_144_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_13_148_Response : IResponse
    {
        #region 构造函数
        public pubL_13_148_Response()
        {
            this.pubL_13_148_InfoList = new ObservableCollection<pubL_13_148_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_13_148_Info> pubL_13_148_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_13_148_Info info = new pubL_13_148_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.contrc_code_no = unpacker.GetInt("contrc_code_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.contrc_code = unpacker.GetStr("contrc_code");
            info.contrc_name = unpacker.GetStr("contrc_name");
            info.pinyin_short = unpacker.GetStr("pinyin_short");
            info.contrc_type = unpacker.GetInt("contrc_type");
            info.asset_type = unpacker.GetInt("asset_type");
            info.contrc_unit = unpacker.GetInt("contrc_unit");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.exch_crncy_type = unpacker.GetStr("exch_crncy_type");
            info.capit_reback_days = unpacker.GetInt("capit_reback_days");
            info.posi_reback_days = unpacker.GetInt("posi_reback_days");
            info.step_price = unpacker.GetDouble("step_price");
            info.main_flag = unpacker.GetInt("main_flag");
            info.time_stamp = unpacker.GetInt("time_stamp");
            pubL_13_148_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_13_148_InfoList.Add((pubL_13_148_Info)info);
        }
        #endregion

        //逻辑_公共_期货基础数据_查询客户端合约代码信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_13_148_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.contrc_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR);
                    info.contrc_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_NAME_STR);
                    info.pinyin_short = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PINYIN_SHORT_STR);
                    info.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    info.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    info.contrc_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_UNIT_INT);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.exch_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR);
                    info.capit_reback_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CAPIT_REBACK_DAYS_INT);
                    info.posi_reback_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_POSI_REBACK_DAYS_INT);
                    info.step_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STEP_PRICE_FLOAT);
                    info.main_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MAIN_FLAG_INT);
                    info.time_stamp = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT);
                    pubL_13_148_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_13_145_Response : IResponse
    {
        #region 构造函数
        public pubL_13_145_Response()
        {
            this.pubL_13_145_InfoList = new ObservableCollection<pubL_13_145_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_13_145_Info> pubL_13_145_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_13_145_Info info = new pubL_13_145_Info();
            info.contrc_code_no = unpacker.GetInt("contrc_code_no");
            info.contrc_name = unpacker.GetStr("contrc_name");
            info.pinyin_short = unpacker.GetStr("pinyin_short");
            info.contrc_type = unpacker.GetInt("contrc_type");
            info.asset_type = unpacker.GetInt("asset_type");
            info.par_value = unpacker.GetDouble("par_value");
            info.contrc_unit = unpacker.GetInt("contrc_unit");
            info.report_unit = unpacker.GetInt("report_unit");
            info.min_unit = unpacker.GetInt("min_unit");
            info.max_qty = unpacker.GetDouble("max_qty");
            info.min_qty = unpacker.GetDouble("min_qty");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.exch_crncy_type = unpacker.GetStr("exch_crncy_type");
            info.capit_reback_days = unpacker.GetInt("capit_reback_days");
            info.posi_reback_days = unpacker.GetInt("posi_reback_days");
            info.fee_set = unpacker.GetStr("fee_set");
            info.is_order_dir_flag = unpacker.GetInt("is_order_dir_flag");
            info.valid_flag = unpacker.GetInt("valid_flag");
            info.contrc_limit_flag = unpacker.GetInt("contrc_limit_flag");
            info.margin_pref = unpacker.GetInt("margin_pref");
            info.posi_type = unpacker.GetInt("posi_type");
            info.deli_year = unpacker.GetInt("deli_year");
            info.deli_month = unpacker.GetInt("deli_month");
            info.begin_trade_date = unpacker.GetInt("begin_trade_date");
            info.expire_date = unpacker.GetInt("expire_date");
            info.begin_deli_date = unpacker.GetInt("begin_deli_date");
            info.end_deli_date = unpacker.GetInt("end_deli_date");
            info.open_order_type = unpacker.GetInt("open_order_type");
            info.step_price = unpacker.GetDouble("step_price");
            info.hold_qty = unpacker.GetDouble("hold_qty");
            info.main_flag = unpacker.GetInt("main_flag");
            info.time_stamp = unpacker.GetInt("time_stamp");
            pubL_13_145_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_13_145_InfoList.Add((pubL_13_145_Info)info);
        }
        #endregion

        //逻辑_公共_期货基础数据_获取合约代码信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_13_145_Info();
                info.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                info.contrc_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_NAME_STR);
                info.pinyin_short = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PINYIN_SHORT_STR);
                info.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                info.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                info.par_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_FLOAT);
                info.contrc_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_UNIT_INT);
                info.report_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_UNIT_INT);
                info.min_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MIN_UNIT_INT);
                info.max_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_QTY_FLOAT);
                info.min_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_QTY_FLOAT);
                info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                info.exch_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR);
                info.capit_reback_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CAPIT_REBACK_DAYS_INT);
                info.posi_reback_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_POSI_REBACK_DAYS_INT);
                info.fee_set = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FEE_SET_STR);
                info.is_order_dir_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_ORDER_DIR_FLAG_INT);
                info.valid_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_VALID_FLAG_INT);
                info.contrc_limit_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_LIMIT_FLAG_INT);
                info.margin_pref = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MARGIN_PREF_INT);
                info.posi_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_POSI_TYPE_INT);
                info.deli_year = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DELI_YEAR_INT);
                info.deli_month = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DELI_MONTH_INT);
                info.begin_trade_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TRADE_DATE_INT);
                info.expire_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXPIRE_DATE_INT);
                info.begin_deli_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DELI_DATE_INT);
                info.end_deli_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DELI_DATE_INT);
                info.open_order_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_ORDER_TYPE_INT);
                info.step_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STEP_PRICE_FLOAT);
                info.hold_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HOLD_QTY_FLOAT);
                info.main_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MAIN_FLAG_INT);
                info.time_stamp = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT);
                pubL_13_145_InfoList.Add(info);
            }
        }
    }

    public class pubL_13_146_Response : IResponse
    {
        #region 构造函数
        public pubL_13_146_Response()
        {
            this.pubL_13_146_InfoList = new ObservableCollection<pubL_13_146_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_13_146_Info> pubL_13_146_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_13_146_Info info = new pubL_13_146_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.opor_co_no = unpacker.GetInt("opor_co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.oper_mac = unpacker.GetStr("oper_mac");
            info.oper_ip_addr = unpacker.GetStr("oper_ip_addr");
            info.oper_info = unpacker.GetStr("oper_info");
            info.oper_way = unpacker.GetStr("oper_way");
            info.oper_menu_no = unpacker.GetInt("oper_menu_no");
            info.oper_func_code = unpacker.GetStr("oper_func_code");
            info.init_date = unpacker.GetInt("init_date");
            info.contrc_code_no = unpacker.GetInt("contrc_code_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.contrc_code = unpacker.GetStr("contrc_code");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pubL_13_146_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_13_146_InfoList.Add((pubL_13_146_Info)info);
        }
        #endregion

        //逻辑_公共_期货基础数据_查询合约代码信息流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_13_146_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    info.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    info.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    info.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    info.oper_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MENU_NO_INT);
                    info.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.contrc_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pubL_13_146_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_13_147_Response : IResponse
    {
        #region 构造函数
        public pubL_13_147_Response()
        {
            this.pubL_13_147_InfoList = new ObservableCollection<pubL_13_147_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_13_147_Info> pubL_13_147_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_13_147_Info info = new pubL_13_147_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.opor_co_no = unpacker.GetInt("opor_co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.oper_mac = unpacker.GetStr("oper_mac");
            info.oper_ip_addr = unpacker.GetStr("oper_ip_addr");
            info.oper_info = unpacker.GetStr("oper_info");
            info.oper_way = unpacker.GetStr("oper_way");
            info.oper_menu_no = unpacker.GetInt("oper_menu_no");
            info.oper_func_code = unpacker.GetStr("oper_func_code");
            info.init_date = unpacker.GetInt("init_date");
            info.contrc_code_no = unpacker.GetInt("contrc_code_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.contrc_code = unpacker.GetStr("contrc_code");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pubL_13_147_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_13_147_InfoList.Add((pubL_13_147_Info)info);
        }
        #endregion

        //逻辑_公共_期货基础数据_查询历史合约代码信息流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_13_147_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    info.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    info.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    info.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    info.oper_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MENU_NO_INT);
                    info.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.contrc_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pubL_13_147_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_13_149_Response : IResponse
    {
        #region 构造函数
        public pubL_13_149_Response()
        {
            this.pubL_13_149_InfoList = new ObservableCollection<pubL_13_149_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_13_149_Info> pubL_13_149_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_13_149_Info info = new pubL_13_149_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.contrc_code_no = unpacker.GetInt("contrc_code_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.contrc_code = unpacker.GetStr("contrc_code");
            info.contrc_name = unpacker.GetStr("contrc_name");
            info.contrc_type = unpacker.GetInt("contrc_type");
            info.asset_type = unpacker.GetInt("asset_type");
            pubL_13_149_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_13_149_InfoList.Add((pubL_13_149_Info)info);
        }
        #endregion

        //逻辑_公共_期货基础数据_查询合约代码列表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_13_149_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.contrc_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR);
                    info.contrc_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_NAME_STR);
                    info.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    info.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    pubL_13_149_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_13_151_Response : IResponse
    {
        #region 构造函数
        public pubL_13_151_Response()
        {
            this.pubL_13_151_InfoList = new ObservableCollection<pubL_13_151_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_13_151_Info> pubL_13_151_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_13_151_Info info = new pubL_13_151_Info();
            pubL_13_151_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_13_151_InfoList.Add((pubL_13_151_Info)info);
        }
        #endregion

        //逻辑_公共_期货基础数据_新增合约代码订单方向
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_13_151_Info();
                pubL_13_151_InfoList.Add(info);
            }
        }
    }

    public class pubL_13_152_Response : IResponse
    {
        #region 构造函数
        public pubL_13_152_Response()
        {
            this.pubL_13_152_InfoList = new ObservableCollection<pubL_13_152_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_13_152_Info> pubL_13_152_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_13_152_Info info = new pubL_13_152_Info();
            pubL_13_152_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_13_152_InfoList.Add((pubL_13_152_Info)info);
        }
        #endregion

        //逻辑_公共_期货基础数据_修改合约代码订单方向
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_13_152_Info();
                pubL_13_152_InfoList.Add(info);
            }
        }
    }

    public class pubL_13_153_Response : IResponse
    {
        #region 构造函数
        public pubL_13_153_Response()
        {
            this.pubL_13_153_InfoList = new ObservableCollection<pubL_13_153_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_13_153_Info> pubL_13_153_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_13_153_Info info = new pubL_13_153_Info();
            pubL_13_153_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_13_153_InfoList.Add((pubL_13_153_Info)info);
        }
        #endregion

        //逻辑_公共_期货基础数据_删除合约代码订单方向
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_13_153_Info();
                pubL_13_153_InfoList.Add(info);
            }
        }
    }

    public class pubL_13_154_Response : IResponse
    {
        #region 构造函数
        public pubL_13_154_Response()
        {
            this.pubL_13_154_InfoList = new ObservableCollection<pubL_13_154_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_13_154_Info> pubL_13_154_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_13_154_Info info = new pubL_13_154_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.contrc_code_no = unpacker.GetInt("contrc_code_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.order_dir = unpacker.GetInt("order_dir");
            info.cash_frozen_type = unpacker.GetInt("cash_frozen_type");
            info.order_split_flag = unpacker.GetInt("order_split_flag");
            info.min_unit = unpacker.GetInt("min_unit");
            info.min_qty = unpacker.GetDouble("min_qty");
            info.max_qty = unpacker.GetDouble("max_qty");
            info.time_stamp = unpacker.GetInt("time_stamp");
            pubL_13_154_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_13_154_InfoList.Add((pubL_13_154_Info)info);
        }
        #endregion

        //逻辑_公共_期货基础数据_查询合约代码订单方向
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_13_154_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.cash_frozen_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CASH_FROZEN_TYPE_INT);
                    info.order_split_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_SPLIT_FLAG_INT);
                    info.min_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MIN_UNIT_INT);
                    info.min_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_QTY_FLOAT);
                    info.max_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_QTY_FLOAT);
                    info.time_stamp = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT);
                    pubL_13_154_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_13_155_Response : IResponse
    {
        #region 构造函数
        public pubL_13_155_Response()
        {
            this.pubL_13_155_InfoList = new ObservableCollection<pubL_13_155_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_13_155_Info> pubL_13_155_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_13_155_Info info = new pubL_13_155_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.opor_co_no = unpacker.GetInt("opor_co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.oper_mac = unpacker.GetStr("oper_mac");
            info.oper_ip_addr = unpacker.GetStr("oper_ip_addr");
            info.oper_info = unpacker.GetStr("oper_info");
            info.oper_way = unpacker.GetStr("oper_way");
            info.oper_menu_no = unpacker.GetInt("oper_menu_no");
            info.oper_func_code = unpacker.GetStr("oper_func_code");
            info.init_date = unpacker.GetInt("init_date");
            info.contrc_code_no = unpacker.GetInt("contrc_code_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.order_dir = unpacker.GetInt("order_dir");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pubL_13_155_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_13_155_InfoList.Add((pubL_13_155_Info)info);
        }
        #endregion

        //逻辑_公共_期货基础数据_查询合约代码订单方向流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_13_155_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    info.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    info.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    info.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    info.oper_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MENU_NO_INT);
                    info.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pubL_13_155_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_13_156_Response : IResponse
    {
        #region 构造函数
        public pubL_13_156_Response()
        {
            this.pubL_13_156_InfoList = new ObservableCollection<pubL_13_156_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_13_156_Info> pubL_13_156_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_13_156_Info info = new pubL_13_156_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.opor_co_no = unpacker.GetInt("opor_co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.oper_mac = unpacker.GetStr("oper_mac");
            info.oper_ip_addr = unpacker.GetStr("oper_ip_addr");
            info.oper_info = unpacker.GetStr("oper_info");
            info.oper_way = unpacker.GetStr("oper_way");
            info.oper_menu_no = unpacker.GetInt("oper_menu_no");
            info.oper_func_code = unpacker.GetStr("oper_func_code");
            info.init_date = unpacker.GetInt("init_date");
            info.contrc_code_no = unpacker.GetInt("contrc_code_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.order_dir = unpacker.GetInt("order_dir");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pubL_13_156_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_13_156_InfoList.Add((pubL_13_156_Info)info);
        }
        #endregion

        //逻辑_公共_期货基础数据_查询历史合约代码订单方向流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_13_156_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    info.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    info.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    info.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    info.oper_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MENU_NO_INT);
                    info.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pubL_13_156_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_13_157_Response : IResponse
    {
        #region 构造函数
        public pubL_13_157_Response()
        {
            this.pubL_13_157_InfoList = new ObservableCollection<pubL_13_157_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_13_157_Info> pubL_13_157_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_13_157_Info info = new pubL_13_157_Info();
            pubL_13_157_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_13_157_InfoList.Add((pubL_13_157_Info)info);
        }
        #endregion

        //逻辑_公共_期货基础数据_增加合约交割参数记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_13_157_Info();
                pubL_13_157_InfoList.Add(info);
            }
        }
    }

    public class pubL_13_158_Response : IResponse
    {
        #region 构造函数
        public pubL_13_158_Response()
        {
            this.pubL_13_158_InfoList = new ObservableCollection<pubL_13_158_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_13_158_Info> pubL_13_158_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_13_158_Info info = new pubL_13_158_Info();
            pubL_13_158_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_13_158_InfoList.Add((pubL_13_158_Info)info);
        }
        #endregion

        //逻辑_公共_期货基础数据_修改合约交割参数记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_13_158_Info();
                pubL_13_158_InfoList.Add(info);
            }
        }
    }

    public class pubL_13_159_Response : IResponse
    {
        #region 构造函数
        public pubL_13_159_Response()
        {
            this.pubL_13_159_InfoList = new ObservableCollection<pubL_13_159_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_13_159_Info> pubL_13_159_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_13_159_Info info = new pubL_13_159_Info();
            pubL_13_159_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_13_159_InfoList.Add((pubL_13_159_Info)info);
        }
        #endregion

        //逻辑_公共_期货基础数据_删除合约交割参数记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_13_159_Info();
                pubL_13_159_InfoList.Add(info);
            }
        }
    }

    public class pubL_13_160_Response : IResponse
    {
        #region 构造函数
        public pubL_13_160_Response()
        {
            this.pubL_13_160_InfoList = new ObservableCollection<pubL_13_160_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_13_160_Info> pubL_13_160_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_13_160_Info info = new pubL_13_160_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.exch_no = unpacker.GetInt("exch_no");
            info.contrc_code_no = unpacker.GetInt("contrc_code_no");
            info.deli_price = unpacker.GetDouble("deli_price");
            pubL_13_160_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_13_160_InfoList.Add((pubL_13_160_Info)info);
        }
        #endregion

        //逻辑_公共_期货基础数据_查询合约交割参数记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_13_160_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    info.deli_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DELI_PRICE_FLOAT);
                    pubL_13_160_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_13_161_Response : IResponse
    {
        #region 构造函数
        public pubL_13_161_Response()
        {
            this.pubL_13_161_InfoList = new ObservableCollection<pubL_13_161_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_13_161_Info> pubL_13_161_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_13_161_Info info = new pubL_13_161_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.exch_no = unpacker.GetInt("exch_no");
            info.comb_code = unpacker.GetStr("comb_code");
            info.comb_name = unpacker.GetStr("comb_name");
            info.comb_type = unpacker.GetInt("comb_type");
            info.pref_type = unpacker.GetInt("pref_type");
            info.partic_code = unpacker.GetStr("partic_code");
            info.margin_ratio = unpacker.GetDouble("margin_ratio");
            info.prior_type = unpacker.GetInt("prior_type");
            info.trade_pref = unpacker.GetInt("trade_pref");
            info.sett_pref = unpacker.GetInt("sett_pref");
            pubL_13_161_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_13_161_InfoList.Add((pubL_13_161_Info)info);
        }
        #endregion

        //逻辑_公共_期货基础数据_查询组合保证金参数
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_13_161_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.comb_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMB_CODE_STR);
                    info.comb_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMB_NAME_STR);
                    info.comb_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMB_TYPE_INT);
                    info.pref_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PREF_TYPE_INT);
                    info.partic_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PARTIC_CODE_STR);
                    info.margin_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARGIN_RATIO_FLOAT);
                    info.prior_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRIOR_TYPE_INT);
                    info.trade_pref = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_PREF_INT);
                    info.sett_pref = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SETT_PREF_INT);
                    pubL_13_161_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_13_170_Response : IResponse
    {
        #region 构造函数
        public pubL_13_170_Response()
        {
            this.pubL_13_170_InfoList = new ObservableCollection<pubL_13_170_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_13_170_Info> pubL_13_170_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_13_170_Info info = new pubL_13_170_Info();
            pubL_13_170_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_13_170_InfoList.Add((pubL_13_170_Info)info);
        }
        #endregion

        //逻辑_公共_期货基础数据_增加自选行情记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_13_170_Info();
                pubL_13_170_InfoList.Add(info);
            }
        }
    }

    public class pubL_13_171_Response : IResponse
    {
        #region 构造函数
        public pubL_13_171_Response()
        {
            this.pubL_13_171_InfoList = new ObservableCollection<pubL_13_171_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_13_171_Info> pubL_13_171_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_13_171_Info info = new pubL_13_171_Info();
            pubL_13_171_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_13_171_InfoList.Add((pubL_13_171_Info)info);
        }
        #endregion

        //逻辑_公共_期货基础数据_删除自选行情记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_13_171_Info();
                pubL_13_171_InfoList.Add(info);
            }
        }
    }

    public class pubL_13_172_Response : IResponse
    {
        #region 构造函数
        public pubL_13_172_Response()
        {
            this.pubL_13_172_InfoList = new ObservableCollection<pubL_13_172_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_13_172_Info> pubL_13_172_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_13_172_Info info = new pubL_13_172_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.contrc_code_no = unpacker.GetInt("contrc_code_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.contrc_code = unpacker.GetStr("contrc_code");
            info.contrc_name = unpacker.GetStr("contrc_name");
            info.contrc_type = unpacker.GetInt("contrc_type");
            pubL_13_172_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_13_172_InfoList.Add((pubL_13_172_Info)info);
        }
        #endregion

        //逻辑_公共_期货基础数据_查询自选行情记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_13_172_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.contrc_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR);
                    info.contrc_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_NAME_STR);
                    info.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    pubL_13_172_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_13_173_Response : IResponse
    {
        #region 构造函数
        public pubL_13_173_Response()
        {
            this.pubL_13_173_InfoList = new ObservableCollection<pubL_13_173_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_13_173_Info> pubL_13_173_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_13_173_Info info = new pubL_13_173_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.contrc_code_no = unpacker.GetInt("contrc_code_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.contrc_code = unpacker.GetStr("contrc_code");
            info.contrc_name = unpacker.GetStr("contrc_name");
            info.pre_close_price = unpacker.GetDouble("pre_close_price");
            info.sett_price = unpacker.GetDouble("sett_price");
            info.pre_settle_price = unpacker.GetDouble("pre_settle_price");
            info.today_close_price = unpacker.GetDouble("today_close_price");
            info.hold_qty = unpacker.GetDouble("hold_qty");
            info.pre_hold_qty = unpacker.GetDouble("pre_hold_qty");
            info.last_price = unpacker.GetDouble("last_price");
            info.today_open_price = unpacker.GetDouble("today_open_price");
            info.max_buy_price = unpacker.GetDouble("max_buy_price");
            info.min_sale_price = unpacker.GetDouble("min_sale_price");
            info.total_buy_qty = unpacker.GetDouble("total_buy_qty");
            info.total_sale_qty = unpacker.GetDouble("total_sale_qty");
            info.up_limit_price = unpacker.GetDouble("up_limit_price");
            info.down_limit_price = unpacker.GetDouble("down_limit_price");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.buy_price_1 = unpacker.GetDouble("buy_price_1");
            info.buy_qty_1 = unpacker.GetDouble("buy_qty_1");
            info.buy_price_2 = unpacker.GetDouble("buy_price_2");
            info.buy_qty_2 = unpacker.GetDouble("buy_qty_2");
            info.buy_price_3 = unpacker.GetDouble("buy_price_3");
            info.buy_qty_3 = unpacker.GetDouble("buy_qty_3");
            info.buy_price_4 = unpacker.GetDouble("buy_price_4");
            info.buy_qty_4 = unpacker.GetDouble("buy_qty_4");
            info.buy_price_5 = unpacker.GetDouble("buy_price_5");
            info.buy_qty_5 = unpacker.GetDouble("buy_qty_5");
            info.sell_price_1 = unpacker.GetDouble("sell_price_1");
            info.sell_qty_1 = unpacker.GetDouble("sell_qty_1");
            info.sell_price_2 = unpacker.GetDouble("sell_price_2");
            info.sell_qty_2 = unpacker.GetDouble("sell_qty_2");
            info.sell_price_3 = unpacker.GetDouble("sell_price_3");
            info.sell_qty_3 = unpacker.GetDouble("sell_qty_3");
            info.sell_price_4 = unpacker.GetDouble("sell_price_4");
            info.sell_qty_4 = unpacker.GetDouble("sell_qty_4");
            info.sell_price_5 = unpacker.GetDouble("sell_price_5");
            info.sell_qty_5 = unpacker.GetDouble("sell_qty_5");
            info.contrc_type = unpacker.GetInt("contrc_type");
            info.asset_type = unpacker.GetInt("asset_type");
            info.time_stamp = unpacker.GetInt("time_stamp");
            info.update_times = unpacker.GetInt("update_times");
            pubL_13_173_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_13_173_InfoList.Add((pubL_13_173_Info)info);
        }
        #endregion

        //逻辑_公共_期货基础数据_查询期货行情
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_13_173_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.contrc_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR);
                    info.contrc_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_NAME_STR);
                    info.pre_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_CLOSE_PRICE_FLOAT);
                    info.sett_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SETT_PRICE_FLOAT);
                    info.pre_settle_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SETTLE_PRICE_FLOAT);
                    info.today_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_CLOSE_PRICE_FLOAT);
                    info.hold_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HOLD_QTY_FLOAT);
                    info.pre_hold_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_HOLD_QTY_FLOAT);
                    info.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    info.today_open_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_OPEN_PRICE_FLOAT);
                    info.max_buy_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_BUY_PRICE_FLOAT);
                    info.min_sale_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_SALE_PRICE_FLOAT);
                    info.total_buy_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_BUY_QTY_FLOAT);
                    info.total_sale_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_SALE_QTY_FLOAT);
                    info.up_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UP_LIMIT_PRICE_FLOAT);
                    info.down_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DOWN_LIMIT_PRICE_FLOAT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    info.buy_price_1 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_PRICE_1_FLOAT);
                    info.buy_qty_1 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_QTY_1_FLOAT);
                    info.buy_price_2 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_PRICE_2_FLOAT);
                    info.buy_qty_2 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_QTY_2_FLOAT);
                    info.buy_price_3 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_PRICE_3_FLOAT);
                    info.buy_qty_3 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_QTY_3_FLOAT);
                    info.buy_price_4 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_PRICE_4_FLOAT);
                    info.buy_qty_4 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_QTY_4_FLOAT);
                    info.buy_price_5 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_PRICE_5_FLOAT);
                    info.buy_qty_5 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_QTY_5_FLOAT);
                    info.sell_price_1 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_PRICE_1_FLOAT);
                    info.sell_qty_1 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_QTY_1_FLOAT);
                    info.sell_price_2 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_PRICE_2_FLOAT);
                    info.sell_qty_2 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_QTY_2_FLOAT);
                    info.sell_price_3 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_PRICE_3_FLOAT);
                    info.sell_qty_3 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_QTY_3_FLOAT);
                    info.sell_price_4 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_PRICE_4_FLOAT);
                    info.sell_qty_4 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_QTY_4_FLOAT);
                    info.sell_price_5 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_PRICE_5_FLOAT);
                    info.sell_qty_5 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_QTY_5_FLOAT);
                    info.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    info.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    info.time_stamp = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    pubL_13_173_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_13_174_Response : IResponse
    {
        #region 构造函数
        public pubL_13_174_Response()
        {
            this.pubL_13_174_InfoList = new ObservableCollection<pubL_13_174_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_13_174_Info> pubL_13_174_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_13_174_Info info = new pubL_13_174_Info();
            pubL_13_174_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_13_174_InfoList.Add((pubL_13_174_Info)info);
        }
        #endregion

        //逻辑_公共_期货基础数据_更新期货行情结算价
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_13_174_Info();
                pubL_13_174_InfoList.Add(info);
            }
        }
    }

}
