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
    public class pubL_18_41_Response : IResponse
    {
        #region 构造函数
        public pubL_18_41_Response()
        {
            this.pubL_18_41_InfoList = new ObservableCollection<pubL_18_41_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_18_41_Info> pubL_18_41_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_18_41_Info info = new pubL_18_41_Info();
            info.fee_tmplat_no = unpacker.GetInt("fee_tmplat_no");
            pubL_18_41_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_18_41_InfoList.Add((pubL_18_41_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用客户端_新增期货费用模板
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_18_41_Info();
                info.fee_tmplat_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_INT);
                pubL_18_41_InfoList.Add(info);
            }
        }
    }

    public class pubL_18_42_Response : IResponse
    {
        #region 构造函数
        public pubL_18_42_Response()
        {
            this.pubL_18_42_InfoList = new ObservableCollection<pubL_18_42_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_18_42_Info> pubL_18_42_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_18_42_Info info = new pubL_18_42_Info();
            pubL_18_42_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_18_42_InfoList.Add((pubL_18_42_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用客户端_修改期货费用模板
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_18_42_Info();
                pubL_18_42_InfoList.Add(info);
            }
        }
    }

    public class pubL_18_43_Response : IResponse
    {
        #region 构造函数
        public pubL_18_43_Response()
        {
            this.pubL_18_43_InfoList = new ObservableCollection<pubL_18_43_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_18_43_Info> pubL_18_43_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_18_43_Info info = new pubL_18_43_Info();
            pubL_18_43_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_18_43_InfoList.Add((pubL_18_43_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用客户端_删除期货费用模板
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_18_43_Info();
                pubL_18_43_InfoList.Add(info);
            }
        }
    }

    public class pubL_18_44_Response : IResponse
    {
        #region 构造函数
        public pubL_18_44_Response()
        {
            this.pubL_18_44_InfoList = new ObservableCollection<pubL_18_44_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_18_44_Info> pubL_18_44_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_18_44_Info info = new pubL_18_44_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.fee_tmplat_no = unpacker.GetInt("fee_tmplat_no");
            info.fee_tmplat_name = unpacker.GetStr("fee_tmplat_name");
            info.fee_tmplat_kind = unpacker.GetInt("fee_tmplat_kind");
            info.remark_info = unpacker.GetStr("remark_info");
            pubL_18_44_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_18_44_InfoList.Add((pubL_18_44_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用客户端_查询期货费用模板
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_18_44_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.fee_tmplat_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_INT);
                    info.fee_tmplat_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NAME_STR);
                    info.fee_tmplat_kind = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_KIND_INT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    pubL_18_44_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_18_45_Response : IResponse
    {
        #region 构造函数
        public pubL_18_45_Response()
        {
            this.pubL_18_45_InfoList = new ObservableCollection<pubL_18_45_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_18_45_Info> pubL_18_45_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_18_45_Info info = new pubL_18_45_Info();
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
            pubL_18_45_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_18_45_InfoList.Add((pubL_18_45_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用客户端_查询期货费用模板流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_18_45_Info();
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
                    pubL_18_45_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_18_46_Response : IResponse
    {
        #region 构造函数
        public pubL_18_46_Response()
        {
            this.pubL_18_46_InfoList = new ObservableCollection<pubL_18_46_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_18_46_Info> pubL_18_46_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_18_46_Info info = new pubL_18_46_Info();
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
            pubL_18_46_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_18_46_InfoList.Add((pubL_18_46_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用客户端_查询历史期货费用模板流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_18_46_Info();
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
                    pubL_18_46_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_18_51_Response : IResponse
    {
        #region 构造函数
        public pubL_18_51_Response()
        {
            this.pubL_18_51_InfoList = new ObservableCollection<pubL_18_51_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_18_51_Info> pubL_18_51_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_18_51_Info info = new pubL_18_51_Info();
            pubL_18_51_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_18_51_InfoList.Add((pubL_18_51_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用客户端_新增合约类型费用模板明细
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_18_51_Info();
                pubL_18_51_InfoList.Add(info);
            }
        }
    }

    public class pubL_18_52_Response : IResponse
    {
        #region 构造函数
        public pubL_18_52_Response()
        {
            this.pubL_18_52_InfoList = new ObservableCollection<pubL_18_52_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_18_52_Info> pubL_18_52_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_18_52_Info info = new pubL_18_52_Info();
            pubL_18_52_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_18_52_InfoList.Add((pubL_18_52_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用客户端_修改合约类型费用模板明细
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_18_52_Info();
                pubL_18_52_InfoList.Add(info);
            }
        }
    }

    public class pubL_18_53_Response : IResponse
    {
        #region 构造函数
        public pubL_18_53_Response()
        {
            this.pubL_18_53_InfoList = new ObservableCollection<pubL_18_53_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_18_53_Info> pubL_18_53_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_18_53_Info info = new pubL_18_53_Info();
            pubL_18_53_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_18_53_InfoList.Add((pubL_18_53_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用客户端_删除合约类型费用模板明细
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_18_53_Info();
                pubL_18_53_InfoList.Add(info);
            }
        }
    }

    public class pubL_18_54_Response : IResponse
    {
        #region 构造函数
        public pubL_18_54_Response()
        {
            this.pubL_18_54_InfoList = new ObservableCollection<pubL_18_54_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_18_54_Info> pubL_18_54_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_18_54_Info info = new pubL_18_54_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.fee_tmplat_no = unpacker.GetInt("fee_tmplat_no");
            info.co_no = unpacker.GetInt("co_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.contrc_type = unpacker.GetInt("contrc_type");
            info.fee_no = unpacker.GetInt("fee_no");
            info.futu_fee_type = unpacker.GetInt("futu_fee_type");
            info.order_dir = unpacker.GetInt("order_dir");
            info.contrc_dir = unpacker.GetInt("contrc_dir");
            info.amt_ratio = unpacker.GetDouble("amt_ratio");
            info.amt_value = unpacker.GetDouble("amt_value");
            info.par_value_ratio = unpacker.GetDouble("par_value_ratio");
            info.par_value_value = unpacker.GetDouble("par_value_value");
            info.max_fee = unpacker.GetDouble("max_fee");
            info.min_fee = unpacker.GetDouble("min_fee");
            info.remark_info = unpacker.GetStr("remark_info");
            info.hedge_type = unpacker.GetInt("hedge_type");
            pubL_18_54_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_18_54_InfoList.Add((pubL_18_54_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用客户端_查询合约类型费用模板明细
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_18_54_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.fee_tmplat_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    info.fee_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_NO_INT);
                    info.futu_fee_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_FEE_TYPE_INT);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.contrc_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_DIR_INT);
                    info.amt_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_RATIO_FLOAT);
                    info.amt_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_VALUE_FLOAT);
                    info.par_value_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_RATIO_FLOAT);
                    info.par_value_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_VALUE_FLOAT);
                    info.max_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_FEE_FLOAT);
                    info.min_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_FEE_FLOAT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    info.hedge_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT);
                    pubL_18_54_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_18_55_Response : IResponse
    {
        #region 构造函数
        public pubL_18_55_Response()
        {
            this.pubL_18_55_InfoList = new ObservableCollection<pubL_18_55_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_18_55_Info> pubL_18_55_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_18_55_Info info = new pubL_18_55_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.opor_co_no = unpacker.GetInt("opor_co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.oper_mac = unpacker.GetStr("oper_mac");
            info.oper_ip_addr = unpacker.GetStr("oper_ip_addr");
            info.oper_info = unpacker.GetStr("oper_info");
            info.oper_way = unpacker.GetStr("oper_way");
            info.oper_func_code = unpacker.GetStr("oper_func_code");
            info.oper_menu_no = unpacker.GetInt("oper_menu_no");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.contrc_type = unpacker.GetInt("contrc_type");
            info.fee_tmplat_no = unpacker.GetInt("fee_tmplat_no");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pubL_18_55_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_18_55_InfoList.Add((pubL_18_55_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用客户端_查询合约类型费用模板明细流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_18_55_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    info.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    info.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    info.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    info.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    info.oper_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MENU_NO_INT);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    info.fee_tmplat_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_INT);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pubL_18_55_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_18_56_Response : IResponse
    {
        #region 构造函数
        public pubL_18_56_Response()
        {
            this.pubL_18_56_InfoList = new ObservableCollection<pubL_18_56_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_18_56_Info> pubL_18_56_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_18_56_Info info = new pubL_18_56_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.opor_co_no = unpacker.GetInt("opor_co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.oper_mac = unpacker.GetStr("oper_mac");
            info.oper_ip_addr = unpacker.GetStr("oper_ip_addr");
            info.oper_info = unpacker.GetStr("oper_info");
            info.oper_way = unpacker.GetStr("oper_way");
            info.oper_func_code = unpacker.GetStr("oper_func_code");
            info.oper_menu_no = unpacker.GetInt("oper_menu_no");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.contrc_type = unpacker.GetInt("contrc_type");
            info.fee_tmplat_no = unpacker.GetInt("fee_tmplat_no");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pubL_18_56_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_18_56_InfoList.Add((pubL_18_56_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用客户端_查询历史合约类型费用模板明细流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_18_56_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    info.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    info.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    info.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    info.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    info.oper_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MENU_NO_INT);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    info.fee_tmplat_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_INT);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pubL_18_56_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_18_61_Response : IResponse
    {
        #region 构造函数
        public pubL_18_61_Response()
        {
            this.pubL_18_61_InfoList = new ObservableCollection<pubL_18_61_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_18_61_Info> pubL_18_61_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_18_61_Info info = new pubL_18_61_Info();
            pubL_18_61_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_18_61_InfoList.Add((pubL_18_61_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用客户端_新增合约代码费用模板明细
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_18_61_Info();
                pubL_18_61_InfoList.Add(info);
            }
        }
    }

    public class pubL_18_62_Response : IResponse
    {
        #region 构造函数
        public pubL_18_62_Response()
        {
            this.pubL_18_62_InfoList = new ObservableCollection<pubL_18_62_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_18_62_Info> pubL_18_62_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_18_62_Info info = new pubL_18_62_Info();
            pubL_18_62_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_18_62_InfoList.Add((pubL_18_62_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用客户端_修改合约代码费用模板明细
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_18_62_Info();
                pubL_18_62_InfoList.Add(info);
            }
        }
    }

    public class pubL_18_63_Response : IResponse
    {
        #region 构造函数
        public pubL_18_63_Response()
        {
            this.pubL_18_63_InfoList = new ObservableCollection<pubL_18_63_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_18_63_Info> pubL_18_63_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_18_63_Info info = new pubL_18_63_Info();
            pubL_18_63_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_18_63_InfoList.Add((pubL_18_63_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用客户端_删除合约代码费用模板明细
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_18_63_Info();
                pubL_18_63_InfoList.Add(info);
            }
        }
    }

    public class pubL_18_64_Response : IResponse
    {
        #region 构造函数
        public pubL_18_64_Response()
        {
            this.pubL_18_64_InfoList = new ObservableCollection<pubL_18_64_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_18_64_Info> pubL_18_64_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_18_64_Info info = new pubL_18_64_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.fee_tmplat_no = unpacker.GetInt("fee_tmplat_no");
            info.co_no = unpacker.GetInt("co_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.contrc_code_no = unpacker.GetInt("contrc_code_no");
            info.fee_no = unpacker.GetInt("fee_no");
            info.futu_fee_type = unpacker.GetInt("futu_fee_type");
            info.order_dir = unpacker.GetInt("order_dir");
            info.contrc_dir = unpacker.GetInt("contrc_dir");
            info.amt_ratio = unpacker.GetDouble("amt_ratio");
            info.amt_value = unpacker.GetDouble("amt_value");
            info.par_value_ratio = unpacker.GetDouble("par_value_ratio");
            info.par_value_value = unpacker.GetDouble("par_value_value");
            info.max_fee = unpacker.GetDouble("max_fee");
            info.min_fee = unpacker.GetDouble("min_fee");
            info.remark_info = unpacker.GetStr("remark_info");
            info.hedge_type = unpacker.GetInt("hedge_type");
            pubL_18_64_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_18_64_InfoList.Add((pubL_18_64_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用客户端_查询合约代码费用模板明细
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_18_64_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.fee_tmplat_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    info.fee_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_NO_INT);
                    info.futu_fee_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_FEE_TYPE_INT);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.contrc_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_DIR_INT);
                    info.amt_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_RATIO_FLOAT);
                    info.amt_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_VALUE_FLOAT);
                    info.par_value_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_RATIO_FLOAT);
                    info.par_value_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_VALUE_FLOAT);
                    info.max_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_FEE_FLOAT);
                    info.min_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_FEE_FLOAT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    info.hedge_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT);
                    pubL_18_64_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_18_65_Response : IResponse
    {
        #region 构造函数
        public pubL_18_65_Response()
        {
            this.pubL_18_65_InfoList = new ObservableCollection<pubL_18_65_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_18_65_Info> pubL_18_65_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_18_65_Info info = new pubL_18_65_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.opor_co_no = unpacker.GetInt("opor_co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.oper_mac = unpacker.GetStr("oper_mac");
            info.oper_ip_addr = unpacker.GetStr("oper_ip_addr");
            info.oper_info = unpacker.GetStr("oper_info");
            info.oper_way = unpacker.GetStr("oper_way");
            info.oper_func_code = unpacker.GetStr("oper_func_code");
            info.oper_menu_no = unpacker.GetInt("oper_menu_no");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.contrc_code_no = unpacker.GetInt("contrc_code_no");
            info.fee_tmplat_no = unpacker.GetInt("fee_tmplat_no");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pubL_18_65_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_18_65_InfoList.Add((pubL_18_65_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用客户端_查询合约代码费用模板明细流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_18_65_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    info.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    info.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    info.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    info.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    info.oper_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MENU_NO_INT);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    info.fee_tmplat_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_INT);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pubL_18_65_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_18_66_Response : IResponse
    {
        #region 构造函数
        public pubL_18_66_Response()
        {
            this.pubL_18_66_InfoList = new ObservableCollection<pubL_18_66_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_18_66_Info> pubL_18_66_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_18_66_Info info = new pubL_18_66_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.opor_co_no = unpacker.GetInt("opor_co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.oper_mac = unpacker.GetStr("oper_mac");
            info.oper_ip_addr = unpacker.GetStr("oper_ip_addr");
            info.oper_info = unpacker.GetStr("oper_info");
            info.oper_way = unpacker.GetStr("oper_way");
            info.oper_func_code = unpacker.GetStr("oper_func_code");
            info.oper_menu_no = unpacker.GetInt("oper_menu_no");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.contrc_code_no = unpacker.GetInt("contrc_code_no");
            info.fee_tmplat_no = unpacker.GetInt("fee_tmplat_no");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pubL_18_66_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_18_66_InfoList.Add((pubL_18_66_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用客户端_查询历史合约代码费用模板明细流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_18_66_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    info.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    info.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    info.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    info.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    info.oper_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MENU_NO_INT);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    info.fee_tmplat_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_INT);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pubL_18_66_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_18_71_Response : IResponse
    {
        #region 构造函数
        public pubL_18_71_Response()
        {
            this.pubL_18_71_InfoList = new ObservableCollection<pubL_18_71_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_18_71_Info> pubL_18_71_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_18_71_Info info = new pubL_18_71_Info();
            pubL_18_71_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_18_71_InfoList.Add((pubL_18_71_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用客户端_新增资产账户期货费用模板
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_18_71_Info();
                pubL_18_71_InfoList.Add(info);
            }
        }
    }

    public class pubL_18_72_Response : IResponse
    {
        #region 构造函数
        public pubL_18_72_Response()
        {
            this.pubL_18_72_InfoList = new ObservableCollection<pubL_18_72_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_18_72_Info> pubL_18_72_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_18_72_Info info = new pubL_18_72_Info();
            pubL_18_72_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_18_72_InfoList.Add((pubL_18_72_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用客户端_修改资产账户期货费用模板
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_18_72_Info();
                pubL_18_72_InfoList.Add(info);
            }
        }
    }

    public class pubL_18_73_Response : IResponse
    {
        #region 构造函数
        public pubL_18_73_Response()
        {
            this.pubL_18_73_InfoList = new ObservableCollection<pubL_18_73_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_18_73_Info> pubL_18_73_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_18_73_Info info = new pubL_18_73_Info();
            pubL_18_73_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_18_73_InfoList.Add((pubL_18_73_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用客户端_删除资产账户期货费用模板
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_18_73_Info();
                pubL_18_73_InfoList.Add(info);
            }
        }
    }

    public class pubL_18_74_Response : IResponse
    {
        #region 构造函数
        public pubL_18_74_Response()
        {
            this.pubL_18_74_InfoList = new ObservableCollection<pubL_18_74_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_18_74_Info> pubL_18_74_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_18_74_Info info = new pubL_18_74_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.co_no = unpacker.GetInt("co_no");
            info.futu_code_spec_fee_tmplat_no = unpacker.GetInt("futu_code_spec_fee_tmplat_no");
            info.futu_type_spec_fee_tmplat_no = unpacker.GetInt("futu_type_spec_fee_tmplat_no");
            info.futu_code_fee_tmplat_no = unpacker.GetInt("futu_code_fee_tmplat_no");
            info.futu_type_fee_tmplat_no = unpacker.GetInt("futu_type_fee_tmplat_no");
            info.futu_code_out_fee_tmplat_no = unpacker.GetInt("futu_code_out_fee_tmplat_no");
            info.futu_type_out_fee_tmplat_no = unpacker.GetInt("futu_type_out_fee_tmplat_no");
            pubL_18_74_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_18_74_InfoList.Add((pubL_18_74_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用客户端_查询资产账户期货费用模板
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_18_74_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.futu_code_spec_fee_tmplat_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_CODE_SPEC_FEE_TMPLAT_NO_INT);
                    info.futu_type_spec_fee_tmplat_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_TYPE_SPEC_FEE_TMPLAT_NO_INT);
                    info.futu_code_fee_tmplat_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_CODE_FEE_TMPLAT_NO_INT);
                    info.futu_type_fee_tmplat_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_TYPE_FEE_TMPLAT_NO_INT);
                    info.futu_code_out_fee_tmplat_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_CODE_OUT_FEE_TMPLAT_NO_INT);
                    info.futu_type_out_fee_tmplat_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_TYPE_OUT_FEE_TMPLAT_NO_INT);
                    pubL_18_74_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_18_75_Response : IResponse
    {
        #region 构造函数
        public pubL_18_75_Response()
        {
            this.pubL_18_75_InfoList = new ObservableCollection<pubL_18_75_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_18_75_Info> pubL_18_75_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_18_75_Info info = new pubL_18_75_Info();
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
            pubL_18_75_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_18_75_InfoList.Add((pubL_18_75_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用客户端_查询资产账户期货费用模板流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_18_75_Info();
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
                    pubL_18_75_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_18_76_Response : IResponse
    {
        #region 构造函数
        public pubL_18_76_Response()
        {
            this.pubL_18_76_InfoList = new ObservableCollection<pubL_18_76_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_18_76_Info> pubL_18_76_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_18_76_Info info = new pubL_18_76_Info();
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
            pubL_18_76_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_18_76_InfoList.Add((pubL_18_76_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用客户端_查询历史资产账户期货费用模板流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_18_76_Info();
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
                    pubL_18_76_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_18_144_Response : IResponse
    {
        #region 构造函数
        public pubL_18_144_Response()
        {
            this.pubL_18_144_InfoList = new ObservableCollection<pubL_18_144_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_18_144_Info> pubL_18_144_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_18_144_Info info = new pubL_18_144_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.exch_no = unpacker.GetInt("exch_no");
            info.contrc_type = unpacker.GetInt("contrc_type");
            info.fee_no = unpacker.GetInt("fee_no");
            info.futu_fee_type = unpacker.GetInt("futu_fee_type");
            info.order_dir = unpacker.GetInt("order_dir");
            info.contrc_dir = unpacker.GetInt("contrc_dir");
            info.amt_ratio = unpacker.GetDouble("amt_ratio");
            info.amt_value = unpacker.GetDouble("amt_value");
            info.par_value_ratio = unpacker.GetDouble("par_value_ratio");
            info.par_value_value = unpacker.GetDouble("par_value_value");
            info.max_fee = unpacker.GetDouble("max_fee");
            info.min_fee = unpacker.GetDouble("min_fee");
            pubL_18_144_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_18_144_InfoList.Add((pubL_18_144_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用客户端_查询系统合约类型费用
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_18_144_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    info.fee_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_NO_INT);
                    info.futu_fee_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_FEE_TYPE_INT);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.contrc_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_DIR_INT);
                    info.amt_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_RATIO_FLOAT);
                    info.amt_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_VALUE_FLOAT);
                    info.par_value_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_RATIO_FLOAT);
                    info.par_value_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_VALUE_FLOAT);
                    info.max_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_FEE_FLOAT);
                    info.min_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_FEE_FLOAT);
                    pubL_18_144_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_18_154_Response : IResponse
    {
        #region 构造函数
        public pubL_18_154_Response()
        {
            this.pubL_18_154_InfoList = new ObservableCollection<pubL_18_154_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_18_154_Info> pubL_18_154_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_18_154_Info info = new pubL_18_154_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.exch_no = unpacker.GetInt("exch_no");
            info.contrc_code_no = unpacker.GetInt("contrc_code_no");
            info.fee_no = unpacker.GetInt("fee_no");
            info.futu_fee_type = unpacker.GetInt("futu_fee_type");
            info.order_dir = unpacker.GetInt("order_dir");
            info.contrc_dir = unpacker.GetInt("contrc_dir");
            info.amt_ratio = unpacker.GetDouble("amt_ratio");
            info.amt_value = unpacker.GetDouble("amt_value");
            info.par_value_ratio = unpacker.GetDouble("par_value_ratio");
            info.par_value_value = unpacker.GetDouble("par_value_value");
            info.max_fee = unpacker.GetDouble("max_fee");
            info.min_fee = unpacker.GetDouble("min_fee");
            pubL_18_154_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_18_154_InfoList.Add((pubL_18_154_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用客户端_查询系统合约代码费用
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_18_154_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    info.fee_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_NO_INT);
                    info.futu_fee_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_FEE_TYPE_INT);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.contrc_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_DIR_INT);
                    info.amt_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_RATIO_FLOAT);
                    info.amt_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_VALUE_FLOAT);
                    info.par_value_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_RATIO_FLOAT);
                    info.par_value_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_VALUE_FLOAT);
                    info.max_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_FEE_FLOAT);
                    info.min_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_FEE_FLOAT);
                    pubL_18_154_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_18_203_Response : IResponse
    {
        #region 构造函数
        public pubL_18_203_Response()
        {
            this.pubL_18_203_InfoList = new ObservableCollection<pubL_18_203_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_18_203_Info> pubL_18_203_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_18_203_Info info = new pubL_18_203_Info();
            info.rece_margin = unpacker.GetDouble("rece_margin");
            info.trade_commis = unpacker.GetDouble("trade_commis");
            info.report_fee = unpacker.GetDouble("report_fee");
            info.wtdraw_fee = unpacker.GetDouble("wtdraw_fee");
            info.deli_fee = unpacker.GetDouble("deli_fee");
            info.other_fee = unpacker.GetDouble("other_fee");
            info.other_commis = unpacker.GetDouble("other_commis");
            pubL_18_203_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_18_203_InfoList.Add((pubL_18_203_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用客户端_计算期货费用
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_18_203_Info();
                info.rece_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RECE_MARGIN_FLOAT);
                info.trade_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_COMMIS_FLOAT);
                info.report_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_FEE_FLOAT);
                info.wtdraw_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_FEE_FLOAT);
                info.deli_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DELI_FEE_FLOAT);
                info.other_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_FEE_FLOAT);
                info.other_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_COMMIS_FLOAT);
                pubL_18_203_InfoList.Add(info);
            }
        }
    }

    public class pubL_18_302_Response : IResponse
    {
        #region 构造函数
        public pubL_18_302_Response()
        {
            this.pubL_18_302_InfoList = new ObservableCollection<pubL_18_302_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_18_302_Info> pubL_18_302_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_18_302_Info info = new pubL_18_302_Info();
            info.fee_no = unpacker.GetInt("fee_no");
            info.futu_fee_type = unpacker.GetInt("futu_fee_type");
            info.order_dir = unpacker.GetInt("order_dir");
            info.contrc_dir = unpacker.GetInt("contrc_dir");
            info.remark_info = unpacker.GetStr("remark_info");
            pubL_18_302_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_18_302_InfoList.Add((pubL_18_302_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用客户端_查询费用编号
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_18_302_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.fee_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_NO_INT);
                    info.futu_fee_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_FEE_TYPE_INT);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.contrc_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_DIR_INT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    pubL_18_302_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_18_303_Response : IResponse
    {
        #region 构造函数
        public pubL_18_303_Response()
        {
            this.pubL_18_303_InfoList = new ObservableCollection<pubL_18_303_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_18_303_Info> pubL_18_303_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_18_303_Info info = new pubL_18_303_Info();
            info.margin_ratio = unpacker.GetDouble("margin_ratio");
            pubL_18_303_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_18_303_InfoList.Add((pubL_18_303_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用客户端_获取期货保证金参数
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_18_303_Info();
                info.margin_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARGIN_RATIO_FLOAT);
                pubL_18_303_InfoList.Add(info);
            }
        }
    }

    public class pubL_18_77_Response : IResponse
    {
        #region 构造函数
        public pubL_18_77_Response()
        {
            this.pubL_18_77_InfoList = new ObservableCollection<pubL_18_77_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_18_77_Info> pubL_18_77_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_18_77_Info info = new pubL_18_77_Info();
            pubL_18_77_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_18_77_InfoList.Add((pubL_18_77_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用客户端_模板编号删除期货费用明细
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_18_77_Info();
                pubL_18_77_InfoList.Add(info);
            }
        }
    }

    public class pubL_18_78_Response : IResponse
    {
        #region 构造函数
        public pubL_18_78_Response()
        {
            this.pubL_18_78_InfoList = new ObservableCollection<pubL_18_78_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_18_78_Info> pubL_18_78_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_18_78_Info info = new pubL_18_78_Info();
            info.fee_tmplat_no = unpacker.GetInt("fee_tmplat_no");
            pubL_18_78_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_18_78_InfoList.Add((pubL_18_78_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用客户端_复制期货费用模板
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_18_78_Info();
                info.fee_tmplat_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_INT);
                pubL_18_78_InfoList.Add(info);
            }
        }
    }

}
