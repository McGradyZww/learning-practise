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
    public class pubL_1_6_Response : IResponse
    {
        #region 构造函数
        public pubL_1_6_Response()
        {
            this.pubL_1_6_InfoList = new ObservableCollection<pubL_1_6_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_6_Info> pubL_1_6_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_6_Info info = new pubL_1_6_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.model_name = unpacker.GetStr("model_name");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code_feature = unpacker.GetStr("stock_code_feature");
            info.stock_name_feature = unpacker.GetStr("stock_name_feature");
            info.stock_type = unpacker.GetInt("stock_type");
            pubL_1_6_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_6_InfoList.Add((pubL_1_6_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_查询证券模板
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_1_6_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.model_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MODEL_NAME_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code_feature = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_FEATURE_STR);
                    info.stock_name_feature = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_FEATURE_STR);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    pubL_1_6_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_1_12_Response : IResponse
    {
        #region 构造函数
        public pubL_1_12_Response()
        {
            this.pubL_1_12_InfoList = new ObservableCollection<pubL_1_12_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_12_Info> pubL_1_12_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_12_Info info = new pubL_1_12_Info();
            pubL_1_12_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_12_InfoList.Add((pubL_1_12_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_修改证券类型
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_1_12_Info();
                pubL_1_12_InfoList.Add(info);
            }
        }
    }

    public class pubL_1_14_Response : IResponse
    {
        #region 构造函数
        public pubL_1_14_Response()
        {
            this.pubL_1_14_InfoList = new ObservableCollection<pubL_1_14_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_14_Info> pubL_1_14_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_14_Info info = new pubL_1_14_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_type = unpacker.GetInt("stock_type");
            info.stock_type_name = unpacker.GetStr("stock_type_name");
            info.asset_type = unpacker.GetInt("asset_type");
            info.par_value = unpacker.GetDouble("par_value");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.exch_crncy_type = unpacker.GetStr("exch_crncy_type");
            info.capit_reback_days = unpacker.GetInt("capit_reback_days");
            info.posi_reback_days = unpacker.GetInt("posi_reback_days");
            info.type_unit = unpacker.GetInt("type_unit");
            info.report_unit = unpacker.GetInt("report_unit");
            info.min_unit = unpacker.GetInt("min_unit");
            info.max_qty = unpacker.GetDouble("max_qty");
            info.min_qty = unpacker.GetDouble("min_qty");
            info.is_order_dir_flag = unpacker.GetInt("is_order_dir_flag");
            info.time_stamp = unpacker.GetInt("time_stamp");
            pubL_1_14_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_14_InfoList.Add((pubL_1_14_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_查询证券类型
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_1_14_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.stock_type_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_NAME_STR);
                    info.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    info.par_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_FLOAT);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.exch_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR);
                    info.capit_reback_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CAPIT_REBACK_DAYS_INT);
                    info.posi_reback_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_POSI_REBACK_DAYS_INT);
                    info.type_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TYPE_UNIT_INT);
                    info.report_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_UNIT_INT);
                    info.min_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MIN_UNIT_INT);
                    info.max_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_QTY_FLOAT);
                    info.min_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_QTY_FLOAT);
                    info.is_order_dir_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_ORDER_DIR_FLAG_INT);
                    info.time_stamp = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT);
                    pubL_1_14_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_1_15_Response : IResponse
    {
        #region 构造函数
        public pubL_1_15_Response()
        {
            this.pubL_1_15_InfoList = new ObservableCollection<pubL_1_15_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_15_Info> pubL_1_15_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_15_Info info = new pubL_1_15_Info();
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
            info.stock_type = unpacker.GetInt("stock_type");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pubL_1_15_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_15_InfoList.Add((pubL_1_15_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_查询证券类型流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_1_15_Info();
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
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pubL_1_15_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_1_16_Response : IResponse
    {
        #region 构造函数
        public pubL_1_16_Response()
        {
            this.pubL_1_16_InfoList = new ObservableCollection<pubL_1_16_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_16_Info> pubL_1_16_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_16_Info info = new pubL_1_16_Info();
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
            info.stock_type = unpacker.GetInt("stock_type");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pubL_1_16_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_16_InfoList.Add((pubL_1_16_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_查询历史证券类型流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_1_16_Info();
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
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pubL_1_16_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_1_24_Response : IResponse
    {
        #region 构造函数
        public pubL_1_24_Response()
        {
            this.pubL_1_24_InfoList = new ObservableCollection<pubL_1_24_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_24_Info> pubL_1_24_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_24_Info info = new pubL_1_24_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_type = unpacker.GetInt("stock_type");
            info.order_dir = unpacker.GetInt("order_dir");
            info.cash_frozen_type = unpacker.GetInt("cash_frozen_type");
            info.order_split_flag = unpacker.GetInt("order_split_flag");
            info.min_unit = unpacker.GetInt("min_unit");
            info.min_qty = unpacker.GetDouble("min_qty");
            info.max_qty = unpacker.GetDouble("max_qty");
            info.time_stamp = unpacker.GetInt("time_stamp");
            pubL_1_24_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_24_InfoList.Add((pubL_1_24_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_查询证券类型订单方向
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_1_24_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.cash_frozen_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CASH_FROZEN_TYPE_INT);
                    info.order_split_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_SPLIT_FLAG_INT);
                    info.min_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MIN_UNIT_INT);
                    info.min_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_QTY_FLOAT);
                    info.max_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_QTY_FLOAT);
                    info.time_stamp = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT);
                    pubL_1_24_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_1_41_Response : IResponse
    {
        #region 构造函数
        public pubL_1_41_Response()
        {
            this.pubL_1_41_InfoList = new ObservableCollection<pubL_1_41_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_41_Info> pubL_1_41_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_41_Info info = new pubL_1_41_Info();
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            pubL_1_41_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_41_InfoList.Add((pubL_1_41_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_新增证券代码信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_1_41_Info();
                info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                pubL_1_41_InfoList.Add(info);
            }
        }
    }

    public class pubL_1_42_Response : IResponse
    {
        #region 构造函数
        public pubL_1_42_Response()
        {
            this.pubL_1_42_InfoList = new ObservableCollection<pubL_1_42_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_42_Info> pubL_1_42_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_42_Info info = new pubL_1_42_Info();
            pubL_1_42_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_42_InfoList.Add((pubL_1_42_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_修改证券代码信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_1_42_Info();
                pubL_1_42_InfoList.Add(info);
            }
        }
    }

    public class pubL_1_43_Response : IResponse
    {
        #region 构造函数
        public pubL_1_43_Response()
        {
            this.pubL_1_43_InfoList = new ObservableCollection<pubL_1_43_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_43_Info> pubL_1_43_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_43_Info info = new pubL_1_43_Info();
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_name = unpacker.GetStr("stock_name");
            info.pinyin_short = unpacker.GetStr("pinyin_short");
            pubL_1_43_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_43_InfoList.Add((pubL_1_43_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_查询证券信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_1_43_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    info.pinyin_short = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PINYIN_SHORT_STR);
                    pubL_1_43_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_1_44_Response : IResponse
    {
        #region 构造函数
        public pubL_1_44_Response()
        {
            this.pubL_1_44_InfoList = new ObservableCollection<pubL_1_44_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_44_Info> pubL_1_44_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_44_Info info = new pubL_1_44_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_name = unpacker.GetStr("stock_name");
            info.pinyin_short = unpacker.GetStr("pinyin_short");
            info.stock_type = unpacker.GetInt("stock_type");
            info.asset_type = unpacker.GetInt("asset_type");
            info.par_value = unpacker.GetDouble("par_value");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.exch_crncy_type = unpacker.GetStr("exch_crncy_type");
            info.total_stock_issue = unpacker.GetDouble("total_stock_issue");
            info.circl_stock_capit = unpacker.GetDouble("circl_stock_capit");
            info.capit_reback_days = unpacker.GetInt("capit_reback_days");
            info.posi_reback_days = unpacker.GetInt("posi_reback_days");
            info.type_unit = unpacker.GetInt("type_unit");
            info.report_unit = unpacker.GetInt("report_unit");
            info.min_unit = unpacker.GetInt("min_unit");
            info.max_qty = unpacker.GetDouble("max_qty");
            info.min_qty = unpacker.GetDouble("min_qty");
            info.is_order_dir_flag = unpacker.GetInt("is_order_dir_flag");
            info.price_up = unpacker.GetDouble("price_up");
            info.price_down = unpacker.GetDouble("price_down");
            info.step_price = unpacker.GetDouble("step_price");
            info.fair_price = unpacker.GetDouble("fair_price");
            info.stop_status = unpacker.GetStr("stop_status");
            info.hk_stock_flag = unpacker.GetInt("hk_stock_flag");
            info.time_stamp = unpacker.GetInt("time_stamp");
            pubL_1_44_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_44_InfoList.Add((pubL_1_44_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_查询证券代码信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_1_44_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    info.pinyin_short = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PINYIN_SHORT_STR);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    info.par_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_FLOAT);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.exch_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR);
                    info.total_stock_issue = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_STOCK_ISSUE_FLOAT);
                    info.circl_stock_capit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CIRCL_STOCK_CAPIT_FLOAT);
                    info.capit_reback_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CAPIT_REBACK_DAYS_INT);
                    info.posi_reback_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_POSI_REBACK_DAYS_INT);
                    info.type_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TYPE_UNIT_INT);
                    info.report_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_UNIT_INT);
                    info.min_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MIN_UNIT_INT);
                    info.max_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_QTY_FLOAT);
                    info.min_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_QTY_FLOAT);
                    info.is_order_dir_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_ORDER_DIR_FLAG_INT);
                    info.price_up = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_UP_FLOAT);
                    info.price_down = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_DOWN_FLOAT);
                    info.step_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STEP_PRICE_FLOAT);
                    info.fair_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FAIR_PRICE_FLOAT);
                    info.stop_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOP_STATUS_STR);
                    info.hk_stock_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HK_STOCK_FLAG_INT);
                    info.time_stamp = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT);
                    pubL_1_44_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_1_45_Response : IResponse
    {
        #region 构造函数
        public pubL_1_45_Response()
        {
            this.pubL_1_45_InfoList = new ObservableCollection<pubL_1_45_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_45_Info> pubL_1_45_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_45_Info info = new pubL_1_45_Info();
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
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pubL_1_45_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_45_InfoList.Add((pubL_1_45_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_查询证券代码信息流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_1_45_Info();
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
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pubL_1_45_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_1_46_Response : IResponse
    {
        #region 构造函数
        public pubL_1_46_Response()
        {
            this.pubL_1_46_InfoList = new ObservableCollection<pubL_1_46_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_46_Info> pubL_1_46_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_46_Info info = new pubL_1_46_Info();
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
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pubL_1_46_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_46_InfoList.Add((pubL_1_46_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_查询历史证券代码信息流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_1_46_Info();
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
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pubL_1_46_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_1_47_Response : IResponse
    {
        #region 构造函数
        public pubL_1_47_Response()
        {
            this.pubL_1_47_InfoList = new ObservableCollection<pubL_1_47_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_47_Info> pubL_1_47_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_47_Info info = new pubL_1_47_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_name = unpacker.GetStr("stock_name");
            info.stock_type = unpacker.GetInt("stock_type");
            info.asset_type = unpacker.GetInt("asset_type");
            info.hk_stock_flag = unpacker.GetInt("hk_stock_flag");
            pubL_1_47_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_47_InfoList.Add((pubL_1_47_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_查询证券代码列表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_1_47_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    info.hk_stock_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HK_STOCK_FLAG_INT);
                    pubL_1_47_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_1_49_Response : IResponse
    {
        #region 构造函数
        public pubL_1_49_Response()
        {
            this.pubL_1_49_InfoList = new ObservableCollection<pubL_1_49_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_49_Info> pubL_1_49_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_49_Info info = new pubL_1_49_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_name = unpacker.GetStr("stock_name");
            info.pinyin_short = unpacker.GetStr("pinyin_short");
            info.stock_type = unpacker.GetInt("stock_type");
            info.asset_type = unpacker.GetInt("asset_type");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.capit_reback_days = unpacker.GetInt("capit_reback_days");
            info.posi_reback_days = unpacker.GetInt("posi_reback_days");
            info.min_unit = unpacker.GetInt("min_unit");
            info.max_qty = unpacker.GetDouble("max_qty");
            info.min_qty = unpacker.GetDouble("min_qty");
            info.step_price = unpacker.GetDouble("step_price");
            info.stop_status = unpacker.GetStr("stop_status");
            info.hk_stock_flag = unpacker.GetInt("hk_stock_flag");
            info.time_stamp = unpacker.GetInt("time_stamp");
            pubL_1_49_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_49_InfoList.Add((pubL_1_49_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_查询客户端证券代码信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_1_49_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    info.pinyin_short = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PINYIN_SHORT_STR);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.capit_reback_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CAPIT_REBACK_DAYS_INT);
                    info.posi_reback_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_POSI_REBACK_DAYS_INT);
                    info.min_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MIN_UNIT_INT);
                    info.max_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_QTY_FLOAT);
                    info.min_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_QTY_FLOAT);
                    info.step_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STEP_PRICE_FLOAT);
                    info.stop_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOP_STATUS_STR);
                    info.hk_stock_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HK_STOCK_FLAG_INT);
                    info.time_stamp = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT);
                    pubL_1_49_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_1_51_Response : IResponse
    {
        #region 构造函数
        public pubL_1_51_Response()
        {
            this.pubL_1_51_InfoList = new ObservableCollection<pubL_1_51_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_51_Info> pubL_1_51_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_51_Info info = new pubL_1_51_Info();
            pubL_1_51_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_51_InfoList.Add((pubL_1_51_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_新增证券代码订单方向
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_1_51_Info();
                pubL_1_51_InfoList.Add(info);
            }
        }
    }

    public class pubL_1_52_Response : IResponse
    {
        #region 构造函数
        public pubL_1_52_Response()
        {
            this.pubL_1_52_InfoList = new ObservableCollection<pubL_1_52_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_52_Info> pubL_1_52_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_52_Info info = new pubL_1_52_Info();
            pubL_1_52_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_52_InfoList.Add((pubL_1_52_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_修改证券代码订单方向
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_1_52_Info();
                pubL_1_52_InfoList.Add(info);
            }
        }
    }

    public class pubL_1_53_Response : IResponse
    {
        #region 构造函数
        public pubL_1_53_Response()
        {
            this.pubL_1_53_InfoList = new ObservableCollection<pubL_1_53_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_53_Info> pubL_1_53_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_53_Info info = new pubL_1_53_Info();
            pubL_1_53_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_53_InfoList.Add((pubL_1_53_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_删除证券代码订单方向
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_1_53_Info();
                pubL_1_53_InfoList.Add(info);
            }
        }
    }

    public class pubL_1_54_Response : IResponse
    {
        #region 构造函数
        public pubL_1_54_Response()
        {
            this.pubL_1_54_InfoList = new ObservableCollection<pubL_1_54_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_54_Info> pubL_1_54_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_54_Info info = new pubL_1_54_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.order_dir = unpacker.GetInt("order_dir");
            info.cash_frozen_type = unpacker.GetInt("cash_frozen_type");
            info.order_split_flag = unpacker.GetInt("order_split_flag");
            info.min_unit = unpacker.GetInt("min_unit");
            info.min_qty = unpacker.GetDouble("min_qty");
            info.max_qty = unpacker.GetDouble("max_qty");
            info.time_stamp = unpacker.GetInt("time_stamp");
            pubL_1_54_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_54_InfoList.Add((pubL_1_54_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_查询证券代码订单方向
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_1_54_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.cash_frozen_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CASH_FROZEN_TYPE_INT);
                    info.order_split_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_SPLIT_FLAG_INT);
                    info.min_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MIN_UNIT_INT);
                    info.min_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_QTY_FLOAT);
                    info.max_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_QTY_FLOAT);
                    info.time_stamp = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT);
                    pubL_1_54_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_1_55_Response : IResponse
    {
        #region 构造函数
        public pubL_1_55_Response()
        {
            this.pubL_1_55_InfoList = new ObservableCollection<pubL_1_55_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_55_Info> pubL_1_55_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_55_Info info = new pubL_1_55_Info();
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
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.order_dir = unpacker.GetInt("order_dir");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pubL_1_55_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_55_InfoList.Add((pubL_1_55_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_查询证券代码订单方向流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_1_55_Info();
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
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pubL_1_55_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_1_56_Response : IResponse
    {
        #region 构造函数
        public pubL_1_56_Response()
        {
            this.pubL_1_56_InfoList = new ObservableCollection<pubL_1_56_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_56_Info> pubL_1_56_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_56_Info info = new pubL_1_56_Info();
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
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.order_dir = unpacker.GetInt("order_dir");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pubL_1_56_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_56_InfoList.Add((pubL_1_56_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_查询历史证券代码订单方向流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_1_56_Info();
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
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pubL_1_56_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_1_61_Response : IResponse
    {
        #region 构造函数
        public pubL_1_61_Response()
        {
            this.pubL_1_61_InfoList = new ObservableCollection<pubL_1_61_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_61_Info> pubL_1_61_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_61_Info info = new pubL_1_61_Info();
            pubL_1_61_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_61_InfoList.Add((pubL_1_61_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_新增证券代码映射
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_1_61_Info();
                pubL_1_61_InfoList.Add(info);
            }
        }
    }

    public class pubL_1_62_Response : IResponse
    {
        #region 构造函数
        public pubL_1_62_Response()
        {
            this.pubL_1_62_InfoList = new ObservableCollection<pubL_1_62_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_62_Info> pubL_1_62_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_62_Info info = new pubL_1_62_Info();
            pubL_1_62_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_62_InfoList.Add((pubL_1_62_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_修改证券代码映射
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_1_62_Info();
                pubL_1_62_InfoList.Add(info);
            }
        }
    }

    public class pubL_1_63_Response : IResponse
    {
        #region 构造函数
        public pubL_1_63_Response()
        {
            this.pubL_1_63_InfoList = new ObservableCollection<pubL_1_63_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_63_Info> pubL_1_63_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_63_Info info = new pubL_1_63_Info();
            pubL_1_63_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_63_InfoList.Add((pubL_1_63_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_删除证券代码映射
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_1_63_Info();
                pubL_1_63_InfoList.Add(info);
            }
        }
    }

    public class pubL_1_64_Response : IResponse
    {
        #region 构造函数
        public pubL_1_64_Response()
        {
            this.pubL_1_64_InfoList = new ObservableCollection<pubL_1_64_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_64_Info> pubL_1_64_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_64_Info info = new pubL_1_64_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.trade_code = unpacker.GetStr("trade_code");
            info.target_code = unpacker.GetStr("target_code");
            info.time_stamp = unpacker.GetInt("time_stamp");
            pubL_1_64_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_64_InfoList.Add((pubL_1_64_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_查询证券代码映射
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_1_64_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.trade_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_STR);
                    info.target_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_STR);
                    info.time_stamp = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT);
                    pubL_1_64_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_1_65_Response : IResponse
    {
        #region 构造函数
        public pubL_1_65_Response()
        {
            this.pubL_1_65_InfoList = new ObservableCollection<pubL_1_65_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_65_Info> pubL_1_65_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_65_Info info = new pubL_1_65_Info();
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
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.trade_code = unpacker.GetStr("trade_code");
            info.target_code = unpacker.GetStr("target_code");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pubL_1_65_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_65_InfoList.Add((pubL_1_65_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_查询证券代码映射流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_1_65_Info();
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
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.trade_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_STR);
                    info.target_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pubL_1_65_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_1_66_Response : IResponse
    {
        #region 构造函数
        public pubL_1_66_Response()
        {
            this.pubL_1_66_InfoList = new ObservableCollection<pubL_1_66_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_66_Info> pubL_1_66_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_66_Info info = new pubL_1_66_Info();
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
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.trade_code = unpacker.GetStr("trade_code");
            info.target_code = unpacker.GetStr("target_code");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pubL_1_66_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_66_InfoList.Add((pubL_1_66_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_查询历史证券代码映射流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_1_66_Info();
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
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.trade_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_STR);
                    info.target_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pubL_1_66_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_1_34_Response : IResponse
    {
        #region 构造函数
        public pubL_1_34_Response()
        {
            this.pubL_1_34_InfoList = new ObservableCollection<pubL_1_34_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_34_Info> pubL_1_34_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_34_Info info = new pubL_1_34_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_name = unpacker.GetStr("stock_name");
            info.trade_code = unpacker.GetStr("trade_code");
            info.target_code = unpacker.GetStr("target_code");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.trade_code_no = unpacker.GetInt("trade_code_no");
            info.target_code_no = unpacker.GetInt("target_code_no");
            info.apply_date = unpacker.GetInt("apply_date");
            info.apply_limit = unpacker.GetDouble("apply_limit");
            info.begin_trade_date = unpacker.GetInt("begin_trade_date");
            info.issue_price = unpacker.GetDouble("issue_price");
            pubL_1_34_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_34_InfoList.Add((pubL_1_34_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_查询新股信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_1_34_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    info.trade_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_STR);
                    info.target_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_STR);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.trade_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_NO_INT);
                    info.target_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_NO_INT);
                    info.apply_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_APPLY_DATE_INT);
                    info.apply_limit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_APPLY_LIMIT_FLOAT);
                    info.begin_trade_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TRADE_DATE_INT);
                    info.issue_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ISSUE_PRICE_FLOAT);
                    pubL_1_34_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_1_35_Response : IResponse
    {
        #region 构造函数
        public pubL_1_35_Response()
        {
            this.pubL_1_35_InfoList = new ObservableCollection<pubL_1_35_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_35_Info> pubL_1_35_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_35_Info info = new pubL_1_35_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_name = unpacker.GetStr("stock_name");
            info.trade_code = unpacker.GetStr("trade_code");
            info.target_code = unpacker.GetStr("target_code");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.trade_code_no = unpacker.GetInt("trade_code_no");
            info.target_code_no = unpacker.GetInt("target_code_no");
            info.apply_date = unpacker.GetInt("apply_date");
            info.apply_limit = unpacker.GetDouble("apply_limit");
            info.begin_trade_date = unpacker.GetInt("begin_trade_date");
            info.issue_price = unpacker.GetDouble("issue_price");
            pubL_1_35_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_35_InfoList.Add((pubL_1_35_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_查询当日新股信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_1_35_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    info.trade_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_STR);
                    info.target_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_STR);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.trade_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_NO_INT);
                    info.target_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_NO_INT);
                    info.apply_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_APPLY_DATE_INT);
                    info.apply_limit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_APPLY_LIMIT_FLOAT);
                    info.begin_trade_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TRADE_DATE_INT);
                    info.issue_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ISSUE_PRICE_FLOAT);
                    pubL_1_35_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_1_36_Response : IResponse
    {
        #region 构造函数
        public pubL_1_36_Response()
        {
            this.pubL_1_36_InfoList = new ObservableCollection<pubL_1_36_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_36_Info> pubL_1_36_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_36_Info info = new pubL_1_36_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_name = unpacker.GetStr("stock_name");
            info.trade_code = unpacker.GetStr("trade_code");
            info.target_code = unpacker.GetStr("target_code");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.trade_code_no = unpacker.GetInt("trade_code_no");
            info.target_code_no = unpacker.GetInt("target_code_no");
            info.apply_date = unpacker.GetInt("apply_date");
            info.apply_limit = unpacker.GetDouble("apply_limit");
            info.begin_trade_date = unpacker.GetInt("begin_trade_date");
            info.issue_price = unpacker.GetDouble("issue_price");
            pubL_1_36_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_36_InfoList.Add((pubL_1_36_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_查询可转债信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_1_36_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    info.trade_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_STR);
                    info.target_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_STR);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.trade_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_NO_INT);
                    info.target_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_NO_INT);
                    info.apply_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_APPLY_DATE_INT);
                    info.apply_limit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_APPLY_LIMIT_FLOAT);
                    info.begin_trade_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TRADE_DATE_INT);
                    info.issue_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ISSUE_PRICE_FLOAT);
                    pubL_1_36_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_1_37_Response : IResponse
    {
        #region 构造函数
        public pubL_1_37_Response()
        {
            this.pubL_1_37_InfoList = new ObservableCollection<pubL_1_37_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_37_Info> pubL_1_37_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_37_Info info = new pubL_1_37_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_name = unpacker.GetStr("stock_name");
            info.trade_code = unpacker.GetStr("trade_code");
            info.target_code = unpacker.GetStr("target_code");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.trade_code_no = unpacker.GetInt("trade_code_no");
            info.target_code_no = unpacker.GetInt("target_code_no");
            info.apply_date = unpacker.GetInt("apply_date");
            info.apply_limit = unpacker.GetDouble("apply_limit");
            info.begin_trade_date = unpacker.GetInt("begin_trade_date");
            info.issue_price = unpacker.GetDouble("issue_price");
            pubL_1_37_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_37_InfoList.Add((pubL_1_37_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_查询当日可转债信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_1_37_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    info.trade_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_STR);
                    info.target_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_STR);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.trade_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_NO_INT);
                    info.target_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_NO_INT);
                    info.apply_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_APPLY_DATE_INT);
                    info.apply_limit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_APPLY_LIMIT_FLOAT);
                    info.begin_trade_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TRADE_DATE_INT);
                    info.issue_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ISSUE_PRICE_FLOAT);
                    pubL_1_37_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_1_71_Response : IResponse
    {
        #region 构造函数
        public pubL_1_71_Response()
        {
            this.pubL_1_71_InfoList = new ObservableCollection<pubL_1_71_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_71_Info> pubL_1_71_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_71_Info info = new pubL_1_71_Info();
            pubL_1_71_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_71_InfoList.Add((pubL_1_71_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_新增证券行情
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_1_71_Info();
                pubL_1_71_InfoList.Add(info);
            }
        }
    }

    public class pubL_1_72_Response : IResponse
    {
        #region 构造函数
        public pubL_1_72_Response()
        {
            this.pubL_1_72_InfoList = new ObservableCollection<pubL_1_72_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_72_Info> pubL_1_72_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_72_Info info = new pubL_1_72_Info();
            pubL_1_72_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_72_InfoList.Add((pubL_1_72_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_修改证券行情
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_1_72_Info();
                pubL_1_72_InfoList.Add(info);
            }
        }
    }

    public class pubL_1_73_Response : IResponse
    {
        #region 构造函数
        public pubL_1_73_Response()
        {
            this.pubL_1_73_InfoList = new ObservableCollection<pubL_1_73_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_73_Info> pubL_1_73_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_73_Info info = new pubL_1_73_Info();
            pubL_1_73_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_73_InfoList.Add((pubL_1_73_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_删除证券行情
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_1_73_Info();
                pubL_1_73_InfoList.Add(info);
            }
        }
    }

    public class pubL_1_74_Response : IResponse
    {
        #region 构造函数
        public pubL_1_74_Response()
        {
            this.pubL_1_74_InfoList = new ObservableCollection<pubL_1_74_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_74_Info> pubL_1_74_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_74_Info info = new pubL_1_74_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_name = unpacker.GetStr("stock_name");
            info.up_limit_price = unpacker.GetDouble("up_limit_price");
            info.down_limit_price = unpacker.GetDouble("down_limit_price");
            info.last_price = unpacker.GetDouble("last_price");
            info.pre_close_price = unpacker.GetDouble("pre_close_price");
            info.today_open_price = unpacker.GetDouble("today_open_price");
            info.today_close_price = unpacker.GetDouble("today_close_price");
            info.today_max_price = unpacker.GetDouble("today_max_price");
            info.today_min_price = unpacker.GetDouble("today_min_price");
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
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.pe_ratio = unpacker.GetDouble("pe_ratio");
            info.time_stamp = unpacker.GetInt("time_stamp");
            pubL_1_74_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_74_InfoList.Add((pubL_1_74_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_查询证券行情
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_1_74_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    info.up_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UP_LIMIT_PRICE_FLOAT);
                    info.down_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DOWN_LIMIT_PRICE_FLOAT);
                    info.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    info.pre_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_CLOSE_PRICE_FLOAT);
                    info.today_open_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_OPEN_PRICE_FLOAT);
                    info.today_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_CLOSE_PRICE_FLOAT);
                    info.today_max_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_MAX_PRICE_FLOAT);
                    info.today_min_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_MIN_PRICE_FLOAT);
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
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    info.pe_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PE_RATIO_FLOAT);
                    info.time_stamp = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT);
                    pubL_1_74_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_1_77_Response : IResponse
    {
        #region 构造函数
        public pubL_1_77_Response()
        {
            this.pubL_1_77_InfoList = new ObservableCollection<pubL_1_77_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_77_Info> pubL_1_77_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_77_Info info = new pubL_1_77_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_name = unpacker.GetStr("stock_name");
            info.up_limit_price = unpacker.GetDouble("up_limit_price");
            info.down_limit_price = unpacker.GetDouble("down_limit_price");
            info.last_price = unpacker.GetDouble("last_price");
            info.pre_close_price = unpacker.GetDouble("pre_close_price");
            info.today_open_price = unpacker.GetDouble("today_open_price");
            info.today_close_price = unpacker.GetDouble("today_close_price");
            info.today_max_price = unpacker.GetDouble("today_max_price");
            info.today_min_price = unpacker.GetDouble("today_min_price");
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
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.pe_ratio = unpacker.GetDouble("pe_ratio");
            info.time_stamp = unpacker.GetInt("time_stamp");
            pubL_1_77_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_77_InfoList.Add((pubL_1_77_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_批量获取证券行情
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_1_77_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    info.up_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UP_LIMIT_PRICE_FLOAT);
                    info.down_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DOWN_LIMIT_PRICE_FLOAT);
                    info.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    info.pre_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_CLOSE_PRICE_FLOAT);
                    info.today_open_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_OPEN_PRICE_FLOAT);
                    info.today_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_CLOSE_PRICE_FLOAT);
                    info.today_max_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_MAX_PRICE_FLOAT);
                    info.today_min_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_MIN_PRICE_FLOAT);
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
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    info.pe_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PE_RATIO_FLOAT);
                    info.time_stamp = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT);
                    pubL_1_77_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_1_78_Response : IResponse
    {
        #region 构造函数
        public pubL_1_78_Response()
        {
            this.pubL_1_78_InfoList = new ObservableCollection<pubL_1_78_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_78_Info> pubL_1_78_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_78_Info info = new pubL_1_78_Info();
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_name = unpacker.GetStr("stock_name");
            info.up_limit_price = unpacker.GetDouble("up_limit_price");
            info.down_limit_price = unpacker.GetDouble("down_limit_price");
            info.last_price = unpacker.GetDouble("last_price");
            info.pre_close_price = unpacker.GetDouble("pre_close_price");
            pubL_1_78_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_78_InfoList.Add((pubL_1_78_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_获取证券行情
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_1_78_Info();
                info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                info.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                info.up_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UP_LIMIT_PRICE_FLOAT);
                info.down_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DOWN_LIMIT_PRICE_FLOAT);
                info.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                info.pre_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_CLOSE_PRICE_FLOAT);
                pubL_1_78_InfoList.Add(info);
            }
        }
    }

    public class pubL_1_75_Response : IResponse
    {
        #region 构造函数
        public pubL_1_75_Response()
        {
            this.pubL_1_75_InfoList = new ObservableCollection<pubL_1_75_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_75_Info> pubL_1_75_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_75_Info info = new pubL_1_75_Info();
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
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pubL_1_75_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_75_InfoList.Add((pubL_1_75_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_查询证券行情流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_1_75_Info();
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
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pubL_1_75_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_1_76_Response : IResponse
    {
        #region 构造函数
        public pubL_1_76_Response()
        {
            this.pubL_1_76_InfoList = new ObservableCollection<pubL_1_76_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_76_Info> pubL_1_76_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_76_Info info = new pubL_1_76_Info();
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
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pubL_1_76_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_76_InfoList.Add((pubL_1_76_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_查询历史证券行情流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_1_76_Info();
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
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pubL_1_76_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_1_79_Response : IResponse
    {
        #region 构造函数
        public pubL_1_79_Response()
        {
            this.pubL_1_79_InfoList = new ObservableCollection<pubL_1_79_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_79_Info> pubL_1_79_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_79_Info info = new pubL_1_79_Info();
            info.task_strike_status = unpacker.GetStr("task_strike_status");
            pubL_1_79_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_79_InfoList.Add((pubL_1_79_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_证券行情归档定时任务
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_1_79_Info();
                info.task_strike_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STRIKE_STATUS_STR);
                pubL_1_79_InfoList.Add(info);
            }
        }
    }

    public class pubL_1_81_Response : IResponse
    {
        #region 构造函数
        public pubL_1_81_Response()
        {
            this.pubL_1_81_InfoList = new ObservableCollection<pubL_1_81_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_81_Info> pubL_1_81_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_81_Info info = new pubL_1_81_Info();
            pubL_1_81_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_81_InfoList.Add((pubL_1_81_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_新增债券属性信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_1_81_Info();
                pubL_1_81_InfoList.Add(info);
            }
        }
    }

    public class pubL_1_82_Response : IResponse
    {
        #region 构造函数
        public pubL_1_82_Response()
        {
            this.pubL_1_82_InfoList = new ObservableCollection<pubL_1_82_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_82_Info> pubL_1_82_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_82_Info info = new pubL_1_82_Info();
            pubL_1_82_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_82_InfoList.Add((pubL_1_82_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_修改债券属性信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_1_82_Info();
                pubL_1_82_InfoList.Add(info);
            }
        }
    }

    public class pubL_1_83_Response : IResponse
    {
        #region 构造函数
        public pubL_1_83_Response()
        {
            this.pubL_1_83_InfoList = new ObservableCollection<pubL_1_83_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_83_Info> pubL_1_83_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_83_Info info = new pubL_1_83_Info();
            pubL_1_83_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_83_InfoList.Add((pubL_1_83_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_删除债券属性信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_1_83_Info();
                pubL_1_83_InfoList.Add(info);
            }
        }
    }

    public class pubL_1_84_Response : IResponse
    {
        #region 构造函数
        public pubL_1_84_Response()
        {
            this.pubL_1_84_InfoList = new ObservableCollection<pubL_1_84_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_84_Info> pubL_1_84_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_84_Info info = new pubL_1_84_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_name = unpacker.GetStr("stock_name");
            info.issue_date = unpacker.GetInt("issue_date");
            info.end_date = unpacker.GetInt("end_date");
            info.value_date = unpacker.GetInt("value_date");
            info.next_value_date = unpacker.GetInt("next_value_date");
            info.begin_trade_date = unpacker.GetInt("begin_trade_date");
            info.bond_limit = unpacker.GetDouble("bond_limit");
            info.issue_price = unpacker.GetDouble("issue_price");
            info.par_value = unpacker.GetDouble("par_value");
            info.intrst_ratio = unpacker.GetDouble("intrst_ratio");
            info.intrst_days = unpacker.GetInt("intrst_days");
            info.pay_inteval = unpacker.GetInt("pay_inteval");
            info.bond_accr_intrst = unpacker.GetDouble("bond_accr_intrst");
            info.bond_rate_type = unpacker.GetInt("bond_rate_type");
            info.inteval_days = unpacker.GetInt("inteval_days");
            info.net_price_flag = unpacker.GetInt("net_price_flag");
            info.last_trade_date = unpacker.GetInt("last_trade_date");
            info.rights_type = unpacker.GetInt("rights_type");
            info.trans_begin_date = unpacker.GetInt("trans_begin_date");
            info.trans_end_date = unpacker.GetInt("trans_end_date");
            info.exec_begin_date = unpacker.GetInt("exec_begin_date");
            info.exec_end_date = unpacker.GetInt("exec_end_date");
            info.impawn_ratio = unpacker.GetDouble("impawn_ratio");
            info.trade_code = unpacker.GetStr("trade_code");
            info.target_code = unpacker.GetStr("target_code");
            info.time_stamp = unpacker.GetInt("time_stamp");
            pubL_1_84_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_84_InfoList.Add((pubL_1_84_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_查询债券属性信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_1_84_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    info.issue_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ISSUE_DATE_INT);
                    info.end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT);
                    info.value_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_VALUE_DATE_INT);
                    info.next_value_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NEXT_VALUE_DATE_INT);
                    info.begin_trade_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TRADE_DATE_INT);
                    info.bond_limit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_LIMIT_FLOAT);
                    info.issue_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ISSUE_PRICE_FLOAT);
                    info.par_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_FLOAT);
                    info.intrst_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_RATIO_FLOAT);
                    info.intrst_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_DAYS_INT);
                    info.pay_inteval = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PAY_INTEVAL_INT);
                    info.bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT);
                    info.bond_rate_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BOND_RATE_TYPE_INT);
                    info.inteval_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INTEVAL_DAYS_INT);
                    info.net_price_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLAG_INT);
                    info.last_trade_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LAST_TRADE_DATE_INT);
                    info.rights_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RIGHTS_TYPE_INT);
                    info.trans_begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_BEGIN_DATE_INT);
                    info.trans_end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_END_DATE_INT);
                    info.exec_begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_BEGIN_DATE_INT);
                    info.exec_end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_END_DATE_INT);
                    info.impawn_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_IMPAWN_RATIO_FLOAT);
                    info.trade_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_STR);
                    info.target_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_STR);
                    info.time_stamp = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT);
                    pubL_1_84_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_1_88_Response : IResponse
    {
        #region 构造函数
        public pubL_1_88_Response()
        {
            this.pubL_1_88_InfoList = new ObservableCollection<pubL_1_88_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_88_Info> pubL_1_88_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_88_Info info = new pubL_1_88_Info();
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_name = unpacker.GetStr("stock_name");
            info.issue_date = unpacker.GetInt("issue_date");
            info.end_date = unpacker.GetInt("end_date");
            info.value_date = unpacker.GetInt("value_date");
            info.next_value_date = unpacker.GetInt("next_value_date");
            info.begin_trade_date = unpacker.GetInt("begin_trade_date");
            info.bond_limit = unpacker.GetDouble("bond_limit");
            info.issue_price = unpacker.GetDouble("issue_price");
            info.par_value = unpacker.GetDouble("par_value");
            info.intrst_ratio = unpacker.GetDouble("intrst_ratio");
            info.intrst_days = unpacker.GetInt("intrst_days");
            info.pay_inteval = unpacker.GetInt("pay_inteval");
            info.bond_accr_intrst = unpacker.GetDouble("bond_accr_intrst");
            info.bond_rate_type = unpacker.GetInt("bond_rate_type");
            info.inteval_days = unpacker.GetInt("inteval_days");
            info.net_price_flag = unpacker.GetInt("net_price_flag");
            info.last_trade_date = unpacker.GetInt("last_trade_date");
            info.rights_type = unpacker.GetInt("rights_type");
            info.trans_begin_date = unpacker.GetInt("trans_begin_date");
            info.trans_end_date = unpacker.GetInt("trans_end_date");
            info.exec_begin_date = unpacker.GetInt("exec_begin_date");
            info.exec_end_date = unpacker.GetInt("exec_end_date");
            info.impawn_ratio = unpacker.GetDouble("impawn_ratio");
            info.trade_code = unpacker.GetStr("trade_code");
            info.target_code = unpacker.GetStr("target_code");
            pubL_1_88_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_88_InfoList.Add((pubL_1_88_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_获取债券属性
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_1_88_Info();
                info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                info.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                info.issue_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ISSUE_DATE_INT);
                info.end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT);
                info.value_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_VALUE_DATE_INT);
                info.next_value_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NEXT_VALUE_DATE_INT);
                info.begin_trade_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TRADE_DATE_INT);
                info.bond_limit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_LIMIT_FLOAT);
                info.issue_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ISSUE_PRICE_FLOAT);
                info.par_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_FLOAT);
                info.intrst_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_RATIO_FLOAT);
                info.intrst_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_DAYS_INT);
                info.pay_inteval = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PAY_INTEVAL_INT);
                info.bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT);
                info.bond_rate_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BOND_RATE_TYPE_INT);
                info.inteval_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INTEVAL_DAYS_INT);
                info.net_price_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLAG_INT);
                info.last_trade_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LAST_TRADE_DATE_INT);
                info.rights_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RIGHTS_TYPE_INT);
                info.trans_begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_BEGIN_DATE_INT);
                info.trans_end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_END_DATE_INT);
                info.exec_begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_BEGIN_DATE_INT);
                info.exec_end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_END_DATE_INT);
                info.impawn_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_IMPAWN_RATIO_FLOAT);
                info.trade_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_STR);
                info.target_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_STR);
                pubL_1_88_InfoList.Add(info);
            }
        }
    }

    public class pubL_1_85_Response : IResponse
    {
        #region 构造函数
        public pubL_1_85_Response()
        {
            this.pubL_1_85_InfoList = new ObservableCollection<pubL_1_85_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_85_Info> pubL_1_85_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_85_Info info = new pubL_1_85_Info();
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
            info.stock_code = unpacker.GetStr("stock_code");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pubL_1_85_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_85_InfoList.Add((pubL_1_85_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_查询债券属性流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_1_85_Info();
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
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pubL_1_85_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_1_86_Response : IResponse
    {
        #region 构造函数
        public pubL_1_86_Response()
        {
            this.pubL_1_86_InfoList = new ObservableCollection<pubL_1_86_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_86_Info> pubL_1_86_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_86_Info info = new pubL_1_86_Info();
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
            info.stock_code = unpacker.GetStr("stock_code");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pubL_1_86_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_86_InfoList.Add((pubL_1_86_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_查询历史债券属性流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_1_86_Info();
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
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pubL_1_86_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_1_87_Response : IResponse
    {
        #region 构造函数
        public pubL_1_87_Response()
        {
            this.pubL_1_87_InfoList = new ObservableCollection<pubL_1_87_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_87_Info> pubL_1_87_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_87_Info info = new pubL_1_87_Info();
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.impawn_code_no = unpacker.GetInt("impawn_code_no");
            info.impawn_code = unpacker.GetStr("impawn_code");
            info.impawn_ratio = unpacker.GetDouble("impawn_ratio");
            pubL_1_87_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_87_InfoList.Add((pubL_1_87_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_查询债券质押信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_1_87_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.impawn_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IMPAWN_CODE_NO_INT);
                    info.impawn_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_IMPAWN_CODE_STR);
                    info.impawn_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_IMPAWN_RATIO_FLOAT);
                    pubL_1_87_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_1_91_Response : IResponse
    {
        #region 构造函数
        public pubL_1_91_Response()
        {
            this.pubL_1_91_InfoList = new ObservableCollection<pubL_1_91_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_91_Info> pubL_1_91_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_91_Info info = new pubL_1_91_Info();
            pubL_1_91_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_91_InfoList.Add((pubL_1_91_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_新增债券利率
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_1_91_Info();
                pubL_1_91_InfoList.Add(info);
            }
        }
    }

    public class pubL_1_92_Response : IResponse
    {
        #region 构造函数
        public pubL_1_92_Response()
        {
            this.pubL_1_92_InfoList = new ObservableCollection<pubL_1_92_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_92_Info> pubL_1_92_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_92_Info info = new pubL_1_92_Info();
            pubL_1_92_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_92_InfoList.Add((pubL_1_92_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_修改债券利率
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_1_92_Info();
                pubL_1_92_InfoList.Add(info);
            }
        }
    }

    public class pubL_1_93_Response : IResponse
    {
        #region 构造函数
        public pubL_1_93_Response()
        {
            this.pubL_1_93_InfoList = new ObservableCollection<pubL_1_93_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_93_Info> pubL_1_93_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_93_Info info = new pubL_1_93_Info();
            pubL_1_93_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_93_InfoList.Add((pubL_1_93_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_删除债券利率
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_1_93_Info();
                pubL_1_93_InfoList.Add(info);
            }
        }
    }

    public class pubL_1_94_Response : IResponse
    {
        #region 构造函数
        public pubL_1_94_Response()
        {
            this.pubL_1_94_InfoList = new ObservableCollection<pubL_1_94_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_94_Info> pubL_1_94_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_94_Info info = new pubL_1_94_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.intrst_begin_date = unpacker.GetInt("intrst_begin_date");
            info.intrst_ratio = unpacker.GetDouble("intrst_ratio");
            info.time_stamp = unpacker.GetInt("time_stamp");
            pubL_1_94_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_94_InfoList.Add((pubL_1_94_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_查询债券利率
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_1_94_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.intrst_begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_BEGIN_DATE_INT);
                    info.intrst_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_RATIO_FLOAT);
                    info.time_stamp = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT);
                    pubL_1_94_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_1_95_Response : IResponse
    {
        #region 构造函数
        public pubL_1_95_Response()
        {
            this.pubL_1_95_InfoList = new ObservableCollection<pubL_1_95_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_95_Info> pubL_1_95_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_95_Info info = new pubL_1_95_Info();
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
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.intrst_begin_date = unpacker.GetInt("intrst_begin_date");
            info.intrst_ratio = unpacker.GetDouble("intrst_ratio");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pubL_1_95_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_95_InfoList.Add((pubL_1_95_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_查询债券利率流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_1_95_Info();
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
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.intrst_begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_BEGIN_DATE_INT);
                    info.intrst_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_RATIO_FLOAT);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pubL_1_95_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_1_96_Response : IResponse
    {
        #region 构造函数
        public pubL_1_96_Response()
        {
            this.pubL_1_96_InfoList = new ObservableCollection<pubL_1_96_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_96_Info> pubL_1_96_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_96_Info info = new pubL_1_96_Info();
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
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.intrst_begin_date = unpacker.GetInt("intrst_begin_date");
            info.intrst_ratio = unpacker.GetDouble("intrst_ratio");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pubL_1_96_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_96_InfoList.Add((pubL_1_96_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_查询历史债券利率流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_1_96_Info();
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
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.intrst_begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_BEGIN_DATE_INT);
                    info.intrst_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_RATIO_FLOAT);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pubL_1_96_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_1_101_Response : IResponse
    {
        #region 构造函数
        public pubL_1_101_Response()
        {
            this.pubL_1_101_InfoList = new ObservableCollection<pubL_1_101_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_101_Info> pubL_1_101_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_101_Info info = new pubL_1_101_Info();
            pubL_1_101_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_101_InfoList.Add((pubL_1_101_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_新增债券评级信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_1_101_Info();
                pubL_1_101_InfoList.Add(info);
            }
        }
    }

    public class pubL_1_102_Response : IResponse
    {
        #region 构造函数
        public pubL_1_102_Response()
        {
            this.pubL_1_102_InfoList = new ObservableCollection<pubL_1_102_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_102_Info> pubL_1_102_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_102_Info info = new pubL_1_102_Info();
            pubL_1_102_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_102_InfoList.Add((pubL_1_102_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_修改债券评级信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_1_102_Info();
                pubL_1_102_InfoList.Add(info);
            }
        }
    }

    public class pubL_1_103_Response : IResponse
    {
        #region 构造函数
        public pubL_1_103_Response()
        {
            this.pubL_1_103_InfoList = new ObservableCollection<pubL_1_103_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_103_Info> pubL_1_103_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_103_Info info = new pubL_1_103_Info();
            pubL_1_103_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_103_InfoList.Add((pubL_1_103_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_删除债券评级信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_1_103_Info();
                pubL_1_103_InfoList.Add(info);
            }
        }
    }

    public class pubL_1_104_Response : IResponse
    {
        #region 构造函数
        public pubL_1_104_Response()
        {
            this.pubL_1_104_InfoList = new ObservableCollection<pubL_1_104_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_104_Info> pubL_1_104_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_104_Info info = new pubL_1_104_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.rating_agency = unpacker.GetStr("rating_agency");
            info.co_no = unpacker.GetInt("co_no");
            info.bond_level = unpacker.GetInt("bond_level");
            info.time_stamp = unpacker.GetInt("time_stamp");
            pubL_1_104_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_104_InfoList.Add((pubL_1_104_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_查询债券评级信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_1_104_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.rating_agency = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RATING_AGENCY_STR);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.bond_level = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BOND_LEVEL_INT);
                    info.time_stamp = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT);
                    pubL_1_104_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_1_105_Response : IResponse
    {
        #region 构造函数
        public pubL_1_105_Response()
        {
            this.pubL_1_105_InfoList = new ObservableCollection<pubL_1_105_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_105_Info> pubL_1_105_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_105_Info info = new pubL_1_105_Info();
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
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.rating_agency = unpacker.GetStr("rating_agency");
            info.co_no = unpacker.GetInt("co_no");
            info.bond_level = unpacker.GetInt("bond_level");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pubL_1_105_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_105_InfoList.Add((pubL_1_105_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_查询债券评级流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_1_105_Info();
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
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.rating_agency = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RATING_AGENCY_STR);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.bond_level = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BOND_LEVEL_INT);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pubL_1_105_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_1_106_Response : IResponse
    {
        #region 构造函数
        public pubL_1_106_Response()
        {
            this.pubL_1_106_InfoList = new ObservableCollection<pubL_1_106_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_106_Info> pubL_1_106_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_106_Info info = new pubL_1_106_Info();
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
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.rating_agency = unpacker.GetStr("rating_agency");
            info.co_no = unpacker.GetInt("co_no");
            info.bond_level = unpacker.GetInt("bond_level");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pubL_1_106_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_106_InfoList.Add((pubL_1_106_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_查询历史债券评级流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_1_106_Info();
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
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.rating_agency = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RATING_AGENCY_STR);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.bond_level = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BOND_LEVEL_INT);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pubL_1_106_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_1_130_Response : IResponse
    {
        #region 构造函数
        public pubL_1_130_Response()
        {
            this.pubL_1_130_InfoList = new ObservableCollection<pubL_1_130_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_130_Info> pubL_1_130_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_130_Info info = new pubL_1_130_Info();
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_type = unpacker.GetInt("stock_type");
            info.stock_name = unpacker.GetStr("stock_name");
            info.repo_days = unpacker.GetInt("repo_days");
            info.cash_capt_days = unpacker.GetInt("cash_capt_days");
            info.last_price = unpacker.GetDouble("last_price");
            pubL_1_130_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_130_InfoList.Add((pubL_1_130_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_查询回购代码信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_1_130_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    info.repo_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPO_DAYS_INT);
                    info.cash_capt_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CASH_CAPT_DAYS_INT);
                    info.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    pubL_1_130_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_1_131_Response : IResponse
    {
        #region 构造函数
        public pubL_1_131_Response()
        {
            this.pubL_1_131_InfoList = new ObservableCollection<pubL_1_131_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_131_Info> pubL_1_131_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_131_Info info = new pubL_1_131_Info();
            info.amt_ratio_str = unpacker.GetStr("amt_ratio_str");
            info.amt_value_str = unpacker.GetStr("amt_value_str");
            info.max_fee_str = unpacker.GetStr("max_fee_str");
            info.min_fee_str = unpacker.GetStr("min_fee_str");
            info.par_value = unpacker.GetDouble("par_value");
            pubL_1_131_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_131_InfoList.Add((pubL_1_131_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_逆回购获取代码费用信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_1_131_Info();
                info.amt_ratio_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_AMT_RATIO_STR_STR);
                info.amt_value_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_AMT_VALUE_STR_STR);
                info.max_fee_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MAX_FEE_STR_STR);
                info.min_fee_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MIN_FEE_STR_STR);
                info.par_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_FLOAT);
                pubL_1_131_InfoList.Add(info);
            }
        }
    }

    public class pubL_1_140_Response : IResponse
    {
        #region 构造函数
        public pubL_1_140_Response()
        {
            this.pubL_1_140_InfoList = new ObservableCollection<pubL_1_140_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_140_Info> pubL_1_140_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_140_Info info = new pubL_1_140_Info();
            info.begin_price = unpacker.GetDouble("begin_price");
            info.end_price = unpacker.GetDouble("end_price");
            info.step_price = unpacker.GetDouble("step_price");
            pubL_1_140_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_140_InfoList.Add((pubL_1_140_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_查询港股价位
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_1_140_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.begin_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_PRICE_FLOAT);
                    info.end_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_END_PRICE_FLOAT);
                    info.step_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STEP_PRICE_FLOAT);
                    pubL_1_140_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_1_141_Response : IResponse
    {
        #region 构造函数
        public pubL_1_141_Response()
        {
            this.pubL_1_141_InfoList = new ObservableCollection<pubL_1_141_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_141_Info> pubL_1_141_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_141_Info info = new pubL_1_141_Info();
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_name = unpacker.GetStr("stock_name");
            pubL_1_141_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_141_InfoList.Add((pubL_1_141_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_编号获取证券信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_1_141_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    pubL_1_141_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_1_142_Response : IResponse
    {
        #region 构造函数
        public pubL_1_142_Response()
        {
            this.pubL_1_142_InfoList = new ObservableCollection<pubL_1_142_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_142_Info> pubL_1_142_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_142_Info info = new pubL_1_142_Info();
            pubL_1_142_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_142_InfoList.Add((pubL_1_142_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_新增基金属性信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_1_142_Info();
                pubL_1_142_InfoList.Add(info);
            }
        }
    }

    public class pubL_1_143_Response : IResponse
    {
        #region 构造函数
        public pubL_1_143_Response()
        {
            this.pubL_1_143_InfoList = new ObservableCollection<pubL_1_143_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_143_Info> pubL_1_143_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_143_Info info = new pubL_1_143_Info();
            pubL_1_143_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_143_InfoList.Add((pubL_1_143_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_修改基金属性信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_1_143_Info();
                pubL_1_143_InfoList.Add(info);
            }
        }
    }

    public class pubL_1_144_Response : IResponse
    {
        #region 构造函数
        public pubL_1_144_Response()
        {
            this.pubL_1_144_InfoList = new ObservableCollection<pubL_1_144_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_144_Info> pubL_1_144_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_144_Info info = new pubL_1_144_Info();
            pubL_1_144_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_144_InfoList.Add((pubL_1_144_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_删除基金属性信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_1_144_Info();
                pubL_1_144_InfoList.Add(info);
            }
        }
    }

    public class pubL_1_145_Response : IResponse
    {
        #region 构造函数
        public pubL_1_145_Response()
        {
            this.pubL_1_145_InfoList = new ObservableCollection<pubL_1_145_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_145_Info> pubL_1_145_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_145_Info info = new pubL_1_145_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_name = unpacker.GetStr("stock_name");
            info.fund_kind = unpacker.GetInt("fund_kind");
            info.fund_manager = unpacker.GetStr("fund_manager");
            info.fund_trustee = unpacker.GetStr("fund_trustee");
            info.distribution_scale = unpacker.GetDouble("distribution_scale");
            info.charging_method = unpacker.GetInt("charging_method");
            info.default_divide_type = unpacker.GetInt("default_divide_type");
            info.fund_found_date = unpacker.GetInt("fund_found_date");
            info.fund_expire_date = unpacker.GetInt("fund_expire_date");
            info.subscription_trade_mark = unpacker.GetInt("subscription_trade_mark");
            info.purchase_trade_mark = unpacker.GetInt("purchase_trade_mark");
            info.rede_trade_mark = unpacker.GetInt("rede_trade_mark");
            info.first_minimum_amt = unpacker.GetDouble("first_minimum_amt");
            info.minimum_subscription_amt = unpacker.GetDouble("minimum_subscription_amt");
            info.minimum_purchase_amt = unpacker.GetDouble("minimum_purchase_amt");
            info.minimum_rede_share = unpacker.GetDouble("minimum_rede_share");
            info.minimum_holding_share = unpacker.GetDouble("minimum_holding_share");
            info.minimum_turning_out_share = unpacker.GetDouble("minimum_turning_out_share");
            info.rede_money_to_account_days = unpacker.GetInt("rede_money_to_account_days");
            info.registration_agency = unpacker.GetStr("registration_agency");
            info.time_stamp = unpacker.GetInt("time_stamp");
            pubL_1_145_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_145_InfoList.Add((pubL_1_145_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_查询基金属性信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_1_145_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    info.fund_kind = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUND_KIND_INT);
                    info.fund_manager = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_STR);
                    info.fund_trustee = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FUND_TRUSTEE_STR);
                    info.distribution_scale = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DISTRIBUTION_SCALE_FLOAT);
                    info.charging_method = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CHARGING_METHOD_INT);
                    info.default_divide_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEFAULT_DIVIDE_TYPE_INT);
                    info.fund_found_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUND_FOUND_DATE_INT);
                    info.fund_expire_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUND_EXPIRE_DATE_INT);
                    info.subscription_trade_mark = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SUBSCRIPTION_TRADE_MARK_INT);
                    info.purchase_trade_mark = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PURCHASE_TRADE_MARK_INT);
                    info.rede_trade_mark = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REDE_TRADE_MARK_INT);
                    info.first_minimum_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FIRST_MINIMUM_AMT_FLOAT);
                    info.minimum_subscription_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MINIMUM_SUBSCRIPTION_AMT_FLOAT);
                    info.minimum_purchase_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MINIMUM_PURCHASE_AMT_FLOAT);
                    info.minimum_rede_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MINIMUM_REDE_SHARE_FLOAT);
                    info.minimum_holding_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MINIMUM_HOLDING_SHARE_FLOAT);
                    info.minimum_turning_out_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MINIMUM_TURNING_OUT_SHARE_FLOAT);
                    info.rede_money_to_account_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REDE_MONEY_TO_ACCOUNT_DAYS_INT);
                    info.registration_agency = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REGISTRATION_AGENCY_STR);
                    info.time_stamp = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT);
                    pubL_1_145_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_1_146_Response : IResponse
    {
        #region 构造函数
        public pubL_1_146_Response()
        {
            this.pubL_1_146_InfoList = new ObservableCollection<pubL_1_146_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_146_Info> pubL_1_146_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_146_Info info = new pubL_1_146_Info();
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_name = unpacker.GetStr("stock_name");
            info.fund_kind = unpacker.GetInt("fund_kind");
            info.fund_manager = unpacker.GetStr("fund_manager");
            info.fund_trustee = unpacker.GetStr("fund_trustee");
            info.distribution_scale = unpacker.GetDouble("distribution_scale");
            info.charging_method = unpacker.GetInt("charging_method");
            info.default_divide_type = unpacker.GetInt("default_divide_type");
            info.fund_found_date = unpacker.GetInt("fund_found_date");
            info.fund_expire_date = unpacker.GetInt("fund_expire_date");
            info.subscription_trade_mark = unpacker.GetInt("subscription_trade_mark");
            info.purchase_trade_mark = unpacker.GetInt("purchase_trade_mark");
            info.rede_trade_mark = unpacker.GetInt("rede_trade_mark");
            info.first_minimum_amt = unpacker.GetDouble("first_minimum_amt");
            info.minimum_subscription_amt = unpacker.GetDouble("minimum_subscription_amt");
            info.minimum_purchase_amt = unpacker.GetDouble("minimum_purchase_amt");
            info.minimum_rede_share = unpacker.GetDouble("minimum_rede_share");
            info.minimum_holding_share = unpacker.GetDouble("minimum_holding_share");
            info.minimum_turning_out_share = unpacker.GetDouble("minimum_turning_out_share");
            info.rede_money_to_account_days = unpacker.GetInt("rede_money_to_account_days");
            info.registration_agency = unpacker.GetStr("registration_agency");
            info.time_stamp = unpacker.GetInt("time_stamp");
            pubL_1_146_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_146_InfoList.Add((pubL_1_146_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_获取基金属性
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_1_146_Info();
                info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                info.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                info.fund_kind = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUND_KIND_INT);
                info.fund_manager = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FUND_MANAGER_STR);
                info.fund_trustee = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FUND_TRUSTEE_STR);
                info.distribution_scale = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DISTRIBUTION_SCALE_FLOAT);
                info.charging_method = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CHARGING_METHOD_INT);
                info.default_divide_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEFAULT_DIVIDE_TYPE_INT);
                info.fund_found_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUND_FOUND_DATE_INT);
                info.fund_expire_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUND_EXPIRE_DATE_INT);
                info.subscription_trade_mark = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SUBSCRIPTION_TRADE_MARK_INT);
                info.purchase_trade_mark = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PURCHASE_TRADE_MARK_INT);
                info.rede_trade_mark = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REDE_TRADE_MARK_INT);
                info.first_minimum_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FIRST_MINIMUM_AMT_FLOAT);
                info.minimum_subscription_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MINIMUM_SUBSCRIPTION_AMT_FLOAT);
                info.minimum_purchase_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MINIMUM_PURCHASE_AMT_FLOAT);
                info.minimum_rede_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MINIMUM_REDE_SHARE_FLOAT);
                info.minimum_holding_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MINIMUM_HOLDING_SHARE_FLOAT);
                info.minimum_turning_out_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MINIMUM_TURNING_OUT_SHARE_FLOAT);
                info.rede_money_to_account_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REDE_MONEY_TO_ACCOUNT_DAYS_INT);
                info.registration_agency = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REGISTRATION_AGENCY_STR);
                info.time_stamp = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT);
                pubL_1_146_InfoList.Add(info);
            }
        }
    }

    public class pubL_1_147_Response : IResponse
    {
        #region 构造函数
        public pubL_1_147_Response()
        {
            this.pubL_1_147_InfoList = new ObservableCollection<pubL_1_147_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_147_Info> pubL_1_147_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_147_Info info = new pubL_1_147_Info();
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
            info.stock_code = unpacker.GetStr("stock_code");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pubL_1_147_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_147_InfoList.Add((pubL_1_147_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_查询基金属性流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_1_147_Info();
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
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pubL_1_147_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_1_148_Response : IResponse
    {
        #region 构造函数
        public pubL_1_148_Response()
        {
            this.pubL_1_148_InfoList = new ObservableCollection<pubL_1_148_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_148_Info> pubL_1_148_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_148_Info info = new pubL_1_148_Info();
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
            info.stock_code = unpacker.GetStr("stock_code");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pubL_1_148_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_148_InfoList.Add((pubL_1_148_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_查询历史基金属性流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_1_148_Info();
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
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pubL_1_148_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_1_151_Response : IResponse
    {
        #region 构造函数
        public pubL_1_151_Response()
        {
            this.pubL_1_151_InfoList = new ObservableCollection<pubL_1_151_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_151_Info> pubL_1_151_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_151_Info info = new pubL_1_151_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_name = unpacker.GetStr("stock_name");
            info.trade_code = unpacker.GetStr("trade_code");
            info.target_code = unpacker.GetStr("target_code");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.trade_code_no = unpacker.GetInt("trade_code_no");
            info.target_code_no = unpacker.GetInt("target_code_no");
            info.apply_date = unpacker.GetInt("apply_date");
            info.apply_limit = unpacker.GetDouble("apply_limit");
            info.begin_trade_date = unpacker.GetInt("begin_trade_date");
            info.issue_price = unpacker.GetDouble("issue_price");
            info.warn_trade_amount = unpacker.GetDouble("warn_trade_amount");
            info.warn_buy_amount = unpacker.GetDouble("warn_buy_amount");
            info.warn_auto_sell = unpacker.GetInt("warn_auto_sell");
            info.is_warn = unpacker.GetInt("is_warn");
            info.stock_open_date = unpacker.GetInt("stock_open_date");
            info.stock_open_price = unpacker.GetDouble("stock_open_price");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.buy_qty_1 = unpacker.GetDouble("buy_qty_1");
            info.up_limit_price = unpacker.GetDouble("up_limit_price");
            info.last_price = unpacker.GetDouble("last_price");
            pubL_1_151_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_151_InfoList.Add((pubL_1_151_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_查询新股开板监控信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_1_151_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    info.trade_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_STR);
                    info.target_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_STR);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.trade_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_NO_INT);
                    info.target_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_NO_INT);
                    info.apply_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_APPLY_DATE_INT);
                    info.apply_limit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_APPLY_LIMIT_FLOAT);
                    info.begin_trade_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TRADE_DATE_INT);
                    info.issue_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ISSUE_PRICE_FLOAT);
                    info.warn_trade_amount = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WARN_TRADE_AMOUNT_FLOAT);
                    info.warn_buy_amount = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WARN_BUY_AMOUNT_FLOAT);
                    info.warn_auto_sell = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WARN_AUTO_SELL_INT);
                    info.is_warn = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_WARN_INT);
                    info.stock_open_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_OPEN_DATE_INT);
                    info.stock_open_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_OPEN_PRICE_FLOAT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.buy_qty_1 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_QTY_1_FLOAT);
                    info.up_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UP_LIMIT_PRICE_FLOAT);
                    info.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    pubL_1_151_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_1_152_Response : IResponse
    {
        #region 构造函数
        public pubL_1_152_Response()
        {
            this.pubL_1_152_InfoList = new ObservableCollection<pubL_1_152_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_152_Info> pubL_1_152_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_152_Info info = new pubL_1_152_Info();
            pubL_1_152_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_152_InfoList.Add((pubL_1_152_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_新增新股开板监控信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_1_152_Info();
                pubL_1_152_InfoList.Add(info);
            }
        }
    }

    public class pubL_1_153_Response : IResponse
    {
        #region 构造函数
        public pubL_1_153_Response()
        {
            this.pubL_1_153_InfoList = new ObservableCollection<pubL_1_153_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_153_Info> pubL_1_153_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_153_Info info = new pubL_1_153_Info();
            pubL_1_153_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_153_InfoList.Add((pubL_1_153_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_修改新股开板监控信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_1_153_Info();
                pubL_1_153_InfoList.Add(info);
            }
        }
    }

    public class pubL_1_154_Response : IResponse
    {
        #region 构造函数
        public pubL_1_154_Response()
        {
            this.pubL_1_154_InfoList = new ObservableCollection<pubL_1_154_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_154_Info> pubL_1_154_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_154_Info info = new pubL_1_154_Info();
            pubL_1_154_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_154_InfoList.Add((pubL_1_154_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_删除新股开板监控信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_1_154_Info();
                pubL_1_154_InfoList.Add(info);
            }
        }
    }

    public class pubL_1_155_Response : IResponse
    {
        #region 构造函数
        public pubL_1_155_Response()
        {
            this.pubL_1_155_InfoList = new ObservableCollection<pubL_1_155_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_155_Info> pubL_1_155_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_155_Info info = new pubL_1_155_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_name = unpacker.GetStr("stock_name");
            info.warn_trade_amount = unpacker.GetDouble("warn_trade_amount");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.warn_buy_amount = unpacker.GetDouble("warn_buy_amount");
            info.buy_qty_1 = unpacker.GetDouble("buy_qty_1");
            info.up_limit_price = unpacker.GetDouble("up_limit_price");
            info.last_price = unpacker.GetDouble("last_price");
            pubL_1_155_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_155_InfoList.Add((pubL_1_155_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_查询触警新股信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_1_155_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    info.warn_trade_amount = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WARN_TRADE_AMOUNT_FLOAT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.warn_buy_amount = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WARN_BUY_AMOUNT_FLOAT);
                    info.buy_qty_1 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_QTY_1_FLOAT);
                    info.up_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UP_LIMIT_PRICE_FLOAT);
                    info.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    pubL_1_155_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_1_156_Response : IResponse
    {
        #region 构造函数
        public pubL_1_156_Response()
        {
            this.pubL_1_156_InfoList = new ObservableCollection<pubL_1_156_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_156_Info> pubL_1_156_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_156_Info info = new pubL_1_156_Info();
            pubL_1_156_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_156_InfoList.Add((pubL_1_156_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_更新新股触警信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_1_156_Info();
                pubL_1_156_InfoList.Add(info);
            }
        }
    }

    public class pubL_1_157_Response : IResponse
    {
        #region 构造函数
        public pubL_1_157_Response()
        {
            this.pubL_1_157_InfoList = new ObservableCollection<pubL_1_157_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_157_Info> pubL_1_157_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_157_Info info = new pubL_1_157_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_name = unpacker.GetStr("stock_name");
            info.trade_code = unpacker.GetStr("trade_code");
            info.target_code = unpacker.GetStr("target_code");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.trade_code_no = unpacker.GetInt("trade_code_no");
            info.target_code_no = unpacker.GetInt("target_code_no");
            info.apply_date = unpacker.GetInt("apply_date");
            info.apply_limit = unpacker.GetDouble("apply_limit");
            info.begin_trade_date = unpacker.GetInt("begin_trade_date");
            info.issue_price = unpacker.GetDouble("issue_price");
            pubL_1_157_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_157_InfoList.Add((pubL_1_157_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_查询所有新股信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_1_157_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    info.trade_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_STR);
                    info.target_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_STR);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.trade_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_NO_INT);
                    info.target_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_NO_INT);
                    info.apply_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_APPLY_DATE_INT);
                    info.apply_limit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_APPLY_LIMIT_FLOAT);
                    info.begin_trade_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TRADE_DATE_INT);
                    info.issue_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ISSUE_PRICE_FLOAT);
                    pubL_1_157_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_1_158_Response : IResponse
    {
        #region 构造函数
        public pubL_1_158_Response()
        {
            this.pubL_1_158_InfoList = new ObservableCollection<pubL_1_158_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_158_Info> pubL_1_158_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_158_Info info = new pubL_1_158_Info();
            pubL_1_158_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_158_InfoList.Add((pubL_1_158_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_新增基金产品对照关系
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_1_158_Info();
                pubL_1_158_InfoList.Add(info);
            }
        }
    }

    public class pubL_1_159_Response : IResponse
    {
        #region 构造函数
        public pubL_1_159_Response()
        {
            this.pubL_1_159_InfoList = new ObservableCollection<pubL_1_159_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_159_Info> pubL_1_159_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_159_Info info = new pubL_1_159_Info();
            pubL_1_159_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_159_InfoList.Add((pubL_1_159_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_修改基金产品对照关系
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_1_159_Info();
                pubL_1_159_InfoList.Add(info);
            }
        }
    }

    public class pubL_1_160_Response : IResponse
    {
        #region 构造函数
        public pubL_1_160_Response()
        {
            this.pubL_1_160_InfoList = new ObservableCollection<pubL_1_160_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_160_Info> pubL_1_160_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_160_Info info = new pubL_1_160_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_name = unpacker.GetStr("stock_name");
            info.pd_no = unpacker.GetInt("pd_no");
            info.co_no = unpacker.GetInt("co_no");
            pubL_1_160_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_160_InfoList.Add((pubL_1_160_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_查询基金产品对照关系
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_1_160_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    pubL_1_160_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_1_161_Response : IResponse
    {
        #region 构造函数
        public pubL_1_161_Response()
        {
            this.pubL_1_161_InfoList = new ObservableCollection<pubL_1_161_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_161_Info> pubL_1_161_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_161_Info info = new pubL_1_161_Info();
            pubL_1_161_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_161_InfoList.Add((pubL_1_161_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_更新基金产品行情
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_1_161_Info();
                pubL_1_161_InfoList.Add(info);
            }
        }
    }

    public class pubL_1_162_Response : IResponse
    {
        #region 构造函数
        public pubL_1_162_Response()
        {
            this.pubL_1_162_InfoList = new ObservableCollection<pubL_1_162_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_162_Info> pubL_1_162_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_162_Info info = new pubL_1_162_Info();
            pubL_1_162_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_162_InfoList.Add((pubL_1_162_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_删除基金产品对照关系
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_1_162_Info();
                pubL_1_162_InfoList.Add(info);
            }
        }
    }

    public class pubL_1_163_Response : IResponse
    {
        #region 构造函数
        public pubL_1_163_Response()
        {
            this.pubL_1_163_InfoList = new ObservableCollection<pubL_1_163_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_163_Info> pubL_1_163_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_163_Info info = new pubL_1_163_Info();
            pubL_1_163_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_163_InfoList.Add((pubL_1_163_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_同步场外基金属性信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_1_163_Info();
                pubL_1_163_InfoList.Add(info);
            }
        }
    }

    public class pubL_1_164_Response : IResponse
    {
        #region 构造函数
        public pubL_1_164_Response()
        {
            this.pubL_1_164_InfoList = new ObservableCollection<pubL_1_164_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_164_Info> pubL_1_164_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_164_Info info = new pubL_1_164_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.quot_calc_unit = unpacker.GetDouble("quot_calc_unit");
            pubL_1_164_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_164_InfoList.Add((pubL_1_164_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_查询特殊证券行情计算单位
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_1_164_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.quot_calc_unit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_QUOT_CALC_UNIT_FLOAT);
                    pubL_1_164_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_1_165_Response : IResponse
    {
        #region 构造函数
        public pubL_1_165_Response()
        {
            this.pubL_1_165_InfoList = new ObservableCollection<pubL_1_165_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_165_Info> pubL_1_165_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_165_Info info = new pubL_1_165_Info();
            pubL_1_165_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_165_InfoList.Add((pubL_1_165_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_设置特殊证券行情计算单位
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_1_165_Info();
                pubL_1_165_InfoList.Add(info);
            }
        }
    }

    public class pubL_1_166_Response : IResponse
    {
        #region 构造函数
        public pubL_1_166_Response()
        {
            this.pubL_1_166_InfoList = new ObservableCollection<pubL_1_166_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_166_Info> pubL_1_166_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_166_Info info = new pubL_1_166_Info();
            pubL_1_166_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_166_InfoList.Add((pubL_1_166_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_删除特殊证券行情计算单位
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_1_166_Info();
                pubL_1_166_InfoList.Add(info);
            }
        }
    }

    public class pubL_1_177_Response : IResponse
    {
        #region 构造函数
        public pubL_1_177_Response()
        {
            this.pubL_1_177_InfoList = new ObservableCollection<pubL_1_177_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_1_177_Info> pubL_1_177_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_1_177_Info info = new pubL_1_177_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_name = unpacker.GetStr("stock_name");
            info.up_limit_price = unpacker.GetDouble("up_limit_price");
            info.down_limit_price = unpacker.GetDouble("down_limit_price");
            info.last_price = unpacker.GetDouble("last_price");
            info.pre_close_price = unpacker.GetDouble("pre_close_price");
            info.today_open_price = unpacker.GetDouble("today_open_price");
            info.today_close_price = unpacker.GetDouble("today_close_price");
            info.today_max_price = unpacker.GetDouble("today_max_price");
            info.today_min_price = unpacker.GetDouble("today_min_price");
            pubL_1_177_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_1_177_InfoList.Add((pubL_1_177_Info)info);
        }
        #endregion

        //逻辑_公共_证券基础数据_查询证券收盘价
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_1_177_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    info.up_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UP_LIMIT_PRICE_FLOAT);
                    info.down_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DOWN_LIMIT_PRICE_FLOAT);
                    info.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    info.pre_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_CLOSE_PRICE_FLOAT);
                    info.today_open_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_OPEN_PRICE_FLOAT);
                    info.today_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_CLOSE_PRICE_FLOAT);
                    info.today_max_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_MAX_PRICE_FLOAT);
                    info.today_min_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_MIN_PRICE_FLOAT);
                    pubL_1_177_InfoList.Add(info);
                }
            }
        }
    }

}
