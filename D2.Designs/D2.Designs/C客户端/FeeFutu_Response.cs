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
    public class pubL_15_41_Response : IResponse
    {
        #region 构造函数
        public pubL_15_41_Response()
        {
            this.pubL_15_41_InfoList = new ObservableCollection<pubL_15_41_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_15_41_Info> pubL_15_41_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_15_41_Info info = new pubL_15_41_Info();
            info.fee_tmplat_no = unpacker.GetInt("fee_tmplat_no");
            pubL_15_41_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_15_41_InfoList.Add((pubL_15_41_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用_新增期货费用模板
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_15_41_Info();
                info.fee_tmplat_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_INT);
                pubL_15_41_InfoList.Add(info);
            }
        }
    }

    public class pubL_15_42_Response : IResponse
    {
        #region 构造函数
        public pubL_15_42_Response()
        {
            this.pubL_15_42_InfoList = new ObservableCollection<pubL_15_42_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_15_42_Info> pubL_15_42_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_15_42_Info info = new pubL_15_42_Info();
            pubL_15_42_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_15_42_InfoList.Add((pubL_15_42_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用_修改期货费用模板
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_15_42_Info();
                pubL_15_42_InfoList.Add(info);
            }
        }
    }

    public class pubL_15_43_Response : IResponse
    {
        #region 构造函数
        public pubL_15_43_Response()
        {
            this.pubL_15_43_InfoList = new ObservableCollection<pubL_15_43_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_15_43_Info> pubL_15_43_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_15_43_Info info = new pubL_15_43_Info();
            pubL_15_43_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_15_43_InfoList.Add((pubL_15_43_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用_删除期货费用模板
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_15_43_Info();
                pubL_15_43_InfoList.Add(info);
            }
        }
    }

    public class pubL_15_44_Response : IResponse
    {
        #region 构造函数
        public pubL_15_44_Response()
        {
            this.pubL_15_44_InfoList = new ObservableCollection<pubL_15_44_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_15_44_Info> pubL_15_44_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_15_44_Info info = new pubL_15_44_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.fee_tmplat_no = unpacker.GetInt("fee_tmplat_no");
            info.fee_tmplat_name = unpacker.GetStr("fee_tmplat_name");
            info.fee_tmplat_kind = unpacker.GetInt("fee_tmplat_kind");
            info.remark_info = unpacker.GetStr("remark_info");
            pubL_15_44_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_15_44_InfoList.Add((pubL_15_44_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用_查询期货费用模板
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_15_44_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.fee_tmplat_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_INT);
                    info.fee_tmplat_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NAME_STR);
                    info.fee_tmplat_kind = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_KIND_INT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    pubL_15_44_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_15_45_Response : IResponse
    {
        #region 构造函数
        public pubL_15_45_Response()
        {
            this.pubL_15_45_InfoList = new ObservableCollection<pubL_15_45_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_15_45_Info> pubL_15_45_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_15_45_Info info = new pubL_15_45_Info();
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
            pubL_15_45_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_15_45_InfoList.Add((pubL_15_45_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用_查询期货费用模板流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_15_45_Info();
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
                    pubL_15_45_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_15_46_Response : IResponse
    {
        #region 构造函数
        public pubL_15_46_Response()
        {
            this.pubL_15_46_InfoList = new ObservableCollection<pubL_15_46_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_15_46_Info> pubL_15_46_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_15_46_Info info = new pubL_15_46_Info();
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
            pubL_15_46_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_15_46_InfoList.Add((pubL_15_46_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用_查询历史期货费用模板流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_15_46_Info();
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
                    pubL_15_46_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_15_51_Response : IResponse
    {
        #region 构造函数
        public pubL_15_51_Response()
        {
            this.pubL_15_51_InfoList = new ObservableCollection<pubL_15_51_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_15_51_Info> pubL_15_51_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_15_51_Info info = new pubL_15_51_Info();
            pubL_15_51_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_15_51_InfoList.Add((pubL_15_51_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用_新增合约类型费用模板明细
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_15_51_Info();
                pubL_15_51_InfoList.Add(info);
            }
        }
    }

    public class pubL_15_52_Response : IResponse
    {
        #region 构造函数
        public pubL_15_52_Response()
        {
            this.pubL_15_52_InfoList = new ObservableCollection<pubL_15_52_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_15_52_Info> pubL_15_52_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_15_52_Info info = new pubL_15_52_Info();
            pubL_15_52_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_15_52_InfoList.Add((pubL_15_52_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用_修改合约类型费用模板明细
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_15_52_Info();
                pubL_15_52_InfoList.Add(info);
            }
        }
    }

    public class pubL_15_53_Response : IResponse
    {
        #region 构造函数
        public pubL_15_53_Response()
        {
            this.pubL_15_53_InfoList = new ObservableCollection<pubL_15_53_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_15_53_Info> pubL_15_53_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_15_53_Info info = new pubL_15_53_Info();
            pubL_15_53_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_15_53_InfoList.Add((pubL_15_53_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用_删除合约类型费用模板明细
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_15_53_Info();
                pubL_15_53_InfoList.Add(info);
            }
        }
    }

    public class pubL_15_54_Response : IResponse
    {
        #region 构造函数
        public pubL_15_54_Response()
        {
            this.pubL_15_54_InfoList = new ObservableCollection<pubL_15_54_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_15_54_Info> pubL_15_54_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_15_54_Info info = new pubL_15_54_Info();
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
            info.hedge_type = unpacker.GetInt("hedge_type");
            info.remark_info = unpacker.GetStr("remark_info");
            pubL_15_54_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_15_54_InfoList.Add((pubL_15_54_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用_查询合约类型费用模板明细
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_15_54_Info();
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
                    info.hedge_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    pubL_15_54_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_15_55_Response : IResponse
    {
        #region 构造函数
        public pubL_15_55_Response()
        {
            this.pubL_15_55_InfoList = new ObservableCollection<pubL_15_55_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_15_55_Info> pubL_15_55_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_15_55_Info info = new pubL_15_55_Info();
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
            pubL_15_55_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_15_55_InfoList.Add((pubL_15_55_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用_查询合约类型费用模板明细流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_15_55_Info();
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
                    pubL_15_55_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_15_56_Response : IResponse
    {
        #region 构造函数
        public pubL_15_56_Response()
        {
            this.pubL_15_56_InfoList = new ObservableCollection<pubL_15_56_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_15_56_Info> pubL_15_56_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_15_56_Info info = new pubL_15_56_Info();
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
            pubL_15_56_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_15_56_InfoList.Add((pubL_15_56_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用_查询历史合约类型费用模板明细流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_15_56_Info();
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
                    pubL_15_56_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_15_61_Response : IResponse
    {
        #region 构造函数
        public pubL_15_61_Response()
        {
            this.pubL_15_61_InfoList = new ObservableCollection<pubL_15_61_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_15_61_Info> pubL_15_61_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_15_61_Info info = new pubL_15_61_Info();
            pubL_15_61_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_15_61_InfoList.Add((pubL_15_61_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用_新增合约代码费用模板明细
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_15_61_Info();
                pubL_15_61_InfoList.Add(info);
            }
        }
    }

    public class pubL_15_62_Response : IResponse
    {
        #region 构造函数
        public pubL_15_62_Response()
        {
            this.pubL_15_62_InfoList = new ObservableCollection<pubL_15_62_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_15_62_Info> pubL_15_62_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_15_62_Info info = new pubL_15_62_Info();
            pubL_15_62_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_15_62_InfoList.Add((pubL_15_62_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用_修改合约代码费用模板明细
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_15_62_Info();
                pubL_15_62_InfoList.Add(info);
            }
        }
    }

    public class pubL_15_63_Response : IResponse
    {
        #region 构造函数
        public pubL_15_63_Response()
        {
            this.pubL_15_63_InfoList = new ObservableCollection<pubL_15_63_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_15_63_Info> pubL_15_63_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_15_63_Info info = new pubL_15_63_Info();
            pubL_15_63_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_15_63_InfoList.Add((pubL_15_63_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用_删除合约代码费用模板明细
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_15_63_Info();
                pubL_15_63_InfoList.Add(info);
            }
        }
    }

    public class pubL_15_64_Response : IResponse
    {
        #region 构造函数
        public pubL_15_64_Response()
        {
            this.pubL_15_64_InfoList = new ObservableCollection<pubL_15_64_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_15_64_Info> pubL_15_64_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_15_64_Info info = new pubL_15_64_Info();
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
            pubL_15_64_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_15_64_InfoList.Add((pubL_15_64_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用_查询合约代码费用模板明细
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_15_64_Info();
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
                    pubL_15_64_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_15_65_Response : IResponse
    {
        #region 构造函数
        public pubL_15_65_Response()
        {
            this.pubL_15_65_InfoList = new ObservableCollection<pubL_15_65_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_15_65_Info> pubL_15_65_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_15_65_Info info = new pubL_15_65_Info();
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
            pubL_15_65_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_15_65_InfoList.Add((pubL_15_65_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用_查询合约代码费用模板明细流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_15_65_Info();
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
                    pubL_15_65_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_15_66_Response : IResponse
    {
        #region 构造函数
        public pubL_15_66_Response()
        {
            this.pubL_15_66_InfoList = new ObservableCollection<pubL_15_66_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_15_66_Info> pubL_15_66_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_15_66_Info info = new pubL_15_66_Info();
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
            pubL_15_66_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_15_66_InfoList.Add((pubL_15_66_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用_查询历史合约代码费用模板明细流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_15_66_Info();
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
                    pubL_15_66_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_15_121_Response : IResponse
    {
        #region 构造函数
        public pubL_15_121_Response()
        {
            this.pubL_15_121_InfoList = new ObservableCollection<pubL_15_121_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_15_121_Info> pubL_15_121_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_15_121_Info info = new pubL_15_121_Info();
            pubL_15_121_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_15_121_InfoList.Add((pubL_15_121_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用_新增外部合约类型费用
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_15_121_Info();
                pubL_15_121_InfoList.Add(info);
            }
        }
    }

    public class pubL_15_122_Response : IResponse
    {
        #region 构造函数
        public pubL_15_122_Response()
        {
            this.pubL_15_122_InfoList = new ObservableCollection<pubL_15_122_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_15_122_Info> pubL_15_122_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_15_122_Info info = new pubL_15_122_Info();
            pubL_15_122_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_15_122_InfoList.Add((pubL_15_122_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用_修改外部合约类型费用
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_15_122_Info();
                pubL_15_122_InfoList.Add(info);
            }
        }
    }

    public class pubL_15_123_Response : IResponse
    {
        #region 构造函数
        public pubL_15_123_Response()
        {
            this.pubL_15_123_InfoList = new ObservableCollection<pubL_15_123_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_15_123_Info> pubL_15_123_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_15_123_Info info = new pubL_15_123_Info();
            pubL_15_123_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_15_123_InfoList.Add((pubL_15_123_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用_删除外部合约类型费用
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_15_123_Info();
                pubL_15_123_InfoList.Add(info);
            }
        }
    }

    public class pubL_15_124_Response : IResponse
    {
        #region 构造函数
        public pubL_15_124_Response()
        {
            this.pubL_15_124_InfoList = new ObservableCollection<pubL_15_124_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_15_124_Info> pubL_15_124_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_15_124_Info info = new pubL_15_124_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.pass_no = unpacker.GetInt("pass_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.contrc_type = unpacker.GetInt("contrc_type");
            info.fee_no = unpacker.GetInt("fee_no");
            info.amt_ratio = unpacker.GetDouble("amt_ratio");
            info.amt_value = unpacker.GetDouble("amt_value");
            info.par_value_ratio = unpacker.GetDouble("par_value_ratio");
            info.par_value_value = unpacker.GetDouble("par_value_value");
            info.max_fee = unpacker.GetDouble("max_fee");
            info.min_fee = unpacker.GetDouble("min_fee");
            pubL_15_124_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_15_124_InfoList.Add((pubL_15_124_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用_查询外部合约类型费用
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_15_124_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    info.fee_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_NO_INT);
                    info.amt_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_RATIO_FLOAT);
                    info.amt_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_VALUE_FLOAT);
                    info.par_value_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_RATIO_FLOAT);
                    info.par_value_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_VALUE_FLOAT);
                    info.max_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_FEE_FLOAT);
                    info.min_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_FEE_FLOAT);
                    pubL_15_124_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_15_125_Response : IResponse
    {
        #region 构造函数
        public pubL_15_125_Response()
        {
            this.pubL_15_125_InfoList = new ObservableCollection<pubL_15_125_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_15_125_Info> pubL_15_125_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_15_125_Info info = new pubL_15_125_Info();
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
            info.pass_no = unpacker.GetInt("pass_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.contrc_type = unpacker.GetInt("contrc_type");
            info.fee_no = unpacker.GetInt("fee_no");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pubL_15_125_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_15_125_InfoList.Add((pubL_15_125_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用_查询外部合约类型费用流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_15_125_Info();
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
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    info.fee_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_NO_INT);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pubL_15_125_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_15_126_Response : IResponse
    {
        #region 构造函数
        public pubL_15_126_Response()
        {
            this.pubL_15_126_InfoList = new ObservableCollection<pubL_15_126_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_15_126_Info> pubL_15_126_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_15_126_Info info = new pubL_15_126_Info();
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
            info.pass_no = unpacker.GetInt("pass_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.contrc_type = unpacker.GetInt("contrc_type");
            info.fee_no = unpacker.GetInt("fee_no");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pubL_15_126_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_15_126_InfoList.Add((pubL_15_126_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用_查询历史外部合约类型费用流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_15_126_Info();
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
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    info.fee_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_NO_INT);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pubL_15_126_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_15_131_Response : IResponse
    {
        #region 构造函数
        public pubL_15_131_Response()
        {
            this.pubL_15_131_InfoList = new ObservableCollection<pubL_15_131_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_15_131_Info> pubL_15_131_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_15_131_Info info = new pubL_15_131_Info();
            pubL_15_131_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_15_131_InfoList.Add((pubL_15_131_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用_新增外部合约代码费用
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_15_131_Info();
                pubL_15_131_InfoList.Add(info);
            }
        }
    }

    public class pubL_15_132_Response : IResponse
    {
        #region 构造函数
        public pubL_15_132_Response()
        {
            this.pubL_15_132_InfoList = new ObservableCollection<pubL_15_132_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_15_132_Info> pubL_15_132_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_15_132_Info info = new pubL_15_132_Info();
            pubL_15_132_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_15_132_InfoList.Add((pubL_15_132_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用_修改外部合约代码费用
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_15_132_Info();
                pubL_15_132_InfoList.Add(info);
            }
        }
    }

    public class pubL_15_133_Response : IResponse
    {
        #region 构造函数
        public pubL_15_133_Response()
        {
            this.pubL_15_133_InfoList = new ObservableCollection<pubL_15_133_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_15_133_Info> pubL_15_133_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_15_133_Info info = new pubL_15_133_Info();
            pubL_15_133_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_15_133_InfoList.Add((pubL_15_133_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用_删除外部合约代码费用
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_15_133_Info();
                pubL_15_133_InfoList.Add(info);
            }
        }
    }

    public class pubL_15_134_Response : IResponse
    {
        #region 构造函数
        public pubL_15_134_Response()
        {
            this.pubL_15_134_InfoList = new ObservableCollection<pubL_15_134_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_15_134_Info> pubL_15_134_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_15_134_Info info = new pubL_15_134_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.pass_no = unpacker.GetInt("pass_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.contrc_code_no = unpacker.GetInt("contrc_code_no");
            info.fee_no = unpacker.GetInt("fee_no");
            info.amt_ratio = unpacker.GetDouble("amt_ratio");
            info.amt_value = unpacker.GetDouble("amt_value");
            info.par_value_ratio = unpacker.GetDouble("par_value_ratio");
            info.par_value_value = unpacker.GetDouble("par_value_value");
            info.max_fee = unpacker.GetDouble("max_fee");
            info.min_fee = unpacker.GetDouble("min_fee");
            pubL_15_134_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_15_134_InfoList.Add((pubL_15_134_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用_查询外部合约代码费用
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_15_134_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    info.fee_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_NO_INT);
                    info.amt_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_RATIO_FLOAT);
                    info.amt_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_VALUE_FLOAT);
                    info.par_value_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_RATIO_FLOAT);
                    info.par_value_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_VALUE_FLOAT);
                    info.max_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_FEE_FLOAT);
                    info.min_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_FEE_FLOAT);
                    pubL_15_134_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_15_135_Response : IResponse
    {
        #region 构造函数
        public pubL_15_135_Response()
        {
            this.pubL_15_135_InfoList = new ObservableCollection<pubL_15_135_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_15_135_Info> pubL_15_135_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_15_135_Info info = new pubL_15_135_Info();
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
            info.pass_no = unpacker.GetInt("pass_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.contrc_code_no = unpacker.GetInt("contrc_code_no");
            info.fee_no = unpacker.GetInt("fee_no");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pubL_15_135_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_15_135_InfoList.Add((pubL_15_135_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用_查询外部合约代码费用流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_15_135_Info();
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
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    info.fee_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_NO_INT);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pubL_15_135_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_15_136_Response : IResponse
    {
        #region 构造函数
        public pubL_15_136_Response()
        {
            this.pubL_15_136_InfoList = new ObservableCollection<pubL_15_136_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_15_136_Info> pubL_15_136_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_15_136_Info info = new pubL_15_136_Info();
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
            info.pass_no = unpacker.GetInt("pass_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.contrc_code_no = unpacker.GetInt("contrc_code_no");
            info.fee_no = unpacker.GetInt("fee_no");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pubL_15_136_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_15_136_InfoList.Add((pubL_15_136_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用_查询历史外部合约代码费用流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_15_136_Info();
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
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    info.fee_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_NO_INT);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pubL_15_136_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_15_141_Response : IResponse
    {
        #region 构造函数
        public pubL_15_141_Response()
        {
            this.pubL_15_141_InfoList = new ObservableCollection<pubL_15_141_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_15_141_Info> pubL_15_141_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_15_141_Info info = new pubL_15_141_Info();
            pubL_15_141_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_15_141_InfoList.Add((pubL_15_141_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用_新增系统合约类型费用
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_15_141_Info();
                pubL_15_141_InfoList.Add(info);
            }
        }
    }

    public class pubL_15_142_Response : IResponse
    {
        #region 构造函数
        public pubL_15_142_Response()
        {
            this.pubL_15_142_InfoList = new ObservableCollection<pubL_15_142_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_15_142_Info> pubL_15_142_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_15_142_Info info = new pubL_15_142_Info();
            pubL_15_142_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_15_142_InfoList.Add((pubL_15_142_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用_修改系统合约类型费用
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_15_142_Info();
                pubL_15_142_InfoList.Add(info);
            }
        }
    }

    public class pubL_15_143_Response : IResponse
    {
        #region 构造函数
        public pubL_15_143_Response()
        {
            this.pubL_15_143_InfoList = new ObservableCollection<pubL_15_143_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_15_143_Info> pubL_15_143_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_15_143_Info info = new pubL_15_143_Info();
            pubL_15_143_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_15_143_InfoList.Add((pubL_15_143_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用_删除系统合约类型费用
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_15_143_Info();
                pubL_15_143_InfoList.Add(info);
            }
        }
    }

    public class pubL_15_144_Response : IResponse
    {
        #region 构造函数
        public pubL_15_144_Response()
        {
            this.pubL_15_144_InfoList = new ObservableCollection<pubL_15_144_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_15_144_Info> pubL_15_144_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_15_144_Info info = new pubL_15_144_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.exch_no = unpacker.GetInt("exch_no");
            info.contrc_type = unpacker.GetInt("contrc_type");
            info.fee_no = unpacker.GetInt("fee_no");
            info.amt_ratio = unpacker.GetDouble("amt_ratio");
            info.amt_value = unpacker.GetDouble("amt_value");
            info.par_value_ratio = unpacker.GetDouble("par_value_ratio");
            info.par_value_value = unpacker.GetDouble("par_value_value");
            info.max_fee = unpacker.GetDouble("max_fee");
            info.min_fee = unpacker.GetDouble("min_fee");
            pubL_15_144_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_15_144_InfoList.Add((pubL_15_144_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用_查询系统合约类型费用
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_15_144_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    info.fee_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_NO_INT);
                    info.amt_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_RATIO_FLOAT);
                    info.amt_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_VALUE_FLOAT);
                    info.par_value_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_RATIO_FLOAT);
                    info.par_value_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_VALUE_FLOAT);
                    info.max_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_FEE_FLOAT);
                    info.min_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_FEE_FLOAT);
                    pubL_15_144_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_15_145_Response : IResponse
    {
        #region 构造函数
        public pubL_15_145_Response()
        {
            this.pubL_15_145_InfoList = new ObservableCollection<pubL_15_145_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_15_145_Info> pubL_15_145_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_15_145_Info info = new pubL_15_145_Info();
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
            info.exch_no = unpacker.GetInt("exch_no");
            info.contrc_type = unpacker.GetInt("contrc_type");
            info.fee_no = unpacker.GetInt("fee_no");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pubL_15_145_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_15_145_InfoList.Add((pubL_15_145_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用_查询系统合约类型费用流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_15_145_Info();
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
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    info.fee_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_NO_INT);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pubL_15_145_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_15_146_Response : IResponse
    {
        #region 构造函数
        public pubL_15_146_Response()
        {
            this.pubL_15_146_InfoList = new ObservableCollection<pubL_15_146_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_15_146_Info> pubL_15_146_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_15_146_Info info = new pubL_15_146_Info();
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
            info.exch_no = unpacker.GetInt("exch_no");
            info.contrc_type = unpacker.GetInt("contrc_type");
            info.fee_no = unpacker.GetInt("fee_no");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pubL_15_146_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_15_146_InfoList.Add((pubL_15_146_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用_查询历史系统合约类型费用流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_15_146_Info();
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
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    info.fee_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_NO_INT);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pubL_15_146_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_15_151_Response : IResponse
    {
        #region 构造函数
        public pubL_15_151_Response()
        {
            this.pubL_15_151_InfoList = new ObservableCollection<pubL_15_151_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_15_151_Info> pubL_15_151_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_15_151_Info info = new pubL_15_151_Info();
            pubL_15_151_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_15_151_InfoList.Add((pubL_15_151_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用_新增系统合约代码费用
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_15_151_Info();
                pubL_15_151_InfoList.Add(info);
            }
        }
    }

    public class pubL_15_152_Response : IResponse
    {
        #region 构造函数
        public pubL_15_152_Response()
        {
            this.pubL_15_152_InfoList = new ObservableCollection<pubL_15_152_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_15_152_Info> pubL_15_152_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_15_152_Info info = new pubL_15_152_Info();
            pubL_15_152_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_15_152_InfoList.Add((pubL_15_152_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用_修改系统合约代码费用
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_15_152_Info();
                pubL_15_152_InfoList.Add(info);
            }
        }
    }

    public class pubL_15_153_Response : IResponse
    {
        #region 构造函数
        public pubL_15_153_Response()
        {
            this.pubL_15_153_InfoList = new ObservableCollection<pubL_15_153_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_15_153_Info> pubL_15_153_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_15_153_Info info = new pubL_15_153_Info();
            pubL_15_153_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_15_153_InfoList.Add((pubL_15_153_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用_删除系统合约代码费用
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_15_153_Info();
                pubL_15_153_InfoList.Add(info);
            }
        }
    }

    public class pubL_15_154_Response : IResponse
    {
        #region 构造函数
        public pubL_15_154_Response()
        {
            this.pubL_15_154_InfoList = new ObservableCollection<pubL_15_154_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_15_154_Info> pubL_15_154_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_15_154_Info info = new pubL_15_154_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.exch_no = unpacker.GetInt("exch_no");
            info.contrc_code_no = unpacker.GetInt("contrc_code_no");
            info.fee_no = unpacker.GetInt("fee_no");
            info.amt_ratio = unpacker.GetDouble("amt_ratio");
            info.amt_value = unpacker.GetDouble("amt_value");
            info.par_value_ratio = unpacker.GetDouble("par_value_ratio");
            info.par_value_value = unpacker.GetDouble("par_value_value");
            info.max_fee = unpacker.GetDouble("max_fee");
            info.min_fee = unpacker.GetDouble("min_fee");
            pubL_15_154_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_15_154_InfoList.Add((pubL_15_154_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用_查询系统合约代码费用
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_15_154_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    info.fee_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_NO_INT);
                    info.amt_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_RATIO_FLOAT);
                    info.amt_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_VALUE_FLOAT);
                    info.par_value_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_RATIO_FLOAT);
                    info.par_value_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_VALUE_FLOAT);
                    info.max_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_FEE_FLOAT);
                    info.min_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_FEE_FLOAT);
                    pubL_15_154_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_15_155_Response : IResponse
    {
        #region 构造函数
        public pubL_15_155_Response()
        {
            this.pubL_15_155_InfoList = new ObservableCollection<pubL_15_155_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_15_155_Info> pubL_15_155_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_15_155_Info info = new pubL_15_155_Info();
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
            info.exch_no = unpacker.GetInt("exch_no");
            info.contrc_code_no = unpacker.GetInt("contrc_code_no");
            info.fee_no = unpacker.GetInt("fee_no");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pubL_15_155_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_15_155_InfoList.Add((pubL_15_155_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用_查询系统合约代码费用流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_15_155_Info();
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
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    info.fee_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_NO_INT);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pubL_15_155_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_15_156_Response : IResponse
    {
        #region 构造函数
        public pubL_15_156_Response()
        {
            this.pubL_15_156_InfoList = new ObservableCollection<pubL_15_156_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_15_156_Info> pubL_15_156_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_15_156_Info info = new pubL_15_156_Info();
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
            info.exch_no = unpacker.GetInt("exch_no");
            info.contrc_code_no = unpacker.GetInt("contrc_code_no");
            info.fee_no = unpacker.GetInt("fee_no");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pubL_15_156_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_15_156_InfoList.Add((pubL_15_156_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用_查询历史系统合约代码费用流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_15_156_Info();
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
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    info.fee_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_NO_INT);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pubL_15_156_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_15_203_Response : IResponse
    {
        #region 构造函数
        public pubL_15_203_Response()
        {
            this.pubL_15_203_InfoList = new ObservableCollection<pubL_15_203_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_15_203_Info> pubL_15_203_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_15_203_Info info = new pubL_15_203_Info();
            info.rece_margin = unpacker.GetDouble("rece_margin");
            info.trade_commis = unpacker.GetDouble("trade_commis");
            info.report_fee = unpacker.GetDouble("report_fee");
            info.wtdraw_fee = unpacker.GetDouble("wtdraw_fee");
            info.deli_fee = unpacker.GetDouble("deli_fee");
            info.other_fee = unpacker.GetDouble("other_fee");
            info.other_commis = unpacker.GetDouble("other_commis");
            pubL_15_203_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_15_203_InfoList.Add((pubL_15_203_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用_计算期货费用
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_15_203_Info();
                info.rece_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RECE_MARGIN_FLOAT);
                info.trade_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_COMMIS_FLOAT);
                info.report_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_FEE_FLOAT);
                info.wtdraw_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_FEE_FLOAT);
                info.deli_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DELI_FEE_FLOAT);
                info.other_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_FEE_FLOAT);
                info.other_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_COMMIS_FLOAT);
                pubL_15_203_InfoList.Add(info);
            }
        }
    }

    public class pubL_15_302_Response : IResponse
    {
        #region 构造函数
        public pubL_15_302_Response()
        {
            this.pubL_15_302_InfoList = new ObservableCollection<pubL_15_302_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_15_302_Info> pubL_15_302_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_15_302_Info info = new pubL_15_302_Info();
            info.fee_no = unpacker.GetInt("fee_no");
            info.futu_fee_type = unpacker.GetInt("futu_fee_type");
            info.order_dir = unpacker.GetInt("order_dir");
            info.contrc_dir = unpacker.GetInt("contrc_dir");
            info.remark_info = unpacker.GetStr("remark_info");
            pubL_15_302_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_15_302_InfoList.Add((pubL_15_302_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用_查询费用编号
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_15_302_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.fee_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_NO_INT);
                    info.futu_fee_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_FEE_TYPE_INT);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.contrc_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_DIR_INT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    pubL_15_302_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_15_303_Response : IResponse
    {
        #region 构造函数
        public pubL_15_303_Response()
        {
            this.pubL_15_303_InfoList = new ObservableCollection<pubL_15_303_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_15_303_Info> pubL_15_303_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_15_303_Info info = new pubL_15_303_Info();
            pubL_15_303_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_15_303_InfoList.Add((pubL_15_303_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用_新增资产账户期货费用模板
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_15_303_Info();
                pubL_15_303_InfoList.Add(info);
            }
        }
    }

    public class pubL_15_304_Response : IResponse
    {
        #region 构造函数
        public pubL_15_304_Response()
        {
            this.pubL_15_304_InfoList = new ObservableCollection<pubL_15_304_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_15_304_Info> pubL_15_304_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_15_304_Info info = new pubL_15_304_Info();
            pubL_15_304_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_15_304_InfoList.Add((pubL_15_304_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用_模板编号删除期货费用明细
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_15_304_Info();
                pubL_15_304_InfoList.Add(info);
            }
        }
    }

    public class pubL_15_305_Response : IResponse
    {
        #region 构造函数
        public pubL_15_305_Response()
        {
            this.pubL_15_305_InfoList = new ObservableCollection<pubL_15_305_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_15_305_Info> pubL_15_305_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_15_305_Info info = new pubL_15_305_Info();
            info.fee_tmplat_no = unpacker.GetInt("fee_tmplat_no");
            pubL_15_305_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_15_305_InfoList.Add((pubL_15_305_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用_复制期货费用模板
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_15_305_Info();
                info.fee_tmplat_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_TMPLAT_NO_INT);
                pubL_15_305_InfoList.Add(info);
            }
        }
    }

    public class pubL_15_306_Response : IResponse
    {
        #region 构造函数
        public pubL_15_306_Response()
        {
            this.pubL_15_306_InfoList = new ObservableCollection<pubL_15_306_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_15_306_Info> pubL_15_306_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_15_306_Info info = new pubL_15_306_Info();
            pubL_15_306_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_15_306_InfoList.Add((pubL_15_306_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用_修改资产账户期货费用模板
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_15_306_Info();
                pubL_15_306_InfoList.Add(info);
            }
        }
    }

    public class pubL_15_307_Response : IResponse
    {
        #region 构造函数
        public pubL_15_307_Response()
        {
            this.pubL_15_307_InfoList = new ObservableCollection<pubL_15_307_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_15_307_Info> pubL_15_307_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_15_307_Info info = new pubL_15_307_Info();
            pubL_15_307_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_15_307_InfoList.Add((pubL_15_307_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用_删除资产账户期货费用模板
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_15_307_Info();
                pubL_15_307_InfoList.Add(info);
            }
        }
    }

    public class pubL_15_308_Response : IResponse
    {
        #region 构造函数
        public pubL_15_308_Response()
        {
            this.pubL_15_308_InfoList = new ObservableCollection<pubL_15_308_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_15_308_Info> pubL_15_308_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_15_308_Info info = new pubL_15_308_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.co_no = unpacker.GetInt("co_no");
            info.futu_code_spec_fee_tmplat_no = unpacker.GetInt("futu_code_spec_fee_tmplat_no");
            info.futu_type_spec_fee_tmplat_no = unpacker.GetInt("futu_type_spec_fee_tmplat_no");
            info.futu_code_fee_tmplat_no = unpacker.GetInt("futu_code_fee_tmplat_no");
            info.futu_type_fee_tmplat_no = unpacker.GetInt("futu_type_fee_tmplat_no");
            info.futu_code_out_fee_tmplat_no = unpacker.GetInt("futu_code_out_fee_tmplat_no");
            info.futu_type_out_fee_tmplat_no = unpacker.GetInt("futu_type_out_fee_tmplat_no");
            pubL_15_308_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_15_308_InfoList.Add((pubL_15_308_Info)info);
        }
        #endregion

        //逻辑_公共_期货费用_查询资产账户期货费用模板
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_15_308_Info();
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
                    pubL_15_308_InfoList.Add(info);
                }
            }
        }
    }

}
