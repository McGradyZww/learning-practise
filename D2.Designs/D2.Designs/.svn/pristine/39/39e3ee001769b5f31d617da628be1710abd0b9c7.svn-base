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
    public class pdfofuL_1_40_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_1_40_Response()
        {
            this.pdfofuL_1_40_InfoList = new ObservableCollection<pdfofuL_1_40_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_1_40_Info> pdfofuL_1_40_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_1_40_Info info = new pdfofuL_1_40_Info();
            pdfofuL_1_40_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_1_40_InfoList.Add((pdfofuL_1_40_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_账户_检查外盘期货账户存在
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfofuL_1_40_Info();
                pdfofuL_1_40_InfoList.Add(info);
            }
        }
    }

    public class pdfofuL_1_41_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_1_41_Response()
        {
            this.pdfofuL_1_41_InfoList = new ObservableCollection<pdfofuL_1_41_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_1_41_Info> pdfofuL_1_41_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_1_41_Info info = new pdfofuL_1_41_Info();
            info.futu_acco_no = unpacker.GetInt("futu_acco_no");
            pdfofuL_1_41_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_1_41_InfoList.Add((pdfofuL_1_41_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_账户_新增外盘期货账户信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfofuL_1_41_Info();
                info.futu_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT);
                pdfofuL_1_41_InfoList.Add(info);
            }
        }
    }

    public class pdfofuL_1_42_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_1_42_Response()
        {
            this.pdfofuL_1_42_InfoList = new ObservableCollection<pdfofuL_1_42_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_1_42_Info> pdfofuL_1_42_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_1_42_Info info = new pdfofuL_1_42_Info();
            pdfofuL_1_42_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_1_42_InfoList.Add((pdfofuL_1_42_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_账户_修改外盘期货账户信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfofuL_1_42_Info();
                pdfofuL_1_42_InfoList.Add(info);
            }
        }
    }

    public class pdfofuL_1_43_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_1_43_Response()
        {
            this.pdfofuL_1_43_InfoList = new ObservableCollection<pdfofuL_1_43_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_1_43_Info> pdfofuL_1_43_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_1_43_Info info = new pdfofuL_1_43_Info();
            pdfofuL_1_43_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_1_43_InfoList.Add((pdfofuL_1_43_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_账户_删除外盘期货账户信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfofuL_1_43_Info();
                pdfofuL_1_43_InfoList.Add(info);
            }
        }
    }

    public class pdfofuL_1_44_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_1_44_Response()
        {
            this.pdfofuL_1_44_InfoList = new ObservableCollection<pdfofuL_1_44_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_1_44_Info> pdfofuL_1_44_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_1_44_Info info = new pdfofuL_1_44_Info();
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
            info.allow_contrc_type = unpacker.GetStr("allow_contrc_type");
            info.busi_limit_str = unpacker.GetStr("busi_limit_str");
            info.remark_info = unpacker.GetStr("remark_info");
            pdfofuL_1_44_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_1_44_InfoList.Add((pdfofuL_1_44_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_账户_查询外盘期货账户信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdfofuL_1_44_Info();
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
                    info.allow_contrc_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_CONTRC_TYPE_STR);
                    info.busi_limit_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_LIMIT_STR_STR);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    pdfofuL_1_44_InfoList.Add(info);
                }
            }
        }
    }

    public class pdfofuL_1_45_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_1_45_Response()
        {
            this.pdfofuL_1_45_InfoList = new ObservableCollection<pdfofuL_1_45_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_1_45_Info> pdfofuL_1_45_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_1_45_Info info = new pdfofuL_1_45_Info();
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
            pdfofuL_1_45_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_1_45_InfoList.Add((pdfofuL_1_45_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_账户_查询外盘期货账户信息流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdfofuL_1_45_Info();
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
                    pdfofuL_1_45_InfoList.Add(info);
                }
            }
        }
    }

    public class pdfofuL_1_46_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_1_46_Response()
        {
            this.pdfofuL_1_46_InfoList = new ObservableCollection<pdfofuL_1_46_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_1_46_Info> pdfofuL_1_46_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_1_46_Info info = new pdfofuL_1_46_Info();
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
            pdfofuL_1_46_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_1_46_InfoList.Add((pdfofuL_1_46_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_账户_查询历史外盘期货账户信息流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdfofuL_1_46_Info();
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
                    pdfofuL_1_46_InfoList.Add(info);
                }
            }
        }
    }

    public class pdfofuL_1_47_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_1_47_Response()
        {
            this.pdfofuL_1_47_InfoList = new ObservableCollection<pdfofuL_1_47_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_1_47_Info> pdfofuL_1_47_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_1_47_Info info = new pdfofuL_1_47_Info();
            pdfofuL_1_47_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_1_47_InfoList.Add((pdfofuL_1_47_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_账户_冻结外盘期货账户
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfofuL_1_47_Info();
                pdfofuL_1_47_InfoList.Add(info);
            }
        }
    }

    public class pdfofuL_1_48_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_1_48_Response()
        {
            this.pdfofuL_1_48_InfoList = new ObservableCollection<pdfofuL_1_48_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_1_48_Info> pdfofuL_1_48_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_1_48_Info info = new pdfofuL_1_48_Info();
            pdfofuL_1_48_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_1_48_InfoList.Add((pdfofuL_1_48_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_账户_恢复外盘期货账户
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfofuL_1_48_Info();
                pdfofuL_1_48_InfoList.Add(info);
            }
        }
    }

    public class pdfofuL_1_49_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_1_49_Response()
        {
            this.pdfofuL_1_49_InfoList = new ObservableCollection<pdfofuL_1_49_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_1_49_Info> pdfofuL_1_49_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_1_49_Info info = new pdfofuL_1_49_Info();
            pdfofuL_1_49_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_1_49_InfoList.Add((pdfofuL_1_49_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_账户_注销外盘期货账户
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfofuL_1_49_Info();
                pdfofuL_1_49_InfoList.Add(info);
            }
        }
    }

    public class pdfofuL_1_51_Response : IResponse
    {
        #region 构造函数
        public pdfofuL_1_51_Response()
        {
            this.pdfofuL_1_51_InfoList = new ObservableCollection<pdfofuL_1_51_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfofuL_1_51_Info> pdfofuL_1_51_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfofuL_1_51_Info info = new pdfofuL_1_51_Info();
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.futu_acco_no = unpacker.GetInt("futu_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.futu_acco = unpacker.GetStr("futu_acco");
            info.futu_acco_name = unpacker.GetStr("futu_acco_name");
            info.futu_acco_status = unpacker.GetStr("futu_acco_status");
            pdfofuL_1_51_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfofuL_1_51_InfoList.Add((pdfofuL_1_51_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_账户_查询外盘期货账户列表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdfofuL_1_51_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.futu_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.futu_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_STR);
                    info.futu_acco_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NAME_STR);
                    info.futu_acco_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_STATUS_STR);
                    pdfofuL_1_51_InfoList.Add(info);
                }
            }
        }
    }

    public class pdfufuL_1_61_Response : IResponse
    {
        #region 构造函数
        public pdfufuL_1_61_Response()
        {
            this.pdfufuL_1_61_InfoList = new ObservableCollection<pdfufuL_1_61_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfufuL_1_61_Info> pdfufuL_1_61_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfufuL_1_61_Info info = new pdfufuL_1_61_Info();
            pdfufuL_1_61_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfufuL_1_61_InfoList.Add((pdfufuL_1_61_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_账户_处理产品外盘期货日初
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfufuL_1_61_Info();
                pdfufuL_1_61_InfoList.Add(info);
            }
        }
    }

    public class pdfufuL_1_62_Response : IResponse
    {
        #region 构造函数
        public pdfufuL_1_62_Response()
        {
            this.pdfufuL_1_62_InfoList = new ObservableCollection<pdfufuL_1_62_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfufuL_1_62_Info> pdfufuL_1_62_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfufuL_1_62_Info info = new pdfufuL_1_62_Info();
            pdfufuL_1_62_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfufuL_1_62_InfoList.Add((pdfufuL_1_62_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_账户_处理产品外盘期货日终
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfufuL_1_62_Info();
                pdfufuL_1_62_InfoList.Add(info);
            }
        }
    }

    public class pdfufuL_1_101_Response : IResponse
    {
        #region 构造函数
        public pdfufuL_1_101_Response()
        {
            this.pdfufuL_1_101_InfoList = new ObservableCollection<pdfufuL_1_101_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfufuL_1_101_Info> pdfufuL_1_101_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfufuL_1_101_Info info = new pdfufuL_1_101_Info();
            info.task_strike_status = unpacker.GetStr("task_strike_status");
            pdfufuL_1_101_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfufuL_1_101_InfoList.Add((pdfufuL_1_101_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_账户_处理产品外盘期货日初定时任务
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfufuL_1_101_Info();
                info.task_strike_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STRIKE_STATUS_STR);
                pdfufuL_1_101_InfoList.Add(info);
            }
        }
    }

    public class pdfufuL_1_102_Response : IResponse
    {
        #region 构造函数
        public pdfufuL_1_102_Response()
        {
            this.pdfufuL_1_102_InfoList = new ObservableCollection<pdfufuL_1_102_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdfufuL_1_102_Info> pdfufuL_1_102_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdfufuL_1_102_Info info = new pdfufuL_1_102_Info();
            info.task_strike_status = unpacker.GetStr("task_strike_status");
            pdfufuL_1_102_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdfufuL_1_102_InfoList.Add((pdfufuL_1_102_Info)info);
        }
        #endregion

        //逻辑_产品外盘期货_账户_处理产品外盘期货日终定时任务
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdfufuL_1_102_Info();
                info.task_strike_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STRIKE_STATUS_STR);
                pdfufuL_1_102_InfoList.Add(info);
            }
        }
    }

}
