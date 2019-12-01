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
    public class pdfutuL_1_40_Response : IResponse
    {
        #region 构造函数
        public pdfutuL_1_40_Response()
        {
            this.pdfutuL_1_40_InfoList = new ObservableCollection<pdfutuL_1_40_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfutuL_1_40_Info> pdfutuL_1_40_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfutuL_1_40_Info info = new pdfutuL_1_40_Info();
            pdfutuL_1_40_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfutuL_1_40_InfoList.Add((pdfutuL_1_40_Info)info);
        }
        #endregion

        //逻辑_产品期货_账户_检查期货账户存在
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfutuL_1_40_Info();
                pdfutuL_1_40_InfoList.Add(info);
            }
        }
    }

    public class pdfutuL_1_41_Response : IResponse
    {
        #region 构造函数
        public pdfutuL_1_41_Response()
        {
            this.pdfutuL_1_41_InfoList = new ObservableCollection<pdfutuL_1_41_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfutuL_1_41_Info> pdfutuL_1_41_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfutuL_1_41_Info info = new pdfutuL_1_41_Info();
            info.futu_acco_no = unpacker.GetInt("futu_acco_no");
            pdfutuL_1_41_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfutuL_1_41_InfoList.Add((pdfutuL_1_41_Info)info);
        }
        #endregion

        //逻辑_产品期货_账户_新增期货账户信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfutuL_1_41_Info();
                info.futu_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT);
                pdfutuL_1_41_InfoList.Add(info);
            }
        }
    }

    public class pdfutuL_1_42_Response : IResponse
    {
        #region 构造函数
        public pdfutuL_1_42_Response()
        {
            this.pdfutuL_1_42_InfoList = new ObservableCollection<pdfutuL_1_42_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfutuL_1_42_Info> pdfutuL_1_42_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfutuL_1_42_Info info = new pdfutuL_1_42_Info();
            pdfutuL_1_42_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfutuL_1_42_InfoList.Add((pdfutuL_1_42_Info)info);
        }
        #endregion

        //逻辑_产品期货_账户_修改期货账户信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfutuL_1_42_Info();
                pdfutuL_1_42_InfoList.Add(info);
            }
        }
    }

    public class pdfutuL_1_43_Response : IResponse
    {
        #region 构造函数
        public pdfutuL_1_43_Response()
        {
            this.pdfutuL_1_43_InfoList = new ObservableCollection<pdfutuL_1_43_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfutuL_1_43_Info> pdfutuL_1_43_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfutuL_1_43_Info info = new pdfutuL_1_43_Info();
            pdfutuL_1_43_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfutuL_1_43_InfoList.Add((pdfutuL_1_43_Info)info);
        }
        #endregion

        //逻辑_产品期货_账户_删除期货账户信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfutuL_1_43_Info();
                pdfutuL_1_43_InfoList.Add(info);
            }
        }
    }

    public class pdfutuL_1_44_Response : IResponse
    {
        #region 构造函数
        public pdfutuL_1_44_Response()
        {
            this.pdfutuL_1_44_InfoList = new ObservableCollection<pdfutuL_1_44_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfutuL_1_44_Info> pdfutuL_1_44_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfutuL_1_44_Info info = new pdfutuL_1_44_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.update_date = unpacker.GetInt("update_date");
            info.update_time = unpacker.GetInt("update_time");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.futu_acco_no = unpacker.GetInt("futu_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.futu_acco = unpacker.GetStr("futu_acco");
            info.futu_acco_name = unpacker.GetStr("futu_acco_name");
            info.futu_acco_status = unpacker.GetStr("futu_acco_status");
            info.hedge_type = unpacker.GetInt("hedge_type");
            info.allow_contrc_type = unpacker.GetStr("allow_contrc_type");
            info.remark_info = unpacker.GetStr("remark_info");
            pdfutuL_1_44_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfutuL_1_44_InfoList.Add((pdfutuL_1_44_Info)info);
        }
        #endregion

        //逻辑_产品期货_账户_查询期货账户信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdfutuL_1_44_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    info.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.futu_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.futu_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_STR);
                    info.futu_acco_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NAME_STR);
                    info.futu_acco_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_STATUS_STR);
                    info.hedge_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT);
                    info.allow_contrc_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_CONTRC_TYPE_STR);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    pdfutuL_1_44_InfoList.Add(info);
                }
            }
        }
    }

    public class pdfutuL_1_45_Response : IResponse
    {
        #region 构造函数
        public pdfutuL_1_45_Response()
        {
            this.pdfutuL_1_45_InfoList = new ObservableCollection<pdfutuL_1_45_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfutuL_1_45_Info> pdfutuL_1_45_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfutuL_1_45_Info info = new pdfutuL_1_45_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.update_date = unpacker.GetInt("update_date");
            info.update_time = unpacker.GetInt("update_time");
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
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.futu_acco_no = unpacker.GetInt("futu_acco_no");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pdfutuL_1_45_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfutuL_1_45_InfoList.Add((pdfutuL_1_45_Info)info);
        }
        #endregion

        //逻辑_产品期货_账户_查询期货账户信息流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdfutuL_1_45_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    info.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
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
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.futu_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pdfutuL_1_45_InfoList.Add(info);
                }
            }
        }
    }

    public class pdfutuL_1_46_Response : IResponse
    {
        #region 构造函数
        public pdfutuL_1_46_Response()
        {
            this.pdfutuL_1_46_InfoList = new ObservableCollection<pdfutuL_1_46_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfutuL_1_46_Info> pdfutuL_1_46_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfutuL_1_46_Info info = new pdfutuL_1_46_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.update_date = unpacker.GetInt("update_date");
            info.update_time = unpacker.GetInt("update_time");
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
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.futu_acco_no = unpacker.GetInt("futu_acco_no");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pdfutuL_1_46_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfutuL_1_46_InfoList.Add((pdfutuL_1_46_Info)info);
        }
        #endregion

        //逻辑_产品期货_账户_查询历史期货账户信息流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdfutuL_1_46_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    info.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
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
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.futu_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pdfutuL_1_46_InfoList.Add(info);
                }
            }
        }
    }

    public class pdfutuL_1_47_Response : IResponse
    {
        #region 构造函数
        public pdfutuL_1_47_Response()
        {
            this.pdfutuL_1_47_InfoList = new ObservableCollection<pdfutuL_1_47_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfutuL_1_47_Info> pdfutuL_1_47_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfutuL_1_47_Info info = new pdfutuL_1_47_Info();
            pdfutuL_1_47_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfutuL_1_47_InfoList.Add((pdfutuL_1_47_Info)info);
        }
        #endregion

        //逻辑_产品期货_账户_冻结期货账户
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfutuL_1_47_Info();
                pdfutuL_1_47_InfoList.Add(info);
            }
        }
    }

    public class pdfutuL_1_48_Response : IResponse
    {
        #region 构造函数
        public pdfutuL_1_48_Response()
        {
            this.pdfutuL_1_48_InfoList = new ObservableCollection<pdfutuL_1_48_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfutuL_1_48_Info> pdfutuL_1_48_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfutuL_1_48_Info info = new pdfutuL_1_48_Info();
            pdfutuL_1_48_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfutuL_1_48_InfoList.Add((pdfutuL_1_48_Info)info);
        }
        #endregion

        //逻辑_产品期货_账户_恢复期货账户
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfutuL_1_48_Info();
                pdfutuL_1_48_InfoList.Add(info);
            }
        }
    }

    public class pdfutuL_1_49_Response : IResponse
    {
        #region 构造函数
        public pdfutuL_1_49_Response()
        {
            this.pdfutuL_1_49_InfoList = new ObservableCollection<pdfutuL_1_49_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfutuL_1_49_Info> pdfutuL_1_49_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfutuL_1_49_Info info = new pdfutuL_1_49_Info();
            pdfutuL_1_49_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfutuL_1_49_InfoList.Add((pdfutuL_1_49_Info)info);
        }
        #endregion

        //逻辑_产品期货_账户_注销期货账户
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfutuL_1_49_Info();
                pdfutuL_1_49_InfoList.Add(info);
            }
        }
    }

    public class pdfutuL_1_51_Response : IResponse
    {
        #region 构造函数
        public pdfutuL_1_51_Response()
        {
            this.pdfutuL_1_51_InfoList = new ObservableCollection<pdfutuL_1_51_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfutuL_1_51_Info> pdfutuL_1_51_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfutuL_1_51_Info info = new pdfutuL_1_51_Info();
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.futu_acco_no = unpacker.GetInt("futu_acco_no");
            info.futu_acco = unpacker.GetStr("futu_acco");
            info.futu_acco_name = unpacker.GetStr("futu_acco_name");
            info.futu_acco_status = unpacker.GetStr("futu_acco_status");
            pdfutuL_1_51_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfutuL_1_51_InfoList.Add((pdfutuL_1_51_Info)info);
        }
        #endregion

        //逻辑_产品期货_账户_查询期货账户列表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdfutuL_1_51_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.futu_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT);
                    info.futu_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_STR);
                    info.futu_acco_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NAME_STR);
                    info.futu_acco_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_STATUS_STR);
                    pdfutuL_1_51_InfoList.Add(info);
                }
            }
        }
    }

    public class pdfutuL_1_501_Response : IResponse
    {
        #region 构造函数
        public pdfutuL_1_501_Response()
        {
            this.pdfutuL_1_501_InfoList = new ObservableCollection<pdfutuL_1_501_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfutuL_1_501_Info> pdfutuL_1_501_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfutuL_1_501_Info info = new pdfutuL_1_501_Info();
            info.pass_no = unpacker.GetInt("pass_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.asset_acco = unpacker.GetStr("asset_acco");
            info.out_acco = unpacker.GetStr("out_acco");
            info.futu_acco_no = unpacker.GetInt("futu_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.futu_acco = unpacker.GetStr("futu_acco");
            info.comm_pwd = unpacker.GetStr("comm_pwd");
            info.trade_pwd = unpacker.GetStr("trade_pwd");
            info.config_str = unpacker.GetStr("config_str");
            info.asac_busi_config_str = unpacker.GetStr("asac_busi_config_str");
            pdfutuL_1_501_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfutuL_1_501_InfoList.Add((pdfutuL_1_501_Info)info);
        }
        #endregion

        //逻辑_产品期货_账户_查询报盘所需资产账户证券账户信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdfutuL_1_501_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.asset_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STR);
                    info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    info.futu_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.futu_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_STR);
                    info.comm_pwd = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_PWD_STR);
                    info.trade_pwd = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_PWD_STR);
                    info.config_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_STR_STR);
                    info.asac_busi_config_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ASAC_BUSI_CONFIG_STR_STR);
                    pdfutuL_1_501_InfoList.Add(info);
                }
            }
        }
    }

}
