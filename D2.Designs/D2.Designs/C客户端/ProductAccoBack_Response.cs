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
    public class prodL_5_1_Response : IResponse
    {
        #region 构造函数
        public prodL_5_1_Response()
        {
            this.prodL_5_1_InfoList = new ObservableCollection<prodL_5_1_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_5_1_Info> prodL_5_1_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_5_1_Info info = new prodL_5_1_Info();
            info.pd_no = unpacker.GetInt("pd_no");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_code = unpacker.GetStr("pd_code");
            info.pd_name = unpacker.GetStr("pd_name");
            info.pd_status = unpacker.GetStr("pd_status");
            prodL_5_1_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_5_1_InfoList.Add((prodL_5_1_Info)info);
        }
        #endregion

        //逻辑_产品_账户运维_查询全部产品
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new prodL_5_1_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    info.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    info.pd_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_STATUS_STR);
                    prodL_5_1_InfoList.Add(info);
                }
            }
        }
    }

    public class prodL_5_2_Response : IResponse
    {
        #region 构造函数
        public prodL_5_2_Response()
        {
            this.prodL_5_2_InfoList = new ObservableCollection<prodL_5_2_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_5_2_Info> prodL_5_2_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_5_2_Info info = new prodL_5_2_Info();
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.asset_acco = unpacker.GetStr("asset_acco");
            info.asset_acco_name = unpacker.GetStr("asset_acco_name");
            info.asset_acco_status = unpacker.GetStr("asset_acco_status");
            info.out_acco = unpacker.GetStr("out_acco");
            info.busi_depart = unpacker.GetStr("busi_depart");
            prodL_5_2_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_5_2_InfoList.Add((prodL_5_2_Info)info);
        }
        #endregion

        //逻辑_产品_账户运维_查询全部资产账户
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new prodL_5_2_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.asset_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STR);
                    info.asset_acco_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NAME_STR);
                    info.asset_acco_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STATUS_STR);
                    info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    info.busi_depart = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_DEPART_STR);
                    prodL_5_2_InfoList.Add(info);
                }
            }
        }
    }

    public class prodL_5_4_Response : IResponse
    {
        #region 构造函数
        public prodL_5_4_Response()
        {
            this.prodL_5_4_InfoList = new ObservableCollection<prodL_5_4_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_5_4_Info> prodL_5_4_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_5_4_Info info = new prodL_5_4_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.pd_no = unpacker.GetInt("pd_no");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_code = unpacker.GetStr("pd_code");
            info.pd_name = unpacker.GetStr("pd_name");
            info.pd_flname = unpacker.GetStr("pd_flname");
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
            info.cost_calc_type = unpacker.GetInt("cost_calc_type");
            info.allow_exch = unpacker.GetStr("allow_exch");
            info.allow_stock_type = unpacker.GetStr("allow_stock_type");
            info.busi_config_str = unpacker.GetStr("busi_config_str");
            info.comm_appr_oper = unpacker.GetInt("comm_appr_oper");
            info.market_price_ratio = unpacker.GetDouble("market_price_ratio");
            info.forbid_order_dir = unpacker.GetStr("forbid_order_dir");
            info.warn_posi_value = unpacker.GetDouble("warn_posi_value");
            info.close_posi_value = unpacker.GetDouble("close_posi_value");
            info.target_posi_ratio = unpacker.GetDouble("target_posi_ratio");
            info.beta_coeffi = unpacker.GetDouble("beta_coeffi");
            info.custom_pd_class = unpacker.GetStr("custom_pd_class");
            info.pd_status = unpacker.GetStr("pd_status");
            info.index_value = unpacker.GetInt("index_value");
            info.remark_info = unpacker.GetStr("remark_info");
            prodL_5_4_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_5_4_InfoList.Add((prodL_5_4_Info)info);
        }
        #endregion

        //逻辑_产品_账户运维_查询产品信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new prodL_5_4_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    info.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    info.pd_flname = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_FLNAME_STR);
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
                    info.cost_calc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COST_CALC_TYPE_INT);
                    info.allow_exch = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_EXCH_STR);
                    info.allow_stock_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_STOCK_TYPE_STR);
                    info.busi_config_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_CONFIG_STR_STR);
                    info.comm_appr_oper = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_OPER_INT);
                    info.market_price_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_PRICE_RATIO_FLOAT);
                    info.forbid_order_dir = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FORBID_ORDER_DIR_STR);
                    info.warn_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WARN_POSI_VALUE_FLOAT);
                    info.close_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_VALUE_FLOAT);
                    info.target_posi_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_POSI_RATIO_FLOAT);
                    info.beta_coeffi = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BETA_COEFFI_FLOAT);
                    info.custom_pd_class = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CUSTOM_PD_CLASS_STR);
                    info.pd_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_STATUS_STR);
                    info.index_value = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDEX_VALUE_INT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    prodL_5_4_InfoList.Add(info);
                }
            }
        }
    }

    public class prodL_5_5_Response : IResponse
    {
        #region 构造函数
        public prodL_5_5_Response()
        {
            this.prodL_5_5_InfoList = new ObservableCollection<prodL_5_5_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_5_5_Info> prodL_5_5_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_5_5_Info info = new prodL_5_5_Info();
            prodL_5_5_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_5_5_InfoList.Add((prodL_5_5_Info)info);
        }
        #endregion

        //逻辑_产品_账户运维_修改产品业务控制配置串
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new prodL_5_5_Info();
                prodL_5_5_InfoList.Add(info);
            }
        }
    }

    public class prodL_5_6_Response : IResponse
    {
        #region 构造函数
        public prodL_5_6_Response()
        {
            this.prodL_5_6_InfoList = new ObservableCollection<prodL_5_6_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_5_6_Info> prodL_5_6_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_5_6_Info info = new prodL_5_6_Info();
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
            prodL_5_6_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_5_6_InfoList.Add((prodL_5_6_Info)info);
        }
        #endregion

        //逻辑_产品_账户运维_查询资产账户信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new prodL_5_6_Info();
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
                    prodL_5_6_InfoList.Add(info);
                }
            }
        }
    }

    public class prodL_5_7_Response : IResponse
    {
        #region 构造函数
        public prodL_5_7_Response()
        {
            this.prodL_5_7_InfoList = new ObservableCollection<prodL_5_7_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_5_7_Info> prodL_5_7_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_5_7_Info info = new prodL_5_7_Info();
            prodL_5_7_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_5_7_InfoList.Add((prodL_5_7_Info)info);
        }
        #endregion

        //逻辑_产品_账户运维_修改资产账户业务控制配置串
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new prodL_5_7_Info();
                prodL_5_7_InfoList.Add(info);
            }
        }
    }

    public class prodL_5_8_Response : IResponse
    {
        #region 构造函数
        public prodL_5_8_Response()
        {
            this.prodL_5_8_InfoList = new ObservableCollection<prodL_5_8_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_5_8_Info> prodL_5_8_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_5_8_Info info = new prodL_5_8_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.asset_acco = unpacker.GetStr("asset_acco");
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.online_status = unpacker.GetInt("online_status");
            prodL_5_8_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_5_8_InfoList.Add((prodL_5_8_Info)info);
        }
        #endregion

        //逻辑_产品_账户运维_查询证券同步所需资产账户信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new prodL_5_8_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.asset_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STR);
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    info.online_status = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ONLINE_STATUS_INT);
                    prodL_5_8_InfoList.Add(info);
                }
            }
        }
    }

    public class prodL_5_11_Response : IResponse
    {
        #region 构造函数
        public prodL_5_11_Response()
        {
            this.prodL_5_11_InfoList = new ObservableCollection<prodL_5_11_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_5_11_Info> prodL_5_11_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_5_11_Info info = new prodL_5_11_Info();
            prodL_5_11_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_5_11_InfoList.Add((prodL_5_11_Info)info);
        }
        #endregion

        //逻辑_产品_账户运维_归档产品数据
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new prodL_5_11_Info();
                prodL_5_11_InfoList.Add(info);
            }
        }
    }

    public class prodL_5_21_Response : IResponse
    {
        #region 构造函数
        public prodL_5_21_Response()
        {
            this.prodL_5_21_InfoList = new ObservableCollection<prodL_5_21_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_5_21_Info> prodL_5_21_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_5_21_Info info = new prodL_5_21_Info();
            prodL_5_21_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_5_21_InfoList.Add((prodL_5_21_Info)info);
        }
        #endregion

        //逻辑_产品_账户运维_更新产品估值资产
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new prodL_5_21_Info();
                prodL_5_21_InfoList.Add(info);
            }
        }
    }

    public class prodL_5_71_Response : IResponse
    {
        #region 构造函数
        public prodL_5_71_Response()
        {
            this.prodL_5_71_InfoList = new ObservableCollection<prodL_5_71_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_5_71_Info> prodL_5_71_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_5_71_Info info = new prodL_5_71_Info();
            prodL_5_71_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_5_71_InfoList.Add((prodL_5_71_Info)info);
        }
        #endregion

        //逻辑_产品_账户运维_设置资产账户通道信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new prodL_5_71_Info();
                prodL_5_71_InfoList.Add(info);
            }
        }
    }

    public class prodL_5_74_Response : IResponse
    {
        #region 构造函数
        public prodL_5_74_Response()
        {
            this.prodL_5_74_InfoList = new ObservableCollection<prodL_5_74_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_5_74_Info> prodL_5_74_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_5_74_Info info = new prodL_5_74_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.update_date = unpacker.GetInt("update_date");
            info.update_time = unpacker.GetInt("update_time");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.pass_type = unpacker.GetInt("pass_type");
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.online_status = unpacker.GetInt("online_status");
            info.config_str = unpacker.GetStr("config_str");
            info.read_flag = unpacker.GetInt("read_flag");
            info.remark_info = unpacker.GetStr("remark_info");
            prodL_5_74_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_5_74_InfoList.Add((prodL_5_74_Info)info);
        }
        #endregion

        //逻辑_产品_账户运维_查询全部资产账户通道信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new prodL_5_74_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    info.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.pass_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_TYPE_INT);
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    info.online_status = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ONLINE_STATUS_INT);
                    info.config_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_STR_STR);
                    info.read_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_READ_FLAG_INT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    prodL_5_74_InfoList.Add(info);
                }
            }
        }
    }

    public class prodL_5_75_Response : IResponse
    {
        #region 构造函数
        public prodL_5_75_Response()
        {
            this.prodL_5_75_InfoList = new ObservableCollection<prodL_5_75_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_5_75_Info> prodL_5_75_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_5_75_Info info = new prodL_5_75_Info();
            prodL_5_75_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_5_75_InfoList.Add((prodL_5_75_Info)info);
        }
        #endregion

        //逻辑_产品_账户运维_更新资产账户状态
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new prodL_5_75_Info();
                prodL_5_75_InfoList.Add(info);
            }
        }
    }

    public class prodL_5_76_Response : IResponse
    {
        #region 构造函数
        public prodL_5_76_Response()
        {
            this.prodL_5_76_InfoList = new ObservableCollection<prodL_5_76_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_5_76_Info> prodL_5_76_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_5_76_Info info = new prodL_5_76_Info();
            info.pd_no = unpacker.GetInt("pd_no");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_code = unpacker.GetStr("pd_code");
            info.pd_name = unpacker.GetStr("pd_name");
            info.pd_status = unpacker.GetStr("pd_status");
            prodL_5_76_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_5_76_InfoList.Add((prodL_5_76_Info)info);
        }
        #endregion

        //逻辑_产品_账户运维_查询符合资产帐户类型的产品
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new prodL_5_76_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    info.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    info.pd_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_STATUS_STR);
                    prodL_5_76_InfoList.Add(info);
                }
            }
        }
    }

    public class prodL_5_77_Response : IResponse
    {
        #region 构造函数
        public prodL_5_77_Response()
        {
            this.prodL_5_77_InfoList = new ObservableCollection<prodL_5_77_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_5_77_Info> prodL_5_77_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_5_77_Info info = new prodL_5_77_Info();
            info.mac_addr = unpacker.GetStr("mac_addr");
            info.offer_name = unpacker.GetStr("offer_name");
            info.pass_no = unpacker.GetInt("pass_no");
            info.offer_server_name = unpacker.GetStr("offer_server_name");
            info.offer_server_ip = unpacker.GetStr("offer_server_ip");
            info.software_start_time = unpacker.GetInt("software_start_time");
            info.pass_status = unpacker.GetStr("pass_status");
            info.bkup_field_1 = unpacker.GetStr("bkup_field_1");
            info.bkup_field_2 = unpacker.GetInt("bkup_field_2");
            info.bkup_field_3 = unpacker.GetDouble("bkup_field_3");
            prodL_5_77_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_5_77_InfoList.Add((prodL_5_77_Info)info);
        }
        #endregion

        //逻辑_产品_账户运维_查询报盘回写通道信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new prodL_5_77_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.mac_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MAC_ADDR_STR);
                    info.offer_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OFFER_NAME_STR);
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.offer_server_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OFFER_SERVER_NAME_STR);
                    info.offer_server_ip = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OFFER_SERVER_IP_STR);
                    info.software_start_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SOFTWARE_START_TIME_INT);
                    info.pass_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PASS_STATUS_STR);
                    info.bkup_field_1 = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BKUP_FIELD_1_STR);
                    info.bkup_field_2 = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BKUP_FIELD_2_INT);
                    info.bkup_field_3 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BKUP_FIELD_3_FLOAT);
                    prodL_5_77_InfoList.Add(info);
                }
            }
        }
    }

    public class prodL_5_78_Response : IResponse
    {
        #region 构造函数
        public prodL_5_78_Response()
        {
            this.prodL_5_78_InfoList = new ObservableCollection<prodL_5_78_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_5_78_Info> prodL_5_78_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_5_78_Info info = new prodL_5_78_Info();
            prodL_5_78_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_5_78_InfoList.Add((prodL_5_78_Info)info);
        }
        #endregion

        //逻辑_产品_账户运维_冻结产品
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new prodL_5_78_Info();
                prodL_5_78_InfoList.Add(info);
            }
        }
    }

    public class prodL_5_79_Response : IResponse
    {
        #region 构造函数
        public prodL_5_79_Response()
        {
            this.prodL_5_79_InfoList = new ObservableCollection<prodL_5_79_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_5_79_Info> prodL_5_79_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_5_79_Info info = new prodL_5_79_Info();
            prodL_5_79_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_5_79_InfoList.Add((prodL_5_79_Info)info);
        }
        #endregion

        //逻辑_产品_账户运维_修改产品限制信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new prodL_5_79_Info();
                prodL_5_79_InfoList.Add(info);
            }
        }
    }

    public class prodL_5_80_Response : IResponse
    {
        #region 构造函数
        public prodL_5_80_Response()
        {
            this.prodL_5_80_InfoList = new ObservableCollection<prodL_5_80_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_5_80_Info> prodL_5_80_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_5_80_Info info = new prodL_5_80_Info();
            prodL_5_80_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_5_80_InfoList.Add((prodL_5_80_Info)info);
        }
        #endregion

        //逻辑_产品_账户运维_恢复产品
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new prodL_5_80_Info();
                prodL_5_80_InfoList.Add(info);
            }
        }
    }

    public class prodL_5_81_Response : IResponse
    {
        #region 构造函数
        public prodL_5_81_Response()
        {
            this.prodL_5_81_InfoList = new ObservableCollection<prodL_5_81_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_5_81_Info> prodL_5_81_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_5_81_Info info = new prodL_5_81_Info();
            prodL_5_81_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_5_81_InfoList.Add((prodL_5_81_Info)info);
        }
        #endregion

        //逻辑_产品_账户运维_修改产品禁止订单方向
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new prodL_5_81_Info();
                prodL_5_81_InfoList.Add(info);
            }
        }
    }

    public class prodL_5_82_Response : IResponse
    {
        #region 构造函数
        public prodL_5_82_Response()
        {
            this.prodL_5_82_InfoList = new ObservableCollection<prodL_5_82_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_5_82_Info> prodL_5_82_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_5_82_Info info = new prodL_5_82_Info();
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
            prodL_5_82_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_5_82_InfoList.Add((prodL_5_82_Info)info);
        }
        #endregion

        //逻辑_产品_账户运维_查询产品限制信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new prodL_5_82_Info();
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
                    prodL_5_82_InfoList.Add(info);
                }
            }
        }
    }

    public class prodL_5_83_Response : IResponse
    {
        #region 构造函数
        public prodL_5_83_Response()
        {
            this.prodL_5_83_InfoList = new ObservableCollection<prodL_5_83_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_5_83_Info> prodL_5_83_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_5_83_Info info = new prodL_5_83_Info();
            info.pd_no = unpacker.GetInt("pd_no");
            prodL_5_83_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_5_83_InfoList.Add((prodL_5_83_Info)info);
        }
        #endregion

        //逻辑_产品_账户运维_新增产品信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new prodL_5_83_Info();
                info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                prodL_5_83_InfoList.Add(info);
            }
        }
    }

    public class prodL_5_84_Response : IResponse
    {
        #region 构造函数
        public prodL_5_84_Response()
        {
            this.prodL_5_84_InfoList = new ObservableCollection<prodL_5_84_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_5_84_Info> prodL_5_84_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_5_84_Info info = new prodL_5_84_Info();
            info.pd_no = unpacker.GetInt("pd_no");
            prodL_5_84_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_5_84_InfoList.Add((prodL_5_84_Info)info);
        }
        #endregion

        //逻辑_产品_账户运维_导入产品信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new prodL_5_84_Info();
                info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                prodL_5_84_InfoList.Add(info);
            }
        }
    }

    public class prodL_5_85_Response : IResponse
    {
        #region 构造函数
        public prodL_5_85_Response()
        {
            this.prodL_5_85_InfoList = new ObservableCollection<prodL_5_85_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_5_85_Info> prodL_5_85_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_5_85_Info info = new prodL_5_85_Info();
            prodL_5_85_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_5_85_InfoList.Add((prodL_5_85_Info)info);
        }
        #endregion

        //逻辑_产品_账户运维_修改机构产品业务控制配置串
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new prodL_5_85_Info();
                prodL_5_85_InfoList.Add(info);
            }
        }
    }

    public class prodL_5_86_Response : IResponse
    {
        #region 构造函数
        public prodL_5_86_Response()
        {
            this.prodL_5_86_InfoList = new ObservableCollection<prodL_5_86_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_5_86_Info> prodL_5_86_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_5_86_Info info = new prodL_5_86_Info();
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            prodL_5_86_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_5_86_InfoList.Add((prodL_5_86_Info)info);
        }
        #endregion

        //逻辑_产品_账户运维_新增资产账户信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new prodL_5_86_Info();
                info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                prodL_5_86_InfoList.Add(info);
            }
        }
    }

    public class prodL_5_87_Response : IResponse
    {
        #region 构造函数
        public prodL_5_87_Response()
        {
            this.prodL_5_87_InfoList = new ObservableCollection<prodL_5_87_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_5_87_Info> prodL_5_87_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_5_87_Info info = new prodL_5_87_Info();
            prodL_5_87_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_5_87_InfoList.Add((prodL_5_87_Info)info);
        }
        #endregion

        //逻辑_产品_账户运维_设置资产账户通道表已读标记
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new prodL_5_87_Info();
                prodL_5_87_InfoList.Add(info);
            }
        }
    }

    public class prodL_5_88_Response : IResponse
    {
        #region 构造函数
        public prodL_5_88_Response()
        {
            this.prodL_5_88_InfoList = new ObservableCollection<prodL_5_88_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_5_88_Info> prodL_5_88_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_5_88_Info info = new prodL_5_88_Info();
            prodL_5_88_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_5_88_InfoList.Add((prodL_5_88_Info)info);
        }
        #endregion

        //逻辑_产品_账户运维_修改产品信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new prodL_5_88_Info();
                prodL_5_88_InfoList.Add(info);
            }
        }
    }

    public class prodL_5_89_Response : IResponse
    {
        #region 构造函数
        public prodL_5_89_Response()
        {
            this.prodL_5_89_InfoList = new ObservableCollection<prodL_5_89_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_5_89_Info> prodL_5_89_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_5_89_Info info = new prodL_5_89_Info();
            prodL_5_89_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_5_89_InfoList.Add((prodL_5_89_Info)info);
        }
        #endregion

        //逻辑_产品_账户运维_修改产品索引值
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new prodL_5_89_Info();
                prodL_5_89_InfoList.Add(info);
            }
        }
    }

    public class prodL_5_90_Response : IResponse
    {
        #region 构造函数
        public prodL_5_90_Response()
        {
            this.prodL_5_90_InfoList = new ObservableCollection<prodL_5_90_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_5_90_Info> prodL_5_90_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_5_90_Info info = new prodL_5_90_Info();
            prodL_5_90_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_5_90_InfoList.Add((prodL_5_90_Info)info);
        }
        #endregion

        //逻辑_产品_账户运维_冻结资产账户
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new prodL_5_90_Info();
                prodL_5_90_InfoList.Add(info);
            }
        }
    }

    public class prodL_5_91_Response : IResponse
    {
        #region 构造函数
        public prodL_5_91_Response()
        {
            this.prodL_5_91_InfoList = new ObservableCollection<prodL_5_91_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_5_91_Info> prodL_5_91_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_5_91_Info info = new prodL_5_91_Info();
            prodL_5_91_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_5_91_InfoList.Add((prodL_5_91_Info)info);
        }
        #endregion

        //逻辑_产品_账户运维_恢复资产账户
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new prodL_5_91_Info();
                prodL_5_91_InfoList.Add(info);
            }
        }
    }

    public class prodL_5_92_Response : IResponse
    {
        #region 构造函数
        public prodL_5_92_Response()
        {
            this.prodL_5_92_InfoList = new ObservableCollection<prodL_5_92_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_5_92_Info> prodL_5_92_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_5_92_Info info = new prodL_5_92_Info();
            prodL_5_92_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_5_92_InfoList.Add((prodL_5_92_Info)info);
        }
        #endregion

        //逻辑_产品_账户运维_注销产品
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new prodL_5_92_Info();
                prodL_5_92_InfoList.Add(info);
            }
        }
    }

    public class prodL_5_93_Response : IResponse
    {
        #region 构造函数
        public prodL_5_93_Response()
        {
            this.prodL_5_93_InfoList = new ObservableCollection<prodL_5_93_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_5_93_Info> prodL_5_93_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_5_93_Info info = new prodL_5_93_Info();
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
            prodL_5_93_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_5_93_InfoList.Add((prodL_5_93_Info)info);
        }
        #endregion

        //逻辑_产品_账户运维_查询所有产品信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new prodL_5_93_Info();
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
                    prodL_5_93_InfoList.Add(info);
                }
            }
        }
    }

    public class prodL_5_94_Response : IResponse
    {
        #region 构造函数
        public prodL_5_94_Response()
        {
            this.prodL_5_94_InfoList = new ObservableCollection<prodL_5_94_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<prodL_5_94_Info> prodL_5_94_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            prodL_5_94_Info info = new prodL_5_94_Info();
            prodL_5_94_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            prodL_5_94_InfoList.Add((prodL_5_94_Info)info);
        }
        #endregion

        //逻辑_产品_账户运维_修改资产账户信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new prodL_5_94_Info();
                prodL_5_94_InfoList.Add(info);
            }
        }
    }

}
