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
    public class pdsecuL_1_1_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_1_1_Response()
        {
            this.pdsecuL_1_1_InfoList = new ObservableCollection<pdsecuL_1_1_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_1_1_Info> pdsecuL_1_1_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_1_1_Info info = new pdsecuL_1_1_Info();
            info.pd_no = unpacker.GetInt("pd_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            pdsecuL_1_1_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_1_1_InfoList.Add((pdsecuL_1_1_Info)info);
        }
        #endregion

        //逻辑_产品证券_账户_授权开立交易中台账户
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdsecuL_1_1_Info();
                info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                pdsecuL_1_1_InfoList.Add(info);
            }
        }
    }

    public class pdsecuL_1_2_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_1_2_Response()
        {
            this.pdsecuL_1_2_InfoList = new ObservableCollection<pdsecuL_1_2_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_1_2_Info> pdsecuL_1_2_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_1_2_Info info = new pdsecuL_1_2_Info();
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            pdsecuL_1_2_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_1_2_InfoList.Add((pdsecuL_1_2_Info)info);
        }
        #endregion

        //逻辑_产品证券_账户_检查开立交易中台资产单元
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdsecuL_1_2_Info();
                info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                pdsecuL_1_2_InfoList.Add(info);
            }
        }
    }

    public class pdsecuL_1_40_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_1_40_Response()
        {
            this.pdsecuL_1_40_InfoList = new ObservableCollection<pdsecuL_1_40_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_1_40_Info> pdsecuL_1_40_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_1_40_Info info = new pdsecuL_1_40_Info();
            pdsecuL_1_40_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_1_40_InfoList.Add((pdsecuL_1_40_Info)info);
        }
        #endregion

        //逻辑_产品证券_账户_检查证券账户存在
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdsecuL_1_40_Info();
                pdsecuL_1_40_InfoList.Add(info);
            }
        }
    }

    public class pdsecuL_1_41_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_1_41_Response()
        {
            this.pdsecuL_1_41_InfoList = new ObservableCollection<pdsecuL_1_41_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_1_41_Info> pdsecuL_1_41_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_1_41_Info info = new pdsecuL_1_41_Info();
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            pdsecuL_1_41_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_1_41_InfoList.Add((pdsecuL_1_41_Info)info);
        }
        #endregion

        //逻辑_产品证券_账户_新增证券账户信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdsecuL_1_41_Info();
                info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                pdsecuL_1_41_InfoList.Add(info);
            }
        }
    }

    public class pdsecuL_1_42_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_1_42_Response()
        {
            this.pdsecuL_1_42_InfoList = new ObservableCollection<pdsecuL_1_42_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_1_42_Info> pdsecuL_1_42_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_1_42_Info info = new pdsecuL_1_42_Info();
            pdsecuL_1_42_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_1_42_InfoList.Add((pdsecuL_1_42_Info)info);
        }
        #endregion

        //逻辑_产品证券_账户_修改证券账户信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdsecuL_1_42_Info();
                pdsecuL_1_42_InfoList.Add(info);
            }
        }
    }

    public class pdsecuL_1_43_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_1_43_Response()
        {
            this.pdsecuL_1_43_InfoList = new ObservableCollection<pdsecuL_1_43_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_1_43_Info> pdsecuL_1_43_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_1_43_Info info = new pdsecuL_1_43_Info();
            pdsecuL_1_43_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_1_43_InfoList.Add((pdsecuL_1_43_Info)info);
        }
        #endregion

        //逻辑_产品证券_账户_删除证券账户信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdsecuL_1_43_Info();
                pdsecuL_1_43_InfoList.Add(info);
            }
        }
    }

    public class pdsecuL_1_44_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_1_44_Response()
        {
            this.pdsecuL_1_44_InfoList = new ObservableCollection<pdsecuL_1_44_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_1_44_Info> pdsecuL_1_44_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_1_44_Info info = new pdsecuL_1_44_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.update_date = unpacker.GetInt("update_date");
            info.update_time = unpacker.GetInt("update_time");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco = unpacker.GetStr("stock_acco");
            info.stock_acco_name = unpacker.GetStr("stock_acco_name");
            info.stock_acco_status = unpacker.GetStr("stock_acco_status");
            info.stock_acco_apoint_status = unpacker.GetStr("stock_acco_apoint_status");
            info.allow_stock_type = unpacker.GetStr("allow_stock_type");
            info.busi_limit_str = unpacker.GetStr("busi_limit_str");
            info.registration_agency = unpacker.GetStr("registration_agency");
            info.remark_info = unpacker.GetStr("remark_info");
            pdsecuL_1_44_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_1_44_InfoList.Add((pdsecuL_1_44_Info)info);
        }
        #endregion

        //逻辑_产品证券_账户_查询证券账户信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdsecuL_1_44_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    info.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                    info.stock_acco_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NAME_STR);
                    info.stock_acco_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STATUS_STR);
                    info.stock_acco_apoint_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_APOINT_STATUS_STR);
                    info.allow_stock_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_STOCK_TYPE_STR);
                    info.busi_limit_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_LIMIT_STR_STR);
                    info.registration_agency = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REGISTRATION_AGENCY_STR);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    pdsecuL_1_44_InfoList.Add(info);
                }
            }
        }
    }

    public class pdsecuL_1_45_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_1_45_Response()
        {
            this.pdsecuL_1_45_InfoList = new ObservableCollection<pdsecuL_1_45_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_1_45_Info> pdsecuL_1_45_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_1_45_Info info = new pdsecuL_1_45_Info();
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
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pdsecuL_1_45_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_1_45_InfoList.Add((pdsecuL_1_45_Info)info);
        }
        #endregion

        //逻辑_产品证券_账户_查询证券账户信息流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdsecuL_1_45_Info();
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
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pdsecuL_1_45_InfoList.Add(info);
                }
            }
        }
    }

    public class pdsecuL_1_46_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_1_46_Response()
        {
            this.pdsecuL_1_46_InfoList = new ObservableCollection<pdsecuL_1_46_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_1_46_Info> pdsecuL_1_46_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_1_46_Info info = new pdsecuL_1_46_Info();
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
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            pdsecuL_1_46_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_1_46_InfoList.Add((pdsecuL_1_46_Info)info);
        }
        #endregion

        //逻辑_产品证券_账户_查询历史证券账户信息流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdsecuL_1_46_Info();
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
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    pdsecuL_1_46_InfoList.Add(info);
                }
            }
        }
    }

    public class pdsecuL_1_47_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_1_47_Response()
        {
            this.pdsecuL_1_47_InfoList = new ObservableCollection<pdsecuL_1_47_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_1_47_Info> pdsecuL_1_47_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_1_47_Info info = new pdsecuL_1_47_Info();
            pdsecuL_1_47_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_1_47_InfoList.Add((pdsecuL_1_47_Info)info);
        }
        #endregion

        //逻辑_产品证券_账户_冻结证券账户
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdsecuL_1_47_Info();
                pdsecuL_1_47_InfoList.Add(info);
            }
        }
    }

    public class pdsecuL_1_48_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_1_48_Response()
        {
            this.pdsecuL_1_48_InfoList = new ObservableCollection<pdsecuL_1_48_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_1_48_Info> pdsecuL_1_48_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_1_48_Info info = new pdsecuL_1_48_Info();
            pdsecuL_1_48_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_1_48_InfoList.Add((pdsecuL_1_48_Info)info);
        }
        #endregion

        //逻辑_产品证券_账户_恢复证券账户
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdsecuL_1_48_Info();
                pdsecuL_1_48_InfoList.Add(info);
            }
        }
    }

    public class pdsecuL_1_49_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_1_49_Response()
        {
            this.pdsecuL_1_49_InfoList = new ObservableCollection<pdsecuL_1_49_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_1_49_Info> pdsecuL_1_49_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_1_49_Info info = new pdsecuL_1_49_Info();
            pdsecuL_1_49_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_1_49_InfoList.Add((pdsecuL_1_49_Info)info);
        }
        #endregion

        //逻辑_产品证券_账户_注销证券账户
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdsecuL_1_49_Info();
                pdsecuL_1_49_InfoList.Add(info);
            }
        }
    }

    public class pdsecuL_1_51_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_1_51_Response()
        {
            this.pdsecuL_1_51_InfoList = new ObservableCollection<pdsecuL_1_51_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_1_51_Info> pdsecuL_1_51_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_1_51_Info info = new pdsecuL_1_51_Info();
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco = unpacker.GetStr("stock_acco");
            info.stock_acco_name = unpacker.GetStr("stock_acco_name");
            info.stock_acco_status = unpacker.GetStr("stock_acco_status");
            info.stock_acco_apoint_status = unpacker.GetStr("stock_acco_apoint_status");
            info.registration_agency = unpacker.GetStr("registration_agency");
            pdsecuL_1_51_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_1_51_InfoList.Add((pdsecuL_1_51_Info)info);
        }
        #endregion

        //逻辑_产品证券_账户_查询证券账户列表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdsecuL_1_51_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                    info.stock_acco_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NAME_STR);
                    info.stock_acco_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STATUS_STR);
                    info.stock_acco_apoint_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_APOINT_STATUS_STR);
                    info.registration_agency = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REGISTRATION_AGENCY_STR);
                    pdsecuL_1_51_InfoList.Add(info);
                }
            }
        }
    }

    public class pdsecuL_1_61_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_1_61_Response()
        {
            this.pdsecuL_1_61_InfoList = new ObservableCollection<pdsecuL_1_61_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_1_61_Info> pdsecuL_1_61_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_1_61_Info info = new pdsecuL_1_61_Info();
            pdsecuL_1_61_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_1_61_InfoList.Add((pdsecuL_1_61_Info)info);
        }
        #endregion

        //逻辑_产品证券_账户_新增证券账户自动打新配置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdsecuL_1_61_Info();
                pdsecuL_1_61_InfoList.Add(info);
            }
        }
    }

    public class pdsecuL_1_62_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_1_62_Response()
        {
            this.pdsecuL_1_62_InfoList = new ObservableCollection<pdsecuL_1_62_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_1_62_Info> pdsecuL_1_62_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_1_62_Info info = new pdsecuL_1_62_Info();
            pdsecuL_1_62_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_1_62_InfoList.Add((pdsecuL_1_62_Info)info);
        }
        #endregion

        //逻辑_产品证券_账户_修改证券账户自动打新配置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdsecuL_1_62_Info();
                pdsecuL_1_62_InfoList.Add(info);
            }
        }
    }

    public class pdsecuL_1_63_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_1_63_Response()
        {
            this.pdsecuL_1_63_InfoList = new ObservableCollection<pdsecuL_1_63_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_1_63_Info> pdsecuL_1_63_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_1_63_Info info = new pdsecuL_1_63_Info();
            pdsecuL_1_63_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_1_63_InfoList.Add((pdsecuL_1_63_Info)info);
        }
        #endregion

        //逻辑_产品证券_账户_删除证券账户自动打新配置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdsecuL_1_63_Info();
                pdsecuL_1_63_InfoList.Add(info);
            }
        }
    }

    public class pdsecuL_1_64_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_1_64_Response()
        {
            this.pdsecuL_1_64_InfoList = new ObservableCollection<pdsecuL_1_64_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_1_64_Info> pdsecuL_1_64_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_1_64_Info info = new pdsecuL_1_64_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.begin_time = unpacker.GetInt("begin_time");
            pdsecuL_1_64_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_1_64_InfoList.Add((pdsecuL_1_64_Info)info);
        }
        #endregion

        //逻辑_产品证券_账户_查询证券账户自动打新配置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdsecuL_1_64_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.begin_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TIME_INT);
                    pdsecuL_1_64_InfoList.Add(info);
                }
            }
        }
    }

    public class pdsecuL_1_501_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_1_501_Response()
        {
            this.pdsecuL_1_501_InfoList = new ObservableCollection<pdsecuL_1_501_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_1_501_Info> pdsecuL_1_501_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_1_501_Info info = new pdsecuL_1_501_Info();
            info.pass_no = unpacker.GetInt("pass_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.asset_acco = unpacker.GetStr("asset_acco");
            info.out_acco = unpacker.GetStr("out_acco");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco = unpacker.GetStr("stock_acco");
            info.comm_pwd = unpacker.GetStr("comm_pwd");
            info.trade_pwd = unpacker.GetStr("trade_pwd");
            info.config_str = unpacker.GetStr("config_str");
            info.asac_busi_config_str = unpacker.GetStr("asac_busi_config_str");
            pdsecuL_1_501_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_1_501_InfoList.Add((pdsecuL_1_501_Info)info);
        }
        #endregion

        //逻辑_产品证券_账户_查询报盘所需资产账户证券账户信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdsecuL_1_501_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.asset_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STR);
                    info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                    info.comm_pwd = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_PWD_STR);
                    info.trade_pwd = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_PWD_STR);
                    info.config_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_STR_STR);
                    info.asac_busi_config_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ASAC_BUSI_CONFIG_STR_STR);
                    pdsecuL_1_501_InfoList.Add(info);
                }
            }
        }
    }

    public class pdsecuL_1_71_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_1_71_Response()
        {
            this.pdsecuL_1_71_InfoList = new ObservableCollection<pdsecuL_1_71_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_1_71_Info> pdsecuL_1_71_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_1_71_Info info = new pdsecuL_1_71_Info();
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            pdsecuL_1_71_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_1_71_InfoList.Add((pdsecuL_1_71_Info)info);
        }
        #endregion

        //逻辑_产品证券_账户_更新资产账户股东信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdsecuL_1_71_Info();
                info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                pdsecuL_1_71_InfoList.Add(info);
            }
        }
    }

    public class pdsecuL_1_72_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_1_72_Response()
        {
            this.pdsecuL_1_72_InfoList = new ObservableCollection<pdsecuL_1_72_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_1_72_Info> pdsecuL_1_72_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_1_72_Info info = new pdsecuL_1_72_Info();
            pdsecuL_1_72_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_1_72_InfoList.Add((pdsecuL_1_72_Info)info);
        }
        #endregion

        //逻辑_产品证券_账户_注销资产账户和证券账户
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdsecuL_1_72_Info();
                pdsecuL_1_72_InfoList.Add(info);
            }
        }
    }

    public class pdsecuL_1_73_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_1_73_Response()
        {
            this.pdsecuL_1_73_InfoList = new ObservableCollection<pdsecuL_1_73_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_1_73_Info> pdsecuL_1_73_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_1_73_Info info = new pdsecuL_1_73_Info();
            pdsecuL_1_73_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_1_73_InfoList.Add((pdsecuL_1_73_Info)info);
        }
        #endregion

        //逻辑_产品证券_账户_新增证券账户自动逆回购配置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdsecuL_1_73_Info();
                pdsecuL_1_73_InfoList.Add(info);
            }
        }
    }

    public class pdsecuL_1_74_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_1_74_Response()
        {
            this.pdsecuL_1_74_InfoList = new ObservableCollection<pdsecuL_1_74_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_1_74_Info> pdsecuL_1_74_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_1_74_Info info = new pdsecuL_1_74_Info();
            pdsecuL_1_74_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_1_74_InfoList.Add((pdsecuL_1_74_Info)info);
        }
        #endregion

        //逻辑_产品证券_账户_修改证券账户自动逆回购配置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdsecuL_1_74_Info();
                pdsecuL_1_74_InfoList.Add(info);
            }
        }
    }

    public class pdsecuL_1_75_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_1_75_Response()
        {
            this.pdsecuL_1_75_InfoList = new ObservableCollection<pdsecuL_1_75_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_1_75_Info> pdsecuL_1_75_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_1_75_Info info = new pdsecuL_1_75_Info();
            pdsecuL_1_75_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_1_75_InfoList.Add((pdsecuL_1_75_Info)info);
        }
        #endregion

        //逻辑_产品证券_账户_删除证券账户自动逆回购配置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdsecuL_1_75_Info();
                pdsecuL_1_75_InfoList.Add(info);
            }
        }
    }

    public class pdsecuL_1_76_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_1_76_Response()
        {
            this.pdsecuL_1_76_InfoList = new ObservableCollection<pdsecuL_1_76_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_1_76_Info> pdsecuL_1_76_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_1_76_Info info = new pdsecuL_1_76_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.begin_time = unpacker.GetInt("begin_time");
            info.avail_cash = unpacker.GetDouble("avail_cash");
            info.intrst_ratio = unpacker.GetDouble("intrst_ratio");
            info.mul_acco_trd_qty = unpacker.GetInt("mul_acco_trd_qty");
            info.exec_price_type = unpacker.GetInt("exec_price_type");
            info.task_status = unpacker.GetStr("task_status");
            info.order_no = unpacker.GetInt("order_no");
            pdsecuL_1_76_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_1_76_InfoList.Add((pdsecuL_1_76_Info)info);
        }
        #endregion

        //逻辑_产品证券_账户_查询证券账户自动逆回购配置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdsecuL_1_76_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.begin_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TIME_INT);
                    info.avail_cash = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVAIL_CASH_FLOAT);
                    info.intrst_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_RATIO_FLOAT);
                    info.mul_acco_trd_qty = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MUL_ACCO_TRD_QTY_INT);
                    info.exec_price_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_PRICE_TYPE_INT);
                    info.task_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STATUS_STR);
                    info.order_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_NO_INT);
                    pdsecuL_1_76_InfoList.Add(info);
                }
            }
        }
    }

    public class pdsecuL_1_77_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_1_77_Response()
        {
            this.pdsecuL_1_77_InfoList = new ObservableCollection<pdsecuL_1_77_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_1_77_Info> pdsecuL_1_77_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_1_77_Info info = new pdsecuL_1_77_Info();
            pdsecuL_1_77_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_1_77_InfoList.Add((pdsecuL_1_77_Info)info);
        }
        #endregion

        //逻辑_产品证券_账户_修改默认交易组转移资金持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdsecuL_1_77_Info();
                pdsecuL_1_77_InfoList.Add(info);
            }
        }
    }

}
