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
    public class pubL_23_11_Response : IResponse
    {
        #region 构造函数
        public pubL_23_11_Response()
        {
            this.pubL_23_11_InfoList = new ObservableCollection<pubL_23_11_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_23_11_Info> pubL_23_11_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_23_11_Info info = new pubL_23_11_Info();
            info.fee_tmplat_no = unpacker.GetInt("fee_tmplat_no");
            pubL_23_11_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_23_11_InfoList.Add((pubL_23_11_Info)info);
        }
        #endregion

        //逻辑_公共_证券费用客户端_新增证券费用模板
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_23_11_Info();
                info.fee_tmplat_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_INT);
                pubL_23_11_InfoList.Add(info);
            }
        }
    }

    public class pubL_23_12_Response : IResponse
    {
        #region 构造函数
        public pubL_23_12_Response()
        {
            this.pubL_23_12_InfoList = new ObservableCollection<pubL_23_12_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_23_12_Info> pubL_23_12_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_23_12_Info info = new pubL_23_12_Info();
            pubL_23_12_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_23_12_InfoList.Add((pubL_23_12_Info)info);
        }
        #endregion

        //逻辑_公共_证券费用客户端_修改证券费用模板
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_23_12_Info();
                pubL_23_12_InfoList.Add(info);
            }
        }
    }

    public class pubL_23_13_Response : IResponse
    {
        #region 构造函数
        public pubL_23_13_Response()
        {
            this.pubL_23_13_InfoList = new ObservableCollection<pubL_23_13_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_23_13_Info> pubL_23_13_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_23_13_Info info = new pubL_23_13_Info();
            pubL_23_13_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_23_13_InfoList.Add((pubL_23_13_Info)info);
        }
        #endregion

        //逻辑_公共_证券费用客户端_删除证券费用模板
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_23_13_Info();
                pubL_23_13_InfoList.Add(info);
            }
        }
    }

    public class pubL_23_14_Response : IResponse
    {
        #region 构造函数
        public pubL_23_14_Response()
        {
            this.pubL_23_14_InfoList = new ObservableCollection<pubL_23_14_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_23_14_Info> pubL_23_14_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_23_14_Info info = new pubL_23_14_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.fee_tmplat_no = unpacker.GetInt("fee_tmplat_no");
            info.fee_tmplat_name = unpacker.GetStr("fee_tmplat_name");
            info.fee_tmplat_kind = unpacker.GetInt("fee_tmplat_kind");
            info.remark_info = unpacker.GetStr("remark_info");
            pubL_23_14_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_23_14_InfoList.Add((pubL_23_14_Info)info);
        }
        #endregion

        //逻辑_公共_证券费用客户端_查询证券费用模板
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_23_14_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.fee_tmplat_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_INT);
                    info.fee_tmplat_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NAME_STR);
                    info.fee_tmplat_kind = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_KIND_INT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    pubL_23_14_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_23_15_Response : IResponse
    {
        #region 构造函数
        public pubL_23_15_Response()
        {
            this.pubL_23_15_InfoList = new ObservableCollection<pubL_23_15_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_23_15_Info> pubL_23_15_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_23_15_Info info = new pubL_23_15_Info();
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
            info.co_no = unpacker.GetInt("co_no");
            info.fee_tmplat_no = unpacker.GetInt("fee_tmplat_no");
            info.fee_tmplat_name = unpacker.GetStr("fee_tmplat_name");
            info.fee_tmplat_kind = unpacker.GetInt("fee_tmplat_kind");
            info.remark_info = unpacker.GetStr("remark_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pubL_23_15_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_23_15_InfoList.Add((pubL_23_15_Info)info);
        }
        #endregion

        //逻辑_公共_证券费用客户端_查询证券费用模板流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_23_15_Info();
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
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.fee_tmplat_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_INT);
                    info.fee_tmplat_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NAME_STR);
                    info.fee_tmplat_kind = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_KIND_INT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pubL_23_15_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_23_16_Response : IResponse
    {
        #region 构造函数
        public pubL_23_16_Response()
        {
            this.pubL_23_16_InfoList = new ObservableCollection<pubL_23_16_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_23_16_Info> pubL_23_16_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_23_16_Info info = new pubL_23_16_Info();
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
            info.co_no = unpacker.GetInt("co_no");
            info.fee_tmplat_no = unpacker.GetInt("fee_tmplat_no");
            info.fee_tmplat_name = unpacker.GetStr("fee_tmplat_name");
            info.fee_tmplat_kind = unpacker.GetInt("fee_tmplat_kind");
            info.remark_info = unpacker.GetStr("remark_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pubL_23_16_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_23_16_InfoList.Add((pubL_23_16_Info)info);
        }
        #endregion

        //逻辑_公共_证券费用客户端_查询历史证券费用模板流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_23_16_Info();
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
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.fee_tmplat_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_INT);
                    info.fee_tmplat_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NAME_STR);
                    info.fee_tmplat_kind = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_KIND_INT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pubL_23_16_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_23_17_Response : IResponse
    {
        #region 构造函数
        public pubL_23_17_Response()
        {
            this.pubL_23_17_InfoList = new ObservableCollection<pubL_23_17_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_23_17_Info> pubL_23_17_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_23_17_Info info = new pubL_23_17_Info();
            info.fee_tmplat_no = unpacker.GetInt("fee_tmplat_no");
            pubL_23_17_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_23_17_InfoList.Add((pubL_23_17_Info)info);
        }
        #endregion

        //逻辑_公共_证券费用客户端_复制证券费用模板
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_23_17_Info();
                info.fee_tmplat_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_INT);
                pubL_23_17_InfoList.Add(info);
            }
        }
    }

    public class pubL_23_21_Response : IResponse
    {
        #region 构造函数
        public pubL_23_21_Response()
        {
            this.pubL_23_21_InfoList = new ObservableCollection<pubL_23_21_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_23_21_Info> pubL_23_21_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_23_21_Info info = new pubL_23_21_Info();
            pubL_23_21_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_23_21_InfoList.Add((pubL_23_21_Info)info);
        }
        #endregion

        //逻辑_公共_证券费用客户端_新增证券类型费用模板明细
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_23_21_Info();
                pubL_23_21_InfoList.Add(info);
            }
        }
    }

    public class pubL_23_22_Response : IResponse
    {
        #region 构造函数
        public pubL_23_22_Response()
        {
            this.pubL_23_22_InfoList = new ObservableCollection<pubL_23_22_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_23_22_Info> pubL_23_22_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_23_22_Info info = new pubL_23_22_Info();
            pubL_23_22_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_23_22_InfoList.Add((pubL_23_22_Info)info);
        }
        #endregion

        //逻辑_公共_证券费用客户端_修改证券类型费用模板明细
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_23_22_Info();
                pubL_23_22_InfoList.Add(info);
            }
        }
    }

    public class pubL_23_23_Response : IResponse
    {
        #region 构造函数
        public pubL_23_23_Response()
        {
            this.pubL_23_23_InfoList = new ObservableCollection<pubL_23_23_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_23_23_Info> pubL_23_23_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_23_23_Info info = new pubL_23_23_Info();
            pubL_23_23_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_23_23_InfoList.Add((pubL_23_23_Info)info);
        }
        #endregion

        //逻辑_公共_证券费用客户端_删除证券类型费用模板明细
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_23_23_Info();
                pubL_23_23_InfoList.Add(info);
            }
        }
    }

    public class pubL_23_24_Response : IResponse
    {
        #region 构造函数
        public pubL_23_24_Response()
        {
            this.pubL_23_24_InfoList = new ObservableCollection<pubL_23_24_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_23_24_Info> pubL_23_24_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_23_24_Info info = new pubL_23_24_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_type = unpacker.GetInt("stock_type");
            info.co_no = unpacker.GetInt("co_no");
            info.fee_no = unpacker.GetInt("fee_no");
            info.fee_tmplat_no = unpacker.GetInt("fee_tmplat_no");
            info.secu_fee_type = unpacker.GetInt("secu_fee_type");
            info.order_dir = unpacker.GetInt("order_dir");
            info.amt_ratio = unpacker.GetDouble("amt_ratio");
            info.amt_value = unpacker.GetDouble("amt_value");
            info.par_value_ratio = unpacker.GetDouble("par_value_ratio");
            info.par_value_value = unpacker.GetDouble("par_value_value");
            info.max_fee = unpacker.GetDouble("max_fee");
            info.min_fee = unpacker.GetDouble("min_fee");
            info.remark_info = unpacker.GetStr("remark_info");
            pubL_23_24_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_23_24_InfoList.Add((pubL_23_24_Info)info);
        }
        #endregion

        //逻辑_公共_证券费用客户端_查询证券类型费用模板明细
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_23_24_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.fee_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_NO_INT);
                    info.fee_tmplat_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_INT);
                    info.secu_fee_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SECU_FEE_TYPE_INT);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.amt_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_RATIO_FLOAT);
                    info.amt_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_VALUE_FLOAT);
                    info.par_value_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_RATIO_FLOAT);
                    info.par_value_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_VALUE_FLOAT);
                    info.max_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_FEE_FLOAT);
                    info.min_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_FEE_FLOAT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    pubL_23_24_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_23_25_Response : IResponse
    {
        #region 构造函数
        public pubL_23_25_Response()
        {
            this.pubL_23_25_InfoList = new ObservableCollection<pubL_23_25_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_23_25_Info> pubL_23_25_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_23_25_Info info = new pubL_23_25_Info();
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
            info.co_no = unpacker.GetInt("co_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_type = unpacker.GetInt("stock_type");
            info.fee_tmplat_no = unpacker.GetInt("fee_tmplat_no");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pubL_23_25_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_23_25_InfoList.Add((pubL_23_25_Info)info);
        }
        #endregion

        //逻辑_公共_证券费用客户端_查询证券类型费用模板明细流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_23_25_Info();
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
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.fee_tmplat_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_INT);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pubL_23_25_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_23_26_Response : IResponse
    {
        #region 构造函数
        public pubL_23_26_Response()
        {
            this.pubL_23_26_InfoList = new ObservableCollection<pubL_23_26_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_23_26_Info> pubL_23_26_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_23_26_Info info = new pubL_23_26_Info();
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
            info.co_no = unpacker.GetInt("co_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_type = unpacker.GetInt("stock_type");
            info.fee_tmplat_no = unpacker.GetInt("fee_tmplat_no");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pubL_23_26_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_23_26_InfoList.Add((pubL_23_26_Info)info);
        }
        #endregion

        //逻辑_公共_证券费用客户端_查询历史证券类型费用模板明细流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_23_26_Info();
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
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.fee_tmplat_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_INT);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pubL_23_26_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_23_31_Response : IResponse
    {
        #region 构造函数
        public pubL_23_31_Response()
        {
            this.pubL_23_31_InfoList = new ObservableCollection<pubL_23_31_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_23_31_Info> pubL_23_31_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_23_31_Info info = new pubL_23_31_Info();
            pubL_23_31_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_23_31_InfoList.Add((pubL_23_31_Info)info);
        }
        #endregion

        //逻辑_公共_证券费用客户端_新增证券代码费用模板明细
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_23_31_Info();
                pubL_23_31_InfoList.Add(info);
            }
        }
    }

    public class pubL_23_32_Response : IResponse
    {
        #region 构造函数
        public pubL_23_32_Response()
        {
            this.pubL_23_32_InfoList = new ObservableCollection<pubL_23_32_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_23_32_Info> pubL_23_32_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_23_32_Info info = new pubL_23_32_Info();
            pubL_23_32_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_23_32_InfoList.Add((pubL_23_32_Info)info);
        }
        #endregion

        //逻辑_公共_证券费用客户端_修改证券代码费用模板明细
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_23_32_Info();
                pubL_23_32_InfoList.Add(info);
            }
        }
    }

    public class pubL_23_33_Response : IResponse
    {
        #region 构造函数
        public pubL_23_33_Response()
        {
            this.pubL_23_33_InfoList = new ObservableCollection<pubL_23_33_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_23_33_Info> pubL_23_33_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_23_33_Info info = new pubL_23_33_Info();
            pubL_23_33_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_23_33_InfoList.Add((pubL_23_33_Info)info);
        }
        #endregion

        //逻辑_公共_证券费用客户端_删除证券代码费用模板明细
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_23_33_Info();
                pubL_23_33_InfoList.Add(info);
            }
        }
    }

    public class pubL_23_34_Response : IResponse
    {
        #region 构造函数
        public pubL_23_34_Response()
        {
            this.pubL_23_34_InfoList = new ObservableCollection<pubL_23_34_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_23_34_Info> pubL_23_34_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_23_34_Info info = new pubL_23_34_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.fee_tmplat_no = unpacker.GetInt("fee_tmplat_no");
            info.co_no = unpacker.GetInt("co_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.fee_no = unpacker.GetInt("fee_no");
            info.secu_fee_type = unpacker.GetInt("secu_fee_type");
            info.order_dir = unpacker.GetInt("order_dir");
            info.amt_ratio = unpacker.GetDouble("amt_ratio");
            info.amt_value = unpacker.GetDouble("amt_value");
            info.par_value_ratio = unpacker.GetDouble("par_value_ratio");
            info.par_value_value = unpacker.GetDouble("par_value_value");
            info.max_fee = unpacker.GetDouble("max_fee");
            info.min_fee = unpacker.GetDouble("min_fee");
            info.remark_info = unpacker.GetStr("remark_info");
            pubL_23_34_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_23_34_InfoList.Add((pubL_23_34_Info)info);
        }
        #endregion

        //逻辑_公共_证券费用客户端_查询证券代码费用模板明细
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_23_34_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.fee_tmplat_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.fee_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_NO_INT);
                    info.secu_fee_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SECU_FEE_TYPE_INT);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.amt_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_RATIO_FLOAT);
                    info.amt_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_VALUE_FLOAT);
                    info.par_value_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_RATIO_FLOAT);
                    info.par_value_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_VALUE_FLOAT);
                    info.max_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_FEE_FLOAT);
                    info.min_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_FEE_FLOAT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    pubL_23_34_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_23_35_Response : IResponse
    {
        #region 构造函数
        public pubL_23_35_Response()
        {
            this.pubL_23_35_InfoList = new ObservableCollection<pubL_23_35_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_23_35_Info> pubL_23_35_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_23_35_Info info = new pubL_23_35_Info();
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
            info.co_no = unpacker.GetInt("co_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.fee_tmplat_no = unpacker.GetInt("fee_tmplat_no");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pubL_23_35_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_23_35_InfoList.Add((pubL_23_35_Info)info);
        }
        #endregion

        //逻辑_公共_证券费用客户端_查询证券代码费用模板明细流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_23_35_Info();
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
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.fee_tmplat_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_INT);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pubL_23_35_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_23_36_Response : IResponse
    {
        #region 构造函数
        public pubL_23_36_Response()
        {
            this.pubL_23_36_InfoList = new ObservableCollection<pubL_23_36_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_23_36_Info> pubL_23_36_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_23_36_Info info = new pubL_23_36_Info();
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
            info.co_no = unpacker.GetInt("co_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.fee_tmplat_no = unpacker.GetInt("fee_tmplat_no");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pubL_23_36_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_23_36_InfoList.Add((pubL_23_36_Info)info);
        }
        #endregion

        //逻辑_公共_证券费用客户端_查询历史证券代码费用模板明细流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_23_36_Info();
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
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.fee_tmplat_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_INT);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pubL_23_36_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_23_71_Response : IResponse
    {
        #region 构造函数
        public pubL_23_71_Response()
        {
            this.pubL_23_71_InfoList = new ObservableCollection<pubL_23_71_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_23_71_Info> pubL_23_71_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_23_71_Info info = new pubL_23_71_Info();
            pubL_23_71_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_23_71_InfoList.Add((pubL_23_71_Info)info);
        }
        #endregion

        //逻辑_公共_证券费用客户端_新增资产账户证券费用模板
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_23_71_Info();
                pubL_23_71_InfoList.Add(info);
            }
        }
    }

    public class pubL_23_72_Response : IResponse
    {
        #region 构造函数
        public pubL_23_72_Response()
        {
            this.pubL_23_72_InfoList = new ObservableCollection<pubL_23_72_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_23_72_Info> pubL_23_72_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_23_72_Info info = new pubL_23_72_Info();
            pubL_23_72_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_23_72_InfoList.Add((pubL_23_72_Info)info);
        }
        #endregion

        //逻辑_公共_证券费用客户端_修改资产账户证券费用模板
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_23_72_Info();
                pubL_23_72_InfoList.Add(info);
            }
        }
    }

    public class pubL_23_73_Response : IResponse
    {
        #region 构造函数
        public pubL_23_73_Response()
        {
            this.pubL_23_73_InfoList = new ObservableCollection<pubL_23_73_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_23_73_Info> pubL_23_73_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_23_73_Info info = new pubL_23_73_Info();
            pubL_23_73_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_23_73_InfoList.Add((pubL_23_73_Info)info);
        }
        #endregion

        //逻辑_公共_证券费用客户端_删除资产账户证券费用模板
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_23_73_Info();
                pubL_23_73_InfoList.Add(info);
            }
        }
    }

    public class pubL_23_74_Response : IResponse
    {
        #region 构造函数
        public pubL_23_74_Response()
        {
            this.pubL_23_74_InfoList = new ObservableCollection<pubL_23_74_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_23_74_Info> pubL_23_74_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_23_74_Info info = new pubL_23_74_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.co_no = unpacker.GetInt("co_no");
            info.secu_code_spec_fee_tmplat_no = unpacker.GetInt("secu_code_spec_fee_tmplat_no");
            info.secu_type_spec_fee_tmplat_no = unpacker.GetInt("secu_type_spec_fee_tmplat_no");
            info.secu_code_fee_tmplat_no = unpacker.GetInt("secu_code_fee_tmplat_no");
            info.secu_type_fee_tmplat_no = unpacker.GetInt("secu_type_fee_tmplat_no");
            info.secu_code_out_fee_tmplat_no = unpacker.GetInt("secu_code_out_fee_tmplat_no");
            info.secu_type_out_fee_tmplat_no = unpacker.GetInt("secu_type_out_fee_tmplat_no");
            pubL_23_74_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_23_74_InfoList.Add((pubL_23_74_Info)info);
        }
        #endregion

        //逻辑_公共_证券费用客户端_查询资产账户证券费用模板
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_23_74_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.secu_code_spec_fee_tmplat_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SECU_CODE_SPEC_FEE_TMPLAT_NO_INT);
                    info.secu_type_spec_fee_tmplat_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SECU_TYPE_SPEC_FEE_TMPLAT_NO_INT);
                    info.secu_code_fee_tmplat_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SECU_CODE_FEE_TMPLAT_NO_INT);
                    info.secu_type_fee_tmplat_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SECU_TYPE_FEE_TMPLAT_NO_INT);
                    info.secu_code_out_fee_tmplat_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SECU_CODE_OUT_FEE_TMPLAT_NO_INT);
                    info.secu_type_out_fee_tmplat_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SECU_TYPE_OUT_FEE_TMPLAT_NO_INT);
                    pubL_23_74_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_23_75_Response : IResponse
    {
        #region 构造函数
        public pubL_23_75_Response()
        {
            this.pubL_23_75_InfoList = new ObservableCollection<pubL_23_75_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_23_75_Info> pubL_23_75_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_23_75_Info info = new pubL_23_75_Info();
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
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.co_no = unpacker.GetInt("co_no");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pubL_23_75_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_23_75_InfoList.Add((pubL_23_75_Info)info);
        }
        #endregion

        //逻辑_公共_证券费用客户端_查询资产账户证券费用模板流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_23_75_Info();
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
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pubL_23_75_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_23_76_Response : IResponse
    {
        #region 构造函数
        public pubL_23_76_Response()
        {
            this.pubL_23_76_InfoList = new ObservableCollection<pubL_23_76_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_23_76_Info> pubL_23_76_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_23_76_Info info = new pubL_23_76_Info();
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
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.co_no = unpacker.GetInt("co_no");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pubL_23_76_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_23_76_InfoList.Add((pubL_23_76_Info)info);
        }
        #endregion

        //逻辑_公共_证券费用客户端_查询历史资产账户证券费用模板流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_23_76_Info();
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
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pubL_23_76_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_23_104_Response : IResponse
    {
        #region 构造函数
        public pubL_23_104_Response()
        {
            this.pubL_23_104_InfoList = new ObservableCollection<pubL_23_104_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_23_104_Info> pubL_23_104_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_23_104_Info info = new pubL_23_104_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_type = unpacker.GetInt("stock_type");
            info.fee_no = unpacker.GetInt("fee_no");
            info.secu_fee_type = unpacker.GetInt("secu_fee_type");
            info.order_dir = unpacker.GetInt("order_dir");
            info.amt_ratio = unpacker.GetDouble("amt_ratio");
            info.amt_value = unpacker.GetDouble("amt_value");
            info.par_value_ratio = unpacker.GetDouble("par_value_ratio");
            info.par_value_value = unpacker.GetDouble("par_value_value");
            info.max_fee = unpacker.GetDouble("max_fee");
            info.min_fee = unpacker.GetDouble("min_fee");
            pubL_23_104_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_23_104_InfoList.Add((pubL_23_104_Info)info);
        }
        #endregion

        //逻辑_公共_证券费用客户端_查询系统证券类型费用
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_23_104_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.fee_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_NO_INT);
                    info.secu_fee_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SECU_FEE_TYPE_INT);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.amt_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_RATIO_FLOAT);
                    info.amt_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_VALUE_FLOAT);
                    info.par_value_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_RATIO_FLOAT);
                    info.par_value_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_VALUE_FLOAT);
                    info.max_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_FEE_FLOAT);
                    info.min_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_FEE_FLOAT);
                    pubL_23_104_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_23_114_Response : IResponse
    {
        #region 构造函数
        public pubL_23_114_Response()
        {
            this.pubL_23_114_InfoList = new ObservableCollection<pubL_23_114_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_23_114_Info> pubL_23_114_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_23_114_Info info = new pubL_23_114_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.fee_no = unpacker.GetInt("fee_no");
            info.secu_fee_type = unpacker.GetInt("secu_fee_type");
            info.order_dir = unpacker.GetInt("order_dir");
            info.amt_ratio = unpacker.GetDouble("amt_ratio");
            info.amt_value = unpacker.GetDouble("amt_value");
            info.par_value_ratio = unpacker.GetDouble("par_value_ratio");
            info.par_value_value = unpacker.GetDouble("par_value_value");
            info.max_fee = unpacker.GetDouble("max_fee");
            info.min_fee = unpacker.GetDouble("min_fee");
            pubL_23_114_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_23_114_InfoList.Add((pubL_23_114_Info)info);
        }
        #endregion

        //逻辑_公共_证券费用客户端_查询系统证券代码费用
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_23_114_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.fee_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_NO_INT);
                    info.secu_fee_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SECU_FEE_TYPE_INT);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.amt_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_RATIO_FLOAT);
                    info.amt_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_VALUE_FLOAT);
                    info.par_value_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_RATIO_FLOAT);
                    info.par_value_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_VALUE_FLOAT);
                    info.max_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_FEE_FLOAT);
                    info.min_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_FEE_FLOAT);
                    pubL_23_114_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_23_161_Response : IResponse
    {
        #region 构造函数
        public pubL_23_161_Response()
        {
            this.pubL_23_161_InfoList = new ObservableCollection<pubL_23_161_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_23_161_Info> pubL_23_161_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_23_161_Info info = new pubL_23_161_Info();
            pubL_23_161_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_23_161_InfoList.Add((pubL_23_161_Info)info);
        }
        #endregion

        //逻辑_公共_证券费用客户端_新增产品费用
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_23_161_Info();
                pubL_23_161_InfoList.Add(info);
            }
        }
    }

    public class pubL_23_162_Response : IResponse
    {
        #region 构造函数
        public pubL_23_162_Response()
        {
            this.pubL_23_162_InfoList = new ObservableCollection<pubL_23_162_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_23_162_Info> pubL_23_162_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_23_162_Info info = new pubL_23_162_Info();
            pubL_23_162_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_23_162_InfoList.Add((pubL_23_162_Info)info);
        }
        #endregion

        //逻辑_公共_证券费用客户端_修改产品费用
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_23_162_Info();
                pubL_23_162_InfoList.Add(info);
            }
        }
    }

    public class pubL_23_163_Response : IResponse
    {
        #region 构造函数
        public pubL_23_163_Response()
        {
            this.pubL_23_163_InfoList = new ObservableCollection<pubL_23_163_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_23_163_Info> pubL_23_163_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_23_163_Info info = new pubL_23_163_Info();
            pubL_23_163_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_23_163_InfoList.Add((pubL_23_163_Info)info);
        }
        #endregion

        //逻辑_公共_证券费用客户端_删除产品费用
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_23_163_Info();
                pubL_23_163_InfoList.Add(info);
            }
        }
    }

    public class pubL_23_164_Response : IResponse
    {
        #region 构造函数
        public pubL_23_164_Response()
        {
            this.pubL_23_164_InfoList = new ObservableCollection<pubL_23_164_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_23_164_Info> pubL_23_164_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_23_164_Info info = new pubL_23_164_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.pd_fee_type = unpacker.GetInt("pd_fee_type");
            info.pd_fee_name = unpacker.GetStr("pd_fee_name");
            info.pd_fee_rate = unpacker.GetDouble("pd_fee_rate");
            info.pd_fee_cacl_type = unpacker.GetInt("pd_fee_cacl_type");
            info.pd_fee_cacl_base = unpacker.GetDouble("pd_fee_cacl_base");
            info.min_fee = unpacker.GetDouble("min_fee");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.remark_info = unpacker.GetStr("remark_info");
            pubL_23_164_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_23_164_InfoList.Add((pubL_23_164_Info)info);
        }
        #endregion

        //逻辑_公共_证券费用客户端_查询产品费用
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_23_164_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.pd_fee_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_FEE_TYPE_INT);
                    info.pd_fee_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_FEE_NAME_STR);
                    info.pd_fee_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_FEE_RATE_FLOAT);
                    info.pd_fee_cacl_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_FEE_CACL_TYPE_INT);
                    info.pd_fee_cacl_base = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_FEE_CACL_BASE_FLOAT);
                    info.min_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_FEE_FLOAT);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    pubL_23_164_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_23_165_Response : IResponse
    {
        #region 构造函数
        public pubL_23_165_Response()
        {
            this.pubL_23_165_InfoList = new ObservableCollection<pubL_23_165_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_23_165_Info> pubL_23_165_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_23_165_Info info = new pubL_23_165_Info();
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
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.pd_fee_type = unpacker.GetInt("pd_fee_type");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pubL_23_165_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_23_165_InfoList.Add((pubL_23_165_Info)info);
        }
        #endregion

        //逻辑_公共_证券费用客户端_查询产品费用流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_23_165_Info();
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
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.pd_fee_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_FEE_TYPE_INT);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pubL_23_165_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_23_166_Response : IResponse
    {
        #region 构造函数
        public pubL_23_166_Response()
        {
            this.pubL_23_166_InfoList = new ObservableCollection<pubL_23_166_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_23_166_Info> pubL_23_166_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_23_166_Info info = new pubL_23_166_Info();
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
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.pd_fee_type = unpacker.GetInt("pd_fee_type");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pubL_23_166_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_23_166_InfoList.Add((pubL_23_166_Info)info);
        }
        #endregion

        //逻辑_公共_证券费用客户端_查询历史产品费用流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_23_166_Info();
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
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.pd_fee_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_FEE_TYPE_INT);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pubL_23_166_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_23_201_Response : IResponse
    {
        #region 构造函数
        public pubL_23_201_Response()
        {
            this.pubL_23_201_InfoList = new ObservableCollection<pubL_23_201_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_23_201_Info> pubL_23_201_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_23_201_Info info = new pubL_23_201_Info();
            info.stamp_tax = unpacker.GetDouble("stamp_tax");
            info.trans_fee = unpacker.GetDouble("trans_fee");
            info.brkage_fee = unpacker.GetDouble("brkage_fee");
            info.SEC_charges = unpacker.GetDouble("SEC_charges");
            info.other_fee = unpacker.GetDouble("other_fee");
            info.trade_commis = unpacker.GetDouble("trade_commis");
            info.other_commis = unpacker.GetDouble("other_commis");
            pubL_23_201_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_23_201_InfoList.Add((pubL_23_201_Info)info);
        }
        #endregion

        //逻辑_公共_证券费用客户端_计算证券费用
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_23_201_Info();
                info.stamp_tax = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STAMP_TAX_FLOAT);
                info.trans_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_FEE_FLOAT);
                info.brkage_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BRKAGE_FEE_FLOAT);
                info.SEC_charges = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SEC_CHARGES_FLOAT);
                info.other_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_FEE_FLOAT);
                info.trade_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_COMMIS_FLOAT);
                info.other_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_COMMIS_FLOAT);
                pubL_23_201_InfoList.Add(info);
            }
        }
    }

    public class pubL_23_302_Response : IResponse
    {
        #region 构造函数
        public pubL_23_302_Response()
        {
            this.pubL_23_302_InfoList = new ObservableCollection<pubL_23_302_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_23_302_Info> pubL_23_302_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_23_302_Info info = new pubL_23_302_Info();
            info.fee_no = unpacker.GetInt("fee_no");
            info.secu_fee_type = unpacker.GetInt("secu_fee_type");
            info.order_dir = unpacker.GetInt("order_dir");
            info.contrc_dir = unpacker.GetInt("contrc_dir");
            info.remark_info = unpacker.GetStr("remark_info");
            pubL_23_302_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_23_302_InfoList.Add((pubL_23_302_Info)info);
        }
        #endregion

        //逻辑_公共_证券费用客户端_查询费用编号
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_23_302_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.fee_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_NO_INT);
                    info.secu_fee_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SECU_FEE_TYPE_INT);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.contrc_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_DIR_INT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    pubL_23_302_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_23_167_Response : IResponse
    {
        #region 构造函数
        public pubL_23_167_Response()
        {
            this.pubL_23_167_InfoList = new ObservableCollection<pubL_23_167_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_23_167_Info> pubL_23_167_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_23_167_Info info = new pubL_23_167_Info();
            pubL_23_167_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_23_167_InfoList.Add((pubL_23_167_Info)info);
        }
        #endregion

        //逻辑_公共_证券费用客户端_模板编号删除证券费用明细
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_23_167_Info();
                pubL_23_167_InfoList.Add(info);
            }
        }
    }

}
