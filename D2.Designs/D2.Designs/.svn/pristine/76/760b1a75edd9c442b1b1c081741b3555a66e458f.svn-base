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
    public class prodL_1_1_Response : IResponse
    {
        #region 构造函数
        public prodL_1_1_Response()
        {
            this.prodL_1_1_InfoList = new ObservableCollection<prodL_1_1_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_1_Info> prodL_1_1_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_1_Info info = new prodL_1_1_Info();
            info.pd_no = unpacker.GetInt("pd_no");
            prodL_1_1_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_1_InfoList.Add((prodL_1_1_Info)info);
        }
        #endregion

        //逻辑_产品_账户_新增产品信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new prodL_1_1_Info();
                info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                prodL_1_1_InfoList.Add(info);
            }
        }
    }

    public class prodL_1_2_Response : IResponse
    {
        #region 构造函数
        public prodL_1_2_Response()
        {
            this.prodL_1_2_InfoList = new ObservableCollection<prodL_1_2_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_2_Info> prodL_1_2_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_2_Info info = new prodL_1_2_Info();
            prodL_1_2_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_2_InfoList.Add((prodL_1_2_Info)info);
        }
        #endregion

        //逻辑_产品_账户_修改产品信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new prodL_1_2_Info();
                prodL_1_2_InfoList.Add(info);
            }
        }
    }

    public class prodL_1_4_Response : IResponse
    {
        #region 构造函数
        public prodL_1_4_Response()
        {
            this.prodL_1_4_InfoList = new ObservableCollection<prodL_1_4_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_4_Info> prodL_1_4_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_4_Info info = new prodL_1_4_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.update_date = unpacker.GetInt("update_date");
            info.update_time = unpacker.GetInt("update_time");
            info.pd_no = unpacker.GetInt("pd_no");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_code = unpacker.GetStr("pd_code");
            info.pd_name = unpacker.GetStr("pd_name");
            info.pd_flname = unpacker.GetStr("pd_flname");
            info.fund_reg_code = unpacker.GetStr("fund_reg_code");
            info.pd_manager = unpacker.GetStr("pd_manager");
            info.found_date = unpacker.GetInt("found_date");
            info.pd_type = unpacker.GetInt("pd_type");
            info.apply_currency = unpacker.GetStr("apply_currency");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.first_asset = unpacker.GetDouble("first_asset");
            info.first_amt = unpacker.GetDouble("first_amt");
            info.pd_all_share = unpacker.GetDouble("pd_all_share");
            info.curr_share = unpacker.GetDouble("curr_share");
            info.pre_share = unpacker.GetDouble("pre_share");
            info.his_max_per_nav = unpacker.GetDouble("his_max_per_nav");
            info.pre_nav = unpacker.GetDouble("pre_nav");
            info.coust_full_name = unpacker.GetStr("coust_full_name");
            info.coust_acco = unpacker.GetStr("coust_acco");
            info.coust_acco_name = unpacker.GetStr("coust_acco_name");
            info.warn_posi_value = unpacker.GetDouble("warn_posi_value");
            info.close_posi_value = unpacker.GetDouble("close_posi_value");
            info.target_posi_ratio = unpacker.GetDouble("target_posi_ratio");
            info.beta_coeffi = unpacker.GetDouble("beta_coeffi");
            info.custom_pd_class = unpacker.GetStr("custom_pd_class");
            info.pd_status = unpacker.GetStr("pd_status");
            info.remark_info = unpacker.GetStr("remark_info");
            info.index_value = unpacker.GetInt("index_value");
            prodL_1_4_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_4_InfoList.Add((prodL_1_4_Info)info);
        }
        #endregion

        //逻辑_产品_账户_查询产品信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new prodL_1_4_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    info.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    info.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    info.pd_flname = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_FLNAME_STR);
                    info.fund_reg_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FUND_REG_CODE_STR);
                    info.pd_manager = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_MANAGER_STR);
                    info.found_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FOUND_DATE_INT);
                    info.pd_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_TYPE_INT);
                    info.apply_currency = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_APPLY_CURRENCY_STR);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.first_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FIRST_ASSET_FLOAT);
                    info.first_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FIRST_AMT_FLOAT);
                    info.pd_all_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_ALL_SHARE_FLOAT);
                    info.curr_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_SHARE_FLOAT);
                    info.pre_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SHARE_FLOAT);
                    info.his_max_per_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HIS_MAX_PER_NAV_FLOAT);
                    info.pre_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_NAV_FLOAT);
                    info.coust_full_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COUST_FULL_NAME_STR);
                    info.coust_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COUST_ACCO_STR);
                    info.coust_acco_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COUST_ACCO_NAME_STR);
                    info.warn_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WARN_POSI_VALUE_FLOAT);
                    info.close_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_VALUE_FLOAT);
                    info.target_posi_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_POSI_RATIO_FLOAT);
                    info.beta_coeffi = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BETA_COEFFI_FLOAT);
                    info.custom_pd_class = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CUSTOM_PD_CLASS_STR);
                    info.pd_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_STATUS_STR);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    info.index_value = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDEX_VALUE_INT);
                    prodL_1_4_InfoList.Add(info);
                }
            }
        }
    }

    public class prodL_1_5_Response : IResponse
    {
        #region 构造函数
        public prodL_1_5_Response()
        {
            this.prodL_1_5_InfoList = new ObservableCollection<prodL_1_5_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_5_Info> prodL_1_5_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_5_Info info = new prodL_1_5_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.update_date = unpacker.GetInt("update_date");
            info.update_time = unpacker.GetInt("update_time");
            info.init_date = unpacker.GetInt("init_date");
            info.pd_no = unpacker.GetInt("pd_no");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_code = unpacker.GetStr("pd_code");
            info.pd_name = unpacker.GetStr("pd_name");
            info.pd_flname = unpacker.GetStr("pd_flname");
            info.fund_reg_code = unpacker.GetStr("fund_reg_code");
            info.pd_manager = unpacker.GetStr("pd_manager");
            info.found_date = unpacker.GetInt("found_date");
            info.pd_type = unpacker.GetInt("pd_type");
            info.apply_currency = unpacker.GetStr("apply_currency");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.first_asset = unpacker.GetDouble("first_asset");
            info.first_amt = unpacker.GetDouble("first_amt");
            info.pd_all_share = unpacker.GetDouble("pd_all_share");
            info.curr_share = unpacker.GetDouble("curr_share");
            info.pre_share = unpacker.GetDouble("pre_share");
            info.his_max_per_nav = unpacker.GetDouble("his_max_per_nav");
            info.pre_nav = unpacker.GetDouble("pre_nav");
            info.coust_full_name = unpacker.GetStr("coust_full_name");
            info.coust_acco = unpacker.GetStr("coust_acco");
            info.coust_acco_name = unpacker.GetStr("coust_acco_name");
            info.warn_posi_value = unpacker.GetDouble("warn_posi_value");
            info.close_posi_value = unpacker.GetDouble("close_posi_value");
            info.target_posi_ratio = unpacker.GetDouble("target_posi_ratio");
            info.beta_coeffi = unpacker.GetDouble("beta_coeffi");
            info.custom_pd_class = unpacker.GetStr("custom_pd_class");
            info.pd_status = unpacker.GetStr("pd_status");
            info.remark_info = unpacker.GetStr("remark_info");
            info.index_value = unpacker.GetInt("index_value");
            prodL_1_5_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_5_InfoList.Add((prodL_1_5_Info)info);
        }
        #endregion

        //逻辑_产品_账户_查询历史产品信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new prodL_1_5_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    info.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    info.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    info.pd_flname = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_FLNAME_STR);
                    info.fund_reg_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FUND_REG_CODE_STR);
                    info.pd_manager = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_MANAGER_STR);
                    info.found_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FOUND_DATE_INT);
                    info.pd_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_TYPE_INT);
                    info.apply_currency = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_APPLY_CURRENCY_STR);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.first_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FIRST_ASSET_FLOAT);
                    info.first_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FIRST_AMT_FLOAT);
                    info.pd_all_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_ALL_SHARE_FLOAT);
                    info.curr_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_SHARE_FLOAT);
                    info.pre_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SHARE_FLOAT);
                    info.his_max_per_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HIS_MAX_PER_NAV_FLOAT);
                    info.pre_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_NAV_FLOAT);
                    info.coust_full_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COUST_FULL_NAME_STR);
                    info.coust_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COUST_ACCO_STR);
                    info.coust_acco_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COUST_ACCO_NAME_STR);
                    info.warn_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WARN_POSI_VALUE_FLOAT);
                    info.close_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_VALUE_FLOAT);
                    info.target_posi_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_POSI_RATIO_FLOAT);
                    info.beta_coeffi = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BETA_COEFFI_FLOAT);
                    info.custom_pd_class = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CUSTOM_PD_CLASS_STR);
                    info.pd_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_STATUS_STR);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    info.index_value = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDEX_VALUE_INT);
                    prodL_1_5_InfoList.Add(info);
                }
            }
        }
    }

    public class prodL_1_6_Response : IResponse
    {
        #region 构造函数
        public prodL_1_6_Response()
        {
            this.prodL_1_6_InfoList = new ObservableCollection<prodL_1_6_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_6_Info> prodL_1_6_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_6_Info info = new prodL_1_6_Info();
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
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            prodL_1_6_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_6_InfoList.Add((prodL_1_6_Info)info);
        }
        #endregion

        //逻辑_产品_账户_查询产品信息流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new prodL_1_6_Info();
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
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    prodL_1_6_InfoList.Add(info);
                }
            }
        }
    }

    public class prodL_1_7_Response : IResponse
    {
        #region 构造函数
        public prodL_1_7_Response()
        {
            this.prodL_1_7_InfoList = new ObservableCollection<prodL_1_7_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_7_Info> prodL_1_7_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_7_Info info = new prodL_1_7_Info();
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
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            prodL_1_7_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_7_InfoList.Add((prodL_1_7_Info)info);
        }
        #endregion

        //逻辑_产品_账户_查询历史产品信息流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new prodL_1_7_Info();
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
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    prodL_1_7_InfoList.Add(info);
                }
            }
        }
    }

    public class prodL_1_8_Response : IResponse
    {
        #region 构造函数
        public prodL_1_8_Response()
        {
            this.prodL_1_8_InfoList = new ObservableCollection<prodL_1_8_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_8_Info> prodL_1_8_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_8_Info info = new prodL_1_8_Info();
            prodL_1_8_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_8_InfoList.Add((prodL_1_8_Info)info);
        }
        #endregion

        //逻辑_产品_账户_冻结产品
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new prodL_1_8_Info();
                prodL_1_8_InfoList.Add(info);
            }
        }
    }

    public class prodL_1_9_Response : IResponse
    {
        #region 构造函数
        public prodL_1_9_Response()
        {
            this.prodL_1_9_InfoList = new ObservableCollection<prodL_1_9_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_9_Info> prodL_1_9_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_9_Info info = new prodL_1_9_Info();
            prodL_1_9_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_9_InfoList.Add((prodL_1_9_Info)info);
        }
        #endregion

        //逻辑_产品_账户_恢复产品
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new prodL_1_9_Info();
                prodL_1_9_InfoList.Add(info);
            }
        }
    }

    public class prodL_1_10_Response : IResponse
    {
        #region 构造函数
        public prodL_1_10_Response()
        {
            this.prodL_1_10_InfoList = new ObservableCollection<prodL_1_10_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_10_Info> prodL_1_10_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_10_Info info = new prodL_1_10_Info();
            prodL_1_10_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_10_InfoList.Add((prodL_1_10_Info)info);
        }
        #endregion

        //逻辑_产品_账户_注销产品
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new prodL_1_10_Info();
                prodL_1_10_InfoList.Add(info);
            }
        }
    }

    public class prodL_1_11_Response : IResponse
    {
        #region 构造函数
        public prodL_1_11_Response()
        {
            this.prodL_1_11_InfoList = new ObservableCollection<prodL_1_11_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_11_Info> prodL_1_11_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_11_Info info = new prodL_1_11_Info();
            prodL_1_11_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_11_InfoList.Add((prodL_1_11_Info)info);
        }
        #endregion

        //逻辑_产品_账户_检查产品存在
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new prodL_1_11_Info();
                prodL_1_11_InfoList.Add(info);
            }
        }
    }

    public class prodL_1_12_Response : IResponse
    {
        #region 构造函数
        public prodL_1_12_Response()
        {
            this.prodL_1_12_InfoList = new ObservableCollection<prodL_1_12_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_12_Info> prodL_1_12_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_12_Info info = new prodL_1_12_Info();
            info.pd_no = unpacker.GetInt("pd_no");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_code = unpacker.GetStr("pd_code");
            info.pd_name = unpacker.GetStr("pd_name");
            info.pd_status = unpacker.GetStr("pd_status");
            prodL_1_12_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_12_InfoList.Add((prodL_1_12_Info)info);
        }
        #endregion

        //逻辑_产品_账户_查询全部产品列表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new prodL_1_12_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    info.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    info.pd_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_STATUS_STR);
                    prodL_1_12_InfoList.Add(info);
                }
            }
        }
    }

    public class prodL_1_13_Response : IResponse
    {
        #region 构造函数
        public prodL_1_13_Response()
        {
            this.prodL_1_13_InfoList = new ObservableCollection<prodL_1_13_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_13_Info> prodL_1_13_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_13_Info info = new prodL_1_13_Info();
            info.pd_no = unpacker.GetInt("pd_no");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_code = unpacker.GetStr("pd_code");
            info.pd_name = unpacker.GetStr("pd_name");
            info.pd_status = unpacker.GetStr("pd_status");
            info.pd_busi_config_str = unpacker.GetStr("pd_busi_config_str");
            info.comm_no_limit_price_ratio = unpacker.GetDouble("comm_no_limit_price_ratio");
            prodL_1_13_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_13_InfoList.Add((prodL_1_13_Info)info);
        }
        #endregion

        //逻辑_产品_账户_查询可见产品列表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new prodL_1_13_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    info.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    info.pd_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_STATUS_STR);
                    info.pd_busi_config_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_BUSI_CONFIG_STR_STR);
                    info.comm_no_limit_price_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_NO_LIMIT_PRICE_RATIO_FLOAT);
                    prodL_1_13_InfoList.Add(info);
                }
            }
        }
    }

    public class prodL_1_17_Response : IResponse
    {
        #region 构造函数
        public prodL_1_17_Response()
        {
            this.prodL_1_17_InfoList = new ObservableCollection<prodL_1_17_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_17_Info> prodL_1_17_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_17_Info info = new prodL_1_17_Info();
            info.pd_no = unpacker.GetInt("pd_no");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_code = unpacker.GetStr("pd_code");
            info.pd_name = unpacker.GetStr("pd_name");
            info.his_max_per_nav = unpacker.GetDouble("his_max_per_nav");
            info.crncy_type = unpacker.GetStr("crncy_type");
            prodL_1_17_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_17_InfoList.Add((prodL_1_17_Info)info);
        }
        #endregion

        //逻辑_产品_账户_查询产品历史最高单位净值
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new prodL_1_17_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    info.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    info.his_max_per_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HIS_MAX_PER_NAV_FLOAT);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    prodL_1_17_InfoList.Add(info);
                }
            }
        }
    }

    public class prodL_1_22_Response : IResponse
    {
        #region 构造函数
        public prodL_1_22_Response()
        {
            this.prodL_1_22_InfoList = new ObservableCollection<prodL_1_22_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_22_Info> prodL_1_22_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_22_Info info = new prodL_1_22_Info();
            prodL_1_22_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_22_InfoList.Add((prodL_1_22_Info)info);
        }
        #endregion

        //逻辑_产品_账户_修改产品限制信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new prodL_1_22_Info();
                prodL_1_22_InfoList.Add(info);
            }
        }
    }

    public class prodL_1_24_Response : IResponse
    {
        #region 构造函数
        public prodL_1_24_Response()
        {
            this.prodL_1_24_InfoList = new ObservableCollection<prodL_1_24_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_24_Info> prodL_1_24_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_24_Info info = new prodL_1_24_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.update_date = unpacker.GetInt("update_date");
            info.update_time = unpacker.GetInt("update_time");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.cost_calc_type = unpacker.GetInt("cost_calc_type");
            info.allow_exch = unpacker.GetStr("allow_exch");
            info.allow_stock_type = unpacker.GetStr("allow_stock_type");
            info.busi_config_str = unpacker.GetStr("busi_config_str");
            info.comm_appr_oper = unpacker.GetInt("comm_appr_oper");
            info.market_price_ratio = unpacker.GetDouble("market_price_ratio");
            info.forbid_order_dir = unpacker.GetStr("forbid_order_dir");
            info.pd_status = unpacker.GetStr("pd_status");
            info.comm_no_limit_price_ratio = unpacker.GetDouble("comm_no_limit_price_ratio");
            info.remark_info = unpacker.GetStr("remark_info");
            prodL_1_24_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_24_InfoList.Add((prodL_1_24_Info)info);
        }
        #endregion

        //逻辑_产品_账户_查询产品限制信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new prodL_1_24_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    info.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.cost_calc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COST_CALC_TYPE_INT);
                    info.allow_exch = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_EXCH_STR);
                    info.allow_stock_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_STOCK_TYPE_STR);
                    info.busi_config_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_CONFIG_STR_STR);
                    info.comm_appr_oper = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_OPER_INT);
                    info.market_price_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_PRICE_RATIO_FLOAT);
                    info.forbid_order_dir = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FORBID_ORDER_DIR_STR);
                    info.pd_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_STATUS_STR);
                    info.comm_no_limit_price_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_NO_LIMIT_PRICE_RATIO_FLOAT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    prodL_1_24_InfoList.Add(info);
                }
            }
        }
    }

    public class prodL_1_25_Response : IResponse
    {
        #region 构造函数
        public prodL_1_25_Response()
        {
            this.prodL_1_25_InfoList = new ObservableCollection<prodL_1_25_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_25_Info> prodL_1_25_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_25_Info info = new prodL_1_25_Info();
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
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            prodL_1_25_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_25_InfoList.Add((prodL_1_25_Info)info);
        }
        #endregion

        //逻辑_产品_账户_查询产品限制信息流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new prodL_1_25_Info();
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
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    prodL_1_25_InfoList.Add(info);
                }
            }
        }
    }

    public class prodL_1_26_Response : IResponse
    {
        #region 构造函数
        public prodL_1_26_Response()
        {
            this.prodL_1_26_InfoList = new ObservableCollection<prodL_1_26_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_26_Info> prodL_1_26_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_26_Info info = new prodL_1_26_Info();
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
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            prodL_1_26_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_26_InfoList.Add((prodL_1_26_Info)info);
        }
        #endregion

        //逻辑_产品_账户_查询历史产品限制信息流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new prodL_1_26_Info();
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
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    prodL_1_26_InfoList.Add(info);
                }
            }
        }
    }

    public class prodL_1_27_Response : IResponse
    {
        #region 构造函数
        public prodL_1_27_Response()
        {
            this.prodL_1_27_InfoList = new ObservableCollection<prodL_1_27_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_27_Info> prodL_1_27_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_27_Info info = new prodL_1_27_Info();
            prodL_1_27_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_27_InfoList.Add((prodL_1_27_Info)info);
        }
        #endregion

        //逻辑_产品_账户_修改产品业务控制配置串
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new prodL_1_27_Info();
                prodL_1_27_InfoList.Add(info);
            }
        }
    }

    public class prodL_1_28_Response : IResponse
    {
        #region 构造函数
        public prodL_1_28_Response()
        {
            this.prodL_1_28_InfoList = new ObservableCollection<prodL_1_28_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_28_Info> prodL_1_28_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_28_Info info = new prodL_1_28_Info();
            prodL_1_28_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_28_InfoList.Add((prodL_1_28_Info)info);
        }
        #endregion

        //逻辑_产品_账户_修改产品禁止订单方向
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new prodL_1_28_Info();
                prodL_1_28_InfoList.Add(info);
            }
        }
    }

    public class prodL_1_29_Response : IResponse
    {
        #region 构造函数
        public prodL_1_29_Response()
        {
            this.prodL_1_29_InfoList = new ObservableCollection<prodL_1_29_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_29_Info> prodL_1_29_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_29_Info info = new prodL_1_29_Info();
            prodL_1_29_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_29_InfoList.Add((prodL_1_29_Info)info);
        }
        #endregion

        //逻辑_产品_账户_修改产品允许订单方向
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new prodL_1_29_Info();
                prodL_1_29_InfoList.Add(info);
            }
        }
    }

    public class prodL_1_30_Response : IResponse
    {
        #region 构造函数
        public prodL_1_30_Response()
        {
            this.prodL_1_30_InfoList = new ObservableCollection<prodL_1_30_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_30_Info> prodL_1_30_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_30_Info info = new prodL_1_30_Info();
            prodL_1_30_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_30_InfoList.Add((prodL_1_30_Info)info);
        }
        #endregion

        //逻辑_产品_账户_检查银行账户存在
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new prodL_1_30_Info();
                prodL_1_30_InfoList.Add(info);
            }
        }
    }

    public class prodL_1_31_Response : IResponse
    {
        #region 构造函数
        public prodL_1_31_Response()
        {
            this.prodL_1_31_InfoList = new ObservableCollection<prodL_1_31_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_31_Info> prodL_1_31_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_31_Info info = new prodL_1_31_Info();
            info.bank_acco_no = unpacker.GetInt("bank_acco_no");
            prodL_1_31_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_31_InfoList.Add((prodL_1_31_Info)info);
        }
        #endregion

        //逻辑_产品_账户_新增银行账户信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new prodL_1_31_Info();
                info.bank_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BANK_ACCO_NO_INT);
                prodL_1_31_InfoList.Add(info);
            }
        }
    }

    public class prodL_1_32_Response : IResponse
    {
        #region 构造函数
        public prodL_1_32_Response()
        {
            this.prodL_1_32_InfoList = new ObservableCollection<prodL_1_32_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_32_Info> prodL_1_32_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_32_Info info = new prodL_1_32_Info();
            prodL_1_32_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_32_InfoList.Add((prodL_1_32_Info)info);
        }
        #endregion

        //逻辑_产品_账户_修改银行账户信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new prodL_1_32_Info();
                prodL_1_32_InfoList.Add(info);
            }
        }
    }

    public class prodL_1_33_Response : IResponse
    {
        #region 构造函数
        public prodL_1_33_Response()
        {
            this.prodL_1_33_InfoList = new ObservableCollection<prodL_1_33_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_33_Info> prodL_1_33_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_33_Info info = new prodL_1_33_Info();
            prodL_1_33_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_33_InfoList.Add((prodL_1_33_Info)info);
        }
        #endregion

        //逻辑_产品_账户_删除银行账户信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new prodL_1_33_Info();
                prodL_1_33_InfoList.Add(info);
            }
        }
    }

    public class prodL_1_34_Response : IResponse
    {
        #region 构造函数
        public prodL_1_34_Response()
        {
            this.prodL_1_34_InfoList = new ObservableCollection<prodL_1_34_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_34_Info> prodL_1_34_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_34_Info info = new prodL_1_34_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.update_date = unpacker.GetInt("update_date");
            info.update_time = unpacker.GetInt("update_time");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.bank_acco_no = unpacker.GetInt("bank_acco_no");
            info.bank_code = unpacker.GetStr("bank_code");
            info.bank_name = unpacker.GetStr("bank_name");
            info.bank_acco = unpacker.GetStr("bank_acco");
            info.remark_info = unpacker.GetStr("remark_info");
            prodL_1_34_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_34_InfoList.Add((prodL_1_34_Info)info);
        }
        #endregion

        //逻辑_产品_账户_查询银行账户信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new prodL_1_34_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    info.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.bank_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BANK_ACCO_NO_INT);
                    info.bank_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BANK_CODE_STR);
                    info.bank_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BANK_NAME_STR);
                    info.bank_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BANK_ACCO_STR);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    prodL_1_34_InfoList.Add(info);
                }
            }
        }
    }

    public class prodL_1_35_Response : IResponse
    {
        #region 构造函数
        public prodL_1_35_Response()
        {
            this.prodL_1_35_InfoList = new ObservableCollection<prodL_1_35_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_35_Info> prodL_1_35_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_35_Info info = new prodL_1_35_Info();
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
            info.bank_acco_no = unpacker.GetInt("bank_acco_no");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            prodL_1_35_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_35_InfoList.Add((prodL_1_35_Info)info);
        }
        #endregion

        //逻辑_产品_账户_查询银行账户信息流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new prodL_1_35_Info();
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
                    info.bank_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BANK_ACCO_NO_INT);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    prodL_1_35_InfoList.Add(info);
                }
            }
        }
    }

    public class prodL_1_36_Response : IResponse
    {
        #region 构造函数
        public prodL_1_36_Response()
        {
            this.prodL_1_36_InfoList = new ObservableCollection<prodL_1_36_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_36_Info> prodL_1_36_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_36_Info info = new prodL_1_36_Info();
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
            info.bank_acco_no = unpacker.GetInt("bank_acco_no");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            prodL_1_36_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_36_InfoList.Add((prodL_1_36_Info)info);
        }
        #endregion

        //逻辑_产品_账户_查询历史银行账户信息流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new prodL_1_36_Info();
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
                    info.bank_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BANK_ACCO_NO_INT);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    prodL_1_36_InfoList.Add(info);
                }
            }
        }
    }

    public class prodL_1_40_Response : IResponse
    {
        #region 构造函数
        public prodL_1_40_Response()
        {
            this.prodL_1_40_InfoList = new ObservableCollection<prodL_1_40_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_40_Info> prodL_1_40_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_40_Info info = new prodL_1_40_Info();
            prodL_1_40_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_40_InfoList.Add((prodL_1_40_Info)info);
        }
        #endregion

        //逻辑_产品_账户_检查资产账户存在
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new prodL_1_40_Info();
                prodL_1_40_InfoList.Add(info);
            }
        }
    }

    public class prodL_1_41_Response : IResponse
    {
        #region 构造函数
        public prodL_1_41_Response()
        {
            this.prodL_1_41_InfoList = new ObservableCollection<prodL_1_41_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_41_Info> prodL_1_41_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_41_Info info = new prodL_1_41_Info();
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            prodL_1_41_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_41_InfoList.Add((prodL_1_41_Info)info);
        }
        #endregion

        //逻辑_产品_账户_新增资产账户信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new prodL_1_41_Info();
                info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                prodL_1_41_InfoList.Add(info);
            }
        }
    }

    public class prodL_1_42_Response : IResponse
    {
        #region 构造函数
        public prodL_1_42_Response()
        {
            this.prodL_1_42_InfoList = new ObservableCollection<prodL_1_42_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_42_Info> prodL_1_42_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_42_Info info = new prodL_1_42_Info();
            prodL_1_42_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_42_InfoList.Add((prodL_1_42_Info)info);
        }
        #endregion

        //逻辑_产品_账户_修改资产账户信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new prodL_1_42_Info();
                prodL_1_42_InfoList.Add(info);
            }
        }
    }

    public class prodL_1_43_Response : IResponse
    {
        #region 构造函数
        public prodL_1_43_Response()
        {
            this.prodL_1_43_InfoList = new ObservableCollection<prodL_1_43_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_43_Info> prodL_1_43_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_43_Info info = new prodL_1_43_Info();
            prodL_1_43_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_43_InfoList.Add((prodL_1_43_Info)info);
        }
        #endregion

        //逻辑_产品_账户_删除资产账户信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new prodL_1_43_Info();
                prodL_1_43_InfoList.Add(info);
            }
        }
    }

    public class prodL_1_44_Response : IResponse
    {
        #region 构造函数
        public prodL_1_44_Response()
        {
            this.prodL_1_44_InfoList = new ObservableCollection<prodL_1_44_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_44_Info> prodL_1_44_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_44_Info info = new prodL_1_44_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.update_date = unpacker.GetInt("update_date");
            info.update_time = unpacker.GetInt("update_time");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.asset_acco = unpacker.GetStr("asset_acco");
            info.asset_acco_name = unpacker.GetStr("asset_acco_name");
            info.asset_acco_type = unpacker.GetInt("asset_acco_type");
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.trade_pwd = unpacker.GetStr("trade_pwd");
            info.asset_acco_status = unpacker.GetStr("asset_acco_status");
            info.busi_config_str = unpacker.GetStr("busi_config_str");
            info.market_price_ratio = unpacker.GetDouble("market_price_ratio");
            info.allow_exch = unpacker.GetStr("allow_exch");
            info.allow_stock_type = unpacker.GetStr("allow_stock_type");
            info.split_fee_typr_str = unpacker.GetStr("split_fee_typr_str");
            info.busi_limit_str = unpacker.GetStr("busi_limit_str");
            info.exter_comm_flag = unpacker.GetInt("exter_comm_flag");
            info.remark_info = unpacker.GetStr("remark_info");
            info.busi_depart = unpacker.GetStr("busi_depart");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            prodL_1_44_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_44_InfoList.Add((prodL_1_44_Info)info);
        }
        #endregion

        //逻辑_产品_账户_查询资产账户信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new prodL_1_44_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    info.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.asset_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STR);
                    info.asset_acco_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NAME_STR);
                    info.asset_acco_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_TYPE_INT);
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    info.trade_pwd = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_PWD_STR);
                    info.asset_acco_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STATUS_STR);
                    info.busi_config_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_CONFIG_STR_STR);
                    info.market_price_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_PRICE_RATIO_FLOAT);
                    info.allow_exch = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_EXCH_STR);
                    info.allow_stock_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_STOCK_TYPE_STR);
                    info.split_fee_typr_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_SPLIT_FEE_TYPR_STR_STR);
                    info.busi_limit_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_LIMIT_STR_STR);
                    info.exter_comm_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXTER_COMM_FLAG_INT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    info.busi_depart = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_DEPART_STR);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    prodL_1_44_InfoList.Add(info);
                }
            }
        }
    }

    public class prodL_1_45_Response : IResponse
    {
        #region 构造函数
        public prodL_1_45_Response()
        {
            this.prodL_1_45_InfoList = new ObservableCollection<prodL_1_45_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_45_Info> prodL_1_45_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_45_Info info = new prodL_1_45_Info();
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
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            prodL_1_45_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_45_InfoList.Add((prodL_1_45_Info)info);
        }
        #endregion

        //逻辑_产品_账户_查询资产账户信息流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new prodL_1_45_Info();
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
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    prodL_1_45_InfoList.Add(info);
                }
            }
        }
    }

    public class prodL_1_46_Response : IResponse
    {
        #region 构造函数
        public prodL_1_46_Response()
        {
            this.prodL_1_46_InfoList = new ObservableCollection<prodL_1_46_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_46_Info> prodL_1_46_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_46_Info info = new prodL_1_46_Info();
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
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            prodL_1_46_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_46_InfoList.Add((prodL_1_46_Info)info);
        }
        #endregion

        //逻辑_产品_账户_查询历史资产账户信息流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new prodL_1_46_Info();
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
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    prodL_1_46_InfoList.Add(info);
                }
            }
        }
    }

    public class prodL_1_47_Response : IResponse
    {
        #region 构造函数
        public prodL_1_47_Response()
        {
            this.prodL_1_47_InfoList = new ObservableCollection<prodL_1_47_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_47_Info> prodL_1_47_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_47_Info info = new prodL_1_47_Info();
            prodL_1_47_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_47_InfoList.Add((prodL_1_47_Info)info);
        }
        #endregion

        //逻辑_产品_账户_冻结资产账户
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new prodL_1_47_Info();
                prodL_1_47_InfoList.Add(info);
            }
        }
    }

    public class prodL_1_48_Response : IResponse
    {
        #region 构造函数
        public prodL_1_48_Response()
        {
            this.prodL_1_48_InfoList = new ObservableCollection<prodL_1_48_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_48_Info> prodL_1_48_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_48_Info info = new prodL_1_48_Info();
            prodL_1_48_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_48_InfoList.Add((prodL_1_48_Info)info);
        }
        #endregion

        //逻辑_产品_账户_恢复资产账户
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new prodL_1_48_Info();
                prodL_1_48_InfoList.Add(info);
            }
        }
    }

    public class prodL_1_49_Response : IResponse
    {
        #region 构造函数
        public prodL_1_49_Response()
        {
            this.prodL_1_49_InfoList = new ObservableCollection<prodL_1_49_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_49_Info> prodL_1_49_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_49_Info info = new prodL_1_49_Info();
            prodL_1_49_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_49_InfoList.Add((prodL_1_49_Info)info);
        }
        #endregion

        //逻辑_产品_账户_注销资产账户
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new prodL_1_49_Info();
                prodL_1_49_InfoList.Add(info);
            }
        }
    }

    public class prodL_1_50_Response : IResponse
    {
        #region 构造函数
        public prodL_1_50_Response()
        {
            this.prodL_1_50_InfoList = new ObservableCollection<prodL_1_50_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_50_Info> prodL_1_50_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_50_Info info = new prodL_1_50_Info();
            prodL_1_50_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_50_InfoList.Add((prodL_1_50_Info)info);
        }
        #endregion

        //逻辑_产品_账户_修改资产账户密码
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new prodL_1_50_Info();
                prodL_1_50_InfoList.Add(info);
            }
        }
    }

    public class prodL_1_51_Response : IResponse
    {
        #region 构造函数
        public prodL_1_51_Response()
        {
            this.prodL_1_51_InfoList = new ObservableCollection<prodL_1_51_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_51_Info> prodL_1_51_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_51_Info info = new prodL_1_51_Info();
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.asset_acco = unpacker.GetStr("asset_acco");
            info.asset_acco_name = unpacker.GetStr("asset_acco_name");
            info.asset_acco_status = unpacker.GetStr("asset_acco_status");
            prodL_1_51_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_51_InfoList.Add((prodL_1_51_Info)info);
        }
        #endregion

        //逻辑_产品_账户_查询资产账户列表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new prodL_1_51_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.asset_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STR);
                    info.asset_acco_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NAME_STR);
                    info.asset_acco_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STATUS_STR);
                    prodL_1_51_InfoList.Add(info);
                }
            }
        }
    }

    public class prodL_1_52_Response : IResponse
    {
        #region 构造函数
        public prodL_1_52_Response()
        {
            this.prodL_1_52_InfoList = new ObservableCollection<prodL_1_52_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_52_Info> prodL_1_52_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_52_Info info = new prodL_1_52_Info();
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.online_status = unpacker.GetInt("online_status");
            prodL_1_52_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_52_InfoList.Add((prodL_1_52_Info)info);
        }
        #endregion

        //逻辑_产品_账户_更新资产账户在线状态
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new prodL_1_52_Info();
                info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                info.online_status = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ONLINE_STATUS_INT);
                prodL_1_52_InfoList.Add(info);
            }
        }
    }

    public class prodL_1_74_Response : IResponse
    {
        #region 构造函数
        public prodL_1_74_Response()
        {
            this.prodL_1_74_InfoList = new ObservableCollection<prodL_1_74_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_74_Info> prodL_1_74_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_74_Info info = new prodL_1_74_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.update_date = unpacker.GetInt("update_date");
            info.update_time = unpacker.GetInt("update_time");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_code = unpacker.GetStr("pd_code");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.pass_type = unpacker.GetInt("pass_type");
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.online_status = unpacker.GetInt("online_status");
            info.config_str = unpacker.GetStr("config_str");
            info.remark_info = unpacker.GetStr("remark_info");
            prodL_1_74_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_74_InfoList.Add((prodL_1_74_Info)info);
        }
        #endregion

        //逻辑_产品_账户_查询资产账户通道信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new prodL_1_74_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    info.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.pass_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_TYPE_INT);
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    info.online_status = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ONLINE_STATUS_INT);
                    info.config_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_STR_STR);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    prodL_1_74_InfoList.Add(info);
                }
            }
        }
    }

    public class prodL_1_75_Response : IResponse
    {
        #region 构造函数
        public prodL_1_75_Response()
        {
            this.prodL_1_75_InfoList = new ObservableCollection<prodL_1_75_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_75_Info> prodL_1_75_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_75_Info info = new prodL_1_75_Info();
            info.pd_part_nav = unpacker.GetDouble("pd_part_nav");
            prodL_1_75_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_75_InfoList.Add((prodL_1_75_Info)info);
        }
        #endregion

        //逻辑_产品_账户_获取产品最大单位净值
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new prodL_1_75_Info();
                info.pd_part_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_PART_NAV_FLOAT);
                prodL_1_75_InfoList.Add(info);
            }
        }
    }

    public class prodL_1_76_Response : IResponse
    {
        #region 构造函数
        public prodL_1_76_Response()
        {
            this.prodL_1_76_InfoList = new ObservableCollection<prodL_1_76_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_76_Info> prodL_1_76_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_76_Info info = new prodL_1_76_Info();
            info.nav_asset = unpacker.GetDouble("nav_asset");
            prodL_1_76_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_76_InfoList.Add((prodL_1_76_Info)info);
        }
        #endregion

        //逻辑_产品_账户_获取产品最大净值
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new prodL_1_76_Info();
                info.nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT);
                prodL_1_76_InfoList.Add(info);
            }
        }
    }

    public class prodL_1_77_Response : IResponse
    {
        #region 构造函数
        public prodL_1_77_Response()
        {
            this.prodL_1_77_InfoList = new ObservableCollection<prodL_1_77_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_77_Info> prodL_1_77_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_77_Info info = new prodL_1_77_Info();
            info.asset_acco = unpacker.GetStr("asset_acco");
            prodL_1_77_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_77_InfoList.Add((prodL_1_77_Info)info);
        }
        #endregion

        //逻辑_产品_账户_资产账户编号获取资产账户
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new prodL_1_77_Info();
                info.asset_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STR);
                prodL_1_77_InfoList.Add(info);
            }
        }
    }

    public class prodL_1_78_Response : IResponse
    {
        #region 构造函数
        public prodL_1_78_Response()
        {
            this.prodL_1_78_InfoList = new ObservableCollection<prodL_1_78_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_78_Info> prodL_1_78_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_78_Info info = new prodL_1_78_Info();
            info.init_date = unpacker.GetInt("init_date");
            info.create_time = unpacker.GetInt("create_time");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            prodL_1_78_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_78_InfoList.Add((prodL_1_78_Info)info);
        }
        #endregion

        //逻辑_产品_账户_查询产品份额变动流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new prodL_1_78_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    prodL_1_78_InfoList.Add(info);
                }
            }
        }
    }

    public class prodL_1_79_Response : IResponse
    {
        #region 构造函数
        public prodL_1_79_Response()
        {
            this.prodL_1_79_InfoList = new ObservableCollection<prodL_1_79_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_79_Info> prodL_1_79_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_79_Info info = new prodL_1_79_Info();
            info.init_date = unpacker.GetInt("init_date");
            info.create_time = unpacker.GetInt("create_time");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            prodL_1_79_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_79_InfoList.Add((prodL_1_79_Info)info);
        }
        #endregion

        //逻辑_产品_账户_查询产品份额变动流水历史
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new prodL_1_79_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    prodL_1_79_InfoList.Add(info);
                }
            }
        }
    }

    public class prodL_1_80_Response : IResponse
    {
        #region 构造函数
        public prodL_1_80_Response()
        {
            this.prodL_1_80_InfoList = new ObservableCollection<prodL_1_80_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_80_Info> prodL_1_80_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_80_Info info = new prodL_1_80_Info();
            prodL_1_80_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_80_InfoList.Add((prodL_1_80_Info)info);
        }
        #endregion

        //逻辑_产品_账户_修改产品限制信息风控版
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new prodL_1_80_Info();
                prodL_1_80_InfoList.Add(info);
            }
        }
    }

    public class prodL_1_81_Response : IResponse
    {
        #region 构造函数
        public prodL_1_81_Response()
        {
            this.prodL_1_81_InfoList = new ObservableCollection<prodL_1_81_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_81_Info> prodL_1_81_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_81_Info info = new prodL_1_81_Info();
            prodL_1_81_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_81_InfoList.Add((prodL_1_81_Info)info);
        }
        #endregion

        //逻辑_产品_账户_修改产品工作流信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new prodL_1_81_Info();
                prodL_1_81_InfoList.Add(info);
            }
        }
    }

    public class prodL_1_82_Response : IResponse
    {
        #region 构造函数
        public prodL_1_82_Response()
        {
            this.prodL_1_82_InfoList = new ObservableCollection<prodL_1_82_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_82_Info> prodL_1_82_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_82_Info info = new prodL_1_82_Info();
            info.co_no = unpacker.GetInt("co_no");
            info.workflow_type = unpacker.GetInt("workflow_type");
            info.pd_no = unpacker.GetInt("pd_no");
            info.workflow_num = unpacker.GetInt("workflow_num");
            info.opor_no_str = unpacker.GetStr("opor_no_str");
            prodL_1_82_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_82_InfoList.Add((prodL_1_82_Info)info);
        }
        #endregion

        //逻辑_产品_账户_查询产品工作流信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new prodL_1_82_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.workflow_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WORKFLOW_TYPE_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.workflow_num = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WORKFLOW_NUM_INT);
                    info.opor_no_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_STR_STR);
                    prodL_1_82_InfoList.Add(info);
                }
            }
        }
    }

    public class prodL_1_83_Response : IResponse
    {
        #region 构造函数
        public prodL_1_83_Response()
        {
            this.prodL_1_83_InfoList = new ObservableCollection<prodL_1_83_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_83_Info> prodL_1_83_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_83_Info info = new prodL_1_83_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.pd_no = unpacker.GetInt("pd_no");
            info.co_no = unpacker.GetInt("co_no");
            info.asset_acco_type = unpacker.GetInt("asset_acco_type");
            info.asset_acco_status = unpacker.GetStr("asset_acco_status");
            info.pwd_check_status = unpacker.GetInt("pwd_check_status");
            info.online_status = unpacker.GetInt("online_status");
            info.pass_no = unpacker.GetInt("pass_no");
            info.allow_exch = unpacker.GetStr("allow_exch");
            info.allow_stock_type = unpacker.GetStr("allow_stock_type");
            prodL_1_83_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_83_InfoList.Add((prodL_1_83_Info)info);
        }
        #endregion

        //逻辑_产品_账户_查询账户同步信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new prodL_1_83_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.asset_acco_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_TYPE_INT);
                    info.asset_acco_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STATUS_STR);
                    info.pwd_check_status = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PWD_CHECK_STATUS_INT);
                    info.online_status = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ONLINE_STATUS_INT);
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.allow_exch = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_EXCH_STR);
                    info.allow_stock_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_STOCK_TYPE_STR);
                    prodL_1_83_InfoList.Add(info);
                }
            }
        }
    }

    public class prodL_1_84_Response : IResponse
    {
        #region 构造函数
        public prodL_1_84_Response()
        {
            this.prodL_1_84_InfoList = new ObservableCollection<prodL_1_84_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_84_Info> prodL_1_84_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_84_Info info = new prodL_1_84_Info();
            prodL_1_84_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_84_InfoList.Add((prodL_1_84_Info)info);
        }
        #endregion

        //逻辑_产品_账户_发送账户同步信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new prodL_1_84_Info();
                prodL_1_84_InfoList.Add(info);
            }
        }
    }

    public class prodL_1_85_Response : IResponse
    {
        #region 构造函数
        public prodL_1_85_Response()
        {
            this.prodL_1_85_InfoList = new ObservableCollection<prodL_1_85_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_85_Info> prodL_1_85_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_85_Info info = new prodL_1_85_Info();
            info.workflow_type = unpacker.GetInt("workflow_type");
            info.workflow_num = unpacker.GetInt("workflow_num");
            info.opor_no_str = unpacker.GetStr("opor_no_str");
            prodL_1_85_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_85_InfoList.Add((prodL_1_85_Info)info);
        }
        #endregion

        //逻辑_产品_账户_获取产品工作流信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new prodL_1_85_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.workflow_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WORKFLOW_TYPE_INT);
                    info.workflow_num = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WORKFLOW_NUM_INT);
                    info.opor_no_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_STR_STR);
                    prodL_1_85_InfoList.Add(info);
                }
            }
        }
    }

    public class prodL_1_86_Response : IResponse
    {
        #region 构造函数
        public prodL_1_86_Response()
        {
            this.prodL_1_86_InfoList = new ObservableCollection<prodL_1_86_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_86_Info> prodL_1_86_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_86_Info info = new prodL_1_86_Info();
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            prodL_1_86_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_86_InfoList.Add((prodL_1_86_Info)info);
        }
        #endregion

        //逻辑_产品_账户_账户登录回报
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new prodL_1_86_Info();
                info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                prodL_1_86_InfoList.Add(info);
            }
        }
    }

    public class prodL_1_87_Response : IResponse
    {
        #region 构造函数
        public prodL_1_87_Response()
        {
            this.prodL_1_87_InfoList = new ObservableCollection<prodL_1_87_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_87_Info> prodL_1_87_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_87_Info info = new prodL_1_87_Info();
            prodL_1_87_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_87_InfoList.Add((prodL_1_87_Info)info);
        }
        #endregion

        //逻辑_产品_账户_删除产品工作流信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new prodL_1_87_Info();
                prodL_1_87_InfoList.Add(info);
            }
        }
    }

    public class prodL_1_88_Response : IResponse
    {
        #region 构造函数
        public prodL_1_88_Response()
        {
            this.prodL_1_88_InfoList = new ObservableCollection<prodL_1_88_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_88_Info> prodL_1_88_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_88_Info info = new prodL_1_88_Info();
            prodL_1_88_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_88_InfoList.Add((prodL_1_88_Info)info);
        }
        #endregion

        //逻辑_产品_账户_更新开盘检查流程
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new prodL_1_88_Info();
                prodL_1_88_InfoList.Add(info);
            }
        }
    }

    public class prodL_1_89_Response : IResponse
    {
        #region 构造函数
        public prodL_1_89_Response()
        {
            this.prodL_1_89_InfoList = new ObservableCollection<prodL_1_89_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_89_Info> prodL_1_89_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_89_Info info = new prodL_1_89_Info();
            info.execute_type = unpacker.GetInt("execute_type");
            info.init_step = unpacker.GetInt("init_step");
            info.begin_time = unpacker.GetInt("begin_time");
            info.exec_time = unpacker.GetInt("exec_time");
            info.exec_date = unpacker.GetInt("exec_date");
            info.open_execute_type = unpacker.GetInt("open_execute_type");
            info.open_execute_result = unpacker.GetInt("open_execute_result");
            info.remark_info = unpacker.GetStr("remark_info");
            prodL_1_89_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_89_InfoList.Add((prodL_1_89_Info)info);
        }
        #endregion

        //逻辑_产品_账户_查询开盘检查流程
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new prodL_1_89_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.execute_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXECUTE_TYPE_INT);
                    info.init_step = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_STEP_INT);
                    info.begin_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TIME_INT);
                    info.exec_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_TIME_INT);
                    info.exec_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_DATE_INT);
                    info.open_execute_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_EXECUTE_TYPE_INT);
                    info.open_execute_result = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_EXECUTE_RESULT_INT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    prodL_1_89_InfoList.Add(info);
                }
            }
        }
    }

    public class prodL_1_90_Response : IResponse
    {
        #region 构造函数
        public prodL_1_90_Response()
        {
            this.prodL_1_90_InfoList = new ObservableCollection<prodL_1_90_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_90_Info> prodL_1_90_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_90_Info info = new prodL_1_90_Info();
            info.execute_type = unpacker.GetInt("execute_type");
            info.init_step = unpacker.GetInt("init_step");
            info.begin_time = unpacker.GetInt("begin_time");
            info.exec_time = unpacker.GetInt("exec_time");
            info.exec_date = unpacker.GetInt("exec_date");
            info.open_execute_type = unpacker.GetInt("open_execute_type");
            info.open_execute_result = unpacker.GetInt("open_execute_result");
            info.remark_info = unpacker.GetStr("remark_info");
            prodL_1_90_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_90_InfoList.Add((prodL_1_90_Info)info);
        }
        #endregion

        //逻辑_产品_账户_获取开盘检查流程
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new prodL_1_90_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.execute_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXECUTE_TYPE_INT);
                    info.init_step = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_STEP_INT);
                    info.begin_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TIME_INT);
                    info.exec_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_TIME_INT);
                    info.exec_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_DATE_INT);
                    info.open_execute_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_EXECUTE_TYPE_INT);
                    info.open_execute_result = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_EXECUTE_RESULT_INT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    prodL_1_90_InfoList.Add(info);
                }
            }
        }
    }

    public class prodL_1_91_Response : IResponse
    {
        #region 构造函数
        public prodL_1_91_Response()
        {
            this.prodL_1_91_InfoList = new ObservableCollection<prodL_1_91_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_91_Info> prodL_1_91_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_91_Info info = new prodL_1_91_Info();
            info.opor_no = unpacker.GetInt("opor_no");
            info.flow_business = unpacker.GetInt("flow_business");
            info.execute_type = unpacker.GetInt("execute_type");
            info.begin_time = unpacker.GetInt("begin_time");
            info.exec_date = unpacker.GetInt("exec_date");
            info.exec_time = unpacker.GetInt("exec_time");
            info.close_execute_type = unpacker.GetInt("close_execute_type");
            info.error_deal_type = unpacker.GetInt("error_deal_type");
            prodL_1_91_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_91_InfoList.Add((prodL_1_91_Info)info);
        }
        #endregion

        //逻辑_产品_账户_查询收盘作业流程
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new prodL_1_91_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.flow_business = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FLOW_BUSINESS_INT);
                    info.execute_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXECUTE_TYPE_INT);
                    info.begin_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TIME_INT);
                    info.exec_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_DATE_INT);
                    info.exec_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_TIME_INT);
                    info.close_execute_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_EXECUTE_TYPE_INT);
                    info.error_deal_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ERROR_DEAL_TYPE_INT);
                    prodL_1_91_InfoList.Add(info);
                }
            }
        }
    }

    public class prodL_1_92_Response : IResponse
    {
        #region 构造函数
        public prodL_1_92_Response()
        {
            this.prodL_1_92_InfoList = new ObservableCollection<prodL_1_92_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_92_Info> prodL_1_92_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_92_Info info = new prodL_1_92_Info();
            prodL_1_92_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_92_InfoList.Add((prodL_1_92_Info)info);
        }
        #endregion

        //逻辑_产品_账户_更新收盘作业流程
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new prodL_1_92_Info();
                prodL_1_92_InfoList.Add(info);
            }
        }
    }

    public class prodL_1_101_Response : IResponse
    {
        #region 构造函数
        public prodL_1_101_Response()
        {
            this.prodL_1_101_InfoList = new ObservableCollection<prodL_1_101_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_101_Info> prodL_1_101_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_101_Info info = new prodL_1_101_Info();
            prodL_1_101_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_101_InfoList.Add((prodL_1_101_Info)info);
        }
        #endregion

        //逻辑_产品_账户_新增产品关系
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new prodL_1_101_Info();
                prodL_1_101_InfoList.Add(info);
            }
        }
    }

    public class prodL_1_102_Response : IResponse
    {
        #region 构造函数
        public prodL_1_102_Response()
        {
            this.prodL_1_102_InfoList = new ObservableCollection<prodL_1_102_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_102_Info> prodL_1_102_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_102_Info info = new prodL_1_102_Info();
            prodL_1_102_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_102_InfoList.Add((prodL_1_102_Info)info);
        }
        #endregion

        //逻辑_产品_账户_删除产品关系
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new prodL_1_102_Info();
                prodL_1_102_InfoList.Add(info);
            }
        }
    }

    public class prodL_1_103_Response : IResponse
    {
        #region 构造函数
        public prodL_1_103_Response()
        {
            this.prodL_1_103_InfoList = new ObservableCollection<prodL_1_103_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_103_Info> prodL_1_103_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_103_Info info = new prodL_1_103_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.update_date = unpacker.GetInt("update_date");
            info.update_time = unpacker.GetInt("update_time");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.mum_pd_no = unpacker.GetInt("mum_pd_no");
            prodL_1_103_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_103_InfoList.Add((prodL_1_103_Info)info);
        }
        #endregion

        //逻辑_产品_账户_查询产品关系
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new prodL_1_103_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    info.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.mum_pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MUM_PD_NO_INT);
                    prodL_1_103_InfoList.Add(info);
                }
            }
        }
    }

    public class prodL_1_104_Response : IResponse
    {
        #region 构造函数
        public prodL_1_104_Response()
        {
            this.prodL_1_104_InfoList = new ObservableCollection<prodL_1_104_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_104_Info> prodL_1_104_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_104_Info info = new prodL_1_104_Info();
            info.asset_acco_no_str = unpacker.GetStr("asset_acco_no_str");
            prodL_1_104_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_104_InfoList.Add((prodL_1_104_Info)info);
        }
        #endregion

        //逻辑_产品_账户_获取注销资产账户串
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new prodL_1_104_Info();
                info.asset_acco_no_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_STR_STR);
                prodL_1_104_InfoList.Add(info);
            }
        }
    }

    public class prodL_1_105_Response : IResponse
    {
        #region 构造函数
        public prodL_1_105_Response()
        {
            this.prodL_1_105_InfoList = new ObservableCollection<prodL_1_105_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_105_Info> prodL_1_105_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_105_Info info = new prodL_1_105_Info();
            info.row_id = unpacker.GetInt64("row_id");
            prodL_1_105_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_105_InfoList.Add((prodL_1_105_Info)info);
        }
        #endregion

        //逻辑_产品_账户_新增融资融券配置表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new prodL_1_105_Info();
                info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                prodL_1_105_InfoList.Add(info);
            }
        }
    }

    public class prodL_1_106_Response : IResponse
    {
        #region 构造函数
        public prodL_1_106_Response()
        {
            this.prodL_1_106_InfoList = new ObservableCollection<prodL_1_106_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_106_Info> prodL_1_106_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_106_Info info = new prodL_1_106_Info();
            prodL_1_106_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_106_InfoList.Add((prodL_1_106_Info)info);
        }
        #endregion

        //逻辑_产品_账户_修改融资融券配置表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new prodL_1_106_Info();
                prodL_1_106_InfoList.Add(info);
            }
        }
    }

    public class prodL_1_107_Response : IResponse
    {
        #region 构造函数
        public prodL_1_107_Response()
        {
            this.prodL_1_107_InfoList = new ObservableCollection<prodL_1_107_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_107_Info> prodL_1_107_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_107_Info info = new prodL_1_107_Info();
            prodL_1_107_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_107_InfoList.Add((prodL_1_107_Info)info);
        }
        #endregion

        //逻辑_产品_账户_删除融资融券配置表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new prodL_1_107_Info();
                prodL_1_107_InfoList.Add(info);
            }
        }
    }

    public class prodL_1_108_Response : IResponse
    {
        #region 构造函数
        public prodL_1_108_Response()
        {
            this.prodL_1_108_InfoList = new ObservableCollection<prodL_1_108_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_108_Info> prodL_1_108_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_108_Info info = new prodL_1_108_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.fina_return_type = unpacker.GetInt("fina_return_type");
            info.sell_auto_back_debt = unpacker.GetInt("sell_auto_back_debt");
            info.fina_limit_max = unpacker.GetDouble("fina_limit_max");
            info.loan_limit_max = unpacker.GetDouble("loan_limit_max");
            info.fina_year_intrst_rate = unpacker.GetDouble("fina_year_intrst_rate");
            info.secu_loan_year_intrst_rate = unpacker.GetDouble("secu_loan_year_intrst_rate");
            info.close_posi_keep_guarantee_ratio = unpacker.GetDouble("close_posi_keep_guarantee_ratio");
            info.fill_posi_keep_guarantee_ratio = unpacker.GetDouble("fill_posi_keep_guarantee_ratio");
            info.extract_guarantee_ratio = unpacker.GetDouble("extract_guarantee_ratio");
            info.remark_info = unpacker.GetStr("remark_info");
            prodL_1_108_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_108_InfoList.Add((prodL_1_108_Info)info);
        }
        #endregion

        //逻辑_产品_账户_查询融资融券配置表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new prodL_1_108_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.fina_return_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FINA_RETURN_TYPE_INT);
                    info.sell_auto_back_debt = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SELL_AUTO_BACK_DEBT_INT);
                    info.fina_limit_max = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_LIMIT_MAX_FLOAT);
                    info.loan_limit_max = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_LIMIT_MAX_FLOAT);
                    info.fina_year_intrst_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_YEAR_INTRST_RATE_FLOAT);
                    info.secu_loan_year_intrst_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SECU_LOAN_YEAR_INTRST_RATE_FLOAT);
                    info.close_posi_keep_guarantee_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_KEEP_GUARANTEE_RATIO_FLOAT);
                    info.fill_posi_keep_guarantee_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FILL_POSI_KEEP_GUARANTEE_RATIO_FLOAT);
                    info.extract_guarantee_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_EXTRACT_GUARANTEE_RATIO_FLOAT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    prodL_1_108_InfoList.Add(info);
                }
            }
        }
    }

    public class prodL_1_109_Response : IResponse
    {
        #region 构造函数
        public prodL_1_109_Response()
        {
            this.prodL_1_109_InfoList = new ObservableCollection<prodL_1_109_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_109_Info> prodL_1_109_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_109_Info info = new prodL_1_109_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            prodL_1_109_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_109_InfoList.Add((prodL_1_109_Info)info);
        }
        #endregion

        //逻辑_产品_账户_查询资产账户默认交易组信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new prodL_1_109_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    prodL_1_109_InfoList.Add(info);
                }
            }
        }
    }

    public class prodL_1_110_Response : IResponse
    {
        #region 构造函数
        public prodL_1_110_Response()
        {
            this.prodL_1_110_InfoList = new ObservableCollection<prodL_1_110_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_110_Info> prodL_1_110_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_110_Info info = new prodL_1_110_Info();
            prodL_1_110_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_110_InfoList.Add((prodL_1_110_Info)info);
        }
        #endregion

        //逻辑_产品_账户_设置资产账户默认交易组关系
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new prodL_1_110_Info();
                prodL_1_110_InfoList.Add(info);
            }
        }
    }

    public class prodL_1_111_Response : IResponse
    {
        #region 构造函数
        public prodL_1_111_Response()
        {
            this.prodL_1_111_InfoList = new ObservableCollection<prodL_1_111_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_111_Info> prodL_1_111_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_111_Info info = new prodL_1_111_Info();
            prodL_1_111_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_111_InfoList.Add((prodL_1_111_Info)info);
        }
        #endregion

        //逻辑_产品_账户_删除资产账户默认交易组关系
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new prodL_1_111_Info();
                prodL_1_111_InfoList.Add(info);
            }
        }
    }

    public class prodL_1_112_Response : IResponse
    {
        #region 构造函数
        public prodL_1_112_Response()
        {
            this.prodL_1_112_InfoList = new ObservableCollection<prodL_1_112_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_112_Info> prodL_1_112_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_112_Info info = new prodL_1_112_Info();
            info.pd_no = unpacker.GetInt("pd_no");
            prodL_1_112_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_112_InfoList.Add((prodL_1_112_Info)info);
        }
        #endregion

        //逻辑_产品_账户_导入产品信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new prodL_1_112_Info();
                info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                prodL_1_112_InfoList.Add(info);
            }
        }
    }

    public class prodL_1_113_Response : IResponse
    {
        #region 构造函数
        public prodL_1_113_Response()
        {
            this.prodL_1_113_InfoList = new ObservableCollection<prodL_1_113_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_113_Info> prodL_1_113_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_113_Info info = new prodL_1_113_Info();
            prodL_1_113_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_113_InfoList.Add((prodL_1_113_Info)info);
        }
        #endregion

        //逻辑_产品_账户_报盘回写通道信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new prodL_1_113_Info();
                prodL_1_113_InfoList.Add(info);
            }
        }
    }

    public class prodL_1_114_Response : IResponse
    {
        #region 构造函数
        public prodL_1_114_Response()
        {
            this.prodL_1_114_InfoList = new ObservableCollection<prodL_1_114_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_114_Info> prodL_1_114_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_114_Info info = new prodL_1_114_Info();
            prodL_1_114_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_114_InfoList.Add((prodL_1_114_Info)info);
        }
        #endregion

        //逻辑_产品_账户_修改产品索引值
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new prodL_1_114_Info();
                prodL_1_114_InfoList.Add(info);
            }
        }
    }

    public class prodL_1_115_Response : IResponse
    {
        #region 构造函数
        public prodL_1_115_Response()
        {
            this.prodL_1_115_InfoList = new ObservableCollection<prodL_1_115_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_115_Info> prodL_1_115_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_115_Info info = new prodL_1_115_Info();
            prodL_1_115_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_115_InfoList.Add((prodL_1_115_Info)info);
        }
        #endregion

        //逻辑_产品_账户_报盘校验资金账号
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new prodL_1_115_Info();
                prodL_1_115_InfoList.Add(info);
            }
        }
    }

    public class prodL_1_116_Response : IResponse
    {
        #region 构造函数
        public prodL_1_116_Response()
        {
            this.prodL_1_116_InfoList = new ObservableCollection<prodL_1_116_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_116_Info> prodL_1_116_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_116_Info info = new prodL_1_116_Info();
            info.margin_ratio = unpacker.GetDouble("margin_ratio");
            prodL_1_116_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_116_InfoList.Add((prodL_1_116_Info)info);
        }
        #endregion

        //逻辑_产品_账户_获取保证金比例
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new prodL_1_116_Info();
                info.margin_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARGIN_RATIO_FLOAT);
                prodL_1_116_InfoList.Add(info);
            }
        }
    }

    public class prodL_1_117_Response : IResponse
    {
        #region 构造函数
        public prodL_1_117_Response()
        {
            this.prodL_1_117_InfoList = new ObservableCollection<prodL_1_117_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_117_Info> prodL_1_117_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_117_Info info = new prodL_1_117_Info();
            info.trade_commis = unpacker.GetDouble("trade_commis");
            info.all_fee = unpacker.GetDouble("all_fee");
            info.stamp_tax = unpacker.GetDouble("stamp_tax");
            info.trans_fee = unpacker.GetDouble("trans_fee");
            info.brkage_fee = unpacker.GetDouble("brkage_fee");
            info.SEC_charges = unpacker.GetDouble("SEC_charges");
            info.other_fee = unpacker.GetDouble("other_fee");
            info.other_commis = unpacker.GetDouble("other_commis");
            info.trade_tax = unpacker.GetDouble("trade_tax");
            info.trade_cost_fee = unpacker.GetDouble("trade_cost_fee");
            info.trade_system_use_fee = unpacker.GetDouble("trade_system_use_fee");
            info.stock_settle_fee = unpacker.GetDouble("stock_settle_fee");
            info.order_frozen_amt = unpacker.GetDouble("order_frozen_amt");
            prodL_1_117_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_117_InfoList.Add((prodL_1_117_Info)info);
        }
        #endregion

        //逻辑_产品_账户_计算证券订单费用
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new prodL_1_117_Info();
                info.trade_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_COMMIS_FLOAT);
                info.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                info.stamp_tax = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STAMP_TAX_FLOAT);
                info.trans_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_FEE_FLOAT);
                info.brkage_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BRKAGE_FEE_FLOAT);
                info.SEC_charges = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SEC_CHARGES_FLOAT);
                info.other_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_FEE_FLOAT);
                info.other_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_COMMIS_FLOAT);
                info.trade_tax = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_TAX_FLOAT);
                info.trade_cost_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_COST_FEE_FLOAT);
                info.trade_system_use_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_SYSTEM_USE_FEE_FLOAT);
                info.stock_settle_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_SETTLE_FEE_FLOAT);
                info.order_frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_FROZEN_AMT_FLOAT);
                prodL_1_117_InfoList.Add(info);
            }
        }
    }

    public class prodL_1_118_Response : IResponse
    {
        #region 构造函数
        public prodL_1_118_Response()
        {
            this.prodL_1_118_InfoList = new ObservableCollection<prodL_1_118_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_1_118_Info> prodL_1_118_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_1_118_Info info = new prodL_1_118_Info();
            info.corrsp_id = unpacker.GetInt64("corrsp_id");
            info.trade_commis = unpacker.GetDouble("trade_commis");
            info.all_fee = unpacker.GetDouble("all_fee");
            info.stamp_tax = unpacker.GetDouble("stamp_tax");
            info.trans_fee = unpacker.GetDouble("trans_fee");
            info.brkage_fee = unpacker.GetDouble("brkage_fee");
            info.SEC_charges = unpacker.GetDouble("SEC_charges");
            info.other_fee = unpacker.GetDouble("other_fee");
            info.other_commis = unpacker.GetDouble("other_commis");
            info.trade_tax = unpacker.GetDouble("trade_tax");
            info.trade_cost_fee = unpacker.GetDouble("trade_cost_fee");
            info.trade_system_use_fee = unpacker.GetDouble("trade_system_use_fee");
            info.stock_settle_fee = unpacker.GetDouble("stock_settle_fee");
            info.order_frozen_amt = unpacker.GetDouble("order_frozen_amt");
            prodL_1_118_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_1_118_InfoList.Add((prodL_1_118_Info)info);
        }
        #endregion

        //逻辑_产品_账户_批量计算证券订单费用
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new prodL_1_118_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.corrsp_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_CORRSP_ID_INT64);
                    info.trade_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_COMMIS_FLOAT);
                    info.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                    info.stamp_tax = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STAMP_TAX_FLOAT);
                    info.trans_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_FEE_FLOAT);
                    info.brkage_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BRKAGE_FEE_FLOAT);
                    info.SEC_charges = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SEC_CHARGES_FLOAT);
                    info.other_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_FEE_FLOAT);
                    info.other_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_COMMIS_FLOAT);
                    info.trade_tax = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_TAX_FLOAT);
                    info.trade_cost_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_COST_FEE_FLOAT);
                    info.trade_system_use_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_SYSTEM_USE_FEE_FLOAT);
                    info.stock_settle_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_SETTLE_FEE_FLOAT);
                    info.order_frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_FROZEN_AMT_FLOAT);
                    prodL_1_118_InfoList.Add(info);
                }
            }
        }
    }

}
