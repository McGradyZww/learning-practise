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
    public class prodL_4_1_Response : IResponse
    {
        #region 构造函数
        public prodL_4_1_Response()
        {
            this.prodL_4_1_InfoList = new ObservableCollection<prodL_4_1_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_4_1_Info> prodL_4_1_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_4_1_Info info = new prodL_4_1_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.update_date = unpacker.GetInt("update_date");
            info.update_time = unpacker.GetInt("update_time");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.begin_amt = unpacker.GetDouble("begin_amt");
            info.first_amt = unpacker.GetDouble("first_amt");
            info.curr_amt = unpacker.GetDouble("curr_amt");
            info.pd_dist_amt = unpacker.GetDouble("pd_dist_amt");
            info.pd_auth_amt = unpacker.GetDouble("pd_auth_amt");
            info.amt_check_diff = unpacker.GetDouble("amt_check_diff");
            info.pre_settle_amt = unpacker.GetDouble("pre_settle_amt");
            info.total_cash_divide = unpacker.GetDouble("total_cash_divide");
            info.total_pre_fee = unpacker.GetDouble("total_pre_fee");
            info.total_rece_amt = unpacker.GetDouble("total_rece_amt");
            info.total_payab_amt = unpacker.GetDouble("total_payab_amt");
            info.intrst_cacl_amt = unpacker.GetDouble("intrst_cacl_amt");
            info.pre_entry_intrst_amt = unpacker.GetDouble("pre_entry_intrst_amt");
            prodL_4_1_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_4_1_InfoList.Add((prodL_4_1_Info)info);
        }
        #endregion

        //逻辑_产品_资金运维_查询产品资金
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new prodL_4_1_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    info.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.begin_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_AMT_FLOAT);
                    info.first_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FIRST_AMT_FLOAT);
                    info.curr_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_AMT_FLOAT);
                    info.pd_dist_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_DIST_AMT_FLOAT);
                    info.pd_auth_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_AUTH_AMT_FLOAT);
                    info.amt_check_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_CHECK_DIFF_FLOAT);
                    info.pre_settle_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SETTLE_AMT_FLOAT);
                    info.total_cash_divide = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_CASH_DIVIDE_FLOAT);
                    info.total_pre_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_PRE_FEE_FLOAT);
                    info.total_rece_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_RECE_AMT_FLOAT);
                    info.total_payab_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_PAYAB_AMT_FLOAT);
                    info.intrst_cacl_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_CACL_AMT_FLOAT);
                    info.pre_entry_intrst_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ENTRY_INTRST_AMT_FLOAT);
                    prodL_4_1_InfoList.Add(info);
                }
            }
        }
    }

    public class prodL_4_2_Response : IResponse
    {
        #region 构造函数
        public prodL_4_2_Response()
        {
            this.prodL_4_2_InfoList = new ObservableCollection<prodL_4_2_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_4_2_Info> prodL_4_2_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_4_2_Info info = new prodL_4_2_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.update_date = unpacker.GetInt("update_date");
            info.update_time = unpacker.GetInt("update_time");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.begin_amt = unpacker.GetDouble("begin_amt");
            info.first_amt = unpacker.GetDouble("first_amt");
            info.curr_amt = unpacker.GetDouble("curr_amt");
            info.pd_dist_amt = unpacker.GetDouble("pd_dist_amt");
            info.pd_auth_amt = unpacker.GetDouble("pd_auth_amt");
            info.amt_check_diff = unpacker.GetDouble("amt_check_diff");
            info.pre_settle_amt = unpacker.GetDouble("pre_settle_amt");
            info.total_cash_divide = unpacker.GetDouble("total_cash_divide");
            info.total_pre_fee = unpacker.GetDouble("total_pre_fee");
            info.total_rece_amt = unpacker.GetDouble("total_rece_amt");
            info.total_payab_amt = unpacker.GetDouble("total_payab_amt");
            info.intrst_cacl_amt = unpacker.GetDouble("intrst_cacl_amt");
            info.pre_entry_intrst_amt = unpacker.GetDouble("pre_entry_intrst_amt");
            prodL_4_2_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_4_2_InfoList.Add((prodL_4_2_Info)info);
        }
        #endregion

        //逻辑_产品_资金运维_查询历史产品资金
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new prodL_4_2_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    info.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.begin_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_AMT_FLOAT);
                    info.first_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FIRST_AMT_FLOAT);
                    info.curr_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_AMT_FLOAT);
                    info.pd_dist_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_DIST_AMT_FLOAT);
                    info.pd_auth_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_AUTH_AMT_FLOAT);
                    info.amt_check_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_CHECK_DIFF_FLOAT);
                    info.pre_settle_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SETTLE_AMT_FLOAT);
                    info.total_cash_divide = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_CASH_DIVIDE_FLOAT);
                    info.total_pre_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_PRE_FEE_FLOAT);
                    info.total_rece_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_RECE_AMT_FLOAT);
                    info.total_payab_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_PAYAB_AMT_FLOAT);
                    info.intrst_cacl_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_CACL_AMT_FLOAT);
                    info.pre_entry_intrst_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ENTRY_INTRST_AMT_FLOAT);
                    prodL_4_2_InfoList.Add(info);
                }
            }
        }
    }

    public class prodL_4_5_Response : IResponse
    {
        #region 构造函数
        public prodL_4_5_Response()
        {
            this.prodL_4_5_InfoList = new ObservableCollection<prodL_4_5_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_4_5_Info> prodL_4_5_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_4_5_Info info = new prodL_4_5_Info();
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
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.busi_flag = unpacker.GetInt("busi_flag");
            info.occur_amt = unpacker.GetDouble("occur_amt");
            info.occur_end_amt = unpacker.GetDouble("occur_end_amt");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            prodL_4_5_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_4_5_InfoList.Add((prodL_4_5_Info)info);
        }
        #endregion

        //逻辑_产品_资金运维_查询产品资金流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new prodL_4_5_Info();
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
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.busi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT);
                    info.occur_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_AMT_FLOAT);
                    info.occur_end_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_END_AMT_FLOAT);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    prodL_4_5_InfoList.Add(info);
                }
            }
        }
    }

    public class prodL_4_6_Response : IResponse
    {
        #region 构造函数
        public prodL_4_6_Response()
        {
            this.prodL_4_6_InfoList = new ObservableCollection<prodL_4_6_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_4_6_Info> prodL_4_6_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_4_6_Info info = new prodL_4_6_Info();
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
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.busi_flag = unpacker.GetInt("busi_flag");
            info.occur_amt = unpacker.GetDouble("occur_amt");
            info.occur_end_amt = unpacker.GetDouble("occur_end_amt");
            info.jour_occur_field = unpacker.GetStr("jour_occur_field");
            info.jour_after_occur_info = unpacker.GetStr("jour_after_occur_info");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            prodL_4_6_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_4_6_InfoList.Add((prodL_4_6_Info)info);
        }
        #endregion

        //逻辑_产品_资金运维_查询历史产品资金流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new prodL_4_6_Info();
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
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.busi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT);
                    info.occur_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_AMT_FLOAT);
                    info.occur_end_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_END_AMT_FLOAT);
                    info.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    info.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    prodL_4_6_InfoList.Add(info);
                }
            }
        }
    }

    public class prodL_4_7_Response : IResponse
    {
        #region 构造函数
        public prodL_4_7_Response()
        {
            this.prodL_4_7_InfoList = new ObservableCollection<prodL_4_7_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_4_7_Info> prodL_4_7_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_4_7_Info info = new prodL_4_7_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.begin_NAV = unpacker.GetDouble("begin_NAV");
            info.nav_asset = unpacker.GetDouble("nav_asset");
            info.total_cash_asset = unpacker.GetDouble("total_cash_asset");
            info.stock_cash_asset = unpacker.GetDouble("stock_cash_asset");
            info.futu_cash_asset = unpacker.GetDouble("futu_cash_asset");
            info.stock_asset = unpacker.GetDouble("stock_asset");
            info.fund_asset = unpacker.GetDouble("fund_asset");
            info.bond_asset = unpacker.GetDouble("bond_asset");
            info.futu_asset = unpacker.GetDouble("futu_asset");
            info.repo_asset = unpacker.GetDouble("repo_asset");
            info.other_asset = unpacker.GetDouble("other_asset");
            info.hk_thrgh_stock_asset = unpacker.GetDouble("hk_thrgh_stock_asset");
            prodL_4_7_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_4_7_InfoList.Add((prodL_4_7_Info)info);
        }
        #endregion

        //逻辑_产品_资金运维_查询产品资产
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new prodL_4_7_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.begin_NAV = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_NAV_FLOAT);
                    info.nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT);
                    info.total_cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_CASH_ASSET_FLOAT);
                    info.stock_cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CASH_ASSET_FLOAT);
                    info.futu_cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_CASH_ASSET_FLOAT);
                    info.stock_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_FLOAT);
                    info.fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_ASSET_FLOAT);
                    info.bond_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ASSET_FLOAT);
                    info.futu_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ASSET_FLOAT);
                    info.repo_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPO_ASSET_FLOAT);
                    info.other_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_ASSET_FLOAT);
                    info.hk_thrgh_stock_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HK_THRGH_STOCK_ASSET_FLOAT);
                    prodL_4_7_InfoList.Add(info);
                }
            }
        }
    }

    public class prodL_4_8_Response : IResponse
    {
        #region 构造函数
        public prodL_4_8_Response()
        {
            this.prodL_4_8_InfoList = new ObservableCollection<prodL_4_8_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_4_8_Info> prodL_4_8_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_4_8_Info info = new prodL_4_8_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.begin_NAV = unpacker.GetDouble("begin_NAV");
            info.nav_asset = unpacker.GetDouble("nav_asset");
            info.total_cash_asset = unpacker.GetDouble("total_cash_asset");
            info.stock_cash_asset = unpacker.GetDouble("stock_cash_asset");
            info.futu_cash_asset = unpacker.GetDouble("futu_cash_asset");
            info.stock_asset = unpacker.GetDouble("stock_asset");
            info.fund_asset = unpacker.GetDouble("fund_asset");
            info.bond_asset = unpacker.GetDouble("bond_asset");
            info.futu_asset = unpacker.GetDouble("futu_asset");
            info.repo_asset = unpacker.GetDouble("repo_asset");
            info.other_asset = unpacker.GetDouble("other_asset");
            info.hk_thrgh_stock_asset = unpacker.GetDouble("hk_thrgh_stock_asset");
            prodL_4_8_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_4_8_InfoList.Add((prodL_4_8_Info)info);
        }
        #endregion

        //逻辑_产品_资金运维_查询历史产品资产
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new prodL_4_8_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.begin_NAV = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_NAV_FLOAT);
                    info.nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT);
                    info.total_cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_CASH_ASSET_FLOAT);
                    info.stock_cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CASH_ASSET_FLOAT);
                    info.futu_cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_CASH_ASSET_FLOAT);
                    info.stock_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_FLOAT);
                    info.fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_ASSET_FLOAT);
                    info.bond_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ASSET_FLOAT);
                    info.futu_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ASSET_FLOAT);
                    info.repo_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPO_ASSET_FLOAT);
                    info.other_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_ASSET_FLOAT);
                    info.hk_thrgh_stock_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HK_THRGH_STOCK_ASSET_FLOAT);
                    prodL_4_8_InfoList.Add(info);
                }
            }
        }
    }

}
